Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB33D568271
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:08:50 +0200 (CEST)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o911d-00059e-Qt
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LE-00065w-CQ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LC-0000RE-My
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:00 -0400
Received: by mail-pl1-x629.google.com with SMTP id c13so9307847pla.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0yTWCJ1DktZzYQTXntYaiEXNGmdccKtN6uvynpzt0IU=;
 b=sj63h/zRkWhQLZV9P/R0rqi1ghEtjEY97oRVCuNVCOoUkDgvv6Umtn4sgBwnuniBCV
 +u6unh0OcSM9qLEbGSOm/Df8tB6EM8EI0YkoUKcJmm5sShEVf5/m/pTvITRX4AVTVqzk
 9KntLE76vW2qjze8Z9KOaKBD1eqMc7udqZ50K0SMWZFdQtonZFEvrtFar9ddOibSIuRb
 uSKYrs+8swPcUrwkbItQaBhR9Yj3FelLDyh7RmRlsei4jdnt4idTTLt1zs6DYY9d/anX
 KBoaiBeXy110uTqbcjIlING7IhCb2od+rPM4qC+lTMhCazyN+/GXgr0haEW8ANzMn0/m
 TewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0yTWCJ1DktZzYQTXntYaiEXNGmdccKtN6uvynpzt0IU=;
 b=6MI3QzXmu2NH6B2jgTEfMyqAIqwGPpdFc5NVYDfl2Bi6BIpjBqnCSR798q7iJQ0How
 IEav70op2OCqe1a3ayFrALL5N7IWJJR2NLQxtutEPzWq4+2ZnEXGKDBJTwfwYEkqlb9m
 xzOW8ZLepTk580GI+e4lukWVNjlHTbHLzT5Ya64HONynwabRolgH2uWdMcy2gWma1NMW
 uHnSOZMPVtS5z7uElQG0Qtov4DFNofrInRefKFuC8M80LD3eipA3s9k69oTUz53OHmeL
 hh4/fSLA1Ss7AzINVnpFZyBDD4ROjqCtvq9Rbwj0KZog+hTCmF6yCzK1R/VUgD7pNhCd
 EsOw==
X-Gm-Message-State: AJIora+8GK3ICoiZ3gPdyEucAZu2YSFvNc41GiDL/6lgdvpiC4HRKmpO
 89Iv1u5fFKe/wfdHFMlBqlLrkqnQqiW//wGK
X-Google-Smtp-Source: AGRyM1tF8J5Dm/8B9CaLrMkQOyWjtMtqI8PT9mLrhDX1fHbnxBbVsY+zqn5+TSyNjoli8L8qijpZ/A==
X-Received: by 2002:a17:90b:390d:b0:1ed:3058:45e5 with SMTP id
 ob13-20020a17090b390d00b001ed305845e5mr46625701pjb.141.1657095896980; 
 Wed, 06 Jul 2022 01:24:56 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 16/45] target/arm: Handle SME in sve_access_check
Date: Wed,  6 Jul 2022 13:53:42 +0530
Message-Id: <20220706082411.1664825-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

The pseudocode for CheckSVEEnabled gains a check for Streaming
SVE mode, and for SME present but SVE absent.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b16d81bf19..b7b64f7358 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1183,21 +1183,31 @@ static bool fp_access_check(DisasContext *s)
     return true;
 }
 
-/* Check that SVE access is enabled.  If it is, return true.
+/*
+ * Check that SVE access is enabled.  If it is, return true.
  * If not, emit code to generate an appropriate exception and return false.
+ * This function corresponds to CheckSVEEnabled().
  */
 bool sve_access_check(DisasContext *s)
 {
-    if (s->sve_excp_el) {
-        assert(!s->sve_access_checked);
-        s->sve_access_checked = true;
-
+    if (s->pstate_sm || !dc_isar_feature(aa64_sve, s)) {
+        assert(dc_isar_feature(aa64_sme, s));
+        if (!sme_sm_enabled_check(s)) {
+            goto fail_exit;
+        }
+    } else if (s->sve_excp_el) {
         gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
                               syn_sve_access_trap(), s->sve_excp_el);
-        return false;
+        goto fail_exit;
     }
     s->sve_access_checked = true;
     return fp_access_check(s);
+
+ fail_exit:
+    /* Assert that we only raise one exception per instruction. */
+    assert(!s->sve_access_checked);
+    s->sve_access_checked = true;
+    return false;
 }
 
 /*
-- 
2.34.1


