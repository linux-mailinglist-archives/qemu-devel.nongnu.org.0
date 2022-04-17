Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562115048C8
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:08:04 +0200 (CEST)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9Jb-00040Y-DQ
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xG-00017n-5c
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:58 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xC-0003Mz-7h
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:57 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t184so1964540pgd.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gkgsg3onX5Hjd+QC7tmsSKQPPIxaAKKPbGO7yUYNElE=;
 b=umJh2AFu+eFcKCMhFALZXsAWF9bQ1+3PXOcaeH0ztFhm66dA4WPK2l4qysFtQQi8X8
 e1PiAzZamzJatA78kTzaZk2wCrbKjhI2I1EZa07SlaEdnhDkqYt5W/PXFCw+egnGqdAj
 DlI30Mzj/WM4mpEiyXoCxzn2Rc2kTQEtcrzrU8yEEkTMDlyfYnQ7SPcy/i0ned0/F2V1
 zCIhBfEayA7MG3U+Y/dACmDtu+S1XKko8IJTcW+ZCy6ofUqnuiQariVhctxjL6t9DwmM
 AHVBVo2enRPkKhPNgq9gbe9FLXgIUS+Z8hA3GOhaPs1IBoPRM5hpbh3T7vQzgGO8lHMD
 wsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gkgsg3onX5Hjd+QC7tmsSKQPPIxaAKKPbGO7yUYNElE=;
 b=MqnEEySIDzsLzUEbZQgRolAidL9YVr2YKzPKENzz//XVpaikWRcrInwA5FJvpQhyJM
 7xzEEjk0J3wrI92J3NwNtQpXFPklZXowJUtZGmkNwFh4aTFvAT/wRSJthi0HmZuCpUTy
 xn3be+TkA1Wogx6Cth/yivhzi3SEYDEfCFIDzF3ECbnAdcXrx/PnDJld2xtqJ4X3GwTq
 cfSwnlyO4E2MBkAmkIDAa6ECL9PIeDk752NvLa537l/dQofrBSjyoBuVYnAYgscPcHxN
 AzENy5zo5+VGsYg9LSlQtRuaefNACqLlkHlE6hv6lENkPT74I9385A8kzbJme55xu4/t
 EOPg==
X-Gm-Message-State: AOAM531NklVItKx+tYhKdH/9eEBi3VKR9Hjhz7+hERz9zCOLHd3br8GL
 wT3lyDIG5ZULzqQuXyRD6mK3kHIwwiQsJg==
X-Google-Smtp-Source: ABdhPJyG3kzUbKcSQNUVzxfN6ACi7fjulJXjZLC2WRNxBozd5imYY1Z0km7ooVwFqHey5u6g6/Ykng==
X-Received: by 2002:a63:fb05:0:b0:39d:a07b:cf4 with SMTP id
 o5-20020a63fb05000000b0039da07b0cf4mr7168606pgh.440.1650217492723; 
 Sun, 17 Apr 2022 10:44:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/60] target/arm: Replace sentinels with ARRAY_SIZE in
 cpregs.h
Date: Sun, 17 Apr 2022 10:43:52 -0700
Message-Id: <20220417174426.711829-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove a possible source of error by removing REGINFO_SENTINEL
and using ARRAY_SIZE (convinently hidden inside a macro) to
find the end of the set of regs being registered or modified.

The space saved by not having the extra array element reduces
the executable's .data.rel.ro section by about 9k.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h       |  57 +++++++++++---------
 hw/arm/pxa2xx.c           |   1 -
 hw/arm/pxa2xx_pic.c       |   1 -
 hw/intc/arm_gicv3_cpuif.c |   5 --
 hw/intc/arm_gicv3_kvm.c   |   1 -
 target/arm/cpu64.c        |   1 -
 target/arm/cpu_tcg.c      |   4 --
 target/arm/helper.c       | 111 ++++++++------------------------------
 8 files changed, 52 insertions(+), 129 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 700fcc1478..bd321d6d23 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -71,8 +71,6 @@
 #define ARM_CP_NO_GDB            0x4000
 #define ARM_CP_RAISES_EXC        0x8000
 #define ARM_CP_NEWEL             0x10000
