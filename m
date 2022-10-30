Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1008612D82
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:36:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGrg-0002T3-UD; Sun, 30 Oct 2022 18:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGr3-0000Lx-OA
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqy-0008OA-BG
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id v1so13651451wrt.11
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFKVYi82vRKYa60i6ICj8S/vOgcNGZ369I8pQUtLOMU=;
 b=zuLDqkDDA7SJVtmd0s6qVfTR3NXv4ZLlFmaJaQ+jVz2Y00n4Dt79YY6EKU+pqvMfnD
 m7IbIU4yyyx6FnJ5mur1ZyPeNKJYlcWV4VAJRdF/3cahrgHr9KvEbkR7U4UQ3iw+KMWH
 1PxF8JAkVW770zvkABjaRIakc45wYimnCrnM9efrURXoWt8E/pOAp1twZ3f3SWpGv0pY
 27C+PExk09+PoycumjgyZeEhz23bS7RzxOct4LBPoNEAtMg1bf5VhFp9cE7AyKa0mgzy
 DbM8e9bUZa3NC6miEC3mMNc1xG99iDUp3RBJrWFg6QYPnetIdRWbjkzr+jOyBFAsBpAI
 cCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kFKVYi82vRKYa60i6ICj8S/vOgcNGZ369I8pQUtLOMU=;
 b=boBYvz5bRvq5g7qdnmcY7+PBDPIohqOnWoX2NyEejLVXYPGcx8j32Cd2lD2lM32Zcm
 teIdT95pPL6vi0GlppwH/24kNZNlzpQopJ08kmbaUQcnKpOgeUnlYnyA3FgEBFNatIvq
 Z23CTixXkPCuoMxGiBq+oh350rHpjjnQnapfFR/c6f+mwtasYPnDsRdTlxpqRA05Cx2h
 m+wjmqdbtDbXIR80Sdx7KkwiLhqxIIJl8HzS26nP4Pkc+KMRx1xaVjDV8UL7BIAcTxvT
 oYrNUzmZHu5WD1+fTEe6FuS4wS8BLeozsOcnbEDjvpCseao9Rv5vk24Ze8s5dVep0TkQ
 rhww==
X-Gm-Message-State: ACrzQf0GThhKpeEOva9GHdMHHgnEwUSpznq0L+gER1upPaB2OiIHH+o3
 jtCCa8zeFAntVXZH/m17XruuVCIDk/qOQw==
X-Google-Smtp-Source: AMsMyM497qvW6ucbbtTNP81xQQ/9GhBMbZ6p17Hgx91fO/Segx5nJKeM8KZAOJocG+6t+20RvwPk9g==
X-Received: by 2002:a5d:5292:0:b0:236:ccb9:673b with SMTP id
 c18-20020a5d5292000000b00236ccb9673bmr949849wrv.317.1667169146054; 
 Sun, 30 Oct 2022 15:32:26 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a7bcc8c000000b003a682354f63sm5338935wma.11.2022.10.30.15.32.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:32:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 34/55] disas/nanomips: Expand Dis_info struct
Date: Sun, 30 Oct 2022 23:28:20 +0100
Message-Id: <20221030222841.42377-35-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

This patch expands the Dis_info struct, which should hold the
necessary data for handling runtime errors. Fields fprintf_func and
stream are in charge of error printing. Field buf enables the use of
sigsetjmp() and siglongjmp() functions. Support for runtime error
handling will be added later.

We're filling Dis_info at the entrance of the nanoMIPS disassembler,
i.e. print_insn_nanomips. Next, we're adding that information as an
argument wherever we need to.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-21-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 2708 ++++++++++++++++++++++----------------------
 1 file changed, 1357 insertions(+), 1351 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 85f5784770..73329462ee 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -72,6 +72,9 @@ enum TABLE_ATTRIBUTE_TYPE {
 
 typedef struct Dis_info {
   img_address m_pc;
+  fprintf_function fprintf_func;
+  FILE *stream;
+  sigjmp_buf buf;
 } Dis_info;
 
 typedef bool (*conditional_function)(uint64 instruction);
@@ -124,7 +127,7 @@ static int64 sign_extend(int64 data, int msb)
 
 
 static uint64 renumber_registers(uint64 index, uint64 *register_list,
-                               size_t register_list_size)
+                               size_t register_list_size, Dis_info *info)
 {
     if (index < register_list_size) {
         return register_list[index];
@@ -163,12 +166,12 @@ static uint64 renumber_registers(uint64 index, uint64 *register_list,
  *     - MUL[4X4]
  *     - SW[4X4]
  */
-static uint64 decode_gpr_gpr4(uint64 d)
+static uint64 decode_gpr_gpr4(uint64 d, Dis_info *info)
 {
     static uint64 register_list[] = {  8,  9, 10, 11,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -199,12 +202,12 @@ static uint64 decode_gpr_gpr4(uint64 d)
  *     - MOVEP
  *     - SW[4X4]
  */
-static uint64 decode_gpr_gpr4_zero(uint64 d)
+static uint64 decode_gpr_gpr4_zero(uint64 d, Dis_info *info)
 {
     static uint64 register_list[] = {  8,  9, 10,  0,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -258,11 +261,11 @@ static uint64 decode_gpr_gpr4_zero(uint64 d)
  *     - SW[16]
  *     - XOR[16]
  */
-static uint64 decode_gpr_gpr3(uint64 d)
+static uint64 decode_gpr_gpr3(uint64 d, Dis_info *info)
 {
     static uint64 register_list[] = { 16, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -298,11 +301,11 @@ static uint64 decode_gpr_gpr3(uint64 d)
  *     - SW[16]
  *     - SW[GP16]
  */
-static uint64 decode_gpr_gpr3_src_store(uint64 d)
+static uint64 decode_gpr_gpr3_src_store(uint64 d, Dis_info *info)
 {
     static uint64 register_list[] = {  0, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -328,11 +331,11 @@ static uint64 decode_gpr_gpr3_src_store(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-static uint64 decode_gpr_gpr2_reg1(uint64 d)
+static uint64 decode_gpr_gpr2_reg1(uint64 d, Dis_info *info)
 {
     static uint64 register_list[] = {  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -358,11 +361,11 @@ static uint64 decode_gpr_gpr2_reg1(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-static uint64 decode_gpr_gpr2_reg2(uint64 d)
+static uint64 decode_gpr_gpr2_reg2(uint64 d, Dis_info *info)
 {
     static uint64 register_list[] = {  5,  6,  7,  8 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -387,11 +390,11 @@ static uint64 decode_gpr_gpr2_reg2(uint64 d)
  *
  *     - MOVE.BALC
  */
-static uint64 decode_gpr_gpr1(uint64 d)
+static uint64 decode_gpr_gpr1(uint64 d, Dis_info *info)
 {
     static uint64 register_list[] = {  4,  5 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -450,7 +453,7 @@ static uint64 encode_rt1_from_rt(uint64 d)
 }
 
 
-static const char *GPR(uint64 reg)
+static const char *GPR(uint64 reg, Dis_info *info)
 {
     static const char *gpr_reg[32] = {
         "zero", "at",   "v0",   "v1",   "a0",   "a1",   "a2",   "a3",
@@ -468,7 +471,8 @@ static const char *GPR(uint64 reg)
 }
 
 
-static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
+static char *save_restore_list(uint64 rt, uint64 count, uint64 gp,
+                               Dis_info *info)
 {
     char *reg_list[34];
     reg_list[0] = (char *)"";
@@ -478,7 +482,7 @@ static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
         bool use_gp = gp && (counter == count - 1);
         uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
         /* glib usage below requires casting away const */
-        reg_list[counter + 1] = (char *)GPR(this_rt);
+        reg_list[counter + 1] = (char *)GPR(this_rt, info);
     }
     reg_list[count + 1] = NULL;
 
@@ -486,7 +490,7 @@ static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
 }
 
 
-static const char *FPR(uint64 reg)
+static const char *FPR(uint64 reg, Dis_info *info)
 {
     static const char *fpr_reg[32] = {
         "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
@@ -504,7 +508,7 @@ static const char *FPR(uint64 reg)
 }
 
 
-static const char *AC(uint64 reg)
+static const char *AC(uint64 reg, Dis_info *info)
 {
     static const char *ac_reg[4] = {
         "ac0",  "ac1",  "ac2",  "ac3"
@@ -1545,8 +1549,8 @@ static char *ABS_D(uint64 instruction, Dis_info *info)
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *fs = FPR(fs_value);
-    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value, info);
+    const char *fd = FPR(fd_value, info);
 
     return img_format("ABS.D %s, %s", fd, fs);
 }
@@ -1567,8 +1571,8 @@ static char *ABS_S(uint64 instruction, Dis_info *info)
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *fs = FPR(fs_value);
-    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value, info);
+    const char *fd = FPR(fd_value, info);
 
     return img_format("ABS.S %s, %s", fd, fs);
 }
@@ -1589,8 +1593,8 @@ static char *ABSQ_S_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("ABSQ_S.PH %s, %s", rt, rs);
 }
@@ -1611,8 +1615,8 @@ static char *ABSQ_S_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("ABSQ_S.QB %s, %s", rt, rs);
 }
@@ -1633,8 +1637,8 @@ static char *ABSQ_S_W(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("ABSQ_S.W %s, %s", rt, rs);
 }
@@ -1655,7 +1659,7 @@ static char *ACLR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("ACLR 0x%" PRIx64 ", %" PRId64 "(%s)",
                       bit_value, s_value, rs);
@@ -1677,9 +1681,9 @@ static char *ADD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADD %s, %s, %s", rd, rs, rt);
 }
@@ -1702,9 +1706,9 @@ static char *ADD_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
-    const char *fd = FPR(fd_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *fd = FPR(fd_value, info);
 
     return img_format("ADD.D %s, %s, %s", fd, fs, ft);
 }
@@ -1727,9 +1731,9 @@ static char *ADD_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
-    const char *fd = FPR(fd_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *fd = FPR(fd_value, info);
 
     return img_format("ADD.S %s, %s, %s", fd, fs, ft);
 }
@@ -1750,8 +1754,8 @@ static char *ADDIU_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_15_to_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("ADDIU %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
@@ -1771,7 +1775,7 @@ static char *ADDIU_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDIU %s, %" PRId64, rt, s_value);
 }
@@ -1791,7 +1795,7 @@ static char *ADDIU_GP48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDIU %s, $%d, %" PRId64, rt, 28, s_value);
 }
@@ -1811,7 +1815,7 @@ static char *ADDIU_GP_B_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDIU %s, $%d, 0x%" PRIx64, rt, 28, u_value);
 }
@@ -1831,7 +1835,7 @@ static char *ADDIU_GP_W_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDIU %s, $%d, 0x%" PRIx64, rt, 28, u_value);
 }
@@ -1852,8 +1856,8 @@ static char *ADDIU_NEG_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     int64 u = neg_copy(u_value);
 
     return img_format("ADDIU %s, %s, %" PRId64, rt, rs, u);
@@ -1874,7 +1878,7 @@ static char *ADDIU_R1_SP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_5_4_3_2_1_0__s2(instruction);
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
 
     return img_format("ADDIU %s, $%d, 0x%" PRIx64, rt3, 29, u_value);
 }
@@ -1895,8 +1899,8 @@ static char *ADDIU_R2_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1_0__s2(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("ADDIU %s, %s, 0x%" PRIx64, rt3, rs3, u_value);
 }
@@ -1915,7 +1919,7 @@ static char *ADDIU_RS5_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDIU %s, %" PRId64, rt, s_value);
 }
@@ -1936,7 +1940,7 @@ static char *ADDIUPC_32_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
@@ -1958,7 +1962,7 @@ static char *ADDIUPC_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
@@ -1981,9 +1985,9 @@ static char *ADDQ_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2006,9 +2010,9 @@ static char *ADDQ_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2030,9 +2034,9 @@ static char *ADDQ_S_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -2055,9 +2059,9 @@ static char *ADDQH_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2080,9 +2084,9 @@ static char *ADDQH_R_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2105,9 +2109,9 @@ static char *ADDQH_R_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -2130,9 +2134,9 @@ static char *ADDQH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -2154,9 +2158,9 @@ static char *ADDSC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDSC %s, %s, %s", rd, rs, rt);
 }
@@ -2177,9 +2181,9 @@ static char *ADDU_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value, info), info);
 
     return img_format("ADDU %s, %s, %s", rd3, rs3, rt3);
 }
@@ -2201,9 +2205,9 @@ static char *ADDU_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDU %s, %s, %s", rd, rs, rt);
 }
@@ -2224,8 +2228,8 @@ static char *ADDU_4X4_(uint64 instruction, Dis_info *info)
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value, info), info);
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value, info), info);
 
     return img_format("ADDU %s, %s", rs4, rt4);
 }
