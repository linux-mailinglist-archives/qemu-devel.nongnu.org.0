Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AB2612D72
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:34:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGpY-0004PP-Qj; Sun, 30 Oct 2022 18:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpV-0004Au-Js
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:58 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpR-00084P-6n
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso7069615wmq.1
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CIPfIXFFhuBmyBb/bmA83AszZA7HEJDIfrGAz/I9W0=;
 b=TEkXSowzE0NURjvX9IrYaFmyUw25bJ/sHjUS3ax8d8kdgDtxRtW48OwTJ4DALhwz/6
 f/ei/b+P0//vQkW71XUB17hWjzJSnhTjHmP4qNmRBiG5ADNFJBDP5wt6IGjddqAJixG6
 VxOZNjIIQ0oxZ0eCRTJI/KmCHMSx7Kuv95nJH+y59DHbmmsvGkG3PI7Tu+JYiprZzoMj
 WBlAap62nq9cgaT7BECUotSr1VSt+2CeC5AuPIPXkLoAT4UldQpqF7z21kHTwg5u8w56
 eXjV11EGoY88kAVr2l3VIX9fxULtGR00buDnF8QoatuY526MMfMKHH+D8d1g/ZSzW8Ge
 LGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CIPfIXFFhuBmyBb/bmA83AszZA7HEJDIfrGAz/I9W0=;
 b=AcLRNRaZu3yUHvgQFikhl1lYu+FFK6CXAwEUrycMnXpiAnOohsREktL2KlEeevxRMb
 KSt3JsNW9JdqzXd/9XGtIXiGiS1CFMquv7R6wLN3Cxbsym1hfJIiTNWOJ600ikalDLSF
 LHrn6KxHoxc/i0lU0GndJWgzR/S8V5ybGWFkMJOmiu14mgTUfxMXydTr4KrlQAYlcELm
 kjba540hUX6WInvJTzykYmiyKI6JDsTUt0WjoNEa5ngAxX2gt/aIqXz6wxH86nR5u/Cj
 VmqkRNBO6n8Hgrbfo+Omxipuj5J4Mb0qPl+voyqDP5apf0MSwQVmplPF+c5onDhwNySW
 rRgw==
X-Gm-Message-State: ACrzQf2mBbU/vpAuaJLprfIXRRENK6Lnn2+oGT/BYdtxg+W/P4kilQMM
 R5rclLB5CkKa4wvTgye0pcBYnNI7Dk+m4g==
X-Google-Smtp-Source: AMsMyM74KBc03/dtl20ptBmqRIP9/uC1k9cCn6w3KIssWMDrMEc8uSEc8p+TMyxSGwnBal1FqbqVKg==
X-Received: by 2002:a1c:730e:0:b0:3b4:b0c0:d616 with SMTP id
 d14-20020a1c730e000000b003b4b0c0d616mr6174769wmb.72.1667169051046; 
 Sun, 30 Oct 2022 15:30:51 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a5d5183000000b00231ed902a4esm5312147wrv.5.2022.10.30.15.30.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:30:50 -0700 (PDT)
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
Subject: [PULL 19/55] disas/nanomips: Remove helper methods from class
Date: Sun, 30 Oct 2022 23:28:05 +0100
Message-Id: <20221030222841.42377-20-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Helper methods from NMD class like NMD::renumber_registers,
NMD::decode_gpr_gpr4... etc. are removed from the class. They're now
declared global static functions.

Following helper methods have been deleted because they're not used by
the nanomips disassembler:
- NMD::encode_msbd_from_pos_and_size,
- NMD::encode_s_from_s_hi,
- NMD::neg_copy

Global functions used by those methods:
- nanomips_dis
- sign_extend
- extract_bits
have also been defined as static global functions.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-6-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 328 +++++++++++++++++++++------------------------
 disas/nanomips.h   | 144 --------------------
 2 files changed, 154 insertions(+), 318 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 9005f26ee3..271afcde07 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -41,7 +41,7 @@
 #define IMGASSERTONCE(test)
 
 
-int nanomips_dis(char *buf,
+static int nanomips_dis(char *buf,
                  Dis_info *info,
                  unsigned short one,
                  unsigned short two,
@@ -259,20 +259,20 @@ std::string to_string(img_address a)
 }
 
 
-uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_size)
+static uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_size)
 {
     return (data << (64 - (bit_size + bit_offset))) >> (64 - bit_size);
 }
 
 
-int64 sign_extend(int64 data, int msb)
+static int64 sign_extend(int64 data, int msb)
 {
     uint64 shift = 63 - msb;
     return (data << shift) >> shift;
 }
 
 
-uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
+static uint64 renumber_registers(uint64 index, uint64 *register_list,
                                size_t register_list_size)
 {
     if (index < register_list_size) {
@@ -287,7 +287,7 @@ uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
 
 
 /*
- * NMD::decode_gpr_gpr4() - decoder for 'gpr4' gpr encoding type
+ * decode_gpr_gpr4() - decoder for 'gpr4' gpr encoding type
  *
  *   Map a 4-bit code to the 5-bit register space according to this pattern:
  *
@@ -312,7 +312,7 @@ uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
  *     - MUL[4X4]
  *     - SW[4X4]
  */
-uint64 NMD::decode_gpr_gpr4(uint64 d)
+static uint64 decode_gpr_gpr4(uint64 d)
 {
     static uint64 register_list[] = {  8,  9, 10, 11,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
@@ -322,7 +322,7 @@ uint64 NMD::decode_gpr_gpr4(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr4_zero() - decoder for 'gpr4.zero' gpr encoding type
+ * decode_gpr_gpr4_zero() - decoder for 'gpr4.zero' gpr encoding type
  *
  *   Map a 4-bit code to the 5-bit register space according to this pattern:
  *
@@ -348,7 +348,7 @@ uint64 NMD::decode_gpr_gpr4(uint64 d)
  *     - MOVEP
  *     - SW[4X4]
  */
-uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
+static uint64 decode_gpr_gpr4_zero(uint64 d)
 {
     static uint64 register_list[] = {  8,  9, 10,  0,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
@@ -358,7 +358,7 @@ uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr3() - decoder for 'gpr3' gpr encoding type
+ * decode_gpr_gpr3() - decoder for 'gpr3' gpr encoding type
  *
  *   Map a 3-bit code to the 5-bit register space according to this pattern:
  *
@@ -407,7 +407,7 @@ uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
  *     - SW[16]
  *     - XOR[16]
  */
-uint64 NMD::decode_gpr_gpr3(uint64 d)
+static uint64 decode_gpr_gpr3(uint64 d)
 {
     static uint64 register_list[] = { 16, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -416,7 +416,7 @@ uint64 NMD::decode_gpr_gpr3(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr3_src_store() - decoder for 'gpr3.src.store' gpr encoding
+ * decode_gpr_gpr3_src_store() - decoder for 'gpr3.src.store' gpr encoding
  *     type
  *
  *   Map a 3-bit code to the 5-bit register space according to this pattern:
@@ -447,7 +447,7 @@ uint64 NMD::decode_gpr_gpr3(uint64 d)
  *     - SW[16]
  *     - SW[GP16]
  */
-uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
+static uint64 decode_gpr_gpr3_src_store(uint64 d)
 {
     static uint64 register_list[] = {  0, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -456,7 +456,7 @@ uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr2_reg1() - decoder for 'gpr2.reg1' gpr encoding type
+ * decode_gpr_gpr2_reg1() - decoder for 'gpr2.reg1' gpr encoding type
  *
  *   Map a 2-bit code to the 5-bit register space according to this pattern:
  *
@@ -477,7 +477,7 @@ uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
+static uint64 decode_gpr_gpr2_reg1(uint64 d)
 {
     static uint64 register_list[] = {  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -486,7 +486,7 @@ uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr2_reg2() - decoder for 'gpr2.reg2' gpr encoding type
+ * decode_gpr_gpr2_reg2() - decoder for 'gpr2.reg2' gpr encoding type
  *
  *   Map a 2-bit code to the 5-bit register space according to this pattern:
  *
@@ -507,7 +507,7 @@ uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
+static uint64 decode_gpr_gpr2_reg2(uint64 d)
 {
     static uint64 register_list[] = {  5,  6,  7,  8 };
     return renumber_registers(d, register_list,
@@ -516,7 +516,7 @@ uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr1() - decoder for 'gpr1' gpr encoding type
+ * decode_gpr_gpr1() - decoder for 'gpr1' gpr encoding type
  *
  *   Map a 1-bit code to the 5-bit register space according to this pattern:
  *
@@ -536,7 +536,7 @@ uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
  *
  *     - MOVE.BALC
  */
-uint64 NMD::decode_gpr_gpr1(uint64 d)
+static uint64 decode_gpr_gpr1(uint64 d)
 {
     static uint64 register_list[] = {  4,  5 };
     return renumber_registers(d, register_list,
@@ -544,73 +544,60 @@ uint64 NMD::decode_gpr_gpr1(uint64 d)
 }
 
 
-uint64 NMD::copy(uint64 d)
+static uint64 copy(uint64 d)
 {
     return d;
 }
 
 
-int64 NMD::copy(int64 d)
+static int64 copy(int64 d)
 {
     return d;
 }
 
 
-int64 NMD::neg_copy(uint64 d)
+static int64 neg_copy(uint64 d)
 {
     return 0ll - d;
 }
 
 
-int64 NMD::neg_copy(int64 d)
-{
-    return -d;
-}
-
-
 /* strange wrapper around  gpr3 */
-uint64 NMD::encode_rs3_and_check_rs3_ge_rt3(uint64 d)
+static uint64 encode_rs3_and_check_rs3_ge_rt3(uint64 d)
 {
 return decode_gpr_gpr3(d);
 }
 
 
 /* strange wrapper around  gpr3 */
-uint64 NMD::encode_rs3_and_check_rs3_lt_rt3(uint64 d)
+static uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d)
 {
     return decode_gpr_gpr3(d);
 }
 
 
 /* nop - done by extraction function */
-uint64 NMD::encode_s_from_address(uint64 d)
+static uint64 encode_s_from_address(uint64 d)
 {
     return d;
 }
 
 
 /* nop - done by extraction function */
-uint64 NMD::encode_u_from_address(uint64 d)
+static uint64 encode_u_from_address(uint64 d)
 {
     return d;
 }
 
 
-/* nop - done by extraction function */
-uint64 NMD::encode_s_from_s_hi(uint64 d)
-{
-    return d;
-}
-
-
-uint64 NMD::encode_count3_from_count(uint64 d)
+static uint64 encode_count3_from_count(uint64 d)
 {
     IMGASSERTONCE(d < 8);
     return d == 0ull ? 8ull : d;
 }
 
 
-uint64 NMD::encode_shift3_from_shift(uint64 d)
+static uint64 encode_shift3_from_shift(uint64 d)
 {
     IMGASSERTONCE(d < 8);
     return d == 0ull ? 8ull : d;
@@ -618,21 +605,21 @@ uint64 NMD::encode_shift3_from_shift(uint64 d)
 
 
 /* special value for load literal */
-int64 NMD::encode_eu_from_s_li16(uint64 d)
+static int64 encode_eu_from_s_li16(uint64 d)
 {
     IMGASSERTONCE(d < 128);
     return d == 127 ? -1 : (int64)d;
 }
 
 
-uint64 NMD::encode_msbd_from_size(uint64 d)
+static uint64 encode_msbd_from_size(uint64 d)
 {
     IMGASSERTONCE(d < 32);
     return d + 1;
 }
 
 
-uint64 NMD::encode_eu_from_u_andi16(uint64 d)
+static uint64 encode_eu_from_u_andi16(uint64 d)
 {
     IMGASSERTONCE(d < 16);
     if (d == 12) {
@@ -645,42 +632,21 @@ uint64 NMD::encode_eu_from_u_andi16(uint64 d)
 }
 
 
-uint64 NMD::encode_msbd_from_pos_and_size(uint64 d)
-{
-    IMGASSERTONCE(0);
-    return d;
-}
-
-
 /* save16 / restore16   ???? */
-uint64 NMD::encode_rt1_from_rt(uint64 d)
+static uint64 encode_rt1_from_rt(uint64 d)
 {
     return d ? 31 : 30;
 }
 
 
 /* ? */
-uint64 NMD::encode_lsb_from_pos_and_size(uint64 d)
+static uint64 encode_lsb_from_pos_and_size(uint64 d)
 {
     return d;
 }
 
 
-std::string NMD::save_restore_list(uint64 rt, uint64 count, uint64 gp)
-{
-    std::string str;
-
-    for (uint64 counter = 0; counter != count; counter++) {
-        bool use_gp = gp && (counter == count - 1);
-        uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
-        str += img_format(",%s", GPR(this_rt));
-    }
-
-    return str;
-}
-
-
-std::string NMD::GPR(uint64 reg)
+static std::string GPR(uint64 reg)
 {
     static const char *gpr_reg[32] = {
         "zero", "at",   "v0",   "v1",   "a0",   "a1",   "a2",   "a3",
@@ -698,7 +664,21 @@ std::string NMD::GPR(uint64 reg)
 }
 
 
-std::string NMD::FPR(uint64 reg)
+static std::string save_restore_list(uint64 rt, uint64 count, uint64 gp)
+{
+    std::string str;
+
+    for (uint64 counter = 0; counter != count; counter++) {
+        bool use_gp = gp && (counter == count - 1);
+        uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
+        str += img_format(",%s", GPR(this_rt));
+    }
+
+    return str;
+}
+
+
+static std::string FPR(uint64 reg)
 {
     static const char *fpr_reg[32] = {
         "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
@@ -716,7 +696,7 @@ std::string NMD::FPR(uint64 reg)
 }
 
 
-std::string NMD::AC(uint64 reg)
+static std::string AC(uint64 reg)
 {
     static const char *ac_reg[4] = {
         "ac0",  "ac1",  "ac2",  "ac3"
@@ -731,26 +711,26 @@ std::string NMD::AC(uint64 reg)
 }
 
 
-std::string NMD::IMMEDIATE(uint64 value)
+static std::string IMMEDIATE(uint64 value)
 {
     return img_format("0x%" PRIx64, value);
 }
 
 
-std::string NMD::IMMEDIATE(int64 value)
+static std::string IMMEDIATE(int64 value)
 {
     return img_format("%" PRId64, value);
 }
 
 
-std::string NMD::CPR(uint64 reg)
+static std::string CPR(uint64 reg)
 {
     /* needs more work */
     return img_format("CP%" PRIu64, reg);
 }
 
 
-std::string NMD::ADDRESS(uint64 value, int instruction_size, Dis_info *info)
+static std::string ADDRESS(uint64 value, int instruction_size, Dis_info *info)
 {
     /* token for string replace */
     img_address address = info->m_pc + value + instruction_size;
@@ -849,7 +829,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
 }
 
 
-uint64 NMD::extract_code_18_to_0(uint64 instruction)
+static uint64 extract_code_18_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 19);
@@ -857,7 +837,7 @@ uint64 NMD::extract_code_18_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift3_2_1_0(uint64 instruction)
+static uint64 extract_shift3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -865,7 +845,7 @@ uint64 NMD::extract_shift3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
+static uint64 extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 9) << 3;
@@ -873,7 +853,7 @@ uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count_3_2_1_0(uint64 instruction)
+static uint64 extract_count_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4);
@@ -881,7 +861,7 @@ uint64 NMD::extract_count_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz3_9_8_7(uint64 instruction)
+static uint64 extract_rtz3_9_8_7(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 3);
@@ -889,7 +869,7 @@ uint64 NMD::extract_rtz3_9_8_7(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_1__s1(uint64 instruction)
+static uint64 extract_u_17_to_1__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 17) << 1;
@@ -897,7 +877,7 @@ uint64 NMD::extract_u_17_to_1__s1(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
+static int64 extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 11, 10);
@@ -906,7 +886,7 @@ int64 NMD::extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
+static int64 extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 11;
@@ -916,7 +896,7 @@ int64 NMD::extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_10(uint64 instruction)
+static uint64 extract_u_10(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 10, 1);
@@ -924,7 +904,7 @@ uint64 NMD::extract_u_10(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz4_27_26_25_23_22_21(uint64 instruction)
+static uint64 extract_rtz4_27_26_25_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 3);
@@ -933,7 +913,7 @@ uint64 NMD::extract_rtz4_27_26_25_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13_12_11(uint64 instruction)
+static uint64 extract_sa_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -941,7 +921,7 @@ uint64 NMD::extract_sa_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_4_3_2_1_0(uint64 instruction)
+static uint64 extract_shift_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -949,7 +929,7 @@ uint64 NMD::extract_shift_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shiftx_10_9_8_7__s1(uint64 instruction)
+static uint64 extract_shiftx_10_9_8_7__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 4) << 1;
@@ -957,7 +937,7 @@ uint64 NMD::extract_shiftx_10_9_8_7__s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_hint_25_24_23_22_21(uint64 instruction)
+static uint64 extract_hint_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -965,7 +945,7 @@ uint64 NMD::extract_hint_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count3_14_13_12(uint64 instruction)
+static uint64 extract_count3_14_13_12(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 12, 3);
@@ -973,7 +953,7 @@ uint64 NMD::extract_count3_14_13_12(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
+static int64 extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 31;
@@ -984,7 +964,7 @@ int64 NMD::extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
+static int64 extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 7;
@@ -994,7 +974,7 @@ int64 NMD::extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u2_10_9(uint64 instruction)
+static uint64 extract_u2_10_9(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 9, 2);
@@ -1002,7 +982,7 @@ uint64 NMD::extract_u2_10_9(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
+static uint64 extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 10);
@@ -1010,7 +990,7 @@ uint64 NMD::extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_rs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1018,7 +998,7 @@ uint64 NMD::extract_rs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_2_1__s1(uint64 instruction)
+static uint64 extract_u_2_1__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 2) << 1;
@@ -1026,7 +1006,7 @@ uint64 NMD::extract_u_2_1__s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_stripe_6(uint64 instruction)
+static uint64 extract_stripe_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 1);
@@ -1034,7 +1014,7 @@ uint64 NMD::extract_stripe_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ac_15_14(uint64 instruction)
+static uint64 extract_ac_15_14(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 14, 2);
@@ -1042,7 +1022,7 @@ uint64 NMD::extract_ac_15_14(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_20_19_18_17_16(uint64 instruction)
+static uint64 extract_shift_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1050,7 +1030,7 @@ uint64 NMD::extract_shift_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rdl_25_24(uint64 instruction)
+static uint64 extract_rdl_25_24(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 24, 1);
@@ -1058,7 +1038,7 @@ uint64 NMD::extract_rdl_25_24(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
+static int64 extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 10;
@@ -1068,7 +1048,7 @@ int64 NMD::extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_eu_6_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_eu_6_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 7);
@@ -1076,7 +1056,7 @@ uint64 NMD::extract_eu_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_shift_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 6);
@@ -1084,7 +1064,7 @@ uint64 NMD::extract_shift_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count_19_18_17_16(uint64 instruction)
+static uint64 extract_count_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 4);
@@ -1092,7 +1072,7 @@ uint64 NMD::extract_count_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_2_1_0(uint64 instruction)
+static uint64 extract_code_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1100,7 +1080,7 @@ uint64 NMD::extract_code_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 12);
@@ -1108,7 +1088,7 @@ uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs_4_3_2_1_0(uint64 instruction)
+static uint64 extract_rs_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -1116,7 +1096,7 @@ uint64 NMD::extract_rs_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_to_3__s3(uint64 instruction)
+static uint64 extract_u_20_to_3__s3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 18) << 3;
@@ -1124,7 +1104,7 @@ uint64 NMD::extract_u_20_to_3__s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4) << 2;
@@ -1132,7 +1112,7 @@ uint64 NMD::extract_u_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cofun_25_24_23(uint64 instruction)
+static uint64 extract_cofun_25_24_23(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 23);
@@ -1140,7 +1120,7 @@ uint64 NMD::extract_cofun_25_24_23(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3) << 2;
@@ -1148,7 +1128,7 @@ uint64 NMD::extract_u_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd3_3_2_1(uint64 instruction)
+static uint64 extract_rd3_3_2_1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 3);
@@ -1156,7 +1136,7 @@ uint64 NMD::extract_rd3_3_2_1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13_12(uint64 instruction)
+static uint64 extract_sa_15_14_13_12(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 12, 4);
@@ -1164,7 +1144,7 @@ uint64 NMD::extract_sa_15_14_13_12(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_25_24_23_22_21(uint64 instruction)
+static uint64 extract_rt_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1172,7 +1152,7 @@ uint64 NMD::extract_rt_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ru_7_6_5_4_3(uint64 instruction)
+static uint64 extract_ru_7_6_5_4_3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 5);
@@ -1180,7 +1160,7 @@ uint64 NMD::extract_ru_7_6_5_4_3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_0(uint64 instruction)
+static uint64 extract_u_17_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 18);
@@ -1188,7 +1168,7 @@ uint64 NMD::extract_u_17_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rsz4_4_2_1_0(uint64 instruction)
+static uint64 extract_rsz4_4_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1197,7 +1177,7 @@ uint64 NMD::extract_rsz4_4_2_1_0(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se21_0_20_to_1_s1(uint64 instruction)
+static int64 extract_s__se21_0_20_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 21;
@@ -1207,7 +1187,7 @@ int64 NMD::extract_s__se21_0_20_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_op_25_to_3(uint64 instruction)
+static uint64 extract_op_25_to_3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 23);
@@ -1215,7 +1195,7 @@ uint64 NMD::extract_op_25_to_3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs4_4_2_1_0(uint64 instruction)
+static uint64 extract_rs4_4_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1224,7 +1204,7 @@ uint64 NMD::extract_rs4_4_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_bit_23_22_21(uint64 instruction)
+static uint64 extract_bit_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 3);
@@ -1232,7 +1212,7 @@ uint64 NMD::extract_bit_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_41_40_39_38_37(uint64 instruction)
+static uint64 extract_rt_41_40_39_38_37(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 37, 5);
@@ -1240,7 +1220,7 @@ uint64 NMD::extract_rt_41_40_39_38_37(uint64 instruction)
 }
 
 
-int64 NMD::extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
+static int64 extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 16, 6);
@@ -1249,7 +1229,7 @@ int64 NMD::extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd2_3_8(uint64 instruction)
+static uint64 extract_rd2_3_8(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 1) << 1;
@@ -1258,7 +1238,7 @@ uint64 NMD::extract_rd2_3_8(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_17_to_0(uint64 instruction)
+static uint64 extract_code_17_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 18);
@@ -1266,7 +1246,7 @@ uint64 NMD::extract_code_17_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_size_20_19_18_17_16(uint64 instruction)
+static uint64 extract_size_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1274,7 +1254,7 @@ uint64 NMD::extract_size_20_19_18_17_16(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 2, 6) << 2;
@@ -1284,7 +1264,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_15_to_0(uint64 instruction)
+static uint64 extract_u_15_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 16);
@@ -1292,7 +1272,7 @@ uint64 NMD::extract_u_15_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_fs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_fs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1300,7 +1280,7 @@ uint64 NMD::extract_fs_20_19_18_17_16(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 8);
@@ -1310,7 +1290,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_stype_20_19_18_17_16(uint64 instruction)
+static uint64 extract_stype_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1318,7 +1298,7 @@ uint64 NMD::extract_stype_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtl_11(uint64 instruction)
+static uint64 extract_rtl_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 9, 1);
@@ -1326,7 +1306,7 @@ uint64 NMD::extract_rtl_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_hs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_hs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1334,7 +1314,7 @@ uint64 NMD::extract_hs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sel_13_12_11(uint64 instruction)
+static uint64 extract_sel_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 3);
@@ -1342,7 +1322,7 @@ uint64 NMD::extract_sel_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_lsb_4_3_2_1_0(uint64 instruction)
+static uint64 extract_lsb_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -1350,7 +1330,7 @@ uint64 NMD::extract_lsb_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_gp_2(uint64 instruction)
+static uint64 extract_gp_2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 1);
@@ -1358,7 +1338,7 @@ uint64 NMD::extract_gp_2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt3_9_8_7(uint64 instruction)
+static uint64 extract_rt3_9_8_7(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 3);
@@ -1366,7 +1346,7 @@ uint64 NMD::extract_rt3_9_8_7(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ft_25_24_23_22_21(uint64 instruction)
+static uint64 extract_ft_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1374,7 +1354,7 @@ uint64 NMD::extract_ft_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_16_15_14_13_12_11(uint64 instruction)
+static uint64 extract_u_17_16_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 7);
@@ -1382,7 +1362,7 @@ uint64 NMD::extract_u_17_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_cs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1390,7 +1370,7 @@ uint64 NMD::extract_cs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt4_9_7_6_5(uint64 instruction)
+static uint64 extract_rt4_9_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 3);
@@ -1399,7 +1379,7 @@ uint64 NMD::extract_rt4_9_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_msbt_10_9_8_7_6(uint64 instruction)
+static uint64 extract_msbt_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 5);
@@ -1407,7 +1387,7 @@ uint64 NMD::extract_msbt_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_5_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_5_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 6) << 2;
@@ -1415,7 +1395,7 @@ uint64 NMD::extract_u_5_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13(uint64 instruction)
+static uint64 extract_sa_15_14_13(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 13, 3);
@@ -1423,7 +1403,7 @@ uint64 NMD::extract_sa_15_14_13(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se14_0_13_to_1_s1(uint64 instruction)
+static int64 extract_s__se14_0_13_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 14;
@@ -1433,7 +1413,7 @@ int64 NMD::extract_s__se14_0_13_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs3_6_5_4(uint64 instruction)
+static uint64 extract_rs3_6_5_4(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 4, 3);
@@ -1441,7 +1421,7 @@ uint64 NMD::extract_rs3_6_5_4(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_31_to_0__s32(uint64 instruction)
+static uint64 extract_u_31_to_0__s32(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 32) << 32;
@@ -1449,7 +1429,7 @@ uint64 NMD::extract_u_31_to_0__s32(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_10_9_8_7_6(uint64 instruction)
+static uint64 extract_shift_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 5);
@@ -1457,7 +1437,7 @@ uint64 NMD::extract_shift_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cs_25_24_23_22_21(uint64 instruction)
+static uint64 extract_cs_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1465,7 +1445,7 @@ uint64 NMD::extract_cs_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shiftx_11_10_9_8_7_6(uint64 instruction)
+static uint64 extract_shiftx_11_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 6);
@@ -1473,7 +1453,7 @@ uint64 NMD::extract_shiftx_11_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_9_8_7_6_5(uint64 instruction)
+static uint64 extract_rt_9_8_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 5);
@@ -1481,7 +1461,7 @@ uint64 NMD::extract_rt_9_8_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_op_25_24_23_22_21(uint64 instruction)
+static uint64 extract_op_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1489,7 +1469,7 @@ uint64 NMD::extract_op_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 7) << 2;
@@ -1497,7 +1477,7 @@ uint64 NMD::extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_bit_16_15_14_13_12_11(uint64 instruction)
+static uint64 extract_bit_16_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 6);
@@ -1505,7 +1485,7 @@ uint64 NMD::extract_bit_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_mask_20_19_18_17_16_15_14(uint64 instruction)
+static uint64 extract_mask_20_19_18_17_16_15_14(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 14, 7);
@@ -1513,7 +1493,7 @@ uint64 NMD::extract_mask_20_19_18_17_16_15_14(uint64 instruction)
 }
 
 
