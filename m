Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC823F0CF1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:48:25 +0200 (CEST)
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSU4-0003NH-PR
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGRrI-0006x7-PV
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:08:20 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:37652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGRrD-0006e0-79
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:08:20 -0400
Received: by mail-lf1-x135.google.com with SMTP id k5so7201519lfu.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ieXrtzjZOLpUWZMA86tD7IswJBXGAj9eKT2maYxIjfY=;
 b=CejEcXq5TX5KvwbXcBod14KJeCiI6MlW65urwV5seIxoRqIvXKpdgak1gjPXGKBJ0k
 oMzhDCXpqjVJfsakjVdQbTuUk/W1+bbJtjzqYHyRCoqc5psKkW50Fz+OFt+2/DlkLlpG
 pRBs3oP3uw/tHuRATwka62bqP1rcrXKH94ea0J/Af4DcmCb1wde4Rda2S6gJMIfDNzFC
 eb/ASIrAUGI8dTLiUygNX4GtmF6IWsTrMCnSTudy7t+GUW5FMF3AtuU4f2jyn0FF5b6+
 siCdMpH4uFV15zfSh/0N7+pq1zLAU9rqgKdZ+UkaKiYqFRbDCQC7M1MDg1Z8ProoBf/v
 nHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ieXrtzjZOLpUWZMA86tD7IswJBXGAj9eKT2maYxIjfY=;
 b=fhUZgDAK7HMdmpA3MN3pEWD0Tv02dEJGkNydYHJdpiP8koumvJ/DZ2X/YAB6v9URS/
 IS4kLjtCxP9vThOliG2wDnSVzTQmh7Mtul49+sHFoU9mZ89ySNq6tUwFOFusKhgX65Ph
 +k2bRDOjoYhTOR3rPrbLZgha6xr4U5tAiOY3o+9gA/lZSM5GHaYaMmF4J5Vb+ATZx6uU
 nrj4oi84TR8rBEeT5iAR2IosInjaR/yT0uTToXZNo6sho/EMCcdAf7TboiwLYtHdJzb+
 IiWab+/PKkUTPfSjxuZ/vgTfPwVEG4Z6n8fpdQcg98z2ilf98fa5MVO1xaFlgCHh8RHf
 sQlg==
X-Gm-Message-State: AOAM532rpQu16/72Ilf4O8iv8Vhy4/zLiRvNErK9DKhd5LBVWkwhIAPY
 /arwUL0JWbbvvW/nXOC1i/4lYY7sfGR9yvGMkuI=
X-Google-Smtp-Source: ABdhPJwjpkAV6mY8sB4gjh29uby+VyhHkrC7SEROLQXqOTwoFtBDX1jdsS3P8Yw7GP+OIgNSVkYpGw==
X-Received: by 2002:a05:6512:39cb:: with SMTP id
 k11mr7275873lfu.289.1629317293054; 
 Wed, 18 Aug 2021 13:08:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id r145sm63201lff.128.2021.08.18.13.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:08:12 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] disas/riscv: Add Zb[abcs] instructions
Date: Wed, 18 Aug 2021 22:08:03 +0200
Message-Id: <20210818200803.788253-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818200803.788253-1-philipp.tomsich@vrull.eu>
References: <20210818200803.788253-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Aug 2021 16:43:43 -0400
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the addition of Zb[abcs], we also need to add disassembler
support for these new instructions.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

 disas/riscv.c | 157 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 278d9be924..cfb6d75b53 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -478,6 +478,49 @@ typedef enum {
     rv_op_fsflags = 316,
     rv_op_fsrmi = 317,
     rv_op_fsflagsi = 318,
+    rv_op_bseti = 319,
+    rv_op_bclri = 320,
+    rv_op_binvi = 321,
+    rv_op_bexti = 322,
+    rv_op_rori = 323,
+    rv_op_clz = 324,
+    rv_op_ctz = 325,
+    rv_op_cpop = 326,
+    rv_op_sext_h = 327,
+    rv_op_sext_b = 328,
+    rv_op_xnor = 329,
+    rv_op_orn = 330,
+    rv_op_andn = 331,
+    rv_op_rol = 332,
+    rv_op_ror = 333,
+    rv_op_sh1add = 334,
+    rv_op_sh2add = 335,
+    rv_op_sh3add = 336,
+    rv_op_sh1add_uw = 337,
+    rv_op_sh2add_uw = 338,
+    rv_op_sh3add_uw = 339,
+    rv_op_clmul = 340,
+    rv_op_clmulr = 341,
+    rv_op_clmulh = 342,
+    rv_op_min = 343,
+    rv_op_minu = 344,
+    rv_op_max = 345,
+    rv_op_maxu = 346,
+    rv_op_clzw = 347,
+    rv_op_ctzw = 348,
+    rv_op_cpopw = 349,
+    rv_op_slli_uw = 350,
+    rv_op_add_uw = 351,
+    rv_op_rolw = 352,
+    rv_op_rorw = 353,
+    rv_op_rev8 = 354,
+    rv_op_zext_h = 355,
+    rv_op_roriw = 356,
+    rv_op_orc_b = 357,
+    rv_op_bset = 358,
+    rv_op_bclr = 359,
+    rv_op_binv = 360,
+    rv_op_bext = 361,
 } rv_op;
 
 /* structures */