@@ -2247,9 +2251,9 @@ static char *ADDU_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2271,9 +2275,9 @@ static char *ADDU_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2296,9 +2300,9 @@ static char *ADDU_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2320,9 +2324,9 @@ static char *ADDU_S_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2345,9 +2349,9 @@ static char *ADDUH_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2370,9 +2374,9 @@ static char *ADDUH_R_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2393,9 +2397,9 @@ static char *ADDWC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ADDWC %s, %s, %s", rd, rs, rt);
 }
@@ -2416,7 +2420,7 @@ static char *ALUIPC(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
@@ -2437,8 +2441,8 @@ static char *AND_16_(uint64 instruction, Dis_info *info)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("AND %s, %s", rs3, rt3);
 }
@@ -2460,9 +2464,9 @@ static char *AND_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("AND %s, %s, %s", rd, rs, rt);
 }
@@ -2483,8 +2487,8 @@ static char *ANDI_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 eu_value = extract_eu_3_2_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
     uint64 eu = encode_eu_from_u_andi16(eu_value);
 
     return img_format("ANDI %s, %s, 0x%" PRIx64, rt3, rs3, eu);
@@ -2507,8 +2511,8 @@ static char *ANDI_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("ANDI %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
@@ -2530,8 +2534,8 @@ static char *APPEND(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("APPEND %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -2553,7 +2557,7 @@ static char *ASET(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("ASET 0x%" PRIx64 ", %" PRId64 "(%s)",
                       bit_value, s_value, rs);
@@ -2615,8 +2619,8 @@ static char *BALRSC(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("BALRSC %s, %s", rt, rs);
 }
@@ -2638,7 +2642,7 @@ static char *BBEQZC(uint64 instruction, Dis_info *info)
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BBEQZC %s, 0x%" PRIx64 ", %s", rt, bit_value, s);
@@ -2661,7 +2665,7 @@ static char *BBNEZC(uint64 instruction, Dis_info *info)
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BBNEZC %s, 0x%" PRIx64 ", %s", rt, bit_value, s);
@@ -2723,7 +2727,7 @@ static char *BC1EQZC(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *ft = FPR(ft_value);
+    const char *ft = FPR(ft_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC1EQZC %s, %s", ft, s);
@@ -2745,7 +2749,7 @@ static char *BC1NEZC(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *ft = FPR(ft_value);
+    const char *ft = FPR(ft_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC1NEZC %s, %s", ft, s);
@@ -2810,8 +2814,8 @@ static char *BEQC_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *u = ADDRESS(u_value, 2, info);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
@@ -2834,8 +2838,8 @@ static char *BEQC_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
@@ -2858,7 +2862,7 @@ static char *BEQIC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BEQIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
@@ -2880,7 +2884,7 @@ static char *BEQZC_16_(uint64 instruction, Dis_info *info)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BEQZC %s, %s", rt3, s);
@@ -2903,8 +2907,8 @@ static char *BGEC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
@@ -2927,7 +2931,7 @@ static char *BGEIC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
@@ -2950,7 +2954,7 @@ static char *BGEIUC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEIUC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
@@ -2973,8 +2977,8 @@ static char *BGEUC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
@@ -2997,8 +3001,8 @@ static char *BLTC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
@@ -3021,7 +3025,7 @@ static char *BLTIC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
@@ -3044,7 +3048,7 @@ static char *BLTIUC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTIUC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
@@ -3067,8 +3071,8 @@ static char *BLTUC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
@@ -3091,8 +3095,8 @@ static char *BNEC_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *u = ADDRESS(u_value, 2, info);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
@@ -3115,8 +3119,8 @@ static char *BNEC_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
@@ -3139,7 +3143,7 @@ static char *BNEIC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BNEIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
@@ -3161,7 +3165,7 @@ static char *BNEZC_16_(uint64 instruction, Dis_info *info)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BNEZC %s, %s", rt3, s);
@@ -3240,7 +3244,7 @@ static char *BRSC(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("BRSC %s", rs);
 }
@@ -3262,7 +3266,7 @@ static char *CACHE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("CACHE 0x%" PRIx64 ", %s(%s)", op_value, s_value, rs);
 }
@@ -3284,7 +3288,7 @@ static char *CACHEE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("CACHEE 0x%" PRIx64 ", %s(%s)", op_value, s_value, rs);
 }
@@ -3305,8 +3309,8 @@ static char *CEIL_L_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CEIL.L.D %s, %s", ft, fs);
 }
@@ -3327,8 +3331,8 @@ static char *CEIL_L_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CEIL.L.S %s, %s", ft, fs);
 }
@@ -3349,8 +3353,8 @@ static char *CEIL_W_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CEIL.W.D %s, %s", ft, fs);
 }
@@ -3371,8 +3375,8 @@ static char *CEIL_W_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CEIL.W.S %s, %s", ft, fs);
 }
@@ -3393,7 +3397,7 @@ static char *CFC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CFC1 %s, CP%" PRIu64, rt, cs_value);
 }
@@ -3414,7 +3418,7 @@ static char *CFC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CFC2 %s, CP%" PRIu64, rt, cs_value);
 }
@@ -3435,8 +3439,8 @@ static char *CLASS_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CLASS.D %s, %s", ft, fs);
 }
@@ -3457,8 +3461,8 @@ static char *CLASS_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CLASS.S %s, %s", ft, fs);
 }
@@ -3479,8 +3483,8 @@ static char *CLO(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("CLO %s, %s", rt, rs);
 }
@@ -3501,8 +3505,8 @@ static char *CLZ(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("CLZ %s, %s", rt, rs);
 }
@@ -3524,9 +3528,9 @@ static char *CMP_AF_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.AF.D %s, %s, %s", fd, fs, ft);
 }
@@ -3548,9 +3552,9 @@ static char *CMP_AF_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.AF.S %s, %s, %s", fd, fs, ft);
 }
@@ -3572,9 +3576,9 @@ static char *CMP_EQ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -3594,8 +3598,8 @@ static char *CMP_EQ_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMP.EQ.PH %s, %s", rs, rt);
 }
@@ -3617,9 +3621,9 @@ static char *CMP_EQ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -3641,9 +3645,9 @@ static char *CMP_LE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.LE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3663,8 +3667,8 @@ static char *CMP_LE_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMP.LE.PH %s, %s", rs, rt);
 }
@@ -3686,9 +3690,9 @@ static char *CMP_LE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.LE.S %s, %s, %s", fd, fs, ft);
 }
@@ -3710,9 +3714,9 @@ static char *CMP_LT_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.LT.D %s, %s, %s", fd, fs, ft);
 }
@@ -3732,8 +3736,8 @@ static char *CMP_LT_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMP.LT.PH %s, %s", rs, rt);
 }
@@ -3755,9 +3759,9 @@ static char *CMP_LT_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.LT.S %s, %s, %s", fd, fs, ft);
 }
@@ -3779,9 +3783,9 @@ static char *CMP_NE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.NE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3803,9 +3807,9 @@ static char *CMP_NE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.NE.S %s, %s, %s", fd, fs, ft);
 }
@@ -3827,9 +3831,9 @@ static char *CMP_OR_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.OR.D %s, %s, %s", fd, fs, ft);
 }
