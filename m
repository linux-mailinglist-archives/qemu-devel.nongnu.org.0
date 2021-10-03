Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1099342032E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:00:10 +0200 (CEST)
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5mS-00053h-Si
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kU-0002iS-NZ
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kT-0003Ss-5E
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:06 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d26so26045701wrb.6
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zN28LoK0n7WogBiC27sRyJmL1zm0wkkrymJdJPui0K8=;
 b=lCMszzerOt0W6S+GW2gZq3LQATrzK6Di1V5xx6XtZPvTrZugnQWJcDNG0oVBkCrnlo
 d+fMYGdsK71KUovubzmAwI1ff5m5nmAB/oMZ1VzvGrKmcE2RINZEoDQ3hRoPbypwSoVI
 8RK45riqdxFwtL9rfN+qh1BT5gXPRS+S3HLIzFdtPiEaGmz0XpDoaw3ke0BS0F+qNc66
 huGVDm5vfjY/FU1ixrWNnGGSTd88+wxyeJCwtkV54W3B/8QN2KBAvXn6GiYLwtwXrNOt
 Mc2SBpE3YYIhuA2GIHKfAzOKEKoe+6JOhKKn86IfBrp29v7lz1MbgNqSoxrnRh/n6exO
 GWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zN28LoK0n7WogBiC27sRyJmL1zm0wkkrymJdJPui0K8=;
 b=350BesaYQoIeSEpgy2KDkMPkjqPTaLruH52UbtN18CVlYX3FtcrNRuInE5vDqtdCnd
 EHhBPBSDPGWWfsFtxWri9Zi5XurMX1+vYEaH9Zu7059XeE4zqjQ1e1uC/y+up77CRxgW
 rRL9WyJlMJclyxwIx+ZmJn3yrqW/0oUcUEffT8yR14bhw86PKDWnCGOSLtDBF/WAIu4P
 IsfbEVMUabhiLfUYI2QIviw/KpYAYt3VPxrk/35trP1Gest2mQP8BnSyw732jWkEnmgx
 6upRdqFdTQTDW172VENOe5t7pUaVVCkK9D+zYaAK6I9Ox09+FZrRmgnyxb2WB8xV+N1i
 fKYw==
X-Gm-Message-State: AOAM5310r4gv+jzrRHBrmmzkmttPpohrVhZIgNV+szTFij7XlvYeGbk9
 1rAI+UfwdJPSHsOhafEgV9GcuJLanZk=
X-Google-Smtp-Source: ABdhPJxeLyETKmygx3tyus9BOqZyK6kgYmlTDp38a3YFsAySC+L2AIGjyWg67CzaKfG+ex8fBxgrvg==
X-Received: by 2002:a5d:4b11:: with SMTP id v17mr9700086wrq.313.1633283883566; 
 Sun, 03 Oct 2021 10:58:03 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 m21sm13178388wmq.37.2021.10.03.10.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:58:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] target/mips: Use tcg_constant_i32() in gen_msa_2r()
Date: Sun,  3 Oct 2021 19:57:39 +0200
Message-Id: <20211003175743.3738710-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003175743.3738710-1-f4bug@amsat.org>
References: <20211003175743.3738710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using a TCG temporary by moving Data Format to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 5e8f80f2f23..bbe9146513a 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1946,7 +1946,6 @@ static void gen_msa_2r(DisasContext *ctx)
     uint8_t df = (ctx->opcode >> 16) & 0x3;
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 tdf = tcg_const_i32(df);
 
     switch (MASK_MSA_2R(ctx->opcode)) {
     case OPC_FILL_df:
@@ -1957,7 +1956,8 @@ static void gen_msa_2r(DisasContext *ctx)
             break;
         }
 #endif
-        gen_helper_msa_fill_df(cpu_env, tdf, twd, tws); /* trs */
+        gen_helper_msa_fill_df(cpu_env, tcg_constant_i32(df),
+                               twd, tws); /* trs */
         break;
     case OPC_NLOC_df:
         switch (df) {
@@ -2015,7 +2015,6 @@ static void gen_msa_2r(DisasContext *ctx)
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(tdf);
 }
 
 static void gen_msa_2rf(DisasContext *ctx)
-- 
2.31.1


