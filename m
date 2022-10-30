Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A286E612D73
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:34:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGr4-0000NS-Ud; Sun, 30 Oct 2022 18:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqR-0007ue-3b
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqL-0008Lu-Rq
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z14so13650869wrn.7
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WoSfy1sLbcW9mjgjjm8BGTuny1q7Pkf7lJRrtY28CiU=;
 b=PpR3ITgDBpSECFXSWo4enkKsNn82TBl5+OhIWfYN3NgE9XeRQu2yJWVGzdetRVP74a
 Btsa1MFnJq/JBc8As0TaEgYiCOXrnMuSMJUFhN9hgUAQn6wrRVieoQ9a2JHv3mv7Bc34
 wueHkw19GoG5s2IK1v9TTJTDM86L/jxAYK5L4+k5UD2X3QG+2R7+2ORj9bN0OxWuaJv4
 2nt8oDSEoV8uHcCina0UhsD1z8uP3euZzNf/jv1gb8c6obHsQedO1t56+0/zK8cmI2cE
 CUCHlOcdrCEcCUd3MMIEqVToHSoqjhwojxgYY1tcKEyxML2hJxxj6KbV1s4DLdLiuR02
 BFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WoSfy1sLbcW9mjgjjm8BGTuny1q7Pkf7lJRrtY28CiU=;
 b=epzt9iSCntYSfjghTBSrzFMfncJBEUkpDjPvqIA0/wYhlMVUFjFkvrZLMX/f6JzALy
 oqk3v1iNwicgosTvyKMk4hWmlPTFE1ANucfR/nJs0yAYac5sten6yAQxTA2pDya/KhJ2
 4/tTqc8pwNkYrdQsNSIWP+TzRu1NA+jJQz0IVrWsmibF5aWHz90lkIKCbK8YqtfAyp96
 iAxF/b2I4eq7r9nCyhHFDLwcVl1hWGzdBsaWZ1vFluYg4UgGbDgEBtlUoLB/fwoDmewB
 bz9EUXmgOVCmfezkTq4TVvjpB2R9MtIBIXZLHCF3j/dpuRzGd2E6ULcd9mOQO8/QmI61
 LySA==
X-Gm-Message-State: ACrzQf3a7CtCIlCk/rCbObl1tdFIvYr3d4k7bZkNkFl6mdVGwVCYYvr7
 4fw4hLHHOsblv5ZTSuhmiYkW5PDQ46tE8A==
X-Google-Smtp-Source: AMsMyM4zKyxO3tYdoReWGwn2oiAgCnJWbtjO0rLicZj91H9qUTJmTqPM9EnPSZC5+FOb7JSAyzaqhA==
X-Received: by 2002:a5d:644d:0:b0:236:8330:a5bf with SMTP id
 d13-20020a5d644d000000b002368330a5bfmr5814059wrw.125.1667169101748; 
 Sun, 30 Oct 2022 15:31:41 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a5d6e11000000b002356c051b9csm5141427wrz.66.2022.10.30.15.31.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:31:41 -0700 (PDT)
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
Subject: [PULL 27/55] disas/nanomips: Delete copy functions
Date: Sun, 30 Oct 2022 23:28:13 +0100
Message-Id: <20221030222841.42377-28-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Functions that have just one parameter and simply return it have been
deleted. Calls to these functions have been replaced with the argument
itself.

We're deleting following functions:
- both versions of copy()
- encode_s_from_address()
- encode_u_from_address()
- encode_lsb_from_pos_and_size()

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-14-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 3151 ++++++++++++++++++++++----------------------
 1 file changed, 1559 insertions(+), 1592 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 4b49630b8b..b90be5744e 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -499,18 +499,6 @@ static uint64 decode_gpr_gpr1(uint64 d)
 }
 
 
-static uint64 copy(uint64 d)
-{
-    return d;
-}
-
-
-static int64 copy(int64 d)
-{
-    return d;
-}
-
-
 static int64 neg_copy(uint64 d)
 {
     return 0ll - d;
@@ -531,20 +519,6 @@ static uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d)
 }
 
 
-/* nop - done by extraction function */
-static uint64 encode_s_from_address(uint64 d)
-{
-    return d;
-}
-
-
-/* nop - done by extraction function */
-static uint64 encode_u_from_address(uint64 d)
-{
-    return d;
-}
-
-
 static uint64 encode_count3_from_count(uint64 d)
 {
     IMGASSERTONCE(d < 8);
@@ -594,13 +568,6 @@ static uint64 encode_rt1_from_rt(uint64 d)
 }
 
 
-/* ? */
-static uint64 encode_lsb_from_pos_and_size(uint64 d)
-{
-    return d;
-}
-
-
 static std::string GPR(uint64 reg)
 {
     static const char *gpr_reg[32] = {
@@ -1710,8 +1677,8 @@ static std::string ABS_D(uint64 instruction, Dis_info *info)
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    std::string fs = FPR(fs_value);
+    std::string fd = FPR(fd_value);
 
     return img_format("ABS.D %s, %s", fd, fs);
 }
@@ -1732,8 +1699,8 @@ static std::string ABS_S(uint64 instruction, Dis_info *info)
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    std::string fs = FPR(fs_value);
+    std::string fd = FPR(fd_value);
 
     return img_format("ABS.S %s, %s", fd, fs);
 }
@@ -1754,8 +1721,8 @@ static std::string ABSQ_S_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("ABSQ_S.PH %s, %s", rt, rs);
 }
@@ -1776,8 +1743,8 @@ static std::string ABSQ_S_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("ABSQ_S.QB %s, %s", rt, rs);
 }
@@ -1798,8 +1765,8 @@ static std::string ABSQ_S_W(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("ABSQ_S.W %s, %s", rt, rs);
 }
@@ -1820,9 +1787,9 @@ static std::string ACLR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string bit = IMMEDIATE(bit_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("ACLR %s, %s(%s)", bit, s, rs);
 }
@@ -1843,9 +1810,9 @@ static std::string ADD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADD %s, %s, %s", rd, rs, rt);
 }
@@ -1868,9 +1835,9 @@ static std::string ADD_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
+    std::string fd = FPR(fd_value);
 
     return img_format("ADD.D %s, %s, %s", fd, fs, ft);
 }
@@ -1893,9 +1860,9 @@ static std::string ADD_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
+    std::string fd = FPR(fd_value);
 
     return img_format("ADD.S %s, %s, %s", fd, fs, ft);
 }
@@ -1916,9 +1883,9 @@ static std::string ADDIU_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_15_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -1938,8 +1905,8 @@ static std::string ADDIU_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -1959,8 +1926,8 @@ static std::string ADDIU_GP48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, s);
 }
@@ -1980,8 +1947,8 @@ static std::string ADDIU_GP_B_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -2001,8 +1968,8 @@ static std::string ADDIU_GP_W_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -2023,8 +1990,8 @@ static std::string ADDIU_NEG_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
     std::string u = IMMEDIATE(neg_copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
@@ -2046,7 +2013,7 @@ static std::string ADDIU_R1_SP_(uint64 instruction, Dis_info *info)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
 }
@@ -2069,7 +2036,7 @@ static std::string ADDIU_R2_(uint64 instruction, Dis_info *info)
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
 }
@@ -2088,8 +2055,8 @@ static std::string ADDIU_RS5_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -2110,8 +2077,8 @@ static std::string ADDIUPC_32_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2132,8 +2099,8 @@ static std::string ADDIUPC_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6, info);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 6, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2155,9 +2122,9 @@ static std::string ADDQ_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2180,9 +2147,9 @@ static std::string ADDQ_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2204,9 +2171,9 @@ static std::string ADDQ_S_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -2229,9 +2196,9 @@ static std::string ADDQH_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2254,9 +2221,9 @@ static std::string ADDQH_R_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2279,9 +2246,9 @@ static std::string ADDQH_R_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -2304,9 +2271,9 @@ static std::string ADDQH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -2328,9 +2295,9 @@ static std::string ADDSC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDSC %s, %s, %s", rd, rs, rt);
 }
@@ -2375,9 +2342,9 @@ static std::string ADDU_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDU %s, %s, %s", rd, rs, rt);
 }
@@ -2421,9 +2388,9 @@ static std::string ADDU_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2445,9 +2412,9 @@ static std::string ADDU_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2470,9 +2437,9 @@ static std::string ADDU_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2494,9 +2461,9 @@ static std::string ADDU_S_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2519,9 +2486,9 @@ static std::string ADDUH_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2544,9 +2511,9 @@ static std::string ADDUH_R_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2567,9 +2534,9 @@ static std::string ADDWC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ADDWC %s, %s, %s", rd, rs, rt);
 }
@@ -2590,8 +2557,8 @@ static std::string ALUIPC(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
@@ -2634,9 +2601,9 @@ static std::string AND_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("AND %s, %s, %s", rd, rs, rt);
 }
@@ -2681,9 +2648,9 @@ static std::string ANDI_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("ANDI %s, %s, %s", rt, rs, u);
 }
@@ -2705,9 +2672,9 @@ static std::string APPEND(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("APPEND %s, %s, %s", rt, rs, sa);
 }
@@ -2729,9 +2696,9 @@ static std::string ASET(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string bit = IMMEDIATE(bit_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("ASET %s, %s(%s)", bit, s, rs);
 }
@@ -2751,7 +2718,7 @@ static std::string BALC_16_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2, info);
+    std::string s = ADDRESS(s_value, 2, info);
 
     return img_format("BALC %s", s);
 }
@@ -2771,7 +2738,7 @@ static std::string BALC_32_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BALC %s", s);
 }
@@ -2792,8 +2759,8 @@ static std::string BALRSC(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("BALRSC %s, %s", rt, rs);
 }
