Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA92153C071
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:41:55 +0200 (CEST)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsZn-0001t0-02
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nwsXU-0008Ib-G6; Thu, 02 Jun 2022 17:39:32 -0400
Received: from mout-u-107.mailbox.org ([2001:67c:2050:101:465::107]:35908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nwsXS-00070y-Hi; Thu, 02 Jun 2022 17:39:32 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4LDfYC1S9Wz9sSr;
 Thu,  2 Jun 2022 23:39:27 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH 1/1] hw/ide/core: Accumulate PIO output within io_buffer prior
 to pwritev
Date: Thu,  2 Jun 2022 21:39:04 +0000
Message-Id: <20220602213904.19533-2-lkujaw@member.fsf.org>
In-Reply-To: <20220602213904.19533-1-lkujaw@member.fsf.org>
References: <20220602213904.19533-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2050:101:465::107;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-107.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Delay writing PIO output until io_buffer is filled or ATA command
completion, rather than when interrupts are generated.  As an example
of the new behavior, issuing WRITE SECTOR(S) with a sector count of
256 will result in only a single call to blk_aio_pwritev rather than
after each of the 256 sectors are transferred.  Up to a 50% increase
in PIO throughput can be achieved thanks to the reduction in system
call overhead and writing larger blocks (up to 128 KiB, with the size
limited by IDE_DMA_BUF_SECTORS).

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/ide/core.c             | 62 ++++++++++++++++++++++++---------------
 include/hw/ide/internal.h |  1 +
 2 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 5a24547e49..b178584bc3 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1025,23 +1025,20 @@ static void ide_sector_write_cb(void *opaque, int ret)
 
     block_acct_done(blk_get_stats(s->blk), &s->acct);
 
-    n = s->nsector;
-    if (n > s->req_nb_sectors) {
-        n = s->req_nb_sectors;
-    }
-    s->nsector -= n;
-
+    n = (s->data_end - s->io_buffer) >> BDRV_SECTOR_BITS;
     ide_set_sector(s, ide_get_sector(s) + n);
