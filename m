Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F18E4385B6
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:07:41 +0200 (CEST)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePAy-00029T-CV
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuC-0007dM-NW
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:20 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOu9-00061V-Kt
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 g201-20020a1c20d2000000b00327775075f7so127802wmg.5
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPgOOsJ1tcp3zk061urgzOCJTIxjGxhIl2eWZ/P+Epc=;
 b=Ricy8C19AUpbmq9b29txE4ooJrPKn1SgAy1UFkb5cGk7LUQxFrFypYpsikTobXVtom
 swZ/fGiuHzKx/3dsyirb6PtH3WMcPOa+KnRUyZ6Gm+RXVlNw5BEJdn/pzkFXWA5pBMhe
 D8n+/TPZ9Uj/WbtoBiXA4m84Y0hRNsi1MasRzpntK+YG8vOESY7+2xe2mJ1HENlf8cL4
 Art+gFORTgHa6sNm4W1X7ffKpwbscF2kyqC+XQZYG599X20uLeHl5hD6FhGfpaRFR0gg
 dyCneP/bTHOLOCkRVrEdik5dUyd8V4he9cPhTANajn1aGCht2jOXoWiDWB+MJJ4vNX3r
 /Cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pPgOOsJ1tcp3zk061urgzOCJTIxjGxhIl2eWZ/P+Epc=;
 b=b8dJz3LQlmU01flGWAr5WYast15nid0FSIDIeXto+WchocxX2zk0KJr2IH3zTZvLNA
 dArSKwEW9GRTp0hRvXMMIn02mnNYGzxIiZKioAnNwYLuGZnbxKSYksG66Zk3i/CABBCg
 1TxoEKVNtftSnb1ssEXNzm98wsCO1JKIP5MHYpy9DJ+HgAXE6YyuwXfJQCjGKFJUEMac
 Fn4ct3tGJ+7PplthxH0UQGe5PmnoC5AR3DVrBt2vp+XJ9AbPAOmFJ6anX8F/gB67upOE
 fdg3rGCUSSa1EYX+ZJHB6yQpx9hQH5BfdDG77lqMpUo/63B5G00RzQwMAvV431gGujAb
 BX5g==
X-Gm-Message-State: AOAM533RhvRFTshwzxPo09TG38D4fsqyyB7pdQ2UwfunVwEgLzKW1IIm
 50xgf43oyVIQ/5jvCUjElxpV/+PN4RQ=
X-Google-Smtp-Source: ABdhPJypYUNRlxpNgxxoOMZnhWk3Dj/FIfNFw2PLNX0V16FtPLihEni3tRFA8r97uN+WYGTcj8LyDg==
X-Received: by 2002:a1c:7911:: with SMTP id l17mr38985962wme.138.1635025815195; 
 Sat, 23 Oct 2021 14:50:15 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 k36sm1514103wms.21.2021.10.23.14.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:50:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/33] target/mips: Convert MSA ELM instruction format to
 decodetree
Date: Sat, 23 Oct 2021 23:47:56 +0200
Message-Id: <20211023214803.522078-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

Convert instructions with an immediate element index
and data format df/n to decodetree.

Since the 'data format' and 'n' fields are constant values,
use tcg_constant_i32() instead of a TCG temporaries.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  6 +++++
 target/mips/tcg/msa_translate.c | 46 +++++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 3d0d9a52675..0f1674cd318 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -15,12 +15,14 @@
 
 &msa_r              df wd ws wt
 &msa_bz             df       wt sa
+&msa_elm            df wd ws
 &msa_ldst           df wd ws    sa
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_ldst
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@elm_df             ...... .... df:6      ws:5 wd:5 ......  &msa_elm
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
@@ -152,6 +154,10 @@ BNZ                 010001 111 .. ..... ................    @bz
   HSUB_S            011110 110.. ..... ..... .....  010101  @3r
   HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
+  SLDI              011110 0000 ...... ..... .....  011001  @elm_df
+  SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  INSVE             011110 0101 ...... ..... .....  011001  @elm_df
+
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
   FCUN              011110 0001 . ..... ..... ..... 011010  @3rf
   FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 7813c126069..95dcd4b5b06 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -29,15 +29,12 @@ enum {
 
 enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
-    OPC_SLDI_df     = (0x0 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_SPLATI_df   = (0x1 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_COPY_S_df   = (0x2 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_COPY_U_df   = (0x3 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
-    OPC_INSVE_df    = (0x5 << 22) | (0x00 << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -561,6 +558,39 @@ static void gen_msa_elm_3e(DisasContext *ctx)
     tcg_temp_free_i32(tsr);
 }
 
+static bool trans_msa_elm_df(DisasContext *ctx, arg_msa_elm *a,
+                             void (*gen_msa_elm_df)(TCGv_ptr, TCGv_i32,
+                                                    TCGv_i32, TCGv_i32,
+                                                    TCGv_i32))
+{
+    TCGv_i32 twd;
+    TCGv_i32 tws;
+    TCGv_i32 tdf;
+    TCGv_i32 tn;
+    uint32_t df, n;
+
+    if (!df_extract(df_elm, a->df, &df, &n)) {
+        gen_reserved_instruction(ctx);
+        return true;
+    }
+
+    twd = tcg_const_i32(a->wd);
+    tws = tcg_const_i32(a->ws);
+    tdf = tcg_constant_i32(df);
+    tn = tcg_constant_i32(n);
+
+    gen_msa_elm_df(cpu_env, tdf, twd, tws, tn);
+
+    tcg_temp_free_i32(tws);
+    tcg_temp_free_i32(twd);
+
+    return true;
+}
+
+TRANS_MSA(SLDI,     trans_msa_elm_df, gen_helper_msa_sldi_df);
+TRANS_MSA(SPLATI,   trans_msa_elm_df, gen_helper_msa_splati_df);
+TRANS_MSA(INSVE,    trans_msa_elm_df, gen_helper_msa_insve_df);
+
 static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 {
 #define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
@@ -570,18 +600,8 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
     TCGv_i32 tws = tcg_const_i32(ws);
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tn  = tcg_const_i32(n);
-    TCGv_i32 tdf = tcg_constant_i32(df);
 
     switch (MASK_MSA_ELM(ctx->opcode)) {
-    case OPC_SLDI_df:
-        gen_helper_msa_sldi_df(cpu_env, tdf, twd, tws, tn);
-        break;
-    case OPC_SPLATI_df:
-        gen_helper_msa_splati_df(cpu_env, tdf, twd, tws, tn);
-        break;
-    case OPC_INSVE_df:
-        gen_helper_msa_insve_df(cpu_env, tdf, twd, tws, tn);
-        break;
     case OPC_COPY_S_df:
     case OPC_COPY_U_df:
     case OPC_INSERT_df:
-- 
2.31.1


