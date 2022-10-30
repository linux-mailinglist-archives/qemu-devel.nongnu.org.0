Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33217612D6F
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:34:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGpc-0004sb-Oc; Sun, 30 Oct 2022 18:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpZ-0004Vq-4g
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:01 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpX-0007p8-00
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so7049952wmq.4
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPplxEABxU0v7EiPvn/mZOPQxX3B4KN9GAlZ4c2GLuQ=;
 b=BDzKGRAnmB+eP0RlrrAKL0ke3hSrfyUS1r70F/huRwJU0QJZ+YP6EgxuxU5m+L8RF0
 NJn1xVlrX/EZUdKSZgfqubdmEpXXXKt8PbpUyGTrkCcYagDNpMxFWrHTGR0a2yMVXbNA
 8jm6Xr+0njhtapqpMX7nCY5+pxjyy1GcWicZpWMOhZ34v59X9Gv+ql4sJtL/0ue2KbK/
 FxGH82XECep6TTCt8C8lfuUu1CkQkMU4Ii9YRLoXU5z1kemZwd67eWKnpBykC0hIGDvu
 u5UNtBukptlgmF7MuDBaR+jr8m6M9XCqgGmSAyNRhlDz5inVTk6pD3daCKlmkN1tNRI6
 vfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lPplxEABxU0v7EiPvn/mZOPQxX3B4KN9GAlZ4c2GLuQ=;
 b=T65NcwFj1sEYfd9kXKZQwySksD8f4hgR21eiwSvOyo8+GWc9+cskKm+b/F/++y/dYH
 0kzePTO/tHAtwZvcAouJal89hdM/FI45ChSURhFBivZzRQr7Pa4YwkPRLzgWEpL3zJDk
 W4d7z7TE1YEW/uFiyTk3fGJhcK7REK846Fyx22ig+AWgJxL2MO9XyRwz1DmauV+5ts7P
 kpRobVHUjnyKS5W9igZ/p7NQt9347pGmd+rT1tTtqSXi/N5ZaV0FumvX07KSTdKGnSxw
 V7wuTsuBorz6A067K6zVsb5e0m2VEaoxy1MZSCdZQ3mytkKvS7RsyMOdhh6GCmHQTPfj
 kN7A==
X-Gm-Message-State: ACrzQf3vqINft8h1jXwQ1vF3bMnNZAHR4uNRDR4A/edFhxJqM2rO8t/J
 enX09e8E2GnunLN6yK3oWKyGuss0yO8PJA==
X-Google-Smtp-Source: AMsMyM5L64qglMkXypbhyenNXBxL8vYQqAr0FyRl9I13V3k9BpTDf3gq/sPl07vU1advEyzcsGVbOw==
X-Received: by 2002:a1c:7312:0:b0:3cf:6957:1639 with SMTP id
 d18-20020a1c7312000000b003cf69571639mr4474157wmb.108.1667169057959; 
 Sun, 30 Oct 2022 15:30:57 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h5-20020adff185000000b00236863c02f5sm5181296wro.96.2022.10.30.15.30.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:30:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 20/55] disas/nanomips: Remove __cond methods from class
Date: Sun, 30 Oct 2022 23:28:06 +0100
Message-Id: <20221030222841.42377-21-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

NMD class methods with the conditional_function type like
NMD::ADDIU_32__cond, NMD::ADDIU_RS5__cond, etc. are removed from the NMD
class. They're now declared global static functions. Therefore, typedef
of the function pointer, conditional_function is defined outside of the
class.

