Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D751379E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:01:57 +0200 (CEST)
Received: from localhost ([::1]:58388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5eX-0005Fy-0H
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jl-0005TG-Aj
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ji-0006KT-D6
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:29 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 p7-20020a05600c358700b00393e80c59daso4106703wmq.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=boSwe17xVCQzug1VZ7X/BwHUk5bsDJXZRHsRInKMfVU=;
 b=cnNG3smQC3czY9bsIKuKDF93hVG3pKTgMnMXgieZj+SnlQa6Jk2MGcpmXVsUSVW6pn
 qfHOOPpsyl19Bhf29r24hxQg12m4zC7gtglUpoYsHJ+r2ahz7UvysrfARYZrPF2R2dQf
 xybA/ge4BMWih5wBpChllW4qWxJE8HtQgrZF9ZiomR+NHNFhdaedYJh1ORk5tFdTY2yg
 MHsVRkSTqLYErmTCeXepWiT2FqaIQbpt9DPRkDc0LrEroRDs9HAT+TjBaAT+gfDWzcfT
 E4K6ViHj3Q+9HLNOkP65aXWEmK87eeFXw/3LODUczSyBzPOVqRIKntQX0tTJzTAHiitl
 E1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=boSwe17xVCQzug1VZ7X/BwHUk5bsDJXZRHsRInKMfVU=;
 b=J2XO6Wfj7qjwb3pKoLespCg95Y9xGrPlrB7rRgijuyfKMt8fBNRojvsMnoz46knX4w
 wC7VDY3VohYWLyhm5xBkXqkgSvvXVyYhIjtQ8XJpodzSzhmOhWkanR4i3uiO+BssPBFO
 fTdRFv4qoKARLcyuvjGwYeekxTRwkcky9kTxurKIxfRitQYSVsKPvuduK8asbiqt1QYA
 5ZO4WiC+m99DQ3r+jKXlDBB+WheYB+eKYYWCpgQKI73a/E+Ky9TlBSDFsNfD/PeLeMh6
 nTDobkIgmqluj5J0kLy3R8IZHZybFOCKdxrUirpEiv7QQG7+JY2gAH5c4fEYG+N49FYU
 aoVw==
X-Gm-Message-State: AOAM532YaOW8h4kur1yejyPexZ+LVwFPeAejTtKOWkd9pUuoie5OfsVy
 6mJgH0snJ4z/oGZd+sN6LPdXmexICBX+Wg==
X-Google-Smtp-Source: ABdhPJxy3LfRVLSSs0RwlVuQI3RE4n2aKZO6SW3NGxQ94m6WZMi6fED8l2yN3hka53/mmP3W2WBoPA==
X-Received: by 2002:a05:600c:5020:b0:38f:f83b:e773 with SMTP id
 n32-20020a05600c502000b0038ff83be773mr31394860wmr.57.1651156825114; 
 Thu, 28 Apr 2022 07:40:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/54] target/arm: Use tcg_constant for gen_{msr,mrs}
Date: Thu, 28 Apr 2022 15:39:28 +0100
Message-Id: <20220428143958.2451229-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-25-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 501192ed55f..2e4165be3d2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2845,7 +2845,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
                 tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), 1);
                 tcg_gen_addi_i32(tcg_el, tcg_el, 3);
             } else {
-                tcg_el = tcg_const_i32(3);
+                tcg_el = tcg_constant_i32(3);
             }
 
             gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
@@ -2880,7 +2880,7 @@ undef:
 
 static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
 {
-    TCGv_i32 tcg_reg, tcg_tgtmode, tcg_regno;
+    TCGv_i32 tcg_reg;
     int tgtmode = 0, regno = 0;
 
     if (!msr_banked_access_decode(s, r, sysm, rn, &tgtmode, &regno)) {
@@ -2891,18 +2891,16 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
     tcg_reg = load_reg(s, rn);
-    tcg_tgtmode = tcg_const_i32(tgtmode);
-    tcg_regno = tcg_const_i32(regno);
-    gen_helper_msr_banked(cpu_env, tcg_reg, tcg_tgtmode, tcg_regno);
-    tcg_temp_free_i32(tcg_tgtmode);
-    tcg_temp_free_i32(tcg_regno);
+    gen_helper_msr_banked(cpu_env, tcg_reg,
+                          tcg_constant_i32(tgtmode),
+                          tcg_constant_i32(regno));
     tcg_temp_free_i32(tcg_reg);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
 {
-    TCGv_i32 tcg_reg, tcg_tgtmode, tcg_regno;
+    TCGv_i32 tcg_reg;
     int tgtmode = 0, regno = 0;
 
     if (!msr_banked_access_decode(s, r, sysm, rn, &tgtmode, &regno)) {
@@ -2913,11 +2911,9 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
     tcg_reg = tcg_temp_new_i32();
-    tcg_tgtmode = tcg_const_i32(tgtmode);
-    tcg_regno = tcg_const_i32(regno);
-    gen_helper_mrs_banked(tcg_reg, cpu_env, tcg_tgtmode, tcg_regno);
-    tcg_temp_free_i32(tcg_tgtmode);
-    tcg_temp_free_i32(tcg_regno);
+    gen_helper_mrs_banked(tcg_reg, cpu_env,
+                          tcg_constant_i32(tgtmode),
+                          tcg_constant_i32(regno));
     store_reg(s, rn, tcg_reg);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
-- 
2.25.1


