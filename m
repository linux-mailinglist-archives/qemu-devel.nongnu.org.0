Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426173DA26C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:47:16 +0200 (CEST)
Received: from localhost ([::1]:52574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94VP-0003Jd-9T
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941R-0001Ig-OS
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940z-0001My-KA
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso3781142wmp.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cK3D9jr6c7rzAtNnX4xQNMbIJISTN5Ct4CVgZ3O8Kso=;
 b=P1odjIMTRYjYSFFBtb1yZpj1h5TcF/+2wj7oDXOHhgMpqdRbUOhFtg2UZn/iw1ZYK+
 Axn+6eXfo3HI532e98hy6iysWIQ5NKgYkvtsjBbatMXV6DAvgTZUAHVaDLBt3o44uRvv
 /loKG09RLI6UwNmpuxiMLAhngZA84gUyK3uuU/+GWXc4lK+PWnuyK8GbofgV3MATnHAx
 ZXqx5yo+pqRGRfLdegW3gPV9egkDk99zL7wuAlsskPYeSTp1LVrxqoamCt0plqqQz/tQ
 VtFhmZPL3B4rJIHvAR/A19vTLoNQOeBgXwnPMSfNkVarkmdY4Mfyh6WZmPhPUtubPdxs
 vGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cK3D9jr6c7rzAtNnX4xQNMbIJISTN5Ct4CVgZ3O8Kso=;
 b=YQy6z4tsvYr7FsMnpyb/dEbs49q9zJOTnH5fzLu4fDGzjmSEbhMF/0gvc42MtF0k4l
 cKv7v78MSM5+prCFH+EKMqOY7mTU/8CqgCFwv4s3um2a0I3jbbsMyhfnhTOscm3p8zIx
 jzn2osTTmAxnA91H/H/m9DoRtoePaKnxA9qfarvt5Ysk5SFSIvk0NVVxISNZTHgAmn3e
 4EWyNJrVi2+hLRXZN7kSxVE67nsPFAhdl0/e4CoMDoMmcZyrYDSBcfNXNGRtbUCeFTnS
 WAFEhXZHmV76yHmm96NzN7S3ShEWKKzWSg2MFwMgJ1q/wj9RhineXkUAASoTRG79OwQq
 BuiA==
X-Gm-Message-State: AOAM530UB8aIrY0xi1rp2+nkr+5SlVz8VZSEYDgw9T7TQq3+HHy1T32m
 YNWqUKnPyKLOU5NbAI99/o4kNw==
X-Google-Smtp-Source: ABdhPJxx2cU0lEnt8KG2fYZkFzdrjm1PgSALqJQpakh8odznNYWHQgOKHqoa0n6iqbuUS26bUg+opw==
X-Received: by 2002:a1c:4409:: with SMTP id r9mr4241289wma.150.1627557348260; 
 Thu, 29 Jul 2021 04:15:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 40/53] target/arm: Implement MVE VCMUL and VCMLA
