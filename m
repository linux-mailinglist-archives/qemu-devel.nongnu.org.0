Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693583CF145
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:24:07 +0200 (CEST)
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eUQ-0002zr-Fw
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOg-0006TE-OW
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:10 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOf-0003MY-Am
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:10 -0400
Received: by mail-pl1-x631.google.com with SMTP id d1so10676222plg.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yz3cpE1v3usKVqxRjbCaLbAnRr3RaTGtZYXFSmK7X+Q=;
 b=AjOiiVboOU3r3ddghrq9H/7I5Zz2qy4CBJq9fdFUf1S9dE//G6B9E0Hxxm0mp00J5W
 OaF7DNPLvp+RAnGGbSitErrteZgsDyaBPzcvdvduWPZ2Ay5yGyRcB46WkYIzjsB+BoSV
 oIWvzXSrlUHm7FWmVpJrfPReL6PLYfdFpu7yGu0OyjvwnpNKcWMHh+WIwxaKGvX1w++T
 4cpuMQOY0ubJwD0kqdTK/flX4/zExhubKV4T+WySDH68wWO6THSYZm1Vq0wUI+cdZPRD
 +7ovze7dPGEtdjGrcSXmUd+865i/9j4SEwd8YYqtLvsb2Q1QGBmlKyz2dkTmI+4aACrS
 fIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yz3cpE1v3usKVqxRjbCaLbAnRr3RaTGtZYXFSmK7X+Q=;
 b=DHSrPMKDVHi6Eb9eaypjMfleiK9aM2TV7xZg9IxZMVkmzSoNwGp+zc292Svof3hIfR
 WpUXFCd1JbjhzDy2eUC704ow6D9Z885QJSs+95aRnChmEgwALRTtZTjeU4SNOerq1Rtv
 DC+A7L2izzHucd0ehBDl7eS0uz08WWRPsiubN4fRfSG0JQSfnWR9WNsvZUbU69lOfHTA
 t8n3ASGxEv3Ov5ErRGj2g1eWcGcGdozn93+C9CgZokDXyJEW8DTPKZ1xQ2cU+oEXIiJ/
 mmYKwSb+F0s/9mu+LYy5yfC2ZA0I6/KZ2TfRZAjoYW95jwmhWaclD15pG0yZdfH8UzxZ
 LTjg==
X-Gm-Message-State: AOAM5321/P+bnnZ8mI0QRvdvksayBP56VnADRvW8gEhrYAMcklgwbpWc
 kC30Ywo8gKc8nskQ5WppBo0p6jtW1cuHaw==
X-Google-Smtp-Source: ABdhPJwydmyJW9paoDray5/pPhlpoWPBXNJ+JH399RCY19drPMGLo9jVw9dJO55/abnVrMpynBFwZQ==
X-Received: by 2002:a17:90a:f198:: with SMTP id
 bv24mr27235803pjb.171.1626743888096; 
 Mon, 19 Jul 2021 18:18:08 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 03/15] target/alpha: Drop goto_tb path in
 gen_call_pal
Date: Mon, 19 Jul 2021 15:17:48 -1000
Message-Id: <20210720011800.483966-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are certain of a page crossing here, entering the
PALcode image, so the call to use_goto_tb that should
have been here will never succeed.

We are shortly going to add an assert to tcg_gen_goto_tb
that would trigger for this case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 103c6326a2..949ba6ffde 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -1207,19 +1207,8 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
                   ? 0x2000 + (palcode - 0x80) * 64
                   : 0x1000 + palcode * 64);
 
-        /* Since the destination is running in PALmode, we don't really
-           need the page permissions check.  We'll see the existence of
-           the page when we create the TB, and we'll flush all TBs if
-           we change the PAL base register.  */
-        if (!ctx->base.singlestep_enabled) {
-            tcg_gen_goto_tb(0);
-            tcg_gen_movi_i64(cpu_pc, entry);
-            tcg_gen_exit_tb(ctx->base.tb, 0);
-            return DISAS_NORETURN;
-        } else {
-            tcg_gen_movi_i64(cpu_pc, entry);
-            return DISAS_PC_UPDATED;
-        }
+        tcg_gen_movi_i64(cpu_pc, entry);
+        return DISAS_PC_UPDATED;
     }
 #endif
 }
-- 
2.25.1