-/* Used only as a terminator for ARMCPRegInfo lists */
-#define ARM_CP_SENTINEL          0xfffff
 /* Mask of only the flag bits in a type field */
 #define ARM_CP_FLAG_MASK         0x1f0ff
 
@@ -108,18 +106,6 @@ enum {
     ARM_CP_SECSTATE_NS =  (1 << 1), /* bit[1]: Non-secure state register */
 };
 
-/*
- * Return true if cptype is a valid type field. This is used to try to
- * catch errors where the sentinel has been accidentally left off the end
- * of a list of registers.
- */
-static inline bool cptype_valid(int cptype)
-{
-    return ((cptype & ~ARM_CP_FLAG_MASK) == 0)
-        || ((cptype & ARM_CP_SPECIAL) &&
-            ((cptype & ~ARM_CP_FLAG_MASK) <= ARM_LAST_SPECIAL));
-}
-
 /*
  * Access rights:
  * We define bits for Read and Write access for what rev C of the v7-AR ARM ARM
@@ -346,20 +332,31 @@ struct ARMCPRegInfo {
 #define CPREG_FIELD64(env, ri) \
     (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
 
-#define REGINFO_SENTINEL { .type = ARM_CP_SENTINEL }
+void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu, const ARMCPRegInfo *reg,
+                                       void *opaque);
 
-void define_arm_cp_regs_with_opaque(ARMCPU *cpu,
-                                    const ARMCPRegInfo *regs, void *opaque);
-void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
-                                       const ARMCPRegInfo *regs, void *opaque);
-static inline void define_arm_cp_regs(ARMCPU *cpu, const ARMCPRegInfo *regs)
-{
-    define_arm_cp_regs_with_opaque(cpu, regs, 0);
-}
 static inline void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *regs)
 {
-    define_one_arm_cp_reg_with_opaque(cpu, regs, 0);
+    define_one_arm_cp_reg_with_opaque(cpu, regs, NULL);
 }
+
+void define_arm_cp_regs_with_opaque_len(ARMCPU *cpu, const ARMCPRegInfo *regs,
+                                        void *opaque, size_t len);
+
+#define define_arm_cp_regs_with_opaque(CPU, REGS, OPAQUE)               \
+    do {                                                                \
+        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) == 0);                       \
+        if (ARRAY_SIZE(REGS) == 1) {                                    \
+            define_one_arm_cp_reg_with_opaque(CPU, REGS, OPAQUE);       \
+        } else {                                                        \
+            define_arm_cp_regs_with_opaque_len(CPU, REGS, OPAQUE,       \
+                                               ARRAY_SIZE(REGS));       \
+        }                                                               \
+    } while (0)
+
+#define define_arm_cp_regs(CPU, REGS) \
+    define_arm_cp_regs_with_opaque(CPU, REGS, NULL)
+
 const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp);
 
 /*
@@ -382,9 +379,17 @@ typedef struct ARMCPRegUserSpaceInfo {
     uint64_t fixed_bits;
 } ARMCPRegUserSpaceInfo;
 
-#define REGUSERINFO_SENTINEL { .name = NULL }
+void modify_arm_cp_regs_with_len(ARMCPRegInfo *regs, size_t regs_len,
+                                 const ARMCPRegUserSpaceInfo *mods,
+                                 size_t mods_len);
 
-void modify_arm_cp_regs(ARMCPRegInfo *regs, const ARMCPRegUserSpaceInfo *mods);
+#define modify_arm_cp_regs(REGS, MODS)                                  \
+    do {                                                                \
+        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) == 0);                       \
+        QEMU_BUILD_BUG_ON(ARRAY_SIZE(MODS) == 0);                       \
+        modify_arm_cp_regs_with_len(REGS, ARRAY_SIZE(REGS),             \
+                                    MODS, ARRAY_SIZE(MODS));            \
+    } while (0)
 
 /* CPWriteFn that can be used to implement writes-ignored behaviour */
 void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 0683714733..f4f687df68 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -384,7 +384,6 @@ static const ARMCPRegInfo pxa_cp_reginfo[] = {
     { .name = "PWRMODE", .cp = 14, .crn = 7, .crm = 0, .opc1 = 0, .opc2 = 0,
       .access = PL1_RW, .type = ARM_CP_IO,
       .readfn = arm_cp_read_zero, .writefn = pxa2xx_pwrmode_write },
-    REGINFO_SENTINEL
 };
 
 static void pxa2xx_setup_cp14(PXA2xxState *s)
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index b80d75d839..47132ab982 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -257,7 +257,6 @@ static const ARMCPRegInfo pxa_pic_cp_reginfo[] = {
     REGINFO_FOR_PIC_CP("ICLR2", 8),
     REGINFO_FOR_PIC_CP("ICFP2", 9),
     REGINFO_FOR_PIC_CP("ICPR2", 0xa),
-    REGINFO_SENTINEL
 };
 
 static const MemoryRegionOps pxa2xx_pic_ops = {
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index d43ba970f9..a4c08f2ff9 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2309,7 +2309,6 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .readfn = icc_igrpen1_el3_read,
       .writefn = icc_igrpen1_el3_write,
     },
