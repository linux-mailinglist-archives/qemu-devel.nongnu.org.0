Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53DD4E276D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:23:43 +0100 (CET)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWI0c-0006la-TD
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:23:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Lu.Gao@verisilicon.com>)
 id 1nWB8b-0004L2-On; Mon, 21 Mar 2022 02:03:29 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:17905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Lu.Gao@verisilicon.com>)
 id 1nWB8Y-0001ez-CV; Mon, 21 Mar 2022 02:03:29 -0400
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1647842241; h=from:subject:to:date:message-id;
 bh=+emZLlpOZ9+VPS4dqhgDvYfNvqC1InT6dkkwPAq+XvY=;
 b=Y0rOz/7vPjtSPRvvN+qyVkHM+BhkAOGelXyKduB+eQKWzX2IyDFG2bdCEIzSMPVaCMlUNRBQUUR
 F9pVIQ7MHnE/yrhvn9X9Td3CTnYiKN4GkcCOGslefYV388Cor+iAfeGNMmAjNUJlKvFrICm1AQNzU
 cKs9P+BABCQ+Rwrnqew=
Received: from coding0919.verisilicon.com (192.168.103.179) by
 SHASXM03.verisilicon.com (10.10.128.202) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 21 Mar 2022 13:57:20 +0800
From: Lu Gao <lu.gao@verisilicon.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] hw/sd/sdhci: Block Size Register bits [14:12] is lost
Date: Mon, 21 Mar 2022 13:56:18 +0800
Message-ID: <20220321055618.4026-1-lu.gao@verisilicon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [192.168.103.179]
X-TM-AS-Product-Ver: SMEX-11.0.0.4283-8.100.1062-25628.004
X-TM-AS-Result: No--5.239500-0.000000-31
X-TM-AS-MatchedID: 151186-704318-703880-700535-700598-703001-705244-703115-7
 04822-701510-705248-704240-702395-188019-704477-703968-702898-700946-703953
 -704959-702299-701812-703812-704990-702975-704849-704823-63-148004-148036-4
 2000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
Received-SPF: pass client-ip=101.89.135.44;
 envelope-from=Lu.Gao@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Mar 2022 09:18:17 -0400
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
Cc: Lu Gao <lu.gao@verisilicon.com>, Bin Meng <bin.meng@windriver.com>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:SD \(Secure Card\)" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Block Size Register bits [14:12] is SDMA Buffer Boundary, it is missed
in register write, but it is needed in SDMA transfer. e.g. it will be
used in sdhci_sdma_transfer_multi_blocks to calculate boundary_ variables.

Missing this field will cause wrong operation for different SDMA Buffer
Boundary settings.

Signed-off-by: Lu Gao <lu.gao@verisilicon.com>
Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
---
 hw/sd/sdhci.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index e0bbc90344..350ceb487d 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -321,6 +321,8 @@ static void sdhci_poweron_reset(DeviceState *dev)
 
 static void sdhci_data_transfer(void *opaque);
 
+#define BLOCK_SIZE_MASK (4 * KiB - 1)
+
 static void sdhci_send_command(SDHCIState *s)
 {
     SDRequest request;
@@ -371,7 +373,8 @@ static void sdhci_send_command(SDHCIState *s)
 
     sdhci_update_irq(s);
 
-    if (!timeout && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
+    if (!timeout && (s->blksize & BLOCK_SIZE_MASK) &&
+        (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
         s->data_count = 0;
         sdhci_data_transfer(s);
     }
@@ -406,7 +409,6 @@ static void sdhci_end_transfer(SDHCIState *s)
 /*
  * Programmed i/o data transfer
  */
-#define BLOCK_SIZE_MASK (4 * KiB - 1)
 
 /* Fill host controller's read buffer with BLKSIZE bytes of data from card */
 static void sdhci_read_block_from_card(SDHCIState *s)
@@ -1137,7 +1139,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
             s->sdmasysad = (s->sdmasysad & mask) | value;
             MASKED_WRITE(s->sdmasysad, mask, value);
             /* Writing to last byte of sdmasysad might trigger transfer */
-            if (!(mask & 0xFF000000) && s->blkcnt && s->blksize &&
+            if (!(mask & 0xFF000000) && s->blkcnt &&
+                (s->blksize & BLOCK_SIZE_MASK) &&
                 SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
                 if (s->trnmod & SDHC_TRNS_MULTI) {
                     sdhci_sdma_transfer_multi_blocks(s);
@@ -1151,7 +1154,11 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         if (!TRANSFERRING_DATA(s->prnsts)) {
             uint16_t blksize = s->blksize;
 
-            MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
+            /*
+             * [14:12] SDMA Buffer Boundary
+             * [11:00] Transfer Block Size
+             */
+            MASKED_WRITE(s->blksize, mask, extract32(value, 0, 15));
             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
 
             /* Limit block size to the maximum buffer size */
-- 
2.17.1


