Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8317331A6C6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:21:59 +0100 (CET)
Received: from localhost ([::1]:47796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAft0-0008Q4-KD
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmH-0001wn-7T
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:01 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:54905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmE-0003Sb-BG
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:00 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mnac9-1la4JE1L9h-00jdyb; Fri, 12 Feb 2021 22:14:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] m68k: cascade m68k_features by m680xx_cpu_initfn() to
 improve readability
Date: Fri, 12 Feb 2021 22:14:43 +0100
Message-Id: <20210212211448.413489-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210212211448.413489-1-laurent@vivier.eu>
References: <20210212211448.413489-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pcg8Awb7X+Y33OMKVI87hrrTmgjHz14Dd/aht4PJ+khHp8HGr5K
 44ZCqlFTW9QZLmLrKIPJwXBxnKtrC3B+hQxBFlXDdbFEIP0l0uHdYQEpyCDzrPK+JvNy+PU
 WTKGXELkOlQvcwaILWLi9GWvB1S+xF9xilTjH9Pis1mK0nTuZMNw79hhicdwKdHqnLW/B+I
 WuosVRw/HnwTZRFREwVXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tP1Ft6yrwxU=:EZrRvjxnWBHlC+4RqF9OiV
 5uNfLM3X7hIJ75bX0thIddNJmCsq8+wI1MOmUHSzG5Duqxohq6nPgjWhz3nOGGjRv19y+2Gr8
 AYer0sA1W4lHFKbGp9472ouKg/6kTUb99DZz5fQtHpRtGZzgKePb9i4UKaYMi9tAaimhlQJqG
 P/Xwa9xL7XSGPsKaA0Mx4kjxtXaRhmkkFcbQxf4wbJY8f/1+9UDhZzrGEfqrUTyP5lhNjL2EK
 61q8U2aZtfmyD3fTnRCYluCPg9GtsNBC1+xbLd2jZQiBCpWxfsIYOwAPN6OMpLWdHn0Cblbus
 NOsp6kODuXSm3c/nz+TmzkGYEaUOHfIYE1Q2WaM1fPTg/urOMyRgGcvHAh4EcSa5awItIk7IC
 QC8Spd1DETaTIUCroPjK3Q2EF0HvMcCWMRF5VELhA1Ny0PkfOGDapQXa/Czq3r8sptZJeZbqt
 PDixobUmrw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Message-Id: <c652fe7537f8b4fe87a13ecbbc0ea751fb71532f.1612137712.git.balaton@eik.bme.hu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h |  1 +
 target/m68k/cpu.c | 72 +++++++++++++++++++++++++----------------------
 2 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 1d59cbb3f4ab..2b1cdf241bab 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -466,6 +466,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr);
 
 enum m68k_features {
     M68K_FEATURE_M68000,   /* Base m68k instruction set */
+    M68K_FEATURE_M68010,
     M68K_FEATURE_M68020,
     M68K_FEATURE_M68030,
     M68K_FEATURE_M68040,
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 5c72f2469471..d0f8bd44339c 100644
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
@@ -577,6 +580,7 @@ static const TypeInfo m68k_cpus_type_infos[] = {
         .class_init = m68k_cpu_class_init,
     },
     DEFINE_M68K_CPU_TYPE_M68K(m68000),
+    DEFINE_M68K_CPU_TYPE_M68K(m68010),
     DEFINE_M68K_CPU_TYPE_M68K(m68020),
     DEFINE_M68K_CPU_TYPE_M68K(m68030),
     DEFINE_M68K_CPU_TYPE_M68K(m68040),
-- 
2.29.2