@@ -3851,9 +3855,9 @@ static char *CMP_OR_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.OR.S %s, %s, %s", fd, fs, ft);
 }
@@ -3875,9 +3879,9 @@ static char *CMP_SAF_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
 }
@@ -3899,9 +3903,9 @@ static char *CMP_SAF_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
 }
@@ -3923,9 +3927,9 @@ static char *CMP_SEQ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -3947,9 +3951,9 @@ static char *CMP_SEQ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -3971,9 +3975,9 @@ static char *CMP_SLE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3995,9 +3999,9 @@ static char *CMP_SLE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4019,9 +4023,9 @@ static char *CMP_SLT_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4043,9 +4047,9 @@ static char *CMP_SLT_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4067,9 +4071,9 @@ static char *CMP_SNE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4091,9 +4095,9 @@ static char *CMP_SNE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4115,9 +4119,9 @@ static char *CMP_SOR_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4139,9 +4143,9 @@ static char *CMP_SOR_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4163,9 +4167,9 @@ static char *CMP_SUEQ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4187,9 +4191,9 @@ static char *CMP_SUEQ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4211,9 +4215,9 @@ static char *CMP_SULE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4235,9 +4239,9 @@ static char *CMP_SULE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4259,9 +4263,9 @@ static char *CMP_SULT_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4283,9 +4287,9 @@ static char *CMP_SULT_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4307,9 +4311,9 @@ static char *CMP_SUN_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4331,9 +4335,9 @@ static char *CMP_SUNE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4355,9 +4359,9 @@ static char *CMP_SUNE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4379,9 +4383,9 @@ static char *CMP_SUN_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4403,9 +4407,9 @@ static char *CMP_UEQ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4427,9 +4431,9 @@ static char *CMP_UEQ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4451,9 +4455,9 @@ static char *CMP_ULE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4475,9 +4479,9 @@ static char *CMP_ULE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4499,9 +4503,9 @@ static char *CMP_ULT_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4523,9 +4527,9 @@ static char *CMP_ULT_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4547,9 +4551,9 @@ static char *CMP_UN_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.UN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4571,9 +4575,9 @@ static char *CMP_UNE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4595,9 +4599,9 @@ static char *CMP_UNE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4619,9 +4623,9 @@ static char *CMP_UN_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("CMP.UN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4644,9 +4648,9 @@ static char *CMPGDU_EQ_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4669,9 +4673,9 @@ static char *CMPGDU_LE_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4694,9 +4698,9 @@ static char *CMPGDU_LT_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4719,9 +4723,9 @@ static char *CMPGU_EQ_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4744,9 +4748,9 @@ static char *CMPGU_LE_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4769,9 +4773,9 @@ static char *CMPGU_LT_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4792,8 +4796,8 @@ static char *CMPU_EQ_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMPU.EQ.QB %s, %s", rs, rt);
 }
@@ -4814,8 +4818,8 @@ static char *CMPU_LE_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMPU.LE.QB %s, %s", rs, rt);
 }
@@ -4836,8 +4840,8 @@ static char *CMPU_LT_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CMPU.LT.QB %s, %s", rs, rt);
 }
@@ -4877,7 +4881,7 @@ static char *CTC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CTC1 %s, CP%" PRIu64, rt, cs_value);
 }
@@ -4898,7 +4902,7 @@ static char *CTC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("CTC2 %s, CP%" PRIu64, rt, cs_value);
 }
@@ -4919,8 +4923,8 @@ static char *CVT_D_L(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.D.L %s, %s", ft, fs);
 }
@@ -4941,8 +4945,8 @@ static char *CVT_D_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.D.S %s, %s", ft, fs);
 }
@@ -4963,8 +4967,8 @@ static char *CVT_D_W(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.D.W %s, %s", ft, fs);
 }
@@ -4985,8 +4989,8 @@ static char *CVT_L_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.L.D %s, %s", ft, fs);
 }
@@ -5007,8 +5011,8 @@ static char *CVT_L_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.L.S %s, %s", ft, fs);
 }
@@ -5029,8 +5033,8 @@ static char *CVT_S_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.S.D %s, %s", ft, fs);
 }
@@ -5051,8 +5055,8 @@ static char *CVT_S_L(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.S.L %s, %s", ft, fs);
 }
@@ -5073,8 +5077,8 @@ static char *CVT_S_PL(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.S.PL %s, %s", ft, fs);
 }
@@ -5095,8 +5099,8 @@ static char *CVT_S_PU(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.S.PU %s, %s", ft, fs);
 }
@@ -5117,8 +5121,8 @@ static char *CVT_S_W(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.S.W %s, %s", ft, fs);
 }
@@ -5139,8 +5143,8 @@ static char *CVT_W_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.W.D %s, %s", ft, fs);
 }
@@ -5161,8 +5165,8 @@ static char *CVT_W_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("CVT.W.S %s, %s", ft, fs);
 }
@@ -5183,7 +5187,7 @@ static char *DADDIU_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DADDIU %s, %s", rt, s_value);
 }
@@ -5205,8 +5209,8 @@ static char *DADDIU_NEG_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     int64 u = neg_copy(u_value);
 
     return img_format("DADDIU %s, %s, %" PRId64, rt, rs, u);
@@ -5229,8 +5233,8 @@ static char *DADDIU_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DADDIU %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
@@ -5252,9 +5256,9 @@ static char *DADD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DADD %s, %s, %s", rd, rs, rt);
 }
@@ -5276,9 +5280,9 @@ static char *DADDU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DADDU %s, %s, %s", rd, rs, rt);
 }
@@ -5299,8 +5303,8 @@ static char *DCLO(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DCLO %s, %s", rt, rs);
 }
@@ -5321,8 +5325,8 @@ static char *DCLZ(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DCLZ %s, %s", rt, rs);
 }
@@ -5344,9 +5348,9 @@ static char *DDIV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DDIV %s, %s, %s", rd, rs, rt);
 }
@@ -5368,9 +5372,9 @@ static char *DDIVU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DDIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5411,8 +5415,8 @@ static char *DEXTM(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 msbd = encode_msbd_from_size(msbd_value);
 
     return img_format("DEXTM %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
@@ -5437,8 +5441,8 @@ static char *DEXT(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 msbd = encode_msbd_from_size(msbd_value);
 
     return img_format("DEXT %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
@@ -5463,8 +5467,8 @@ static char *DEXTU(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 msbd = encode_msbd_from_size(msbd_value);
 
     return img_format("DEXTU %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
@@ -5489,8 +5493,8 @@ static char *DINSM(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSM %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
@@ -5516,8 +5520,8 @@ static char *DINS(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINS %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
@@ -5543,8 +5547,8 @@ static char *DINSU(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSU %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
@@ -5567,7 +5571,7 @@ static char *DI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DI %s", rt);
 }
@@ -5589,9 +5593,9 @@ static char *DIV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DIV %s, %s, %s", rd, rs, rt);
 }
@@ -5613,9 +5617,9 @@ static char *DIV_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("DIV.D %s, %s, %s", fd, fs, ft);
 }
@@ -5637,9 +5641,9 @@ static char *DIV_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("DIV.S %s, %s, %s", fd, fs, ft);
 }
@@ -5661,9 +5665,9 @@ static char *DIVU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5686,9 +5690,9 @@ static char *DLSA(uint64 instruction, Dis_info *info)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DLSA %s, %s, %s, 0x%" PRIx64, rd, rs, rt, u2_value);
 }
@@ -5709,7 +5713,7 @@ static char *DLUI_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DLUI %s, 0x%" PRIx64, rt, u_value);
 }
@@ -5731,7 +5735,7 @@ static char *DMFC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMFC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -5753,8 +5757,8 @@ static char *DMFC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *fs = FPR(fs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("DMFC1 %s, %s", rt, fs);
 }
@@ -5775,7 +5779,7 @@ static char *DMFC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMFC2 %s, CP%" PRIu64, rt, cs_value);
 }
@@ -5797,7 +5801,7 @@ static char *DMFGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMFGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -5820,9 +5824,9 @@ static char *DMOD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMOD %s, %s, %s", rd, rs, rt);
 }
@@ -5844,9 +5848,9 @@ static char *DMODU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMODU %s, %s, %s", rd, rs, rt);
 }
@@ -5868,7 +5872,7 @@ static char *DMTC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMTC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -5890,8 +5894,8 @@ static char *DMTC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *fs = FPR(fs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("DMTC1 %s, %s", rt, fs);
 }
@@ -5912,7 +5916,7 @@ static char *DMTC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMTC2 %s, CP%" PRIu64, rt, cs_value);
 }
@@ -5934,7 +5938,7 @@ static char *DMTGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMTGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -5955,7 +5959,7 @@ static char *DMT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMT %s", rt);
 }
@@ -5977,9 +5981,9 @@ static char *DMUH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMUH %s, %s, %s", rd, rs, rt);
 }
@@ -6001,9 +6005,9 @@ static char *DMUHU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMUHU %s, %s, %s", rd, rs, rt);
 }
@@ -6025,9 +6029,9 @@ static char *DMUL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMUL %s, %s, %s", rd, rs, rt);
 }
@@ -6049,9 +6053,9 @@ static char *DMULU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DMULU %s, %s, %s", rd, rs, rt);
 }
