Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22BE2AD43D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:59:33 +0100 (CET)
Received: from localhost ([::1]:37688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRN6-0001Jx-PK
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcRJD-0005IZ-61; Tue, 10 Nov 2020 05:55:31 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcRJA-00077S-VZ; Tue, 10 Nov 2020 05:55:30 -0500
Received: by mail-wm1-x342.google.com with SMTP id s13so2542621wmh.4;
 Tue, 10 Nov 2020 02:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4mDJE2ZKgDk5LfxW8ALd7hpN+PQvRWr/geM6EPNC0uM=;
 b=VO7olcL39DoBxfcIZLaihPTqQlVZAF7y1ZXJd3GBkoCoDJpPNjdgO14418XRv9dKxQ
 jyIO36F9PIPmHqE6P5DxynbK9UGrwT0ppNJyS4xouQ//AOdRz5EVb1rfs6pQk7S3/9lu
 FRB0jDu3vxvBnhOvDx3IgR+sb7sjo6sszkwAXU4g/OI5M8d43MlXGM8Zjk/8gfmHj1H2
 q2PdB7Cji0I6IEA3u+KLROY7t+JSr0y73uTflnMXTU7qm7DACiAeaZiaI5dmuA8p138U
 UJpp7mrBprnV3T+HnQRkKFzxHStNPSj3pPUgYkovRGWypaL9ygl/BQHSkS0bvJUjjR1X
 OU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4mDJE2ZKgDk5LfxW8ALd7hpN+PQvRWr/geM6EPNC0uM=;
 b=IU9LXNP69f5BiH624oGKXlchGq4ZncqcOezXdM5hPySflFkXx3+zfQR2ct5Vby3RhH
 vR+iin+feiBxv8GjJXBXp6/WCCsk4knmjnzixRaxQdFq6KuKhsxSWty24D8pDWtMFn8N
 PUl5DAbXBV1SRAy1Oj+84pQrwYw6S/GEnE5rzoQC9jPPXFPbegg2j2wkxjigPN4PU3pJ
 Zc4P1e09C4C5rk4kKRfv5+EQTT6Y0FBzjYe75suL/2rcs6k8gntA3s+aUougOHM6CA+V
 N374Kl4QyhkZ2oqxJg+MbekhQuig0u50C2QuchwUb8PSWsy6y03S+jw03pPR0jHtxuJX
 6MOw==
X-Gm-Message-State: AOAM5305+HAllftoWmsFhLub+iGUVcuRe2NBXGJFyeL8PmTsfGN1e+i3
 xoN8NAwV/1yADVAEHK+TPBG73V6z3IkcUw==
X-Google-Smtp-Source: ABdhPJwLSEsGQPG7DCrnJ0cq60wnxOb4rCYjY/ilPiBTXsGHtgL/4L7GhzFsSi5iPQ/2HGcRiHImcQ==
X-Received: by 2002:a1c:4d4:: with SMTP id 203mr4173614wme.153.1605005726900; 
 Tue, 10 Nov 2020 02:55:26 -0800 (PST)
Received: from localhost.localdomain ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id x6sm2567891wmc.48.2020.11.10.02.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 02:55:26 -0800 (PST)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] ppc/translate: Turn the helper macros into functions
Date: Tue, 10 Nov 2020 11:53:19 +0100
Message-Id: <20201110105321.25889-3-thatlemon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110105321.25889-1-thatlemon@gmail.com>
References: <20201110105321.25889-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=thatlemon@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: LemonBoy <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 target/ppc/fpu_helper.c | 220 +++++++++++++++++++++-------------------
 1 file changed, 118 insertions(+), 102 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index b07ff66375..c74c080c17 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2467,113 +2467,129 @@ void helper_xscmpexpqp(CPUPPCState *env, uint32_t opcode,
     do_float_check_status(env, GETPC());
 }
 
-#define VSX_SCALAR_CMP(op, ordered)                                      \
-void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
-                 ppc_vsr_t *xa, ppc_vsr_t *xb)                           \
-{                                                                        \
-    uint32_t cc = 0;                                                     \
-    bool vxsnan_flag = false, vxvc_flag = false;                         \
-                                                                         \
-    helper_reset_fpstatus(env);                                          \
-                                                                         \
-    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||        \
-        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {        \
-        vxsnan_flag = true;                                              \
-        if (fpscr_ve == 0 && ordered) {                                  \
-            vxvc_flag = true;                                            \
-        }                                                                \
-    } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
-               float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {     \
-        if (ordered) {                                                   \
-            vxvc_flag = true;                                            \
-        }                                                                \
-    }                                                                    \
-    if (vxsnan_flag) {                                                   \
-        float_invalid_op_vxsnan(env, GETPC());                           \
-    }                                                                    \
-    if (vxvc_flag) {                                                     \
-        float_invalid_op_vxvc(env, 0, GETPC());                          \
-    }                                                                    \
-                                                                         \
-    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {\
-    case float_relation_less:                                            \
-        cc |= CRF_LT;                                                    \
-        break;                                                           \
-    case float_relation_equal:                                           \
-        cc |= CRF_EQ;                                                    \
-        break;                                                           \
-    case float_relation_greater:                                         \
-        cc |= CRF_GT;                                                    \
-        break;                                                           \
-    case float_relation_unordered:                                       \
-        cc |= CRF_SO;                                                    \
-        break;                                                           \
-    }                                                                    \
-                                                                         \
-    env->fpscr &= ~FP_FPCC;                                              \
-    env->fpscr |= cc << FPSCR_FPCC;                                      \
-    env->crf[BF(opcode)] = cc;                                           \
-                                                                         \
-    do_float_check_status(env, GETPC());                                 \
+static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
+                                 int crf_idx, bool ordered)
+{
+    uint32_t cc = 0;
+    bool vxsnan_flag = false, vxvc_flag = false;
+
+    helper_reset_fpstatus(env);
+
+    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||
+        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {
+        vxsnan_flag = true;
+        if (fpscr_ve == 0 && ordered) {
+            vxvc_flag = true;
+        }
+    } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||
+               float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {
+        if (ordered) {
+            vxvc_flag = true;
+        }
+    }
+    if (vxsnan_flag) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (vxvc_flag) {
+        float_invalid_op_vxvc(env, 0, GETPC());
+    }
+
+    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {
+    case float_relation_less:
+        cc |= CRF_LT;
+        break;
+    case float_relation_equal:
+        cc |= CRF_EQ;
+        break;
+    case float_relation_greater:
+        cc |= CRF_GT;
+        break;
+    case float_relation_unordered:
+        cc |= CRF_SO;
+        break;
+    }
+
+    env->fpscr &= ~FP_FPCC;
+    env->fpscr |= cc << FPSCR_FPCC;
+    env->crf[crf_idx] = cc;
+
+    do_float_check_status(env, GETPC());
+}
+
+void helper_xscmpodp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmp(env, xa, xb, BF(opcode), true);
+}
+
+void helper_xscmpudp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmp(env, xa, xb, BF(opcode), false);
 }
 
