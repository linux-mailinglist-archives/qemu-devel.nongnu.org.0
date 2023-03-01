Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F346A664B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCiu-0004px-14; Tue, 28 Feb 2023 22:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002Y6-E0
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiR-0004KL-RF
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:17 -0500
Received: by mail-pl1-x62f.google.com with SMTP id n6so11185474plf.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhL2WzjGmls46D+quq34ze/ulksmGA+cQwYE9pUognw=;
 b=SdxEVoqkFMV3pZnsIZOLozG9xVsi6PURV8489bppbfijjzvyDNUH3vX3uCisHYpTAY
 xgFL8WUUQpK4zef/phUDqYmpBtqT6y7jI0QL2Tae+61oYURt0wbm3Ti0G0+xb8Ihyuqx
 VbtjBkaSCXOjM2RtmiG4QN0/yftf8ZDlHseYrGkzRXw325kadYDbpLGejTo4NYzdbyBg
 Sx/GZ6FxccphskRCD/ayzrdvcxFzoj7LDNWsUyp2+D+E5BlmPKFVH0nTCUDaRCDgGuXH
 bC+L3iFDtXEWxuhoQRfr7MNPNxaUWyf9Xu54izaFxQopzCqr/uf0py7Gr2HA0zRD16E7
 8P5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhL2WzjGmls46D+quq34ze/ulksmGA+cQwYE9pUognw=;
 b=HgtAcEw7Pk5F+qcnwHdSaG8kZO/LKAgxv5FgkFAE5YY4hbnebVqNqEAECy7Bfbkaqg
 XvND/zdKln2ytSM+SmKkEYm40xNpAW10XGJNS5AW67rrLFkcWt6wFnmhPWRtRd1yuLbb
 P7Z0YnhCSq7zEAQGpFhF4tJ9fjKufeMCE08Gly4jIJq0DfIqOwkPy1CDG0ukvzhMGF1Q
 7L5Kl9eb3MI203ZW8DOho0pudbJW8PbUkr/JvJmbtq7WxEtplmK4p3laG0p31oLUuKB6
 N3puA2XUQhfOFZHdxx16kG91uCxW6GR/2AUKNzA7YIE70cGbLKqt5lOEv3bZgku5xTz3
 Btew==
X-Gm-Message-State: AO0yUKWavNNBEwcIMBfDzKYN0w7Y1kaLK/RxnNYAsiq7HwtkQEJUoQGU
 6DYOtSF1PG42q2T3BwsjUSNNAeowpGuxegJJ1+0=
X-Google-Smtp-Source: AK7set9pRIApz4Cr7RBL7Fo3kPUZLPDrSmG2PB/jDcIXZqudDOgwQfdaO7okCUP6n4lX2Y7aSi0Xeg==
X-Received: by 2002:a17:903:120d:b0:19c:bcb4:cacb with SMTP id
 l13-20020a170903120d00b0019cbcb4cacbmr5285921plh.56.1677639674431; 
 Tue, 28 Feb 2023 19:01:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 52/62] target/cris: Don't use tcg_temp_local_new
Date: Tue, 28 Feb 2023 16:56:33 -1000
Message-Id: <20230301025643.1227244-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since tcg_temp_new is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         |  6 +++---
 target/cris/translate_v10.c.inc | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 905d01288e..a959b27373 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -1621,7 +1621,7 @@ static int dec_bound_r(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("bound.%c $r%u, $r%u\n",
             memsize_char(size), dc->op1, dc->op2);
     cris_cc_mask(dc, CC_MASK_NZ);
-    l0 = tcg_temp_local_new();
+    l0 = tcg_temp_new();
     dec_prep_move_r(dc, dc->op1, dc->op2, size, 0, l0);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], cpu_R[dc->op2], l0, 4);
     tcg_temp_free(l0);
@@ -2404,8 +2404,8 @@ static int dec_bound_m(CPUCRISState *env, DisasContext *dc)
             dc->op1, dc->postinc ? "+]" : "]",
             dc->op2);
 
-    l[0] = tcg_temp_local_new();
-    l[1] = tcg_temp_local_new();
+    l[0] = tcg_temp_new();
+    l[1] = tcg_temp_new();
         insn_len = dec_prep_alu_m(env, dc, 0, memsize, l[0], l[1]);
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], l[0], l[1], 4);
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index f500e93447..9660f28584 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -68,9 +68,9 @@ static void gen_store_v10_conditional(DisasContext *dc, TCGv addr, TCGv val,
                        unsigned int size, int mem_index)
 {
     TCGLabel *l1 = gen_new_label();
-    TCGv taddr = tcg_temp_local_new();
-    TCGv tval = tcg_temp_local_new();
-    TCGv t1 = tcg_temp_local_new();
+    TCGv taddr = tcg_temp_new();
+    TCGv tval = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
     dc->postinc = 0;
     cris_evaluate_flags(dc);
 
@@ -434,7 +434,7 @@ static void dec10_reg_bound(DisasContext *dc, int size)
 {
     TCGv t;
 
-    t = tcg_temp_local_new();
+    t = tcg_temp_new();
     t_gen_zext(t, cpu_R[dc->src], size);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[dc->dst], t, 4);
     tcg_temp_free(t);
@@ -935,7 +935,7 @@ static int dec10_ind_bound(CPUCRISState *env, DisasContext *dc,
     int rd = dc->dst;
     TCGv t;
 
-    t = tcg_temp_local_new();
+    t = tcg_temp_new();
     insn_len += dec10_prep_move_m(env, dc, 0, size, t);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[rd], t, 4);
     if (dc->dst == 15) {
-- 
2.34.1


