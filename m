Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D56442FBD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:03:49 +0100 (CET)
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuOC-0006Ks-HD
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5b-0002Db-Co
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5Z-00069f-Dz
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i5so25757562wrb.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGPPdDv44Azgq0M48n6usoTw5HxNRsR6KRQigT+f3mI=;
 b=HqR4nGClorEzF4G0S21wo3DF6CJb6BATo46WN49PAZVg4adTOSaEW+6jf1opr6aRYF
 yb4es8bDLAWfU2asW/Z2uabB5u3Z1wCY7PcroF51rJH157FkvY+3yNOrFz7OCY7YpFTs
 4okjtsW7DuWaO4CEjaF58YX8EgZnyzuWvutXmRnoK/t37iq/fUZBEa3vVX4PNlcVQFac
 zQe+6IArCn1BwkRAlJTEPrltYtm0dV8LICQb1oO/qMo/3Oqx6D/mO6KpLWMQEAmxUlOU
 wcHMppeyEHB1hl0knxmDmKq4u1vXPBihlhZRuk1kt9+k1Vbs+2QLMB8xWnxbt9X5PAYi
 BmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MGPPdDv44Azgq0M48n6usoTw5HxNRsR6KRQigT+f3mI=;
 b=UQhfuTBH4et1VQ1rGu1xhaNJI1SGLJP8xn1NbSnGSfaGg/k4xbVJcXIdsqyuDcCNNy
 gCR81QltKomo4qa4HJ1nS4u6YA3uMIFykLG2KVtYdw23+KziF4lnkgQ/CP+lCn9O1j2/
 Yke1Oo+J3dT7qyFlKp9XKwzhfr29/ijs1y7tF580JjRfa35oWsVogyFjBPpy5NOOUluG
 5GcESMUxhEUntZilFJtjOUYIpmPVXOuHJFIQJ2QbWGNA+Ws70wzsa4nTWkVZYWDU/RRg
 +9tltlrJvXRsEg1pHwoLAevQ4FQKAJtX/34QMJr7LABA6qwoYlSAHjDA+/Cq2aYTVk8w
 ZJuA==
X-Gm-Message-State: AOAM532EvOdbnyYqPO9vi7D6Y6O1lo04tvjZMjeA7NlFhsgAxCzQ5SWL
 gbX2RMg/e8MXhsi3RUGfBaYmlvRQcbA=
X-Google-Smtp-Source: ABdhPJy8IoR2ehSqd1fwR3R+PDwsyUwtiHx2DKMBCj3iv2rhxYLeth98L3jzi3OcfSgQAj/2b4jrxA==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr27126253wrq.59.1635860671958; 
 Tue, 02 Nov 2021 06:44:31 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 9sm11535068wry.0.2021.11.02.06.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:44:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/41] target/mips: Convert MSA 3R instruction format to
 decodetree (part 1/4)
Date: Tue,  2 Nov 2021 14:42:22 +0100
Message-Id: <20211102134240.3036524-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert 3-register operations to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Note, the format definition could be named @3rf_b (for
3R with a df field BYTE-based) but since the instruction
class is named '3R', we simply call the format @3r to
ease reviewing the msa.decode file.
However we directly call the trans_msa_3rf() function,
which handles the BYTE-based df field.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-21-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  6 ++++++
 target/mips/tcg/msa_translate.c | 17 +++++------------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 1d6ada4c142..4b14acce26f 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -32,6 +32,7 @@
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... .    ws:5 wd:5 ......  &msa_r wt=0 df=%2r_df_w
+@3r                 ...... ...  df:2 wt:5 ws:5 wd:5 ......  &msa_r
 @3rf_h              ...... .... .    wt:5 ws:5 wd:5 ......  &msa_r df=%3r_df_h
 @3rf_w              ...... .... .    wt:5 ws:5 wd:5 ......  &msa_r df=%3r_df_w
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
@@ -88,6 +89,11 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  SLD               011110 000 .. ..... ..... ..... 010100  @3r
+  SPLAT             011110 001 .. ..... ..... ..... 010100  @3r
+
+  VSHF              011110 000 .. ..... ..... ..... 010101  @3r
+
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf_w
   FCUN              011110 0001 . ..... ..... ..... 011010  @3rf_w
   FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf_w
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 26d05a87c89..ddc0bd08ddf 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -58,15 +58,12 @@ enum {
     OPC_SUBS_S_df   = (0x0 << 23) | OPC_MSA_3R_11,
     OPC_MULV_df     = (0x0 << 23) | OPC_MSA_3R_12,
     OPC_DOTP_S_df   = (0x0 << 23) | OPC_MSA_3R_13,
-    OPC_SLD_df      = (0x0 << 23) | OPC_MSA_3R_14,
-    OPC_VSHF_df     = (0x0 << 23) | OPC_MSA_3R_15,
     OPC_SRA_df      = (0x1 << 23) | OPC_MSA_3R_0D,
     OPC_SUBV_df     = (0x1 << 23) | OPC_MSA_3R_0E,
     OPC_ADDS_A_df   = (0x1 << 23) | OPC_MSA_3R_10,
     OPC_SUBS_U_df   = (0x1 << 23) | OPC_MSA_3R_11,
     OPC_MADDV_df    = (0x1 << 23) | OPC_MSA_3R_12,
     OPC_DOTP_U_df   = (0x1 << 23) | OPC_MSA_3R_13,
-    OPC_SPLAT_df    = (0x1 << 23) | OPC_MSA_3R_14,
     OPC_SRAR_df     = (0x1 << 23) | OPC_MSA_3R_15,
     OPC_SRL_df      = (0x2 << 23) | OPC_MSA_3R_0D,
     OPC_MAX_S_df    = (0x2 << 23) | OPC_MSA_3R_0E,
@@ -505,6 +502,11 @@ TRANS(BMNZ_V,           trans_msa_3r,   gen_helper_msa_bmnz_v);
 TRANS(BMZ_V,            trans_msa_3r,   gen_helper_msa_bmz_v);
 TRANS(BSEL_V,           trans_msa_3r,   gen_helper_msa_bsel_v);
 
+TRANS(SLD,              trans_msa_3rf,  gen_helper_msa_sld_df);
+TRANS(SPLAT,            trans_msa_3rf,  gen_helper_msa_splat_df);
+
+TRANS(VSHF,             trans_msa_3rf,  gen_helper_msa_vshf_df);
+
 static void gen_msa_3r(DisasContext *ctx)
 {
 #define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
@@ -1255,12 +1257,6 @@ static void gen_msa_3r(DisasContext *ctx)
             break;
         }
         break;
-    case OPC_SLD_df:
-        gen_helper_msa_sld_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_VSHF_df:
-        gen_helper_msa_vshf_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBV_df:
         switch (df) {
         case DF_BYTE:
@@ -1293,9 +1289,6 @@ static void gen_msa_3r(DisasContext *ctx)
             break;
         }
         break;
-    case OPC_SPLAT_df:
-        gen_helper_msa_splat_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBSUS_U_df:
         switch (df) {
         case DF_BYTE:
-- 
2.31.1


