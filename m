Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8070536813
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:26:57 +0200 (CEST)
Received: from localhost ([::1]:33510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugXx-0005ro-17
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefj-0001zv-J1
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:53 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefd-0005OJ-K6
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:50 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gz24so5295826pjb.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJSRaq3csOjLF210xdPggRDvmphcL+Yq8uVJkALhuZI=;
 b=zbjP2OyzIXkPcLfnC8wlaYGMtzdvbQWTkCoa1+W1Fr57Z0lhr2D280tZkkmZlUFtZT
 Kj+Af4SmupNAzqrZ2UFshwSieE2FB59x1Ry0CsOEFhvtf026mIUC9w+CcjPSrghTrlUX
 x5nsGNc9CwTLy3KwOsYLbgkFtEito3hUiPQ6/0JYw9zmCovk26MvqsIUyS8bScyWya9g
 pWi3aei+w1oirI4cNN6AlrDEehhkfgT68NEfBHKL36otNeNOQmM4nsAU7UR/vr2aF8Wy
 3vPidia0hI+dN4/rXJEmiSt1XHi17Xnc706IQWXNZ81gLa9y2kfiDqPKOkDBic2cNclU
 Eu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJSRaq3csOjLF210xdPggRDvmphcL+Yq8uVJkALhuZI=;
 b=bY9+rjgaktsqyk5AEzFHk3snBl+TzoBNjMyelRRInLT98+h/7ABbzEvBEsa2ocKO9Q
 zZHsZRlol4+hZZlHOPLqZhLpC9ckD2JyTqXHk7GkvENcG513Xor6QdVC0EJa+9MgQWEK
 22Vl5Od7kF6mmDzJadGgkaM7BjEPGHNy7o8xm7bMYOHwUDE/00J7xWvzBipdQTqhn/Yo
 YY24QftP/zN+DB2jBvTwQRf6uHlEvpY876nIGnNDhOzVjBGQ7jAiVKEhWeMcoP9F4tPP
 E/wkUvHGN0ZUY8tg5gQuPWyn+pIUhgrQEDPCL7wfgqlzc4T2Cix8hbI+UibfuWMlIRVT
 MIBQ==
X-Gm-Message-State: AOAM530SuKm40J7wmZjlpF/+3+zPIxLDwoMvx9qEhWf+yeDHfEfpy9Zl
 g0s+oZNpAYVvEnDkOja6HZsw8ZlMvoJjWg==
X-Google-Smtp-Source: ABdhPJw578cPilTUI/KTpPS1iHJsKgsVuk/Bdofw0UQjawc9hUwS2Z+/AHkAjwLKxRSenL0HtkOMlQ==
X-Received: by 2002:a17:90b:4b82:b0:1df:e6b4:1fa4 with SMTP id
 lr2-20020a17090b4b8200b001dfe6b41fa4mr9865032pjb.46.1653676004352; 
 Fri, 27 May 2022 11:26:44 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 102/114] target/arm: Use TRANS_FEAT for gen_gvec_fpst_zzzzp
Date: Fri, 27 May 2022 11:18:55 -0700
Message-Id: <20220527181907.189259-103-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 42 +++++++++++++-------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8f50956d3b..75854a7c6c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3998,22 +3998,14 @@ TRANS_FEAT(FCADD, aa64_sve, gen_gvec_fpst_zzzp, fcadd_fns[a->esz],
            a->rd, a->rn, a->rm, a->pg, a->rot,
            a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
-static bool do_fmla(DisasContext *s, arg_rprrr_esz *a,
-                    gen_helper_gvec_5_ptr *fn)
-{
-    return gen_gvec_fpst_zzzzp(s, fn, a->rd, a->rn, a->rm, a->ra, a->pg, 0,
-                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-}
-
 #define DO_FMLA(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rprrr_esz *a)          \
-{                                                                    \
-    static gen_helper_gvec_5_ptr * const fns[4] = {                  \
-        NULL, gen_helper_sve_##name##_h,                             \
-        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d         \
-    };                                                               \
-    return do_fmla(s, a, fns[a->esz]);                               \
-}
+    static gen_helper_gvec_5_ptr * const name##_fns[4] = {              \
+        NULL, gen_helper_sve_##name##_h,                                \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d            \
+    };                                                                  \
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_zzzzp, name##_fns[a->esz], \
+               a->rd, a->rn, a->rm, a->ra, a->pg, 0,                    \
+               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 DO_FMLA(FMLA_zpzzz, fmla_zpzzz)
 DO_FMLA(FMLS_zpzzz, fmls_zpzzz)
@@ -4022,19 +4014,13 @@ DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz)
 
 #undef DO_FMLA
 
-static bool trans_FCMLA_zpzzz(DisasContext *s, arg_FCMLA_zpzzz *a)
-{
-    static gen_helper_gvec_5_ptr * const fns[4] = {
-        NULL,
-        gen_helper_sve_fcmla_zpzzz_h,
-        gen_helper_sve_fcmla_zpzzz_s,
-        gen_helper_sve_fcmla_zpzzz_d,
-    };
-
-    return gen_gvec_fpst_zzzzp(s, fns[a->esz], a->rd, a->rn, a->rm,
-                               a->ra, a->pg, a->rot,
-                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-}
+static gen_helper_gvec_5_ptr * const fcmla_fns[4] = {
+    NULL,                         gen_helper_sve_fcmla_zpzzz_h,
+    gen_helper_sve_fcmla_zpzzz_s, gen_helper_sve_fcmla_zpzzz_d,
+};
+TRANS_FEAT(FCMLA_zpzzz, aa64_sve, gen_gvec_fpst_zzzzp, fcmla_fns[a->esz],
+           a->rd, a->rn, a->rm, a->ra, a->pg, a->rot,
+           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
 {
-- 
2.34.1


