Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B767F4385B8
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:09:28 +0200 (CEST)
Received: from localhost ([::1]:43672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePCh-0006X2-RP
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOty-0007Pa-7W
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:06 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtv-0005vC-Ud
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:05 -0400
Received: by mail-wm1-x32c.google.com with SMTP id y78so1311249wmc.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0YrhHvQhCI1smRtdOyBIO6rYsfXznJ3uddD3K7WX1EM=;
 b=XNQ0OFWChBPPxUM/S5D3YgXD0E9HY/BS7D22AadXe87Bjr/k5ICkfoohwOUubBEsF6
 gySsNU6kM6ND4d+vjjMsob1rl9OdBZE5mBilR8pRJgZek6nO4jvEXaqsLhhDPb+L6amY
 jy/qhLNqJ7vMbjikCe9bbiw1L8oy4rqbFnCf8/EobgctnIda1syvvgWQ1EIrb2RuQG7Z
 Ny+TgxCg6a8XZAUePdP0SFSkbPVAR4DijMXy80PjivnHMcxJcEQwZ0Jy8gnG6hMgKAtF
 OWYROfqNcx4v2gsAvblMIM6JaFuIrD7T9/Ex5xqHO3A/STM/XdsbfkEETgsaQU6I8xut
 YxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0YrhHvQhCI1smRtdOyBIO6rYsfXznJ3uddD3K7WX1EM=;
 b=eVq04GPUy/poxW0o9WOxbFVzU+Htpj+3cK7hy89BLk2BCwn7zb0OHQ1U7i1oyXkJ9q
 DNK5xqlUup/R0qzxQxCsyg8Zm6ekUPeS14bco8ymYWxr7+6wb3AduX922hHq8iVbKCJR
 PYVEByhIpdM9ptQD2zj1fGi5LzrOpbFFFQhjWS9JpBOZ2z7BsIjjcMMs1CIue0gQTXm0
 Ft+6T/NDu05xLI/LKcE7mnBiM3lV+gZJsWj3Hec3MCsaJkSXwQh4spRnidbkrj5VLC7E
 x4cF+KPaG1kEe+jcrLi1SA4bd3/kgVl7Hoi6mSSPAocXkypmxebXYop1VE0dgVfmifqU
 Vukw==
X-Gm-Message-State: AOAM533zPSJtXX/lAfRl804NXlOo8hIIB+RHRZ0yInEUDrzSYOisQYm/
 8xYQK0YqmNomRRCcOQQbIok9zx4XUeM=
X-Google-Smtp-Source: ABdhPJyuHnoGeFFWHhvMmEX0+GsJvbUaGdY3I4rEBg4bmvxXt8fbta7c9Sa1et6/bxzcZpPd1ilISA==
X-Received: by 2002:a7b:c413:: with SMTP id k19mr2884560wmi.142.1635025802247; 
 Sat, 23 Oct 2021 14:50:02 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 m15sm12369083wmq.0.2021.10.23.14.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:50:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/33] target/mips: Convert MSA 3R instruction format to
 decodetree (part 3/4)
Date: Sat, 23 Oct 2021 23:47:54 +0200
Message-Id: <20211023214803.522078-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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

Convert BINSL (Vector Bit Insert Left) and BINSR (Vector Bit
Insert Right) opcodes to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  3 +++
 target/mips/tcg/msa_translate.c | 37 +++------------------------------
 2 files changed, 6 insertions(+), 34 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 4a9cf85fa7a..1d6fd86ef3d 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -80,6 +80,9 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  BINSL             011110 110.. ..... ..... .....  001101  @3r
+  BINSR             011110 111.. ..... ..... .....  001101  @3r
+
   DOTP_S            011110 000.. ..... ..... .....  010011  @3r
   DOTP_U            011110 001.. ..... ..... .....  010011  @3r
   DPADD_S           011110 010.. ..... ..... .....  010011  @3r
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index e1da532e5c9..1b69ec149a5 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -78,12 +78,10 @@ enum {
     OPC_ASUB_U_df   = (0x5 << 23) | OPC_MSA_3R_11,
     OPC_DIV_U_df    = (0x5 << 23) | OPC_MSA_3R_12,
     OPC_ILVR_df     = (0x5 << 23) | OPC_MSA_3R_14,
-    OPC_BINSL_df    = (0x6 << 23) | OPC_MSA_3R_0D,
     OPC_MAX_A_df    = (0x6 << 23) | OPC_MSA_3R_0E,
     OPC_AVER_S_df   = (0x6 << 23) | OPC_MSA_3R_10,
     OPC_MOD_S_df    = (0x6 << 23) | OPC_MSA_3R_12,
     OPC_ILVEV_df    = (0x6 << 23) | OPC_MSA_3R_14,
-    OPC_BINSR_df    = (0x7 << 23) | OPC_MSA_3R_0D,
     OPC_MIN_A_df    = (0x7 << 23) | OPC_MSA_3R_0E,
     OPC_AVER_U_df   = (0x7 << 23) | OPC_MSA_3R_10,
     OPC_MOD_U_df    = (0x7 << 23) | OPC_MSA_3R_12,
@@ -518,6 +516,9 @@ static bool trans_msa_3r(DisasContext *ctx, arg_msa_r *a,
     return true;
 }
 
+TRANS_DF_E(BINSL,       trans_msa_3r,    gen_helper_msa_binsl);
+TRANS_DF_E(BINSR,       trans_msa_3r,    gen_helper_msa_binsr);
+
 TRANS_DF_B(DOTP_S,      trans_msa_3r,    gen_helper_msa_dotp_s);
 TRANS_DF_B(DOTP_U,      trans_msa_3r,    gen_helper_msa_dotp_u);
 TRANS_DF_B(DPADD_S,     trans_msa_3r,    gen_helper_msa_dpadd_s);
@@ -548,38 +549,6 @@ static void gen_msa_3r(DisasContext *ctx)
     TCGv_i32 twt = tcg_const_i32(wt);
 
     switch (MASK_MSA_3R(ctx->opcode)) {
-    case OPC_BINSL_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_binsl_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_binsl_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_binsl_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_binsl_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_BINSR_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_binsr_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_binsr_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_binsr_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_binsr_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
     case OPC_BCLR_df:
         switch (df) {
         case DF_BYTE:
-- 
2.31.1


