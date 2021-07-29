Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA63DA240
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:36:34 +0200 (CEST)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94L3-0001SQ-Fu
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940z-0000iu-R4
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940j-00019o-M4
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:49 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so6568837wmh.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H9TZmaWqhZmwH6AhFQ01QX7XQokaEmxCohWlyYnItss=;
 b=wK6yb4kGx51zJ2lJQyDXkel7EjQqfiMi9z+xK9u1dstCRvhouHXI0YL37JCxadYHcl
 FmZdXxJ82X2z1V0iBpsPX9GY7DxDu6hkz6B6c6vCKHMkKhH2OVnp09NnajPEC3bD5gKw
 j0vZt2N2rEOrLUZ5ha4bnrsKfDvSjTTRE/fWmmTBgPby9lEABdij6DBHmCcYn7nU9jqQ
 DQgGKMpxy3Pslq5+MXvIis/3QUTVoysxM3AI+cM7T9j5uFCEDp7zpzAQ9KMPJwpKJ8F5
 usa8i2tHfVU5BaDt8SccpqcOfrJsE1Tgx9NDD1y6HwYrs0JdvVI2G0ayu0vAsM03n6zX
 96zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9TZmaWqhZmwH6AhFQ01QX7XQokaEmxCohWlyYnItss=;
 b=SMnMGKKbJptF1S7Qtc9hFgQC/IqmiYSxKMnCvDnMLpOpsZT60IxUIdUIVLM1DJu313
 C2wt6lp7EcuyOuSvTNYnoc2ksYmXgbqURyJJltMjdkfklEHtGZ/zVQPMRXpBRsaMXvJZ
 9l3Mfz/aUApJiUMy9nZ/9WcBM9t36NgxOShYZcVGnFmZmu+SPtvzMVUmksyq2djLpxX0
 6oOeREAkkFy9dq7vtOSOr05W3z5nD/LjUHeJJkyH6NcwCMHqZ/Dq8xL+lFpFCI2fuo+B
 cn+PLwtDVTbFtP8/1d7GAUhij83IRyp3B/RxlcJxSX0ku1Y0qCQkwbLFh0eaGrD+ADu+
 pjsw==
X-Gm-Message-State: AOAM533CDMunk76CYjtp/fcIxELXjxGVhv5b2KlX/gcaZxa5oF4yalJN
 QFBBxLfiFxx5MjFzrnNBFhNxr0VubC67JQ==
X-Google-Smtp-Source: ABdhPJyl3O0gaMW7j4M0nJaclQW460L0TTuarWOH2KJSuqgsMM+SqIy4BrJogu7eApV+dBbHac45WQ==
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr725597wmh.0.1627557328943;
 Thu, 29 Jul 2021 04:15:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 17/53] target/arm: Implement MVE VPSEL
Date: Thu, 29 Jul 2021 12:14:36 +0100
Message-Id: <20210729111512.16541-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Implement the MVE VPSEL insn, which sets each byte of the destination
vector Qd to the byte from either Qn or Qm depending on the value of
the corresponding bit in VPR.P0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  2 ++
 target/arm/mve.decode      |  7 +++++--
 target/arm/mve_helper.c    | 19 +++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 4f9903e66ef..16c4c3b8f61 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -82,6 +82,8 @@ DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vpsel, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vaddb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vaddw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ef708ba80ff..4bd20a9a319 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -468,8 +468,11 @@ VSHLC             111 0 1110 1 . 1 imm:5 ... 0 1111 1100 rdm:4 qd=%qd
 # effectively "VCMP then VPST". A plain "VCMP" has a mask field of zero.
 VCMPEQ            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 0 @vcmp
 VCMPNE            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 0 @vcmp
-VCMPCS            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 1 @vcmp
-VCMPHI            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 1 @vcmp
+{
+  VPSEL           1111 1110 0 . 11 ... 1 ... 0 1111 . 0 . 0 ... 1 @2op_nosz
+  VCMPCS          1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 1 @vcmp
+  VCMPHI          1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 1 @vcmp
+}
 VCMPGE            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 0 @vcmp
 VCMPLT            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 0 @vcmp
 VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1a021a9a817..03171766b57 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1842,3 +1842,22 @@ DO_VCMP_S(vcmpge, DO_GE)
 DO_VCMP_S(vcmplt, DO_LT)
 DO_VCMP_S(vcmpgt, DO_GT)
 DO_VCMP_S(vcmple, DO_LE)
+
+void HELPER(mve_vpsel)(CPUARMState *env, void *vd, void *vn, void *vm)
+{
+    /*
+     * Qd[n] = VPR.P0[n] ? Qn[n] : Qm[n]
+     * but note that whether bytes are written to Qd is still subject
+     * to (all forms of) predication in the usual way.
+     */
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint16_t mask = mve_element_mask(env);
+    uint16_t p0 = FIELD_EX32(env->v7m.vpr, V7M_VPR, P0);
+    unsigned e;
+    for (e = 0; e < 16 / 8; e++, mask >>= 8, p0 >>= 8) {
+        uint64_t r = m[H8(e)];
+        mergemask(&r, n[H8(e)], p0);
+        mergemask(&d[H8(e)], r, mask);
+    }
+    mve_advance_vpt(env);
+}
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6c6f159aa3e..aa38218e08f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -376,6 +376,8 @@ DO_LOGIC(VORR, gen_helper_mve_vorr)
 DO_LOGIC(VORN, gen_helper_mve_vorn)
 DO_LOGIC(VEOR, gen_helper_mve_veor)
 
+DO_LOGIC(VPSEL, gen_helper_mve_vpsel)
+
 #define DO_2OP(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
     {                                                           \
-- 
2.20.1


