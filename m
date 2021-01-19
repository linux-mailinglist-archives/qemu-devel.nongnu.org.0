Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD832FB1BA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:44:24 +0100 (CET)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kkZ-0005k9-Iw
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQp-0001RV-Fu; Tue, 19 Jan 2021 01:23:59 -0500
Received: from ozlabs.org ([203.11.71.1]:54925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQn-0000YQ-Cx; Tue, 19 Jan 2021 01:23:59 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DKdrZ2DSKz9snk; Tue, 19 Jan 2021 17:23:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611037406;
 bh=0gvNDW/viLsiaGew9ibOeqS0VFKvWCy1PNxkmx6DF5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EF2kqyh/LPLNBZ9aXi/kv0yV5Gd2Pvog7/cOfnhGxjbCiEZwFOQ3hoz9KsJVRf6rh
 TxaPtjdO9tPT2sJYtT5jCEpkeHWUVuOrpIOoFTd1z/5fXrBPiMW2gta8OMBwQQ2zr6
 laSNlBFuCvDiHCUaO7nYDx5e0OcNW+1s4kRY+4yk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 05/13] hw/ppc: Remove unused ppcuic_init()
Date: Tue, 19 Jan 2021 17:23:10 +1100
Message-Id: <20210119062318.13857-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119062318.13857-1-david@gibson.dropbear.id.au>
References: <20210119062318.13857-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Now we've converted all the callsites to directly create the QOM UIC
device themselves, the ppcuic_init() function is unused and can be
removed. The enum defining PPCUIC symbolic constants can be moved
to the ppc-uic.h header where it more naturally belongs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <20210108171212.16500-5-peter.maydell@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc4xx_devs.c      | 38 --------------------------------------
 include/hw/intc/ppc-uic.h |  7 +++++++
 include/hw/ppc/ppc4xx.h   |  9 ---------
 3 files changed, 7 insertions(+), 47 deletions(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index ffe4cf43e8..fe9d4f7155 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -77,44 +77,6 @@ PowerPCCPU *ppc4xx_init(const char *cpu_type,
     return cpu;
 }
 
-/*****************************************************************************/
-/* "Universal" Interrupt controller */
-
-qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
-                       uint32_t dcr_base, int has_ssr, int has_vr)
-{
-    DeviceState *uicdev = qdev_new(TYPE_PPC_UIC);
-    SysBusDevice *uicsbd = SYS_BUS_DEVICE(uicdev);
-    qemu_irq *uic_irqs;
-    int i;
-
-    qdev_prop_set_uint32(uicdev, "dcr-base", dcr_base);
-    qdev_prop_set_bit(uicdev, "use-vectors", has_vr);
-    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(env_cpu(env)),
-                             &error_fatal);
-    sysbus_realize_and_unref(uicsbd, &error_fatal);
-
-    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT, irqs[PPCUIC_OUTPUT_INT]);
-    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT, irqs[PPCUIC_OUTPUT_CINT]);
-
-    /*
-     * Return an allocated array of the UIC's input IRQ lines.
-     * This is an ugly temporary API to retain compatibility with
-     * the ppcuic_init() interface from the pre-QOM-conversion UIC.
-     * None of the callers free this array, so it is leaked -- but
-     * so was the array allocated by qemu_allocate_irqs() in the
-     * old code.
-     *
-     * The callers should just instantiate the UIC and wire it up
-     * themselves rather than passing qemu_irq* in and out of this function.
-     */
-    uic_irqs = g_new0(qemu_irq, UIC_MAX_IRQ);
-    for (i = 0; i < UIC_MAX_IRQ; i++) {
-        uic_irqs[i] = qdev_get_gpio_in(uicdev, i);
-    }
-    return uic_irqs;
-}
-
 /*****************************************************************************/
 /* SDRAM controller */
 typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
diff --git a/include/hw/intc/ppc-uic.h b/include/hw/intc/ppc-uic.h
index e614e2ffd8..22dd5e5ac2 100644
--- a/include/hw/intc/ppc-uic.h
+++ b/include/hw/intc/ppc-uic.h
@@ -47,6 +47,13 @@ OBJECT_DECLARE_SIMPLE_TYPE(PPCUIC, PPC_UIC)
 
 #define UIC_MAX_IRQ 32
 
+/* Symbolic constants for the sysbus IRQ outputs */
+enum {
+    PPCUIC_OUTPUT_INT = 0,
+    PPCUIC_OUTPUT_CINT = 1,
+    PPCUIC_OUTPUT_NB,
+};
+
 struct PPCUIC {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index cc19c8da5b..980f964b5a 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -33,15 +33,6 @@ PowerPCCPU *ppc4xx_init(const char *cpu_model,
                         clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
                         uint32_t sysclk);
 
-/* PowerPC 4xx universal interrupt controller */
-enum {
-    PPCUIC_OUTPUT_INT = 0,
-    PPCUIC_OUTPUT_CINT = 1,
-    PPCUIC_OUTPUT_NB,
-};
-qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
-                       uint32_t dcr_base, int has_ssr, int has_vr);
-
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         MemoryRegion ram_memories[],
                         hwaddr ram_bases[], hwaddr ram_sizes[],
-- 
2.29.2


