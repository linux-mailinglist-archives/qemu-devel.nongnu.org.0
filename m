Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50E52EF65E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:19:04 +0100 (CET)
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvPj-0007of-HO
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvJd-0000eE-Ha
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:12:46 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvJL-0004ta-Bb
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:12:45 -0500
Received: by mail-wm1-x331.google.com with SMTP id q75so9043841wme.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 09:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65MIWpvfEizz0gfsIhaa+4GtpcZafIaROxnZgCMDZXM=;
 b=TiiAOFS9KGw0LxTSjgQs0AbYAO4aJtPltXBeUv2ozAaHqk9gu0UcjSDGNuWB+u0HZL
 q44jgynceIbo7FgH8MdtlHVWMizQVmCvtKLPQ1DuKEUxXO7r1Ksyt0qsxF4d4+iIOKeR
 VTPhJ7Qww47UXvvkXbbPNy79nmaw7RmhwkJZ/78bbhEzB74XC67TBjR8B5slfNE/oKZv
 1magPrIRFNTxWaU57+BMJebTjZR5cB7D2RG5q0vipdw4LAubPgEwuKBjJZmgSCEKNobs
 ANeAaQh7SKOlamCzjY9E9GcRIpKzW6O6okGc4fyISfsz2ukzeKZXZQeH061xewIKT+dl
 /aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65MIWpvfEizz0gfsIhaa+4GtpcZafIaROxnZgCMDZXM=;
 b=OnFpGmdDE9hv53AyvrC2wYmiQRzM6j2Ql9MuCTjxdmIxIHF9SE3ELdxq3OjU8XmOPH
 uFTJ5kdu+GI7ifeBv5RLzeq2zxowwTi4sZbuJPDHxnlEvl4s3wZbZQ/n2Jj+NHzw9GtO
 LJpXMlisbXtvSMmoeG14xT2J8v3DKBTfV/6Pxds5Xm4IVIil1F2rr74/4P1rKMxyZTNx
 l0inCOAoI0kpeZSfEGMKhe42ouSR48IN5k4zp+VS0T65gqpqm7Xn8IqnNDyEL8MFLxLO
 Ud/pRhRtWfi+UfpEiyqVPOGsA6UQxflQ/eJSk4Tlkerco+BheaZlkha4iakplVTzfItQ
 dMRA==
X-Gm-Message-State: AOAM532Lv4VljHODgyLfP0PsTqXAaTbce/Zj+iMq3TweDvl2nugTATis
 Cb30VXHWGfDiN0Wu4bUdyL6q1kT5AZgMnQ==
X-Google-Smtp-Source: ABdhPJze9VzEmbdR14oJSJur2WD6wXB5biDlcLXaq0M8ETEBCLSA3YlicP70o+7o64HlrZfZMZ4Usw==
X-Received: by 2002:a1c:68d6:: with SMTP id d205mr3975283wmc.154.1610125940241; 
 Fri, 08 Jan 2021 09:12:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v1sm13540456wrr.48.2021.01.08.09.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 09:12:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/ppc: Remove unused ppcuic_init()
Date: Fri,  8 Jan 2021 17:12:12 +0000
Message-Id: <20210108171212.16500-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108171212.16500-1-peter.maydell@linaro.org>
References: <20210108171212.16500-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we've converted all the callsites to directly create the QOM UIC
device themselves, the ppcuic_init() function is unused and can be
removed. The enum defining PPCUIC symbolic constants can be moved
to the ppc-uic.h header where it more naturally belongs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/intc/ppc-uic.h |  7 +++++++
 include/hw/ppc/ppc4xx.h   |  9 ---------
 hw/ppc/ppc4xx_devs.c      | 38 --------------------------------------
 3 files changed, 7 insertions(+), 47 deletions(-)

diff --git a/include/hw/intc/ppc-uic.h b/include/hw/intc/ppc-uic.h
index e614e2ffd80..22dd5e5ac2c 100644
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
index cc19c8da5be..980f964b5a9 100644
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
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index ffe4cf43e88..fe9d4f7155e 100644
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
-- 
2.20.1