@@ -2815,9 +2782,9 @@ static std::string BBEQZC(uint64 instruction, Dis_info *info)
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rt = GPR(rt_value);
+    std::string bit = IMMEDIATE(bit_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BBEQZC %s, %s, %s", rt, bit, s);
 }
@@ -2839,9 +2806,9 @@ static std::string BBNEZC(uint64 instruction, Dis_info *info)
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rt = GPR(rt_value);
+    std::string bit = IMMEDIATE(bit_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BBNEZC %s, %s, %s", rt, bit, s);
 }
@@ -2861,7 +2828,7 @@ static std::string BC_16_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2, info);
+    std::string s = ADDRESS(s_value, 2, info);
 
     return img_format("BC %s", s);
 }
@@ -2881,7 +2848,7 @@ static std::string BC_32_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BC %s", s);
 }
@@ -2902,8 +2869,8 @@ static std::string BC1EQZC(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string ft = FPR(ft_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BC1EQZC %s, %s", ft, s);
 }
@@ -2924,8 +2891,8 @@ static std::string BC1NEZC(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string ft = FPR(ft_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BC1NEZC %s, %s", ft, s);
 }
@@ -2946,8 +2913,8 @@ static std::string BC2EQZC(uint64 instruction, Dis_info *info)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string ct = CPR(ct_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BC2EQZC %s, %s", ct, s);
 }
@@ -2968,8 +2935,8 @@ static std::string BC2NEZC(uint64 instruction, Dis_info *info)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string ct = CPR(ct_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BC2NEZC %s, %s", ct, s);
 }
@@ -2993,7 +2960,7 @@ static std::string BEQC_16_(uint64 instruction, Dis_info *info)
 
     std::string rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2, info);
+    std::string u = ADDRESS(u_value, 2, info);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
@@ -3015,9 +2982,9 @@ static std::string BEQC_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
@@ -3039,9 +3006,9 @@ static std::string BEQIC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BEQIC %s, %s, %s", rt, u, s);
 }
@@ -3063,7 +3030,7 @@ static std::string BEQZC_16_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2, info);
+    std::string s = ADDRESS(s_value, 2, info);
 
     return img_format("BEQZC %s, %s", rt3, s);
 }
@@ -3085,9 +3052,9 @@ static std::string BGEC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
@@ -3109,9 +3076,9 @@ static std::string BGEIC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEIC %s, %s, %s", rt, u, s);
 }
@@ -3133,9 +3100,9 @@ static std::string BGEIUC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEIUC %s, %s, %s", rt, u, s);
 }
@@ -3157,9 +3124,9 @@ static std::string BGEUC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
@@ -3181,9 +3148,9 @@ static std::string BLTC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
@@ -3205,9 +3172,9 @@ static std::string BLTIC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTIC %s, %s, %s", rt, u, s);
 }
@@ -3229,9 +3196,9 @@ static std::string BLTIUC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTIUC %s, %s, %s", rt, u, s);
 }
@@ -3253,9 +3220,9 @@ static std::string BLTUC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
@@ -3279,7 +3246,7 @@ static std::string BNEC_16_(uint64 instruction, Dis_info *info)
 
     std::string rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2, info);
+    std::string u = ADDRESS(u_value, 2, info);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
@@ -3301,9 +3268,9 @@ static std::string BNEC_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
@@ -3325,9 +3292,9 @@ static std::string BNEIC(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BNEIC %s, %s, %s", rt, u, s);
 }
@@ -3349,7 +3316,7 @@ static std::string BNEZC_16_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2, info);
+    std::string s = ADDRESS(s_value, 2, info);
 
     return img_format("BNEZC %s, %s", rt3, s);
 }
@@ -3369,7 +3336,7 @@ static std::string BPOSGE32C(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("BPOSGE32C %s", s);
 }
@@ -3389,7 +3356,7 @@ static std::string BREAK_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    std::string code = IMMEDIATE(code_value);
 
     return img_format("BREAK %s", code);
 }
@@ -3409,7 +3376,7 @@ static std::string BREAK_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    std::string code = IMMEDIATE(code_value);
 
     return img_format("BREAK %s", code);
 }
@@ -3429,7 +3396,7 @@ static std::string BRSC(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
+    std::string rs = GPR(rs_value);
 
     return img_format("BRSC %s", rs);
 }
@@ -3451,9 +3418,9 @@ static std::string CACHE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string op = IMMEDIATE(op_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("CACHE %s, %s(%s)", op, s, rs);
 }
@@ -3475,9 +3442,9 @@ static std::string CACHEE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string op = IMMEDIATE(op_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("CACHEE %s, %s(%s)", op, s, rs);
 }
@@ -3498,8 +3465,8 @@ static std::string CEIL_L_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CEIL.L.D %s, %s", ft, fs);
 }
@@ -3520,8 +3487,8 @@ static std::string CEIL_L_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CEIL.L.S %s, %s", ft, fs);
 }
@@ -3542,8 +3509,8 @@ static std::string CEIL_W_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CEIL.W.D %s, %s", ft, fs);
 }
@@ -3564,8 +3531,8 @@ static std::string CEIL_W_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CEIL.W.S %s, %s", ft, fs);
 }
@@ -3586,8 +3553,8 @@ static std::string CFC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    std::string rt = GPR(rt_value);
+    std::string cs = CPR(cs_value);
 
     return img_format("CFC1 %s, %s", rt, cs);
 }
@@ -3608,8 +3575,8 @@ static std::string CFC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    std::string rt = GPR(rt_value);
+    std::string cs = CPR(cs_value);
 
     return img_format("CFC2 %s, %s", rt, cs);
 }
@@ -3630,8 +3597,8 @@ static std::string CLASS_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CLASS.D %s, %s", ft, fs);
 }
@@ -3652,8 +3619,8 @@ static std::string CLASS_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CLASS.S %s, %s", ft, fs);
 }
@@ -3674,8 +3641,8 @@ static std::string CLO(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("CLO %s, %s", rt, rs);
 }
@@ -3696,8 +3663,8 @@ static std::string CLZ(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("CLZ %s, %s", rt, rs);
 }
@@ -3719,9 +3686,9 @@ static std::string CMP_AF_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.AF.D %s, %s, %s", fd, fs, ft);
 }
@@ -3743,9 +3710,9 @@ static std::string CMP_AF_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.AF.S %s, %s, %s", fd, fs, ft);
 }
@@ -3767,9 +3734,9 @@ static std::string CMP_EQ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -3789,8 +3756,8 @@ static std::string CMP_EQ_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMP.EQ.PH %s, %s", rs, rt);
 }
@@ -3812,9 +3779,9 @@ static std::string CMP_EQ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -3836,9 +3803,9 @@ static std::string CMP_LE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.LE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3858,8 +3825,8 @@ static std::string CMP_LE_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMP.LE.PH %s, %s", rs, rt);
 }
@@ -3881,9 +3848,9 @@ static std::string CMP_LE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.LE.S %s, %s, %s", fd, fs, ft);
 }
@@ -3905,9 +3872,9 @@ static std::string CMP_LT_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.LT.D %s, %s, %s", fd, fs, ft);
 }
@@ -3927,8 +3894,8 @@ static std::string CMP_LT_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMP.LT.PH %s, %s", rs, rt);
 }
@@ -3950,9 +3917,9 @@ static std::string CMP_LT_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.LT.S %s, %s, %s", fd, fs, ft);
 }
@@ -3974,9 +3941,9 @@ static std::string CMP_NE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.NE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3998,9 +3965,9 @@ static std::string CMP_NE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.NE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4022,9 +3989,9 @@ static std::string CMP_OR_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.OR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4046,9 +4013,9 @@ static std::string CMP_OR_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.OR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4070,9 +4037,9 @@ static std::string CMP_SAF_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
 }
@@ -4094,9 +4061,9 @@ static std::string CMP_SAF_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
 }
@@ -4118,9 +4085,9 @@ static std::string CMP_SEQ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4142,9 +4109,9 @@ static std::string CMP_SEQ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4166,9 +4133,9 @@ static std::string CMP_SLE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4190,9 +4157,9 @@ static std::string CMP_SLE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4214,9 +4181,9 @@ static std::string CMP_SLT_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4238,9 +4205,9 @@ static std::string CMP_SLT_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4262,9 +4229,9 @@ static std::string CMP_SNE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4286,9 +4253,9 @@ static std::string CMP_SNE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4310,9 +4277,9 @@ static std::string CMP_SOR_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4334,9 +4301,9 @@ static std::string CMP_SOR_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4358,9 +4325,9 @@ static std::string CMP_SUEQ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4382,9 +4349,9 @@ static std::string CMP_SUEQ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4406,9 +4373,9 @@ static std::string CMP_SULE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4430,9 +4397,9 @@ static std::string CMP_SULE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4454,9 +4421,9 @@ static std::string CMP_SULT_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4478,9 +4445,9 @@ static std::string CMP_SULT_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4502,9 +4469,9 @@ static std::string CMP_SUN_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4526,9 +4493,9 @@ static std::string CMP_SUNE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4550,9 +4517,9 @@ static std::string CMP_SUNE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4574,9 +4541,9 @@ static std::string CMP_SUN_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4598,9 +4565,9 @@ static std::string CMP_UEQ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4622,9 +4589,9 @@ static std::string CMP_UEQ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4646,9 +4613,9 @@ static std::string CMP_ULE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4670,9 +4637,9 @@ static std::string CMP_ULE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4694,9 +4661,9 @@ static std::string CMP_ULT_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4718,9 +4685,9 @@ static std::string CMP_ULT_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4742,9 +4709,9 @@ static std::string CMP_UN_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.UN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4766,9 +4733,9 @@ static std::string CMP_UNE_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4790,9 +4757,9 @@ static std::string CMP_UNE_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4814,9 +4781,9 @@ static std::string CMP_UN_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("CMP.UN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4839,9 +4806,9 @@ static std::string CMPGDU_EQ_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4864,9 +4831,9 @@ static std::string CMPGDU_LE_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4889,9 +4856,9 @@ static std::string CMPGDU_LT_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4914,9 +4881,9 @@ static std::string CMPGU_EQ_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4939,9 +4906,9 @@ static std::string CMPGU_LE_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4964,9 +4931,9 @@ static std::string CMPGU_LT_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4987,8 +4954,8 @@ static std::string CMPU_EQ_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMPU.EQ.QB %s, %s", rs, rt);
 }
