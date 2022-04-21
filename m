Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416E509E8E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:31:46 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhV2H-0002fy-5b
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpy-00033v-IO
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:02 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpw-0003Tz-JK
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:02 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g18so6190568wrb.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NxyRKNFl2O6E7I/QAVOYo1T3g62wFJsWVPRRmD11FmI=;
 b=llpp7lcbkUKy06ghh/lmPABu+jgefJcWc0HyuyXLGQ/TcwdezGUyp/79knaqmN2BMD
 WuK9qon6sPkfV7BiRO7BXVX5Q6wVG1t2ug5Miv8m3zVSrdC9ij/05LOussydzwkE29S9
 wLGXoutBIhv1dGIVdNTydIYRGTYWJE9ZxlbjiIluv4UfSkkx4MtCPPiYW3ftHtBuhwqG
 Hgbg8T8/5Iu31ZBiOo7mj4L2eBSNwvTfI+uM6nosIOnymiCGASv9Y2w1Cg5yrLC0QRtm
 3toqqi7V95Qkbqk/CXxas+05mI+M+wrdcSVCIX/P6vo2pqDle/AkjxQ64llbDlByxB1D
 kxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxyRKNFl2O6E7I/QAVOYo1T3g62wFJsWVPRRmD11FmI=;
 b=hwq8bkB8AYsHZ/K3oNdYmlLOst4zFkmX4CShUUQrK4kLR0E4HIavNXxgrvNH9PSEvg
 QyIUs0BObShD7dV41rDHARekedDE6Gw/L/Urmq8qHkCNAC7CdzgxpZVEh4zevngjAMzF
 z7zZrixegib5ix7y5W9ypiRB9SnYr667HxYAlGaUb5xnwLm+brv19TkyoPX0NP8eU1nU
 s7DRne7nCF0oVqXopZRuPbEZQCa9pji5nc09m0cbOMdDd48S2LVdp5yh8NYkySBRQ0YU
 ojPebdoK1P5amASHiGKoPj4acqDbygn2lXPkWyY+o4TzSGJxT3HvY8HJCEal9wKKrLmc
 XI1A==
X-Gm-Message-State: AOAM532r8ZglzScmbZk4Kw89XCDUtKL8hQIbgw6sPCEoL7RLYrAveUId
 aANsqoXIQlsAD2MGTLEv8SN8x3/ub+solA==
X-Google-Smtp-Source: ABdhPJy5NbT+kOpGD/GKP/x6lPq9D/4F4yrQU1fZK/19H+SsqU//dN5JjjCKp/cf1aWL7MpWC/7vFQ==
X-Received: by 2002:a5d:4a81:0:b0:207:9abe:2908 with SMTP id
 o1-20020a5d4a81000000b002079abe2908mr18818764wrq.341.1650539939070; 
 Thu, 21 Apr 2022 04:18:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/31] hw/arm/exynos4210: Coalesce board_irqs and irq_table
Date: Thu, 21 Apr 2022 12:18:27 +0100
Message-Id: <20220421111846.2011565-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The exynos4210 code currently has two very similar arrays of IRQs:

 * board_irqs is a field of the Exynos4210Irq struct which is filled
   in by exynos4210_init_board_irqs() with the appropriate qemu_irqs
   for each IRQ the board/SoC can assert
 * irq_table is a set of qemu_irqs pointed to from the
   Exynos4210State struct.  It's allocated in exynos4210_init_irq,
   and the only behaviour these irqs have is that they pass on the
   level to the equivalent board_irqs[] irq

The extra indirection through irq_table is unnecessary, so coalesce
these into a single irq_table[] array as a direct field in
Exynos4210State which exynos4210_init_board_irqs() fills in.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-6-peter.maydell@linaro.org
---
 include/hw/arm/exynos4210.h |  8 ++------
 hw/arm/exynos4210.c         |  6 +-----
 hw/intc/exynos4210_gic.c    | 32 ++++++++------------------------
 3 files changed, 11 insertions(+), 35 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 923ce987627..a9f186370ee 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -83,7 +83,6 @@ typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
     qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
     qemu_irq ext_gic_irq[EXYNOS4210_EXT_GIC_NIRQ];
