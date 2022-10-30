Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFE3612D7D
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:35:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGrB-0001IL-Rv; Sun, 30 Oct 2022 18:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqq-00006B-V9
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqo-0008BD-LH
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:20 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o4so13672503wrq.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTf0Lv88WpH5G+nA2nGh5YijA3V3edgCuhblkGYbFWA=;
 b=J9I5thvVx4FCuhJ5lVFFdl7YAhQ3lnITj6E6oYc9Up6jAg9bJDb4KD7JB1YTE6sqCB
 v1VEq5FFLffwiHhqI80JaGZxZklWHCwz2HwhhuwOmHF/reSm7Dkq9N+Uz0gKF0t+TJRw
 u7f627P0ke4cxZsfA93FP42fw7Z26/TXZa1a7fJmTToY8RN2tOuqYVmqcibf28vK98Yx
 Nqbpic9ZtlWkFwcGRUk6AO6KtVck4b/Zd562srInsT1qpuWsKjuaNlaNneeH6BUz1IyS
 kdLTq4WEoycJg9PiEePsBkofbG/b/2b7033lh/5q0Sm2MKcah09FbS17OMzjOGFpHUUq
 aXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTf0Lv88WpH5G+nA2nGh5YijA3V3edgCuhblkGYbFWA=;
 b=mJgrcUwBjgA0u9/cbwOFjO8lpGL3ToYuyS+YO53CYe+VKz4Ue8so+4II8PELRIxjmV
 cp8d/TItTlU4EcoJJngeXOIQw0ec7fsmHSV1/YLMs0VUwYZYUjVqJJgqPCQ5Qp9M6Lnk
 4M25bdExu6Gk4qRbo2g0PyIZaVnOXCTl1BaQXKF4gdO76fEYE0AKU8R1xx5aK4Y7hLAg
 KgF2YX/9FY5pN/krGAdyfHZXUhYscT3c3BY6/WhjzbT2lHuF2jcvCP+z01jGjP14UOOv
 UpZzL8a582QD2xDP0KRKNLpOh6HFxNpikdBUJkMzv3JNiLvyRgCUPib3EUas81+AYx/g
 ArrA==
X-Gm-Message-State: ACrzQf106wn/DJnp2QA6hi8E+x4YJbtxSXsDg4+OTdhl/7FZgALHcShA
 NSi/+SvCFA9QwuW6ZItkHBqcg2foL15KyA==
X-Google-Smtp-Source: AMsMyM6OElNIX00U0b3AabHMQ8C+dnJWjJHnOGkHej4M+eL8rbXmog+ky+sKT3SCM2Fzod0cl0pFOQ==
X-Received: by 2002:a05:6000:15c8:b0:236:812d:d3e5 with SMTP id
 y8-20020a05600015c800b00236812dd3e5mr5944673wry.303.1667169133660; 
 Sun, 30 Oct 2022 15:32:13 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adffe4d000000b0022afcc11f65sm5229846wrs.47.2022.10.30.15.32.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:32:13 -0700 (PDT)
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
Subject: [PULL 32/55] disas/nanomips: Prevent memory leaking
Date: Sun, 30 Oct 2022 23:28:18 +0100
Message-Id: <20221030222841.42377-33-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

g_autofree attribute is added for every dynamically allocated string to
prevent memory leaking.

The implementation of the several functions that work with dynamically
allocated strings is slightly changed so we can add those attributes.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-19-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 96 ++++++++++++++++++++++++----------------------
 1 file changed, 51 insertions(+), 45 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 3a3a9a9b69..ce93fdad62 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -1937,7 +1937,7 @@ static char *ADDIUPC_32_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -1959,7 +1959,7 @@ static char *ADDIUPC_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 6, info);
+    g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2417,7 +2417,7 @@ static char *ALUIPC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
@@ -2574,7 +2574,7 @@ static char *BALC_16_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 2, info);
+    g_autofree char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BALC %s", s);
 }
@@ -2594,7 +2594,7 @@ static char *BALC_32_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BALC %s", s);
 }
@@ -2639,7 +2639,7 @@ static char *BBEQZC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BBEQZC %s, 0x%" PRIx64 ", %s", rt, bit_value, s);
 }
@@ -2662,7 +2662,7 @@ static char *BBNEZC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BBNEZC %s, 0x%" PRIx64 ", %s", rt, bit_value, s);
 }
@@ -2682,7 +2682,7 @@ static char *BC_16_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 2, info);
+    g_autofree char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BC %s", s);
 }
@@ -2702,7 +2702,7 @@ static char *BC_32_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC %s", s);
 }
@@ -2724,7 +2724,7 @@ static char *BC1EQZC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     const char *ft = FPR(ft_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC1EQZC %s, %s", ft, s);
 }
@@ -2746,7 +2746,7 @@ static char *BC1NEZC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     const char *ft = FPR(ft_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC1NEZC %s, %s", ft, s);
 }
