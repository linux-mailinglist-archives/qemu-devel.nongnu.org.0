Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AAB33A0DE
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:04:53 +0100 (CET)
Received: from localhost ([::1]:45770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAVI-00086B-4J
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGo-0008GF-Ry
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:54 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGn-0007JN-7u
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:54 -0500
Received: by mail-wm1-x32e.google.com with SMTP id d191so5742426wmd.2
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIVV/9uuQ0QDB8mjniywDP78vHWVrFUcutHKOjxeu00=;
 b=LCmvFkC5tfFJAC515wRtBmMaZqV0sswkiI3xzUpxRLBdUXaS/aiSvsdNEGm3ooPsCJ
 mZQISBglgfIKn94sw/o0JCEQFdjSqDMcXXDLs2BWv6L6ezbzOBrcwa/lf5Y2W79uxuI4
 4PWtJ83CNAd6rlEeX89qcolTHMHX6gv52dRHWcI5qghSQjZgELvHsKiDhxo9fj4BSFWO
 ZjTQwt8Xps19SvT0DfWMBfurczDwur6Ygp1hX2mN96fB/rnxBNmlLhRYa8OSAlhe6Odg
 AFBBT+W0bnjAUHDuvb7U6cYOedXepRsK9c2ALIlu/EsGUppNbWHPK86exr4hDSUhbcWJ
 WZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BIVV/9uuQ0QDB8mjniywDP78vHWVrFUcutHKOjxeu00=;
 b=aqXaSZ7NIB1dBq9ElQrbiUsgWDRxbRj4YUu4prFBjyzp/s7VaYR8qKN2a2rXkyAFK0
 GX4R7ZEiX3CA+DN3yxU+sXZHWy+3CTbsJprOnU7guGTJip34n2EiR9UsZR3vRGTkNlKC
 vHezdVsBD1rCPtGR+fvLR85O4aoP/A+KffZzoUkhxu4Qt65wlQ3g0B0jxSMxuZGdck8g
 24lf2O74O0iE4Ke1AZJ4Awf1fcJLExpcz+nXEIy3FDiqNTI35eB6BEoSGW+4Hn9Y3ZyE
 BqA371pTsaMH3JXD8pY9pytcdlTL+IA2JXGFL4110/+LD2Yyt5aQAMlN9D52hARSMD7u
 Iwcg==
X-Gm-Message-State: AOAM531vGarTmpsVNipe8q0rTKmMpwTJc3DKIf6W2hdGYbYDH1nH8bTk
 +iGJUwnSdqHb7N3zh0VZOc7cGuv3OAIP9Q==
X-Google-Smtp-Source: ABdhPJxOGzliazRG960/8mmm9Bd9kFkUKDJkoAKRkSyE1ePh7TBU2XO6bZl/2PFy+33BHmfICs+hJw==
X-Received: by 2002:a1c:cc08:: with SMTP id h8mr19170450wmb.188.1615664991693; 
 Sat, 13 Mar 2021 11:49:51 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g5sm13252034wrq.30.2021.03.13.11.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/27] target/mips: Simplify decode_opc_mxu() ifdef'ry
Date: Sat, 13 Mar 2021 20:48:18 +0100
Message-Id: <20210313194829.2193621-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index 99269cd6691..2139109744f 100644
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


