Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE694385C0
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:13:29 +0200 (CEST)
Received: from localhost ([::1]:54270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePGZ-0005LD-Ek
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtk-0006lo-7c
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOth-0005nA-B7
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 g201-20020a1c20d2000000b00327775075f7so126685wmg.5
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zRLAt8udUNKq0HVc05uP2X7/xjNCiQRVmBo+fRVE4WY=;
 b=piLeJhAYAX4yxFtCEP27w0bCixBldPmqTpkzP6cU6dxPNeOvan055EWteR8o/h6DcD
 P6JR6FrE3tt1/yMuAyxyHKXclImekcNoWrla3tqnE6u7p8NVIaB2uaidJCP8Kv4/CAS4
 gjwI0WEAS9yHpTqmaR7Qt5VRrQmv3vwXcopPomXI+Spr9lN0+nXK4OWxwhltFl71OUit
 I48zG33LxUGg8ID+jF5i8tS/JBvD48cTqf8Bmcfs0JAPqiRcHTddRHn4MKcssC2uUznI
 WmbPVRnCnxKbYE9vDN8Eun6azqH9qwxc8hjoo0wRWSjSIivbajiK0nz/QNckEE5TuN2c
 9nHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zRLAt8udUNKq0HVc05uP2X7/xjNCiQRVmBo+fRVE4WY=;
 b=YmtdVx4NDSheukcyfhtdp8l+NvQvBkx6X9xm2z+yp7KwQEgoG6ccodJnGOAG9MLayL
 DgmUEkKiZxy2DJUz2Dg/DM86EC5ud2qUZUyEaloa7/WbIMarjDZ7E/cCkjer1mp8q3mo
 ACM6pW6MZeTtKwV7BFT3+2iUg7vwXq8w3EvDMESNsE43CxdM5ADZH9LOgVF/1NrUKfmC
 FjeeYB+nQAGLnl//4mXwLkugH+daKnkfUMrqlnx0TRi5K61C3IqmHzCt4XQHB5oVKSCa
 fgfB4rnbFYZDe+MPDtbekaMa9kJi2YJ6b0faS+2c2b7DwTdSI9E10ARzX9ikp7AUSLIr
 GDbQ==
X-Gm-Message-State: AOAM5327J6Jh9qawBao7fkpcDtlWnczlyEqaoeXiYh/rufzWYIpdDUfU
 M3l3XhoNYfx3MZNvL0Ir89c67ssnjuI=
X-Google-Smtp-Source: ABdhPJx8t9pviNSSL2nvjgvtrWQmvUskT9a6W3Tmfd7qLBbrgXnlV/sgdFMKGsbfsmE4rdM/9mdWwQ==
X-Received: by 2002:a7b:cc8c:: with SMTP id p12mr9360121wma.105.1635025787340; 
 Sat, 23 Oct 2021 14:49:47 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 u17sm2760940wrp.93.2021.10.23.14.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/33] target/mips: Convert MSA 3RF instruction format to
 decodetree (DF_WORD)
Date: Sat, 23 Oct 2021 23:47:51 +0200
Message-Id: <20211023214803.522078-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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

Convert 3-register floating-point or fixed-point operations
to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  37 ++++++
 target/mips/tcg/msa_translate.c | 213 ++++++--------------------------
 2 files changed, 74 insertions(+), 176 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 5c6a7415271..28b7a71d930 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -79,9 +79,46 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
