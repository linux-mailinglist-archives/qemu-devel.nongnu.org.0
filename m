Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFE45367CD
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:00:10 +0200 (CEST)
Received: from localhost ([::1]:54750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nug7y-0004Yu-0J
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecS-0003ik-VP
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004TG-Lf
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:27 -0400
Received: by mail-pl1-x636.google.com with SMTP id b5so4794324plx.10
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t46XTEgGH7GaDo7Nv2mR9+DWEKTQLPHUxBDLqqQQZbA=;
 b=vq3vY7aF2YJ1XbmrAvTouCr6fDyWJ5opHkBDmr9gTQq51Y5nlsNBPFZ7o1A8jv3y/h
 r5kXCoO3Epv3UcfE2dgeQfNc6uyCZj5eK93rCBoqxua+DqJdtvNzcU0tiJ4Y7pmIqYqS
 FbGwVJ57KIBWURCmWuwzrgiptG6nJSdNyWEW1CUZ956wIF02urHzytVPSHEZsmmctcaW
 ZPU3FigpJ7JIhZvVzOHJi1ewSOyEGWkFjg2eaiZDKympzS11a7xPrdb/bxZrSGjCorAd
 38SWD3hd65uv8iHCelJCeTH+hRTTjabBD/xYaTY4GeuL/8Hght++wt6+uFcEKFN1jSIP
 nPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t46XTEgGH7GaDo7Nv2mR9+DWEKTQLPHUxBDLqqQQZbA=;
 b=1hSlLfn2Ff4st+rgwckHqscrLLKdzh9xBV/tvUdFbQpp8BalGdpBodnS+/806lOR1C
 fGS27XdBGDPLDTFp7VQ3TaXHcuU0X0fqYnYGSi2l2tZaHPkuiXQ/XqwF5MY9NLFORtZM
 TKkxc0+Hs26VgurhW/8SlWCxMW9gFx5q4VKN3EYEfk4gSxf2gsHubZqRcJ9rXSyDX+Ei
 6ylIIlbGYX8gPN/AxLDHPUlbp7CzdLjp46C28kLtfr3ltmwmCMaMJf3L58qKrxMHS0ib
 Mt5NhrGtLnzgsvyX5o5khCmMiyl+Saubf/bN1NdrJsnGFOAIcGHR28Vbjynj3zWH3aIh
 l4LA==
X-Gm-Message-State: AOAM530Fmlk38mqGnAZyIpLUJE4xj1eZpIluthTHYRAfbIIf5X1ln3NU
 gHH8QChyY1j16KimOjlJu03oh1EGBvqyJg==
X-Google-Smtp-Source: ABdhPJySgupeQpmM3r2hTnijKKwESfDq4B/wVdHSkPqySaQyDMQPiNBoT4Hf7MTMy/D7Y0rKdHWObw==
X-Received: by 2002:a17:902:aa07:b0:162:467:db94 with SMTP id
 be7-20020a170902aa0700b001620467db94mr33197221plb.26.1653675789799; 
 Fri, 27 May 2022 11:23:09 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 066/114] target/arm: Use TRANS_FEAT for do_ppzz_flags
Date: Fri, 27 May 2022 11:18:19 -0700
Message-Id: <20220527181907.189259-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8eb70fd56f..73b5b67c25 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2708,14 +2708,12 @@ static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
 }
 
 #define DO_PPZZ(NAME, name) \
-static bool trans_##NAME##_ppzz(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_flags_4 * const fns[4] = {                     \
-        gen_helper_sve_##name##_ppzz_b, gen_helper_sve_##name##_ppzz_h,   \
-        gen_helper_sve_##name##_ppzz_s, gen_helper_sve_##name##_ppzz_d,   \
-    };                                                                    \
-    return do_ppzz_flags(s, a, fns[a->esz]);                              \
-}
+    static gen_helper_gvec_flags_4 * const name##_ppzz_fns[4] = {       \
+        gen_helper_sve_##name##_ppzz_b, gen_helper_sve_##name##_ppzz_h, \
+        gen_helper_sve_##name##_ppzz_s, gen_helper_sve_##name##_ppzz_d, \
+    };                                                                  \
+    TRANS_FEAT(NAME##_ppzz, aa64_sve, do_ppzz_flags,                    \
+               a, name##_ppzz_fns[a->esz])
 
 DO_PPZZ(CMPEQ, cmpeq)
 DO_PPZZ(CMPNE, cmpne)
@@ -2727,14 +2725,12 @@ DO_PPZZ(CMPHS, cmphs)
 #undef DO_PPZZ
 
 #define DO_PPZW(NAME, name) \
-static bool trans_##NAME##_ppzw(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_flags_4 * const fns[4] = {                     \
-        gen_helper_sve_##name##_ppzw_b, gen_helper_sve_##name##_ppzw_h,   \
-        gen_helper_sve_##name##_ppzw_s, NULL                              \
-    };                                                                    \
-    return do_ppzz_flags(s, a, fns[a->esz]);                              \
-}
+    static gen_helper_gvec_flags_4 * const name##_ppzw_fns[4] = {       \
+        gen_helper_sve_##name##_ppzw_b, gen_helper_sve_##name##_ppzw_h, \
+        gen_helper_sve_##name##_ppzw_s, NULL                            \
+    };                                                                  \
+    TRANS_FEAT(NAME##_ppzw, aa64_sve, do_ppzz_flags,                    \
+               a, name##_ppzw_fns[a->esz])
 
 DO_PPZW(CMPEQ, cmpeq)
 DO_PPZW(CMPNE, cmpne)
-- 
2.34.1


