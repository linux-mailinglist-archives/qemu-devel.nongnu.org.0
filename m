Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796036AFB2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 10:24:05 +0200 (CEST)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lawXD-0001yM-Tn
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 04:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rka@sysgo.com>) id 1lawVs-0001CN-FC
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 04:22:40 -0400
Received: from mail.sysgo.com ([176.9.12.79]:43488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rka@sysgo.com>) id 1lawVq-000103-8K
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 04:22:39 -0400
From: Roman Kapl <rka@sysgo.com>
To: 
Subject: [PATCH 1/1] amd_iommu: fix wrong MMIO operations
Date: Mon, 26 Apr 2021 10:21:54 +0200
Message-Id: <20210426082154.19734-1-rka@sysgo.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=176.9.12.79; envelope-from=rka@sysgo.com;
 helo=mail.sysgo.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TO_EQ_FM_DIRECT_MX=0.223 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Roman Kapl <rka@sysgo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Address was swapped with value when writing MMIO registers, so the user
saw garbage in lot of cases. The interrupt status was not correctly set.

Signed-off-by: Roman Kapl <rka@sysgo.com>
---
 hw/i386/amd_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 74a93a5d93..bb5ce8c04d 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -141,13 +141,13 @@ static bool amdvi_test_mask(AMDVIState *s, hwaddr addr, uint64_t val)
 /* OR a 64-bit register with a 64-bit value storing result in the register */
 static void amdvi_assign_orq(AMDVIState *s, hwaddr addr, uint64_t val)
 {
-    amdvi_writeq_raw(s, addr, amdvi_readq(s, addr) | val);
+    amdvi_writeq_raw(s, amdvi_readq(s, addr) | val, addr);
 }
 
 /* AND a 64-bit register with a 64-bit value storing result in the register */
 static void amdvi_assign_andq(AMDVIState *s, hwaddr addr, uint64_t val)
 {
-   amdvi_writeq_raw(s, addr, amdvi_readq(s, addr) & val);
+   amdvi_writeq_raw(s, amdvi_readq(s, addr) & val, addr);
 }
 
 static void amdvi_generate_msi_interrupt(AMDVIState *s)
@@ -382,7 +382,7 @@ static void amdvi_completion_wait(AMDVIState *s, uint64_t *cmd)
     }
     /* set completion interrupt */
     if (extract64(cmd[0], 1, 1)) {
-        amdvi_test_mask(s, AMDVI_MMIO_STATUS, AMDVI_MMIO_STATUS_COMP_INT);
+        amdvi_assign_orq(s, AMDVI_MMIO_STATUS, AMDVI_MMIO_STATUS_COMP_INT);
         /* generate interrupt */
         amdvi_generate_msi_interrupt(s);
     }
-- 
2.20.1


