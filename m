Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A21430CCA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 00:56:18 +0200 (CEST)
Received: from localhost ([::1]:58174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcF4j-0006UB-1Y
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 18:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1t-0003em-0F
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1r-0000An-Fo
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:20 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 j75-20020a1c234e000000b00323023159e1so559497wmj.2
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nQpq/LuTsNrIIgRzswUPgI1mEqmSmKFQ34DGfTp2hjI=;
 b=E6eJK1D59/pQwYGPwm+vR7jbjH+sxv9gweH+0/81xFt63kNaiBoC+SQAMDOzzdG+HP
 4e6vE0OJS2k58A793ix/0GeXDB9NZkloLRSkPBN99I5xCfwjrZLh3rVCgwOFEINQGRLs
 VITz4TxjHXe98ZYPna6Rxb54pTzkf094lv5UaFheppQwcs/Z/ccLtFQrPWWPgpx5XphY
 uA2541e/KRhFHZOMoVVIT3Kg9zEhNu24oRl3HhVlyFwdpy8qZNbfha94Pd04ndZZRlgo
 iL4eNiq1uO2XhU1zCNyQbVECyDFBhDgfbx1vUgwJDGeSloPdM1VKK88yYFxEK0c7almB
 S09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nQpq/LuTsNrIIgRzswUPgI1mEqmSmKFQ34DGfTp2hjI=;
 b=rbj188FRAcEIL0KT3+walOJg6Evkph88TDgUOpJhMh9MgaKIGTJpFpJs1/heSZ30Nb
 zSuWrTfedFhWcH9MuEMnXPJR6q4nP5/0wga+kP5nZrH2SM9jextLB6Zo5nPlKZps2EEs
 Rs4fQaMI6ZRoLDTVnnB5XN73ogs8S/krkasS1f0ZKQDBA8JpDjdZq3iotAl+S3TqMwMm
 iDXxkGBDSOY8Co6osaPjTRWtdbknxGfouQrKtkHjcbCw8LFP2kepLavEv64zYFaz5HF+
 x4h83foBEeQheSotWySB/KY+3KlXKZlRqgIBf/ihZY7lKNTMKkpcjwDUipRvll2/jR7/
 ZOhw==
X-Gm-Message-State: AOAM531J/fhO65qqQ1bfqxflILogooX9QN/qXt1/fNoFH2CxJxt0Kp6f
 QFSPwQhVaPWF7N/vrlAl7Gm+SEmvUPg=
X-Google-Smtp-Source: ABdhPJw7QQpR8iST+Kc44duehWYj+HGVEsJpJU3oaMABr8p9tgbTIhyk7Aq6/m4KXPWFc4obSr7BaQ==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr42026478wmh.54.1634511197979; 
 Sun, 17 Oct 2021 15:53:17 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id d9sm10906085wrm.96.2021.10.17.15.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/17] target/mips: Use tcg_constant_i32() in gen_msa_elm_df()
Date: Mon, 18 Oct 2021 00:52:34 +0200
Message-Id: <20211017225245.2618892-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Data Format is a 2-bit constant value.
Avoid using a TCG temporary by moving it to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211003175743.3738710-3-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index ee6424126f7..20036ae4968 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1650,7 +1650,7 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
     TCGv_i32 tws = tcg_const_i32(ws);
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tn  = tcg_const_i32(n);
-    TCGv_i32 tdf = tcg_const_i32(df);
+    TCGv_i32 tdf = tcg_constant_i32(df);
 
     switch (MASK_MSA_ELM(ctx->opcode)) {
     case OPC_SLDI_df:
@@ -1748,7 +1748,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
     tcg_temp_free_i32(tn);
-    tcg_temp_free_i32(tdf);
 }
 
 static void gen_msa_elm(DisasContext *ctx)
-- 
2.31.1