+    n %= s->req_nb_sectors;
+    s->nsector -= n ? n : s->req_nb_sectors;
+
     if (s->nsector == 0) {
         /* no more sectors to write */
         ide_transfer_stop(s);
     } else {
-        int n1 = s->nsector;
-        if (n1 > s->req_nb_sectors) {
-            n1 = s->req_nb_sectors;
-        }
-        ide_transfer_start(s, s->io_buffer, n1 * BDRV_SECTOR_SIZE,
-                           ide_sector_write);
+        const int n1 =
+            (MIN(IDE_DMA_BUF_SECTORS, s->nsector)) << BDRV_SECTOR_BITS;
+        s->octets_until_irq =
+            (MIN(s->nsector, s->req_nb_sectors)) << BDRV_SECTOR_BITS;
+        ide_transfer_start(s, s->io_buffer, n1, ide_sector_write);
     }
 
     if (win2k_install_hack && ((++s->irq_count % 16) == 0)) {
@@ -1063,14 +1060,21 @@ static void ide_sector_write(IDEState *s)
     int64_t sector_num;
     int n;
 
-    s->status = READY_STAT | SEEK_STAT | BUSY_STAT;
-    sector_num = ide_get_sector(s);
+    assert(s->octets_until_irq == 0);
 
-    n = s->nsector;
-    if (n > s->req_nb_sectors) {
-        n = s->req_nb_sectors;
+    if (s->data_ptr < s->data_end) {
+        s->nsector -= s->req_nb_sectors;
+        s->octets_until_irq =
+            (MIN(s->nsector, s->req_nb_sectors)) << BDRV_SECTOR_BITS;
+        s->status = READY_STAT | SEEK_STAT | DRQ_STAT;
+        ide_set_irq(s->bus);
+        return;
     }
 
+    s->status = READY_STAT | SEEK_STAT | BUSY_STAT;
+    sector_num = ide_get_sector(s);
+    n = (s->data_end - s->io_buffer) >> BDRV_SECTOR_BITS;
+
     trace_ide_sector_write(sector_num, n);
 
     if (!ide_sect_range_ok(s, sector_num, n)) {
@@ -1378,6 +1382,7 @@ static void ide_reset(IDEState *s)
     /* ATA DMA state */
     s->io_buffer_size = 0;
     s->req_nb_sectors = 0;
+    s->octets_until_irq = 0;
 
     ide_set_signature(s);
     /* init the transfer handler so that 0xffff is returned on data
@@ -1500,10 +1505,11 @@ static bool cmd_write_multiple(IDEState *s, uint8_t cmd)
     ide_cmd_lba48_transform(s, lba48);
 
     s->req_nb_sectors = s->mult_sectors;
-    n = MIN(s->nsector, s->req_nb_sectors);
-
+    n = (MIN(IDE_DMA_BUF_SECTORS, s->nsector)) << BDRV_SECTOR_BITS;
+    s->octets_until_irq =
+        (MIN(s->nsector, s->req_nb_sectors)) << BDRV_SECTOR_BITS;
     s->status = SEEK_STAT | READY_STAT;
-    ide_transfer_start(s, s->io_buffer, 512 * n, ide_sector_write);
+    ide_transfer_start(s, s->io_buffer, n, ide_sector_write);
 
     s->media_changed = 1;
 
@@ -1535,6 +1541,7 @@ static bool cmd_read_pio(IDEState *s, uint8_t cmd)
 static bool cmd_write_pio(IDEState *s, uint8_t cmd)
 {
     bool lba48 = (cmd == WIN_WRITE_EXT);
+    int n;
 
     if (!s->blk) {
         ide_abort_command(s);
@@ -1544,8 +1551,10 @@ static bool cmd_write_pio(IDEState *s, uint8_t cmd)
     ide_cmd_lba48_transform(s, lba48);
 
     s->req_nb_sectors = 1;
+    n = (MIN(IDE_DMA_BUF_SECTORS, s->nsector)) << BDRV_SECTOR_BITS;
+    s->octets_until_irq = BDRV_SECTOR_SIZE;
     s->status = SEEK_STAT | READY_STAT;
-    ide_transfer_start(s, s->io_buffer, 512, ide_sector_write);
+    ide_transfer_start(s, s->io_buffer, n, ide_sector_write);
 
     s->media_changed = 1;
 
@@ -1699,7 +1708,7 @@ static bool cmd_identify_packet(IDEState *s, uint8_t cmd)
 {
     ide_atapi_identify(s);
     s->status = READY_STAT | SEEK_STAT;
-    ide_transfer_start(s, s->io_buffer, 512, ide_transfer_stop);
+    ide_transfer_start(s, s->io_buffer, BDRV_SECTOR_SIZE, ide_transfer_stop);
     ide_set_irq(s->bus);
     return false;
 }
@@ -1745,6 +1754,7 @@ static bool cmd_packet(IDEState *s, uint8_t cmd)
         s->dma_cmd = IDE_DMA_ATAPI;
     }
     s->nsector = 1;
+    s->octets_until_irq = ATAPI_PACKET_SIZE;
     ide_transfer_start(s, s->io_buffer, ATAPI_PACKET_SIZE,
                        ide_atapi_cmd);
     return false;
@@ -2358,7 +2368,9 @@ void ide_data_writew(void *opaque, uint32_t addr, uint32_t val)
     *(uint16_t *)p = le16_to_cpu(val);
     p += 2;
     s->data_ptr = p;
-    if (p >= s->data_end) {
+    s->octets_until_irq -= 2;
+
+    if (s->octets_until_irq == 0) {
         s->status &= ~DRQ_STAT;
         s->end_transfer_func(s);
     }
@@ -2416,7 +2428,9 @@ void ide_data_writel(void *opaque, uint32_t addr, uint32_t val)
     *(uint32_t *)p = le32_to_cpu(val);
     p += 4;
     s->data_ptr = p;
-    if (p >= s->data_end) {
+    s->octets_until_irq -= 4;
+
+    if (s->octets_until_irq == 0) {
         s->status &= ~DRQ_STAT;
         s->end_transfer_func(s);
     }
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 97e7e59dc5..3f79fbaf32 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -428,6 +428,7 @@ struct IDEState {
     QEMUSGList sg;
     /* PIO transfer handling */
     int req_nb_sectors; /* number of sectors per interrupt */
+    int octets_until_irq;
     EndTransferFunc *end_transfer_func;
     uint8_t *data_ptr;
     uint8_t *data_end;
-- 
2.34.1