-    REGINFO_SENTINEL
 };
 
 static uint64_t ich_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -2559,7 +2558,6 @@ static const ARMCPRegInfo gicv3_cpuif_hcr_reginfo[] = {
       .readfn = ich_vmcr_read,
       .writefn = ich_vmcr_write,
     },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo gicv3_cpuif_ich_apxr1_reginfo[] = {
@@ -2577,7 +2575,6 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr1_reginfo[] = {
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
     },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo gicv3_cpuif_ich_apxr23_reginfo[] = {
@@ -2609,7 +2606,6 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr23_reginfo[] = {
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
     },
-    REGINFO_SENTINEL
 };
 
 static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
@@ -2678,7 +2674,6 @@ void gicv3_init_cpuif(GICv3State *s)
                       .readfn = ich_lr_read,
                       .writefn = ich_lr_write,
                     },
-                    REGINFO_SENTINEL
                 };
                 define_arm_cp_regs(cpu, lr_regset);
             }
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index ed2a583b0c..36accae257 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -735,7 +735,6 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
        */
       .resetfn = arm_gicv3_icc_reset,
     },
-    REGINFO_SENTINEL
 };
 
 /**
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9561714c23..c40373bd18 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -91,7 +91,6 @@ static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
     { .name = "L2MERRSR",
       .cp = 15, .opc1 = 3, .crm = 15,
       .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static void aarch64_a57_initfn(Object *obj)
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0e693b182e..9338088b22 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -264,7 +264,6 @@ static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "L2AUXCR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static void cortex_a8_initfn(Object *obj)
@@ -332,7 +331,6 @@ static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
       .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
     { .name = "TLB_ATTR", .cp = 15, .crn = 15, .crm = 7, .opc1 = 5, .opc2 = 2,
       .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
-    REGINFO_SENTINEL
 };
 
 static void cortex_a9_initfn(Object *obj)
@@ -398,7 +396,6 @@ static const ARMCPRegInfo cortexa15_cp_reginfo[] = {
 #endif
     { .name = "L2ECTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 3,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static void cortex_a7_initfn(Object *obj)
@@ -686,7 +683,6 @@ static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST },
     { .name = "DCACHE_INVAL", .cp = 15, .opc1 = 0, .crn = 15, .crm = 5,
       .opc2 = 0, .access = PL1_W, .type = ARM_CP_NOP },
-    REGINFO_SENTINEL
 };
 
 static void cortex_r5_initfn(Object *obj)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8928ffb6a7..d6c34c7826 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -674,7 +674,6 @@ static const ARMCPRegInfo cp_reginfo[] = {
       .secure = ARM_CP_SECSTATE_S,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_s),
       .resetvalue = 0, .writefn = contextidr_write, .raw_writefn = raw_write, },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo not_v8_cp_reginfo[] = {
@@ -703,7 +702,6 @@ static const ARMCPRegInfo not_v8_cp_reginfo[] = {
     { .name = "CACHEMAINT", .cp = 15, .crn = 7, .crm = CP_ANY,
       .opc1 = 0, .opc2 = CP_ANY, .access = PL1_W,
       .type = ARM_CP_NOP | ARM_CP_OVERRIDE },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo not_v6_cp_reginfo[] = {
@@ -712,7 +710,6 @@ static const ARMCPRegInfo not_v6_cp_reginfo[] = {
      */
     { .name = "WFI_v5", .cp = 15, .crn = 7, .crm = 8, .opc1 = 0, .opc2 = 2,
       .access = PL1_W, .type = ARM_CP_WFI },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo not_v7_cp_reginfo[] = {
@@ -761,7 +758,6 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
       .opc1 = 0, .opc2 = 0, .access = PL1_RW, .type = ARM_CP_NOP },
     { .name = "NMRR", .cp = 15, .crn = 10, .crm = 2,
       .opc1 = 0, .opc2 = 1, .access = PL1_RW, .type = ARM_CP_NOP },