@@ -2767,7 +2767,7 @@ static char *BC2EQZC(uint64 instruction, Dis_info *info)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC2EQZC CP%" PRIu64 ", %s", ct_value, s);
 }
@@ -2788,7 +2788,7 @@ static char *BC2NEZC(uint64 instruction, Dis_info *info)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC2NEZC CP%" PRIu64 ", %s", ct_value, s);
 }
@@ -2812,7 +2812,7 @@ static char *BEQC_16_(uint64 instruction, Dis_info *info)
 
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = ADDRESS(u_value, 2, info);
+    g_autofree char *u = ADDRESS(u_value, 2, info);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
@@ -2836,7 +2836,7 @@ static char *BEQC_32_(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
@@ -2859,7 +2859,7 @@ static char *BEQIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BEQIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -2881,7 +2881,7 @@ static char *BEQZC_16_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *s = ADDRESS(s_value, 2, info);
+    g_autofree char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BEQZC %s, %s", rt3, s);
 }
@@ -2905,7 +2905,7 @@ static char *BGEC(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
@@ -2928,7 +2928,7 @@ static char *BGEIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -2951,7 +2951,7 @@ static char *BGEIUC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEIUC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -2975,7 +2975,7 @@ static char *BGEUC(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
@@ -2999,7 +2999,7 @@ static char *BLTC(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
@@ -3022,7 +3022,7 @@ static char *BLTIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -3045,7 +3045,7 @@ static char *BLTIUC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTIUC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -3069,7 +3069,7 @@ static char *BLTUC(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
@@ -3093,7 +3093,7 @@ static char *BNEC_16_(uint64 instruction, Dis_info *info)
 
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = ADDRESS(u_value, 2, info);
+    g_autofree char *u = ADDRESS(u_value, 2, info);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
@@ -3117,7 +3117,7 @@ static char *BNEC_32_(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
@@ -3140,7 +3140,7 @@ static char *BNEIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BNEIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -3162,7 +3162,7 @@ static char *BNEZC_16_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *s = ADDRESS(s_value, 2, info);
+    g_autofree char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BNEZC %s, %s", rt3, s);
 }
@@ -3182,7 +3182,7 @@ static char *BPOSGE32C(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BPOSGE32C %s", s);
 }
@@ -8182,7 +8182,7 @@ static char *LDPC_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 6, info);
+    g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("LDPC %s, %s", rt, s);
 }
@@ -9146,7 +9146,7 @@ static char *LWPC_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 6, info);
+    g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("LWPC %s, %s", rt, s);
 }
@@ -10131,7 +10131,7 @@ static char *MOVE_BALC(uint64 instruction, Dis_info *info)
 
     const char *rd1 = GPR(decode_gpr_gpr1(rd1_value));
     const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
@@ -12176,8 +12176,9 @@ static char *RESTORE_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    return img_format("RESTORE 0x%" PRIx64 "%s", u_value,
-               save_restore_list(rt_value, count_value, gp_value));
+    g_autofree char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
+    return img_format("RESTORE 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
 
@@ -12197,8 +12198,9 @@ static char *RESTORE_JRC_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    return img_format("RESTORE.JRC 0x%" PRIx64 "%s", u_value,
-        save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
+    g_autofree char *save_restore_str = save_restore_list(
+        encode_rt1_from_rt(rt1_value), count_value, 0);
+    return img_format("RESTORE.JRC 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
 
@@ -12219,8 +12221,10 @@ static char *RESTORE_JRC_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
+    g_autofree char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
     return img_format("RESTORE.JRC 0x%" PRIx64 "%s", u_value,
-               save_restore_list(rt_value, count_value, gp_value));
+                      save_restore_str);
 }
 
 
@@ -12509,8 +12513,9 @@ static char *SAVE_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    return img_format("SAVE 0x%" PRIx64 "%s", u_value,
-        save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
+    g_autofree char *save_restore_str = save_restore_list(
+        encode_rt1_from_rt(rt1_value), count_value, 0);
+    return img_format("SAVE 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
 
@@ -12531,8 +12536,9 @@ static char *SAVE_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    return img_format("SAVE 0x%" PRIx64 "%s", u_value,
-               save_restore_list(rt_value, count_value, gp_value));
+    g_autofree char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
+    return img_format("SAVE 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
 
@@ -13117,7 +13123,7 @@ static char *SDPC_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 6, info);
+    g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("SDPC %s, %s", rt, s);
 }
@@ -15296,7 +15302,7 @@ static char *SWPC_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 6, info);
+    g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("SWPC %s, %s", rt, s);
 }
@@ -21935,7 +21941,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     int status;
     bfd_byte buffer[2];
     uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
-    char *buf = NULL;
+    g_autofree char *buf = NULL;
 
     info->bytes_per_chunk = 2;
     info->display_endian = info->endian;
-- 
2.37.3


