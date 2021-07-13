Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271DA3C717C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:53:12 +0200 (CEST)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IqV-0003E6-4O
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibe-00004t-5o
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:51 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbW-0003hB-Nh
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:49 -0400
Received: by mail-wm1-x336.google.com with SMTP id n4so3255737wms.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=R+iqSzvkngVHdjj9CAmtBya0mSLIYbFqnfRfCDrGqng=;
 b=UCQ8lZvDVPhRoWElm7zrwV/MA4dbHpFCltL0VEP4CEnT0jIRQYi0FhMHOSNtir+PYJ
 FApNuF3v0wWjbITaGL3DOM4GQ0Jk5QWGl77WXYAHNdDbagdv0qCrmYZZ6L3+l+kxgf1q
 Qw7MOsptZQJ+gpHozZTfVhBNxRTMKh5ayHDPu4GBHRT2Hbg/FWx9yBf7HkBcBoEQcNnP
 oRbCZloeb6MhjtxfFwwXT0k4ofAkIvBcyNI4EATVQlEp4whN1ernEQ89n2RFdElpMi+C
 giCIHxLAjeSGHQo3TQJB06Ms4tYylGXzjeZ6iYZK7aW6xPhTXIaAkeNtszsFk4kqoept
 DMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R+iqSzvkngVHdjj9CAmtBya0mSLIYbFqnfRfCDrGqng=;
 b=DZm6XpZ0en9CfQZ+tJmtvCpPrXl5twz2Ajxj4Vz4PS6f1L8McWy9wrmMwMEQj0pFzX
 jcactn4rzIw3C6nZKvgQId1dxSDpXD5F/spXbShKbAjrdDNxEtc1DHVjj1+IiGU4EnB+
 ieXA3/MH2VJ8xUSPJKkdBAxClsUKLJ0MkLxvsYlDgU9irrD6oJtnWpmt94WqLpVtfMmW
 Q1mXoKM+iRHkDuYkt6i+C/V+Dy+ar6nDF6WAa2EjvW5oFr7asdNqx2ywW/Hc5kcXRsP3
 vDXQg9KIVcsdFe5l8BA9c8E+9m6H0Gfr/1rUjDHBOewegBe96rptSRRAhRcD97QDZDlH
 7T8A==
X-Gm-Message-State: AOAM532oJFdWYPgp3d31aXaWg/MpQbsa19dMue/cQybT6d2PBkWwg0P/
 iYQXBYiEKIcySZhGMNfbn701OAo6uU0fOdPv
X-Google-Smtp-Source: ABdhPJzEE8J4pIi+e53PTBeZLGPh5C/aqemxDVtFBannQwIGCNfNaMpsJDCK1u6G55pg+PrTKL0JVQ==
X-Received: by 2002:a7b:c1cd:: with SMTP id a13mr57254wmj.75.1626183461380;
 Tue, 13 Jul 2021 06:37:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 16/34] target/arm: Implement MVE VPSEL
Date: Tue, 13 Jul 2021 14:37:08 +0100
Message-Id: <20210713133726.26842-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Implement the MVE VPSEL insn, which sets each byte of the destination
vector Qd to the byte from either Qn or Qm depending on the value of
the corresponding bit in VPR.P0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  2 ++
 target/arm/mve.decode      |  7 +++++--
 target/arm/mve_helper.c    | 19 +++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 035779b0576..f1a54aba5d4 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -86,6 +86,8 @@ DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index 57a92bc6841..be67e7cea26 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1846,3 +1846,22 @@ DO_VCMP_S(vcmpge, DO_GE)
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
index f8b8639eab7..689e15c069b 100644
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


