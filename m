Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9826B2E6D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:17:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaA-00042j-BY; Thu, 09 Mar 2023 15:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa6-0003vd-RA
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:42 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa5-0001YR-AM
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:42 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so3020780pjp.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zWXPWsNn/T5rs7QBqKWIBFLCiOz5GjmUC081+TrIco=;
 b=Am++shUME0ie8s0Zxix9QQmo6nmTF7+7JPvDJn03u1/JyMt+dWwyNfSy0rgmpt21ZJ
 CznWh3fv4z923dXIghIceZaapXlDeL0MYg2kCtJz3ZIUdNX15xmyTASscOHNTpjPUf6K
 iu5Gijnvv/r7ikQNqOr6pNdFw0HT5uQr5RwsBXu1XFvEq705IUDMDi7WhfTqEeR7ufWt
 cy+4OIY4rWLpqvAcRf0QdfnbO64jIanoC7Q5SmpbIygHxkaPogcR+kVd9+Vy1kvJuR3q
 rq3TOqamqD8PMdJ4z9TB1pao0J8OaGbf7qiTQ6eaojuVQJ11ECo1AbByGQLPInl8i20S
 wiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zWXPWsNn/T5rs7QBqKWIBFLCiOz5GjmUC081+TrIco=;
 b=albkbcKreb3CakCVo4FUkPEdJ1GA1Bb5ki49ohoaMC7ZL67UJmilXOpTGEr5gohFW0
 WPT8LV5KC1/fqhKduf9fT/2GKZez34R04vy6otZUgbC/nYPYREdBwsAH+aSGdSHUYiUo
 SzkQm+YD1IZvB6BKFyDAr1T4Q+vAHgZo4ZCMdwzdc9w6awsJZaARcpdwC6OpiSn4RcSf
 HgBpnc3wNYn7Ae79fUv0uuj1oTuApDkozscrKXpALLA/cLWHQTiMKlFRq4Q5Z3uHwmhr
 Ftk0akEHPK9yPO7O9b5E4/+7j7mjk9T4Gb/DUayVCyWrfiwbci+XS5q5alDrV3/O7bDU
 PULQ==
X-Gm-Message-State: AO0yUKXKokXW23KYR01B5M2Ei0CTgApLuU5xoV784LG3z+HjXPfVFUHG
 3XkxMOxTjrpIPttODgh36WjkW30rMmeMjuyzKFo=
X-Google-Smtp-Source: AK7set/3G/s1BSm8W1JBbpDqsJyUjT58YG1RHTOsk3ZPdxDQY6OPlx+VPYbph3ABkDhmUfie00PzIg==
X-Received: by 2002:a17:902:d543:b0:19b:22c2:26a1 with SMTP id
 z3-20020a170902d54300b0019b22c226a1mr22782568plf.9.1678392580098; 
 Thu, 09 Mar 2023 12:09:40 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 54/91] target/rx: Use tcg_gen_abs_i32
Date: Thu,  9 Mar 2023 12:05:13 -0800
Message-Id: <20230309200550.3878088-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Remove the local definition of rx_abs.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 6624414739..998e6e0b7e 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -1126,21 +1126,11 @@ static bool trans_SBB_mr(DisasContext *ctx, arg_SBB_mr *a)
     return true;
 }
 
-static void rx_abs(TCGv ret, TCGv arg1)
-{
-    TCGv neg;
-    TCGv zero;
-    neg = tcg_temp_new();
-    zero = tcg_const_i32(0);
-    tcg_gen_neg_i32(neg, arg1);
-    tcg_gen_movcond_i32(TCG_COND_LT, ret, arg1, zero, neg, arg1);
-}
-
 /* abs rd */
 /* abs rs, rd */
 static bool trans_ABS_rr(DisasContext *ctx, arg_ABS_rr *a)
 {
-    rx_gen_op_rr(rx_abs, a->rd, a->rs);
+    rx_gen_op_rr(tcg_gen_abs_i32, a->rd, a->rs);
     return true;
 }
 
-- 
2.34.1


