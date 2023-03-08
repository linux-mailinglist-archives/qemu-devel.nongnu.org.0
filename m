Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0B26B0FCD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:06:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZxDz-0003dS-P5; Wed, 08 Mar 2023 12:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZxDa-0003H9-HF; Wed, 08 Mar 2023 12:04:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZxDY-0005ZE-Ox; Wed, 08 Mar 2023 12:04:46 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 42573400C3;
 Wed,  8 Mar 2023 19:58:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id D02AC13A;
 Wed,  8 Mar 2023 19:58:17 +0300 (MSK)
Received: (nullmailer pid 2098270 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Guenter Roeck <linux@roeck-us.net>, Keith Busch <kbusch@kernel.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 09/47] hw/nvme: fix missing endian conversions for doorbell
 buffers
Date: Wed,  8 Mar 2023 19:57:12 +0300
Message-Id: <20230308165815.2098148-9-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

The eventidx and doorbell value are not handling endianness correctly.
Fix this.

Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
Cc: qemu-stable@nongnu.org
Reported-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
(cherry picked from commit 2fda0726e5149e032acfa5fe442db56cd6433c4c)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Conflicts: hw/nvme/ctrl.c
---
 hw/nvme/ctrl.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ac3885ce50..83f5e58e8d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1333,8 +1333,12 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
 
 static void nvme_update_cq_head(NvmeCQueue *cq)
 {
-    pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
-            sizeof(cq->head));
+    uint32_t v;
+
+    pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &v, sizeof(v));
+
+    cq->head = le32_to_cpu(v);
+
     trace_pci_nvme_shadow_doorbell_cq(cq->cqid, cq->head);
 }
 
@@ -6221,15 +6225,21 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
 {
-    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
-                  sizeof(sq->tail));
+    uint32_t v = cpu_to_le32(sq->tail);
+
+    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &v, sizeof(v));
+
     trace_pci_nvme_eventidx_sq(sq->sqid, sq->tail);
 }
 
 static void nvme_update_sq_tail(NvmeSQueue *sq)
 {
-    pci_dma_read(&sq->ctrl->parent_obj, sq->db_addr, &sq->tail,
-                 sizeof(sq->tail));
+    uint32_t v;
+
+    pci_dma_read(&sq->ctrl->parent_obj, sq->db_addr, &v, sizeof(v));
+
+    sq->tail = le32_to_cpu(v);
+
     trace_pci_nvme_shadow_doorbell_sq(sq->sqid, sq->tail);
 }
 
-- 
2.30.2


