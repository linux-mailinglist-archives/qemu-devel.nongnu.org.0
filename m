Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480594385BF
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:13:02 +0200 (CEST)
Received: from localhost ([::1]:52522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePG9-0004C7-Bi
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuW-0007su-OY
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:43 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuR-0006Fi-Gz
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id m42so6573336wms.2
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hFBg7Xzxc2sF0VEfzsaEDrCd/QEx1NCLFI179J2xsC8=;
 b=Mnt7o3k93l07KIO71V/yFO8nil6ft07wik+jPArGKgNtnJcWBTC+dkDKRkHKaQjfNL
 ZllQpxBQYArdJD2JdKmAM2Zcd3zSx9CLijNLa4YQG/fstZQ+k0oS4b4BCFO9nCPZLo7S
 EAHMebhQl7hcAI4rFd9BHIi/QVPCelysmDYRFFFGEmhbsiiDmnH+d6oUZp2z3/QLbmaA
 vBOReKsNKz9KU+JsaX7MEp0sFp539j7tgDkhWU57r7suUUApkdnq4O2N/Gvylac/Mqdj
 fd1ljUh8pxul9NMHDeZXrff9C0l7lwauhBlUaMZfb0z8eaDct/v4xO+aZlhAz7rMmSQb
 CZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hFBg7Xzxc2sF0VEfzsaEDrCd/QEx1NCLFI179J2xsC8=;
 b=Sj31FgrPDYpAVfW9EguUEWVhM/rJ25BUylVF5ilFRvyjhJ+iwn9ez1kggDmGwr6ZvH
 A1Sgt/2eUZuzPrl3LTHZn4OePhVqPcXknRlmt00sX8Cjn8TONHlVf/AjcF5/A9XxQ0E0
 MeSLHXGLGD9iwK4ZqzjpWt6muzRD9aQ/nhqhTwxtFYoyriSaAHenPZS+YgyHqhRC7pqq
 jrngp5KLJRycAedeaHA5hFcot1pgQpYhU/jVVg1J9AmEUxM2gjGMi1FV2wTkth72U/1P
 RdXeyI2CZCQZkZaAuZYjIKrQMcnymKJObaYfZOStrY43attN0ozSFP0Fl0Cz5dTPtaFJ
 sptQ==
X-Gm-Message-State: AOAM533pbnBGJ5BgQl8y03nKVjBARlwoP7FwraAHTgE3Hg5B/0j1p0FF
 BOgr7U3Fh6yFwdm3jh1+HoP0wp2oxfA=
X-Google-Smtp-Source: ABdhPJx16EnYMuqyLDx6SHqgVIIMJZDskLN9zvR6/ae3D5ig/8jmySKGsaCNsareYaX92FIrEVtFvA==
X-Received: by 2002:a1c:c908:: with SMTP id f8mr38353804wmb.142.1635025834073; 
 Sat, 23 Oct 2021 14:50:34 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 19sm5816726wmb.24.2021.10.23.14.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:50:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/33] target/mips: Convert CFCMSA and CTCMSA opcodes to
 decodetree
Date: Sat, 23 Oct 2021 23:48:00 +0200
Message-Id: <20211023214803.522078-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the CFCMSA (Copy From Control MSA register) and
CTCMSA (Copy To Control MSA register) opcodes to decodetree.

Since they respectively overlap with the SLDI and SPLATI
opcodes, use decodetree overlap groups.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      | 10 +++-
 target/mips/tcg/msa_translate.c | 95 ++++++++++++---------------------
 2 files changed, 42 insertions(+), 63 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 1bde1983de3..52dac0fde6d 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -155,8 +155,14 @@ BNZ                 010001 111 .. ..... ................    @bz
   HSUB_S            011110 110.. ..... ..... .....  010101  @3r
   HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
