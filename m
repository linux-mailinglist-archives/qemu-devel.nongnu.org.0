Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4CD1C97B0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 19:26:58 +0200 (CEST)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWkIU-00067f-0A
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 13:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jWkFc-0002WV-1W
 for qemu-devel@nongnu.org; Thu, 07 May 2020 13:24:00 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:54468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jWkFa-0005dC-6a
 for qemu-devel@nongnu.org; Thu, 07 May 2020 13:23:59 -0400
Received: by mail-pj1-x1043.google.com with SMTP id y6so2928563pjc.4
 for <qemu-devel@nongnu.org>; Thu, 07 May 2020 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2DQpsSbPPqEK+3jJ9A20BSZR+dC3kPvOeIa6yLItyTw=;
 b=VIxEcAb4JqtPhnFikLX2+lVCuun0kFpwCTO7MmfAqfL1u9DSnL9i0FdSEg/dUDGIES
 0h1OkknqNrtcCis62yz6UtzxsL7DYzHmDr7GYwsOdXXdTpQZeRH5g6hxATtjGLEVbyf0
 KaLHWr9lOXzb/3PWkE6pV9ETS3p9h3aShACAtUhqBqjgabDJf9BwODfr8RIyvMAjfOb8
 wyVFs4h9ra/VmhRR1NqBRBmi89BR53Vsxl9gBHyGnrS+bfogXLiqKOH+iSh96P3Rs+sy
 SV6LbYwR92Mx6u66DYLlPVRMC3hsLWsIzZybvrjCIZrthD/1iSX3E1sgfJtLhhWphY5h
 a2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2DQpsSbPPqEK+3jJ9A20BSZR+dC3kPvOeIa6yLItyTw=;
 b=e0epVInsW6eb12RWJelf71eka67DEjjk0SxCFoDSubShypxgalcoYdmwrSgB9COSFF
 t61FdUvSmWyHtPt7pcTiZTAitqO5aHpvWQsaxxhEpg6L4Hiq319gxGWh1yHY+YOW5jgX
 OQ6a9ifNUSkj4w39hAKQz/+fHAwTRUl/BKMPu/wW2nuWeor8gZ06cjXuQ0acvdYaKE9d
 NQk9xNnNZao9W+tloVrwWKEpCK8Vsm0VpMdt8e2xUsATOo/GuplJ2BixK3IR6MhUC3T+
 YVLmnL8meyKiGE9Df6Xr3l0Lf/jjs01bh9W6sw7cOW0HceyZELBizBa1+vEpuzqV7I48
 4eIA==
X-Gm-Message-State: AGi0PuYiuD8tzxkZxoad8HuUga/6eUz5ZRiC20yBMuozQeLmKV0iQuvz
 gVUkr3SOtTIkMZN+yvghSQFMQ0lXlC4=
X-Google-Smtp-Source: APiQypJXOXsYanURnreQgevgRNiees80lvmDxC4ph+XOuUt1DhhQiGR0DjokM/CrhuvtvLeiwJVLRg==
X-Received: by 2002:a17:90a:db91:: with SMTP id
 h17mr1089229pjv.7.1588872235795; 
 Thu, 07 May 2020 10:23:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 19sm312228pjl.52.2020.05.07.10.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 10:23:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] target/arm: Use tcg_gen_gvec_5_ptr for sve FMLA/FCMLA
