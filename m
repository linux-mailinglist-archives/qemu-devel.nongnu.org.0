Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D0D309FB0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 01:24:19 +0100 (CET)
Received: from localhost ([::1]:51710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6N0s-0007u8-Cx
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 19:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6Mvf-0001nd-7N
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:18:55 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:54901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6MvX-00017e-NR
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:18:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A9A7E746351;
 Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1871D746353; Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Message-Id: <c652fe7537f8b4fe87a13ecbbc0ea751fb71532f.1612137712.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1612137712.git.balaton@eik.bme.hu>
References: <cover.1612137712.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/6] m68k: cascade m68k_features by m680xx_cpu_initfn() to
 improve readability
Date: Mon, 01 Feb 2021 01:01:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>

The m680XX_cpu_initfn functions have been rearranged to cascade starting from
the base 68000, so that the 68010 then inherits from this, and so on until the
68060.

This makes it simpler to track features since in most cases the m68k were
product enhancements on each other, with only a few instructions being retired.

Because each cpu class inherits the previous CPU class, then for example
the 68020 also has the feature 68010, and 68000 and so on upto the 68060.

- Added 68010 cpu class, and moved correct features into 68000/68010.
- Added m68k_unset_feature to allow removing a feature in the inheritence

Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/m68k/cpu.c | 72 +++++++++++++++++++++++++----------------------
 target/m68k/cpu.h |  1 +
 2 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index ccf1c490c0..5e7aec5b13 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -41,6 +41,11 @@ static void m68k_set_feature(CPUM68KState *env, int feature)
     env->features |= (1u << feature);
 }
 
+static void m68k_unset_feature(CPUM68KState *env, int feature)
+{
+    env->features &= (-1u - (1u << feature));
+}
+
 static void m68k_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
@@ -115,25 +120,18 @@ static void m68000_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_MOVEP);
 }
 
