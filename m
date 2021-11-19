Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F214572D2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:24:28 +0100 (CET)
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6gd-0006yz-Gr
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:24:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6On-00065m-HE
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:01 -0500
Received: from [2a00:1450:4864:20::431] (port=42818
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Ol-0004N8-H4
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:01 -0500
Received: by mail-wr1-x431.google.com with SMTP id c4so18948059wrd.9
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8exqE87Bjdy/DSYC/o9ceeSlARYk7qq6FBzm+CHWIhc=;
 b=rS9Jt9JUoHf6nDqv79eIpwWIz4m9WBt3Sf42kvAlwzoGoiVAKk7ZIqPYLLPXRDN3jO
 X6EcY2JHao1S5XTdDOKsjldAc4ML5m6GGi7QspbGYqA4jbLTpn66Dj9+DUO7EdkdJycD
 Ij5gtYSlbxjmJjqbuF5nYCL37+Sf/8uFCFx6EUE7JtGZ02/8Tacget9Nh7e0YmZ61NIb
 PqIl/dYuPI/GQp+thnA1HOq2KsoLYv6gnd/L/7y/Jiy5uHpEgY3xD+5/j5Urnor13mNv
 3T31vpC9/82DkP0WapGQW/0Api7bDYYG6RNU2kJ/PfUXPSyAduvr0XrIQTyzw+VD5Ohp
 fbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8exqE87Bjdy/DSYC/o9ceeSlARYk7qq6FBzm+CHWIhc=;
 b=Z95risMe/TaT8OwPpZQo+t88WJhrZpKtJG7UfjvSLGfql9rdyHjZJALoflIRf4ZK4N
 fuyL7Jrw9Tn21YiiVSFsQP70L9L/jnBtq6KXoALXC64g///n0oDz5MUbWe9wMAyhl5PV
 QGtAdFV6LE81bH21WoCG51n5lPYdxzvYUNoTDbIxVTJzVGnjXUYbq87lF3txH+Kgoxfv
 JzHb/YAsuhzX7k3WimC+sSZsYxZQn2D5YelE8iseq/2d+GU3qETSTTkgzAsAxNrzOAze
 z1bE1oWVcvL30PW6RPu8ULeUSdxTlBOWd+qcp8+WkWUx7dBxiQM0kCjMWxUm1aoQaaNV
 FZUA==
X-Gm-Message-State: AOAM531Eaa8EWxV+dwFtPV/PucKI/aFBs7kHKFFeNP4phSF4nhmIfc7d
 LKa9shg5Q5ju3r61d4QCrjAxVUdAcrXg1O9QrRY=
X-Google-Smtp-Source: ABdhPJwU/w1h6gcSCf8vI1xaKCPTMXRkq8ZEiDai6T6QtMHM+y4yuADd6mlqji0lpys9Jc+XTUYPSw==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr8659784wrr.152.1637337958107; 
 Fri, 19 Nov 2021 08:05:58 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/35] target/ppc: Split out do_frsp
Date: Fri, 19 Nov 2021 17:04:48 +0100
Message-Id: <20211119160502.17432-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Calling helper_frsp directly from other helpers generates
the incorrect retaddr.  Split out a helper that takes the
retaddr as a parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index e0c35a3977..e91a6b0212 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -673,7 +673,7 @@ FPU_FMADD(fmsub, MSUB_FLGS)
 FPU_FMADD(fnmsub, NMSUB_FLGS)
 
 /* frsp - frsp. */
-uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
+static uint64_t do_frsp(CPUPPCState *env, uint64_t arg, uintptr_t retaddr)
 {
     CPU_DoubleU farg;
     float32 f32;
@@ -681,7 +681,7 @@ uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
     farg.ll = arg;
 
     if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
-        float_invalid_op_vxsnan(env, GETPC());
+        float_invalid_op_vxsnan(env, retaddr);
     }
     f32 = float64_to_float32(farg.d, &env->fp_status);
     farg.d = float32_to_float64(f32, &env->fp_status);
@@ -689,6 +689,11 @@ uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
     return farg.ll;
 }
 
+uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
+{
+    return do_frsp(env, arg, GETPC());
+}
+
 /* fsqrt - fsqrt. */
 float64 helper_fsqrt(CPUPPCState *env, float64 arg)
 {
@@ -1578,7 +1583,7 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                          \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
-            t.fld = helper_frsp(env, t.fld);                                 \
+            t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
         if (sfprf) {                                                         \
@@ -1654,7 +1659,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                            \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
-            t.fld = helper_frsp(env, t.fld);                                 \
+            t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
         if (sfprf) {                                                         \
@@ -1728,7 +1733,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
         }                                                                     \
                                                                               \
         if (r2sp) {                                                           \
-            t.fld = helper_frsp(env, t.fld);                                  \
+            t.fld = do_frsp(env, t.fld, GETPC());                             \
         }                                                                     \
                                                                               \
         if (sfprf) {                                                          \
@@ -1796,7 +1801,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
         t.fld = tp##_div(tp##_one, xb->fld, &env->fp_status);                 \
                                                                               \
         if (r2sp) {                                                           \
-            t.fld = helper_frsp(env, t.fld);                                  \
+            t.fld = do_frsp(env, t.fld, GETPC());                             \
         }                                                                     \
                                                                               \
         if (sfprf) {                                                          \
@@ -1844,7 +1849,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
-            t.fld = helper_frsp(env, t.fld);                                 \
+            t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
         if (sfprf) {                                                         \
@@ -1893,7 +1898,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
-            t.fld = helper_frsp(env, t.fld);                                 \
+            t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
         if (sfprf) {                                                         \
@@ -2064,7 +2069,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
         }                                                                     \
                                                                               \
         if (r2sp) {                                                           \
-            t.fld = helper_frsp(env, t.fld);                                  \
+            t.fld = do_frsp(env, t.fld, GETPC());                             \
         }                                                                     \
                                                                               \
         if (sfprf) {                                                          \
@@ -2803,7 +2808,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
     for (i = 0; i < nels; i++) {                                        \
         t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);             \
         if (r2sp) {                                                     \
-            t.tfld = helper_frsp(env, t.tfld);                          \
+            t.tfld = do_frsp(env, t.tfld, GETPC());                     \
         }                                                               \
         if (sfprf) {                                                    \
             helper_compute_fprf_float64(env, t.tfld);                   \
@@ -2928,7 +2933,7 @@ uint64_t helper_xsrsp(CPUPPCState *env, uint64_t xb)
 {
     helper_reset_fpstatus(env);
 
-    uint64_t xt = helper_frsp(env, xb);
+    uint64_t xt = do_frsp(env, xb, GETPC());
 
     helper_compute_fprf_float64(env, xt);
     do_float_check_status(env, GETPC());
-- 
2.25.1