@@ -6074,9 +6078,9 @@ static char *DPA_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6098,9 +6102,9 @@ static char *DPAQ_SA_L_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6122,9 +6126,9 @@ static char *DPAQ_S_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6146,9 +6150,9 @@ static char *DPAQX_SA_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6170,9 +6174,9 @@ static char *DPAQX_S_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6194,9 +6198,9 @@ static char *DPAU_H_QBL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6218,9 +6222,9 @@ static char *DPAU_H_QBR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6242,9 +6246,9 @@ static char *DPAX_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6266,9 +6270,9 @@ static char *DPS_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPS.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6290,9 +6294,9 @@ static char *DPSQ_SA_L_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6314,9 +6318,9 @@ static char *DPSQ_S_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6338,9 +6342,9 @@ static char *DPSQX_SA_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6362,9 +6366,9 @@ static char *DPSQX_S_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6386,9 +6390,9 @@ static char *DPSU_H_QBL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6410,9 +6414,9 @@ static char *DPSU_H_QBR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6434,9 +6438,9 @@ static char *DPSX_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6458,8 +6462,8 @@ static char *DROTR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DROTR %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -6481,8 +6485,8 @@ static char *DROTR32(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DROTR32 %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -6504,9 +6508,9 @@ static char *DROTRV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -6529,8 +6533,8 @@ static char *DROTX(uint64 instruction, Dis_info *info)
     uint64 shiftx_value = extract_shiftx_11_10_9_8_7_6(instruction);
     uint64 shift_value = extract_shift_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DROTX %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
                       rt, rs, shift_value, shiftx_value);
@@ -6553,8 +6557,8 @@ static char *DSLL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DSLL %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -6576,8 +6580,8 @@ static char *DSLL32(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DSLL32 %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -6599,9 +6603,9 @@ static char *DSLLV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DSLLV %s, %s, %s", rd, rs, rt);
 }
@@ -6623,8 +6627,8 @@ static char *DSRA(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DSRA %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -6646,8 +6650,8 @@ static char *DSRA32(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DSRA32 %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -6669,9 +6673,9 @@ static char *DSRAV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DSRAV %s, %s, %s", rd, rs, rt);
 }
@@ -6693,8 +6697,8 @@ static char *DSRL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DSRL %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -6716,8 +6720,8 @@ static char *DSRL32(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("DSRL32 %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -6739,9 +6743,9 @@ static char *DSRLV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DSRLV %s, %s, %s", rd, rs, rt);
 }
@@ -6763,9 +6767,9 @@ static char *DSUB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DSUB %s, %s, %s", rd, rs, rt);
 }
@@ -6787,9 +6791,9 @@ static char *DSUBU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DSUBU %s, %s, %s", rd, rs, rt);
 }
@@ -6809,7 +6813,7 @@ static char *DVPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DVPE %s", rt);
 }
@@ -6829,7 +6833,7 @@ static char *DVP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("DVP %s", rt);
 }
@@ -6867,7 +6871,7 @@ static char *EI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("EI %s", rt);
 }
@@ -6887,7 +6891,7 @@ static char *EMT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("EMT %s", rt);
 }
@@ -6943,7 +6947,7 @@ static char *EVP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("EVP %s", rt);
 }
@@ -6963,7 +6967,7 @@ static char *EVPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("EVPE %s", rt);
 }
@@ -6986,8 +6990,8 @@ static char *EXT(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 msbd = encode_msbd_from_size(msbd_value);
 
     return img_format("EXT %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
@@ -7012,9 +7016,9 @@ static char *EXTD(uint64 instruction, Dis_info *info)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("EXTD %s, %s, %s, 0x%" PRIx64, rd, rs, rt, shift_value);
 }
@@ -7037,9 +7041,9 @@ static char *EXTD32(uint64 instruction, Dis_info *info)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("EXTD32 %s, %s, %s, 0x%" PRIx64, rd, rs, rt, shift_value);
 }
@@ -7061,8 +7065,8 @@ static char *EXTPDP(uint64 instruction, Dis_info *info)
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("EXTPDP %s, %s, 0x%" PRIx64, rt, ac, size_value);
 }
@@ -7084,9 +7088,9 @@ static char *EXTPDPV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("EXTPDPV %s, %s, %s", rt, ac, rs);
 }
@@ -7108,8 +7112,8 @@ static char *EXTP(uint64 instruction, Dis_info *info)
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("EXTP %s, %s, 0x%" PRIx64, rt, ac, size_value);
 }
@@ -7131,9 +7135,9 @@ static char *EXTPV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("EXTPV %s, %s, %s", rt, ac, rs);
 }
@@ -7156,8 +7160,8 @@ static char *EXTR_RS_W(uint64 instruction, Dis_info *info)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("EXTR_RS.W %s, %s, 0x%" PRIx64, rt, ac, shift_value);
 }
@@ -7180,8 +7184,8 @@ static char *EXTR_R_W(uint64 instruction, Dis_info *info)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("EXTR_R.W %s, %s, 0x%" PRIx64, rt, ac, shift_value);
 }
@@ -7204,8 +7208,8 @@ static char *EXTR_S_H(uint64 instruction, Dis_info *info)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("EXTR_S.H %s, %s, 0x%" PRIx64, rt, ac, shift_value);
 }
@@ -7228,8 +7232,8 @@ static char *EXTR_W(uint64 instruction, Dis_info *info)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("EXTR.W %s, %s, 0x%" PRIx64, rt, ac, shift_value);
 }
@@ -7252,9 +7256,9 @@ static char *EXTRV_RS_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
 }
@@ -7277,9 +7281,9 @@ static char *EXTRV_R_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
 }
@@ -7302,9 +7306,9 @@ static char *EXTRV_S_H(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
 }
@@ -7327,9 +7331,9 @@ static char *EXTRV_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("EXTRV.W %s, %s, %s", rt, ac, rs);
 }
@@ -7353,9 +7357,9 @@ static char *EXTW(uint64 instruction, Dis_info *info)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("EXTW %s, %s, %s, 0x%" PRIx64, rd, rs, rt, shift_value);
 }
@@ -7376,8 +7380,8 @@ static char *FLOOR_L_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("FLOOR.L.D %s, %s", ft, fs);
 }
@@ -7398,8 +7402,8 @@ static char *FLOOR_L_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("FLOOR.L.S %s, %s", ft, fs);
 }
@@ -7420,8 +7424,8 @@ static char *FLOOR_W_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("FLOOR.W.D %s, %s", ft, fs);
 }
@@ -7442,8 +7446,8 @@ static char *FLOOR_W_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("FLOOR.W.S %s, %s", ft, fs);
 }
@@ -7465,9 +7469,9 @@ static char *FORK(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("FORK %s, %s, %s", rd, rs, rt);
 }
@@ -7528,8 +7532,8 @@ static char *INS(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("INS %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
@@ -7552,8 +7556,8 @@ static char *INSV(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("INSV %s, %s", rt, rs);
 }
@@ -7591,7 +7595,7 @@ static char *JALRC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("JALRC $%d, %s", 31, rt);
 }
@@ -7612,8 +7616,8 @@ static char *JALRC_32_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("JALRC %s, %s", rt, rs);
 }
@@ -7634,8 +7638,8 @@ static char *JALRC_HB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("JALRC.HB %s, %s", rt, rs);
 }
@@ -7655,7 +7659,7 @@ static char *JRC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("JRC %s", rt);
 }
@@ -7677,8 +7681,8 @@ static char *LB_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("LB %s, 0x%" PRIx64 "(%s)", rt3, u_value, rs3);
 }
@@ -7699,7 +7703,7 @@ static char *LB_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LB %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -7721,8 +7725,8 @@ static char *LB_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LB %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -7744,8 +7748,8 @@ static char *LB_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LB %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -7767,8 +7771,8 @@ static char *LBE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LBE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -7790,8 +7794,8 @@ static char *LBU_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("LBU %s, 0x%" PRIx64 "(%s)", rt3, u_value, rs3);
 }
@@ -7812,7 +7816,7 @@ static char *LBU_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LBU %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -7834,8 +7838,8 @@ static char *LBU_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LBU %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -7857,8 +7861,8 @@ static char *LBU_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LBU %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -7880,8 +7884,8 @@ static char *LBUE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LBUE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -7903,9 +7907,9 @@ static char *LBUX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LBUX %s, %s(%s)", rd, rs, rt);
 }
@@ -7927,9 +7931,9 @@ static char *LBX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LBX %s, %s(%s)", rd, rs, rt);
 }
@@ -7950,7 +7954,7 @@ static char *LD_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LD %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -7972,8 +7976,8 @@ static char *LD_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LD %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -7995,8 +7999,8 @@ static char *LD_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LD %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -8017,7 +8021,7 @@ static char *LDC1_GP_(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(ft_value);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("LDC1 %s, 0x%" PRIx64 "($%d)", ft, u_value, 28);
 }
@@ -8039,8 +8043,8 @@ static char *LDC1_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LDC1 %s, %" PRId64 "(%s)", ft, s_value, rs);
 }
@@ -8062,8 +8066,8 @@ static char *LDC1_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LDC1 %s, 0x%" PRIx64 "(%s)", ft, u_value, rs);
 }
@@ -8085,9 +8089,9 @@ static char *LDC1XS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -8109,9 +8113,9 @@ static char *LDC1X(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -8133,7 +8137,7 @@ static char *LDC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LDC2 CP%" PRIu64 ", %" PRId64 "(%s)",
                       ct_value, s_value, rs);
@@ -8157,8 +8161,8 @@ static char *LDM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 count3 = encode_count3_from_count(count3_value);
 
     return img_format("LDM %s, %" PRId64 "(%s), 0x%" PRIx64,
@@ -8181,7 +8185,7 @@ static char *LDPC_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("LDPC %s, %s", rt, s);
@@ -8204,9 +8208,9 @@ static char *LDX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LDX %s, %s(%s)", rd, rs, rt);
 }
@@ -8228,9 +8232,9 @@ static char *LDXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8252,8 +8256,8 @@ static char *LH_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("LH %s, 0x%" PRIx64 "(%s)", rt3, u_value, rs3);
 }
@@ -8274,7 +8278,7 @@ static char *LH_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LH %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -8296,8 +8300,8 @@ static char *LH_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LH %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -8319,8 +8323,8 @@ static char *LH_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LH %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -8342,8 +8346,8 @@ static char *LHE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LHE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -8365,8 +8369,8 @@ static char *LHU_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("LHU %s, 0x%" PRIx64 "(%s)", rt3, u_value, rs3);
 }