+  FCUN              011110 0001 . ..... ..... ..... 011010  @3rf
+  FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf
+  FCUEQ             011110 0011 . ..... ..... ..... 011010  @3rf
+  FCLT              011110 0100 . ..... ..... ..... 011010  @3rf
+  FCULT             011110 0101 . ..... ..... ..... 011010  @3rf
+  FCLE              011110 0110 . ..... ..... ..... 011010  @3rf
+  FCULE             011110 0111 . ..... ..... ..... 011010  @3rf
+  FSAF              011110 1000 . ..... ..... ..... 011010  @3rf
+  FSUN              011110 1001 . ..... ..... ..... 011010  @3rf
+  FSEQ              011110 1010 . ..... ..... ..... 011010  @3rf
+  FSUEQ             011110 1011 . ..... ..... ..... 011010  @3rf
+  FSLT              011110 1100 . ..... ..... ..... 011010  @3rf
+  FSULT             011110 1101 . ..... ..... ..... 011010  @3rf
+  FSLE              011110 1110 . ..... ..... ..... 011010  @3rf
+  FSULE             011110 1111 . ..... ..... ..... 011010  @3rf
+
+  FADD              011110 0000 . ..... ..... ..... 011011  @3rf
+  FSUB              011110 0001 . ..... ..... ..... 011011  @3rf
+  FMUL              011110 0010 . ..... ..... ..... 011011  @3rf
+  FDIV              011110 0011 . ..... ..... ..... 011011  @3rf
+  FMADD             011110 0100 . ..... ..... ..... 011011  @3rf
+  FMSUB             011110 0101 . ..... ..... ..... 011011  @3rf
+  FEXP2             011110 0111 . ..... ..... ..... 011011  @3rf
+  FEXDO             011110 1000 . ..... ..... ..... 011011  @3rf
+  FTQ               011110 1010 . ..... ..... ..... 011011  @3rf
+  FMIN              011110 1100 . ..... ..... ..... 011011  @3rf
+  FMIN_A            011110 1101 . ..... ..... ..... 011011  @3rf
+  FMAX              011110 1110 . ..... ..... ..... 011011  @3rf
+  FMAX_A            011110 1111 . ..... ..... ..... 011011  @3rf
+
+  FCOR              011110 0001 . ..... ..... ..... 011100  @3rf
+  FCUNE             011110 0010 . ..... ..... ..... 011100  @3rf
+  FCNE              011110 0011 . ..... ..... ..... 011100  @3rf
   MUL_Q             011110 0100 . ..... ..... ..... 011100  @3rf
   MADD_Q            011110 0101 . ..... ..... ..... 011100  @3rf
   MSUB_Q            011110 0110 . ..... ..... ..... 011100  @3rf