Now that conditional_function type functions are not part of the NMD
class we can't access them using the this pointer. Thus, the use of
the this pointer has been deleted.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-7-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 42 +++++++++++++++++++++---------------------
 disas/nanomips.h   | 14 ++------------
 2 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 271afcde07..98a632a3fc 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -784,7 +784,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
             if ((op_code & table[i].mask) == table[i].value) {
                 /* possible match */
                 conditional_function cond = table[i].condition;
-                if ((cond == 0) || (this->*cond)(op_code)) {
+                if ((cond == NULL) || cond(op_code)) {
                     try
                     {
                         if (table[i].type == pool) {
@@ -1672,28 +1672,28 @@ static uint64 extract_u_3_2_1_0__s1(uint64 instruction)
 
 
 
-bool NMD::ADDIU_32__cond(uint64 instruction)
+static bool ADDIU_32__cond(uint64 instruction)
 {
     uint64 rt = extract_rt_25_24_23_22_21(instruction);
     return rt != 0;
 }
 
 
-bool NMD::ADDIU_RS5__cond(uint64 instruction)
+static bool ADDIU_RS5__cond(uint64 instruction)
 {
     uint64 rt = extract_rt_9_8_7_6_5(instruction);
     return rt != 0;
 }
 
 
-bool NMD::BALRSC_cond(uint64 instruction)
+static bool BALRSC_cond(uint64 instruction)
 {
     uint64 rt = extract_rt_25_24_23_22_21(instruction);
     return rt != 0;
 }
 
 
-bool NMD::BEQC_16__cond(uint64 instruction)
+static bool BEQC_16__cond(uint64 instruction)
 {
     uint64 rs3 = extract_rs3_6_5_4(instruction);
     uint64 rt3 = extract_rt3_9_8_7(instruction);
@@ -1702,7 +1702,7 @@ bool NMD::BEQC_16__cond(uint64 instruction)
 }
 
 
-bool NMD::BNEC_16__cond(uint64 instruction)
+static bool BNEC_16__cond(uint64 instruction)
 {
     uint64 rs3 = extract_rs3_6_5_4(instruction);
     uint64 rt3 = extract_rt3_9_8_7(instruction);
@@ -1711,35 +1711,35 @@ bool NMD::BNEC_16__cond(uint64 instruction)
 }
 
 
-bool NMD::MOVE_cond(uint64 instruction)
+static bool MOVE_cond(uint64 instruction)
 {
     uint64 rt = extract_rt_9_8_7_6_5(instruction);
     return rt != 0;
 }
 
 
-bool NMD::P16_BR1_cond(uint64 instruction)
+static bool P16_BR1_cond(uint64 instruction)
 {
     uint64 u = extract_u_3_2_1_0__s1(instruction);
     return u != 0;
 }
 
 
-bool NMD::PREF_S9__cond(uint64 instruction)
+static bool PREF_S9__cond(uint64 instruction)
 {
     uint64 hint = extract_hint_25_24_23_22_21(instruction);
     return hint != 31;
 }
 
 
-bool NMD::PREFE_cond(uint64 instruction)
+static bool PREFE_cond(uint64 instruction)
 {
     uint64 hint = extract_hint_25_24_23_22_21(instruction);
     return hint != 31;
 }
 
 
-bool NMD::SLTU_cond(uint64 instruction)
+static bool SLTU_cond(uint64 instruction)
 {
     uint64 rd = extract_rd_15_14_13_12_11(instruction);
     return rd != 0;
@@ -16692,7 +16692,7 @@ NMD::Pool NMD::P_ADDIU[2] = {
        0xffe00000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.RI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &NMD::ADDIU_32__cond   ,
+       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &ADDIU_32__cond   ,
        0x0                 },        /* ADDIU[32] */
 };
 
@@ -16790,7 +16790,7 @@ NMD::Pool NMD::P_SLTU[2] = {
        0xfc00fbff, 0x20000390, 0                      , 0,
        0x0                 },        /* P.DVP */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000390, &NMD::SLTU             , &NMD::SLTU_cond        ,
+       0xfc0003ff, 0x20000390, &NMD::SLTU             , &SLTU_cond        ,
        0x0                 },        /* SLTU */
 };
 
@@ -21335,7 +21335,7 @@ NMD::Pool NMD::P_PREF_S9_[2] = {
        0xffe07f00, 0xa7e01800, &NMD::SYNCI            , 0,
        0x0                 },        /* SYNCI */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &NMD::PREF_S9__cond    ,
+       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &PREF_S9__cond    ,
        0x0                 },        /* PREF[S9] */
 };
 
@@ -21547,7 +21547,7 @@ NMD::Pool NMD::P_PREFE[2] = {
        0xffe07f00, 0xa7e01a00, &NMD::SYNCIE           , 0,
        CP0_ | EVA_         },        /* SYNCIE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &NMD::PREFE_cond       ,
+       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &PREFE_cond       ,
        CP0_ | EVA_         },        /* PREFE */
 };
 