@@ -8387,7 +8391,7 @@ static char *LHU_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LHU %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -8409,8 +8413,8 @@ static char *LHU_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LHU %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -8432,8 +8436,8 @@ static char *LHU_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LHU %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -8455,8 +8459,8 @@ static char *LHUE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LHUE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -8478,9 +8482,9 @@ static char *LHUX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LHUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8502,9 +8506,9 @@ static char *LHUXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LHUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8526,9 +8530,9 @@ static char *LHXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8550,9 +8554,9 @@ static char *LHX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LHX %s, %s(%s)", rd, rs, rt);
 }
@@ -8573,7 +8577,7 @@ static char *LI_16_(uint64 instruction, Dis_info *info)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     int64 eu = encode_eu_from_s_li16(eu_value);
 
     return img_format("LI %s, %" PRId64, rt3, eu);
@@ -8595,7 +8599,7 @@ static char *LI_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LI %s, %" PRId64, rt, s_value);
 }
@@ -8617,8 +8621,8 @@ static char *LL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LL %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -8640,8 +8644,8 @@ static char *LLD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LLD %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -8663,9 +8667,9 @@ static char *LLDP(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ru = GPR(ru_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ru = GPR(ru_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LLDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8687,8 +8691,8 @@ static char *LLE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LLE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -8710,9 +8714,9 @@ static char *LLWP(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ru = GPR(ru_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ru = GPR(ru_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LLWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8734,9 +8738,9 @@ static char *LLWPE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ru = GPR(ru_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ru = GPR(ru_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LLWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -8759,9 +8763,9 @@ static char *LSA(uint64 instruction, Dis_info *info)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LSA %s, %s, %s, 0x%" PRIx64, rd, rs, rt, u2_value);
 }
@@ -8782,7 +8786,7 @@ static char *LUI(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LUI %s, %%hi(%" PRId64 ")", rt, s_value);
 }
@@ -8804,8 +8808,8 @@ static char *LW_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("LW %s, 0x%" PRIx64 "(%s)", rt3, u_value, rs3);
 }
@@ -8827,8 +8831,8 @@ static char *LW_4X4_(uint64 instruction, Dis_info *info)
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value, info), info);
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value, info), info);
 
     return img_format("LW %s, 0x%" PRIx64 "(%s)", rt4, u_value, rs4);
 }
@@ -8849,7 +8853,7 @@ static char *LW_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LW %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -8870,7 +8874,7 @@ static char *LW_GP16_(uint64 instruction, Dis_info *info)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
 
     return img_format("LW %s, 0x%" PRIx64 "($%d)", rt3, u_value, 28);
 }
@@ -8892,8 +8896,8 @@ static char *LW_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LW %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -8914,7 +8918,7 @@ static char *LW_SP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LW %s, 0x%" PRIx64 "($%d)", rt, u_value, 29);
 }
@@ -8936,8 +8940,8 @@ static char *LW_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LW %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -8958,7 +8962,7 @@ static char *LWC1_GP_(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(ft_value);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("LWC1 %s, 0x%" PRIx64 "($%d)", ft, u_value, 28);
 }
@@ -8980,8 +8984,8 @@ static char *LWC1_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LWC1 %s, %" PRId64 "(%s)", ft, s_value, rs);
 }
@@ -9003,8 +9007,8 @@ static char *LWC1_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LWC1 %s, 0x%" PRIx64 "(%s)", ft, u_value, rs);
 }
@@ -9026,9 +9030,9 @@ static char *LWC1X(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -9050,9 +9054,9 @@ static char *LWC1XS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -9074,7 +9078,7 @@ static char *LWC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LWC2 CP%" PRIu64 ", %" PRId64 "(%s)",
                       ct_value, s_value, rs);
@@ -9097,8 +9101,8 @@ static char *LWE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LWE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -9121,8 +9125,8 @@ static char *LWM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 count3 = encode_count3_from_count(count3_value);
 
     return img_format("LWM %s, %" PRId64 "(%s), 0x%" PRIx64,
@@ -9145,7 +9149,7 @@ static char *LWPC_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("LWPC %s, %s", rt, s);
@@ -9167,7 +9171,7 @@ static char *LWU_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LWU %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -9189,8 +9193,8 @@ static char *LWU_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LWU %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -9212,8 +9216,8 @@ static char *LWU_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("LWU %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -9235,9 +9239,9 @@ static char *LWUX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LWUX %s, %s(%s)", rd, rs, rt);
 }
@@ -9259,9 +9263,9 @@ static char *LWUXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LWUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9283,9 +9287,9 @@ static char *LWX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LWX %s, %s(%s)", rd, rs, rt);
 }
@@ -9307,9 +9311,9 @@ static char *LWXS_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    uint64 rt3 = decode_gpr_gpr3(rt3_value);
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    uint64 rt3 = decode_gpr_gpr3(rt3_value, info);
 
     return img_format("LWXS %s, %s(0x%" PRIx64 ")", rd3, rs3, rt3);
 }
@@ -9331,9 +9335,9 @@ static char *LWXS_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("LWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9356,9 +9360,9 @@ static char *MADD_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MADD %s, %s, %s", ac, rs, rt);
 }
@@ -9380,9 +9384,9 @@ static char *MADDF_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MADDF.D %s, %s, %s", fd, fs, ft);
 }
@@ -9404,9 +9408,9 @@ static char *MADDF_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MADDF.S %s, %s, %s", fd, fs, ft);
 }
@@ -9429,9 +9433,9 @@ static char *MADDU_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MADDU %s, %s, %s", ac, rs, rt);
 }
@@ -9454,9 +9458,9 @@ static char *MAQ_S_W_PHL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9479,9 +9483,9 @@ static char *MAQ_S_W_PHR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9504,9 +9508,9 @@ static char *MAQ_SA_W_PHL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9529,9 +9533,9 @@ static char *MAQ_SA_W_PHR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9553,9 +9557,9 @@ static char *MAX_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MAX.D %s, %s, %s", fd, fs, ft);
 }
@@ -9577,9 +9581,9 @@ static char *MAX_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MAX.S %s, %s, %s", fd, fs, ft);
 }
@@ -9601,9 +9605,9 @@ static char *MAXA_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MAXA.D %s, %s, %s", fd, fs, ft);
 }
@@ -9625,9 +9629,9 @@ static char *MAXA_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MAXA.S %s, %s, %s", fd, fs, ft);
 }
@@ -9649,7 +9653,7 @@ static char *MFC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MFC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -9671,8 +9675,8 @@ static char *MFC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *fs = FPR(fs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("MFC1 %s, %s", rt, fs);
 }
@@ -9693,7 +9697,7 @@ static char *MFC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MFC2 %s, CP%" PRIu64, rt, cs_value);
 }
@@ -9715,7 +9719,7 @@ static char *MFGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MFGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -9738,7 +9742,7 @@ static char *MFHC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MFHC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -9760,8 +9764,8 @@ static char *MFHC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *fs = FPR(fs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("MFHC1 %s, %s", rt, fs);
 }
@@ -9782,7 +9786,7 @@ static char *MFHC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MFHC2 %s, CP%" PRIu64, rt, cs_value);
 }
@@ -9804,7 +9808,7 @@ static char *MFHGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MFHGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -9825,8 +9829,8 @@ static char *MFHI_DSP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("MFHI %s, %s", rt, ac);
 }
@@ -9849,7 +9853,7 @@ static char *MFHTR(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MFHTR %s, 0x%" PRIx64 ", 0x%" PRIx64 ", 0x%" PRIx64,
                       rt, c0s_value, u_value, sel_value);
@@ -9870,8 +9874,8 @@ static char *MFLO_DSP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ac = AC(ac_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("MFLO %s, %s", rt, ac);
 }
@@ -9894,7 +9898,7 @@ static char *MFTR(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MFTR %s, 0x%" PRIx64 ", 0x%" PRIx64 ", 0x%" PRIx64,
                       rt, c0s_value, u_value, sel_value);
@@ -9917,9 +9921,9 @@ static char *MIN_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MIN.D %s, %s, %s", fd, fs, ft);
 }
@@ -9941,9 +9945,9 @@ static char *MIN_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MIN.S %s, %s, %s", fd, fs, ft);
 }
@@ -9965,9 +9969,9 @@ static char *MINA_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MINA.D %s, %s, %s", fd, fs, ft);
 }
@@ -9989,9 +9993,9 @@ static char *MINA_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MINA.S %s, %s, %s", fd, fs, ft);
 }
@@ -10013,9 +10017,9 @@ static char *MOD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MOD %s, %s, %s", rd, rs, rt);
 }
@@ -10037,9 +10041,9 @@ static char *MODSUB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MODSUB %s, %s, %s", rd, rs, rt);
 }
@@ -10061,9 +10065,9 @@ static char *MODU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MODU %s, %s, %s", rd, rs, rt);
 }
@@ -10084,8 +10088,8 @@ static char *MOV_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("MOV.D %s, %s", ft, fs);
 }
@@ -10106,8 +10110,8 @@ static char *MOV_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("MOV.S %s, %s", ft, fs);
 }
@@ -10129,8 +10133,8 @@ static char *MOVE_BALC(uint64 instruction, Dis_info *info)
     uint64 rd1_value = extract_rdl_25_24(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    const char *rd1 = GPR(decode_gpr_gpr1(rd1_value));
-    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *rd1 = GPR(decode_gpr_gpr1(rd1_value, info), info);
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value, info), info);
     g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
@@ -10153,11 +10157,11 @@ static char *MOVEP(uint64 instruction, Dis_info *info)
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rsz4_value = extract_rsz4_4_2_1_0(instruction);
 
-    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    const char *re2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value, info), info);
+    const char *re2 = GPR(decode_gpr_gpr2_reg2(rd2_value, info), info);
     /* !!!!!!!!!! - no conversion function */
-    const char *rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
-    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value, info), info);
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value, info), info);
 
     return img_format("MOVEP %s, %s, %s, %s", rd2, re2, rsz4, rtz4);
     /* hand edited */