-    REGINFO_SENTINEL
 };
 
 static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -890,7 +886,6 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
       .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 2, .accessfn = cpacr_access,
       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.cpacr_el1),
       .resetfn = cpacr_reset, .writefn = cpacr_write, .readfn = cpacr_read },
-    REGINFO_SENTINEL
 };
 
 typedef struct pm_event {
@@ -2136,7 +2131,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "TLBIMVAA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
       .writefn = tlbimvaa_write },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo v7mp_cp_reginfo[] = {
@@ -2153,7 +2147,6 @@ static const ARMCPRegInfo v7mp_cp_reginfo[] = {
     { .name = "TLBIMVAAIS", .cp = 15, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .accessfn = access_ttlb,
       .writefn = tlbimvaa_is_write },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
@@ -2171,7 +2164,6 @@ static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn = pmovsset_write,
       .raw_writefn = raw_write },
-    REGINFO_SENTINEL
 };
 
 static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -2212,7 +2204,6 @@ static const ARMCPRegInfo t2ee_cp_reginfo[] = {
     { .name = "TEEHBR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 6, .opc2 = 0,
       .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, teehbr),
       .accessfn = teehbr_access, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo v6k_cp_reginfo[] = {
@@ -2244,7 +2235,6 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidrprw_s),
                              offsetoflow32(CPUARMState, cp15.tpidrprw_ns) },
       .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -3092,7 +3082,6 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_SEC].cval),
       .writefn = gt_sec_cval_write, .raw_writefn = raw_write,
     },
-    REGINFO_SENTINEL
 };
 
 static CPAccessResult e2h_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3133,7 +3122,6 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
       .readfn = gt_virt_cnt_read,
     },
-    REGINFO_SENTINEL
 };
 
 #endif
@@ -3497,7 +3485,6 @@ static const ARMCPRegInfo vapa_cp_reginfo[] = {
       .access = PL1_W, .accessfn = ats_access,
       .writefn = ats_write, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC },
 #endif
-    REGINFO_SENTINEL
 };
 
 /* Return basic MPU access permission bits.  */
@@ -3620,7 +3607,6 @@ static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, pmsav7.rnr[M_REG_NS]),
       .writefn = pmsav7_rgnr_write,
       .resetfn = arm_cp_reset_ignore },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo pmsav5_cp_reginfo[] = {
@@ -3671,7 +3657,6 @@ static const ARMCPRegInfo pmsav5_cp_reginfo[] = {
     { .name = "946_PRBS7", .cp = 15, .crn = 6, .crm = 7, .opc1 = 0,
       .opc2 = CP_ANY, .access = PL1_RW, .resetvalue = 0,
       .fieldoffset = offsetof(CPUARMState, cp15.c6_region[7]) },
-    REGINFO_SENTINEL
 };
 
 static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3825,7 +3810,6 @@ static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .fieldoffset = offsetof(CPUARMState, cp15.far_el[1]),
       .resetvalue = 0, },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo vmsa_cp_reginfo[] = {
@@ -3858,7 +3842,6 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
       /* No offsetoflow32 -- pass the entire TCR to writefn/raw_writefn. */
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.tcr_el[3]),
                              offsetof(CPUARMState, cp15.tcr_el[1])} },