@@ -5009,8 +4976,8 @@ static std::string CMPU_LE_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMPU.LE.QB %s, %s", rs, rt);
 }
@@ -5031,8 +4998,8 @@ static std::string CMPU_LT_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("CMPU.LT.QB %s, %s", rs, rt);
 }
@@ -5052,7 +5019,7 @@ static std::string COP2_1(uint64 instruction, Dis_info *info)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
-    std::string cofun = IMMEDIATE(copy(cofun_value));
+    std::string cofun = IMMEDIATE(cofun_value);
 
     return img_format("COP2_1 %s", cofun);
 }
@@ -5073,8 +5040,8 @@ static std::string CTC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    std::string rt = GPR(rt_value);
+    std::string cs = CPR(cs_value);
 
     return img_format("CTC1 %s, %s", rt, cs);
 }
@@ -5095,8 +5062,8 @@ static std::string CTC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    std::string rt = GPR(rt_value);
+    std::string cs = CPR(cs_value);
 
     return img_format("CTC2 %s, %s", rt, cs);
 }
@@ -5117,8 +5084,8 @@ static std::string CVT_D_L(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.D.L %s, %s", ft, fs);
 }
@@ -5139,8 +5106,8 @@ static std::string CVT_D_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.D.S %s, %s", ft, fs);
 }
@@ -5161,8 +5128,8 @@ static std::string CVT_D_W(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.D.W %s, %s", ft, fs);
 }
@@ -5183,8 +5150,8 @@ static std::string CVT_L_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.L.D %s, %s", ft, fs);
 }
@@ -5205,8 +5172,8 @@ static std::string CVT_L_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.L.S %s, %s", ft, fs);
 }
@@ -5227,8 +5194,8 @@ static std::string CVT_S_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.S.D %s, %s", ft, fs);
 }
@@ -5249,8 +5216,8 @@ static std::string CVT_S_L(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.S.L %s, %s", ft, fs);
 }
@@ -5271,8 +5238,8 @@ static std::string CVT_S_PL(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.S.PL %s, %s", ft, fs);
 }
@@ -5293,8 +5260,8 @@ static std::string CVT_S_PU(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.S.PU %s, %s", ft, fs);
 }
@@ -5315,8 +5282,8 @@ static std::string CVT_S_W(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.S.W %s, %s", ft, fs);
 }
@@ -5337,8 +5304,8 @@ static std::string CVT_W_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.W.D %s, %s", ft, fs);
 }
@@ -5359,8 +5326,8 @@ static std::string CVT_W_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("CVT.W.S %s, %s", ft, fs);
 }
@@ -5381,8 +5348,8 @@ static std::string DADDIU_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
 
     return img_format("DADDIU %s, %s", rt, s);
 }
@@ -5404,8 +5371,8 @@ static std::string DADDIU_NEG_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
     std::string u = IMMEDIATE(neg_copy(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
@@ -5428,9 +5395,9 @@ static std::string DADDIU_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5452,9 +5419,9 @@ static std::string DADD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DADD %s, %s, %s", rd, rs, rt);
 }
@@ -5476,9 +5443,9 @@ static std::string DADDU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DADDU %s, %s, %s", rd, rs, rt);
 }
@@ -5499,8 +5466,8 @@ static std::string DCLO(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("DCLO %s, %s", rt, rs);
 }
@@ -5521,8 +5488,8 @@ static std::string DCLZ(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("DCLZ %s, %s", rt, rs);
 }
@@ -5544,9 +5511,9 @@ static std::string DDIV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DDIV %s, %s, %s", rd, rs, rt);
 }
@@ -5568,9 +5535,9 @@ static std::string DDIVU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DDIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5611,9 +5578,9 @@ static std::string DEXTM(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string lsb = IMMEDIATE(lsb_value);
     std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
@@ -5637,9 +5604,9 @@ static std::string DEXT(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string lsb = IMMEDIATE(lsb_value);
     std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
@@ -5663,9 +5630,9 @@ static std::string DEXTU(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string lsb = IMMEDIATE(lsb_value);
     std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
@@ -5689,10 +5656,10 @@ static std::string DINSM(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string pos = IMMEDIATE(lsb_value);
+    std::string size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
@@ -5717,10 +5684,10 @@ static std::string DINS(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string pos = IMMEDIATE(lsb_value);
+    std::string size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
@@ -5745,10 +5712,10 @@ static std::string DINSU(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string pos = IMMEDIATE(lsb_value);
+    std::string size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
@@ -5770,7 +5737,7 @@ static std::string DI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    std::string rt = GPR(rt_value);
 
     return img_format("DI %s", rt);
 }
@@ -5792,9 +5759,9 @@ static std::string DIV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DIV %s, %s, %s", rd, rs, rt);
 }
@@ -5816,9 +5783,9 @@ static std::string DIV_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("DIV.D %s, %s, %s", fd, fs, ft);
 }
@@ -5840,9 +5807,9 @@ static std::string DIV_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("DIV.S %s, %s, %s", fd, fs, ft);
 }
@@ -5864,9 +5831,9 @@ static std::string DIVU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5889,10 +5856,10 @@ static std::string DLSA(uint64 instruction, Dis_info *info)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string u2 = IMMEDIATE(copy(u2_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string u2 = IMMEDIATE(u2_value);
 
     return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -5913,8 +5880,8 @@ static std::string DLUI_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("DLUI %s, %s", rt, u);
 }
@@ -5936,9 +5903,9 @@ static std::string DMFC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -5959,8 +5926,8 @@ static std::string DMFC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string rt = GPR(rt_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("DMFC1 %s, %s", rt, fs);
 }
@@ -5981,8 +5948,8 @@ static std::string DMFC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    std::string rt = GPR(rt_value);
+    std::string cs = CPR(cs_value);
 
     return img_format("DMFC2 %s, %s", rt, cs);
 }
@@ -6004,9 +5971,9 @@ static std::string DMFGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6028,9 +5995,9 @@ static std::string DMOD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DMOD %s, %s, %s", rd, rs, rt);
 }
@@ -6052,9 +6019,9 @@ static std::string DMODU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DMODU %s, %s, %s", rd, rs, rt);
 }
@@ -6076,9 +6043,9 @@ static std::string DMTC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6099,8 +6066,8 @@ static std::string DMTC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string rt = GPR(rt_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("DMTC1 %s, %s", rt, fs);
 }
@@ -6121,8 +6088,8 @@ static std::string DMTC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    std::string rt = GPR(rt_value);
+    std::string cs = CPR(cs_value);
 
     return img_format("DMTC2 %s, %s", rt, cs);
 }
@@ -6144,9 +6111,9 @@ static std::string DMTGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6166,7 +6133,7 @@ static std::string DMT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    std::string rt = GPR(rt_value);
 
     return img_format("DMT %s", rt);
 }
@@ -6188,9 +6155,9 @@ static std::string DMUH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DMUH %s, %s, %s", rd, rs, rt);
 }
@@ -6212,9 +6179,9 @@ static std::string DMUHU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DMUHU %s, %s, %s", rd, rs, rt);
 }
@@ -6236,9 +6203,9 @@ static std::string DMUL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DMUL %s, %s, %s", rd, rs, rt);
 }
@@ -6260,9 +6227,9 @@ static std::string DMULU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DMULU %s, %s, %s", rd, rs, rt);
 }
@@ -6285,9 +6252,9 @@ static std::string DPA_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6309,9 +6276,9 @@ static std::string DPAQ_SA_L_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6333,9 +6300,9 @@ static std::string DPAQ_S_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6357,9 +6324,9 @@ static std::string DPAQX_SA_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6381,9 +6348,9 @@ static std::string DPAQX_S_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6405,9 +6372,9 @@ static std::string DPAU_H_QBL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6429,9 +6396,9 @@ static std::string DPAU_H_QBR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6453,9 +6420,9 @@ static std::string DPAX_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6477,9 +6444,9 @@ static std::string DPS_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPS.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6501,9 +6468,9 @@ static std::string DPSQ_SA_L_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6525,9 +6492,9 @@ static std::string DPSQ_S_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6549,9 +6516,9 @@ static std::string DPSQX_SA_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6573,9 +6540,9 @@ static std::string DPSQX_S_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6597,9 +6564,9 @@ static std::string DPSU_H_QBL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6621,9 +6588,9 @@ static std::string DPSU_H_QBR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6645,9 +6612,9 @@ static std::string DPSX_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6669,9 +6636,9 @@ static std::string DROTR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("DROTR %s, %s, %s", rt, rs, shift);
 }
@@ -6693,9 +6660,9 @@ static std::string DROTR32(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
 }
@@ -6717,9 +6684,9 @@ static std::string DROTRV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -6742,10 +6709,10 @@ static std::string DROTX(uint64 instruction, Dis_info *info)
     uint64 shiftx_value = extract_shiftx_11_10_9_8_7_6(instruction);
     uint64 shift_value = extract_shift_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string shiftx = IMMEDIATE(copy(shiftx_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
+    std::string shiftx = IMMEDIATE(shiftx_value);
 
     return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
 }
@@ -6767,9 +6734,9 @@ static std::string DSLL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("DSLL %s, %s, %s", rt, rs, shift);
 }
@@ -6791,9 +6758,9 @@ static std::string DSLL32(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6815,9 +6782,9 @@ static std::string DSLLV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DSLLV %s, %s, %s", rd, rs, rt);
 }