Date: Thu,  7 May 2020 10:23:49 -0700
Message-Id: <20200507172352.15418-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507172352.15418-1-richard.henderson@linaro.org>
References: <20200507172352.15418-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we can pass 7 parameters, do not encode register
operands within simd_data.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Remove gen_helper_sve_fmla typedef (phil).
---
 target/arm/helper-sve.h    |  45 +++++++----
 target/arm/sve_helper.c    | 157 ++++++++++++++-----------------------
 target/arm/translate-sve.c |  70 ++++++-----------
 3 files changed, 114 insertions(+), 158 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 2f47279155..7a200755ac 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1099,25 +1099,40 @@ DEF_HELPER_FLAGS_6(sve_fcadd_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fcadd_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmla_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmla_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmla_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmls_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmls_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fmls_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmla_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmla_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmla_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmls_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmls_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fnmls_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_fcmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fcmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
-DEF_HELPER_FLAGS_3(sve_fcmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fcmla_zpzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fcmla_zpzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_7(sve_fcmla_zpzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve_ftmad_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fdfa652094..33b5a54a47 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3372,23 +3372,11 @@ DO_ZPZ_FP(sve_ucvt_dd, uint64_t,     , uint64_to_float64)
 
 #undef DO_ZPZ_FP
 
-/* 4-operand predicated multiply-add.  This requires 7 operands to pass
- * "properly", so we need to encode some of the registers into DESC.
- */
-QEMU_BUILD_BUG_ON(SIMD_DATA_SHIFT + 20 > 32);
-
-static void do_fmla_zpzzz_h(CPUARMState *env, void *vg, uint32_t desc,
+static void do_fmla_zpzzz_h(void *vd, void *vn, void *vm, void *va, void *vg,
+                            float_status *status, uint32_t desc,
                             uint16_t neg1, uint16_t neg3)
 {
     intptr_t i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     do {
@@ -3401,45 +3389,42 @@ static void do_fmla_zpzzz_h(CPUARMState *env, void *vg, uint32_t desc,
                 e1 = *(uint16_t *)(vn + H1_2(i)) ^ neg1;
                 e2 = *(uint16_t *)(vm + H1_2(i));
                 e3 = *(uint16_t *)(va + H1_2(i)) ^ neg3;
-                r = float16_muladd(e1, e2, e3, 0, &env->vfp.fp_status_f16);
+                r = float16_muladd(e1, e2, e3, 0, status);
                 *(uint16_t *)(vd + H1_2(i)) = r;
             }
         } while (i & 63);
     } while (i != 0);
 }
 
-void HELPER(sve_fmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(env, vg, desc, 0, 0);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0);
 }
 
-void HELPER(sve_fmls_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(env, vg, desc, 0x8000, 0);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0);
 }
 
-void HELPER(sve_fnmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(env, vg, desc, 0x8000, 0x8000);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0x8000, 0x8000);
 }
 
-void HELPER(sve_fnmls_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmls_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_h(env, vg, desc, 0, 0x8000);
+    do_fmla_zpzzz_h(vd, vn, vm, va, vg, status, desc, 0, 0x8000);
 }
 
-static void do_fmla_zpzzz_s(CPUARMState *env, void *vg, uint32_t desc,
+static void do_fmla_zpzzz_s(void *vd, void *vn, void *vm, void *va, void *vg,
+                            float_status *status, uint32_t desc,
                             uint32_t neg1, uint32_t neg3)
 {
     intptr_t i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     do {
@@ -3452,45 +3437,42 @@ static void do_fmla_zpzzz_s(CPUARMState *env, void *vg, uint32_t desc,
                 e1 = *(uint32_t *)(vn + H1_4(i)) ^ neg1;
                 e2 = *(uint32_t *)(vm + H1_4(i));
                 e3 = *(uint32_t *)(va + H1_4(i)) ^ neg3;
-                r = float32_muladd(e1, e2, e3, 0, &env->vfp.fp_status);
+                r = float32_muladd(e1, e2, e3, 0, status);
                 *(uint32_t *)(vd + H1_4(i)) = r;
             }
         } while (i & 63);
     } while (i != 0);
 }
 
-void HELPER(sve_fmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(env, vg, desc, 0, 0);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0);
 }
 
-void HELPER(sve_fmls_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(env, vg, desc, 0x80000000, 0);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0);
 }
 
-void HELPER(sve_fnmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(env, vg, desc, 0x80000000, 0x80000000);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0x80000000, 0x80000000);
 }
 
-void HELPER(sve_fnmls_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmls_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_s(env, vg, desc, 0, 0x80000000);
+    do_fmla_zpzzz_s(vd, vn, vm, va, vg, status, desc, 0, 0x80000000);
 }
 
-static void do_fmla_zpzzz_d(CPUARMState *env, void *vg, uint32_t desc,
+static void do_fmla_zpzzz_d(void *vd, void *vn, void *vm, void *va, void *vg,
+                            float_status *status, uint32_t desc,
                             uint64_t neg1, uint64_t neg3)
 {
     intptr_t i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     do {
@@ -3503,31 +3485,35 @@ static void do_fmla_zpzzz_d(CPUARMState *env, void *vg, uint32_t desc,
                 e1 = *(uint64_t *)(vn + i) ^ neg1;
                 e2 = *(uint64_t *)(vm + i);
                 e3 = *(uint64_t *)(va + i) ^ neg3;
-                r = float64_muladd(e1, e2, e3, 0, &env->vfp.fp_status);
+                r = float64_muladd(e1, e2, e3, 0, status);
                 *(uint64_t *)(vd + i) = r;
             }
         } while (i & 63);
     } while (i != 0);
 }
 