-VSX_SCALAR_CMP(xscmpodp, 1)
-VSX_SCALAR_CMP(xscmpudp, 0)
+static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
+                                  ppc_vsr_t *xb, int crf_idx, bool ordered)
+{
+    uint32_t cc = 0;
+    bool vxsnan_flag = false, vxvc_flag = false;
+
+    helper_reset_fpstatus(env);
+
+    if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||
+        float128_is_signaling_nan(xb->f128, &env->fp_status)) {
+        vxsnan_flag = true;
+        cc = CRF_SO;
+        if (fpscr_ve == 0 && ordered) {
+            vxvc_flag = true;
+        }
+    } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||
+               float128_is_quiet_nan(xb->f128, &env->fp_status)) {
+        cc = CRF_SO;
+        if (ordered) {
+            vxvc_flag = true;
+        }
+    }
+    if (vxsnan_flag) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (vxvc_flag) {
+        float_invalid_op_vxvc(env, 0, GETPC());
+    }
+
+    switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {
+    case float_relation_less:
+        cc |= CRF_LT;
+        break;
+    case float_relation_equal:
+        cc |= CRF_EQ;
+        break;
+    case float_relation_greater:
+        cc |= CRF_GT;
+        break;
+    case float_relation_unordered:
+        cc |= CRF_SO;
+        break;
+    }
 
-#define VSX_SCALAR_CMPQ(op, ordered)                                    \
-void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
-                 ppc_vsr_t *xa, ppc_vsr_t *xb)                          \
-{                                                                       \
-    uint32_t cc = 0;                                                    \
-    bool vxsnan_flag = false, vxvc_flag = false;                        \
-                                                                        \
-    helper_reset_fpstatus(env);                                         \
-                                                                        \
-    if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||         \
-        float128_is_signaling_nan(xb->f128, &env->fp_status)) {         \
-        vxsnan_flag = true;                                             \
-        cc = CRF_SO;                                                    \
-        if (fpscr_ve == 0 && ordered) {                                 \
-            vxvc_flag = true;                                           \
-        }                                                               \
-    } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||      \
-               float128_is_quiet_nan(xb->f128, &env->fp_status)) {      \
-        cc = CRF_SO;                                                    \
-        if (ordered) {                                                  \
-            vxvc_flag = true;                                           \
-        }                                                               \
-    }                                                                   \
-    if (vxsnan_flag) {                                                  \
-        float_invalid_op_vxsnan(env, GETPC());                          \
-    }                                                                   \
-    if (vxvc_flag) {                                                    \
-        float_invalid_op_vxvc(env, 0, GETPC());                         \
-    }                                                                   \
-                                                                        \
-    switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {    \
-    case float_relation_less:                                           \
-        cc |= CRF_LT;                                                   \
-        break;                                                          \
-    case float_relation_equal:                                          \
-        cc |= CRF_EQ;                                                   \
-        break;                                                          \
-    case float_relation_greater:                                        \
-        cc |= CRF_GT;                                                   \
-        break;                                                          \
-    case float_relation_unordered:                                      \
-        cc |= CRF_SO;                                                   \
-        break;                                                          \
-    }                                                                   \
-                                                                        \
-    env->fpscr &= ~FP_FPCC;                                             \
-    env->fpscr |= cc << FPSCR_FPCC;                                     \
-    env->crf[BF(opcode)] = cc;                                          \
-                                                                        \
-    do_float_check_status(env, GETPC());                                \
+    env->fpscr &= ~FP_FPCC;
+    env->fpscr |= cc << FPSCR_FPCC;
+    env->crf[crf_idx] = cc;
+
+    do_float_check_status(env, GETPC());
+}
+
+void helper_xscmpoqp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmpq(env, xa, xb, BF(opcode), true);
 }
 
-VSX_SCALAR_CMPQ(xscmpoqp, 1)
-VSX_SCALAR_CMPQ(xscmpuqp, 0)
+void helper_xscmpuqp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
+                     ppc_vsr_t *xb)
+{
+    do_scalar_cmpq(env, xa, xb, BF(opcode), false);
+}
 
 /*
  * VSX_MAX_MIN - VSX floating point maximum/minimum
-- 
2.27.0


