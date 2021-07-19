Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD13CEE1D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:29:08 +0200 (CEST)
Received: from localhost ([::1]:42252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ap1-00020A-G0
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aiw-0003sY-Pz
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:50 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aiv-0000mh-7o
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:50 -0400
Received: by mail-pg1-x52e.google.com with SMTP id y17so20488106pgf.12
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yz3cpE1v3usKVqxRjbCaLbAnRr3RaTGtZYXFSmK7X+Q=;
 b=Vuj59YEt3CTRu3ibvbow28G/DBoewW7w6p4G8Zo/tvRQM31LTx5PGNPNCdHD/pcdTH
 ndFncCbgW0mHZ5A6Q3IEMkFbGdgjdEBegLCW/3qj5SNUg21PGF+CC27ADqNMgmjP6piT
 V+/Hxl3bc5PkVG5FagiyJJTnqsU80ME3YB073sNSp63Ni48wHtNTCQ0rgVfT2hhlmKA/
 LVi4OoPonu226WvZT3gQaWazkaK96dik47WOITU98EgiiLavbfJHGyg1JI6RYNx7+yDQ
 +imBFm8UMdYbAgj+Dwe24zcfkRjNAONuJXiC4CBjR9jU63j6j4zp91lTUiy3TME3O8lh
 taXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yz3cpE1v3usKVqxRjbCaLbAnRr3RaTGtZYXFSmK7X+Q=;
 b=JVo2U76hQLtMtJ2sMw00NpgApXxCCGwAb4jflusf+3iglSp5BoemeAiVUFRMbYqbD7
 Lc+atDjgVYubBRUp1IwI33AW+Tfs0kRJrL/ROzQtPrEiCmSnrua4nMXoMRXxfuaniEWa
 g+3y/Ynd/8RUwTGxBQH6uhGvbqRdkfprgf3Y/MfE/DAvV4akGqm3mZUoOffzlyuMBWmG
 LnuQO0y6d36bzCT9eiCQN9N+Y+iuJ695PB2fEs1XB53D9VOZZMIn7AVytKGEqHRuzPMR
 X8UOrOeiNRMsfSlRUjbUG3stCXc2W/NX6g3WOHIMdaxCTWFjGU6oyC626ljS1SBDHUrc
 vpUQ==
X-Gm-Message-State: AOAM53083K4NLMtVlDwxK7OzoUGhv95/jZvac1aOrtqzawiJIr5pvGTV
 kLZ/KyOEs9vGYa+xeEZqZh7kHVVMAqO+dQ==
X-Google-Smtp-Source: ABdhPJxGhyUOBqNOpdbXx/W8keOAdX8PrlAetN9xWizWjJDb5usKjJw9tcczev9Y31t36iwXsH2+vQ==
X-Received: by 2002:a65:568c:: with SMTP id v12mr27988732pgs.88.1626729767816; 
 Mon, 19 Jul 2021 14:22:47 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 03/15] target/alpha: Drop goto_tb path in
 gen_call_pal
Date: Mon, 19 Jul 2021 11:22:27 -1000
Message-Id: <20210719212239.428740-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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


