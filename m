Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80783F738D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:43:09 +0200 (CEST)
Received: from localhost ([::1]:36970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqNA-0005rq-Op
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGG-0003qw-0n
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:00 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGE-0005U1-07
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:59 -0400
Received: by mail-wm1-x329.google.com with SMTP id m2so3048215wmm.0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wLBDTVo8uPxsFMze+DTZAhzyPrmDpywm7k5ga1QcofA=;
 b=W9dR7tUvyId4kQ5RBG7IOzh6/W9CGnVKFgN2bGGB1lNWGPNTdJ6iGZLXpLZ/YL4XgR
 w93gqmT12bnwEqI7piqoNF6fz2AMoKTJvMp5AP78zW/U9/+bP0bFpjEidqEAPJzIjzsJ
 szPCzdjVuPJUjMCF6p5Sus5vzgT9gyHHi5CMfnPbpLRLAN8b5QYLUT9eeqzA810dhz0R
 VmKljeRhYcVbUC2h+cEFs2DJJ8jAvaDNC8lv80TFngo0TY7kZ3qcKrOlNXsM9XomeI9r
 xzl15q++RaLzKHYxHbMVnlEp/7Y8PUPD8DnyIynvj3noMF4CYxd6KALznlZQ97qS5rYV
 VimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wLBDTVo8uPxsFMze+DTZAhzyPrmDpywm7k5ga1QcofA=;
 b=JEF4HW/1AMNthH6tKD8AhKji0oGfbpPUcDR3OblysiQ6cWAybTByWDZ6V7QJYnEzvp
 21qzETPTDrzz/iL365wVoI8Tju8cUyzJ6/yg/bmVSBfHFlWeuXKC9wd6ccqnXdwsUmDb
 pwtebI7UVR/kZHH34Cto0zy8JANjtvIrM21f5VR+0RJZ0sUNfKn9mCHqToNXWgW4z0mc
 lYDj0FNIzmzASSRJJ9WbAs9dZvwo9u7XKh1KJY3Es3r9cCW0hOAeEgPS1REtHYjyTlKk
 QzdUVY5gMbxLLad+j0aQh9Jxz6uiIfpY5ZxxGRP3fvc+WiR4MTFLicNQEWrCkurNAOlK
 AB4Q==
X-Gm-Message-State: AOAM533sYQwc+m7Sktq+xuGfJPKdJl7gH8yJKFzdEFA0/mEARwd2GHyi
 BaMVevQZB+WvdXOI72e0OEEnPl5asVCOZA==
X-Google-Smtp-Source: ABdhPJyGa6goEKJdRo7jlpBUug7TFceGQXbfzqOgMBpAyPS1hSZTQVWS5reGzTUsExdRPg9sa4NYRg==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr8615452wme.34.1629887756582; 
 Wed, 25 Aug 2021 03:35:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/44] target/arm: Implement MVE VABAV
Date: Wed, 25 Aug 2021 11:35:12 +0100
Message-Id: <20210825103534.6936-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
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

Implement the MVE VABAV insn, which computes absolute differences
between elements of two vectors and accumulates the result into
a general purpose register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  6 ++++++
 target/arm/mve_helper.c    | 26 +++++++++++++++++++++++
 target/arm/translate-mve.c | 43 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 2c66fcba792..c7e7aab2cbb 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -402,6 +402,13 @@ DEF_HELPER_FLAGS_3(mve_vminavw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddlv_s, TCG_CALL_NO_WG, i64, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vaddlv_u, TCG_CALL_NO_WG, i64, env, ptr, i64)
 
