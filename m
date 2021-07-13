Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2573C71BB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:02:40 +0200 (CEST)
Received: from localhost ([::1]:41698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Izf-0007xZ-KL
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibh-00009d-Ml
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:53 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbZ-0003jd-Hj
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:53 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v5so30525874wrt.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ja0q62vN/Key46fFCtdomZn1IL1h348ETeYRWt5fgQE=;
 b=S7RxtI6rXRoVAAagOXqdsW8hhsuULLD52tIcR2e2gKmMy03F/filRbQqT5L3/1BfDs
 vs5J7dkkrsZTsBZr2PXW9ehjIkIMZoo3EVTgRvINAHXS0z5B3Nl1/jEc5qtC+ptb6Mh0
 BCLkB8UTQrzHOqAZnnFNeZW6hBtX8bbyvqqyT9gc5w8b0Kkqzack0UtWopT4qDYX/bGG
 XsNKeLYuWxzfQ7b06LhQq2OzzmyNfqFgee15qDuEvh7/dkBQMfUt7ZqlUrvi4mizYsDj
 ZA/FvXOf/JCKSTcIl/SDPXHCrSI9OqOTRRRdIBXdkVBwdp4SZF4kl7tNf8e4GrCfWzzH
 h1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ja0q62vN/Key46fFCtdomZn1IL1h348ETeYRWt5fgQE=;
 b=F+UYWEl9Be4l2ODumgJr0jyVUk5zGjs1rl9hBpSAM5qlS4yEXTqSnPOpKMQQ9eVCSb
 d2ip4+QOnt7aRH8co2GKyqG41QDbUN+6G1vc0cLiT/J2I8lv158/4i815WBRyXsn0IUs
 vvQu4sk8cYlu0bpmQNCkXtTGaDOKiPtb2dU+wH+ES+VaqDNfGRHb2gBGdQYtobb5kpCT
 UxGXTE8/NqU7hcWBtHTKLPX1hU0ncl4vdBwWUBpBt38Z/Qdaa5R//1I5lxE+vZ4qjbye
 xrxgzVeNp4XcL8Ub9iBgQDGecgp/BtfMMVhr60UqyD36u5Z9ZM+9K4/K9G1uC++fQV93
 aVCw==
X-Gm-Message-State: AOAM530A+lsrXRWVAB8OF4uUZotH/XtM1ALFJT+vi6FSJ6xZC9CA7c+p
 eI2XJEtXrk0uQ5KacIIUhQ3ppshAnCi2xfQf
X-Google-Smtp-Source: ABdhPJxOW8UbOcUuv19B6RJ6MrDH/mB4SvLWaWE/FsdMbU6dFXgqsmCzJarU4o/3yhC3dDU1RYEkAg==
X-Received: by 2002:a5d:408d:: with SMTP id o13mr1572605wrp.246.1626183464282; 
 Tue, 13 Jul 2021 06:37:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 20/34] target/arm: Implement MVE integer min/max
 across vector
Date: Tue, 13 Jul 2021 14:37:12 +0100
Message-Id: <20210713133726.26842-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement the MVE integer min/max across vector insns
VMAXV, VMINV, VMAXAV and VMINAV, which find the maximum
from the vector elements and a general purpose register,
and store the maximum back into the general purpose
register.

These insns overlap with VRMLALDAVH (they use what would
be RdaHi=0b110).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 20 +++++++++++
 target/arm/mve.decode      | 18 ++++++++--
 target/arm/mve_helper.c    | 69 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 48 ++++++++++++++++++++++++++
 4 files changed, 153 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c702db4c39a..282bfe80942 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -387,6 +387,26 @@ DEF_HELPER_FLAGS_3(mve_vaddvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vmaxvsb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvub, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxavb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxavh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxavw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vminvsb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvub, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminavb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminavh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminavw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vaddlv_s, TCG_CALL_NO_WG, i64, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vaddlv_u, TCG_CALL_NO_WG, i64, env, ptr, i64)
 
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 67bd894daf1..9ae417b718a 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -40,6 +40,7 @@
 &vcmp qm qn size mask
 &vcmp_scalar qn rm size mask
 &shl_scalar qda rm size
+&vmaxv qm rda size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -97,6 +98,8 @@
 @vcmp_scalar .... .... .. size:2 qn:3 . .... .... .... rm:4 &vcmp_scalar \
              mask=%mask_22_13
 
+@vmaxv .... .... .... size:2 .. rda:4 .... .... .... &vmaxv qm=%qm
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -314,8 +317,19 @@ VMLALDAV_U       1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
 
 VMLSLDAV         1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
 
-VRMLALDAVH_S     1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
-VRMLALDAVH_U     1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+{
+  VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+  VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
+  VMINAV         1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VRMLALDAVH_S   1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+}
+
+{
+  VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+  VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VRMLALDAVH_U   1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+}
 
 VRMLSLDAVH       1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index d44cd80e18b..5066ee3169a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1266,6 +1266,75 @@ DO_VADDV(vaddvub, 1, uint8_t)
 DO_VADDV(vaddvuh, 2, uint16_t)
 DO_VADDV(vaddvuw, 4, uint32_t)
 
