Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2898954F0FD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 08:19:08 +0200 (CEST)
Received: from localhost ([::1]:60706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o25Jx-0005HV-Tr
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 02:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1o258g-0007na-0T; Fri, 17 Jun 2022 02:07:26 -0400
Received: from ozlabs.ru ([107.174.27.60]:36550)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1o258a-0001va-DY; Fri, 17 Jun 2022 02:07:25 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 6E91D806AF;
 Fri, 17 Jun 2022 02:07:15 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH qemu v2 1/2] ppc: Define SETFIELD for the ppc target
Date: Fri, 17 Jun 2022 16:07:02 +1000
Message-Id: <20220617060703.951747-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220617060703.951747-1-aik@ozlabs.ru>
References: <20220617060703.951747-1-aik@ozlabs.ru>
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

It keeps repeating, move it to the header. This uses __builtin_ctzl() to
allow using the macros in #define.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 include/hw/pci-host/pnv_phb3_regs.h | 16 ----------------
 target/ppc/cpu.h                    |  5 +++++
 hw/intc/pnv_xive.c                  | 20 --------------------
 hw/intc/pnv_xive2.c                 | 20 --------------------
 hw/pci-host/pnv_phb4.c              | 16 ----------------
 5 files changed, 5 insertions(+), 72 deletions(-)

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
index 6d78078f379d..9a1f1e9999a3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -47,6 +47,11 @@
                                  PPC_BIT32(bs))
 #define PPC_BITMASK8(bs, be)    ((PPC_BIT8(bs) - PPC_BIT8(be)) | PPC_BIT8(bs))
 
+#define GETFIELD(mask, word)   \
+    (((word) & (mask)) >> __builtin_ctzl(mask))
+#define SETFIELD(mask, word, val)   \
+    (((word) & ~(mask)) | (((uint64_t)(val) << __builtin_ctzl(mask)) & (mask)))
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
index a39e070e82d2..3fe349749384 100644
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
index 13ba9e45d8b6..0913e7c8f015 100644
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