-    REGINFO_SENTINEL
 };
 
 /* Note that unlike TTBCR, writing to TTBCR2 does not require flushing
@@ -3943,7 +3926,6 @@ static const ARMCPRegInfo omap_cp_reginfo[] = {
     { .name = "C9", .cp = 15, .crn = 9,
       .crm = CP_ANY, .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_RW,
       .type = ARM_CP_CONST | ARM_CP_OVERRIDE, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static void xscale_cpar_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3976,7 +3958,6 @@ static const ARMCPRegInfo xscale_cp_reginfo[] = {
     { .name = "XSCALE_UNLOCK_DCACHE",
       .cp = 15, .opc1 = 0, .crn = 9, .crm = 2, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NOP },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo dummy_c15_cp_reginfo[] = {
@@ -3990,7 +3971,6 @@ static const ARMCPRegInfo dummy_c15_cp_reginfo[] = {
       .access = PL1_RW,
       .type = ARM_CP_CONST | ARM_CP_NO_RAW | ARM_CP_OVERRIDE,
       .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo cache_dirty_status_cp_reginfo[] = {
@@ -3998,7 +3978,6 @@ static const ARMCPRegInfo cache_dirty_status_cp_reginfo[] = {
     { .name = "CDSR", .cp = 15, .crn = 7, .crm = 10, .opc1 = 0, .opc2 = 6,
       .access = PL1_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
       .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
@@ -4019,7 +3998,6 @@ static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
       .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
     { .name = "CIDCR", .cp = 15, .crm = 14, .opc1 = 0,
       .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo cache_test_clean_cp_reginfo[] = {
@@ -4032,7 +4010,6 @@ static const ARMCPRegInfo cache_test_clean_cp_reginfo[] = {
     { .name = "TCI_DCACHE", .cp = 15, .crn = 7, .crm = 14, .opc1 = 0, .opc2 = 3,
       .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
       .resetvalue = (1 << 30) },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo strongarm_cp_reginfo[] = {
@@ -4041,7 +4018,6 @@ static const ARMCPRegInfo strongarm_cp_reginfo[] = {
       .crm = CP_ANY, .opc1 = CP_ANY, .opc2 = CP_ANY,
       .access = PL1_RW, .resetvalue = 0,
       .type = ARM_CP_CONST | ARM_CP_OVERRIDE | ARM_CP_NO_RAW },
-    REGINFO_SENTINEL
 };
 
 static uint64_t midr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -4108,7 +4084,6 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) },
       .writefn = vmsa_ttbr_write, },
-    REGINFO_SENTINEL
 };
 
 static uint64_t aa64_fpcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -5127,7 +5102,6 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .writefn = sdcr_write,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
-    REGINFO_SENTINEL
 };
 
 /* Used to describe the behaviour of EL2 regs when EL2 does not exist.  */
@@ -5238,7 +5212,6 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .type = ARM_CP_CONST,
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 2,
       .access = PL2_RW, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 /* Ditto, but for registers which exist in ARMv8 but not v7 */
@@ -5247,7 +5220,6 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL2_RW,
       .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
@@ -5680,7 +5652,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .cp = 15, .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, cp15.hstr_el2) },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
@@ -5690,7 +5661,6 @@ static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
       .access = PL2_RW,
       .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
       .writefn = hcr_writehigh },
-    REGINFO_SENTINEL
 };
 
 static CPAccessResult sel2_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -5711,7 +5681,6 @@ static const ARMCPRegInfo el2_sec_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 6, .opc2 = 2,
       .access = PL2_RW, .accessfn = sel2_access,
       .fieldoffset = offsetof(CPUARMState, cp15.vstcr_el2) },
-    REGINFO_SENTINEL
 };
 
 static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -5837,7 +5806,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 5,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae3_write },