@@ -6839,9 +6806,9 @@ static std::string DSRA(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("DSRA %s, %s, %s", rt, rs, shift);
 }
@@ -6863,9 +6830,9 @@ static std::string DSRA32(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
 }
@@ -6887,9 +6854,9 @@ static std::string DSRAV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DSRAV %s, %s, %s", rd, rs, rt);
 }
@@ -6911,9 +6878,9 @@ static std::string DSRL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("DSRL %s, %s, %s", rt, rs, shift);
 }
@@ -6935,9 +6902,9 @@ static std::string DSRL32(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6959,9 +6926,9 @@ static std::string DSRLV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DSRLV %s, %s, %s", rd, rs, rt);
 }
@@ -6983,9 +6950,9 @@ static std::string DSUB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DSUB %s, %s, %s", rd, rs, rt);
 }
@@ -7007,9 +6974,9 @@ static std::string DSUBU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("DSUBU %s, %s, %s", rd, rs, rt);
 }
@@ -7029,7 +6996,7 @@ static std::string DVPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    std::string rt = GPR(rt_value);
 
     return img_format("DVPE %s", rt);
 }
@@ -7049,7 +7016,7 @@ static std::string DVP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    std::string rt = GPR(rt_value);
 
     return img_format("DVP %s", rt);
 }
@@ -7087,7 +7054,7 @@ static std::string EI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    std::string rt = GPR(rt_value);
 
     return img_format("EI %s", rt);
 }
@@ -7107,7 +7074,7 @@ static std::string EMT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    std::string rt = GPR(rt_value);
 
     return img_format("EMT %s", rt);
 }
@@ -7163,7 +7130,7 @@ static std::string EVP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    std::string rt = GPR(rt_value);
 
     return img_format("EVP %s", rt);
 }
@@ -7183,7 +7150,7 @@ static std::string EVPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    std::string rt = GPR(rt_value);
 
     return img_format("EVPE %s", rt);
 }
@@ -7206,9 +7173,9 @@ static std::string EXT(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string lsb = IMMEDIATE(lsb_value);
     std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
@@ -7232,10 +7199,10 @@ static std::string EXTD(uint64 instruction, Dis_info *info)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7258,10 +7225,10 @@ static std::string EXTD32(uint64 instruction, Dis_info *info)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7283,9 +7250,9 @@ static std::string EXTPDP(uint64 instruction, Dis_info *info)
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string size = IMMEDIATE(copy(size_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string size = IMMEDIATE(size_value);
 
     return img_format("EXTPDP %s, %s, %s", rt, ac, size);
 }
@@ -7307,9 +7274,9 @@ static std::string EXTPDPV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("EXTPDPV %s, %s, %s", rt, ac, rs);
 }
@@ -7331,9 +7298,9 @@ static std::string EXTP(uint64 instruction, Dis_info *info)
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string size = IMMEDIATE(copy(size_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string size = IMMEDIATE(size_value);
 
     return img_format("EXTP %s, %s, %s", rt, ac, size);
 }
@@ -7355,9 +7322,9 @@ static std::string EXTPV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("EXTPV %s, %s, %s", rt, ac, rs);
 }
@@ -7380,9 +7347,9 @@ static std::string EXTR_RS_W(uint64 instruction, Dis_info *info)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
 }
@@ -7405,9 +7372,9 @@ static std::string EXTR_R_W(uint64 instruction, Dis_info *info)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
 }
@@ -7430,9 +7397,9 @@ static std::string EXTR_S_H(uint64 instruction, Dis_info *info)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
 }
@@ -7455,9 +7422,9 @@ static std::string EXTR_W(uint64 instruction, Dis_info *info)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
 }
@@ -7480,9 +7447,9 @@ static std::string EXTRV_RS_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
 }
@@ -7505,9 +7472,9 @@ static std::string EXTRV_R_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
 }
@@ -7530,9 +7497,9 @@ static std::string EXTRV_S_H(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
 }
@@ -7555,9 +7522,9 @@ static std::string EXTRV_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("EXTRV.W %s, %s, %s", rt, ac, rs);
 }
@@ -7581,10 +7548,10 @@ static std::string EXTW(uint64 instruction, Dis_info *info)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7605,8 +7572,8 @@ static std::string FLOOR_L_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("FLOOR.L.D %s, %s", ft, fs);
 }
@@ -7627,8 +7594,8 @@ static std::string FLOOR_L_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("FLOOR.L.S %s, %s", ft, fs);
 }
@@ -7649,8 +7616,8 @@ static std::string FLOOR_W_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("FLOOR.W.D %s, %s", ft, fs);
 }
@@ -7671,8 +7638,8 @@ static std::string FLOOR_W_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("FLOOR.W.S %s, %s", ft, fs);
 }
@@ -7694,9 +7661,9 @@ static std::string FORK(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("FORK %s, %s, %s", rd, rs, rt);
 }
@@ -7716,7 +7683,7 @@ static std::string HYPCALL(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    std::string code = IMMEDIATE(code_value);
 
     return img_format("HYPCALL %s", code);
 }
@@ -7736,7 +7703,7 @@ static std::string HYPCALL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    std::string code = IMMEDIATE(code_value);
 
     return img_format("HYPCALL %s", code);
 }
@@ -7759,10 +7726,10 @@ static std::string INS(uint64 instruction, Dis_info *info)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string pos = IMMEDIATE(lsb_value);
+    std::string size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
@@ -7784,8 +7751,8 @@ static std::string INSV(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("INSV %s, %s", rt, rs);
 }
@@ -7823,7 +7790,7 @@ static std::string JALRC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    std::string rt = GPR(rt_value);
 
     return img_format("JALRC $%d, %s", 31, rt);
 }
@@ -7844,8 +7811,8 @@ static std::string JALRC_32_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("JALRC %s, %s", rt, rs);
 }
@@ -7866,8 +7833,8 @@ static std::string JALRC_HB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("JALRC.HB %s, %s", rt, rs);
 }
@@ -7887,7 +7854,7 @@ static std::string JRC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    std::string rt = GPR(rt_value);
 
     return img_format("JRC %s", rt);
 }
@@ -7910,7 +7877,7 @@ static std::string LB_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_1_0(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LB %s, %s(%s)", rt3, u, rs3);
@@ -7932,8 +7899,8 @@ static std::string LB_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LB %s, %s($%d)", rt, u, 28);
 }
@@ -7955,9 +7922,9 @@ static std::string LB_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LB %s, %s(%s)", rt, s, rs);
 }
@@ -7979,9 +7946,9 @@ static std::string LB_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LB %s, %s(%s)", rt, u, rs);
 }
@@ -8003,9 +7970,9 @@ static std::string LBE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LBE %s, %s(%s)", rt, s, rs);
 }
@@ -8028,7 +7995,7 @@ static std::string LBU_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_1_0(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LBU %s, %s(%s)", rt3, u, rs3);
@@ -8050,8 +8017,8 @@ static std::string LBU_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LBU %s, %s($%d)", rt, u, 28);
 }
@@ -8073,9 +8040,9 @@ static std::string LBU_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LBU %s, %s(%s)", rt, s, rs);
 }
@@ -8097,9 +8064,9 @@ static std::string LBU_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LBU %s, %s(%s)", rt, u, rs);
 }
@@ -8121,9 +8088,9 @@ static std::string LBUE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LBUE %s, %s(%s)", rt, s, rs);
 }
@@ -8145,9 +8112,9 @@ static std::string LBUX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LBUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8169,9 +8136,9 @@ static std::string LBX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LBX %s, %s(%s)", rd, rs, rt);
 }
@@ -8192,8 +8159,8 @@ static std::string LD_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LD %s, %s($%d)", rt, u, 28);
 }
@@ -8215,9 +8182,9 @@ static std::string LD_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LD %s, %s(%s)", rt, s, rs);
 }
@@ -8239,9 +8206,9 @@ static std::string LD_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LD %s, %s(%s)", rt, u, rs);
 }
@@ -8262,8 +8229,8 @@ static std::string LDC1_GP_(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string ft = FPR(ft_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -8285,9 +8252,9 @@ static std::string LDC1_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string ft = FPR(ft_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -8309,9 +8276,9 @@ static std::string LDC1_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string ft = FPR(ft_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -8333,9 +8300,9 @@ static std::string LDC1XS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ft = FPR(ft_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -8357,9 +8324,9 @@ static std::string LDC1X(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ft = FPR(ft_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -8381,9 +8348,9 @@ static std::string LDC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string ct = CPR(ct_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LDC2 %s, %s(%s)", ct, s, rs);
 }
@@ -8406,9 +8373,9 @@ static std::string LDM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
@@ -8430,8 +8397,8 @@ static std::string LDPC_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6, info);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 6, info);
 
     return img_format("LDPC %s, %s", rt, s);
 }
@@ -8453,9 +8420,9 @@ static std::string LDX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LDX %s, %s(%s)", rd, rs, rt);
 }
@@ -8477,9 +8444,9 @@ static std::string LDXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8502,7 +8469,7 @@ static std::string LH_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LH %s, %s(%s)", rt3, u, rs3);
@@ -8524,8 +8491,8 @@ static std::string LH_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LH %s, %s($%d)", rt, u, 28);
 }
@@ -8547,9 +8514,9 @@ static std::string LH_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LH %s, %s(%s)", rt, s, rs);
 }
@@ -8571,9 +8538,9 @@ static std::string LH_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LH %s, %s(%s)", rt, u, rs);
 }
@@ -8595,9 +8562,9 @@ static std::string LHE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LHE %s, %s(%s)", rt, s, rs);
 }
@@ -8620,7 +8587,7 @@ static std::string LHU_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LHU %s, %s(%s)", rt3, u, rs3);
@@ -8642,8 +8609,8 @@ static std::string LHU_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LHU %s, %s($%d)", rt, u, 28);
 }