-uint64 NMD::extract_eu_3_2_1_0(uint64 instruction)
+static uint64 extract_eu_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4);
@@ -1521,7 +1501,7 @@ uint64 NMD::extract_eu_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_7_6_5_4__s4(uint64 instruction)
+static uint64 extract_u_7_6_5_4__s4(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 4, 4) << 4;
@@ -1529,7 +1509,7 @@ uint64 NMD::extract_u_7_6_5_4__s4(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 3, 5) << 3;
@@ -1539,7 +1519,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ft_15_14_13_12_11(uint64 instruction)
+static uint64 extract_ft_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1547,7 +1527,7 @@ uint64 NMD::extract_ft_15_14_13_12_11(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se31_15_to_0_31_to_16(uint64 instruction)
+static int64 extract_s__se31_15_to_0_31_to_16(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 16) << 16;
@@ -1557,7 +1537,7 @@ int64 NMD::extract_s__se31_15_to_0_31_to_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
+static uint64 extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 13, 8);
@@ -1565,7 +1545,7 @@ uint64 NMD::extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_2__s2(uint64 instruction)
+static uint64 extract_u_17_to_2__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 16) << 2;
@@ -1573,7 +1553,7 @@ uint64 NMD::extract_u_17_to_2__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd_15_14_13_12_11(uint64 instruction)
+static uint64 extract_rd_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1581,7 +1561,7 @@ uint64 NMD::extract_rd_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_c0s_20_19_18_17_16(uint64 instruction)
+static uint64 extract_c0s_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1589,7 +1569,7 @@ uint64 NMD::extract_c0s_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_1_0(uint64 instruction)
+static uint64 extract_code_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 2);
@@ -1597,7 +1577,7 @@ uint64 NMD::extract_code_1_0(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se25_0_24_to_1_s1(uint64 instruction)
+static int64 extract_s__se25_0_24_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 25;
@@ -1607,7 +1587,7 @@ int64 NMD::extract_s__se25_0_24_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_1_0(uint64 instruction)
+static uint64 extract_u_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 2);
@@ -1615,7 +1595,7 @@ uint64 NMD::extract_u_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_8__s2(uint64 instruction)
+static uint64 extract_u_3_8__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 1) << 3;
@@ -1624,7 +1604,7 @@ uint64 NMD::extract_u_3_8__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_fd_15_14_13_12_11(uint64 instruction)
+static uint64 extract_fd_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1632,7 +1612,7 @@ uint64 NMD::extract_fd_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5) << 2;
@@ -1640,7 +1620,7 @@ uint64 NMD::extract_u_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz4_9_7_6_5(uint64 instruction)
+static uint64 extract_rtz4_9_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 3);
@@ -1649,7 +1629,7 @@ uint64 NMD::extract_rtz4_9_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sel_15_14_13_12_11(uint64 instruction)
+static uint64 extract_sel_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1657,7 +1637,7 @@ uint64 NMD::extract_sel_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ct_25_24_23_22_21(uint64 instruction)
+static uint64 extract_ct_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1665,7 +1645,7 @@ uint64 NMD::extract_ct_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_to_2__s2(uint64 instruction)
+static uint64 extract_u_20_to_2__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 19) << 2;
@@ -1673,7 +1653,7 @@ uint64 NMD::extract_u_20_to_2__s2(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se3_4_2_1_0(uint64 instruction)
+static int64 extract_s__se3_4_2_1_0(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1683,7 +1663,7 @@ int64 NMD::extract_s__se3_4_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_2_1_0__s1(uint64 instruction)
+static uint64 extract_u_3_2_1_0__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4) << 1;
diff --git a/disas/nanomips.h b/disas/nanomips.h
index fcd41c405c..8eca843ef0 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -94,150 +94,6 @@ private:
                     TABLE_ENTRY_TYPE & type, const Pool *table, int table_size,
                     Dis_info *info);
 
