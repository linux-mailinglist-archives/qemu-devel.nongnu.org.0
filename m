Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EA532601C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:35:30 +0100 (CET)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZWz-0006Yf-9u
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTp-0004oZ-Ea
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:32:13 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTn-0003La-U3
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:32:13 -0500
Received: by mail-ed1-x536.google.com with SMTP id d2so10091584edq.10
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a4ipzZEmmv9yQ7oRL/nE8RyKihxalFRY2jdZtuvK//U=;
 b=p3Ps3z14SWvyLU0fwQXkCcWCJEbUS2X17srYzUbjckldM4puERLEDGR2VPaKeDPtZC
 hrFLNU4ZE+AhbtVNPIiaa2oCLfoOCZA9I4xSBLupdTSmPS5oo5IvMxhbjguO8AO7idjk
 2U4jIbLs7lYWWTpt1jMs+GN129+XQWEOgroDaqIJTYcMe1tYDXbO+4ioDSb4aRTOETyz
 93kAaEPSd4lFEr1jc5HkXPPrwhA28xWHzR/itAAkj1uGk8cvvcfRlcUt6xe9tXKOMsZg
 0QRJy4xHLAOxbpk/eiRjdF3lHl+eImOqPOWjCp9igx170ptfpv4O3jym5/MJc7B2Z1b1
 /RQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a4ipzZEmmv9yQ7oRL/nE8RyKihxalFRY2jdZtuvK//U=;
 b=uIQW9y+GvGQZJcpjAdCrCuLxwdXh/XjdU1JWK934OrqqYlBD3lgEMH/K0cI6Rd+UYo
 cLZ9RQ4+YXAdUWB1jial0r/4rqxo425wFaJuRXFNU3cq1HSQgTjq8ne3c234sdQgC7gH
 QmHp5c592EQXqkL4jDxFT7voWe/t/4TUJzizy3eQLhAX2Hx7Ov3eyvxeq9n9GEffPwUL
 d5rrJnLTpbY9r84laTzTbRnFB1/r0iyHN4f+73Ceb+OXi7+kUpzPoemDaJRlj0XbYVhn
 xklwEXNe4Ooh99IXA2My/LcNIrYsLbmOrROPlHX7PoihZolrFCtKSVxCGua3UFZxTFk/
 DISA==
X-Gm-Message-State: AOAM532FiLoDqzvxMe5y7GdSaG2WW8tzPEJzYxt1Ubc8JQRxBiy+zoLm
 CrQKFMPbKDHRg9iauGt65QgxKDyAFiI=
X-Google-Smtp-Source: ABdhPJyJJ3ng6gzMFQyLgCp3ZbZTuk2BvCpM6eV+0ToTvnkYAOZYencOaatFtMz/vJc9f0iZoOEPoQ==
X-Received: by 2002:a05:6402:27d1:: with SMTP id
 c17mr2235507ede.109.1614331930319; 
 Fri, 26 Feb 2021 01:32:10 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id sb4sm2564404ejb.71.2021.02.26.01.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:32:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/13] target/mips: Simplify decode_opc_mxu() ifdef'ry
Date: Fri, 26 Feb 2021 10:31:08 +0100
Message-Id: <20210226093111.3865906-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By making the prototype public and checking
'TARGET_LONG_BITS == 32' we let the compiler
elide the decode_opc_mxu() call.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 3 +++
 target/mips/translate.c | 6 ++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 468e29d7578..a5c49f1ee22 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -178,6 +178,9 @@ extern TCGv bcond;
 /* MSA */
 void msa_translate_init(void);
 
+/* MXU */
+bool decode_ase_mxu(DisasContext *ctx, uint32_t insn);
+
 /* decodetree generated */
 bool decode_isa_rel6(DisasContext *ctx, uint32_t insn);
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index f25b1fe4d8f..84948ab9ce0 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25779,7 +25779,7 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
+bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
@@ -26981,8 +26981,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
 #endif
-#if !defined(TARGET_MIPS64)
-        if (ctx->insn_flags & ASE_MXU) {
+        if (TARGET_LONG_BITS == 32 && (ctx->insn_flags & ASE_MXU)) {
             if (MASK_SPECIAL2(ctx->opcode) == OPC_MUL) {
                 gen_arith(ctx, OPC_MUL, rd, rs, rt);
             } else {
@@ -26990,7 +26989,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         }
-#endif
         decode_opc_special2_legacy(env, ctx);
         break;
     case OPC_SPECIAL3:
-- 
2.26.2