@@ -8665,9 +8632,9 @@ static std::string LHU_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LHU %s, %s(%s)", rt, s, rs);
 }
@@ -8689,9 +8656,9 @@ static std::string LHU_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LHU %s, %s(%s)", rt, u, rs);
 }
@@ -8713,9 +8680,9 @@ static std::string LHUE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LHUE %s, %s(%s)", rt, s, rs);
 }
@@ -8737,9 +8704,9 @@ static std::string LHUX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LHUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8761,9 +8728,9 @@ static std::string LHUXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LHUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8785,9 +8752,9 @@ static std::string LHXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8809,9 +8776,9 @@ static std::string LHX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LHX %s, %s(%s)", rd, rs, rt);
 }
@@ -8854,8 +8821,8 @@ static std::string LI_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
 
     return img_format("LI %s, %s", rt, s);
 }
@@ -8877,9 +8844,9 @@ static std::string LL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LL %s, %s(%s)", rt, s, rs);
 }
@@ -8901,9 +8868,9 @@ static std::string LLD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LLD %s, %s(%s)", rt, s, rs);
 }
@@ -8925,9 +8892,9 @@ static std::string LLDP(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ru = GPR(ru_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LLDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8949,9 +8916,9 @@ static std::string LLE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LLE %s, %s(%s)", rt, s, rs);
 }
@@ -8973,9 +8940,9 @@ static std::string LLWP(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ru = GPR(ru_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LLWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8997,9 +8964,9 @@ static std::string LLWPE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ru = GPR(ru_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LLWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -9022,10 +8989,10 @@ static std::string LSA(uint64 instruction, Dis_info *info)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string u2 = IMMEDIATE(copy(u2_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
+    std::string u2 = IMMEDIATE(u2_value);
 
     return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -9046,8 +9013,8 @@ static std::string LUI(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
 
     return img_format("LUI %s, %%hi(%s)", rt, s);
 }
@@ -9070,7 +9037,7 @@ static std::string LW_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LW %s, %s(%s)", rt3, u, rs3);
@@ -9094,7 +9061,7 @@ static std::string LW_4X4_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_3_8__s2(instruction);
 
     std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("LW %s, %s(%s)", rt4, u, rs4);
@@ -9116,8 +9083,8 @@ static std::string LW_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LW %s, %s($%d)", rt, u, 28);
 }
@@ -9139,7 +9106,7 @@ static std::string LW_GP16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LW %s, %s($%d)", rt3, u, 28);
 }
@@ -9161,9 +9128,9 @@ static std::string LW_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LW %s, %s(%s)", rt, s, rs);
 }
@@ -9184,8 +9151,8 @@ static std::string LW_SP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LW %s, %s($%d)", rt, u, 29);
 }
@@ -9207,9 +9174,9 @@ static std::string LW_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LW %s, %s(%s)", rt, u, rs);
 }
@@ -9230,8 +9197,8 @@ static std::string LWC1_GP_(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string ft = FPR(ft_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -9253,9 +9220,9 @@ static std::string LWC1_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string ft = FPR(ft_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -9277,9 +9244,9 @@ static std::string LWC1_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string ft = FPR(ft_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -9301,9 +9268,9 @@ static std::string LWC1X(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ft = FPR(ft_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -9325,9 +9292,9 @@ static std::string LWC1XS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ft = FPR(ft_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -9349,9 +9316,9 @@ static std::string LWC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string ct = CPR(ct_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LWC2 %s, %s(%s)", ct, s, rs);
 }
@@ -9373,9 +9340,9 @@ static std::string LWE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LWE %s, %s(%s)", rt, s, rs);
 }
@@ -9398,9 +9365,9 @@ static std::string LWM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
@@ -9422,8 +9389,8 @@ static std::string LWPC_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6, info);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 6, info);
 
     return img_format("LWPC %s, %s", rt, s);
 }
@@ -9444,8 +9411,8 @@ static std::string LWU_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("LWU %s, %s($%d)", rt, u, 28);
 }
@@ -9467,9 +9434,9 @@ static std::string LWU_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LWU %s, %s(%s)", rt, s, rs);
 }
@@ -9491,9 +9458,9 @@ static std::string LWU_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("LWU %s, %s(%s)", rt, u, rs);
 }
@@ -9515,9 +9482,9 @@ static std::string LWUX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LWUX %s, %s(%s)", rd, rs, rt);
 }
@@ -9539,9 +9506,9 @@ static std::string LWUXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LWUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9563,9 +9530,9 @@ static std::string LWX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LWX %s, %s(%s)", rd, rs, rt);
 }
@@ -9611,9 +9578,9 @@ static std::string LWXS_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("LWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9636,9 +9603,9 @@ static std::string MADD_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MADD %s, %s, %s", ac, rs, rt);
 }
@@ -9660,9 +9627,9 @@ static std::string MADDF_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MADDF.D %s, %s, %s", fd, fs, ft);
 }
@@ -9684,9 +9651,9 @@ static std::string MADDF_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MADDF.S %s, %s, %s", fd, fs, ft);
 }
@@ -9709,9 +9676,9 @@ static std::string MADDU_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MADDU %s, %s, %s", ac, rs, rt);
 }
@@ -9734,9 +9701,9 @@ static std::string MAQ_S_W_PHL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9759,9 +9726,9 @@ static std::string MAQ_S_W_PHR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9784,9 +9751,9 @@ static std::string MAQ_SA_W_PHL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9809,9 +9776,9 @@ static std::string MAQ_SA_W_PHR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9833,9 +9800,9 @@ static std::string MAX_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MAX.D %s, %s, %s", fd, fs, ft);
 }
@@ -9857,9 +9824,9 @@ static std::string MAX_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MAX.S %s, %s, %s", fd, fs, ft);
 }
@@ -9881,9 +9848,9 @@ static std::string MAXA_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MAXA.D %s, %s, %s", fd, fs, ft);
 }
@@ -9905,9 +9872,9 @@ static std::string MAXA_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MAXA.S %s, %s, %s", fd, fs, ft);
 }
@@ -9929,9 +9896,9 @@ static std::string MFC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9952,8 +9919,8 @@ static std::string MFC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string rt = GPR(rt_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("MFC1 %s, %s", rt, fs);
 }
@@ -9974,8 +9941,8 @@ static std::string MFC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    std::string rt = GPR(rt_value);
+    std::string cs = CPR(cs_value);
 
     return img_format("MFC2 %s, %s", rt, cs);
 }
@@ -9997,9 +9964,9 @@ static std::string MFGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10021,9 +9988,9 @@ static std::string MFHC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10044,8 +10011,8 @@ static std::string MFHC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string rt = GPR(rt_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("MFHC1 %s, %s", rt, fs);
 }
@@ -10066,8 +10033,8 @@ static std::string MFHC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    std::string rt = GPR(rt_value);
+    std::string cs = CPR(cs_value);
 
     return img_format("MFHC2 %s, %s", rt, cs);
 }
@@ -10089,9 +10056,9 @@ static std::string MFHGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10111,8 +10078,8 @@ static std::string MFHI_DSP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
 
     return img_format("MFHI %s, %s", rt, ac);
 }
@@ -10135,10 +10102,10 @@ static std::string MFHTR(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = IMMEDIATE(c0s_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10158,8 +10125,8 @@ static std::string MFLO_DSP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
+    std::string rt = GPR(rt_value);
+    std::string ac = AC(ac_value);
 
     return img_format("MFLO %s, %s", rt, ac);
 }
@@ -10182,10 +10149,10 @@ static std::string MFTR(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = IMMEDIATE(c0s_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10207,9 +10174,9 @@ static std::string MIN_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MIN.D %s, %s, %s", fd, fs, ft);
 }
@@ -10231,9 +10198,9 @@ static std::string MIN_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MIN.S %s, %s, %s", fd, fs, ft);
 }
@@ -10255,9 +10222,9 @@ static std::string MINA_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MINA.D %s, %s, %s", fd, fs, ft);
 }
@@ -10279,9 +10246,9 @@ static std::string MINA_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MINA.S %s, %s, %s", fd, fs, ft);
 }
@@ -10303,9 +10270,9 @@ static std::string MOD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MOD %s, %s, %s", rd, rs, rt);
 }
@@ -10327,9 +10294,9 @@ static std::string MODSUB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MODSUB %s, %s, %s", rd, rs, rt);
 }
@@ -10351,9 +10318,9 @@ static std::string MODU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MODU %s, %s, %s", rd, rs, rt);
 }
@@ -10374,8 +10341,8 @@ static std::string MOV_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("MOV.D %s, %s", ft, fs);
 }
@@ -10396,8 +10363,8 @@ static std::string MOV_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("MOV.S %s, %s", ft, fs);
 }
@@ -10421,7 +10388,7 @@ static std::string MOVE_BALC(uint64 instruction, Dis_info *info)
 
     std::string rd1 = GPR(decode_gpr_gpr1(rd1_value));
     std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
+    std::string s = ADDRESS(s_value, 4, info);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
@@ -10496,8 +10463,8 @@ static std::string MOVE(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("MOVE %s, %s", rt, rs);
 }
@@ -10519,9 +10486,9 @@ static std::string MOVN(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MOVN %s, %s, %s", rd, rs, rt);
 }
@@ -10543,9 +10510,9 @@ static std::string MOVZ(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MOVZ %s, %s, %s", rd, rs, rt);
 }
@@ -10567,9 +10534,9 @@ static std::string MSUB_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MSUB %s, %s, %s", ac, rs, rt);
 }
@@ -10591,9 +10558,9 @@ static std::string MSUBF_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MSUBF.D %s, %s, %s", fd, fs, ft);
 }
@@ -10615,9 +10582,9 @@ static std::string MSUBF_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MSUBF.S %s, %s, %s", fd, fs, ft);
 }
