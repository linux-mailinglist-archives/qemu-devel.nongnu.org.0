Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C91E612D83
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGrA-00011G-34; Sun, 30 Oct 2022 18:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqg-0008EB-49
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqZ-0008Lu-Go
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:09 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z14so13651423wrn.7
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQ6tY2FLUiCQ3vsKMLmUOOQD7TaJOM1NGw24WMw61bE=;
 b=zyP6ldrXBuzETjwknLcQeTXPqU5GliMcar5wLP9V51nfoEqBvB3VSDopefIsNO/tzy
 5YSCnnd0USfGB53cICCVOIp83lW9bowRoe7nb+AhGq975xU3x9cD2T+CS5Zw3mkQSa4R
 jf5UNOlw5z9TUMeyg7jYvbmgsjg9bwmjpP39l5jqVIBh36d+FbX1VWbWK/W+T3TulfKd
 XLvGjyJQn/Z/X4QSHs2/SO4SHesHaDXs4AuVtUFGpEMppJmeqhwwvQBpP7dt0t9QMq8v
 2/Q7cdzl73eSLfkvbTk7MvaDnrjI7AMcK4ae5TR41CkUT3xLAyYNJ+a3YkjWDPHj0XUz
 3EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQ6tY2FLUiCQ3vsKMLmUOOQD7TaJOM1NGw24WMw61bE=;
 b=yEANygYf82LZcucqtNRRBHVBvLw2jxKjd2ZOwi20Jxo4SueKcnFOkSbNBXpprm7i6t
 R/LVk2GiKPfbADsp0D3+gHqFhMKy9R6qdNl1Ev9yQj9nWL5iFjiiWkhScTFYRJoKsA4b
 BK8+5PkmAr6JjmfDfK/6eClXRYP1OuiqU3bqYk+1nWyMWJpUjwkHlCbnwHncliXY8vDw
 9r+QaP9y7JZQa/7D7IQXyNrDiInJ5GqM3oIJsCRDMfR1/QVy9lplTpgABAdfHyI9W8V9
 ch6j1VD2kNPrgkXt5GnbwjuERHqTrYHc8Vxx7S+GF8E1bFrajUBoBcccQj2kZMl863+G
 RkOw==
X-Gm-Message-State: ACrzQf0z/EdmlWbNh6c+qq1qXng+lFCdvz7CFurGEOaq1C8sBXOwFAh3
 uL92cIhZ8bqsu8g8P/0l45lLlF+gw+UKsQ==
X-Google-Smtp-Source: AMsMyM6UkQeYTOP+HQGE53ICnoArZRewwOuL4QtnCKL9sYBP6oViVQ4DIgLs1l8zSGh8H2rF+IGM1g==
X-Received: by 2002:adf:df83:0:b0:236:6d5d:ff8b with SMTP id
 z3-20020adfdf83000000b002366d5dff8bmr5975502wrl.315.1667169120746; 
 Sun, 30 Oct 2022 15:32:00 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b003cf57329221sm6154632wmq.14.2022.10.30.15.31.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:32:00 -0700 (PDT)
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
Subject: [PULL 30/55] disas/nanomips: Remove IMMEDIATE functions
Date: Sun, 30 Oct 2022 23:28:16 +0100
Message-Id: <20221030222841.42377-31-philmd@linaro.org>
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

Both versions of IMMEDIATE functions have been removed.

Before this patch, we'd been calling img_format twice, the first time
through the IMMEDIATE to get an appropriate string and the second time
to print that string. There's no more need for that. Therefore, calls to
IMMEDIATE are removed, and now we're directly printing the integer
values instead.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-17-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 756 ++++++++++++++++-----------------------------
 1 file changed, 265 insertions(+), 491 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index e4e122f3cf..3b1ca249ce 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -519,18 +519,6 @@ static const char *AC(uint64 reg)
 }
 
 
-static char *IMMEDIATE(uint64 value)
-{
-    return img_format("0x%" PRIx64, value);
-}
-
-
-static char *IMMEDIATE(int64 value)
-{
-    return img_format("%" PRId64, value);
-}
-
-
 static char *CPR(uint64 reg)
 {
     /* needs more work */
@@ -1674,11 +1662,10 @@ static char *ACLR(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *bit = IMMEDIATE(bit_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("ACLR %s, %s(%s)", bit, s, rs);
+    return img_format("ACLR 0x%" PRIx64 ", %" PRId64 "(%s)",
+                      bit_value, s_value, rs);
 }
 
 
@@ -1772,9 +1759,8 @@ static char *ADDIU_32_(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("ADDIU %s, %s, %s", rt, rs, u);
+    return img_format("ADDIU %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
 
 
@@ -1793,9 +1779,8 @@ static char *ADDIU_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
 
-    return img_format("ADDIU %s, %s", rt, s);
+    return img_format("ADDIU %s, %" PRId64, rt, s_value);
 }
 
 
@@ -1814,9 +1799,8 @@ static char *ADDIU_GP48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
 
-    return img_format("ADDIU %s, $%d, %s", rt, 28, s);
+    return img_format("ADDIU %s, $%d, %" PRId64, rt, 28, s_value);
 }
 
 
@@ -1835,9 +1819,8 @@ static char *ADDIU_GP_B_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("ADDIU %s, $%d, %s", rt, 28, u);
+    return img_format("ADDIU %s, $%d, 0x%" PRIx64, rt, 28, u_value);
 }
 
 
@@ -1856,9 +1839,8 @@ static char *ADDIU_GP_W_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("ADDIU %s, $%d, %s", rt, 28, u);
+    return img_format("ADDIU %s, $%d, 0x%" PRIx64, rt, 28, u_value);
 }
 
 
@@ -1879,9 +1861,9 @@ static char *ADDIU_NEG_(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *u = IMMEDIATE(neg_copy(u_value));
+    int64 u = neg_copy(u_value);
 
-    return img_format("ADDIU %s, %s, %s", rt, rs, u);
+    return img_format("ADDIU %s, %s, %" PRId64, rt, rs, u);
 }
 
 
@@ -1900,9 +1882,8 @@ static char *ADDIU_R1_SP_(uint64 instruction, Dis_info *info)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
+    return img_format("ADDIU %s, $%d, 0x%" PRIx64, rt3, 29, u_value);
 }
 
 
@@ -1923,9 +1904,8 @@ static char *ADDIU_R2_(uint64 instruction, Dis_info *info)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
+    return img_format("ADDIU %s, %s, 0x%" PRIx64, rt3, rs3, u_value);
 }
 
 
@@ -1943,9 +1923,8 @@ static char *ADDIU_RS5_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
 