-    REGINFO_SENTINEL
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -6123,7 +6091,6 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
@@ -6132,7 +6099,6 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
       .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
     { .name = "DBGDSAR", .cp = 14, .crm = 2, .opc1 = 0,
       .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 /* Return the exception level to which exceptions should be taken
@@ -6618,7 +6584,6 @@ static void define_debug_regs(ARMCPU *cpu)
               .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]),
               .writefn = dbgbcr_write, .raw_writefn = raw_write
             },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, dbgregs);
     }
@@ -6637,7 +6602,6 @@ static void define_debug_regs(ARMCPU *cpu)
               .fieldoffset = offsetof(CPUARMState, cp15.dbgwcr[i]),
               .writefn = dbgwcr_write, .raw_writefn = raw_write
             },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, dbgregs);
     }
@@ -6700,7 +6664,6 @@ static void define_pmu_regs(ARMCPU *cpu)
               .type = ARM_CP_IO,
               .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
               .raw_writefn = pmevtyper_rawwrite },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, pmev_regs);
         g_free(pmevcntr_name);
@@ -6718,7 +6681,6 @@ static void define_pmu_regs(ARMCPU *cpu)
               .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 5,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
               .resetvalue = extract64(cpu->pmceid1, 32, 32) },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, v81_pmu_regs);
     }
@@ -6815,7 +6777,6 @@ static const ARMCPRegInfo lor_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 7,
       .access = PL1_R, .accessfn = access_lor_ns,
       .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 #ifdef TARGET_AARCH64
@@ -6878,7 +6839,6 @@ static const ARMCPRegInfo pauth_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 1, .opc2 = 3,
       .access = PL1_RW, .accessfn = access_pauth,
       .fieldoffset = offsetof(CPUARMState, keys.apib.hi) },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo tlbirange_reginfo[] = {
@@ -6990,7 +6950,6 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 6, .opc2 = 5,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae3_write },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo tlbios_reginfo[] = {
@@ -7062,7 +7021,6 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 5,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae3is_write },
-    REGINFO_SENTINEL
 };
 
 static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -7101,7 +7059,6 @@ static const ARMCPRegInfo rndr_reginfo[] = {
       .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END | ARM_CP_IO,
       .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 4, .opc2 = 1,
       .access = PL0_R, .readfn = rndr_readfn },
-    REGINFO_SENTINEL
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -7137,7 +7094,6 @@ static const ARMCPRegInfo dcpop_reg[] = {
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
       .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo dcpodp_reg[] = {
@@ -7145,7 +7101,6 @@ static const ARMCPRegInfo dcpodp_reg[] = {
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
       .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
-    REGINFO_SENTINEL
 };
 #endif /*CONFIG_USER_ONLY*/
 
@@ -7247,14 +7202,12 @@ static const ARMCPRegInfo mte_reginfo[] = {
     { .name = "DC_CIGDSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 6,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo mte_tco_ro_reginfo[] = {
     { .name = "TCO", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
       .type = ARM_CP_CONST, .access = PL0_RW, },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
@@ -7306,7 +7259,6 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
       .accessfn = aa64_zva_access,
 #endif
     },
-    REGINFO_SENTINEL
 };
 
 #endif
@@ -7352,7 +7304,6 @@ static const ARMCPRegInfo predinv_reginfo[] = {
     { .name = "CPPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 7,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
-    REGINFO_SENTINEL
 };
 
 static uint64_t ccsidr2_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -7367,7 +7318,6 @@ static const ARMCPRegInfo ccsidr2_reginfo[] = {
       .access = PL1_R,
       .accessfn = access_aa64_tid2,
       .readfn = ccsidr2_read, .type = ARM_CP_NO_RAW },
-    REGINFO_SENTINEL
 };
 
 static CPAccessResult access_aa64_tid3(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -7428,7 +7378,6 @@ static const ARMCPRegInfo jazelle_regs[] = {
       .cp = 14, .crn = 2, .crm = 0, .opc1 = 7, .opc2 = 0,
       .accessfn = access_joscr_jmcr,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo vhe_reginfo[] = {
@@ -7493,7 +7442,6 @@ static const ARMCPRegInfo vhe_reginfo[] = {
       .access = PL2_RW, .accessfn = e2h_access,
       .writefn = gt_virt_cval_write, .raw_writefn = raw_write },
 #endif
-    REGINFO_SENTINEL
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -7506,7 +7454,6 @@ static const ARMCPRegInfo ats1e1_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-    REGINFO_SENTINEL
 };
 
 static const ARMCPRegInfo ats1cp_reginfo[] = {
@@ -7518,7 +7465,6 @@ static const ARMCPRegInfo ats1cp_reginfo[] = {
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write },
-    REGINFO_SENTINEL
 };
 #endif
 
@@ -7540,7 +7486,6 @@ static const ARMCPRegInfo actlr2_hactlr2_reginfo[] = {
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 3,
       .access = PL2_RW, .type = ARM_CP_CONST,
       .resetvalue = 0 },
-    REGINFO_SENTINEL
 };
 
 void register_cp_regs_for_features(ARMCPU *cpu)
@@ -7647,7 +7592,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa32_tid3,
               .resetvalue = cpu->isar.id_isar6 },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, v6_idregs);
         define_arm_cp_regs(cpu, v6_cp_reginfo);
