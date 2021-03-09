Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73EB332A30
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:19:45 +0100 (CET)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJe9A-0005Kb-NN
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnz-0004xf-8I
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:51 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnt-0002ah-Mc
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:47 -0500
Received: by mail-ej1-x632.google.com with SMTP id e19so28510829ejt.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TwgQwLmGG/mKzezMqUo5xTCL6QtWDIfzWod0O/bvvc0=;
 b=WRJGHAraZz/956MZm04rlx+qQWj574QMk7otkPBnwCURxg9Y/8crUF6Ic6JExS4qWC
 pxfxfYRDByC0DSKbTTTpRGPQMgE/kaiP7mtFAR/tTAllVC/ub2eG9GP2BkhaCeQ8IQNO
 ORWHm4qJGEPlMnSsnp1ZrovtpWhCGKQOykOcvxdrfH10k22OEnI1iJF6NzxzfnP8JXVV
 8Cn9awCuQ+hkIpyUV7IaDHyDoZj+yykooZGeDDxkVHKQ1HB+uAFQAB0eq3Fp39SvBkDU
 lg+BRxLBK2u++i8XjjQcYSrwDymtq4b7aLxRnTadlSGmUhY5KfOyPRaicpN+iSlcwuCB
 lgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TwgQwLmGG/mKzezMqUo5xTCL6QtWDIfzWod0O/bvvc0=;
 b=ddm2tcomSQghG0dRqntqE0o1CHIAab1+zIL6wL3fKc+ynRGMGgkzupI0jAF4FW+2Pv
 s/JS4fgomJ4Tybb62qyFD28fjZooALyecl8HSPMtEUF/mZUqQiViTOENWLIWyzwnvhfo
 gK84cVBYh5UucyLY2PuJqEyS49Avb2IVW4CPbDuYSrfqDulq2KNDX83znLvbc+Yo9tMq
 E+rsnBSfm5B2eNqVZ7nHUBPd4oO3LoO7SbnpWp7GJ7nLb9GbxUCndelkzkqg4AxaDN/d
 KbUkDo876H+lz0hEDcVnxLwovanlVPUgcdTt7uvn3QprCoIU69z2T+s208jvMeBPjBo2
 1kzw==
X-Gm-Message-State: AOAM532/bZtMHS9AqL/5+z6T1EizFGDkdtHU49o08w/G6f5/BEoK/fAd
 7UKb5DSlhSD4OMjPPB8+ORhOGCyC1uA=
X-Google-Smtp-Source: ABdhPJxex43BfXwlVFcOlwDqLstKQ815v1na1CO7LfA1lZZgynj4eqmUUCH4iKaTrDXrhzMxmaSORg==
X-Received: by 2002:a17:906:73d5:: with SMTP id
 n21mr21270156ejl.8.1615301861353; 
 Tue, 09 Mar 2021 06:57:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id lm24sm8434324ejb.53.2021.03.09.06.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:57:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 09/22] target/mips/tx79: Introduce PAND/POR/PXOR/PNOR
 opcodes (parallel logic)
Date: Tue,  9 Mar 2021 15:56:40 +0100
Message-Id: <20210309145653.743937-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
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
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the parallel logic opcodes:

 - PAND (Parallel AND)
 - POR  (Parallel OR)
 - PXOR (Parallel XOR)
 - PNOR (Parallel NOR)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-16-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Use trans_parallel_arith (rth)
---
 target/mips/tx79.decode      |  4 +++
 target/mips/tx79_translate.c | 54 ++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 0f748b53a64..26c80b9bce5 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -32,8 +32,12 @@ MTLO1           011100 .....  0000000000 00000 010011   @rs
 # MMI2
 
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
+PAND            011100 ..... ..... ..... 10010 001001   @rs_rt_rd
+PXOR            011100 ..... ..... ..... 10011 001001   @rs_rt_rd
 
 # MMI3
 
 PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
+POR             011100 ..... ..... ..... 10010 101001   @rs_rt_rd
+PNOR            011100 ..... ..... ..... 10011 101001   @rs_rt_rd
 PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index ad83774b977..00364f10d47 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -2,6 +2,7 @@
  * Toshiba TX79-specific instructions translation routines
  *
  *  Copyright (c) 2018 Fredrik Noring
+ *  Copyright (c) 2021 Philippe Mathieu-Daudé
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
@@ -114,6 +115,35 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
  * PSUBUW  rd, rs, rt        Parallel Subtract with Unsigned saturation Word
  */
 
+static bool trans_parallel_arith(DisasContext *ctx, arg_rtype *a,
+                                 void (*gen_logic_i64)(TCGv_i64, TCGv_i64, TCGv_i64))
+{
+    TCGv_i64 ax, bx;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+
+    /* Lower half */
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+    gen_logic_i64(cpu_gpr[a->rd], ax, bx);
+
+    /* Upper half */
+    gen_load_gpr_hi(ax, a->rs);
+    gen_load_gpr_hi(bx, a->rt);
+    gen_logic_i64(cpu_gpr_hi[a->rd], ax, bx);
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
 /*
  *     Min/Max (4 instructions)
  *     ------------------------
@@ -139,6 +169,30 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
  * PNOR    rd, rs, rt        Parallel NOR
  */
 
+/* Parallel And */
+static bool trans_PAND(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_and_i64);
+}
+
+/* Parallel Or */
+static bool trans_POR(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_or_i64);
+}
+
+/* Parallel Exclusive Or */
+static bool trans_PXOR(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_xor_i64);
+}
+
+/* Parallel Not Or */
+static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_arith(ctx, a, tcg_gen_nor_i64);
+}
+
 /*
  *     Shift (9 instructions)
  *     ----------------------
-- 
2.26.2