@@ -1117,6 +1160,49 @@ const rv_opcode_data opcode_data[] = {
     { "fsflags", rv_codec_i_csr, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "fsrmi", rv_codec_i_csr, rv_fmt_rd_zimm, NULL, 0, 0, 0 },
     { "fsflagsi", rv_codec_i_csr, rv_fmt_rd_zimm, NULL, 0, 0, 0 },
+    { "bseti", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "bclri", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "binvi", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "bexti", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "rori", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "clz", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "ctz", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "cpop", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "sext.h", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "sext.b", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "xnor", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "orn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "andn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "rol", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "ror", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh1add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh2add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh3add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh1add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh2add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sh3add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "clmul", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "clmulr", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "clmulh", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "min", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "minu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "slli.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "rolw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "rorw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "rev8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "zext.h", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "roriw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "orc.b", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "bset", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "bclr", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "binv", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "bext", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
 };
 
 /* CSR names */
@@ -1507,7 +1593,20 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 0: op = rv_op_addi; break;
             case 1:
                 switch (((inst >> 27) & 0b11111)) {
-                case 0: op = rv_op_slli; break;
+                case 0b00000: op = rv_op_slli; break;
+                case 0b00101: op = rv_op_bseti; break;
+                case 0b01001: op = rv_op_bclri; break;
+                case 0b01101: op = rv_op_binvi; break;
+                case 0b01100:
+                    switch (((inst >> 20) & 0b1111111)) {
+                    case 0b0000000: op = rv_op_clz; break;
+                    case 0b0000001: op = rv_op_ctz; break;
+                    case 0b0000010: op = rv_op_cpop; break;
+                      /* 0b0000011 */
+                    case 0b0000100: op = rv_op_sext_b; break;
+                    case 0b0000101: op = rv_op_sext_h; break;
+                    }
+                    break;
                 }
                 break;
             case 2: op = rv_op_slti; break;
@@ -1515,8 +1614,16 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 4: op = rv_op_xori; break;
             case 5:
                 switch (((inst >> 27) & 0b11111)) {
-                case 0: op = rv_op_srli; break;
-                case 8: op = rv_op_srai; break;
+                case 0b00000: op = rv_op_srli; break;
+                case 0b00101: op = rv_op_orc_b; break;
+                case 0b01000: op = rv_op_srai; break;
+                case 0b01001: op = rv_op_bexti; break;
+                case 0b01100: op = rv_op_rori; break;
+                case 0b01101:
+                    switch ((inst >> 20) & 0b1111111) {
+                    case 0b0111000: op = rv_op_rev8; break;
+                    }
+                    break;
                 }
                 break;
             case 6: op = rv_op_ori; break;
@@ -1530,12 +1637,21 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 1:
                 switch (((inst >> 25) & 0b1111111)) {
                 case 0: op = rv_op_slliw; break;
+                case 4: op = rv_op_slli_uw; break;
+                case 48:
+                    switch ((inst >> 20) & 0b11111) {
+                    case 0b00000: op = rv_op_clzw; break;
+                    case 0b00001: op = rv_op_ctzw; break;
+                    case 0b00010: op = rv_op_cpopw; break;
+                    }
+                    break;
                 }
                 break;
             case 5:
                 switch (((inst >> 25) & 0b1111111)) {
                 case 0: op = rv_op_srliw; break;
                 case 32: op = rv_op_sraiw; break;
+                case 48: op = rv_op_roriw; break;
                 }
                 break;
             }
@@ -1623,8 +1739,32 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 13: op = rv_op_divu; break;
             case 14: op = rv_op_rem; break;
             case 15: op = rv_op_remu; break;
+            case 36:
+                switch ((inst >> 20) & 0b11111) {
+                case 0: op = rv_op_zext_h; break;
+                }
+                break;
+            case 41: op = rv_op_clmul; break;
+            case 42: op = rv_op_clmulr; break;
+            case 43: op = rv_op_clmulh; break;
+            case 44: op = rv_op_min; break;
+            case 45: op = rv_op_minu; break;
+            case 46: op = rv_op_max; break;
+            case 47: op = rv_op_maxu; break;
+            case 130: op = rv_op_sh1add; break;
+            case 132: op = rv_op_sh2add; break;
+            case 134: op = rv_op_sh3add; break;
+            case 161: op = rv_op_bset; break;
             case 256: op = rv_op_sub; break;
+            case 260: op = rv_op_xnor; break;
             case 261: op = rv_op_sra; break;
+            case 262: op = rv_op_orn; break;
+            case 263: op = rv_op_andn; break;
+            case 289: op = rv_op_bclr; break;
+            case 293: op = rv_op_bext; break;
+            case 385: op = rv_op_rol; break;
+            case 386: op = rv_op_ror; break;
+            case 417: op = rv_op_binv; break
             }
             break;
         case 13: op = rv_op_lui; break;
@@ -1638,8 +1778,19 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 13: op = rv_op_divuw; break;
             case 14: op = rv_op_remw; break;
             case 15: op = rv_op_remuw; break;
+            case 32: op = rv_op_add_uw; break;
+            case 36:
+                switch ((inst >> 20) & 0b11111) {
+                case 0: op = rv_op_zext_h; break;
+                }
+                break;
+            case 130: op = rv_op_sh1add_uw; break;
+            case 132: op = rv_op_sh2add_uw; break;
+            case 134: op = rv_op_sh3add_uw; break;
             case 256: op = rv_op_subw; break;
             case 261: op = rv_op_sraw; break;
+            case 385: op = rv_op_rolw; break;
+            case 389: op = rv_op_rorw; break;
             }
             break;
         case 16:
-- 
2.25.1