@@ -10639,9 +10606,9 @@ static std::string MSUBU_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MSUBU %s, %s, %s", ac, rs, rt);
 }
@@ -10663,9 +10630,9 @@ static std::string MTC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10686,8 +10653,8 @@ static std::string MTC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string rt = GPR(rt_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("MTC1 %s, %s", rt, fs);
 }
@@ -10708,8 +10675,8 @@ static std::string MTC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    std::string rt = GPR(rt_value);
+    std::string cs = CPR(cs_value);
 
     return img_format("MTC2 %s, %s", rt, cs);
 }
@@ -10731,9 +10698,9 @@ static std::string MTGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10755,9 +10722,9 @@ static std::string MTHC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10778,8 +10745,8 @@ static std::string MTHC1(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string rt = GPR(rt_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("MTHC1 %s, %s", rt, fs);
 }
@@ -10800,8 +10767,8 @@ static std::string MTHC2(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    std::string rt = GPR(rt_value);
+    std::string cs = CPR(cs_value);
 
     return img_format("MTHC2 %s, %s", rt, cs);
 }
@@ -10823,9 +10790,9 @@ static std::string MTHGC0(uint64 instruction, Dis_info *info)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = CPR(c0s_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10845,8 +10812,8 @@ static std::string MTHI_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    std::string rs = GPR(rs_value);
+    std::string ac = AC(ac_value);
 
     return img_format("MTHI %s, %s", rs, ac);
 }
@@ -10866,8 +10833,8 @@ static std::string MTHLIP(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    std::string rs = GPR(rs_value);
+    std::string ac = AC(ac_value);
 
     return img_format("MTHLIP %s, %s", rs, ac);
 }
@@ -10890,10 +10857,10 @@ static std::string MTHTR(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = IMMEDIATE(c0s_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10913,8 +10880,8 @@ static std::string MTLO_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    std::string rs = GPR(rs_value);
+    std::string ac = AC(ac_value);
 
     return img_format("MTLO %s, %s", rs, ac);
 }
@@ -10937,10 +10904,10 @@ static std::string MTTR(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string c0s = IMMEDIATE(c0s_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10962,9 +10929,9 @@ static std::string MUH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MUH %s, %s, %s", rd, rs, rt);
 }
@@ -10986,9 +10953,9 @@ static std::string MUHU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MUHU %s, %s, %s", rd, rs, rt);
 }
@@ -11010,9 +10977,9 @@ static std::string MUL_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MUL %s, %s, %s", rd, rs, rt);
 }
@@ -11056,9 +11023,9 @@ static std::string MUL_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MUL.D %s, %s, %s", fd, fs, ft);
 }
@@ -11081,9 +11048,9 @@ static std::string MUL_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MUL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11106,9 +11073,9 @@ static std::string MUL_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MUL_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11130,9 +11097,9 @@ static std::string MUL_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("MUL.S %s, %s, %s", fd, fs, ft);
 }
@@ -11155,9 +11122,9 @@ static std::string MULEQ_S_W_PHL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
 }
@@ -11180,9 +11147,9 @@ static std::string MULEQ_S_W_PHR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
 }
@@ -11205,9 +11172,9 @@ static std::string MULEU_S_PH_QBL(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
 }
@@ -11230,9 +11197,9 @@ static std::string MULEU_S_PH_QBR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
 }
@@ -11255,9 +11222,9 @@ static std::string MULQ_RS_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11280,9 +11247,9 @@ static std::string MULQ_RS_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
 }
@@ -11305,9 +11272,9 @@ static std::string MULQ_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11330,9 +11297,9 @@ static std::string MULQ_S_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -11355,9 +11322,9 @@ static std::string MULSA_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11380,9 +11347,9 @@ static std::string MULSAQ_S_W_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11404,9 +11371,9 @@ static std::string MULT_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULT %s, %s, %s", ac, rs, rt);
 }
@@ -11428,9 +11395,9 @@ static std::string MULTU_DSP_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ac = AC(ac_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULTU %s, %s, %s", ac, rs, rt);
 }
@@ -11452,9 +11419,9 @@ static std::string MULU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("MULU %s, %s, %s", rd, rs, rt);
 }
@@ -11475,8 +11442,8 @@ static std::string NEG_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("NEG.D %s, %s", ft, fs);
 }
@@ -11497,8 +11464,8 @@ static std::string NEG_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("NEG.S %s, %s", ft, fs);
 }
@@ -11556,9 +11523,9 @@ static std::string NOR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("NOR %s, %s, %s", rd, rs, rt);
 }
@@ -11624,9 +11591,9 @@ static std::string OR_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("OR %s, %s, %s", rd, rs, rt);
 }
@@ -11648,9 +11615,9 @@ static std::string ORI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("ORI %s, %s, %s", rt, rs, u);
 }
@@ -11673,9 +11640,9 @@ static std::string PACKRL_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("PACKRL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11716,9 +11683,9 @@ static std::string PICK_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("PICK.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11741,9 +11708,9 @@ static std::string PICK_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("PICK.QB %s, %s, %s", rd, rs, rt);
 }
@@ -11765,8 +11732,8 @@ static std::string PRECEQ_W_PHL(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PRECEQ.W.PHL %s, %s", rt, rs);
 }
@@ -11788,8 +11755,8 @@ static std::string PRECEQ_W_PHR(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PRECEQ.W.PHR %s, %s", rt, rs);
 }
@@ -11811,8 +11778,8 @@ static std::string PRECEQU_PH_QBLA(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PRECEQU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11834,8 +11801,8 @@ static std::string PRECEQU_PH_QBL(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PRECEQU.PH.QBL %s, %s", rt, rs);
 }
@@ -11857,8 +11824,8 @@ static std::string PRECEQU_PH_QBRA(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PRECEQU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11880,8 +11847,8 @@ static std::string PRECEQU_PH_QBR(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PRECEQU.PH.QBR %s, %s", rt, rs);
 }
@@ -11904,8 +11871,8 @@ static std::string PRECEU_PH_QBLA(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PRECEU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11927,8 +11894,8 @@ static std::string PRECEU_PH_QBL(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PRECEU.PH.QBL %s, %s", rt, rs);
 }
@@ -11951,8 +11918,8 @@ static std::string PRECEU_PH_QBRA(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PRECEU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11974,8 +11941,8 @@ static std::string PRECEU_PH_QBR(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PRECEU.PH.QBR %s, %s", rt, rs);
 }
@@ -11998,9 +11965,9 @@ static std::string PRECR_QB_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12023,9 +11990,9 @@ static std::string PRECR_SRA_PH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -12048,9 +12015,9 @@ static std::string PRECR_SRA_R_PH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -12073,9 +12040,9 @@ static std::string PRECRQ_PH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12098,9 +12065,9 @@ static std::string PRECRQ_QB_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12123,9 +12090,9 @@ static std::string PRECRQ_RS_PH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12148,9 +12115,9 @@ static std::string PRECRQU_S_QB_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12172,9 +12139,9 @@ static std::string PREF_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string hint = IMMEDIATE(hint_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PREF %s, %s(%s)", hint, s, rs);
 }
@@ -12196,9 +12163,9 @@ static std::string PREF_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string hint = IMMEDIATE(hint_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PREF %s, %s(%s)", hint, u, rs);
 }
@@ -12220,9 +12187,9 @@ static std::string PREFE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string hint = IMMEDIATE(hint_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("PREFE %s, %s(%s)", hint, s, rs);
 }
@@ -12244,9 +12211,9 @@ static std::string PREPEND(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("PREPEND %s, %s, %s", rt, rs, sa);
 }
@@ -12266,8 +12233,8 @@ static std::string RADDU_W_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("RADDU.W.QB %s, %s", rt, rs);
 }
@@ -12287,8 +12254,8 @@ static std::string RDDSP(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string mask = IMMEDIATE(copy(mask_value));
+    std::string rt = GPR(rt_value);
+    std::string mask = IMMEDIATE(mask_value);
 
     return img_format("RDDSP %s, %s", rt, mask);
 }
@@ -12310,9 +12277,9 @@ static std::string RDHWR(uint64 instruction, Dis_info *info)
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string hs = CPR(copy(hs_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    std::string rt = GPR(rt_value);
+    std::string hs = CPR(hs_value);
+    std::string sel = IMMEDIATE(sel_value);
 
     return img_format("RDHWR %s, %s, %s", rt, hs, sel);
 }
@@ -12333,8 +12300,8 @@ static std::string RDPGPR(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("RDPGPR %s, %s", rt, rs);
 }
@@ -12355,8 +12322,8 @@ static std::string RECIP_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("RECIP.D %s, %s", ft, fs);
 }
@@ -12377,8 +12344,8 @@ static std::string RECIP_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("RECIP.S %s, %s", ft, fs);
 }
@@ -12399,8 +12366,8 @@ static std::string REPL_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
 
     return img_format("REPL.PH %s, %s", rt, s);
 }
@@ -12421,8 +12388,8 @@ static std::string REPL_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("REPL.QB %s, %s", rt, u);
 }
@@ -12443,8 +12410,8 @@ static std::string REPLV_PH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("REPLV.PH %s, %s", rt, rs);
 }
@@ -12464,8 +12431,8 @@ static std::string REPLV_QB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("REPLV.QB %s, %s", rt, rs);
 }
@@ -12488,7 +12455,7 @@ static std::string RESTORE_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     return img_format("RESTORE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12510,7 +12477,7 @@ static std::string RESTORE_JRC_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     return img_format("RESTORE.JRC %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
@@ -12533,7 +12500,7 @@ static std::string RESTORE_JRC_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     return img_format("RESTORE.JRC %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12554,8 +12521,8 @@ static std::string RESTOREF(uint64 instruction, Dis_info *info)
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string count = IMMEDIATE(copy(count_value));
+    std::string u = IMMEDIATE(u_value);
+    std::string count = IMMEDIATE(count_value);
 
     return img_format("RESTOREF %s, %s", u, count);
 }
@@ -12576,8 +12543,8 @@ static std::string RINT_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("RINT.D %s, %s", ft, fs);
 }