Date: Thu, 29 Jul 2021 12:14:59 +0100
Message-Id: <20210729111512.16541-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VCMUL and VCMLA insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 18 ++++++++
 target/arm/mve.decode      | 35 ++++++++++++----
 target/arm/mve_helper.c    | 86 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  8 ++++
 4 files changed, 139 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c230610d25c..73950403bc3 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -440,6 +440,24 @@ DEF_HELPER_FLAGS_4(mve_vfmas, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfmsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfmss, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vcmul0h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul0s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul180h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul180s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul270s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vcmla0h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla0s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla180h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla180s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla270s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 3a2056f6b34..403381eef61 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -286,15 +286,29 @@ VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQRSHL_S         111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
 VQRSHL_U         111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
 
-VQDMLADH         1110 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
-VQDMLADHX        1110 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
-VQRDMLADH        1110 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
-VQRDMLADHX       1110 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+{
+  VCMUL0         111 . 1110 0 . 11 ... 0 ... 0 1110 . 0 . 0 ... 0 @2op_sz28
+  VQDMLADH       1110  1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
+  VQDMLSDH       1111  1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
+}
 
-VQDMLSDH         1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
-VQDMLSDHX        1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
-VQRDMLSDH        1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
-VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+{
+  VCMUL180       111 . 1110 0 . 11 ... 0 ... 1 1110 . 0 . 0 ... 0 @2op_sz28
+  VQDMLADHX      111 0 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
+  VQDMLSDHX      111 1 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
+}
+
+{
+  VCMUL90        111 . 1110 0 . 11 ... 0 ... 0 1110 . 0 . 0 ... 1 @2op_sz28
+  VQRDMLADH      111 0 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
+  VQRDMLSDH      111 1 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
+}
+
+{
+  VCMUL270       111 . 1110 0 . 11 ... 0 ... 1 1110 . 0 . 0 ... 1 @2op_sz28
+  VQRDMLADHX     111 0 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+  VQRDMLSDHX     111 1 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+}
 
 VQDMULLB         111 . 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 1 @2op_sz28
 VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
@@ -642,3 +656,8 @@ VCADD270_fp       1111 1101 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_
 
 VFMA              1110 1111 0 . 0 . ... 0 ... 0 1100 . 1 . 1 ... 0 @2op_fp
 VFMS              1110 1111 0 . 1 . ... 0 ... 0 1100 . 1 . 1 ... 0 @2op_fp
+
+VCMLA0            1111 110 00 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+VCMLA90           1111 110 01 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+VCMLA180          1111 110 10 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+VCMLA270          1111 110 11 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 0146137d18f..489892344b4 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2935,3 +2935,89 @@ DO_VFMA(vfmah, 2, uint16_t, float16_muladd)
 DO_VFMA(vfmas, 4, uint32_t, float32_muladd)
 DO_VFMA(vfmsh, 2, uint16_t, DO_VFMS16)
 DO_VFMA(vfmss, 4, uint32_t, DO_VFMS32)
+
+#define DO_VCMLA(OP, ESIZE, TYPE, ROT, CHS, FN)                         \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        TYPE r0, r1, e1, e2, e3, e4;                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        float_status *fpst0, *fpst1;                                    \
+        float_status scratch_fpst;                                      \
+        /* We loop through pairs of elements at a time */               \
+        for (e = 0; e < 16 / ESIZE; e += 2, mask >>= ESIZE * 2) {       \
+            if ((mask & MAKE_64BIT_MASK(0, ESIZE * 2)) == 0) {          \
+                continue;                                               \
+            }                                                           \
+            fpst0 = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :   \
+                &env->vfp.standard_fp_status;                           \
+            fpst1 = fpst0;                                              \
+            if (!(mask & 1)) {                                          \
+                scratch_fpst = *fpst0;                                  \
+                fpst0 = &scratch_fpst;                                  \
+            }                                                           \
+            if (!(mask & (1 << ESIZE))) {                               \
+                scratch_fpst = *fpst1;                                  \
+                fpst1 = &scratch_fpst;                                  \
+            }                                                           \
+            switch (ROT) {                                              \
+            case 0:                                                     \
+                e1 = m[H##ESIZE(e)];                                    \
+                e2 = n[H##ESIZE(e)];                                    \
+                e3 = m[H##ESIZE(e + 1)];                                \
+                e4 = n[H##ESIZE(e)];                                    \
+                break;                                                  \
+            case 1:                                                     \
+                e1 = CHS(m[H##ESIZE(e + 1)]);                           \
+                e2 = n[H##ESIZE(e + 1)];                                \
+                e3 = m[H##ESIZE(e)];                                    \
+                e4 = n[H##ESIZE(e + 1)];                                \
+                break;                                                  \
+            case 2:                                                     \
+                e1 = CHS(m[H##ESIZE(e)]);                               \
+                e2 = n[H##ESIZE(e)];                                    \
+                e3 = CHS(m[H##ESIZE(e + 1)]);                           \
+                e4 = n[H##ESIZE(e)];                                    \
+                break;                                                  \
+            case 3:                                                     \
+                e1 = m[H##ESIZE(e + 1)];                                \
+                e2 = n[H##ESIZE(e + 1)];                                \
+                e3 = CHS(m[H##ESIZE(e)]);                               \
+                e4 = n[H##ESIZE(e + 1)];                                \
+                break;                                                  \
+            default:                                                    \
+                g_assert_not_reached();                                 \
+            }                                                           \
+            r0 = FN(e2, e1, d[H##ESIZE(e)], fpst0);                     \
+            r1 = FN(e4, e3, d[H##ESIZE(e + 1)], fpst1);                 \
+            mergemask(&d[H##ESIZE(e)], r0, mask);                       \
+            mergemask(&d[H##ESIZE(e + 1)], r1, mask >> ESIZE);          \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VCMULH(N, M, D, S) float16_mul(N, M, S)
+#define DO_VCMULS(N, M, D, S) float32_mul(N, M, S)
+
+#define DO_VCMLAH(N, M, D, S) float16_muladd(N, M, D, 0, S)
+#define DO_VCMLAS(N, M, D, S) float32_muladd(N, M, D, 0, S)
+
+DO_VCMLA(vcmul0h, 2, uint16_t, 0, float16_chs, DO_VCMULH)
+DO_VCMLA(vcmul0s, 4, uint32_t, 0, float32_chs, DO_VCMULS)
+DO_VCMLA(vcmul90h, 2, uint16_t, 1, float16_chs, DO_VCMULH)
+DO_VCMLA(vcmul90s, 4, uint32_t, 1, float32_chs, DO_VCMULS)
+DO_VCMLA(vcmul180h, 2, uint16_t, 2, float16_chs, DO_VCMULH)
+DO_VCMLA(vcmul180s, 4, uint32_t, 2, float32_chs, DO_VCMULS)
+DO_VCMLA(vcmul270h, 2, uint16_t, 3, float16_chs, DO_VCMULH)
+DO_VCMLA(vcmul270s, 4, uint32_t, 3, float32_chs, DO_VCMULS)
+
+DO_VCMLA(vcmla0h, 2, uint16_t, 0, float16_chs, DO_VCMLAH)
+DO_VCMLA(vcmla0s, 4, uint32_t, 0, float32_chs, DO_VCMLAS)
+DO_VCMLA(vcmla90h, 2, uint16_t, 1, float16_chs, DO_VCMLAH)
+DO_VCMLA(vcmla90s, 4, uint32_t, 1, float32_chs, DO_VCMLAS)
+DO_VCMLA(vcmla180h, 2, uint16_t, 2, float16_chs, DO_VCMLAH)
+DO_VCMLA(vcmla180s, 4, uint32_t, 2, float32_chs, DO_VCMLAS)
+DO_VCMLA(vcmla270h, 2, uint16_t, 3, float16_chs, DO_VCMLAH)
+DO_VCMLA(vcmla270s, 4, uint32_t, 3, float32_chs, DO_VCMLAS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d61abc6d46f..d62ed1fc295 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -856,6 +856,14 @@ DO_2OP_FP(VCADD90_fp, vfcadd90)
 DO_2OP_FP(VCADD270_fp, vfcadd270)
 DO_2OP_FP(VFMA, vfma)
 DO_2OP_FP(VFMS, vfms)
+DO_2OP_FP(VCMUL0, vcmul0)
+DO_2OP_FP(VCMUL90, vcmul90)
+DO_2OP_FP(VCMUL180, vcmul180)
+DO_2OP_FP(VCMUL270, vcmul270)
+DO_2OP_FP(VCMLA0, vcmla0)
+DO_2OP_FP(VCMLA90, vcmla90)
+DO_2OP_FP(VCMLA180, vcmla180)
+DO_2OP_FP(VCMLA270, vcmla270)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