-/* common features for 68020, 68030 and 68040 */
-static void m680x0_cpu_common(CPUM68KState *env)
+/*
+ * Adds BKPT, MOVE-from-SR *now priv instr, and MOVEC, MOVES, RTD
+ */
+static void m68010_cpu_initfn(Object *obj)
 {
-    m68k_set_feature(env, M68K_FEATURE_M68000);
-    m68k_set_feature(env, M68K_FEATURE_USP);
-    m68k_set_feature(env, M68K_FEATURE_WORD_INDEX);
-    m68k_set_feature(env, M68K_FEATURE_QUAD_MULDIV);
-    m68k_set_feature(env, M68K_FEATURE_BRAL);
-    m68k_set_feature(env, M68K_FEATURE_BCCL);
-    m68k_set_feature(env, M68K_FEATURE_BITFIELD);
-    m68k_set_feature(env, M68K_FEATURE_EXT_FULL);
-    m68k_set_feature(env, M68K_FEATURE_SCALED_INDEX);
-    m68k_set_feature(env, M68K_FEATURE_LONG_MULDIV);
-    m68k_set_feature(env, M68K_FEATURE_FPU);
-    m68k_set_feature(env, M68K_FEATURE_CAS);
-    m68k_set_feature(env, M68K_FEATURE_BKPT);
+    M68kCPU *cpu = M68K_CPU(obj);
+    CPUM68KState *env = &cpu->env;
+
+    m68000_cpu_initfn(obj);
+    m68k_set_feature(env, M68K_FEATURE_M68010);
     m68k_set_feature(env, M68K_FEATURE_RTD);
-    m68k_set_feature(env, M68K_FEATURE_CHK2);
-    m68k_set_feature(env, M68K_FEATURE_MOVEP);
+    m68k_set_feature(env, M68K_FEATURE_BKPT);
 }
 
 /*
@@ -148,8 +146,19 @@ static void m68020_cpu_initfn(Object *obj)
     M68kCPU *cpu = M68K_CPU(obj);
     CPUM68KState *env = &cpu->env;
 
-    m680x0_cpu_common(env);
+    m68010_cpu_initfn(obj);
+    m68k_unset_feature(env, M68K_FEATURE_M68010);
     m68k_set_feature(env, M68K_FEATURE_M68020);
+    m68k_set_feature(env, M68K_FEATURE_QUAD_MULDIV);
+    m68k_set_feature(env, M68K_FEATURE_BRAL);
+    m68k_set_feature(env, M68K_FEATURE_BCCL);
+    m68k_set_feature(env, M68K_FEATURE_BITFIELD);
+    m68k_set_feature(env, M68K_FEATURE_EXT_FULL);
+    m68k_set_feature(env, M68K_FEATURE_SCALED_INDEX);
+    m68k_set_feature(env, M68K_FEATURE_LONG_MULDIV);
+    m68k_set_feature(env, M68K_FEATURE_FPU);
+    m68k_set_feature(env, M68K_FEATURE_CAS);
+    m68k_set_feature(env, M68K_FEATURE_CHK2);
 }
 
 /*
@@ -165,7 +174,8 @@ static void m68030_cpu_initfn(Object *obj)
     M68kCPU *cpu = M68K_CPU(obj);
     CPUM68KState *env = &cpu->env;
 
-    m680x0_cpu_common(env);
+    m68020_cpu_initfn(obj);
+    m68k_unset_feature(env, M68K_FEATURE_M68020);
     m68k_set_feature(env, M68K_FEATURE_M68030);
 }
 
@@ -191,7 +201,8 @@ static void m68040_cpu_initfn(Object *obj)
     M68kCPU *cpu = M68K_CPU(obj);
     CPUM68KState *env = &cpu->env;
 
-    m680x0_cpu_common(env);
+    m68030_cpu_initfn(obj);
+    m68k_unset_feature(env, M68K_FEATURE_M68030);
     m68k_set_feature(env, M68K_FEATURE_M68040);
 }
 
@@ -211,21 +222,13 @@ static void m68060_cpu_initfn(Object *obj)
     M68kCPU *cpu = M68K_CPU(obj);
     CPUM68KState *env = &cpu->env;
 
-    m68k_set_feature(env, M68K_FEATURE_M68000);
-    m68k_set_feature(env, M68K_FEATURE_USP);
-    m68k_set_feature(env, M68K_FEATURE_WORD_INDEX);
-    m68k_set_feature(env, M68K_FEATURE_BRAL);
-    m68k_set_feature(env, M68K_FEATURE_BCCL);
-    m68k_set_feature(env, M68K_FEATURE_BITFIELD);
-    m68k_set_feature(env, M68K_FEATURE_EXT_FULL);
-    m68k_set_feature(env, M68K_FEATURE_SCALED_INDEX);
-    m68k_set_feature(env, M68K_FEATURE_LONG_MULDIV);
-    m68k_set_feature(env, M68K_FEATURE_FPU);
-    m68k_set_feature(env, M68K_FEATURE_CAS);
-    m68k_set_feature(env, M68K_FEATURE_BKPT);
-    m68k_set_feature(env, M68K_FEATURE_RTD);
-    m68k_set_feature(env, M68K_FEATURE_CHK2);
+    m68040_cpu_initfn(obj);
+    m68k_unset_feature(env, M68K_FEATURE_M68040);
     m68k_set_feature(env, M68K_FEATURE_M68060);
+    m68k_unset_feature(env, M68K_FEATURE_MOVEP);
+
+    /* Implemented as a software feature */
+    m68k_unset_feature(env, M68K_FEATURE_QUAD_MULDIV);
 }
 
 static void m5208_cpu_initfn(Object *obj)
@@ -568,6 +571,7 @@ static const TypeInfo m68k_cpus_type_infos[] = {
         .class_init = m68k_cpu_class_init,
     },
     DEFINE_M68K_CPU_TYPE_M68K(m68000),
+    DEFINE_M68K_CPU_TYPE_M68K(m68010),
     DEFINE_M68K_CPU_TYPE_M68K(m68020),
     DEFINE_M68K_CPU_TYPE_M68K(m68030),
     DEFINE_M68K_CPU_TYPE_M68K(m68040),
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 1d59cbb3f4..2b1cdf241b 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -466,6 +466,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr);
 
 enum m68k_features {
     M68K_FEATURE_M68000,   /* Base m68k instruction set */
+    M68K_FEATURE_M68010,
     M68K_FEATURE_M68020,
     M68K_FEATURE_M68030,
     M68K_FEATURE_M68040,
-- 
2.21.3