@@ -7915,7 +7859,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 7,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
               .resetvalue = cpu->pmceid1 },
-            REGINFO_SENTINEL
         };
 #ifdef CONFIG_USER_ONLY
         ARMCPRegUserSpaceInfo v8_user_idregs[] = {
@@ -7945,7 +7888,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .exported_bits = 0x000000f0ffffffff },
             { .name = "ID_AA64ISAR*_EL1_RESERVED",
               .is_glob = true                     },
-            REGUSERINFO_SENTINEL
         };
         modify_arm_cp_regs(v8_idregs, v8_user_idregs);
 #endif
@@ -7985,7 +7927,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL2_RW,
               .resetvalue = vmpidr_def,
               .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, vpidr_regs);
         define_arm_cp_regs(cpu, el2_cp_reginfo);
@@ -8024,7 +7965,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                   .access = PL2_RW, .accessfn = access_el3_aa32ns,
                   .type = ARM_CP_NO_RAW,
                   .writefn = arm_cp_write_ignore, .readfn = mpidr_read },
-                REGINFO_SENTINEL
             };
             define_arm_cp_regs(cpu, vpidr_regs);
             define_arm_cp_regs(cpu, el3_no_el2_cp_reginfo);
@@ -8047,7 +7987,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .raw_writefn = raw_write, .writefn = sctlr_write,
               .fieldoffset = offsetof(CPUARMState, cp15.sctlr_el[3]),
               .resetvalue = cpu->reset_sctlr },
-            REGINFO_SENTINEL
         };
 
         define_arm_cp_regs(cpu, el3_regs);
@@ -8182,7 +8121,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "DUMMY",
               .cp = 15, .crn = 0, .crm = 7, .opc1 = 0, .opc2 = CP_ANY,
               .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
-            REGINFO_SENTINEL
         };
         ARMCPRegInfo id_v8_midr_cp_reginfo[] = {
             { .name = "MIDR_EL1", .state = ARM_CP_STATE_BOTH,
@@ -8202,7 +8140,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R,
               .accessfn = access_aa64_tid1,
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
-            REGINFO_SENTINEL
         };
         ARMCPRegInfo id_cp_reginfo[] = {
             /* These are common to v8 and pre-v8 */
@@ -8220,7 +8157,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R,
               .accessfn = access_aa32_tid1,
               .type = ARM_CP_CONST, .resetvalue = 0 },
-            REGINFO_SENTINEL
         };
         /* TLBTR is specific to VMSA */
         ARMCPRegInfo id_tlbtr_reginfo = {
@@ -8247,25 +8183,23 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MIDR_EL1",
               .exported_bits = 0x00000000ffffffff },
             { .name = "REVIDR_EL1"                },
-            REGUSERINFO_SENTINEL
         };
         modify_arm_cp_regs(id_v8_midr_cp_reginfo, id_v8_user_midr_cp_reginfo);
 #endif
         if (arm_feature(env, ARM_FEATURE_OMAPCP) ||
             arm_feature(env, ARM_FEATURE_STRONGARM)) {
-            ARMCPRegInfo *r;
+            size_t i;
             /* Register the blanket "writes ignored" value first to cover the
              * whole space. Then update the specific ID registers to allow write
              * access, so that they ignore writes rather than causing them to
              * UNDEF.
              */
             define_one_arm_cp_reg(cpu, &crn0_wi_reginfo);
-            for (r = id_pre_v8_midr_cp_reginfo;
-                 r->type != ARM_CP_SENTINEL; r++) {
-                r->access = PL1_RW;
+            for (i = 0; i < ARRAY_SIZE(id_pre_v8_midr_cp_reginfo); ++i) {
+                id_pre_v8_midr_cp_reginfo[i].access = PL1_RW;
             }
-            for (r = id_cp_reginfo; r->type != ARM_CP_SENTINEL; r++) {
-                r->access = PL1_RW;
+            for (i = 0; i < ARRAY_SIZE(id_cp_reginfo); ++i) {
+                id_cp_reginfo[i].access = PL1_RW;
             }
             id_mpuir_reginfo.access = PL1_RW;
             id_tlbtr_reginfo.access = PL1_RW;
@@ -8288,13 +8222,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
               .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
-            REGINFO_SENTINEL
         };
 #ifdef CONFIG_USER_ONLY
         ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
             { .name = "MPIDR_EL1",
               .fixed_bits = 0x0000000080000000 },
-            REGUSERINFO_SENTINEL
         };
         modify_arm_cp_regs(mpidr_cp_reginfo, mpidr_user_cp_reginfo);
 #endif
@@ -8315,7 +8247,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 1,
               .access = PL3_RW, .type = ARM_CP_CONST,
               .resetvalue = 0 },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, auxcr_reginfo);
         if (cpu_isar_feature(aa32_ac2, cpu)) {
@@ -8350,7 +8281,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                   .type = ARM_CP_CONST,
                   .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 3, .opc2 = 0,
                   .access = PL1_R, .resetvalue = cpu->reset_cbar },