-  SLDI              011110 0000 ...... ..... .....  011001  @elm_df
-  SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  {
+    CTCMSA          011110 0000111110  ..... .....  011001  @elm
+    SLDI            011110 0000 ...... ..... .....  011001  @elm_df
+  }
+  {
+    CFCMSA          011110 0001111110  ..... .....  011001  @elm
+    SPLATI          011110 0001 ...... ..... .....  011001  @elm_df
+  }
   {
     MOVE_V          011110 0010111110  ..... .....  011001  @elm
     COPY_S          011110 0010 ...... ..... .....  011001  @elm_df
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index b03cde964e0..51af6f39cc4 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -20,19 +20,6 @@
 /* Include the auto-generated decoder.  */
 #include "decode-msa.c.inc"
 
-#define OPC_MSA (0x1E << 26)
-
-#define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
-enum {
-    OPC_MSA_ELM     = 0x19 | OPC_MSA,
-};
-
-enum {
-    /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
-    OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-};
-
 static const char msaregnames[][6] = {
     "w0.d0",  "w0.d1",  "w1.d0",  "w1.d1",
     "w2.d0",  "w2.d1",  "w3.d0",  "w3.d1",
@@ -552,33 +539,46 @@ static bool trans_MOVE_V(DisasContext *ctx, arg_msa_elm *a)
     return true;
 }
 
-static void gen_msa_elm_3e(DisasContext *ctx)
+static bool trans_CTCMSA(DisasContext *ctx, arg_msa_elm *a)
 {
-#define MASK_MSA_ELM_DF3E(op)   (MASK_MSA_MINOR(op) | (op & (0x3FF << 16)))
-    uint8_t source = (ctx->opcode >> 11) & 0x1f;
-    uint8_t dest = (ctx->opcode >> 6) & 0x1f;
-    TCGv telm = tcg_temp_new();
-    TCGv_i32 tsr = tcg_const_i32(source);
-    TCGv_i32 tdt = tcg_const_i32(dest);
+    TCGv telm;
+    TCGv_i32 tdt;
 
-    switch (MASK_MSA_ELM_DF3E(ctx->opcode)) {
-    case OPC_CTCMSA:
-        gen_load_gpr(telm, source);
-        gen_helper_msa_ctcmsa(cpu_env, telm, tdt);
-        break;
-    case OPC_CFCMSA:
-        gen_helper_msa_cfcmsa(telm, cpu_env, tsr);
-        gen_store_gpr(telm, dest);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
+    if (!check_msa_access(ctx)) {
+        return false;
     }
 
+    telm = tcg_temp_new();
+    tdt = tcg_const_i32(a->wd);
+
+    gen_load_gpr(telm, a->ws);
+    gen_helper_msa_ctcmsa(cpu_env, telm, tdt);
+
     tcg_temp_free(telm);
     tcg_temp_free_i32(tdt);
+
+    return true;
+}
+
+static bool trans_CFCMSA(DisasContext *ctx, arg_msa_elm *a)
+{
+    TCGv telm;
+    TCGv_i32 tsr;
+
+    if (!check_msa_access(ctx)) {
+        return false;
+    }
+
+    telm = tcg_temp_new();
+    tsr = tcg_const_i32(a->ws);
+
+    gen_helper_msa_cfcmsa(telm, cpu_env, tsr);
+    gen_store_gpr(telm, a->wd);
+
+    tcg_temp_free(telm);
     tcg_temp_free_i32(tsr);
+
+    return true;
 }
 
 static bool trans_msa_elm_df(DisasContext *ctx, arg_msa_elm *a,
@@ -676,19 +676,6 @@ TRANS_DF_D64(COPY_S,    trans_msa_elm_d64, gen_helper_msa_copy_s);
 TRANS_DF_W64(COPY_U,    trans_msa_elm_d64, gen_helper_msa_copy_u);
 TRANS_DF_D64(INSERT,    trans_msa_elm_d64, gen_helper_msa_insert);
 
-static void gen_msa_elm(DisasContext *ctx)
-{
-    uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
-
-    if (dfn == 0x3E) {
-        /* CTCMSA, CFCMSA */
-        gen_msa_elm_3e(ctx);
-        return;
-    }
-
-    gen_reserved_instruction(ctx);
-}
-
 static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
                           enum CPUMIPSMSADataFormat df_base,
                           void (*gen_msa_3rf)(TCGv_ptr, TCGv_i32, TCGv_i32,
@@ -880,21 +867,7 @@ TRANS_MSA(BSEL_V,   trans_msa_vec, gen_helper_msa_bsel_v);
 
 static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
-    uint32_t opcode = ctx->opcode;
-
-    if (!check_msa_access(ctx)) {
-        return false;
-    }
-
-    switch (MASK_MSA_MINOR(opcode)) {
-    case OPC_MSA_ELM:
-        gen_msa_elm(ctx);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
+    gen_reserved_instruction(ctx);
 
     return true;
 }
-- 
2.31.1


