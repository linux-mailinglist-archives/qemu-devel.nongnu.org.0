Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605C43C71D3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:06:11 +0200 (CEST)
Received: from localhost ([::1]:51318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3J34-0006CU-C0
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibt-0000Wk-Db
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibi-0003q5-IE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id m2so19483547wrq.2
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xdTiVrTGrjwqxBrVWc02ZyC5Zuxj4JEnIGJ5DSfl9U4=;
 b=AXeeUJfeCTahTk0Hs73SVfHTU3+XXQffQhq6aAS4UwsRCaCxnCXzeCQgCp8gZZ+Gkf
 bC55Qcx3c4lwH5PLeRJniY5IMp2RrANCfDv4Y08EmaUlSCw73xzTV3ga0gGyEdsWRtn5
 /b1D0b7HKTYgZCOCMh0EjoWTeOgN1R8pl10X9jdwS6B/eHp1gTKn+8dzmA0axYfFI8A0
 yXVtZJGsVYqyS2y+BztJ125ZUAejHKkSYrIbClWXpM93Bvxy5I6SBSvzkZc7gslhwGqk
 eYKc8Fn8FbQWG8tGKgoTZ15a7WAi1kUaidzG6trDZTL217/Wrm4akrGnX5mto2s4Fb95
 vTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xdTiVrTGrjwqxBrVWc02ZyC5Zuxj4JEnIGJ5DSfl9U4=;
 b=jvaaci+tEM/mBPSvqanxhZ/rcStlkuaOcKTmFq3Z9i85OmA90C6L7yUjcFxot4Fa0c
 c869uNlBDNB1goDRM2CWVqVP2u/HBrqKMBMi7IMjpNwqH4NmTjtILAoV/eQA9ib2h8D9
 KJXfIBRISJveZb/4vzaPTsrvIdYe36+HrpBXfZa+URzfGJssVXff7gzjvEa5KeWkuvcu
 UMg8yBbbOeUFe57lUxzcQe2LOW0X84uxZt6ieBBxUI9MrfEpT9jWi1UdqKlIoUs8dh6T
 BrbLHRHZgfaBB1ruAevLu0FKz3zGOgEURvqCUldg+kk+IgFm+gstnGUeJ2ngzVteg2Yx
 SN4g==
X-Gm-Message-State: AOAM530lDsIeN4LvKMSQZstfAGaDgBYHr0QnjPxWr8BZDZkEo1M7MWJN
 U+fQDJwXM/jielgvVclPC64Qhtord7K5N3ss
X-Google-Smtp-Source: ABdhPJzySUwMdE76HsEfWvu8an/vcUOGr80w2pP6i8kmSmJvA0YWSWzv12hvNj2B3/JVKD90mTbw2w==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr5816072wrq.395.1626183471783; 
 Tue, 13 Jul 2021 06:37:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 30/34] target/arm: Implement MVE VPNOT
Date: Tue, 13 Jul 2021 14:37:22 +0100
Message-Id: <20210713133726.26842-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Implement the MVE VPNOT insn, which inverts the bits in VPR.P0
(subject to both predication and to beatwise execution).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  1 +
 target/arm/mve.decode      |  1 +
 target/arm/mve_helper.c    | 17 +++++++++++++++++
 target/arm/translate-mve.c | 19 +++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c36640e75e9..5844bb891ed 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -123,6 +123,7 @@ DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
 DEF_HELPER_FLAGS_4(mve_vpsel, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_1(mve_vpnot, TCG_CALL_NO_WG, void, env)
 
 DEF_HELPER_FLAGS_4(mve_vaddb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 6ac9cb8e4d4..82dc07bc30e 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -573,6 +573,7 @@ VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
 VCMPLE            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp
 
 {
+  VPNOT           1111 1110 0 0 11 000 1 000 0 1111 0100 1101
   VPST            1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
   VCMPEQ_scalar   1111 1110 0 . .. ... 1 ... 0 1111 0 1 0 0 .... @vcmp_scalar
 }
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 40e652229d6..6efb3c69636 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2214,6 +2214,23 @@ void HELPER(mve_vpsel)(CPUARMState *env, void *vd, void *vn, void *vm)
     mve_advance_vpt(env);
 }
 
+void HELPER(mve_vpnot)(CPUARMState *env)
+{
+    /*
+     * P0 bits for unexecuted beats (where eci_mask is 0) are unchanged.
+     * P0 bits for predicated lanes in executed bits (where mask is 0) are 0.
+     * P0 bits otherwise are inverted.
+     * (This is the same logic as VCMP.)
+     * This insn is itself subject to predication and to beat-wise execution,
+     * and after it executes VPT state advances in the usual way.
+     */
+    uint16_t mask = mve_element_mask(env);
+    uint16_t eci_mask = mve_eci_mask(env);
+    uint16_t beatpred = ~env->v7m.vpr & mask;
+    env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) | (beatpred & eci_mask);
+    mve_advance_vpt(env);
+}
+
 #define DO_1OP_SAT(OP, ESIZE, TYPE, FN)                                 \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
     {                                                                   \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 43f917e609e..be961864ada 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -889,6 +889,25 @@ static bool trans_VPST(DisasContext *s, arg_VPST *a)
     return true;
 }
 
+static bool trans_VPNOT(DisasContext *s, arg_VPNOT *a)
+{
+    /*
+     * Invert the predicate in VPR.P0. We have call out to
+     * a helper because this insn itself is beatwise and can
+     * be predicated.
+     */
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    gen_helper_mve_vpnot(cpu_env);
+    mve_update_eci(s);
+    return true;
+}
+
 static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
 {
     /* VADDV: vector add across vector */
-- 
2.20.1