-void HELPER(sve_fmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(env, vg, desc, 0, 0);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, 0);
 }
 
-void HELPER(sve_fmls_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                              void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(env, vg, desc, INT64_MIN, 0);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, 0);
 }
 
-void HELPER(sve_fnmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(env, vg, desc, INT64_MIN, INT64_MIN);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, INT64_MIN, INT64_MIN);
 }
 
-void HELPER(sve_fnmls_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fnmls_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
-    do_fmla_zpzzz_d(env, vg, desc, 0, INT64_MIN);
+    do_fmla_zpzzz_d(vd, vn, vm, va, vg, status, desc, 0, INT64_MIN);
 }
 
 /* Two operand floating-point comparison controlled by a predicate.
@@ -3809,22 +3795,13 @@ void HELPER(sve_fcadd_d)(void *vd, void *vn, void *vm, void *vg,
  * FP Complex Multiply
  */
 
-QEMU_BUILD_BUG_ON(SIMD_DATA_SHIFT + 22 > 32);
-
-void HELPER(sve_fcmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fcmla_zpzzz_h)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
     intptr_t j, i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    unsigned rot = extract32(desc, SIMD_DATA_SHIFT + 20, 2);
+    unsigned rot = simd_data(desc);
     bool flip = rot & 1;
     float16 neg_imag, neg_real;
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     neg_imag = float16_set_sign(0, (rot & 2) != 0);
@@ -3851,32 +3828,25 @@ void HELPER(sve_fcmla_zpzzz_h)(CPUARMState *env, void *vg, uint32_t desc)
 
             if (likely((pg >> (i & 63)) & 1)) {
                 d = *(float16 *)(va + H1_2(i));
-                d = float16_muladd(e2, e1, d, 0, &env->vfp.fp_status_f16);
+                d = float16_muladd(e2, e1, d, 0, status);
                 *(float16 *)(vd + H1_2(i)) = d;
             }
             if (likely((pg >> (j & 63)) & 1)) {
                 d = *(float16 *)(va + H1_2(j));
-                d = float16_muladd(e4, e3, d, 0, &env->vfp.fp_status_f16);
+                d = float16_muladd(e4, e3, d, 0, status);
                 *(float16 *)(vd + H1_2(j)) = d;
             }
         } while (i & 63);
     } while (i != 0);
 }
 
-void HELPER(sve_fcmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fcmla_zpzzz_s)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
     intptr_t j, i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    unsigned rot = extract32(desc, SIMD_DATA_SHIFT + 20, 2);
+    unsigned rot = simd_data(desc);
     bool flip = rot & 1;
     float32 neg_imag, neg_real;
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     neg_imag = float32_set_sign(0, (rot & 2) != 0);
@@ -3903,32 +3873,25 @@ void HELPER(sve_fcmla_zpzzz_s)(CPUARMState *env, void *vg, uint32_t desc)
 
             if (likely((pg >> (i & 63)) & 1)) {
                 d = *(float32 *)(va + H1_2(i));
-                d = float32_muladd(e2, e1, d, 0, &env->vfp.fp_status);
+                d = float32_muladd(e2, e1, d, 0, status);
                 *(float32 *)(vd + H1_2(i)) = d;
             }
             if (likely((pg >> (j & 63)) & 1)) {
                 d = *(float32 *)(va + H1_2(j));
-                d = float32_muladd(e4, e3, d, 0, &env->vfp.fp_status);
+                d = float32_muladd(e4, e3, d, 0, status);
                 *(float32 *)(vd + H1_2(j)) = d;
             }
         } while (i & 63);
     } while (i != 0);
 }
 
-void HELPER(sve_fcmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
+void HELPER(sve_fcmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
+                               void *vg, void *status, uint32_t desc)
 {
     intptr_t j, i = simd_oprsz(desc);
-    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);
-    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);
-    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);
-    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);
-    unsigned rot = extract32(desc, SIMD_DATA_SHIFT + 20, 2);
+    unsigned rot = simd_data(desc);
     bool flip = rot & 1;
     float64 neg_imag, neg_real;
-    void *vd = &env->vfp.zregs[rd];
-    void *vn = &env->vfp.zregs[rn];
-    void *vm = &env->vfp.zregs[rm];
-    void *va = &env->vfp.zregs[ra];
     uint64_t *g = vg;
 
     neg_imag = float64_set_sign(0, (rot & 2) != 0);