@@ -10180,10 +10184,10 @@ static char *MOVEP_REV_(uint64 instruction, Dis_info *info)
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    const char *rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value, info), info);
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value, info), info);
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value, info), info);
+    const char *rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value, info), info);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("MOVEP %s, %s, %s, %s", rs4, rt4, rd2, rs2);
@@ -10206,8 +10210,8 @@ static char *MOVE(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("MOVE %s, %s", rt, rs);
 }
@@ -10229,9 +10233,9 @@ static char *MOVN(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MOVN %s, %s, %s", rd, rs, rt);
 }
@@ -10253,9 +10257,9 @@ static char *MOVZ(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MOVZ %s, %s, %s", rd, rs, rt);
 }
@@ -10277,9 +10281,9 @@ static char *MSUB_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MSUB %s, %s, %s", ac, rs, rt);
 }
@@ -10301,9 +10305,9 @@ static char *MSUBF_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MSUBF.D %s, %s, %s", fd, fs, ft);
 }
@@ -10325,9 +10329,9 @@ static char *MSUBF_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MSUBF.S %s, %s, %s", fd, fs, ft);
 }
@@ -10349,9 +10353,9 @@ static char *MSUBU_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MSUBU %s, %s, %s", ac, rs, rt);
 }
@@ -10373,7 +10377,7 @@ static char *MTC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MTC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -10395,8 +10399,8 @@ static char *MTC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *fs = FPR(fs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("MTC1 %s, %s", rt, fs);
 }
@@ -10417,7 +10421,7 @@ static char *MTC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MTC2 %s, CP%" PRIu64, rt, cs_value);
 }
@@ -10439,7 +10443,7 @@ static char *MTGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MTGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -10462,7 +10466,7 @@ static char *MTHC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MTHC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -10484,8 +10488,8 @@ static char *MTHC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *fs = FPR(fs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("MTHC1 %s, %s", rt, fs);
 }
@@ -10506,7 +10510,7 @@ static char *MTHC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MTHC2 %s, CP%" PRIu64, rt, cs_value);
 }
@@ -10528,7 +10532,7 @@ static char *MTHGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MTHGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, c0s_value, sel_value);
@@ -10549,8 +10553,8 @@ static char *MTHI_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("MTHI %s, %s", rs, ac);
 }
@@ -10570,8 +10574,8 @@ static char *MTHLIP(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("MTHLIP %s, %s", rs, ac);
 }
@@ -10594,7 +10598,7 @@ static char *MTHTR(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MTHTR %s, 0x%" PRIx64 ", 0x%" PRIx64 ", 0x%" PRIx64,
                       rt, c0s_value, u_value, sel_value);
@@ -10615,8 +10619,8 @@ static char *MTLO_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("MTLO %s, %s", rs, ac);
 }
@@ -10639,7 +10643,7 @@ static char *MTTR(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MTTR %s, 0x%" PRIx64 ", 0x%" PRIx64 ", 0x%" PRIx64,
                       rt, c0s_value, u_value, sel_value);
@@ -10662,9 +10666,9 @@ static char *MUH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MUH %s, %s, %s", rd, rs, rt);
 }
@@ -10686,9 +10690,9 @@ static char *MUHU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MUHU %s, %s, %s", rd, rs, rt);
 }
@@ -10710,9 +10714,9 @@ static char *MUL_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MUL %s, %s, %s", rd, rs, rt);
 }
@@ -10733,8 +10737,8 @@ static char *MUL_4X4_(uint64 instruction, Dis_info *info)
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value, info), info);
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value, info), info);
 
     return img_format("MUL %s, %s", rs4, rt4);
 }
@@ -10756,9 +10760,9 @@ static char *MUL_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MUL.D %s, %s, %s", fd, fs, ft);
 }
@@ -10781,9 +10785,9 @@ static char *MUL_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MUL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -10806,9 +10810,9 @@ static char *MUL_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MUL_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -10830,9 +10834,9 @@ static char *MUL_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("MUL.S %s, %s, %s", fd, fs, ft);
 }
@@ -10855,9 +10859,9 @@ static char *MULEQ_S_W_PHL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
 }
@@ -10880,9 +10884,9 @@ static char *MULEQ_S_W_PHR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
 }
@@ -10905,9 +10909,9 @@ static char *MULEU_S_PH_QBL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
 }
@@ -10930,9 +10934,9 @@ static char *MULEU_S_PH_QBR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
 }
@@ -10955,9 +10959,9 @@ static char *MULQ_RS_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
 }
@@ -10980,9 +10984,9 @@ static char *MULQ_RS_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
 }
@@ -11005,9 +11009,9 @@ static char *MULQ_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11030,9 +11034,9 @@ static char *MULQ_S_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -11055,9 +11059,9 @@ static char *MULSA_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11080,9 +11084,9 @@ static char *MULSAQ_S_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11104,9 +11108,9 @@ static char *MULT_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULT %s, %s, %s", ac, rs, rt);
 }
@@ -11128,9 +11132,9 @@ static char *MULTU_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULTU %s, %s, %s", ac, rs, rt);
 }
@@ -11152,9 +11156,9 @@ static char *MULU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("MULU %s, %s, %s", rd, rs, rt);
 }
@@ -11175,8 +11179,8 @@ static char *NEG_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("NEG.D %s, %s", ft, fs);
 }
@@ -11197,8 +11201,8 @@ static char *NEG_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("NEG.S %s, %s", ft, fs);
 }
@@ -11256,9 +11260,9 @@ static char *NOR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("NOR %s, %s, %s", rd, rs, rt);
 }
@@ -11279,8 +11283,8 @@ static char *NOT_16_(uint64 instruction, Dis_info *info)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("NOT %s, %s", rt3, rs3);
 }
@@ -11301,8 +11305,8 @@ static char *OR_16_(uint64 instruction, Dis_info *info)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
 
     return img_format("OR %s, %s", rs3, rt3);
 }
@@ -11324,9 +11328,9 @@ static char *OR_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("OR %s, %s, %s", rd, rs, rt);
 }
@@ -11348,8 +11352,8 @@ static char *ORI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("ORI %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
@@ -11372,9 +11376,9 @@ static char *PACKRL_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("PACKRL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11415,9 +11419,9 @@ static char *PICK_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("PICK.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11440,9 +11444,9 @@ static char *PICK_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("PICK.QB %s, %s, %s", rd, rs, rt);
 }
@@ -11464,8 +11468,8 @@ static char *PRECEQ_W_PHL(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECEQ.W.PHL %s, %s", rt, rs);
 }
@@ -11487,8 +11491,8 @@ static char *PRECEQ_W_PHR(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECEQ.W.PHR %s, %s", rt, rs);
 }
@@ -11510,8 +11514,8 @@ static char *PRECEQU_PH_QBLA(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECEQU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11533,8 +11537,8 @@ static char *PRECEQU_PH_QBL(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECEQU.PH.QBL %s, %s", rt, rs);
 }
@@ -11556,8 +11560,8 @@ static char *PRECEQU_PH_QBRA(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECEQU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11579,8 +11583,8 @@ static char *PRECEQU_PH_QBR(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECEQU.PH.QBR %s, %s", rt, rs);
 }
@@ -11603,8 +11607,8 @@ static char *PRECEU_PH_QBLA(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECEU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11626,8 +11630,8 @@ static char *PRECEU_PH_QBL(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECEU.PH.QBL %s, %s", rt, rs);
 }
@@ -11650,8 +11654,8 @@ static char *PRECEU_PH_QBRA(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECEU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11673,8 +11677,8 @@ static char *PRECEU_PH_QBR(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECEU.PH.QBR %s, %s", rt, rs);
 }
@@ -11697,9 +11701,9 @@ static char *PRECR_QB_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11722,8 +11726,8 @@ static char *PRECR_SRA_PH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECR_SRA.PH.W %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -11746,8 +11750,8 @@ static char *PRECR_SRA_R_PH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PRECR_SRA_R.PH.W %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -11770,9 +11774,9 @@ static char *PRECRQ_PH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -11795,9 +11799,9 @@ static char *PRECRQ_QB_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11820,9 +11824,9 @@ static char *PRECRQ_RS_PH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -11845,9 +11849,9 @@ static char *PRECRQU_S_QB_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11869,7 +11873,7 @@ static char *PREF_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PREF 0x%" PRIx64 ", %s(%s)",
                       hint_value, s_value, rs);
@@ -11892,7 +11896,7 @@ static char *PREF_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PREF 0x%" PRIx64 ", 0x%" PRIx64 "(%s)",
                       hint_value, u_value, rs);
@@ -11915,7 +11919,7 @@ static char *PREFE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PREFE 0x%" PRIx64 ", %s(%s)", hint_value, s_value, rs);
 }
@@ -11937,8 +11941,8 @@ static char *PREPEND(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("PREPEND %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -11958,8 +11962,8 @@ static char *RADDU_W_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("RADDU.W.QB %s, %s", rt, rs);
 }
@@ -11979,7 +11983,7 @@ static char *RDDSP(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("RDDSP %s, 0x%" PRIx64, rt, mask_value);
 }
@@ -12001,7 +12005,7 @@ static char *RDHWR(uint64 instruction, Dis_info *info)
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("RDHWR %s, CP%" PRIu64 ", 0x%" PRIx64,
                       rt, hs_value, sel_value);
@@ -12023,8 +12027,8 @@ static char *RDPGPR(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("RDPGPR %s, %s", rt, rs);
 }
@@ -12045,8 +12049,8 @@ static char *RECIP_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("RECIP.D %s, %s", ft, fs);
 }
@@ -12067,8 +12071,8 @@ static char *RECIP_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("RECIP.S %s, %s", ft, fs);
 }
@@ -12089,7 +12093,7 @@ static char *REPL_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("REPL.PH %s, %s", rt, s_value);
 }
@@ -12110,7 +12114,7 @@ static char *REPL_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("REPL.QB %s, 0x%" PRIx64, rt, u_value);
 }
@@ -12131,8 +12135,8 @@ static char *REPLV_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("REPLV.PH %s, %s", rt, rs);
 }
