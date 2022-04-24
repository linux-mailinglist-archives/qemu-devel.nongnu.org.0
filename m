Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741D350D3CB
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 19:01:39 +0200 (CEST)
Received: from localhost ([::1]:37746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nifcA-0005uD-It
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 13:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifRC-0002Ji-NG; Sun, 24 Apr 2022 12:50:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifRB-00016P-7j; Sun, 24 Apr 2022 12:50:18 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifQH-000BIt-QP; Sun, 24 Apr 2022 17:49:22 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Sun, 24 Apr 2022 17:49:33 +0100
Message-Id: <20220424164935.7339-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 09/11] scsi-disk: allow MODE SELECT block descriptor to set
 the ROM device block size
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Whilst CDROM drives usually have a 2048 byte sector size, older drives have the
ability to switch between 2048 byte and 512 byte sector sizes by specifying a
block descriptor in the MODE SELECT command.

If a MODE SELECT block descriptor is provided, update the scsi-cd device block
size with the provided value accordingly.

This allows CDROMs to be used with A/UX whose driver only works with a 512 byte
sector size.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c  | 7 +++++++
 hw/scsi/trace-events | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 6991493cf4..41ebbe3045 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1583,6 +1583,13 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
         goto invalid_param;
     }
 
+    /* Allow changing the block size of ROM devices */
+    if (s->qdev.type == TYPE_ROM && bd_len &&
+        p[6] != (s->qdev.blocksize >> 8)) {
+            s->qdev.blocksize = p[6] << 8;
+            trace_scsi_disk_mode_select_rom_set_blocksize(s->qdev.blocksize);
+    }
+
     len -= bd_len;
     p += bd_len;
 
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 25eae9f307..1a021ddae9 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -340,6 +340,7 @@ scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(se
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
 scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) timeout=%u"
 scsi_disk_mode_select_page_truncated(int page, int len, int page_len) "page %d expected length %d but received length %d"
+scsi_disk_mode_select_rom_set_blocksize(int blocksize) "set ROM block size to %d"
 
 # scsi-generic.c
 scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command complete %p tag=0x%x status=%d"
-- 
2.20.1