@@ -21719,7 +21719,7 @@ NMD::Pool NMD::P_BALRSC[2] = {
        0xffe0f000, 0x48008000, &NMD::BRSC             , 0,
        0x0                 },        /* BRSC */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48008000, &NMD::BALRSC           , &NMD::BALRSC_cond      ,
+       0xfc00f000, 0x48008000, &NMD::BALRSC           , &BALRSC_cond      ,
        0x0                 },        /* BALRSC */
 };
 
@@ -22067,7 +22067,7 @@ NMD::Pool NMD::P16_MV[2] = {
        0xffe0    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x1000    , &NMD::MOVE             , &NMD::MOVE_cond        ,
+       0xfc00    , 0x1000    , &NMD::MOVE             , &MOVE_cond        ,
        0x0                 },        /* MOVE */
 };
 
@@ -22133,7 +22133,7 @@ NMD::Pool NMD::P_ADDIU_RS5_[2] = {
        0xffe8    , 0x9008    , &NMD::NOP_16_          , 0,
        0x0                 },        /* NOP[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &NMD::ADDIU_RS5__cond  ,
+       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &ADDIU_RS5__cond  ,
        0x0                 },        /* ADDIU[RS5] */
 };
 
@@ -22170,10 +22170,10 @@ NMD::Pool NMD::P16_JRC[2] = {
 
 NMD::Pool NMD::P16_BR1[2] = {
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xd800    , &NMD::BEQC_16_         , &NMD::BEQC_16__cond    ,
+       0xfc00    , 0xd800    , &NMD::BEQC_16_         , &BEQC_16__cond    ,
        XMMS_               },        /* BEQC[16] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xd800    , &NMD::BNEC_16_         , &NMD::BNEC_16__cond    ,
+       0xfc00    , 0xd800    , &NMD::BNEC_16_         , &BNEC_16__cond    ,
        XMMS_               },        /* BNEC[16] */
 };
 
@@ -22183,7 +22183,7 @@ NMD::Pool NMD::P16_BR[2] = {
        0xfc0f    , 0xd800    , 0                      , 0,
        0x0                 },        /* P16.JRC */
     { pool                , P16_BR1             , 2   , 16,
-       0xfc00    , 0xd800    , 0                      , &NMD::P16_BR1_cond     ,
+       0xfc00    , 0xd800    , 0                      , &P16_BR1_cond     ,
        0x0                 },        /* P16.BR1 */
 };
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 8eca843ef0..af803f4cc0 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -64,6 +64,8 @@ typedef struct Dis_info {
   img_address m_pc;
 } Dis_info;
 
+typedef bool (*conditional_function)(uint64 instruction);
+
 class NMD
 {
 public:
@@ -75,7 +77,6 @@ private:
 
     typedef std::string(NMD:: *disassembly_function)(uint64 instruction,
                                                      Dis_info *info);
-    typedef bool(NMD:: *conditional_function)(uint64 instruction);
 
     struct Pool {
         TABLE_ENTRY_TYPE     type;
@@ -94,17 +95,6 @@ private:
                     TABLE_ENTRY_TYPE & type, const Pool *table, int table_size,
                     Dis_info *info);
 
-    bool ADDIU_32__cond(uint64 instruction);
-    bool ADDIU_RS5__cond(uint64 instruction);
-    bool BALRSC_cond(uint64 instruction);
-    bool BEQC_16__cond(uint64 instruction);
-    bool BNEC_16__cond(uint64 instruction);
-    bool MOVE_cond(uint64 instruction);
-    bool P16_BR1_cond(uint64 instruction);
-    bool PREF_S9__cond(uint64 instruction);
-    bool PREFE_cond(uint64 instruction);
-    bool SLTU_cond(uint64 instruction);
-
     std::string ABS_D(uint64 instruction, Dis_info *info);
     std::string ABS_S(uint64 instruction, Dis_info *info);
     std::string ABSQ_S_PH(uint64 instruction, Dis_info *info);
-- 
2.37.3


