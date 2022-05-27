Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B8536784
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:33:43 +0200 (CEST)
Received: from localhost ([::1]:42366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufiQ-0005wb-Ld
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec2-0003Ii-8R
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebx-0004JE-VC
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:00 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so7807041pju.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LYkguOolr7fKXA6taL5DRU3Lw4aArsR84H4sNupje1I=;
 b=XcMba4njZH0UNefmD1Gfui1gjGRfGXJoMXIsIEAbmwJ19EArv36VA7M1chWePDYw/v
 ZW/fxgtyXozOATN5M7LfXzcE701k+de6Q3ltoGuydvipHmzaq8iJ1tHXAx4fXnRnAPsP
 /itwSCweSEq+ppo1xGfddg9MuuZG8gxPDqczEXeMPwJQfZn7KmoMTX0bnaWR7XSnXhvk
 qTZGLW2+IOPmPJCMhi1OkX6G62hc1lH0WbaA6y/xWQDUQ0bQDx75tVnm5uLWi6NLeSc4
 wX7tbij61iIkVrdnIoBI7Q76DoTmGu/mR2fA0o2HzHPgI2dDeC3N6XbVVSUP5iivThQB
 XLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYkguOolr7fKXA6taL5DRU3Lw4aArsR84H4sNupje1I=;
 b=ThkfbXiOuo8GUd0652S13d7eQL5TnIL9Ptl0JdY3exbAk87Sqh5TwnlH73+jGdf45o
 T7NRpm5fJRAafXM/E+cLGO3qDMLPUz00UmZmsmlY8aZCLdO8Vm1CRluq7F4qIVVOp8P9
 rv6NLy+9exB+rqmryPicCVrHKcLwetj1yV3r7We2Zbynq89LrcLLKcEd/wuEpqX/9ybV
 ICNLmtdOWotPguLyu0DYhmieqXNR0h5X2rtyH0GEmlvUMWjPBKRXi64CrXUS4x9J0DiX
 URKQ/9jMdvcalc2uWZjD3nnwLs8qG0uSP36REGtCWiavNw23++3+kw4Fj/fFSGAosACD
 xX7Q==
X-Gm-Message-State: AOAM531R3GySMxUA/M2mNgzCDEu3SCfU/3RKR/bS0wusoAt3wbX+y8B5
 UbqMKbxk4lnPBkIBCEtBKVv/qO/0YEN8FA==
X-Google-Smtp-Source: ABdhPJyxGWhSHGKSYCex/QzvPrkIdL4p0xF26zHEh3vKeRd6aHqH5Cu9ylTNSQ6/VpbgjcO3KgYa0Q==
X-Received: by 2002:a17:90a:4496:b0:1e0:51fa:516c with SMTP id
 t22-20020a17090a449600b001e051fa516cmr9678805pjg.176.1653675766488; 
 Fri, 27 May 2022 11:22:46 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 040/114] target/arm: Hoist sve access check through do_sel_z
Date: Fri, 27 May 2022 11:17:53 -0700
Message-Id: <20220527181907.189259-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

The check is already done in gen_gvec_ool_zzzp,
which is called by do_sel_z; remove from callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6fa721eca6..62bfc6fe7c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -697,13 +697,13 @@ TRANS_FEAT(UQSUB_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_ussub, a)
 /* Select active elememnts from Zn and inactive elements from Zm,
  * storing the result in Zd.
  */
-static void do_sel_z(DisasContext *s, int rd, int rn, int rm, int pg, int esz)
+static bool do_sel_z(DisasContext *s, int rd, int rn, int rm, int pg, int esz)
 {
     static gen_helper_gvec_4 * const fns[4] = {
         gen_helper_sve_sel_zpzz_b, gen_helper_sve_sel_zpzz_h,
         gen_helper_sve_sel_zpzz_s, gen_helper_sve_sel_zpzz_d
     };
-    gen_gvec_ool_zzzp(s, fns[esz], rd, rn, rm, pg, 0);
+    return gen_gvec_ool_zzzp(s, fns[esz], rd, rn, rm, pg, 0);
 }
 
 #define DO_ZPZZ(NAME, FEAT, name) \
@@ -749,10 +749,7 @@ TRANS_FEAT(UDIV_zpzz, aa64_sve, gen_gvec_ool_arg_zpzz, udiv_fns[a->esz], a, 0)
 
 static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
 {
-    if (sve_access_check(s)) {
-        do_sel_z(s, a->rd, a->rn, a->rm, a->pg, a->esz);
-    }
-    return true;
+    return do_sel_z(s, a->rd, a->rn, a->rm, a->pg, a->esz);
 }
 
 /*
@@ -6343,10 +6340,7 @@ static bool trans_MOVPRFX(DisasContext *s, arg_MOVPRFX *a)
 
 static bool trans_MOVPRFX_m(DisasContext *s, arg_rpr_esz *a)
 {
-    if (sve_access_check(s)) {
-        do_sel_z(s, a->rd, a->rn, a->rd, a->pg, a->esz);
-    }
-    return true;
+    return do_sel_z(s, a->rd, a->rn, a->rd, a->pg, a->esz);
 }
 
 static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a)
-- 
2.34.1


