Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD70C531994
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 22:55:01 +0200 (CEST)
Received: from localhost ([::1]:41800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntF4u-0000xq-Ph
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 16:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy0-0008Ds-KJ
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:53 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:39654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExx-0004zo-5p
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:52 -0400
Received: by mail-pf1-x429.google.com with SMTP id v11so14696327pff.6
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MX1GOuVouWu0Qr0+DdSMTNcH8UOwJjn/VDcrD/8BMow=;
 b=eLQDQRKBRxW8MeBz6zb6ZMyYdWo+28EiNR0n1eORp186evBDWesuRACOX3Llbjh+XV
 ztsGcTODkuTm1zLOkPezGWlw4ee09NSa0+EUrj2tY9PD3ylf4JkA2zDjeUItTrz0P7xI
 s48p4HGqnbhYqbAgm2uxhZoOAJnr3DvH9BwTTGJ83fPPZA7qALKfLNXVcOambYzi3Jmb
 kPzb6TyrFnku9JxL1nAiDjF+c96Wx9NSeF4K6AeZhD9sXrzvFJkNg4yo0AId8XCHt9Pb
 /b675T1DLyMQoE9mmrtCQLMvLY2SzHfjFDIs1zuq+QdDfSfp90J9w1xjUxWJoXBvfQZf
 BDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MX1GOuVouWu0Qr0+DdSMTNcH8UOwJjn/VDcrD/8BMow=;
 b=HX53geZn12DSQ+Oo+Y/hfP+N1UDbkh1Yd8WvOPj7muL6tQpk8WMhTikkP4BpL+Pk+a
 4rYRDAD4iTvOILVsmXWmP7NQLYQlDIijj7yvkox/Sl8XfOtUUNOWZe5XYjZv71ZpT4n6
 tDmcQi59Rh/5nd25mJvrRwxkUk0RHgkSOzZFLSiGB9e/dvvx8jOhxDbJaLVWZzuH+diK
 eL/pMN2PEocjEurlD4OLrLuXNXhxCtHAEBJDyar4ZKvJWliDMnunkul8X4VlK1GKBZmN
 LqvxVTOSAEipJQD+RpiPCSC/2Dl/rTJqq8MKuOFzSTLTRiG5qa2C/MUV8irrJDDJw0Ir
 EWHQ==
X-Gm-Message-State: AOAM531Ra3Oq8PvJW+gMU5jIggEzSzykzGmMiGNAPBbkXlERQa1OLKMy
 SIIwgZXGUSlVXfOjBCHP5aBKYebJ2lpw6Q==
X-Google-Smtp-Source: ABdhPJwlzMgftkojCqJAi6idUU4tz5kwylO0DAKnSBIwufRfGRkDeNZ1zJxHewsVbgG/y2PlQDDVNA==
X-Received: by 2002:a63:dd4c:0:b0:3fa:a80e:8ba0 with SMTP id
 g12-20020a63dd4c000000b003faa80e8ba0mr269410pgj.167.1653338867855; 
 Mon, 23 May 2022 13:47:47 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/18] target/arm: Move HCR_TGE check into exception_target_el
Date: Mon, 23 May 2022 13:47:28 -0700
Message-Id: <20220523204742.740932-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the TGE test from raise_exception into
exception_target_el to consolidate tests in one place.
Note that this ought to apply only to origin of EL0,
but that cannot be confirmed at this time.
Update the AdvSIMDFPAccessTrap doc reference to DDI0478H.a.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/op_helper.c | 47 +++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 6858b8980d..55440dfa84 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -30,17 +30,39 @@
 
 int exception_target_el(CPUARMState *env, int cur_el, uint32_t *psyn)
 {
-    int target_el = MAX(1, cur_el);
+    /*
+     * FIXME: The following tests really apply to an EL0 origin,
+     * not to a target of EL1.  However, the origin will never be
+     * EL1 for these cases (no aa32 secure EL1, can't enter EL1
+     * with TGE set).  Delay fixing this until all places that
+     * might perform MAX(cur_el, 1) are audited.
+     */
+    if (cur_el >= 2) {
+        return 2;
+    }
 
     /*
      * No such thing as secure EL1 if EL3 is aarch32,
      * so update the target EL to EL3 in this case.
      */
-    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
-        target_el = 3;
+    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
+        return 3;
     }
 
-    return target_el;
+    if (arm_hcr_el2_eff(env) & HCR_TGE) {
+        /*
+         * Redirect NS EL1 exceptions to NS EL2. These are reported with
+         * their original syndrome register value, with the exception of
+         * SIMD/FP access traps, which are reported as uncategorized
+         * (see DDI0487 H.a rule RJNBTN).
+         */
+        if (psyn && syn_get_ec(*psyn) == EC_ADVSIMDFPACCESSTRAP) {
+            *psyn = syn_uncategorized();
+        }
+        return 2;
+    }
+
+    return 1;
 }
 
 void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
@@ -49,21 +71,8 @@ void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
     CPUState *cs = env_cpu(env);
     int target_el = cur_or_target_el;
 
-    if (cur_or_target_el == 0) {
-        target_el = exception_target_el(env, 0, &syndrome);
-    }
-
-    if (target_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
-        /*
-         * Redirect NS EL1 exceptions to NS EL2. These are reported with
-         * their original syndrome register value, with the exception of
-         * SIMD/FP access traps, which are reported as uncategorized
-         * (see DDI0478C.a D1.10.4)
-         */
-        target_el = 2;
-        if (syn_get_ec(syndrome) == EC_ADVSIMDFPACCESSTRAP) {
-            syndrome = syn_uncategorized();
-        }
+    if (cur_or_target_el <= 1) {
+        target_el = exception_target_el(env, cur_or_target_el, &syndrome);
     }
 
     assert(!excp_is_internal(excp));
-- 
2.34.1