-                REGINFO_SENTINEL
             };
             /* We don't implement a r/w 64 bit CBAR currently */
             assert(arm_feature(env, ARM_FEATURE_CBAR_RO));
@@ -8380,7 +8310,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .bank_fieldoffsets = { offsetof(CPUARMState, cp15.vbar_s),
                                      offsetof(CPUARMState, cp15.vbar_ns) },
               .resetvalue = 0 },
-            REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, vbar_cp_reginfo);
     }
@@ -8834,8 +8763,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                    r->writefn);
         }
     }
-    /* Bad type field probably means missing sentinel at end of reg list */
-    assert(cptype_valid(r->type));
+
     for (crm = crmmin; crm <= crmmax; crm++) {
         for (opc1 = opc1min; opc1 <= opc1max; opc1++) {
             for (opc2 = opc2min; opc2 <= opc2max; opc2++) {
@@ -8881,13 +8809,13 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
     }
 }
 
-void define_arm_cp_regs_with_opaque(ARMCPU *cpu,
-                                    const ARMCPRegInfo *regs, void *opaque)
+/* Define a whole list of registers */
+void define_arm_cp_regs_with_opaque_len(ARMCPU *cpu, const ARMCPRegInfo *regs,
+                                        void *opaque, size_t len)
 {
-    /* Define a whole list of registers */
-    const ARMCPRegInfo *r;
-    for (r = regs; r->type != ARM_CP_SENTINEL; r++) {
-        define_one_arm_cp_reg_with_opaque(cpu, r, opaque);
+    size_t i;
+    for (i = 0; i < len; ++i) {
+        define_one_arm_cp_reg_with_opaque(cpu, regs + i, opaque);
     }
 }
 
@@ -8899,17 +8827,20 @@ void define_arm_cp_regs_with_opaque(ARMCPU *cpu,
  * user-space cannot alter any values and dynamic values pertaining to
  * execution state are hidden from user space view anyway.
  */
-void modify_arm_cp_regs(ARMCPRegInfo *regs, const ARMCPRegUserSpaceInfo *mods)
+void modify_arm_cp_regs_with_len(ARMCPRegInfo *regs, size_t regs_len,
+                                 const ARMCPRegUserSpaceInfo *mods,
+                                 size_t mods_len)
 {
-    const ARMCPRegUserSpaceInfo *m;
-    ARMCPRegInfo *r;
-
-    for (m = mods; m->name; m++) {
+    for (size_t mi = 0; mi < mods_len; ++mi) {
+        const ARMCPRegUserSpaceInfo *m = mods + mi;
         GPatternSpec *pat = NULL;
+
         if (m->is_glob) {
             pat = g_pattern_spec_new(m->name);
         }
-        for (r = regs; r->type != ARM_CP_SENTINEL; r++) {
+        for (size_t ri = 0; ri < regs_len; ++ri) {
+            ARMCPRegInfo *r = regs + ri;
+
             if (pat && g_pattern_match_string(pat, r->name)) {
                 r->type = ARM_CP_CONST;
                 r->access = PL0U_R;
-- 
2.25.1