-    return img_format("ADDIU %s, %s", rt, s);
+    return img_format("ADDIU %s, %" PRId64, rt, s_value);
 }
 
 
@@ -2513,9 +2492,9 @@ static char *ANDI_16_(uint64 instruction, Dis_info *info)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    char *eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
+    uint64 eu = encode_eu_from_u_andi16(eu_value);
 
-    return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
+    return img_format("ANDI %s, %s, 0x%" PRIx64, rt3, rs3, eu);
 }
 
 
@@ -2537,9 +2516,8 @@ static char *ANDI_32_(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("ANDI %s, %s, %s", rt, rs, u);
+    return img_format("ANDI %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
 
 
@@ -2561,9 +2539,8 @@ static char *APPEND(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("APPEND %s, %s, %s", rt, rs, sa);
+    return img_format("APPEND %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -2583,11 +2560,10 @@ static char *ASET(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *bit = IMMEDIATE(bit_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("ASET %s, %s(%s)", bit, s, rs);
+    return img_format("ASET 0x%" PRIx64 ", %" PRId64 "(%s)",
+                      bit_value, s_value, rs);
 }
 
 
@@ -2670,10 +2646,9 @@ static char *BBEQZC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *bit = IMMEDIATE(bit_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BBEQZC %s, %s, %s", rt, bit, s);
+    return img_format("BBEQZC %s, 0x%" PRIx64 ", %s", rt, bit_value, s);
 }
 
 
@@ -2694,10 +2669,9 @@ static char *BBNEZC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *bit = IMMEDIATE(bit_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BBNEZC %s, %s, %s", rt, bit, s);
+    return img_format("BBNEZC %s, 0x%" PRIx64 ", %s", rt, bit_value, s);
 }
 
 
@@ -2894,10 +2868,9 @@ static char *BEQIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BEQIC %s, %s, %s", rt, u, s);
+    return img_format("BEQIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
 
 
@@ -2964,10 +2937,9 @@ static char *BGEIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BGEIC %s, %s, %s", rt, u, s);
+    return img_format("BGEIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
 
 
@@ -2988,10 +2960,9 @@ static char *BGEIUC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BGEIUC %s, %s, %s", rt, u, s);
+    return img_format("BGEIUC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
 
 
@@ -3060,10 +3031,9 @@ static char *BLTIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BLTIC %s, %s, %s", rt, u, s);
+    return img_format("BLTIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
 
 
@@ -3084,10 +3054,9 @@ static char *BLTIUC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BLTIUC %s, %s, %s", rt, u, s);
+    return img_format("BLTIUC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
 
 
@@ -3180,10 +3149,9 @@ static char *BNEIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BNEIC %s, %s, %s", rt, u, s);
+    return img_format("BNEIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
 
 
@@ -3243,9 +3211,8 @@ static char *BREAK_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    char *code = IMMEDIATE(code_value);
 
-    return img_format("BREAK %s", code);
+    return img_format("BREAK 0x%" PRIx64, code_value);
 }
 
 
@@ -3263,9 +3230,8 @@ static char *BREAK_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    char *code = IMMEDIATE(code_value);
 
-    return img_format("BREAK %s", code);
+    return img_format("BREAK 0x%" PRIx64, code_value);
 }
 
 
@@ -3305,11 +3271,9 @@ static char *CACHE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *op = IMMEDIATE(op_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("CACHE %s, %s(%s)", op, s, rs);
+    return img_format("CACHE 0x%" PRIx64 ", %s(%s)", op_value, s_value, rs);
 }
 
 
@@ -3329,11 +3293,9 @@ static char *CACHEE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *op = IMMEDIATE(op_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("CACHEE %s, %s(%s)", op, s, rs);
+    return img_format("CACHEE 0x%" PRIx64 ", %s(%s)", op_value, s_value, rs);
 }
 
 
@@ -4906,9 +4868,8 @@ static char *COP2_1(uint64 instruction, Dis_info *info)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
-    char *cofun = IMMEDIATE(cofun_value);
 
-    return img_format("COP2_1 %s", cofun);
+    return img_format("COP2_1 0x%" PRIx64, cofun_value);
 }
 
 
@@ -5236,9 +5197,8 @@ static char *DADDIU_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
 
-    return img_format("DADDIU %s, %s", rt, s);
+    return img_format("DADDIU %s, %s", rt, s_value);
 }
 
 
@@ -5260,9 +5220,9 @@ static char *DADDIU_NEG_(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *u = IMMEDIATE(neg_copy(u_value));
+    int64 u = neg_copy(u_value);
 
-    return img_format("DADDIU %s, %s, %s", rt, rs, u);
+    return img_format("DADDIU %s, %s, %" PRId64, rt, rs, u);
 }
 
 
@@ -5284,9 +5244,8 @@ static char *DADDIU_U12_(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("DADDIU %s, %s, %s", rt, rs, u);
+    return img_format("DADDIU %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
 
 
@@ -5467,10 +5426,10 @@ static char *DEXTM(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *lsb = IMMEDIATE(lsb_value);
-    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    uint64 msbd = encode_msbd_from_size(msbd_value);
 
-    return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("DEXTM %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, rs, lsb_value, msbd);
 }
 
 
@@ -5493,10 +5452,10 @@ static char *DEXT(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *lsb = IMMEDIATE(lsb_value);
-    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    uint64 msbd = encode_msbd_from_size(msbd_value);
 
-    return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("DEXT %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, rs, lsb_value, msbd);
 }
 
 
@@ -5519,10 +5478,10 @@ static char *DEXTU(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *lsb = IMMEDIATE(lsb_value);
-    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    uint64 msbd = encode_msbd_from_size(msbd_value);
 
-    return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("DEXTU %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, rs, lsb_value, msbd);
 }
 
 
@@ -5545,11 +5504,10 @@ static char *DINSM(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *pos = IMMEDIATE(lsb_value);
-    char *size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
-    return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("DINSM %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, rs, lsb_value, msbd_value);
     /* hand edited */
 }
 
@@ -5573,11 +5531,10 @@ static char *DINS(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *pos = IMMEDIATE(lsb_value);
-    char *size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
-    return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("DINS %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, rs, lsb_value, msbd_value);
     /* hand edited */
 }
 
@@ -5601,11 +5558,10 @@ static char *DINSU(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *pos = IMMEDIATE(lsb_value);
-    char *size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
-    return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("DINSU %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, rs, lsb_value, msbd_value);
     /* hand edited */
 }
 
@@ -5746,9 +5702,8 @@ static char *DLSA(uint64 instruction, Dis_info *info)
     const char *rd = GPR(rd_value);
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *u2 = IMMEDIATE(u2_value);
 
-    return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
+    return img_format("DLSA %s, %s, %s, 0x%" PRIx64, rd, rs, rt, u2_value);
 }
 
 
@@ -5768,9 +5723,8 @@ static char *DLUI_48_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("DLUI %s, %s", rt, u);
+    return img_format("DLUI %s, 0x%" PRIx64, rt, u_value);
 }
 
 
@@ -5792,9 +5746,8 @@ static char *DMFC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMFC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -5860,9 +5813,8 @@ static char *DMFGC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMFGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -5932,9 +5884,8 @@ static char *DMTC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMTC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -6000,9 +5951,8 @@ static char *DMTGC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMTGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -6525,9 +6475,8 @@ static char *DROTR(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("DROTR %s, %s, %s", rt, rs, shift);
+    return img_format("DROTR %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -6549,9 +6498,8 @@ static char *DROTR32(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
+    return img_format("DROTR32 %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -6598,10 +6546,9 @@ static char *DROTX(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
-    char *shiftx = IMMEDIATE(shiftx_value);
 
-    return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
+    return img_format("DROTX %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, rs, shift_value, shiftx_value);
 }
 
 
@@ -6623,9 +6570,8 @@ static char *DSLL(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("DSLL %s, %s, %s", rt, rs, shift);
+    return img_format("DSLL %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -6647,9 +6593,8 @@ static char *DSLL32(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
+    return img_format("DSLL32 %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -6695,9 +6640,8 @@ static char *DSRA(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("DSRA %s, %s, %s", rt, rs, shift);
+    return img_format("DSRA %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -6719,9 +6663,8 @@ static char *DSRA32(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
+    return img_format("DSRA32 %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -6767,9 +6710,8 @@ static char *DSRL(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("DSRL %s, %s, %s", rt, rs, shift);
+    return img_format("DSRL %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -6791,9 +6733,8 @@ static char *DSRL32(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
+    return img_format("DSRL32 %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -7062,10 +7003,10 @@ static char *EXT(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *lsb = IMMEDIATE(lsb_value);
-    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    uint64 msbd = encode_msbd_from_size(msbd_value);
 
-    return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("EXT %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, rs, lsb_value, msbd);
 }
 
 
@@ -7089,9 +7030,8 @@ static char *EXTD(uint64 instruction, Dis_info *info)
     const char *rd = GPR(rd_value);
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
+    return img_format("EXTD %s, %s, %s, 0x%" PRIx64, rd, rs, rt, shift_value);
 }
 
 
@@ -7115,9 +7055,8 @@ static char *EXTD32(uint64 instruction, Dis_info *info)
     const char *rd = GPR(rd_value);
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
+    return img_format("EXTD32 %s, %s, %s, 0x%" PRIx64, rd, rs, rt, shift_value);
 }
 
 
@@ -7139,9 +7078,8 @@ static char *EXTPDP(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *ac = AC(ac_value);
-    char *size = IMMEDIATE(size_value);
 
-    return img_format("EXTPDP %s, %s, %s", rt, ac, size);
+    return img_format("EXTPDP %s, %s, 0x%" PRIx64, rt, ac, size_value);
 }
 
 
@@ -7187,9 +7125,8 @@ static char *EXTP(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *ac = AC(ac_value);
-    char *size = IMMEDIATE(size_value);
 
-    return img_format("EXTP %s, %s, %s", rt, ac, size);
+    return img_format("EXTP %s, %s, 0x%" PRIx64, rt, ac, size_value);
 }
 
 
@@ -7236,9 +7173,8 @@ static char *EXTR_RS_W(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *ac = AC(ac_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR_RS.W %s, %s, 0x%" PRIx64, rt, ac, shift_value);
 }
 
 
@@ -7261,9 +7197,8 @@ static char *EXTR_R_W(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *ac = AC(ac_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR_R.W %s, %s, 0x%" PRIx64, rt, ac, shift_value);
 }
 
 
@@ -7286,9 +7221,8 @@ static char *EXTR_S_H(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *ac = AC(ac_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR_S.H %s, %s, 0x%" PRIx64, rt, ac, shift_value);
 }
 
 
@@ -7311,9 +7245,8 @@ static char *EXTR_W(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *ac = AC(ac_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR.W %s, %s, 0x%" PRIx64, rt, ac, shift_value);
 }
 
 
@@ -7438,9 +7371,8 @@ static char *EXTW(uint64 instruction, Dis_info *info)
     const char *rd = GPR(rd_value);
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
+    return img_format("EXTW %s, %s, %s, 0x%" PRIx64, rd, rs, rt, shift_value);
 }
 
 
@@ -7570,9 +7502,8 @@ static char *HYPCALL(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    char *code = IMMEDIATE(code_value);
 
-    return img_format("HYPCALL %s", code);
+    return img_format("HYPCALL 0x%" PRIx64, code_value);
 }
 
 
@@ -7590,9 +7521,8 @@ static char *HYPCALL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    char *code = IMMEDIATE(code_value);
 
-    return img_format("HYPCALL %s", code);
+    return img_format("HYPCALL 0x%" PRIx64, code_value);
 }
 
 
@@ -7615,11 +7545,10 @@ static char *INS(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *pos = IMMEDIATE(lsb_value);
-    char *size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
-    return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("INS %s, %s, 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, rs, lsb_value, msbd_value);
     /* hand edited */
 }
 
@@ -7764,10 +7693,9 @@ static char *LB_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(u_value);
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("LB %s, %s(%s)", rt3, u, rs3);
+    return img_format("LB %s, 0x%" PRIx64 "(%s)", rt3, u_value, rs3);
 }
 
 
@@ -7787,9 +7715,8 @@ static char *LB_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LB %s, %s($%d)", rt, u, 28);
+    return img_format("LB %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -7810,10 +7737,9 @@ static char *LB_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LB %s, %s(%s)", rt, s, rs);
+    return img_format("LB %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -7834,10 +7760,9 @@ static char *LB_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LB %s, %s(%s)", rt, u, rs);
+    return img_format("LB %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -7858,10 +7783,9 @@ static char *LBE(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LBE %s, %s(%s)", rt, s, rs);
+    return img_format("LBE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -7882,10 +7806,9 @@ static char *LBU_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(u_value);
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("LBU %s, %s(%s)", rt3, u, rs3);
+    return img_format("LBU %s, 0x%" PRIx64 "(%s)", rt3, u_value, rs3);
 }
 
 
@@ -7905,9 +7828,8 @@ static char *LBU_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LBU %s, %s($%d)", rt, u, 28);
+    return img_format("LBU %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -7928,10 +7850,9 @@ static char *LBU_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LBU %s, %s(%s)", rt, s, rs);
+    return img_format("LBU %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -7952,10 +7873,9 @@ static char *LBU_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LBU %s, %s(%s)", rt, u, rs);
+    return img_format("LBU %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -7976,10 +7896,9 @@ static char *LBUE(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LBUE %s, %s(%s)", rt, s, rs);
+    return img_format("LBUE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -8047,9 +7966,8 @@ static char *LD_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LD %s, %s($%d)", rt, u, 28);
+    return img_format("LD %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -8070,10 +7988,9 @@ static char *LD_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LD %s, %s(%s)", rt, s, rs);
+    return img_format("LD %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -8094,10 +8011,9 @@ static char *LD_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LD %s, %s(%s)", rt, u, rs);
+    return img_format("LD %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -8117,9 +8033,8 @@ static char *LDC1_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
     const char *ft = FPR(ft_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LDC1 %s, %s($%d)", ft, u, 28);
+    return img_format("LDC1 %s, 0x%" PRIx64 "($%d)", ft, u_value, 28);
 }
 
 
@@ -8140,10 +8055,9 @@ static char *LDC1_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(ft_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LDC1 %s, %s(%s)", ft, s, rs);
+    return img_format("LDC1 %s, %" PRId64 "(%s)", ft, s_value, rs);
 }
 
 
@@ -8164,10 +8078,9 @@ static char *LDC1_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(ft_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LDC1 %s, %s(%s)", ft, u, rs);
+    return img_format("LDC1 %s, 0x%" PRIx64 "(%s)", ft, u_value, rs);
 }
 
 
@@ -8236,10 +8149,9 @@ static char *LDC2(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     char *ct = CPR(ct_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LDC2 %s, %s(%s)", ct, s, rs);
+    return img_format("LDC2 %s, %" PRId64 "(%s)", ct, s_value, rs);
 }
 
 
@@ -8261,11 +8173,11 @@ static char *LDM(uint64 instruction, Dis_info *info)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    uint64 count3 = encode_count3_from_count(count3_value);
 
-    return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("LDM %s, %" PRId64 "(%s), 0x%" PRIx64,
+                      rt, s_value, rs, count3);
 }
 
 
@@ -8356,10 +8268,9 @@ static char *LH_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(u_value);
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("LH %s, %s(%s)", rt3, u, rs3);
+    return img_format("LH %s, 0x%" PRIx64 "(%s)", rt3, u_value, rs3);
 }
 
 
@@ -8379,9 +8290,8 @@ static char *LH_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LH %s, %s($%d)", rt, u, 28);
+    return img_format("LH %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -8402,10 +8312,9 @@ static char *LH_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LH %s, %s(%s)", rt, s, rs);
+    return img_format("LH %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -8426,10 +8335,9 @@ static char *LH_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LH %s, %s(%s)", rt, u, rs);
+    return img_format("LH %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -8450,10 +8358,9 @@ static char *LHE(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LHE %s, %s(%s)", rt, s, rs);
+    return img_format("LHE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -8474,10 +8381,9 @@ static char *LHU_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(u_value);
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("LHU %s, %s(%s)", rt3, u, rs3);
+    return img_format("LHU %s, 0x%" PRIx64 "(%s)", rt3, u_value, rs3);
 }
 
 
@@ -8497,9 +8403,8 @@ static char *LHU_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LHU %s, %s($%d)", rt, u, 28);
+    return img_format("LHU %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -8520,10 +8425,9 @@ static char *LHU_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LHU %s, %s(%s)", rt, s, rs);
+    return img_format("LHU %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -8544,10 +8448,9 @@ static char *LHU_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LHU %s, %s(%s)", rt, u, rs);
+    return img_format("LHU %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -8568,10 +8471,9 @@ static char *LHUE(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LHUE %s, %s(%s)", rt, s, rs);
+    return img_format("LHUE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -8687,9 +8589,9 @@ static char *LI_16_(uint64 instruction, Dis_info *info)
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
+    int64 eu = encode_eu_from_s_li16(eu_value);
 
-    return img_format("LI %s, %s", rt3, eu);
+    return img_format("LI %s, %" PRId64, rt3, eu);
 }
 
 
@@ -8709,9 +8611,8 @@ static char *LI_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
 
-    return img_format("LI %s, %s", rt, s);
+    return img_format("LI %s, %" PRId64, rt, s_value);
 }
 
 
@@ -8732,10 +8633,9 @@ static char *LL(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LL %s, %s(%s)", rt, s, rs);
+    return img_format("LL %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -8756,10 +8656,9 @@ static char *LLD(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LLD %s, %s(%s)", rt, s, rs);
+    return img_format("LLD %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -8804,10 +8703,9 @@ static char *LLE(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LLE %s, %s(%s)", rt, s, rs);
+    return img_format("LLE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -8879,9 +8777,8 @@ static char *LSA(uint64 instruction, Dis_info *info)
     const char *rd = GPR(rd_value);
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *u2 = IMMEDIATE(u2_value);
 
-    return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
+    return img_format("LSA %s, %s, %s, 0x%" PRIx64, rd, rs, rt, u2_value);
 }
 
 
@@ -8901,9 +8798,8 @@ static char *LUI(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
 
-    return img_format("LUI %s, %%hi(%s)", rt, s);
+    return img_format("LUI %s, %%hi(%" PRId64 ")", rt, s_value);
 }
 
 
@@ -8924,10 +8820,9 @@ static char *LW_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(u_value);
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("LW %s, %s(%s)", rt3, u, rs3);
+    return img_format("LW %s, 0x%" PRIx64 "(%s)", rt3, u_value, rs3);
 }
 
 
@@ -8948,10 +8843,9 @@ static char *LW_4X4_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_3_8__s2(instruction);
 
     const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    char *u = IMMEDIATE(u_value);
     const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
-    return img_format("LW %s, %s(%s)", rt4, u, rs4);
+    return img_format("LW %s, 0x%" PRIx64 "(%s)", rt4, u_value, rs4);
 }
 
 
@@ -8971,9 +8865,8 @@ static char *LW_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LW %s, %s($%d)", rt, u, 28);
+    return img_format("LW %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -8993,9 +8886,8 @@ static char *LW_GP16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LW %s, %s($%d)", rt3, u, 28);
+    return img_format("LW %s, 0x%" PRIx64 "($%d)", rt3, u_value, 28);
 }
 
 
@@ -9016,10 +8908,9 @@ static char *LW_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LW %s, %s(%s)", rt, s, rs);
+    return img_format("LW %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -9039,9 +8930,8 @@ static char *LW_SP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LW %s, %s($%d)", rt, u, 29);
+    return img_format("LW %s, 0x%" PRIx64 "($%d)", rt, u_value, 29);
 }
 
 
@@ -9062,10 +8952,9 @@ static char *LW_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LW %s, %s(%s)", rt, u, rs);
+    return img_format("LW %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -9085,9 +8974,8 @@ static char *LWC1_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
     const char *ft = FPR(ft_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LWC1 %s, %s($%d)", ft, u, 28);
+    return img_format("LWC1 %s, 0x%" PRIx64 "($%d)", ft, u_value, 28);
 }
 
 
@@ -9108,10 +8996,9 @@ static char *LWC1_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(ft_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LWC1 %s, %s(%s)", ft, s, rs);
+    return img_format("LWC1 %s, %" PRId64 "(%s)", ft, s_value, rs);
 }
 
 
@@ -9132,10 +9019,9 @@ static char *LWC1_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(ft_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LWC1 %s, %s(%s)", ft, u, rs);
+    return img_format("LWC1 %s, 0x%" PRIx64 "(%s)", ft, u_value, rs);
 }
 
 
@@ -9204,10 +9090,9 @@ static char *LWC2(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     char *ct = CPR(ct_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LWC2 %s, %s(%s)", ct, s, rs);
+    return img_format("LWC2 %s, %" PRId64 "(%s)", ct, s_value, rs);
 }
 
 
@@ -9228,10 +9113,9 @@ static char *LWE(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LWE %s, %s(%s)", rt, s, rs);
+    return img_format("LWE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -9253,11 +9137,11 @@ static char *LWM(uint64 instruction, Dis_info *info)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    uint64 count3 = encode_count3_from_count(count3_value);
 
-    return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("LWM %s, %" PRId64 "(%s), 0x%" PRIx64,
+                      rt, s_value, rs, count3);
 }
 
 
@@ -9299,9 +9183,8 @@ static char *LWU_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("LWU %s, %s($%d)", rt, u, 28);
+    return img_format("LWU %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -9322,10 +9205,9 @@ static char *LWU_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LWU %s, %s(%s)", rt, s, rs);
+    return img_format("LWU %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -9346,10 +9228,9 @@ static char *LWU_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LWU %s, %s(%s)", rt, u, rs);
+    return img_format("LWU %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -9443,9 +9324,9 @@ static char *LWXS_16_(uint64 instruction, Dis_info *info)
 
     const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    char *rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
+    uint64 rt3 = decode_gpr_gpr3(rt3_value);
 
-    return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
+    return img_format("LWXS %s, %s(0x%" PRIx64 ")", rd3, rs3, rt3);
 }
 
 
@@ -9785,9 +9666,8 @@ static char *MFC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -9853,9 +9733,8 @@ static char *MFGC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -9877,9 +9756,8 @@ static char *MFHC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFHC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -9945,9 +9823,8 @@ static char *MFHGC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFHGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -9990,11 +9867,9 @@ static char *MFHTR(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_10(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = IMMEDIATE(c0s_value);
-    char *u = IMMEDIATE(u_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MFHTR %s, 0x%" PRIx64 ", 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, c0s_value, u_value, sel_value);
 }
 
 
@@ -10037,11 +9912,9 @@ static char *MFTR(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_10(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = IMMEDIATE(c0s_value);
-    char *u = IMMEDIATE(u_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MFTR %s, 0x%" PRIx64 ", 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, c0s_value, u_value, sel_value);
 }
 
 
@@ -10519,9 +10392,8 @@ static char *MTC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -10587,9 +10459,8 @@ static char *MTGC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -10611,9 +10482,8 @@ static char *MTHC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTHC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -10679,9 +10549,8 @@ static char *MTHGC0(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *c0s = CPR(c0s_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTHGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
 }
 
 
@@ -10745,11 +10614,9 @@ static char *MTHTR(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_10(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = IMMEDIATE(c0s_value);
-    char *u = IMMEDIATE(u_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MTHTR %s, 0x%" PRIx64 ", 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, c0s_value, u_value, sel_value);
 }
 
 
@@ -10792,11 +10659,9 @@ static char *MTTR(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_10(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = IMMEDIATE(c0s_value);
-    char *u = IMMEDIATE(u_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MTTR %s, 0x%" PRIx64 ", 0x%" PRIx64 ", 0x%" PRIx64,
+                      rt, c0s_value, u_value, sel_value);
 }
 
 
@@ -11504,9 +11369,8 @@ static char *ORI(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("ORI %s, %s, %s", rt, rs, u);
+    return img_format("ORI %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
 
 
@@ -11879,9 +11743,8 @@ static char *PRECR_SRA_PH_W(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
+    return img_format("PRECR_SRA.PH.W %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -11904,9 +11767,8 @@ static char *PRECR_SRA_R_PH_W(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
+    return img_format("PRECR_SRA_R.PH.W %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -12026,11 +11888,10 @@ static char *PREF_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *hint = IMMEDIATE(hint_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("PREF %s, %s(%s)", hint, s, rs);
+    return img_format("PREF 0x%" PRIx64 ", %s(%s)",
+                      hint_value, s_value, rs);
 }
 
 
@@ -12050,11 +11911,10 @@ static char *PREF_U12_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    char *hint = IMMEDIATE(hint_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("PREF %s, %s(%s)", hint, u, rs);
+    return img_format("PREF 0x%" PRIx64 ", 0x%" PRIx64 "(%s)",
+                      hint_value, u_value, rs);
 }
 
 
@@ -12074,11 +11934,9 @@ static char *PREFE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *hint = IMMEDIATE(hint_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("PREFE %s, %s(%s)", hint, s, rs);
+    return img_format("PREFE 0x%" PRIx64 ", %s(%s)", hint_value, s_value, rs);
 }
 
 
@@ -12100,9 +11958,8 @@ static char *PREPEND(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("PREPEND %s, %s, %s", rt, rs, sa);
+    return img_format("PREPEND %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -12142,9 +11999,8 @@ static char *RDDSP(uint64 instruction, Dis_info *info)
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
     const char *rt = GPR(rt_value);
-    char *mask = IMMEDIATE(mask_value);
 
-    return img_format("RDDSP %s, %s", rt, mask);
+    return img_format("RDDSP %s, 0x%" PRIx64, rt, mask_value);
 }
 
 
@@ -12166,9 +12022,8 @@ static char *RDHWR(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     char *hs = CPR(hs_value);
-    char *sel = IMMEDIATE(sel_value);
 
-    return img_format("RDHWR %s, %s, %s", rt, hs, sel);
+    return img_format("RDHWR %s, %s, 0x%" PRIx64, rt, hs, sel_value);
 }
 
 
@@ -12254,9 +12109,8 @@ static char *REPL_PH(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
 
-    return img_format("REPL.PH %s, %s", rt, s);
+    return img_format("REPL.PH %s, %s", rt, s_value);
 }
 
 
@@ -12276,9 +12130,8 @@ static char *REPL_QB(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("REPL.QB %s, %s", rt, u);
+    return img_format("REPL.QB %s, 0x%" PRIx64, rt, u_value);
 }
 
 
@@ -12342,8 +12195,7 @@ static char *RESTORE_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    char *u = IMMEDIATE(u_value);
-    return img_format("RESTORE %s%s", u,
+    return img_format("RESTORE 0x%" PRIx64 "%s", u_value,
                save_restore_list(rt_value, count_value, gp_value));
 }
 
@@ -12364,8 +12216,7 @@ static char *RESTORE_JRC_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    char *u = IMMEDIATE(u_value);
-    return img_format("RESTORE.JRC %s%s", u,
+    return img_format("RESTORE.JRC 0x%" PRIx64 "%s", u_value,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
 
@@ -12387,8 +12238,7 @@ static char *RESTORE_JRC_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    char *u = IMMEDIATE(u_value);
-    return img_format("RESTORE.JRC %s%s", u,
+    return img_format("RESTORE.JRC 0x%" PRIx64 "%s", u_value,
                save_restore_list(rt_value, count_value, gp_value));
 }
 
@@ -12408,10 +12258,8 @@ static char *RESTOREF(uint64 instruction, Dis_info *info)
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    char *u = IMMEDIATE(u_value);
-    char *count = IMMEDIATE(count_value);
 
-    return img_format("RESTOREF %s, %s", u, count);
+    return img_format("RESTOREF 0x%" PRIx64 ", %s", u_value, count_value);
 }
 
 
@@ -12477,9 +12325,8 @@ static char *ROTR(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("ROTR %s, %s, %s", rt, rs, shift);
+    return img_format("ROTR %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -12527,12 +12374,9 @@ static char *ROTX(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
-    char *shiftx = IMMEDIATE(shiftx_value);
-    char *stripe = IMMEDIATE(stripe_value);
 
-    return img_format("ROTX %s, %s, %s, %s, %s",
-                       rt, rs, shift, shiftx, stripe);
+    return img_format("ROTX %s, %s, 0x%" PRIx64 ", 0x%" PRIx64 ", 0x%" PRIx64,
+                       rt, rs, shift_value, shiftx_value, stripe_value);
 }
 
 
@@ -12684,8 +12528,7 @@ static char *SAVE_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    char *u = IMMEDIATE(u_value);
-    return img_format("SAVE %s%s", u,
+    return img_format("SAVE 0x%" PRIx64 "%s", u_value,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
 
@@ -12707,8 +12550,7 @@ static char *SAVE_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    char *u = IMMEDIATE(u_value);
-    return img_format("SAVE %s%s", u,
+    return img_format("SAVE 0x%" PRIx64 "%s", u_value,
                save_restore_list(rt_value, count_value, gp_value));
 }
 
@@ -12728,10 +12570,8 @@ static char *SAVEF(uint64 instruction, Dis_info *info)
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    char *u = IMMEDIATE(u_value);
-    char *count = IMMEDIATE(count_value);
 
-    return img_format("SAVEF %s, %s", u, count);
+    return img_format("SAVEF 0x%" PRIx64 ", 0x%" PRIx64, u_value, count_value);
 }
 
 
@@ -12752,10 +12592,9 @@ static char *SB_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    char *u = IMMEDIATE(u_value);
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("SB %s, %s(%s)", rtz3, u, rs3);
+    return img_format("SB %s, 0x%" PRIx64 "(%s)", rtz3, u_value, rs3);
 }
 
 
@@ -12775,9 +12614,8 @@ static char *SB_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SB %s, %s($%d)", rt, u, 28);
+    return img_format("SB %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -12798,10 +12636,9 @@ static char *SB_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SB %s, %s(%s)", rt, s, rs);
+    return img_format("SB %s, %s(%s)", rt, s_value, rs);
 }
 
 
@@ -12822,10 +12659,9 @@ static char *SB_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SB %s, %s(%s)", rt, u, rs);
+    return img_format("SB %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -12846,10 +12682,9 @@ static char *SBE(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SBE %s, %s(%s)", rt, s, rs);
+    return img_format("SBE %s, %s(%s)", rt, s_value, rs);
 }
 
 
@@ -12894,10 +12729,9 @@ static char *SC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SC %s, %s(%s)", rt, s, rs);
+    return img_format("SC %s, %s(%s)", rt, s_value, rs);
 }
 
 
@@ -12918,10 +12752,9 @@ static char *SCD(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SCD %s, %s(%s)", rt, s, rs);
+    return img_format("SCD %s, %s(%s)", rt, s_value, rs);
 }
 
 
@@ -12966,10 +12799,9 @@ static char *SCE(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SCE %s, %s(%s)", rt, s, rs);
+    return img_format("SCE %s, %s(%s)", rt, s_value, rs);
 }
 
 
@@ -13037,9 +12869,8 @@ static char *SD_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SD %s, %s($%d)", rt, u, 28);
+    return img_format("SD %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -13060,10 +12891,9 @@ static char *SD_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SD %s, %s(%s)", rt, s, rs);
+    return img_format("SD %s, %s(%s)", rt, s_value, rs);
 }
 
 
@@ -13084,10 +12914,9 @@ static char *SD_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SD %s, %s(%s)", rt, u, rs);
+    return img_format("SD %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -13105,9 +12934,8 @@ static char *SDBBP_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    char *code = IMMEDIATE(code_value);
 
-    return img_format("SDBBP %s", code);
+    return img_format("SDBBP 0x%" PRIx64, code_value);
 }
 
 
@@ -13125,9 +12953,8 @@ static char *SDBBP_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    char *code = IMMEDIATE(code_value);
 
-    return img_format("SDBBP %s", code);
+    return img_format("SDBBP 0x%" PRIx64, code_value);
 }
 
 
@@ -13147,9 +12974,8 @@ static char *SDC1_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
     const char *ft = FPR(ft_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SDC1 %s, %s($%d)", ft, u, 28);
+    return img_format("SDC1 %s, 0x%" PRIx64 "($%d)", ft, u_value, 28);
 }
 
 
@@ -13170,10 +12996,9 @@ static char *SDC1_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(ft_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SDC1 %s, %s(%s)", ft, s, rs);
+    return img_format("SDC1 %s, %s(%s)", ft, s_value, rs);
 }
 
 
@@ -13194,10 +13019,9 @@ static char *SDC1_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(ft_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SDC1 %s, %s(%s)", ft, u, rs);
+    return img_format("SDC1 %s, 0x%" PRIx64 "(%s)", ft, u_value, rs);
 }
 
 
@@ -13266,10 +13090,9 @@ static char *SDC2(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     char *cs = CPR(cs_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SDC2 %s, %s(%s)", cs, s, rs);
+    return img_format("SDC2 %s, %s(%s)", cs, s_value, rs);
 }
 
 
@@ -13291,11 +13114,10 @@ static char *SDM(uint64 instruction, Dis_info *info)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    uint64 count3 = encode_count3_from_count(count3_value);
 
-    return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("SDM %s, %s(%s), 0x%" PRIx64, rt, s_value, rs, count3);
 }
 
 
@@ -13575,9 +13397,8 @@ static char *SEQI(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SEQI %s, %s, %s", rt, rs, u);
+    return img_format("SEQI %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
 
 
@@ -13598,10 +13419,9 @@ static char *SH_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    char *u = IMMEDIATE(u_value);
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("SH %s, %s(%s)", rtz3, u, rs3);
+    return img_format("SH %s, 0x%" PRIx64 "(%s)", rtz3, u_value, rs3);
 }
 
 
@@ -13621,9 +13441,8 @@ static char *SH_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SH %s, %s($%d)", rt, u, 28);
+    return img_format("SH %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -13644,10 +13463,9 @@ static char *SH_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SH %s, %s(%s)", rt, s, rs);
+    return img_format("SH %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -13668,10 +13486,9 @@ static char *SH_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SH %s, %s(%s)", rt, u, rs);
+    return img_format("SH %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -13692,10 +13509,9 @@ static char *SHE(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SHE %s, %s(%s)", rt, s, rs);
+    return img_format("SHE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -13714,10 +13530,9 @@ static char *SHILO(uint64 instruction, Dis_info *info)
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    char *shift = IMMEDIATE(shift_value);
     const char *ac = AC(ac_value);
 
-    return img_format("SHILO %s, %s", ac, shift);
+    return img_format("SHILO %s, 0x%" PRIx64, ac, shift_value);
 }
 
 
@@ -13761,9 +13576,8 @@ static char *SHLL_PH(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL.PH %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -13785,9 +13599,8 @@ static char *SHLL_QB(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL.QB %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -13810,9 +13623,8 @@ static char *SHLL_S_PH(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL_S.PH %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -13834,9 +13646,8 @@ static char *SHLL_S_W(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL_S.W %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -13956,9 +13767,8 @@ static char *SHRA_PH(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA.PH %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -13980,9 +13790,8 @@ static char *SHRA_QB(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA.QB %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -14004,9 +13813,8 @@ static char *SHRA_R_PH(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA_R.PH %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -14028,9 +13836,8 @@ static char *SHRA_R_QB(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA_R.QB %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -14052,9 +13859,8 @@ static char *SHRA_R_W(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA_R.W %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -14196,9 +14002,8 @@ static char *SHRL_PH(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHRL.PH %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -14220,9 +14025,8 @@ static char *SHRL_QB(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *sa = IMMEDIATE(sa_value);
 
-    return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHRL.QB %s, %s, 0x%" PRIx64, rt, rs, sa_value);
 }
 
 
@@ -14337,9 +14141,8 @@ static char *SIGRIE(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    char *code = IMMEDIATE(code_value);
 
-    return img_format("SIGRIE %s", code);
+    return img_format("SIGRIE 0x%" PRIx64, code_value);
 }
 
 
@@ -14361,9 +14164,9 @@ static char *SLL_16_(uint64 instruction, Dis_info *info)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    uint64 shift3 = encode_shift3_from_shift(shift3_value);
 
-    return img_format("SLL %s, %s, %s", rt3, rs3, shift3);
+    return img_format("SLL %s, %s, 0x%" PRIx64, rt3, rs3, shift3);
 }
 
 
@@ -14385,9 +14188,8 @@ static char *SLL_32_(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("SLL %s, %s, %s", rt, rs, shift);
+    return img_format("SLL %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -14457,9 +14259,8 @@ static char *SLTI(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SLTI %s, %s, %s", rt, rs, u);
+    return img_format("SLTI %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
 
 
@@ -14481,9 +14282,8 @@ static char *SLTIU(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SLTIU %s, %s, %s", rt, rs, u);
+    return img_format("SLTIU %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
 
 
@@ -14549,9 +14349,8 @@ static char *SPECIAL2(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    char *op = IMMEDIATE(op_value);
 
-    return img_format("SPECIAL2 %s", op);
+    return img_format("SPECIAL2 0x%" PRIx64, op_value);
 }
 
 
@@ -14617,9 +14416,8 @@ static char *SRA(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("SRA %s, %s, %s", rt, rs, shift);
+    return img_format("SRA %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -14665,9 +14463,9 @@ static char *SRL_16_(uint64 instruction, Dis_info *info)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    uint64 shift3 = encode_shift3_from_shift(shift3_value);
 
-    return img_format("SRL %s, %s, %s", rt3, rs3, shift3);
+    return img_format("SRL %s, %s, 0x%" PRIx64, rt3, rs3, shift3);
 }
 
 
@@ -14689,9 +14487,8 @@ static char *SRL_32_(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *shift = IMMEDIATE(shift_value);
 
-    return img_format("SRL %s, %s, %s", rt, rs, shift);
+    return img_format("SRL %s, %s, 0x%" PRIx64, rt, rs, shift_value);
 }
 
 
@@ -15178,10 +14975,9 @@ static char *SW_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    char *u = IMMEDIATE(u_value);
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("SW %s, %s(%s)", rtz3, u, rs3);
+    return img_format("SW %s, 0x%" PRIx64 "(%s)", rtz3, u_value, rs3);
 }
 
 
@@ -15202,10 +14998,9 @@ static char *SW_4X4_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_3_8__s2(instruction);
 
     const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    char *u = IMMEDIATE(u_value);
     const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
-    return img_format("SW %s, %s(%s)", rtz4, u, rs4);
+    return img_format("SW %s, 0x%" PRIx64 "(%s)", rtz4, u_value, rs4);
 }
 
 
@@ -15225,9 +15020,8 @@ static char *SW_GP16_(uint64 instruction, Dis_info *info)
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SW %s, %s($%d)", rtz3, u, 28);
+    return img_format("SW %s, 0x%" PRIx64 "($%d)", rtz3, u_value, 28);
 }
 
 
@@ -15247,9 +15041,8 @@ static char *SW_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SW %s, %s($%d)", rt, u, 28);
+    return img_format("SW %s, 0x%" PRIx64 "($%d)", rt, u_value, 28);
 }
 
 
@@ -15270,10 +15063,9 @@ static char *SW_S9_(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SW %s, %s(%s)", rt, s, rs);
+    return img_format("SW %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -15293,9 +15085,8 @@ static char *SW_SP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SW %s, %s($%d)", rt, u, 29);
+    return img_format("SW %s, 0x%" PRIx64 "($%d)", rt, u_value, 29);
 }
 
 
@@ -15316,10 +15107,9 @@ static char *SW_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SW %s, %s(%s)", rt, u, rs);
+    return img_format("SW %s, 0x%" PRIx64 "(%s)", rt, u_value, rs);
 }
 
 
@@ -15339,9 +15129,8 @@ static char *SWC1_GP_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
     const char *ft = FPR(ft_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("SWC1 %s, %s($%d)", ft, u, 28);
+    return img_format("SWC1 %s, 0x%" PRIx64 "($%d)", ft, u_value, 28);
 }
 
 
@@ -15362,10 +15151,9 @@ static char *SWC1_S9_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(ft_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SWC1 %s, %s(%s)", ft, s, rs);
+    return img_format("SWC1 %s, %" PRId64 "(%s)", ft, s_value, rs);
 }
 
 
@@ -15386,10 +15174,9 @@ static char *SWC1_U12_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(ft_value);
-    char *u = IMMEDIATE(u_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SWC1 %s, %s(%s)", ft, u, rs);
+    return img_format("SWC1 %s, 0x%" PRIx64 "(%s)", ft, u_value, rs);
 }
 
 
@@ -15458,10 +15245,9 @@ static char *SWC2(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     char *cs = CPR(cs_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SWC2 %s, %s(%s)", cs, s, rs);
+    return img_format("SWC2 %s, %" PRId64 "(%s)", cs, s_value, rs);
 }
 
 
@@ -15482,10 +15268,9 @@ static char *SWE(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SWE %s, %s(%s)", rt, s, rs);
+    return img_format("SWE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -15507,11 +15292,11 @@ static char *SWM(uint64 instruction, Dis_info *info)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    uint64 count3 = encode_count3_from_count(count3_value);
 
-    return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("SWM %s, %" PRId64 "(%s), 0x%" PRIx64,
+                      rt, s_value, rs, count3);
 }
 
 
@@ -15599,9 +15384,8 @@ static char *SYNC(uint64 instruction, Dis_info *info)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
-    char *stype = IMMEDIATE(stype_value);
 
-    return img_format("SYNC %s", stype);
+    return img_format("SYNC 0x%" PRIx64, stype_value);
 }
 
 
@@ -15620,10 +15404,9 @@ static char *SYNCI(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SYNCI %s(%s)", s, rs);
+    return img_format("SYNCI %" PRId64 "(%s)", s_value, rs);
 }
 
 
@@ -15642,10 +15425,9 @@ static char *SYNCIE(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SYNCIE %s(%s)", s, rs);
+    return img_format("SYNCIE %" PRId64 "(%s)", s_value, rs);
 }
 
 
@@ -15663,9 +15445,8 @@ static char *SYSCALL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    char *code = IMMEDIATE(code_value);
 
-    return img_format("SYSCALL %s", code);
+    return img_format("SYSCALL 0x%" PRIx64, code_value);
 }
 
 
@@ -15681,9 +15462,8 @@ static char *SYSCALL_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    char *code = IMMEDIATE(code_value);
 
-    return img_format("SYSCALL %s", code);
+    return img_format("SYSCALL 0x%" PRIx64, code_value);
 }
 
 
@@ -16053,11 +15833,11 @@ static char *UALDM(uint64 instruction, Dis_info *info)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    uint64 count3 = encode_count3_from_count(count3_value);
 
-    return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UALDM %s, %" PRId64 "(%s), 0x%" PRIx64,
+                      rt, s_value, rs, count3);
 }
 
 
@@ -16078,10 +15858,9 @@ static char *UALH(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("UALH %s, %s(%s)", rt, s, rs);
+    return img_format("UALH %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -16103,11 +15882,11 @@ static char *UALWM(uint64 instruction, Dis_info *info)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    uint64 count3 = encode_count3_from_count(count3_value);
 
-    return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UALWM %s, %" PRId64 "(%s), 0x%" PRIx64,
+                      rt, s_value, rs, count3);
 }
 
 
@@ -16129,11 +15908,11 @@ static char *UASDM(uint64 instruction, Dis_info *info)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    uint64 count3 = encode_count3_from_count(count3_value);
 
-    return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UASDM %s, %" PRId64 "(%s), 0x%" PRIx64,
+                      rt, s_value, rs, count3);
 }
 
 
@@ -16154,10 +15933,9 @@ static char *UASH(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("UASH %s, %s(%s)", rt, s, rs);
+    return img_format("UASH %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -16179,11 +15957,11 @@ static char *UASWM(uint64 instruction, Dis_info *info)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = IMMEDIATE(s_value);
     const char *rs = GPR(rs_value);
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    uint64 count3 = encode_count3_from_count(count3_value);
 
-    return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UASWM %s, %" PRId64 "(%s), 0x%" PRIx64,
+                      rt, s_value, rs, count3);
 }
 
 
@@ -16201,9 +15979,8 @@ static char *UDI(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    char *op = IMMEDIATE(op_value);
 
-    return img_format("UDI %s", op);
+    return img_format("UDI 0x%" PRIx64, op_value);
 }
 
 
@@ -16219,9 +15996,8 @@ static char *WAIT(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
-    char *code = IMMEDIATE(code_value);
 
-    return img_format("WAIT %s", code);
+    return img_format("WAIT 0x%" PRIx64, code_value);
 }
 
 
@@ -16241,9 +16017,8 @@ static char *WRDSP(uint64 instruction, Dis_info *info)
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
     const char *rt = GPR(rt_value);
-    char *mask = IMMEDIATE(mask_value);
 
-    return img_format("WRDSP %s, %s", rt, mask);
+    return img_format("WRDSP %s, 0x%" PRIx64, rt, mask_value);
 }
 
 
@@ -16333,9 +16108,8 @@ static char *XORI(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value);
     const char *rs = GPR(rs_value);
-    char *u = IMMEDIATE(u_value);
 
-    return img_format("XORI %s, %s, %s", rt, rs, u);
+    return img_format("XORI %s, %s, 0x%" PRIx64, rt, rs, u_value);
 }
 
 
-- 
2.37.3


