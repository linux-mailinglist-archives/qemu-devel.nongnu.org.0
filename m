Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27795104C0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:58:41 +0200 (CEST)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOWO-0005Jm-Sf
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5s-00035T-VE
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:21 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5m-0003sS-Qj
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:13 -0400
Received: by mail-pl1-x634.google.com with SMTP id q8so7558973plx.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YT4PcROW/lGugJoLo5kIvKRZrra7WUrqQMozbJdZCxo=;
 b=uN9S/zIFGy5h1M7JIkNZhkueY7ZTPJSEAkrzpqH4u5u1XSDoc1snhdOlp6IMURIoCb
 3htVey09e70WJ1h/0o25WY2es0EP2dQSjIVPvg5qWgtRSVbk3g/1SrNoDJvu+AiOnnk+
 8Y4IgfpTA2+zcPJT2jsq7yr0h3mDRHDLvsOeO29JH/9GU55Ou5M1kcn6pIWm4+yjMWFr
 L48f8kLz01QjXggBta7RsxUAtO83NAigJ4nfBenl2nMvdOTFDs3+zsx3O8+uRYqc2fct
 CoUqo43aI7vvaUeD704MGeR3jYWlVtvy+cXjaDoKnB45mCiceErOmh6H+suussVkl0CP
 4WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YT4PcROW/lGugJoLo5kIvKRZrra7WUrqQMozbJdZCxo=;
 b=5yznQcay1xfUQt/WpnmvFvKL5pQ1h4+4OJYNwV+DJ8GG+bH+G2jej4cC5atLI++HWL
 x3TJcjUNSEO9i1Y1B/jXNlr5HMG8d3IOnDJVz/ICkVy4PcpMXTjfP6OujDVfGyTwWJb6
 30wtBccx8KSoO8xlHkEvq67+xJdqYXD9ZCukKr0N1f7qHFL8XF1Xcg17jQugW2YsrYBS
 zoLms/2I47z+hxpHL2RbLz0Se4DCXrRSnBm5Z2tZqdMrPzblPPKXzdwlK9D2fyGvpfpR
 u9nZ239dz6v8k04fJQU01VxP5LR7hSRU6EY7UyY9GYN0HForb1rWpUqsi9PLLQv3qmXD
 ITjA==
X-Gm-Message-State: AOAM531CzCWt9igXMVT/6AP8VdKr09rohebEMqZ9tb3cfpF00p9eaHVP
 vsRzofTMty/6Fumvg9kj3wcAuF/7N9q4uQ==
X-Google-Smtp-Source: ABdhPJxXp2LQ36IvoDE/FCQoTasKMsrQ+g52+wvq2McNqb2jDAh2o67XJVK9AjDhXyaJgDnaxTtPjw==
X-Received: by 2002:a17:902:7613:b0:158:faeb:a48e with SMTP id
 k19-20020a170902761300b00158faeba48emr23705462pll.140.1650990667876; 
 Tue, 26 Apr 2022 09:31:07 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/47] target/arm: Use tcg_constant for gen_{msr,mrs}
Date: Tue, 26 Apr 2022 09:30:20 -0700
Message-Id: <20220426163043.100432-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 501192ed55..2e4165be3d 100644
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
2.34.1


