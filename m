Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A7551DD98
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 18:26:24 +0200 (CEST)
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0md-0004GH-WA
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 12:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0i3-0005OG-4H
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:21:39 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0i0-000569-N3
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:21:38 -0400
Received: by mail-wr1-x433.google.com with SMTP id k2so10681352wrd.5
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tr8TV4hqUwZ65ANOZtVJWuhRalEYVu1kyymwRoj7iTA=;
 b=DyAXxuYVisY/VQqpleSgDexuIZwVffAmbCaoC6aYTTAX+10mZAPaWQ4+d7/kSXb2N1
 6cL1pz1lbmICYlUywmmh0JxgEtjGEzBObCXQJDQ57F6V7JANJVioLWMu/gNqrn6ce+cy
 ym269rD1k1e5Ne0ZOKzc7sZkdfsgjK+P/HgBcV++BjFYD+KfExEVUtxVw4xbIlICE9JL
 C/OZvpo2RGiyzCts+/ukyq9tjwPmRxRg7niK06TBksKY/IlCiHz+mW1SHLW5Uqh5TQVT
 ixlgnzP6KUkijECUW91kB3uRu1/MeYdxqCGEdAYdYk8NR+h+5n6/StxmR/3F2eJORAZl
 40eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tr8TV4hqUwZ65ANOZtVJWuhRalEYVu1kyymwRoj7iTA=;
 b=NHz50XYp7KokHnErPrw498oXGpWrW2UIHciUcEpPx7lbXsQby2ecdxTFgDm1YMtxLJ
 0ge2YkK4QQsv7+uX+jdOYWCJVq+tv14QNVI7xg2boj9keizN3deQkG3RzPzyB/pMcjmo
 bxiVGe5oakVBPnWNzGIpz+ZfiSoWoY3+Ij5kiXmK5TwkJ9XxRpixoFPJInX703FQcOft
 GocLqrrIJpamXhOHJ//+T6vK+26x9WrQVM9nDLQ0E3pTognOG+m4wq6VHAoQylL9Dk1w
 OPcdLKKW43WxCLPBetWa/l1Qs4VVj91ak3QqMbzS0AAHtEYD5xrZtFmy86uTuoa/D0wC
 a0Ig==
X-Gm-Message-State: AOAM530i1DtjEvRfNu7w3bGBBJVxs1j+ZfioigB5yURsOofu+u64tryW
 VppIyehC2zY2faxzV9v+VR8Gbw==
X-Google-Smtp-Source: ABdhPJxiy/znK5uA21Vny70mvYuZ+HeG15uF3MEAwGJ4aw018YMGyYi1UakO96xwgSODlAl7pxgZxg==
X-Received: by 2002:a05:6000:2a2:b0:20c:999d:bdec with SMTP id
 l2-20020a05600002a200b0020c999dbdecmr3346136wry.36.1651854095396; 
 Fri, 06 May 2022 09:21:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b0020c5253d926sm3782082wrq.114.2022.05.06.09.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:21:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/intc/arm_gicv3: Use correct number of priority bits
 for the CPU
Date: Fri,  6 May 2022 17:21:28 +0100
Message-Id: <20220506162129.2896966-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506162129.2896966-1-peter.maydell@linaro.org>
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Make the GICv3 set its number of bits of physical priority from the
implementation-specific value provided in the CPU state struct, in
the same way we already do for virtual priority bits.  Because this
would be a migration compatibility break, we provide a property
force-8-bit-prio which is enabled for 7.0 and earlier versioned board
models to retain the legacy "always use 8 bits" behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I have guessed at the right value for the A64FX, but if we can
find the correct ICC_CTLR_EL1 value that would be better.
---
 include/hw/intc/arm_gicv3_common.h |  1 +
 target/arm/cpu.h                   |  1 +
 hw/core/machine.c                  |  4 +++-
 hw/intc/arm_gicv3_common.c         |  5 +++++
 hw/intc/arm_gicv3_cpuif.c          | 14 ++++++++++----
 target/arm/cpu64.c                 |  9 +++++++++
 6 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 46677ec345c..ab5182a28a2 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -248,6 +248,7 @@ struct GICv3State {
     uint32_t revision;
     bool lpi_enable;
     bool security_extn;
+    bool force_8bit_prio;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ca01f909a86..f8873bdbb97 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -993,6 +993,7 @@ struct ArchCPU {
     int gic_num_lrs; /* number of list registers */
     int gic_vpribits; /* number of virtual priority bits */
     int gic_vprebits; /* number of virtual preemption bits */
+    int gic_pribits; /* number of physical priority bits */
 
     /* Whether the cfgend input is high (i.e. this CPU should reset into
      * big-endian mode).  This setting isn't used directly: instead it modifies
diff --git a/hw/core/machine.c b/hw/core/machine.c
index cb9bbc844d2..db012376785 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_7_0[] = {};
+GlobalProperty hw_compat_7_0[] = {
+    { "arm-gicv3-common", "force-8-bit-prio", "on" },
+};
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
 GlobalProperty hw_compat_6_2[] = {
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 5634c6fc788..351843db4aa 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -563,6 +563,11 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
+    /*
+     * Compatibility property: force 8 bits of physical priority, even
+     * if the CPU being emulated should have fewer.
+     */
+    DEFINE_PROP_BOOL("force-8-bit-prio", GICv3State, force_8bit_prio, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
     DEFINE_PROP_LINK("sysmem", GICv3State, dma, TYPE_MEMORY_REGION,
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 8499a49be39..e277a807bd5 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2801,11 +2801,17 @@ void gicv3_init_cpuif(GICv3State *s)
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
 
         /*
-         * For the moment, retain the existing behaviour of 8 priority bits;
-         * in a following commit we will take this from the CPU state,
-         * as we do for the virtual priority bits.
+         * The CPU implementation specifies the number of supported
+         * bits of physical priority. For backwards compatibility
+         * of migration, we have a compat property that forces use
+         * of 8 priority bits regardless of what the CPU really has.
          */
-        cs->pribits = 8;
+        if (s->force_8bit_prio) {
+            cs->pribits = 8;
+        } else {
+            cs->pribits = cpu->gic_pribits;
+        }
+
         /*
          * The GICv3 has separate ID register fields for virtual priority
          * and preemption bit values, but only a single ID register field
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c841d55d0e9..490231b90f3 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -143,6 +143,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
@@ -196,6 +197,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
@@ -247,6 +249,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
@@ -961,6 +964,12 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    /*
+     * TODO: What does the real A64FX GICv3 provide ?
+     * This is a guess based on what other Arm CPUs do; to find the correct
+     * answer we need the value of the A64FX's ICC_CTLR_EL1 register.
+     */
+    cpu->gic_pribits = 5;
 
     /* Suppport of A64FX's vector length are 128,256 and 512bit only */
     aarch64_add_sve_properties(obj);
-- 
2.25.1


