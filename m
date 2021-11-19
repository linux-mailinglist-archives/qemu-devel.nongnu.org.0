Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050B2457297
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:16:03 +0100 (CET)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6YU-0005nd-3P
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:16:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OV-0005O6-Ng
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:44 -0500
Received: from [2a00:1450:4864:20::32b] (port=51804
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OQ-0004F4-RU
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id 137so5441727wma.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IsAToUwUVLDcozC1pG2ovGOaIzPzHG9E8BtEJFyTiBE=;
 b=qes/w0s+NjS3EdpMtiwDv5Lcyrj8EHFM+q09Ux92C5pqmB3v0H7NniY7+dA2AXoCp0
 w/O2bHdrv8l2V8OeU3XGJUKEwZFUf3mSd3wUQGYcs7ZDxHcQ1UKAcavLiZ3/cTM2ETQM
 IR8FFrC8BngzEpRbnt+AR5YV2L6pNg84POPncKpTXncYLSU2Q3+6f3QtAMEJEco5ddSB
 N1MEB10+vd0KJthFdVW8HuY6bN5JH1LNJTVHZa/gKhlcRxtG0ssf3rUn1OnWyKUajZKI
 Dj6hKkUthmSLbYPH7IO6/KUQW3O64GtDhdmv1u0Iqn2kq4QF8o3/OBEqf+yUXKqKKvNK
 eRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IsAToUwUVLDcozC1pG2ovGOaIzPzHG9E8BtEJFyTiBE=;
 b=xjtLfyan3cGMf7JwAotd0Y+IGqrwDB0WtbBSC0IBW2toCvVGCWtYnAIe+6yjTvOnKj
 Px8AkKCdLUS9RlB3slr7w4kY1yREuDf6P35QxDhaST7ZEY3NXljYv7nVaw2f7P5O1fN/
 b9QBpm8V4XzlIJec+ZZ8VRwD6dRb6ihjHfN8cmqStB2VFCH+Rf8RBe+Yq80ZE3vu6jgf
 Snfpgxpellsk5wsNJWzGGdSciaNLwS5bcE718Vznv5AQRmGVPi0yMS0KMzTfhHotGjQ2
 EFCD3r5QTX4m00suyKsjsfP8bEtDT6jLsdAb3ke4fmdXMNVwK3UslVf0jXb4UNUTHgq0
 cnAg==
X-Gm-Message-State: AOAM531iUDPlCeSNPgu7gJpfQEwIuSQj2xpDbt6GYI22UGd97doXMgq6
 f/WwTQwuhxsOFPH3H1LbQYFtcZQKt9z9SRtkGOA=
X-Google-Smtp-Source: ABdhPJz7FfTGXKW3IiPIBplbeVRoTs4Ot7aEhyPyRQ3ju1rS+dZJvquOOYb8c9b5Ga7RdGfGLy4pZw==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr835709wmc.89.1637337936157;
 Fri, 19 Nov 2021 08:05:36 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/35] target/ppc: Update float_invalid_cvt for new flags
Date: Fri, 19 Nov 2021 17:04:39 +0100
Message-Id: <20211119160502.17432-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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

Now that vxsnan is computed directly by softfloat,
we don't need to recompute it via classes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 0d58fd82a6..6b8367a105 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -537,11 +537,11 @@ float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
     return ret;
 }
 
-static void float_invalid_cvt(CPUPPCState *env, bool set_fprc,
-                              uintptr_t retaddr, int class1)
+static void float_invalid_cvt(CPUPPCState *env, int flags,
+                              bool set_fprc, uintptr_t retaddr)
 {
     float_invalid_op_vxcvi(env, set_fprc, retaddr);
-    if (class1 & is_snan) {
+    if (flags & float_flag_invalid_snan) {
         float_invalid_op_vxsnan(env, retaddr);
     }
 }
@@ -550,10 +550,10 @@ static void float_invalid_cvt(CPUPPCState *env, bool set_fprc,
 uint64_t helper_##op(CPUPPCState *env, float64 arg)                    \
 {                                                                      \
     uint64_t ret = float64_to_##cvt(arg, &env->fp_status);             \
-    int status = get_float_exception_flags(&env->fp_status);           \
+    int flags = get_float_exception_flags(&env->fp_status);            \
                                                                        \
-    if (unlikely(status & float_flag_invalid)) {                       \
-        float_invalid_cvt(env, 1, GETPC(), float64_classify(arg));     \
+    if (unlikely(flags & float_flag_invalid)) {                        \
+        float_invalid_cvt(env, flags, 1, GETPC());                     \
         ret = nanval;                                                  \
     }                                                                  \
     return ret;                                                        \
@@ -2746,7 +2746,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
         t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);  \
         flags = env->fp_status.float_exception_flags;                        \
         if (unlikely(flags & float_flag_invalid)) {                          \
-            float_invalid_cvt(env, 0, GETPC(), stp##_classify(xb->sfld));    \
+            float_invalid_cvt(env, flags, 0, GETPC());                       \
             t.tfld = rnan;                                                   \
         }                                                                    \
         all_flags |= flags;                                                  \
@@ -2789,10 +2789,12 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
                  ppc_vsr_t *xt, ppc_vsr_t *xb)                               \
 {                                                                            \
     ppc_vsr_t t = { };                                                       \
+    int flags;                                                               \
                                                                              \
     t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);      \
-    if (env->fp_status.float_exception_flags & float_flag_invalid) {         \
-        float_invalid_cvt(env, 0, GETPC(), stp##_classify(xb->sfld));        \
+    flags = get_float_exception_flags(&env->fp_status);                      \
+    if (flags & float_flag_invalid) {                                        \
+        float_invalid_cvt(env, flags, 0, GETPC());                           \
         t.tfld = rnan;                                                       \
     }                                                                        \
                                                                              \
-- 
2.25.1