-    qemu_irq board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 } Exynos4210Irq;
 
 struct Exynos4210State {
@@ -92,7 +91,7 @@ struct Exynos4210State {
     /*< public >*/
     ARMCPU *cpu[EXYNOS4210_NCPUS];
     Exynos4210Irq irqs;
-    qemu_irq *irq_table;
+    qemu_irq irq_table[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 
     MemoryRegion chipid_mem;
     MemoryRegion iram_mem;
@@ -112,12 +111,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210State, EXYNOS4210_SOC)
 void exynos4210_write_secondary(ARMCPU *cpu,
         const struct arm_boot_info *info);
 
-/* Initialize exynos4210 IRQ subsystem stub */
-qemu_irq *exynos4210_init_irq(Exynos4210Irq *env);
-
 /* Initialize board IRQs.
  * These IRQs contain splitted Int/External Combiner and External Gic IRQs */
-void exynos4210_init_board_irqs(Exynos4210Irq *s);
+void exynos4210_init_board_irqs(Exynos4210State *s);
 
 /* Get IRQ number from exynos4210 IRQ subsystem stub.
  * To identify IRQ source use internal combiner group and bit number
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 60fc5a2ffe7..11e321d7830 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -228,10 +228,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
     }
 
-    /*** IRQs ***/
-
-    s->irq_table = exynos4210_init_irq(&s->irqs);
-
     /* IRQ Gate */
     for (i = 0; i < EXYNOS4210_NCPUS; i++) {
         DeviceState *orgate = DEVICE(&s->cpu_irq_orgate[i]);
@@ -296,7 +292,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);
 
     /* Initialize board IRQs. */
-    exynos4210_init_board_irqs(&s->irqs);
+    exynos4210_init_board_irqs(s);
 
     /*** Memory ***/
 
diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 794f6b5ac72..ec79b96f6d1 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -192,30 +192,14 @@ combiner_grp_to_gic_id[64-EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
 #define EXYNOS4210_GIC_CPU_REGION_SIZE  0x100
 #define EXYNOS4210_GIC_DIST_REGION_SIZE 0x1000
 
-static void exynos4210_irq_handler(void *opaque, int irq, int level)
-{
-    Exynos4210Irq *s = (Exynos4210Irq *)opaque;
-
-    /* Bypass */
-    qemu_set_irq(s->board_irqs[irq], level);
-}
-
-/*
- * Initialize exynos4210 IRQ subsystem stub.
- */
-qemu_irq *exynos4210_init_irq(Exynos4210Irq *s)
-{
-    return qemu_allocate_irqs(exynos4210_irq_handler, s,
-            EXYNOS4210_MAX_INT_COMBINER_IN_IRQ);
-}
-
 /*
  * Initialize board IRQs.
  * These IRQs contain splitted Int/External Combiner and External Gic IRQs.
  */
-void exynos4210_init_board_irqs(Exynos4210Irq *s)
+void exynos4210_init_board_irqs(Exynos4210State *s)
 {
     uint32_t grp, bit, irq_id, n;
+    Exynos4210Irq *is = &s->irqs;
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
         irq_id = 0;
@@ -230,11 +214,11 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
             irq_id = EXT_GIC_ID_MCT_G1;
         }
         if (irq_id) {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                    s->ext_gic_irq[irq_id-32]);
+            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
+                    is->ext_gic_irq[irq_id - 32]);
         } else {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                    s->ext_combiner_irq[n]);
+            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
+                    is->ext_combiner_irq[n]);
         }
     }
     for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
@@ -245,8 +229,8 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
                      EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][bit];
 
         if (irq_id) {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                    s->ext_gic_irq[irq_id-32]);
+            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
+                    is->ext_gic_irq[irq_id - 32]);
         }
     }
 }
-- 
2.25.1


