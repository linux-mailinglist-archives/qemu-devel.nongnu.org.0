Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD2652511A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:18:51 +0200 (CEST)
Received: from localhost ([::1]:52014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAaY-0007Sb-WF
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAX1-00037z-4g
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWv-0000OK-6T
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m1so7700949wrb.8
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5AL/ExqpQl1WXPTr1hW9j9yflfrBr3IWmMKn7s35cx8=;
 b=N8I1M/lzvfEK17ZhuHKBEw2B5t67e6BaPDzrZy7ijtJTM/TnHMRhm+n5qrXUh9r+q9
 czJAX8c4DcryFMA5EKLaXh6ZTZI6mfIxIPEBPTs5s6y75m9M3EDUSpGMF8hkemMA9Oh3
 oDJBItdimUC5r9qCdBRK9dejaV2ND8zditkkwrAJUoO6008iCYmlJvQnlOha76Fmfcrf
 dEmwhw19Ai7yTRwVZbl4qNoFupX6Zc6TOMEG8vA1l4xutWGqqR5hgWzJfqHeihBejpbZ
 b4qhpDRwwbfRsej3cNf6Pz6tMxKpZaBYQ5YavzrZxSx230EItXh3J6SIWSut7PLJU7W4
 GC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5AL/ExqpQl1WXPTr1hW9j9yflfrBr3IWmMKn7s35cx8=;
 b=ijOofPRZIUYI+D7UAHR8Jx1VPJ1bWGx5eRmgQjdi0KIEsFo75QoaCK7YxVxuXzCRwr
 CtARUih2LsFHItczGeBiJ2RkiUqTezcw9hrIQFeUgYK6g3ipGTvxxauiCvZwIAJ8TEr0
 FZxFcrsRmGq4Hur4dqGDpvxEv2wPcqoPg5W0jhnfoSZVHVtcfTZbLz9xuWpTXgtLzfh4
 soeMXYJBEWN+cyA3acxgMR0D6nLMcH7GoCzzxzYEA9+6uNXi9qzHqLj7LHcoTZB2jwV+
 jOv2IPbV0EwEYwi0VwxzK0DqGQ3yWOBPRAIV+baZiQHcxBd0xH9U+EKmzAD4bBickFVG
 bgow==
X-Gm-Message-State: AOAM533T7+QL86dcorGQWdVpw8sk+Gr7/DiaSPvS+7AHOL1buyxEPwoW
 PRrX0Wv/8SbQ+jv2FGgU7HRFlg==
X-Google-Smtp-Source: ABdhPJwELtGTyPcskIAjueQhXHYY5HP5zR5g0H6nYdCewXblHWVY8uPaJMJFJohzw7X64ys4IvvOTw==
X-Received: by 2002:a5d:6c6f:0:b0:20c:4d8b:c8a9 with SMTP id
 r15-20020a5d6c6f000000b0020c4d8bc8a9mr143212wrz.458.1652368503886; 
 Thu, 12 May 2022 08:15:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:15:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/6] hw/intc/arm_gicv3: Use correct number of priority bits
 for the CPU
Date: Thu, 12 May 2022 16:14:56 +0100
Message-Id: <20220512151457.3899052-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512151457.3899052-1-peter.maydell@linaro.org>
References: <20220512151457.3899052-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506162129.2896966-5-peter.maydell@linaro.org
---
v1->v2:
 - drop TODO comment about a64fx
 - add settings for cortex-a76, neoverse-n1
 - default pribits to 5 if CPU doesn't set it
---
 include/hw/intc/arm_gicv3_common.h |  1 +
 target/arm/cpu.h                   |  1 +
 hw/core/machine.c                  |  4 +++-
 hw/intc/arm_gicv3_common.c         |  5 +++++
 hw/intc/arm_gicv3_cpuif.c          | 15 +++++++++++----
 target/arm/cpu64.c                 |  6 ++++++
 6 files changed, 27 insertions(+), 5 deletions(-)

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
index 18ca61e8e25..61bfb8d11f3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1002,6 +1002,7 @@ struct ArchCPU {
     int gic_num_lrs; /* number of list registers */
     int gic_vpribits; /* number of virtual priority bits */
     int gic_vprebits; /* number of virtual preemption bits */
+    int gic_pribits; /* number of physical priority bits */
 
     /* Whether the cfgend input is high (i.e. this CPU should reset into
      * big-endian mode).  This setting isn't used directly: instead it modifies
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 700c1e76b88..b670679de2e 100644
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
index 69a15f7a444..66e06b787c7 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2798,6 +2798,7 @@ void gicv3_init_cpuif(GICv3State *s)
          *  cpu->gic_num_lrs
          *  cpu->gic_vpribits
          *  cpu->gic_vprebits
+         *  cpu->gic_pribits
          */
 
         /* Note that we can't just use the GICv3CPUState as an opaque pointer
@@ -2810,11 +2811,17 @@ void gicv3_init_cpuif(GICv3State *s)
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
+            cs->pribits = cpu->gic_pribits ?: 5;
+        }
+
         /*
          * The GICv3 has separate ID register fields for virtual priority
          * and preemption bit values, but only a single ID register field
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 04427e073f1..c79a3fcf950 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -87,6 +87,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
@@ -140,6 +141,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
@@ -191,6 +193,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
@@ -252,6 +255,7 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
 
     /* From B5.1 AdvSIMD AArch64 register summary */
     cpu->isar.mvfr0 = 0x10110222;
@@ -317,6 +321,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
 
     /* From B5.1 AdvSIMD AArch64 register summary */
     cpu->isar.mvfr0 = 0x10110222;
@@ -996,6 +1001,7 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
 
     /* Suppport of A64FX's vector length are 128,256 and 512bit only */
     aarch64_add_sve_properties(obj);
-- 
2.25.1


