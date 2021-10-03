Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA77420334
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:04:50 +0200 (CEST)
Received: from localhost ([::1]:50928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5qz-00039Z-Fv
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kL-0002aG-Fz
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:57:57 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kK-0003Jz-3G
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:57:57 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r7so10613591wrc.10
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z+JF3MQH1rPB321dugVt3oY5emnBWy8JVQSDmjDElJM=;
 b=gTN5zezdAI7zDYzDDp0bgpvnbz444LUBIKgTrp+evuNkz4THywspCnymhDPPp6ZGJV
 tc3+V4bU3nonQVxaqTc4DptUpFr5nz4b4RYHMz0PBjGslqY0HUaNDhb+OPfWzpZ6Ah4s
 pZojM4DHnTZdfX/1UlNKe8XwZudn0KZw/emWV2dzZXU+yujqGlNt4v5tQM58OJ1/Oisu
 t58py7SjpVyd2FKJSLCNMyZ1XiGuRiNqMCl4E9nKTGOvpCgtJHPCLuxImuA1FbGMpaeX
 Fdh50VG6nAXhBdfyAeUjS6H2b1/N4dZ/2+QKRoLbBfJi/i2mzT6lWggmtUDRa+b1zMv2
 GbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Z+JF3MQH1rPB321dugVt3oY5emnBWy8JVQSDmjDElJM=;
 b=PcX+a2f4rI1xxuqmode0Qs04DMRohnpbmvTDyO5u74t2nX+qaefpPjoQbZ2u6q5pBZ
 mxxeylpdQJsF4QJg+IOur7H2W3PXQ/bzNYfYLjGoM/D53GBkndpZbq9sObkC2l8zn+A6
 1AuBPkmSLo2QmGXYVJhVSfBz8AIqWE+6qU/U5s7c9HV8w8fQDwdqPbLipovQKn2zAxXZ
 JiZa0Kh+hD08nuH5vG+co4E7vqcUMxfz+F3wb0oAitb2j++05e5rpVFlbsZVP9Q1OrZa
 1uDemn/rlobge+v6k/brU+Yrf2dTv1a4KM98FhvewQFziRCN/eXd/8dyQDNb1wYyyETg
 EFqQ==
X-Gm-Message-State: AOAM5309SymBsno14yvvmE287Slr/MR+dGJhRTDTVU0Q2HC7SRMLQQkE
 37LdZT7jA7uKds0WKJ9M2v46Dk6fQHY=
X-Google-Smtp-Source: ABdhPJxO63WBk+01WFgmdd2dJgUsM4toHKC6jF9Ywk6l0Pl7FwPm2TSbUvkbN1O2tRglg3CFuK0Eww==
X-Received: by 2002:adf:a51e:: with SMTP id i30mr8985653wrb.206.1633283874316; 
 Sun, 03 Oct 2021 10:57:54 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 a17sm2473793wmj.48.2021.10.03.10.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:57:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] target/mips: Use tcg_constant_i32() in gen_msa_elm_df()
Date: Sun,  3 Oct 2021 19:57:37 +0200
Message-Id: <20211003175743.3738710-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003175743.3738710-1-f4bug@amsat.org>
References: <20211003175743.3738710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

Data Format is a 2-bit constant value.
Avoid using a TCG temporary by moving it to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