@@ -3955,12 +3918,12 @@ void HELPER(sve_fcmla_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
 
             if (likely((pg >> (i & 63)) & 1)) {
                 d = *(float64 *)(va + H1_2(i));
-                d = float64_muladd(e2, e1, d, 0, &env->vfp.fp_status);
+                d = float64_muladd(e2, e1, d, 0, status);
                 *(float64 *)(vd + H1_2(i)) = d;
             }
             if (likely((pg >> (j & 63)) & 1)) {
                 d = *(float64 *)(va + H1_2(j));
-                d = float64_muladd(e4, e3, d, 0, &env->vfp.fp_status);
+                d = float64_muladd(e4, e3, d, 0, status);
                 *(float64 *)(vd + H1_2(j)) = d;
             }
         } while (i & 63);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6c8bda4e4c..c8649283be 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3946,42 +3946,30 @@ static bool trans_FCADD(DisasContext *s, arg_FCADD *a)
     return true;
 }
 
-typedef void gen_helper_sve_fmla(TCGv_env, TCGv_ptr, TCGv_i32);
-
-static bool do_fmla(DisasContext *s, arg_rprrr_esz *a, gen_helper_sve_fmla *fn)
+static bool do_fmla(DisasContext *s, arg_rprrr_esz *a,
+                    gen_helper_gvec_5_ptr *fn)
 {
-    if (fn == NULL) {
+    if (a->esz == 0) {
         return false;
     }
-    if (!sve_access_check(s)) {
-        return true;
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_5_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, 0, fn);
+        tcg_temp_free_ptr(status);
     }
-
-    unsigned vsz = vec_full_reg_size(s);
-    unsigned desc;
-    TCGv_i32 t_desc;
-    TCGv_ptr pg = tcg_temp_new_ptr();
-
-    /* We would need 7 operands to pass these arguments "properly".
-     * So we encode all the register numbers into the descriptor.
-     */
-    desc = deposit32(a->rd, 5, 5, a->rn);
-    desc = deposit32(desc, 10, 5, a->rm);
-    desc = deposit32(desc, 15, 5, a->ra);
-    desc = simd_desc(vsz, vsz, desc);
-
-    t_desc = tcg_const_i32(desc);
-    tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
-    fn(cpu_env, pg, t_desc);
-    tcg_temp_free_i32(t_desc);
-    tcg_temp_free_ptr(pg);
     return true;
 }
 
 #define DO_FMLA(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rprrr_esz *a)          \
 {                                                                    \
-    static gen_helper_sve_fmla * const fns[4] = {                    \
+    static gen_helper_gvec_5_ptr * const fns[4] = {                  \
         NULL, gen_helper_sve_##name##_h,                             \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d         \
     };                                                               \
@@ -3997,7 +3985,8 @@ DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz)
 
 static bool trans_FCMLA_zpzzz(DisasContext *s, arg_FCMLA_zpzzz *a)
 {
-    static gen_helper_sve_fmla * const fns[3] = {
+    static gen_helper_gvec_5_ptr * const fns[4] = {
+        NULL,
         gen_helper_sve_fcmla_zpzzz_h,
         gen_helper_sve_fcmla_zpzzz_s,
         gen_helper_sve_fcmla_zpzzz_d,
@@ -4008,25 +3997,14 @@ static bool trans_FCMLA_zpzzz(DisasContext *s, arg_FCMLA_zpzzz *a)
     }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        unsigned desc;
-        TCGv_i32 t_desc;
-        TCGv_ptr pg = tcg_temp_new_ptr();
-
-        /* We would need 7 operands to pass these arguments "properly".
-         * So we encode all the register numbers into the descriptor.
-         */
-        desc = deposit32(a->rd, 5, 5, a->rn);
-        desc = deposit32(desc, 10, 5, a->rm);
-        desc = deposit32(desc, 15, 5, a->ra);
-        desc = deposit32(desc, 20, 2, a->rot);
-        desc = sextract32(desc, 0, 22);
-        desc = simd_desc(vsz, vsz, desc);
-
-        t_desc = tcg_const_i32(desc);
-        tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
-        fns[a->esz - 1](cpu_env, pg, t_desc);
-        tcg_temp_free_i32(t_desc);
-        tcg_temp_free_ptr(pg);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_5_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, a->rot, fns[a->esz]);
+        tcg_temp_free_ptr(status);
     }
     return true;
 }
-- 
2.20.1


