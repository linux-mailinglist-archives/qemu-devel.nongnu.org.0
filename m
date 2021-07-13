Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77AC3C71A3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:58:53 +0200 (CEST)
Received: from localhost ([::1]:59842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Iw0-00016X-RB
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibi-0000BX-7m
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Iba-0003jx-A4
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id i94so30501455wri.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Yzz6rh//yD/VixxG+zqhbi9VBeG09WvN+qezZDNmpTU=;
 b=TPeGk2JgNaGx4LlK4oLljFJb0U2STMJ5SWQ8xQ23Anjulh39bQuWhTdvL60okrlRO7
 2F0g3V/6sr9pU+sDAIs+Qh54hV4qieSDYMyzckEU4zP7H9rpbu0KaG2KwuQlTPHlnn6P
 RJAlrsayk/CSLWmPM1v8+aufSda+JQ0hwx+8jFm1CaGRdx+584/cTOoAtYrpmTXy7rdp
 SxVcMuv9YzCHS4l++7tF8xG+8KsZxHBdMOpMMD2MSqa4ZMXGSYOM/xEqS1BIevKuyoXA
 4+ndb7EDcu5djmjH7MTf0BLn/vRGdiN22EZ8yeeemB9nbXXHKY0BLuXKLNRtQDorRLUG
 WOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yzz6rh//yD/VixxG+zqhbi9VBeG09WvN+qezZDNmpTU=;
 b=ooWiE/sePy5bzO0ad9BU6cTZI5Qpx0uTIFO3cBsgwi7EFhDjPgLW0e8CBDrScTJzfA
 tYX8NVe1p3Sz4xn1jVCM8Owdr2Ln0gNtD/pInmfMdo+MR02x++BGJ1CZhWqLovlJn6HK
 1iFsCW1HrUaBFu0VXj3sk5q8TtCglNB5eIR0Ph515d8yehdOlwddFQhxywaGYINL2qGP
 wPv4efums/i4UEQJtOogWvRy6xv2xhtPyrWq8X8HVDFKgbzAyqFHsPfGTXj+67HldZe5
 lfFl/mlHb4cpJZByZ0JgtY8fsWKVvy1x0TB+LBnIYYHeWi981oH/a3nMNOSqJT0KM/Kd
 I1wA==
X-Gm-Message-State: AOAM531Doyf9hpNmeC990C/Dm6ZRdqWS8iOOSrJhyuBsTeiLWDLJiglj
 AkK5d2UuWS+pcnVJM0HMv4GLdGK0BWbXoe8q
X-Google-Smtp-Source: ABdhPJzMmLbGmsKFdcyeFz+NloarhVJ00yPqR2s6isWnRGTSSaZoCTJXqRGDfrgazasEQb4iUlZk6Q==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr5918291wrs.170.1626183464987; 
 Tue, 13 Jul 2021 06:37:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 21/34] target/arm: Implement MVE VABAV
Date: Tue, 13 Jul 2021 14:37:13 +0100
Message-Id: <20210713133726.26842-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  6 ++++++
 target/arm/mve_helper.c    | 26 +++++++++++++++++++++++
 target/arm/translate-mve.c | 43 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 282bfe80942..5c3f8a26df0 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -410,6 +410,13 @@ DEF_HELPER_FLAGS_3(mve_vminavw, TCG_CALL_NO_WG, i32, env, ptr, i32)
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
index 9ae417b718a..bf6cf6f8383 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -41,6 +41,7 @@
 &vcmp_scalar qn rm size mask
 &shl_scalar qda rm size
 &vmaxv qm rda size
+&vabav qn qm rda size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -386,6 +387,11 @@ VMLAS_U          1111 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
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
index 5066ee3169a..4eb5dbce6d7 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1335,6 +1335,32 @@ DO_VMAXMINV(vminavb, 1, int8_t, uint8_t, do_mina)
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
index 949c11344e3..c304b8d6e41 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -45,6 +45,7 @@ typedef void MVEGenVIDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void MVEGenVIWDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenScalarCmpFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenVABAVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -1368,3 +1369,45 @@ DO_VMAXV(VMAXAV, vmaxav)
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