@@ -12598,8 +12565,8 @@ static std::string RINT_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("RINT.S %s, %s", ft, fs);
 }
@@ -12621,9 +12588,9 @@ static std::string ROTR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("ROTR %s, %s, %s", rt, rs, shift);
 }
@@ -12645,9 +12612,9 @@ static std::string ROTRV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("ROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -12671,11 +12638,11 @@ static std::string ROTX(uint64 instruction, Dis_info *info)
     uint64 stripe_value = extract_stripe_6(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string shiftx = IMMEDIATE(copy(shiftx_value));
-    std::string stripe = IMMEDIATE(copy(stripe_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
+    std::string shiftx = IMMEDIATE(shiftx_value);
+    std::string stripe = IMMEDIATE(stripe_value);
 
     return img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
@@ -12697,8 +12664,8 @@ static std::string ROUND_L_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("ROUND.L.D %s, %s", ft, fs);
 }
@@ -12719,8 +12686,8 @@ static std::string ROUND_L_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("ROUND.L.S %s, %s", ft, fs);
 }
@@ -12741,8 +12708,8 @@ static std::string ROUND_W_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("ROUND.W.D %s, %s", ft, fs);
 }
@@ -12763,8 +12730,8 @@ static std::string ROUND_W_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("ROUND.W.S %s, %s", ft, fs);
 }
@@ -12785,8 +12752,8 @@ static std::string RSQRT_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("RSQRT.D %s, %s", ft, fs);
 }
@@ -12807,8 +12774,8 @@ static std::string RSQRT_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("RSQRT.S %s, %s", ft, fs);
 }
@@ -12830,7 +12797,7 @@ static std::string SAVE_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     return img_format("SAVE %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
@@ -12853,7 +12820,7 @@ static std::string SAVE_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     return img_format("SAVE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12874,8 +12841,8 @@ static std::string SAVEF(uint64 instruction, Dis_info *info)
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string count = IMMEDIATE(copy(count_value));
+    std::string u = IMMEDIATE(u_value);
+    std::string count = IMMEDIATE(count_value);
 
     return img_format("SAVEF %s, %s", u, count);
 }
@@ -12898,7 +12865,7 @@ static std::string SB_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_1_0(instruction);
 
     std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SB %s, %s(%s)", rtz3, u, rs3);
@@ -12920,8 +12887,8 @@ static std::string SB_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SB %s, %s($%d)", rt, u, 28);
 }
@@ -12943,9 +12910,9 @@ static std::string SB_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SB %s, %s(%s)", rt, s, rs);
 }
@@ -12967,9 +12934,9 @@ static std::string SB_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SB %s, %s(%s)", rt, u, rs);
 }
@@ -12991,9 +12958,9 @@ static std::string SBE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SBE %s, %s(%s)", rt, s, rs);
 }
@@ -13015,9 +12982,9 @@ static std::string SBX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SBX %s, %s(%s)", rd, rs, rt);
 }
@@ -13039,9 +13006,9 @@ static std::string SC(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SC %s, %s(%s)", rt, s, rs);
 }
@@ -13063,9 +13030,9 @@ static std::string SCD(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SCD %s, %s(%s)", rt, s, rs);
 }
@@ -13087,9 +13054,9 @@ static std::string SCDP(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ru = GPR(ru_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SCDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13111,9 +13078,9 @@ static std::string SCE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SCE %s, %s(%s)", rt, s, rs);
 }
@@ -13135,9 +13102,9 @@ static std::string SCWP(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ru = GPR(ru_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SCWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13159,9 +13126,9 @@ static std::string SCWPE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string ru = GPR(ru_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SCWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -13182,8 +13149,8 @@ static std::string SD_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SD %s, %s($%d)", rt, u, 28);
 }
@@ -13205,9 +13172,9 @@ static std::string SD_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SD %s, %s(%s)", rt, s, rs);
 }
@@ -13229,9 +13196,9 @@ static std::string SD_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SD %s, %s(%s)", rt, u, rs);
 }
@@ -13251,7 +13218,7 @@ static std::string SDBBP_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    std::string code = IMMEDIATE(code_value);
 
     return img_format("SDBBP %s", code);
 }
@@ -13271,7 +13238,7 @@ static std::string SDBBP_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    std::string code = IMMEDIATE(code_value);
 
     return img_format("SDBBP %s", code);
 }
@@ -13292,8 +13259,8 @@ static std::string SDC1_GP_(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string ft = FPR(ft_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -13315,9 +13282,9 @@ static std::string SDC1_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string ft = FPR(ft_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -13339,9 +13306,9 @@ static std::string SDC1_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string ft = FPR(ft_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -13363,9 +13330,9 @@ static std::string SDC1X(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ft = FPR(ft_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -13387,9 +13354,9 @@ static std::string SDC1XS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ft = FPR(ft_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -13411,9 +13378,9 @@ static std::string SDC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string cs = CPR(copy(cs_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string cs = CPR(cs_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SDC2 %s, %s(%s)", cs, s, rs);
 }
@@ -13436,9 +13403,9 @@ static std::string SDM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
@@ -13460,8 +13427,8 @@ static std::string SDPC_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6, info);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 6, info);
 
     return img_format("SDPC %s, %s", rt, s);
 }
@@ -13483,9 +13450,9 @@ static std::string SDXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -13507,9 +13474,9 @@ static std::string SDX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SDX %s, %s(%s)", rd, rs, rt);
 }
@@ -13530,8 +13497,8 @@ static std::string SEB(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SEB %s, %s", rt, rs);
 }
@@ -13552,8 +13519,8 @@ static std::string SEH(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SEH %s, %s", rt, rs);
 }
@@ -13575,9 +13542,9 @@ static std::string SEL_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("SEL.D %s, %s, %s", fd, fs, ft);
 }
@@ -13599,9 +13566,9 @@ static std::string SEL_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("SEL.S %s, %s, %s", fd, fs, ft);
 }
@@ -13623,9 +13590,9 @@ static std::string SELEQZ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("SELEQZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13647,9 +13614,9 @@ static std::string SELEQZ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("SELEQZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13671,9 +13638,9 @@ static std::string SELNEZ_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("SELNEZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13695,9 +13662,9 @@ static std::string SELNEZ_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("SELNEZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13719,9 +13686,9 @@ static std::string SEQI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SEQI %s, %s, %s", rt, rs, u);
 }
@@ -13744,7 +13711,7 @@ static std::string SH_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SH %s, %s(%s)", rtz3, u, rs3);
@@ -13766,8 +13733,8 @@ static std::string SH_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SH %s, %s($%d)", rt, u, 28);
 }
@@ -13789,9 +13756,9 @@ static std::string SH_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SH %s, %s(%s)", rt, s, rs);
 }
@@ -13813,9 +13780,9 @@ static std::string SH_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SH %s, %s(%s)", rt, u, rs);
 }
@@ -13837,9 +13804,9 @@ static std::string SHE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHE %s, %s(%s)", rt, s, rs);
 }
@@ -13860,8 +13827,8 @@ static std::string SHILO(uint64 instruction, Dis_info *info)
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string ac = AC(copy(ac_value));
+    std::string shift = IMMEDIATE(shift_value);
+    std::string ac = AC(ac_value);
 
     return img_format("SHILO %s, %s", ac, shift);
 }
@@ -13882,8 +13849,8 @@ static std::string SHILOV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    std::string rs = GPR(rs_value);
+    std::string ac = AC(ac_value);
 
     return img_format("SHILOV %s, %s", ac, rs);
 }
@@ -13905,9 +13872,9 @@ static std::string SHLL_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13929,9 +13896,9 @@ static std::string SHLL_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -13954,9 +13921,9 @@ static std::string SHLL_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13978,9 +13945,9 @@ static std::string SHLL_S_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
 }
@@ -14003,9 +13970,9 @@ static std::string SHLLV_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHLLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14027,9 +13994,9 @@ static std::string SHLLV_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHLLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14052,9 +14019,9 @@ static std::string SHLLV_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14076,9 +14043,9 @@ static std::string SHLLV_S_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
 }
@@ -14100,9 +14067,9 @@ static std::string SHRA_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14124,9 +14091,9 @@ static std::string SHRA_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14148,9 +14115,9 @@ static std::string SHRA_R_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14172,9 +14139,9 @@ static std::string SHRA_R_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14196,9 +14163,9 @@ static std::string SHRA_R_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
 }
@@ -14220,9 +14187,9 @@ static std::string SHRAV_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHRAV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14244,9 +14211,9 @@ static std::string SHRAV_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHRAV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14268,9 +14235,9 @@ static std::string SHRAV_R_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14292,9 +14259,9 @@ static std::string SHRAV_R_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14316,9 +14283,9 @@ static std::string SHRAV_R_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
 }
@@ -14340,9 +14307,9 @@ static std::string SHRL_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14364,9 +14331,9 @@ static std::string SHRL_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string sa = IMMEDIATE(sa_value);
 
     return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14389,9 +14356,9 @@ static std::string SHRLV_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHRLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14413,9 +14380,9 @@ static std::string SHRLV_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rd = GPR(rd_value);
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SHRLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14437,9 +14404,9 @@ static std::string SHX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SHX %s, %s(%s)", rd, rs, rt);
 }
@@ -14461,9 +14428,9 @@ static std::string SHXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -14483,7 +14450,7 @@ static std::string SIGRIE(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    std::string code = IMMEDIATE(code_value);
 
     return img_format("SIGRIE %s", code);
 }
@@ -14529,9 +14496,9 @@ static std::string SLL_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("SLL %s, %s, %s", rt, rs, shift);
 }