@@ -12152,8 +12156,8 @@ static char *REPLV_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("REPLV.QB %s, %s", rt, rs);
 }
@@ -12177,7 +12181,7 @@ static char *RESTORE_32_(uint64 instruction, Dis_info *info)
     uint64 gp_value = extract_gp_2(instruction);
 
     g_autofree char *save_restore_str = save_restore_list(
-        rt_value, count_value, gp_value);
+        rt_value, count_value, gp_value, info);
     return img_format("RESTORE 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
@@ -12199,7 +12203,7 @@ static char *RESTORE_JRC_16_(uint64 instruction, Dis_info *info)
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
     g_autofree char *save_restore_str = save_restore_list(
-        encode_rt1_from_rt(rt1_value), count_value, 0);
+        encode_rt1_from_rt(rt1_value), count_value, 0, info);
     return img_format("RESTORE.JRC 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
@@ -12222,7 +12226,7 @@ static char *RESTORE_JRC_32_(uint64 instruction, Dis_info *info)
     uint64 gp_value = extract_gp_2(instruction);
 
     g_autofree char *save_restore_str = save_restore_list(
-        rt_value, count_value, gp_value);
+        rt_value, count_value, gp_value, info);
     return img_format("RESTORE.JRC 0x%" PRIx64 "%s", u_value,
                       save_restore_str);
 }
@@ -12263,8 +12267,8 @@ static char *RINT_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("RINT.D %s, %s", ft, fs);
 }
@@ -12285,8 +12289,8 @@ static char *RINT_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("RINT.S %s, %s", ft, fs);
 }
@@ -12308,8 +12312,8 @@ static char *ROTR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("ROTR %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -12331,9 +12335,9 @@ static char *ROTRV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("ROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -12357,8 +12361,8 @@ static char *ROTX(uint64 instruction, Dis_info *info)
     uint64 stripe_value = extract_stripe_6(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("ROTX %s, %s, 0x%" PRIx64 ", 0x%" PRIx64 ", 0x%" PRIx64,
                        rt, rs, shift_value, shiftx_value, stripe_value);
@@ -12380,8 +12384,8 @@ static char *ROUND_L_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("ROUND.L.D %s, %s", ft, fs);
 }
@@ -12402,8 +12406,8 @@ static char *ROUND_L_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("ROUND.L.S %s, %s", ft, fs);
 }
@@ -12424,8 +12428,8 @@ static char *ROUND_W_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("ROUND.W.D %s, %s", ft, fs);
 }
@@ -12446,8 +12450,8 @@ static char *ROUND_W_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("ROUND.W.S %s, %s", ft, fs);
 }
@@ -12468,8 +12472,8 @@ static char *RSQRT_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("RSQRT.D %s, %s", ft, fs);
 }
@@ -12490,8 +12494,8 @@ static char *RSQRT_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("RSQRT.S %s, %s", ft, fs);
 }
@@ -12514,7 +12518,7 @@ static char *SAVE_16_(uint64 instruction, Dis_info *info)
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
     g_autofree char *save_restore_str = save_restore_list(
-        encode_rt1_from_rt(rt1_value), count_value, 0);
+        encode_rt1_from_rt(rt1_value), count_value, 0, info);
     return img_format("SAVE 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
@@ -12537,7 +12541,7 @@ static char *SAVE_32_(uint64 instruction, Dis_info *info)
     uint64 gp_value = extract_gp_2(instruction);
 
     g_autofree char *save_restore_str = save_restore_list(
-        rt_value, count_value, gp_value);
+        rt_value, count_value, gp_value, info);
     return img_format("SAVE 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
@@ -12578,8 +12582,8 @@ static char *SB_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("SB %s, 0x%" PRIx64 "(%s)", rtz3, u_value, rs3);
 }
@@ -12600,7 +12604,7 @@ static char *SB_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SB %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -12622,8 +12626,8 @@ static char *SB_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SB %s, %s(%s)", rt, s_value, rs);
 }
@@ -12645,8 +12649,8 @@ static char *SB_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SB %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -12668,8 +12672,8 @@ static char *SBE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SBE %s, %s(%s)", rt, s_value, rs);
 }
@@ -12691,9 +12695,9 @@ static char *SBX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SBX %s, %s(%s)", rd, rs, rt);
 }
@@ -12715,8 +12719,8 @@ static char *SC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SC %s, %s(%s)", rt, s_value, rs);
 }
@@ -12738,8 +12742,8 @@ static char *SCD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SCD %s, %s(%s)", rt, s_value, rs);
 }
@@ -12761,9 +12765,9 @@ static char *SCDP(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ru = GPR(ru_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ru = GPR(ru_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SCDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -12785,8 +12789,8 @@ static char *SCE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SCE %s, %s(%s)", rt, s_value, rs);
 }
@@ -12808,9 +12812,9 @@ static char *SCWP(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ru = GPR(ru_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ru = GPR(ru_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SCWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -12832,9 +12836,9 @@ static char *SCWPE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *ru = GPR(ru_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *ru = GPR(ru_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SCWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -12855,7 +12859,7 @@ static char *SD_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SD %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -12877,8 +12881,8 @@ static char *SD_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SD %s, %s(%s)", rt, s_value, rs);
 }
@@ -12900,8 +12904,8 @@ static char *SD_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SD %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -12960,7 +12964,7 @@ static char *SDC1_GP_(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(ft_value);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("SDC1 %s, 0x%" PRIx64 "($%d)", ft, u_value, 28);
 }
@@ -12982,8 +12986,8 @@ static char *SDC1_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SDC1 %s, %s(%s)", ft, s_value, rs);
 }
@@ -13005,8 +13009,8 @@ static char *SDC1_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SDC1 %s, 0x%" PRIx64 "(%s)", ft, u_value, rs);
 }
@@ -13028,9 +13032,9 @@ static char *SDC1X(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -13052,9 +13056,9 @@ static char *SDC1XS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -13076,7 +13080,7 @@ static char *SDC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SDC2 CP%" PRIu64 ", %s(%s)", cs_value, s_value, rs);
 }
@@ -13099,8 +13103,8 @@ static char *SDM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 count3 = encode_count3_from_count(count3_value);
 
     return img_format("SDM %s, %s(%s), 0x%" PRIx64, rt, s_value, rs, count3);
@@ -13122,7 +13126,7 @@ static char *SDPC_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("SDPC %s, %s", rt, s);
@@ -13145,9 +13149,9 @@ static char *SDXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -13169,9 +13173,9 @@ static char *SDX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SDX %s, %s(%s)", rd, rs, rt);
 }
@@ -13192,8 +13196,8 @@ static char *SEB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SEB %s, %s", rt, rs);
 }
@@ -13214,8 +13218,8 @@ static char *SEH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SEH %s, %s", rt, rs);
 }
@@ -13237,9 +13241,9 @@ static char *SEL_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("SEL.D %s, %s, %s", fd, fs, ft);
 }
@@ -13261,9 +13265,9 @@ static char *SEL_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("SEL.S %s, %s, %s", fd, fs, ft);
 }
@@ -13285,9 +13289,9 @@ static char *SELEQZ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("SELEQZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13309,9 +13313,9 @@ static char *SELEQZ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("SELEQZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13333,9 +13337,9 @@ static char *SELNEZ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("SELNEZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13357,9 +13361,9 @@ static char *SELNEZ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("SELNEZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13381,8 +13385,8 @@ static char *SEQI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SEQI %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
@@ -13404,8 +13408,8 @@ static char *SH_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("SH %s, 0x%" PRIx64 "(%s)", rtz3, u_value, rs3);
 }
@@ -13426,7 +13430,7 @@ static char *SH_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SH %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -13448,8 +13452,8 @@ static char *SH_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SH %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -13471,8 +13475,8 @@ static char *SH_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SH %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -13494,8 +13498,8 @@ static char *SHE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -13516,7 +13520,7 @@ static char *SHILO(uint64 instruction, Dis_info *info)
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(ac_value);
+    const char *ac = AC(ac_value, info);
 
     return img_format("SHILO %s, 0x%" PRIx64, ac, shift_value);
 }
@@ -13537,8 +13541,8 @@ static char *SHILOV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value, info);
+    const char *ac = AC(ac_value, info);
 
     return img_format("SHILOV %s, %s", ac, rs);
 }
@@ -13560,8 +13564,8 @@ static char *SHLL_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHLL.PH %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -13583,8 +13587,8 @@ static char *SHLL_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHLL.QB %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -13607,8 +13611,8 @@ static char *SHLL_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHLL_S.PH %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -13630,8 +13634,8 @@ static char *SHLL_S_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHLL_S.W %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -13654,9 +13658,9 @@ static char *SHLLV_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHLLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -13678,9 +13682,9 @@ static char *SHLLV_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHLLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -13703,9 +13707,9 @@ static char *SHLLV_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
 }
@@ -13727,9 +13731,9 @@ static char *SHLLV_S_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
 }
@@ -13751,8 +13755,8 @@ static char *SHRA_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRA.PH %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -13774,8 +13778,8 @@ static char *SHRA_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRA.QB %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -13797,8 +13801,8 @@ static char *SHRA_R_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRA_R.PH %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -13820,8 +13824,8 @@ static char *SHRA_R_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRA_R.QB %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -13843,8 +13847,8 @@ static char *SHRA_R_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRA_R.W %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -13866,9 +13870,9 @@ static char *SHRAV_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRAV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -13890,9 +13894,9 @@ static char *SHRAV_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRAV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -13914,9 +13918,9 @@ static char *SHRAV_R_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
 }
@@ -13938,9 +13942,9 @@ static char *SHRAV_R_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
 }
@@ -13962,9 +13966,9 @@ static char *SHRAV_R_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
 }
@@ -13986,8 +13990,8 @@ static char *SHRL_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRL.PH %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -14009,8 +14013,8 @@ static char *SHRL_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRL.QB %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
@@ -14033,9 +14037,9 @@ static char *SHRLV_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14057,9 +14061,9 @@ static char *SHRLV_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SHRLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14081,9 +14085,9 @@ static char *SHX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SHX %s, %s(%s)", rd, rs, rt);
 }