+  FSOR              011110 1001 . ..... ..... ..... 011100  @3rf
+  FSUNE             011110 1010 . ..... ..... ..... 011100  @3rf
+  FSNE              011110 1011 . ..... ..... ..... 011100  @3rf
   MULR_Q            011110 1100 . ..... ..... ..... 011100  @3rf
   MADDR_Q           011110 1101 . ..... ..... ..... 011100  @3rf
   MSUBR_Q           011110 1110 . ..... ..... ..... 011100  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 6e50bc9edf4..4543b7abdfb 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -34,9 +34,6 @@ enum {
     OPC_MSA_3R_14   = 0x14 | OPC_MSA,
     OPC_MSA_3R_15   = 0x15 | OPC_MSA,
     OPC_MSA_ELM     = 0x19 | OPC_MSA,
-    OPC_MSA_3RF_1A  = 0x1A | OPC_MSA,
-    OPC_MSA_3RF_1B  = 0x1B | OPC_MSA,
-    OPC_MSA_3RF_1C  = 0x1C | OPC_MSA,
 };
 
 enum {
@@ -115,43 +112,6 @@ enum {
     OPC_COPY_U_df   = (0x3 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSVE_df    = (0x5 << 22) | (0x00 << 16) | OPC_MSA_ELM,
-
-    /* 3RF instruction _df(bit 21) = _w, _d */
-    OPC_FCAF_df     = (0x0 << 22) | OPC_MSA_3RF_1A,
-    OPC_FADD_df     = (0x0 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCUN_df     = (0x1 << 22) | OPC_MSA_3RF_1A,
-    OPC_FSUB_df     = (0x1 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCOR_df     = (0x1 << 22) | OPC_MSA_3RF_1C,
-    OPC_FCEQ_df     = (0x2 << 22) | OPC_MSA_3RF_1A,
-    OPC_FMUL_df     = (0x2 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCUNE_df    = (0x2 << 22) | OPC_MSA_3RF_1C,
-    OPC_FCUEQ_df    = (0x3 << 22) | OPC_MSA_3RF_1A,
-    OPC_FDIV_df     = (0x3 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCNE_df     = (0x3 << 22) | OPC_MSA_3RF_1C,
-    OPC_FCLT_df     = (0x4 << 22) | OPC_MSA_3RF_1A,
-    OPC_FMADD_df    = (0x4 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCULT_df    = (0x5 << 22) | OPC_MSA_3RF_1A,
-    OPC_FMSUB_df    = (0x5 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCLE_df     = (0x6 << 22) | OPC_MSA_3RF_1A,
-    OPC_FCULE_df    = (0x7 << 22) | OPC_MSA_3RF_1A,
-    OPC_FEXP2_df    = (0x7 << 22) | OPC_MSA_3RF_1B,
-    OPC_FSAF_df     = (0x8 << 22) | OPC_MSA_3RF_1A,
-    OPC_FEXDO_df    = (0x8 << 22) | OPC_MSA_3RF_1B,
-    OPC_FSUN_df     = (0x9 << 22) | OPC_MSA_3RF_1A,
-    OPC_FSOR_df     = (0x9 << 22) | OPC_MSA_3RF_1C,
-    OPC_FSEQ_df     = (0xA << 22) | OPC_MSA_3RF_1A,
-    OPC_FTQ_df      = (0xA << 22) | OPC_MSA_3RF_1B,
-    OPC_FSUNE_df    = (0xA << 22) | OPC_MSA_3RF_1C,
-    OPC_FSUEQ_df    = (0xB << 22) | OPC_MSA_3RF_1A,
-    OPC_FSNE_df     = (0xB << 22) | OPC_MSA_3RF_1C,
-    OPC_FSLT_df     = (0xC << 22) | OPC_MSA_3RF_1A,
-    OPC_FMIN_df     = (0xC << 22) | OPC_MSA_3RF_1B,
-    OPC_FSULT_df    = (0xD << 22) | OPC_MSA_3RF_1A,
-    OPC_FMIN_A_df   = (0xD << 22) | OPC_MSA_3RF_1B,
-    OPC_FSLE_df     = (0xE << 22) | OPC_MSA_3RF_1A,
-    OPC_FMAX_df     = (0xE << 22) | OPC_MSA_3RF_1B,
-    OPC_FSULE_df    = (0xF << 22) | OPC_MSA_3RF_1A,
-    OPC_FMAX_A_df   = (0xF << 22) | OPC_MSA_3RF_1B,
 };
 
 static const char msaregnames[][6] = {
@@ -1669,144 +1629,50 @@ static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
     return true;
 }
 
+TRANS_DF(FCAF,      trans_msa_3rf, DF_WORD, gen_helper_msa_fcaf_df);
+TRANS_DF(FCUN,      trans_msa_3rf, DF_WORD, gen_helper_msa_fcun_df);
+TRANS_DF(FCEQ,      trans_msa_3rf, DF_WORD, gen_helper_msa_fceq_df);
+TRANS_DF(FCUEQ,     trans_msa_3rf, DF_WORD, gen_helper_msa_fcueq_df);
+TRANS_DF(FCLT,      trans_msa_3rf, DF_WORD, gen_helper_msa_fclt_df);
+TRANS_DF(FCULT,     trans_msa_3rf, DF_WORD, gen_helper_msa_fcult_df);
+TRANS_DF(FCLE,      trans_msa_3rf, DF_WORD, gen_helper_msa_fcle_df);
+TRANS_DF(FCULE,     trans_msa_3rf, DF_WORD, gen_helper_msa_fcule_df);
+TRANS_DF(FSAF,      trans_msa_3rf, DF_WORD, gen_helper_msa_fsaf_df);
+TRANS_DF(FSUN,      trans_msa_3rf, DF_WORD, gen_helper_msa_fsun_df);
+TRANS_DF(FSEQ,      trans_msa_3rf, DF_WORD, gen_helper_msa_fseq_df);
+TRANS_DF(FSUEQ,     trans_msa_3rf, DF_WORD, gen_helper_msa_fsueq_df);
+TRANS_DF(FSLT,      trans_msa_3rf, DF_WORD, gen_helper_msa_fslt_df);
+TRANS_DF(FSULT,     trans_msa_3rf, DF_WORD, gen_helper_msa_fsult_df);
+TRANS_DF(FSLE,      trans_msa_3rf, DF_WORD, gen_helper_msa_fsle_df);
+TRANS_DF(FSULE,     trans_msa_3rf, DF_WORD, gen_helper_msa_fsule_df);
+
+TRANS_DF(FADD,      trans_msa_3rf, DF_WORD, gen_helper_msa_fadd_df);
+TRANS_DF(FSUB,      trans_msa_3rf, DF_WORD, gen_helper_msa_fsub_df);
+TRANS_DF(FMUL,      trans_msa_3rf, DF_WORD, gen_helper_msa_fmul_df);
+TRANS_DF(FDIV,      trans_msa_3rf, DF_WORD, gen_helper_msa_fdiv_df);
+TRANS_DF(FMADD,     trans_msa_3rf, DF_WORD, gen_helper_msa_fmadd_df);
+TRANS_DF(FMSUB,     trans_msa_3rf, DF_WORD, gen_helper_msa_fmsub_df);
+TRANS_DF(FEXP2,     trans_msa_3rf, DF_WORD, gen_helper_msa_fexp2_df);
+TRANS_DF(FEXDO,     trans_msa_3rf, DF_WORD, gen_helper_msa_fexdo_df);
+TRANS_DF(FTQ,       trans_msa_3rf, DF_WORD, gen_helper_msa_ftq_df);
+TRANS_DF(FMIN,      trans_msa_3rf, DF_WORD, gen_helper_msa_fmin_df);
+TRANS_DF(FMIN_A,    trans_msa_3rf, DF_WORD, gen_helper_msa_fmin_a_df);
+TRANS_DF(FMAX,      trans_msa_3rf, DF_WORD, gen_helper_msa_fmax_df);
+TRANS_DF(FMAX_A,    trans_msa_3rf, DF_WORD, gen_helper_msa_fmax_a_df);
+
+TRANS_DF(FCOR,      trans_msa_3rf, DF_WORD, gen_helper_msa_fcor_df);
+TRANS_DF(FCUNE,     trans_msa_3rf, DF_WORD, gen_helper_msa_fcune_df);
+TRANS_DF(FCNE,      trans_msa_3rf, DF_WORD, gen_helper_msa_fcne_df);
 TRANS_DF(MUL_Q,     trans_msa_3rf, DF_HALF, gen_helper_msa_mul_q_df);
 TRANS_DF(MADD_Q,    trans_msa_3rf, DF_HALF, gen_helper_msa_madd_q_df);
 TRANS_DF(MSUB_Q,    trans_msa_3rf, DF_HALF, gen_helper_msa_msub_q_df);
+TRANS_DF(FSOR,      trans_msa_3rf, DF_WORD, gen_helper_msa_fsor_df);
+TRANS_DF(FSUNE,     trans_msa_3rf, DF_WORD, gen_helper_msa_fsune_df);
+TRANS_DF(FSNE,      trans_msa_3rf, DF_WORD, gen_helper_msa_fsne_df);
 TRANS_DF(MULR_Q,    trans_msa_3rf, DF_HALF, gen_helper_msa_mulr_q_df);
 TRANS_DF(MADDR_Q,   trans_msa_3rf, DF_HALF, gen_helper_msa_maddr_q_df);
 TRANS_DF(MSUBR_Q,   trans_msa_3rf, DF_HALF, gen_helper_msa_msubr_q_df);
 
-static void gen_msa_3rf(DisasContext *ctx)
-{
-#define MASK_MSA_3RF(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
-    uint8_t df = (ctx->opcode >> 21) & 0x1;
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
-    /* adjust df value for floating-point instruction */
-    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + df);
-
-    switch (MASK_MSA_3RF(ctx->opcode)) {
-    case OPC_FCAF_df:
-        gen_helper_msa_fcaf_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FADD_df:
-        gen_helper_msa_fadd_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCUN_df:
-        gen_helper_msa_fcun_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUB_df:
-        gen_helper_msa_fsub_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCOR_df:
-        gen_helper_msa_fcor_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCEQ_df:
-        gen_helper_msa_fceq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMUL_df:
-        gen_helper_msa_fmul_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCUNE_df:
-        gen_helper_msa_fcune_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCUEQ_df:
-        gen_helper_msa_fcueq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FDIV_df:
-        gen_helper_msa_fdiv_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCNE_df:
-        gen_helper_msa_fcne_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCLT_df:
-        gen_helper_msa_fclt_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMADD_df:
-        gen_helper_msa_fmadd_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCULT_df:
-        gen_helper_msa_fcult_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMSUB_df:
-        gen_helper_msa_fmsub_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCLE_df:
-        gen_helper_msa_fcle_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCULE_df:
-        gen_helper_msa_fcule_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FEXP2_df:
-        gen_helper_msa_fexp2_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSAF_df:
-        gen_helper_msa_fsaf_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FEXDO_df:
-        gen_helper_msa_fexdo_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUN_df:
-        gen_helper_msa_fsun_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSOR_df:
-        gen_helper_msa_fsor_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSEQ_df:
-        gen_helper_msa_fseq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FTQ_df:
-        gen_helper_msa_ftq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUNE_df:
-        gen_helper_msa_fsune_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUEQ_df:
-        gen_helper_msa_fsueq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSNE_df:
-        gen_helper_msa_fsne_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSLT_df:
-        gen_helper_msa_fslt_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMIN_df:
-        gen_helper_msa_fmin_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSULT_df:
-        gen_helper_msa_fsult_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMIN_A_df:
-        gen_helper_msa_fmin_a_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSLE_df:
-        gen_helper_msa_fsle_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMAX_df:
-        gen_helper_msa_fmax_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSULE_df:
-        gen_helper_msa_fsule_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMAX_A_df:
-        gen_helper_msa_fmax_a_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(twt);
-}
-
 static bool trans_msa_2r(DisasContext *ctx, arg_msa_r *a,
                          void (*gen_msa_2r_b)(TCGv_ptr, TCGv_i32, TCGv_i32),
                          void (*gen_msa_2r_h)(TCGv_ptr, TCGv_i32, TCGv_i32),
@@ -1955,11 +1821,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     case OPC_MSA_ELM:
         gen_msa_elm(ctx);
         break;
-    case OPC_MSA_3RF_1A:
-    case OPC_MSA_3RF_1B:
-    case OPC_MSA_3RF_1C:
-        gen_msa_3rf(ctx);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
-- 
2.31.1


