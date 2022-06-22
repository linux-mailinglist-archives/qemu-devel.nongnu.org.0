Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D7554209
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 07:11:17 +0200 (CEST)
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3se4-00021r-Jx
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 01:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1o3sbq-00019y-Ca; Wed, 22 Jun 2022 01:08:58 -0400
Received: from ozlabs.ru ([107.174.27.60]:60364)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1o3sbn-0002Fd-QS; Wed, 22 Jun 2022 01:08:57 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 0F85780521;
 Wed, 22 Jun 2022 01:08:47 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH qemu v2] ppc: Define SETFIELD for the ppc target
Date: Wed, 22 Jun 2022 15:08:44 +1000
Message-Id: <20220622050844.1067391-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

It keeps repeating, move it to the header. This uses __builtin_ffsl() to
allow using the macros in #define.

This is not using the QEMU's FIELD macros as this would require changing
all such macros found in skiboot (the PPC PowerNV firmware).

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* preserved the comment about skiboot
* copied the actual macros from skiboot:
https://github.com/open-power/skiboot/blob/master/include/bitutils.h#L31
---
 include/hw/pci-host/pnv_phb3_regs.h | 16 ----------------
 target/ppc/cpu.h                    | 12 ++++++++++++
 hw/intc/pnv_xive.c                  | 20 --------------------
 hw/intc/pnv_xive2.c                 | 20 --------------------
 hw/pci-host/pnv_phb4.c              | 16 ----------------
 5 files changed, 12 insertions(+), 72 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb3_regs.h b/include/hw/pci-host/pnv_phb3_regs.h
index a174ef1f7045..38f8ce9d7406 100644
--- a/include/hw/pci-host/pnv_phb3_regs.h
+++ b/include/hw/pci-host/pnv_phb3_regs.h
@@ -12,22 +12,6 @@
 
 #include "qemu/host-utils.h"
 
-/*
- * QEMU version of the GETFIELD/SETFIELD macros
- *
- * These are common with the PnvXive model.
- */
-static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
-{
-    return (word & mask) >> ctz64(mask);
-}
-
-static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
-                                uint64_t value)
-{
-    return (word & ~mask) | ((value << ctz64(mask)) & mask);
-}
-
 /*
  * PBCQ XSCOM registers
  */
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6d78078f379d..e45cc7a8c115 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -47,6 +47,18 @@
                                  PPC_BIT32(bs))
 #define PPC_BITMASK8(bs, be)    ((PPC_BIT8(bs) - PPC_BIT8(be)) | PPC_BIT8(bs))
 
+/*
+ * QEMU version of the GETFIELD/SETFIELD macros
+ *
+ * It might be better to use the existing extract64() and
+ * deposit64() but this means that all the register definitions will
+ * change and become incompatible with the ones found in skiboot.
+ */
+#define MASK_TO_LSH(m)          (__builtin_ffsl(m) - 1)
+#define GETFIELD(m, v)          (((v) & (m)) >> MASK_TO_LSH(m))
+#define SETFIELD(m, v, val) \
+        (((v) & ~(m)) | ((((typeof(v))(val)) << MASK_TO_LSH(m)) & (m)))
+
 /*****************************************************************************/
 /* Exception vectors definitions                                             */
 enum {
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 1ce1d7b07d63..c7b75ed12ee0 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -66,26 +66,6 @@ static const XiveVstInfo vst_infos[] = {
     qemu_log_mask(LOG_GUEST_ERROR, "XIVE[%x] - " fmt "\n",              \
                   (xive)->chip->chip_id, ## __VA_ARGS__);
 
-/*
- * QEMU version of the GETFIELD/SETFIELD macros
- *
- * TODO: It might be better to use the existing extract64() and
- * deposit64() but this means that all the register definitions will
- * change and become incompatible with the ones found in skiboot.
- *
- * Keep it as it is for now until we find a common ground.
- */
-static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
-{
-    return (word & mask) >> ctz64(mask);
-}
-
-static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
-                                uint64_t value)
-{
-    return (word & ~mask) | ((value << ctz64(mask)) & mask);
-}
-
 /*
  * When PC_TCTXT_CHIPID_OVERRIDE is configured, the PC_TCTXT_CHIPID
  * field overrides the hardwired chip ID in the Powerbus operations
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index f31c53c28dd2..f22ce5ca59ae 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -75,26 +75,6 @@ static const XiveVstInfo vst_infos[] = {
     qemu_log_mask(LOG_GUEST_ERROR, "XIVE[%x] - " fmt "\n",              \
                   (xive)->chip->chip_id, ## __VA_ARGS__);
 
-/*
- * QEMU version of the GETFIELD/SETFIELD macros
- *
- * TODO: It might be better to use the existing extract64() and
- * deposit64() but this means that all the register definitions will
- * change and become incompatible with the ones found in skiboot.
- *
- * Keep it as it is for now until we find a common ground.
- */
-static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
-{
-    return (word & mask) >> ctz64(mask);
-}
-
-static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
-                                uint64_t value)
-{
-    return (word & ~mask) | ((value << ctz64(mask)) & mask);
-}
-
 /*
  * TODO: Document block id override
  */
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 6594016121a3..5d72c0c432b2 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -31,22 +31,6 @@
     qemu_log_mask(LOG_GUEST_ERROR, "phb4_pec[%d:%d]: " fmt "\n",        \
                   (pec)->chip_id, (pec)->index, ## __VA_ARGS__)
 
-/*
- * QEMU version of the GETFIELD/SETFIELD macros
- *
- * These are common with the PnvXive model.
- */
-static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
-{
-    return (word & mask) >> ctz64(mask);
-}
-
-static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
-                                uint64_t value)
-{
-    return (word & ~mask) | ((value << ctz64(mask)) & mask);
-}
-
 static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB4 *phb)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(phb);
-- 
2.30.2