+DEF_HELPER_FLAGS_4(mve_vabavsb, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vabavsh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vabavsw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vabavub, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vabavuh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vabavuw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vmovi, TCG_CALL_NO_WG, void, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vandi, TCG_CALL_NO_WG, void, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vorri, TCG_CALL_NO_WG, void, env, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 83dc0300d69..c8a06edca78 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -41,6 +41,7 @@
 &vcmp_scalar qn rm size mask
 &shl_scalar qda rm size
 &vmaxv qm rda size
+&vabav qn qm rda size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -386,6 +387,11 @@ VMLAS            111- 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
                  rdahi=%rdahi rdalo=%rdalo
 }
 
+@vabav           .... .... .. size:2 .... rda:4 .... .... .... &vabav qn=%qn qm=%qm
+
+VABAV_S          111 0 1110 10 .. ... 0 .... 1111 . 0 . 0 ... 1 @vabav
+VABAV_U          111 1 1110 10 .. ... 0 .... 1111 . 0 . 0 ... 1 @vabav
+
 # Logical immediate operations (1 reg and modified-immediate)
 
 # The cmode/op bits here decode VORR/VBIC/VMOV/VMVN, but
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 924ad7f2bdc..fed0f3cd610 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1320,6 +1320,32 @@ DO_VMAXMINV(vminavb, 1, int8_t, uint8_t, do_mina)
 DO_VMAXMINV(vminavh, 2, int16_t, uint16_t, do_mina)
 DO_VMAXMINV(vminavw, 4, int32_t, uint32_t, do_mina)
 
+#define DO_VABAV(OP, ESIZE, TYPE)                               \
+    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, \
+                                    void *vm, uint32_t ra)      \
+    {                                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        TYPE *m = vm, *n = vn;                                  \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            if (mask & 1) {                                     \
+                int64_t n0 = n[H##ESIZE(e)];                    \
+                int64_t m0 = m[H##ESIZE(e)];                    \
+                uint32_t r = n0 >= m0 ? (n0 - m0) : (m0 - n0);  \
+                ra += r;                                        \
+            }                                                   \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+        return ra;                                              \
+    }
+
+DO_VABAV(vabavsb, 1, int8_t)
+DO_VABAV(vabavsh, 2, int16_t)
+DO_VABAV(vabavsw, 4, int32_t)
+DO_VABAV(vabavub, 1, uint8_t)
+DO_VABAV(vabavuh, 2, uint16_t)
+DO_VABAV(vabavuw, 4, uint32_t)
+
 #define DO_VADDLV(OP, TYPE, LTYPE)                              \
     uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
                                     uint64_t ra)                \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 2fce74f86ab..247f6719e6f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -45,6 +45,7 @@ typedef void MVEGenVIDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void MVEGenVIWDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenScalarCmpFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenVABAVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -1369,3 +1370,45 @@ DO_VMAXV(VMAXAV, vmaxav)
 DO_VMAXV(VMINV_S, vminvs)
 DO_VMAXV(VMINV_U, vminvu)
 DO_VMAXV(VMINAV, vminav)
+
+static bool do_vabav(DisasContext *s, arg_vabav *a, MVEGenVABAVFn *fn)
+{
+    /* Absolute difference accumulated across vector */
+    TCGv_ptr qn, qm;
+    TCGv_i32 rda;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qm | a->qn) ||
+        !fn || a->rda == 13 || a->rda == 15) {
+        /* Rda cases are UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qm = mve_qreg_ptr(a->qm);
+    qn = mve_qreg_ptr(a->qn);
+    rda = load_reg(s, a->rda);
+    fn(rda, cpu_env, qn, qm, rda);
+    store_reg(s, a->rda, rda);
+    tcg_temp_free_ptr(qm);
+    tcg_temp_free_ptr(qn);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_VABAV(INSN, FN)                                      \
+    static bool trans_##INSN(DisasContext *s, arg_vabav *a)     \
+    {                                                           \
+        static MVEGenVABAVFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_vabav(s, a, fns[a->size]);                    \
+    }
+
+DO_VABAV(VABAV_S, vabavs)
+DO_VABAV(VABAV_U, vabavu)
-- 
2.20.1