-    uint64 renumber_registers(uint64 index, uint64 *register_list,
-                              size_t register_list_size);
-
-    uint64 decode_gpr_gpr4(uint64 d);
-    uint64 decode_gpr_gpr4_zero(uint64 d);
-    uint64 decode_gpr_gpr3(uint64 d);
-    uint64 decode_gpr_gpr3_src_store(uint64 d);
-    uint64 decode_gpr_gpr2_reg1(uint64 d);
-    uint64 decode_gpr_gpr2_reg2(uint64 d);
-    uint64 decode_gpr_gpr1(uint64 d);
-
-    uint64 copy(uint64 d);
-    int64 copy(int64 d);
-    int64 neg_copy(uint64 d);
-    int64 neg_copy(int64 d);
-    uint64 encode_rs3_and_check_rs3_ge_rt3(uint64 d);
-    uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d);
-    uint64 encode_s_from_address(uint64 d);
-    uint64 encode_u_from_address(uint64 d);
-    uint64 encode_s_from_s_hi(uint64 d);
-    uint64 encode_count3_from_count(uint64 d);
-    uint64 encode_shift3_from_shift(uint64 d);
-    int64 encode_eu_from_s_li16(uint64 d);
-    uint64 encode_msbd_from_size(uint64 d);
-    uint64 encode_eu_from_u_andi16(uint64 d);
-
-    uint64 encode_msbd_from_pos_and_size(uint64 d);
-
-    uint64 encode_rt1_from_rt(uint64 d);
-    uint64 encode_lsb_from_pos_and_size(uint64 d);
-
-    std::string save_restore_list(uint64 rt, uint64 count, uint64 gp);
-
-    std::string GPR(uint64 reg);
-    std::string FPR(uint64 reg);
-    std::string AC(uint64 reg);
-    std::string IMMEDIATE(uint64 value);
-    std::string IMMEDIATE(int64 value);
-    std::string CPR(uint64 reg);
-    std::string ADDRESS(uint64 value, int instruction_size, Dis_info *info);
-
-    int64 extract_s__se3_4_2_1_0(uint64 instruction);
-    int64 extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction);
-    int64 extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction);
-    int64 extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction);
-    int64 extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction);
-    int64 extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction);
-    int64 extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction);
-    int64 extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction);
-    int64 extract_s__se14_0_13_to_1_s1(uint64 instruction);
-    int64 extract_s__se21_0_20_to_1_s1(uint64 instruction);
-    int64 extract_s__se25_0_24_to_1_s1(uint64 instruction);
-    int64 extract_s__se31_15_to_0_31_to_16(uint64 instruction);
-    int64 extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction);
-    int64 extract_shift__se5_21_20_19_18_17_16(uint64 instruction);
-
-    uint64 extract_ac_15_14(uint64 instruction);
-    uint64 extract_bit_16_15_14_13_12_11(uint64 instruction);
-    uint64 extract_bit_23_22_21(uint64 instruction);
-    uint64 extract_c0s_20_19_18_17_16(uint64 instruction);
-    uint64 extract_code_17_to_0(uint64 instruction);
-    uint64 extract_code_18_to_0(uint64 instruction);
-    uint64 extract_code_1_0(uint64 instruction);
-    uint64 extract_code_2_1_0(uint64 instruction);
-    uint64 extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction);
-    uint64 extract_cofun_25_24_23(uint64 instruction);
-    uint64 extract_count3_14_13_12(uint64 instruction);
-    uint64 extract_count_3_2_1_0(uint64 instruction);
-    uint64 extract_count_19_18_17_16(uint64 instruction);
-    uint64 extract_cs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_cs_25_24_23_22_21(uint64 instruction);
-    uint64 extract_ct_25_24_23_22_21(uint64 instruction);
-    uint64 extract_eu_3_2_1_0(uint64 instruction);
-    uint64 extract_eu_6_5_4_3_2_1_0(uint64 instruction);
-    uint64 extract_fd_15_14_13_12_11(uint64 instruction);
-    uint64 extract_fs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_ft_15_14_13_12_11(uint64 instruction);
-    uint64 extract_ft_25_24_23_22_21(uint64 instruction);
-    uint64 extract_gp_2(uint64 instruction);
-    uint64 extract_hint_25_24_23_22_21(uint64 instruction);
-    uint64 extract_hs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_lsb_4_3_2_1_0(uint64 instruction);
-    uint64 extract_mask_20_19_18_17_16_15_14(uint64 instruction);
-    uint64 extract_msbt_10_9_8_7_6(uint64 instruction);
-    uint64 extract_op_25_24_23_22_21(uint64 instruction);
-    uint64 extract_op_25_to_3(uint64 instruction);
-    uint64 extract_rdl_25_24(uint64 instruction);
-    uint64 extract_rd2_3_8(uint64 instruction);
-    uint64 extract_rd3_3_2_1(uint64 instruction);
-    uint64 extract_rd_15_14_13_12_11(uint64 instruction);
-    uint64 extract_rs3_6_5_4(uint64 instruction);
-    uint64 extract_rs4_4_2_1_0(uint64 instruction);
-    uint64 extract_rs_4_3_2_1_0(uint64 instruction);
-    uint64 extract_rs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_rsz4_4_2_1_0(uint64 instruction);
-    uint64 extract_rtl_11(uint64 instruction);
-    uint64 extract_rt3_9_8_7(uint64 instruction);
-    uint64 extract_rt4_9_7_6_5(uint64 instruction);
-    uint64 extract_rt_25_24_23_22_21(uint64 instruction);
-    uint64 extract_rt_41_40_39_38_37(uint64 instruction);
-    uint64 extract_rt_9_8_7_6_5(uint64 instruction);
-    uint64 extract_rtz3_9_8_7(uint64 instruction);
-    uint64 extract_rtz4_27_26_25_23_22_21(uint64 instruction);
-    uint64 extract_rtz4_9_7_6_5(uint64 instruction);
-    uint64 extract_ru_7_6_5_4_3(uint64 instruction);
-    uint64 extract_sa_15_14_13_12_11(uint64 instruction);
-    uint64 extract_sa_15_14_13_12(uint64 instruction);
-    uint64 extract_sa_15_14_13(uint64 instruction);
-    uint64 extract_sel_13_12_11(uint64 instruction);
-    uint64 extract_sel_15_14_13_12_11(uint64 instruction);
-    uint64 extract_shift3_2_1_0(uint64 instruction);
-    uint64 extract_shift_4_3_2_1_0(uint64 instruction);
-    uint64 extract_shift_5_4_3_2_1_0(uint64 instruction);
-    uint64 extract_shift_20_19_18_17_16(uint64 instruction);
-    uint64 extract_shift_10_9_8_7_6(uint64 instruction);
-    uint64 extract_shiftx_11_10_9_8_7_6(uint64 instruction);
-    uint64 extract_shiftx_10_9_8_7__s1(uint64 instruction);
-    uint64 extract_size_20_19_18_17_16(uint64 instruction);
-    uint64 extract_stripe_6(uint64 instruction);
-    uint64 extract_stype_20_19_18_17_16(uint64 instruction);
-    uint64 extract_u2_10_9(uint64 instruction);
-    uint64 extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction);
-    uint64 extract_u_15_to_0(uint64 instruction);
-    uint64 extract_u_17_to_0(uint64 instruction);
-    uint64 extract_u_1_0(uint64 instruction);
-    uint64 extract_u_3_2_1_0__s1(uint64 instruction);
-    uint64 extract_u_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_4_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_5_4_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_6_5_4_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_31_to_0__s32(uint64 instruction);
-    uint64 extract_u_10(uint64 instruction);
-    uint64 extract_u_17_16_15_14_13_12_11(uint64 instruction);
-    uint64 extract_u_20_19_18_17_16_15_14_13(uint64 instruction);
-    uint64 extract_u_17_to_1__s1(uint64 instruction);
-    uint64 extract_u_2_1__s1(uint64 instruction);
-    uint64 extract_u_17_to_2__s2(uint64 instruction);
-    uint64 extract_u_20_to_2__s2(uint64 instruction);
-    uint64 extract_u_20_to_3__s3(uint64 instruction);
-    uint64 extract_u_3_8__s2(uint64 instruction);
-    uint64 extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction);
-    uint64 extract_u_7_6_5_4__s4(uint64 instruction);
-
     bool ADDIU_32__cond(uint64 instruction);
     bool ADDIU_RS5__cond(uint64 instruction);
     bool BALRSC_cond(uint64 instruction);
-- 
2.37.3