@@ -14553,9 +14520,9 @@ static std::string SLLV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SLLV %s, %s, %s", rd, rs, rt);
 }
@@ -14577,9 +14544,9 @@ static std::string SLT(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SLT %s, %s, %s", rd, rs, rt);
 }
@@ -14601,9 +14568,9 @@ static std::string SLTI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SLTI %s, %s, %s", rt, rs, u);
 }
@@ -14625,9 +14592,9 @@ static std::string SLTIU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SLTIU %s, %s, %s", rt, rs, u);
 }
@@ -14649,9 +14616,9 @@ static std::string SLTU(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SLTU %s, %s, %s", rd, rs, rt);
 }
@@ -14673,9 +14640,9 @@ static std::string SOV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SOV %s, %s, %s", rd, rs, rt);
 }
@@ -14695,7 +14662,7 @@ static std::string SPECIAL2(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
+    std::string op = IMMEDIATE(op_value);
 
     return img_format("SPECIAL2 %s", op);
 }
@@ -14716,8 +14683,8 @@ static std::string SQRT_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("SQRT.D %s, %s", ft, fs);
 }
@@ -14738,8 +14705,8 @@ static std::string SQRT_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("SQRT.S %s, %s", ft, fs);
 }
@@ -14761,9 +14728,9 @@ static std::string SRA(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("SRA %s, %s, %s", rt, rs, shift);
 }
@@ -14785,9 +14752,9 @@ static std::string SRAV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SRAV %s, %s, %s", rd, rs, rt);
 }
@@ -14833,9 +14800,9 @@ static std::string SRL_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string shift = IMMEDIATE(shift_value);
 
     return img_format("SRL %s, %s, %s", rt, rs, shift);
 }
@@ -14857,9 +14824,9 @@ static std::string SRLV(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SRLV %s, %s, %s", rd, rs, rt);
 }
@@ -14881,9 +14848,9 @@ static std::string SUB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUB %s, %s, %s", rd, rs, rt);
 }
@@ -14905,9 +14872,9 @@ static std::string SUB_D(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("SUB.D %s, %s, %s", fd, fs, ft);
 }
@@ -14929,9 +14896,9 @@ static std::string SUB_S(uint64 instruction, Dis_info *info)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    std::string fd = FPR(fd_value);
+    std::string fs = FPR(fs_value);
+    std::string ft = FPR(ft_value);
 
     return img_format("SUB.S %s, %s, %s", fd, fs, ft);
 }
@@ -14953,9 +14920,9 @@ static std::string SUBQ_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14978,9 +14945,9 @@ static std::string SUBQ_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15003,9 +14970,9 @@ static std::string SUBQ_S_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -15028,9 +14995,9 @@ static std::string SUBQH_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15053,9 +15020,9 @@ static std::string SUBQH_R_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15078,9 +15045,9 @@ static std::string SUBQH_R_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -15103,9 +15070,9 @@ static std::string SUBQH_W(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -15151,9 +15118,9 @@ static std::string SUBU_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBU %s, %s, %s", rd, rs, rt);
 }
@@ -15175,9 +15142,9 @@ static std::string SUBU_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15199,9 +15166,9 @@ static std::string SUBU_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15224,9 +15191,9 @@ static std::string SUBU_S_PH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15249,9 +15216,9 @@ static std::string SUBU_S_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15274,9 +15241,9 @@ static std::string SUBUH_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15299,9 +15266,9 @@ static std::string SUBUH_R_QB(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15324,7 +15291,7 @@ static std::string SW_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
     std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SW %s, %s(%s)", rtz3, u, rs3);
@@ -15348,7 +15315,7 @@ static std::string SW_4X4_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_3_8__s2(instruction);
 
     std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
     std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("SW %s, %s(%s)", rtz4, u, rs4);
@@ -15371,7 +15338,7 @@ static std::string SW_GP16_(uint64 instruction, Dis_info *info)
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
     std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SW %s, %s($%d)", rtz3, u, 28);
 }
@@ -15392,8 +15359,8 @@ static std::string SW_GP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SW %s, %s($%d)", rt, u, 28);
 }
@@ -15415,9 +15382,9 @@ static std::string SW_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SW %s, %s(%s)", rt, s, rs);
 }
@@ -15438,8 +15405,8 @@ static std::string SW_SP_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SW %s, %s($%d)", rt, u, 29);
 }
@@ -15461,9 +15428,9 @@ static std::string SW_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SW %s, %s(%s)", rt, u, rs);
 }
@@ -15484,8 +15451,8 @@ static std::string SWC1_GP_(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string ft = FPR(ft_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("SWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -15507,9 +15474,9 @@ static std::string SWC1_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string ft = FPR(ft_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -15531,9 +15498,9 @@ static std::string SWC1_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string ft = FPR(ft_value);
+    std::string u = IMMEDIATE(u_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -15555,9 +15522,9 @@ static std::string SWC1X(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ft = FPR(ft_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -15579,9 +15546,9 @@ static std::string SWC1XS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string ft = FPR(ft_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -15603,9 +15570,9 @@ static std::string SWC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string cs = CPR(copy(cs_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string cs = CPR(cs_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SWC2 %s, %s(%s)", cs, s, rs);
 }
@@ -15627,9 +15594,9 @@ static std::string SWE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SWE %s, %s(%s)", rt, s, rs);
 }
@@ -15652,9 +15619,9 @@ static std::string SWM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
@@ -15676,8 +15643,8 @@ static std::string SWPC_48_(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6, info);
+    std::string rt = GPR(rt_value);
+    std::string s = ADDRESS(s_value, 6, info);
 
     return img_format("SWPC %s, %s", rt, s);
 }
@@ -15699,9 +15666,9 @@ static std::string SWX(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SWX %s, %s(%s)", rd, rs, rt);
 }
@@ -15723,9 +15690,9 @@ static std::string SWXS(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("SWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -15745,7 +15712,7 @@ static std::string SYNC(uint64 instruction, Dis_info *info)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
-    std::string stype = IMMEDIATE(copy(stype_value));
+    std::string stype = IMMEDIATE(stype_value);
 
     return img_format("SYNC %s", stype);
 }
@@ -15766,8 +15733,8 @@ static std::string SYNCI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SYNCI %s(%s)", s, rs);
 }
@@ -15788,8 +15755,8 @@ static std::string SYNCIE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("SYNCIE %s(%s)", s, rs);
 }
@@ -15809,7 +15776,7 @@ static std::string SYSCALL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    std::string code = IMMEDIATE(code_value);
 
     return img_format("SYSCALL %s", code);
 }
@@ -15827,7 +15794,7 @@ static std::string SYSCALL_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    std::string code = IMMEDIATE(code_value);
 
     return img_format("SYSCALL %s", code);
 }
@@ -15848,8 +15815,8 @@ static std::string TEQ(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("TEQ %s, %s", rs, rt);
 }
@@ -16086,8 +16053,8 @@ static std::string TNE(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("TNE %s, %s", rs, rt);
 }
@@ -16108,8 +16075,8 @@ static std::string TRUNC_L_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("TRUNC.L.D %s, %s", ft, fs);
 }
@@ -16130,8 +16097,8 @@ static std::string TRUNC_L_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("TRUNC.L.S %s, %s", ft, fs);
 }
@@ -16152,8 +16119,8 @@ static std::string TRUNC_W_D(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("TRUNC.W.D %s, %s", ft, fs);
 }
@@ -16174,8 +16141,8 @@ static std::string TRUNC_W_S(uint64 instruction, Dis_info *info)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    std::string ft = FPR(ft_value);
+    std::string fs = FPR(fs_value);
 
     return img_format("TRUNC.W.S %s, %s", ft, fs);
 }
@@ -16198,9 +16165,9 @@ static std::string UALDM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
@@ -16223,9 +16190,9 @@ static std::string UALH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("UALH %s, %s(%s)", rt, s, rs);
 }
@@ -16248,9 +16215,9 @@ static std::string UALWM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
@@ -16274,9 +16241,9 @@ static std::string UASDM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
@@ -16299,9 +16266,9 @@ static std::string UASH(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("UASH %s, %s(%s)", rt, s, rs);
 }
@@ -16324,9 +16291,9 @@ static std::string UASWM(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string s = IMMEDIATE(s_value);
+    std::string rs = GPR(rs_value);
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
@@ -16347,7 +16314,7 @@ static std::string UDI(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
+    std::string op = IMMEDIATE(op_value);
 
     return img_format("UDI %s", op);
 }
@@ -16365,7 +16332,7 @@ static std::string WAIT(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    std::string code = IMMEDIATE(code_value);
 
     return img_format("WAIT %s", code);
 }
@@ -16386,8 +16353,8 @@ static std::string WRDSP(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string mask = IMMEDIATE(copy(mask_value));
+    std::string rt = GPR(rt_value);
+    std::string mask = IMMEDIATE(mask_value);
 
     return img_format("WRDSP %s, %s", rt, mask);
 }
@@ -16408,8 +16375,8 @@ static std::string WRPGPR(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("WRPGPR %s, %s", rt, rs);
 }
@@ -16453,9 +16420,9 @@ static std::string XOR_32_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    std::string rd = GPR(rd_value);
+    std::string rs = GPR(rs_value);
+    std::string rt = GPR(rt_value);
 
     return img_format("XOR %s, %s, %s", rd, rs, rt);
 }
@@ -16477,9 +16444,9 @@ static std::string XORI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
+    std::string u = IMMEDIATE(u_value);
 
     return img_format("XORI %s, %s, %s", rt, rs, u);
 }
@@ -16499,8 +16466,8 @@ static std::string YIELD(uint64 instruction, Dis_info *info)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    std::string rt = GPR(rt_value);
+    std::string rs = GPR(rs_value);
 
     return img_format("YIELD %s, %s", rt, rs);
 }
-- 
2.37.3


