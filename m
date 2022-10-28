Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5159D611602
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 17:35:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooROO-0007ql-LN; Fri, 28 Oct 2022 11:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ooROJ-0007nt-Fj
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:35:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ooROH-000192-N4
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666971324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qj8bRKaZuDAtvv39+zS/1lG63F4LiPgPvyQIhmOrGl0=;
 b=GnTCxynM+D9NX+KorgBZ4IpCOGTo5qOiDuUG3jJTFycHagxjI07Ec5Sna5pVLXtDVgx0B8
 wb97qe4gm8zRskYEvwZateMKSCW3xz2heF/6C1NwPqykL0Fcp23f5QGKPVQyxRSBO3zth1
 Fizw6N1MdNnjlnR2Lft6td75B9BsGLo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-78U549wvNA2tQX4KZKbc1g-1; Fri, 28 Oct 2022 11:35:21 -0400
X-MC-Unique: 78U549wvNA2tQX4KZKbc1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2BBA185A794;
 Fri, 28 Oct 2022 15:35:20 +0000 (UTC)
Received: from f36-work.redhat.com (unknown [10.39.192.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96B7E2024CB7;
 Fri, 28 Oct 2022 15:35:19 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: mcascell@redhat.com, coc.cyqh@gmail.com, philmd@linaro.org,
 bin.meng@windriver.com
Subject: [PATCH] hw/sd/sdhci: further prohibit DMA accesses to devices
Date: Fri, 28 Oct 2022 17:35:11 +0200
Message-Id: <20221028153511.932642-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit 799f7f01 left some DMA calls unprotected. Let's patch them.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
Reported-by: Siqi Chen <coc.cyqh@gmail.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
 hw/sd/sdhci.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 0e5e988927..c6ee24cde1 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -585,6 +585,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
     const uint16_t block_size = s->blksize & BLOCK_SIZE_MASK;
     uint32_t boundary_chk = 1 << (((s->blksize & ~BLOCK_SIZE_MASK) >> 12) + 12);
     uint32_t boundary_count = boundary_chk - (s->sdmasysad % boundary_chk);
+    const MemTxAttrs attrs = { .memory = true };
 
     if (!(s->trnmod & SDHC_TRNS_BLK_CNT_EN) || !s->blkcnt) {
         qemu_log_mask(LOG_UNIMP, "infinite transfer is not supported\n");
@@ -617,7 +618,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
                 }
             }
             dma_memory_write(s->dma_as, s->sdmasysad, &s->fifo_buffer[begin],
-                             s->data_count - begin, MEMTXATTRS_UNSPECIFIED);
+                             s->data_count - begin, attrs);
             s->sdmasysad += s->data_count - begin;
             if (s->data_count == block_size) {
                 s->data_count = 0;
@@ -638,7 +639,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
                 boundary_count -= block_size - begin;
             }
             dma_memory_read(s->dma_as, s->sdmasysad, &s->fifo_buffer[begin],
-                            s->data_count - begin, MEMTXATTRS_UNSPECIFIED);
+                            s->data_count - begin, attrs);
             s->sdmasysad += s->data_count - begin;
             if (s->data_count == block_size) {
                 sdbus_write_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -667,14 +668,15 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
 static void sdhci_sdma_transfer_single_block(SDHCIState *s)
 {
     uint32_t datacnt = s->blksize & BLOCK_SIZE_MASK;
+    const MemTxAttrs attrs = { .memory = true };
 
     if (s->trnmod & SDHC_TRNS_READ) {
         sdbus_read_data(&s->sdbus, s->fifo_buffer, datacnt);
         dma_memory_write(s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt,
-                         MEMTXATTRS_UNSPECIFIED);
+                         attrs);
     } else {
         dma_memory_read(s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt,
-                        MEMTXATTRS_UNSPECIFIED);
+                        attrs);
         sdbus_write_data(&s->sdbus, s->fifo_buffer, datacnt);
     }
     s->blkcnt--;
@@ -693,11 +695,13 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
 {
     uint32_t adma1 = 0;
     uint64_t adma2 = 0;
+    const MemTxAttrs attrs = { .memory = true };
     hwaddr entry_addr = (hwaddr)s->admasysaddr;
+
     switch (SDHC_DMA_TYPE(s->hostctl1)) {
     case SDHC_CTRL_ADMA2_32:
         dma_memory_read(s->dma_as, entry_addr, &adma2, sizeof(adma2),
-                        MEMTXATTRS_UNSPECIFIED);
+                        attrs);
         adma2 = le64_to_cpu(adma2);
         /* The spec does not specify endianness of descriptor table.
          * We currently assume that it is LE.
@@ -709,7 +713,7 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
         break;
     case SDHC_CTRL_ADMA1_32:
         dma_memory_read(s->dma_as, entry_addr, &adma1, sizeof(adma1),
-                        MEMTXATTRS_UNSPECIFIED);
+                        attrs);
         adma1 = le32_to_cpu(adma1);
         dscr->addr = (hwaddr)(adma1 & 0xFFFFF000);
         dscr->attr = (uint8_t)extract32(adma1, 0, 7);
@@ -722,12 +726,12 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
         break;
     case SDHC_CTRL_ADMA2_64:
         dma_memory_read(s->dma_as, entry_addr, &dscr->attr, 1,
-                        MEMTXATTRS_UNSPECIFIED);
+                        attrs);
         dma_memory_read(s->dma_as, entry_addr + 2, &dscr->length, 2,
-                        MEMTXATTRS_UNSPECIFIED);
+                        attrs);
         dscr->length = le16_to_cpu(dscr->length);
         dma_memory_read(s->dma_as, entry_addr + 4, &dscr->addr, 8,
-                        MEMTXATTRS_UNSPECIFIED);
+                        attrs);
         dscr->addr = le64_to_cpu(dscr->addr);
         dscr->attr &= (uint8_t) ~0xC0;
         dscr->incr = 12;
-- 
2.37.3