+/*
+ * Vector max/min across vector. Unlike VADDV, we must
+ * read ra as the element size, not its full width.
+ * We work with int64_t internally for simplicity.
+ */
+#define DO_VMAXMINV(OP, ESIZE, TYPE, RATYPE, FN)                \
+    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
+                                    uint32_t ra_in)             \
+    {                                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        TYPE *m = vm;                                           \
+        int64_t ra = (RATYPE)ra_in;                             \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            if (mask & 1) {                                     \
+                ra = FN(ra, m[H##ESIZE(e)]);                    \
+            }                                                   \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+        return ra;                                              \
+    }                                                           \
+
+#define DO_VMAXMINV_U(INSN, FN)                         \
+    DO_VMAXMINV(INSN##b, 1, uint8_t, uint8_t, FN)       \
+    DO_VMAXMINV(INSN##h, 2, uint16_t, uint16_t, FN)     \
+    DO_VMAXMINV(INSN##w, 4, uint32_t, uint32_t, FN)
+#define DO_VMAXMINV_S(INSN, FN)                         \
+    DO_VMAXMINV(INSN##b, 1, int8_t, int8_t, FN)         \
+    DO_VMAXMINV(INSN##h, 2, int16_t, int16_t, FN)       \
+    DO_VMAXMINV(INSN##w, 4, int32_t, int32_t, FN)
+
+/* Max and min of absolute values */
+static int64_t do_maxa(int64_t n, int64_t m)
+{
+    if (n < 0) {
+        n = -n;
+    }
+    if (m < 0) {
+        m = -m;
+    }
+    return MAX(n, m);
+}
+
+static int64_t do_mina(int64_t n, int64_t m)
+{
+    if (n < 0) {
+        n = -n;
+    }
+    if (m < 0) {
+        m = -m;
+    }
+    return MIN(n, m);
+}
+
+DO_VMAXMINV_S(vmaxvs, DO_MAX)
+DO_VMAXMINV_U(vmaxvu, DO_MAX)
+DO_VMAXMINV_S(vminvs, DO_MIN)
+DO_VMAXMINV_U(vminvu, DO_MIN)
+/*
+ * VMAXAV, VMINAV treat the general purpose input as unsigned
+ * and the vector elements as signed.
+ */
+DO_VMAXMINV(vmaxavb, 1, int8_t, uint8_t, do_maxa)
+DO_VMAXMINV(vmaxavh, 2, int16_t, uint16_t, do_maxa)
+DO_VMAXMINV(vmaxavw, 4, int32_t, uint32_t, do_maxa)
+DO_VMAXMINV(vminavb, 1, int8_t, uint8_t, do_mina)
+DO_VMAXMINV(vminavh, 2, int16_t, uint16_t, do_mina)
+DO_VMAXMINV(vminavw, 4, int32_t, uint32_t, do_mina)
+
 #define DO_VADDLV(OP, TYPE, LTYPE)                              \
     uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
                                     uint64_t ra)                \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 650d1470f08..949c11344e3 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1320,3 +1320,51 @@ DO_VCMP(VCMPGE, vcmpge)
 DO_VCMP(VCMPLT, vcmplt)
 DO_VCMP(VCMPGT, vcmpgt)
 DO_VCMP(VCMPLE, vcmple)
+
+static bool do_vmaxv(DisasContext *s, arg_vmaxv *a, MVEGenVADDVFn fn)
+{
+    /*
+     * MIN/MAX operations across a vector: compute the min or
+     * max of the initial value in a general purpose register
+     * and all the elements in the vector, and store it back
+     * into the general purpose register.
+     */
+    TCGv_ptr qm;
+    TCGv_i32 rda;
+
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qm) ||
+        !fn || a->rda == 13 || a->rda == 15) {
+        /* Rda cases are UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qm = mve_qreg_ptr(a->qm);
+    rda = load_reg(s, a->rda);
+    fn(rda, cpu_env, qm, rda);
+    store_reg(s, a->rda, rda);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_VMAXV(INSN, FN)                                      \
+    static bool trans_##INSN(DisasContext *s, arg_vmaxv *a)     \
+    {                                                           \
+        static MVEGenVADDVFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_vmaxv(s, a, fns[a->size]);                    \
+    }
+
+DO_VMAXV(VMAXV_S, vmaxvs)
+DO_VMAXV(VMAXV_U, vmaxvu)
+DO_VMAXV(VMAXAV, vmaxav)
+DO_VMAXV(VMINV_S, vminvs)
+DO_VMAXV(VMINV_U, vminvu)
+DO_VMAXV(VMINAV, vminav)
-- 
2.20.1


