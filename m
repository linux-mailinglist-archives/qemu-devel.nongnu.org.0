Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B1570519
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:09:39 +0200 (CEST)
Received: from localhost ([::1]:37164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAu6V-0007Fa-0F
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvQ-0006VA-IR
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:12 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvF-0002ov-5c
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:04 -0400
Received: by mail-wm1-x334.google.com with SMTP id n185so3088553wmn.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ou0toLpgNQdjfsKkvJnes6zuCeqVFu/r7dnmnsOjFiA=;
 b=pR0AFYnyPIUl7EQlGiWfCOENd0+ULCSmg4CXQIaRyZEBPX7Yjfq6R/Sf04obVbWmD4
 denTYO1HpcmG4LdGcwKqTInnl8k6q9eRbQk0ff2m/0cmdZK4Xi5DsNXsd5F6LEg1jkIM
 qDnfNSfyqnnkSl5BfVShzGh91HH8+CJ+RCH8nBhL2vjDOPq1D8LBSIh371/9VWQkxnCf
 PL4aygp2El/GbXCH4UR+Rhe6lY0ieEVVEkAQqdBxVtWNKrst/kHtrOAUc9s23uBEk4RJ
 GpH7chjKlVsd+myfSM3u4dj1WWjqUbG+radbBm1LFONbMZB+me0WRhAqLOKsGn0te0nU
 updA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ou0toLpgNQdjfsKkvJnes6zuCeqVFu/r7dnmnsOjFiA=;
 b=z57zDQhqc6EdQa0OirsYTYwy0brVcpp7TAo0GlkeXHBiJaFKQYptsVY5i8zOM1X4tq
 GNKXffdePB9WXXgHbzp/JB7ceq0Jb6oYG9OchnoOjwh+Zj0WScqxYSbHxOGj2ju/DLKH
 WVLIl2SLsyQLa52H28dEd1bgFQvxaMiFweQoVOW9GLxp5m4ljNuFOxdNY7dHIcgadubW
 2eXzutzfe5Q4wjXPeW4ZvXOM1AXDIM7Dheb4TBIVhPnAKxg94CtHF27WNFUPmjFKR8Ay
 9svvvrovt7QXBsKf4PXuXTupBJwha0RxJrUPpS5dHPmkOXrI1lqC+ZJwhwc1jqwvDFq8
 ZXBw==
X-Gm-Message-State: AJIora/qSNvAKjVlXIdCM9uC5cAt/fXzyDMiwSlu7PX0sghD7IUGVAar
 2z7bZ/kv7i2hTmn0xTo7ptjK9x4L87OlAA==
X-Google-Smtp-Source: AGRyM1ukxXMD5jOb9Sb0vU3ga9l/qwPT3cAuBpJxpvcN30g3JF2bhgr7SkQqlyT8GQHZGmmgYyzYXQ==
X-Received: by 2002:a05:600c:c2:b0:3a2:e51a:78aa with SMTP id
 u2-20020a05600c00c200b003a2e51a78aamr9163430wmm.48.1657547879850; 
 Mon, 11 Jul 2022 06:57:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.57.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:57:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/45] target/arm: Mark SMMLA, UMMLA, USMMLA as non-streaming
Date: Mon, 11 Jul 2022 14:57:14 +0100
Message-Id: <20220711135750.765803-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sme-fa64.decode |  1 -
 target/arm/translate-sve.c | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index b5eaa2d0faa..3260ea2d64c 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 --0- ---- 1001 10-- ---- ----   # SMMLA, UMMLA, USMMLA
 FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d5aad539235..9bbf44f0082 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7302,12 +7302,12 @@ TRANS_FEAT(FMLALT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, false, true)
 TRANS_FEAT(FMLSLB_zzxw, aa64_sve2, do_FMLAL_zzxw, a, true, false)
 TRANS_FEAT(FMLSLT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, true, true)
 
-TRANS_FEAT(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_smmla_b, a, 0)
-TRANS_FEAT(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_usmmla_b, a, 0)
-TRANS_FEAT(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_ummla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_smmla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_usmmla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_ummla_b, a, 0)
 
 TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_bfdot, a, 0)
-- 
2.25.1