@@ -14105,9 +14109,9 @@ static char *SHXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -14148,8 +14152,8 @@ static char *SLL_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
     uint64 shift3 = encode_shift3_from_shift(shift3_value);
 
     return img_format("SLL %s, %s, 0x%" PRIx64, rt3, rs3, shift3);
@@ -14172,8 +14176,8 @@ static char *SLL_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SLL %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -14195,9 +14199,9 @@ static char *SLLV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SLLV %s, %s, %s", rd, rs, rt);
 }
@@ -14219,9 +14223,9 @@ static char *SLT(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SLT %s, %s, %s", rd, rs, rt);
 }
@@ -14243,8 +14247,8 @@ static char *SLTI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SLTI %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
@@ -14266,8 +14270,8 @@ static char *SLTIU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SLTIU %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
@@ -14289,9 +14293,9 @@ static char *SLTU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SLTU %s, %s, %s", rd, rs, rt);
 }
@@ -14313,9 +14317,9 @@ static char *SOV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SOV %s, %s, %s", rd, rs, rt);
 }
@@ -14355,8 +14359,8 @@ static char *SQRT_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("SQRT.D %s, %s", ft, fs);
 }
@@ -14377,8 +14381,8 @@ static char *SQRT_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("SQRT.S %s, %s", ft, fs);
 }
@@ -14400,8 +14404,8 @@ static char *SRA(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SRA %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -14423,9 +14427,9 @@ static char *SRAV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SRAV %s, %s, %s", rd, rs, rt);
 }
@@ -14447,8 +14451,8 @@ static char *SRL_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
     uint64 shift3 = encode_shift3_from_shift(shift3_value);
 
     return img_format("SRL %s, %s, 0x%" PRIx64, rt3, rs3, shift3);
@@ -14471,8 +14475,8 @@ static char *SRL_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SRL %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
@@ -14494,9 +14498,9 @@ static char *SRLV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SRLV %s, %s, %s", rd, rs, rt);
 }
@@ -14518,9 +14522,9 @@ static char *SUB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUB %s, %s, %s", rd, rs, rt);
 }
@@ -14542,9 +14546,9 @@ static char *SUB_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("SUB.D %s, %s, %s", fd, fs, ft);
 }
@@ -14566,9 +14570,9 @@ static char *SUB_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(fd_value);
-    const char *fs = FPR(fs_value);
-    const char *ft = FPR(ft_value);
+    const char *fd = FPR(fd_value, info);
+    const char *fs = FPR(fs_value, info);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("SUB.S %s, %s, %s", fd, fs, ft);
 }
@@ -14590,9 +14594,9 @@ static char *SUBQ_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14615,9 +14619,9 @@ static char *SUBQ_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14640,9 +14644,9 @@ static char *SUBQ_S_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -14665,9 +14669,9 @@ static char *SUBQH_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14690,9 +14694,9 @@ static char *SUBQH_R_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14715,9 +14719,9 @@ static char *SUBQH_R_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -14740,9 +14744,9 @@ static char *SUBQH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -14764,9 +14768,9 @@ static char *SUBU_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
 
     return img_format("SUBU %s, %s, %s", rd3, rs3, rt3);
 }
@@ -14788,9 +14792,9 @@ static char *SUBU_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBU %s, %s, %s", rd, rs, rt);
 }
@@ -14812,9 +14816,9 @@ static char *SUBU_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14836,9 +14840,9 @@ static char *SUBU_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -14861,9 +14865,9 @@ static char *SUBU_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14886,9 +14890,9 @@ static char *SUBU_S_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -14911,9 +14915,9 @@ static char *SUBUH_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -14936,9 +14940,9 @@ static char *SUBUH_R_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -14960,8 +14964,8 @@ static char *SW_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("SW %s, 0x%" PRIx64 "(%s)", rtz3, u_value, rs3);
 }
@@ -14983,8 +14987,8 @@ static char *SW_4X4_(uint64 instruction, Dis_info *info)
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value, info), info);
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value, info), info);
 
     return img_format("SW %s, 0x%" PRIx64 "(%s)", rtz4, u_value, rs4);
 }
@@ -15005,7 +15009,7 @@ static char *SW_GP16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
-    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value, info), info);
 
     return img_format("SW %s, 0x%" PRIx64 "($%d)", rtz3, u_value, 28);
 }
@@ -15026,7 +15030,7 @@ static char *SW_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SW %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
@@ -15048,8 +15052,8 @@ static char *SW_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SW %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -15070,7 +15074,7 @@ static char *SW_SP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SW %s, 0x%" PRIx64 "($%d)", rt, u_value, 29);
 }
@@ -15092,8 +15096,8 @@ static char *SW_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SW %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
@@ -15114,7 +15118,7 @@ static char *SWC1_GP_(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(ft_value);
+    const char *ft = FPR(ft_value, info);
 
     return img_format("SWC1 %s, 0x%" PRIx64 "($%d)", ft, u_value, 28);
 }
@@ -15136,8 +15140,8 @@ static char *SWC1_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SWC1 %s, %" PRId64 "(%s)", ft, s_value, rs);
 }
@@ -15159,8 +15163,8 @@ static char *SWC1_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SWC1 %s, 0x%" PRIx64 "(%s)", ft, u_value, rs);
 }
@@ -15182,9 +15186,9 @@ static char *SWC1X(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -15206,9 +15210,9 @@ static char *SWC1XS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *ft = FPR(ft_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -15230,7 +15234,7 @@ static char *SWC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SWC2 CP%" PRIu64 ", %" PRId64 "(%s)",
                       cs_value, s_value, rs);
@@ -15253,8 +15257,8 @@ static char *SWE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SWE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -15277,8 +15281,8 @@ static char *SWM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 count3 = encode_count3_from_count(count3_value);
 
     return img_format("SWM %s, %" PRId64 "(%s), 0x%" PRIx64,
@@ -15301,7 +15305,7 @@ static char *SWPC_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
     g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("SWPC %s, %s", rt, s);
@@ -15324,9 +15328,9 @@ static char *SWX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SWX %s, %s(%s)", rd, rs, rt);
 }
@@ -15348,9 +15352,9 @@ static char *SWXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("SWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -15390,7 +15394,7 @@ static char *SYNCI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SYNCI %" PRId64 "(%s)", s_value, rs);
 }
@@ -15411,7 +15415,7 @@ static char *SYNCIE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rs = GPR(rs_value);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("SYNCIE %" PRId64 "(%s)", s_value, rs);
 }
@@ -15468,8 +15472,8 @@ static char *TEQ(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("TEQ %s, %s", rs, rt);
 }
@@ -15706,8 +15710,8 @@ static char *TNE(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("TNE %s, %s", rs, rt);
 }
@@ -15728,8 +15732,8 @@ static char *TRUNC_L_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("TRUNC.L.D %s, %s", ft, fs);
 }
@@ -15750,8 +15754,8 @@ static char *TRUNC_L_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("TRUNC.L.S %s, %s", ft, fs);
 }
@@ -15772,8 +15776,8 @@ static char *TRUNC_W_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("TRUNC.W.D %s, %s", ft, fs);
 }
@@ -15794,8 +15798,8 @@ static char *TRUNC_W_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(ft_value);
-    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value, info);
+    const char *fs = FPR(fs_value, info);
 
     return img_format("TRUNC.W.S %s, %s", ft, fs);
 }
@@ -15818,8 +15822,8 @@ static char *UALDM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 count3 = encode_count3_from_count(count3_value);
 
     return img_format("UALDM %s, %" PRId64 "(%s), 0x%" PRIx64,
@@ -15843,8 +15847,8 @@ static char *UALH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("UALH %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -15867,8 +15871,8 @@ static char *UALWM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 count3 = encode_count3_from_count(count3_value);
 
     return img_format("UALWM %s, %" PRId64 "(%s), 0x%" PRIx64,
@@ -15893,8 +15897,8 @@ static char *UASDM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 count3 = encode_count3_from_count(count3_value);
 
     return img_format("UASDM %s, %" PRId64 "(%s), 0x%" PRIx64,
@@ -15918,8 +15922,8 @@ static char *UASH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("UASH %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
@@ -15942,8 +15946,8 @@ static char *UASWM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
     uint64 count3 = encode_count3_from_count(count3_value);
 
     return img_format("UASWM %s, %" PRId64 "(%s), 0x%" PRIx64,
@@ -16002,7 +16006,7 @@ static char *WRDSP(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    const char *rt = GPR(rt_value);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("WRDSP %s, 0x%" PRIx64, rt, mask_value);
 }
@@ -16023,8 +16027,8 @@ static char *WRPGPR(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("WRPGPR %s, %s", rt, rs);
 }
@@ -16045,8 +16049,8 @@ static char *XOR_16_(uint64 instruction, Dis_info *info)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
 
     return img_format("XOR %s, %s", rs3, rt3);
 }
@@ -16068,9 +16072,9 @@ static char *XOR_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(rd_value);
-    const char *rs = GPR(rs_value);
-    const char *rt = GPR(rt_value);
+    const char *rd = GPR(rd_value, info);
+    const char *rs = GPR(rs_value, info);
+    const char *rt = GPR(rt_value, info);
 
     return img_format("XOR %s, %s, %s", rd, rs, rt);
 }
@@ -16092,8 +16096,8 @@ static char *XORI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("XORI %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
@@ -16113,8 +16117,8 @@ static char *YIELD(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(rt_value);
-    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value, info);
+    const char *rs = GPR(rs_value, info);
 
     return img_format("YIELD %s, %s", rt, rs);
 }
@@ -21948,6 +21952,8 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
 
     Dis_info disassm_info;
     disassm_info.m_pc = memaddr;
+    disassm_info.fprintf_func = info->fprintf_func;
+    disassm_info.stream = info->stream;
 
     status = (*info->read_memory_func)(memaddr, buffer, 2, info);
     if (status != 0) {
-- 
2.37.3


