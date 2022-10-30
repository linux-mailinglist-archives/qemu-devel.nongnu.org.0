Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE41612D64
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:32:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGpZ-0004VO-PQ; Sun, 30 Oct 2022 18:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpQ-0004A0-Ne
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpL-0007zc-0q
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id cl5so2016342wrb.9
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8n/CsfBfKGRo118iiLxjXIB926yadTMrmqLQleBWZr4=;
 b=qlCpk9j5ajc4XaFgug4IMgN49g1+q4RUDjwp8yk0MfaUug+otnlsRDpCEMYTLyGVYz
 CLC9RqdT/BWlTNhjPQl/N6iSyTlmivQPaaB6IQhYxC0itgPI0GyrYfqFZ97hxzFb9iFX
 6PW7WqkgT+jbzkTA43IHmKmn8sGQrMFM18PMK3/dJ1LbY/1dsx11kNbWlzIiVcVVfEd2
 +R0FTRxEkdgNsYMp3tca4zuDXSvMxPrzW0YDKQ/lfyiQIDxwSDwzhdeZwXKXt47gbjcp
 67jsRLtxkHWuIZpCTaosMHWnhignYFwusA5BkDyWIXPRQl8XJkwAdZglMgCeHP4BRI/S
 r7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8n/CsfBfKGRo118iiLxjXIB926yadTMrmqLQleBWZr4=;
 b=mcqIQ3BxcV107dJR3Chw6rrRCPIjWvRtprJJwXRaj5ABb7IT2xmEI/WFbuHbQtmLke
 bM35WvTpYonw2vTX4dEklyHbWJjB2uAoj0UDpoqFX6Lk5WEOIKkRZPa9qy3eh6UUefHZ
 igdsxntxuYqGUiPGVYp5cTyRyNIBzqXaFKVpyPUVH24XZ+6gqyaIlPZ4XGEfy/r/VbAK
 Ii54aqnRCe6DMr9oh5kZLc2LFgvN6LJ2DHeL9NaYclbS5AyeiljuUXRiz4D+U5W24N4N
 GuVfqCzz8hWuRJBTkscuynRG/voDGYNrRw1kc58XYI6aIPtsUbYhYE9druqkY6Jm7LCn
 M5ag==
X-Gm-Message-State: ACrzQf1bWPYodmQItxh6brREJmAhzjfREEGbracmXsb5aDINle/rFi2Y
 62xgKpuzt/DD15ftUi4fpKF5Bl70n74GaA==
X-Google-Smtp-Source: AMsMyM5TbCyuYXRmTXPOm0bEYDjyc9ShG8lT6GXwM6xAEEA+1MD6a9tU+z9C2066rrBLB/yCBOp5oA==
X-Received: by 2002:a5d:64a3:0:b0:231:f82e:9a57 with SMTP id
 m3-20020a5d64a3000000b00231f82e9a57mr6144002wrp.492.1667169044342; 
 Sun, 30 Oct 2022 15:30:44 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c3b8a00b003cf71b1f66csm1128596wms.0.2022.10.30.15.30.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:30:43 -0700 (PDT)
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
Subject: [PULL 18/55] disas/nanomips: Delete NMD class second field
Date: Sun, 30 Oct 2022 23:28:04 +0100
Message-Id: <20221030222841.42377-19-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

We're deleting the m_pc field of the NMD class. It's now part of the
Dis_info struct that this patch introduces. Currently, the Dis_info
struct has just one field, m_pc, which we need for address calculation
in the ADDRESS function.

We're filling Dis_info at the entrance of the nanoMIPS disassembler.
I.e. print_insn_nanomips. Next, we're adding that information as an
argument wherever we need to.

Since NMD class now has no more fields, the NMD constructor is
also deleted.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-5-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 1368 ++++++++++++++++++++++----------------------
 disas/nanomips.h   | 1292 +++++++++++++++++++++--------------------
 2 files changed, 1331 insertions(+), 1329 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 721ca3f52b..9005f26ee3 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -42,7 +42,7 @@
 
 
 int nanomips_dis(char *buf,
-                 unsigned address,
+                 Dis_info *info,
                  unsigned short one,
                  unsigned short two,
                  unsigned short three)
@@ -51,8 +51,8 @@ int nanomips_dis(char *buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    NMD d(address);
-    int size = d.Disassemble(bits, disasm, type);
+    NMD d;
+    int size = d.Disassemble(bits, disasm, type, info);
 
     strcpy(buf, disasm.c_str());
     return size;
@@ -74,6 +74,9 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     info->target = 0;
     info->target2 = 0;
 
+    Dis_info disassm_info;
+    disassm_info.m_pc = memaddr;
+
     status = (*info->read_memory_func)(memaddr, buffer, 2, info);
     if (status != 0) {
         (*info->memory_error_func)(status, memaddr, info);
@@ -122,7 +125,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         (*info->fprintf_func)(info->stream, "     ");
     }
 
-    int length = nanomips_dis(buf, memaddr, insn1, insn2, insn3);
+    int length = nanomips_dis(buf, &disassm_info, insn1, insn2, insn3);
 
     /* FIXME: Should probably use a hash table on the major opcode here.  */
 
@@ -747,10 +750,10 @@ std::string NMD::CPR(uint64 reg)
 }
 
 
-std::string NMD::ADDRESS(uint64 value, int instruction_size)
+std::string NMD::ADDRESS(uint64 value, int instruction_size, Dis_info *info)
 {
     /* token for string replace */
-    img_address address = m_pc + value + instruction_size;
+    img_address address = info->m_pc + value + instruction_size;
     /* symbol replacement */
     return to_string(address);
 }
@@ -772,9 +775,9 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
 
 
 int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     TABLE_ENTRY_TYPE & type)
+                     TABLE_ENTRY_TYPE & type, Dis_info *info)
 {
-    return Disassemble(data, dis, type, MAJOR, 2);
+    return Disassemble(data, dis, type, MAJOR, 2, info);
 }
 
 
@@ -791,7 +794,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
  */
 int NMD::Disassemble(const uint16 * data, std::string & dis,
                      TABLE_ENTRY_TYPE & type, const Pool *table,
-                     int table_size)
+                     int table_size, Dis_info *info)
 {
     try
     {
@@ -807,7 +810,8 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
                         if (table[i].type == pool) {
                             return Disassemble(data, dis, type,
                                                table[i].next_table,
-                                               table[i].next_table_size);
+                                               table[i].next_table_size,
+                                               info);
                         } else if ((table[i].type == instruction) ||
                                    (table[i].type == call_instruction) ||
                                    (table[i].type == branch_instruction) ||
@@ -818,7 +822,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
                                 return -6;
                             }
                             type = table[i].type;
-                            dis = (this->*dis_fn)(op_code);
+                            dis = (this->*dis_fn)(op_code, info);
                             return table[i].instructions_size;
                         } else {
                             dis = "reserved instruction";
@@ -1773,7 +1777,7 @@ bool NMD::SLTU_cond(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ABS_D(uint64 instruction)
+std::string NMD::ABS_D(uint64 instruction, Dis_info *info)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1795,7 +1799,7 @@ std::string NMD::ABS_D(uint64 instruction)
  *               fd -----
  *                    fs -----
  */
-std::string NMD::ABS_S(uint64 instruction)
+std::string NMD::ABS_S(uint64 instruction, Dis_info *info)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1817,7 +1821,7 @@ std::string NMD::ABS_S(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_PH(uint64 instruction)
+std::string NMD::ABSQ_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1839,7 +1843,7 @@ std::string NMD::ABSQ_S_PH(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_QB(uint64 instruction)
+std::string NMD::ABSQ_S_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1861,7 +1865,7 @@ std::string NMD::ABSQ_S_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_W(uint64 instruction)
+std::string NMD::ABSQ_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1882,7 +1886,7 @@ std::string NMD::ABSQ_S_W(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ACLR(uint64 instruction)
+std::string NMD::ACLR(uint64 instruction, Dis_info *info)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1905,7 +1909,7 @@ std::string NMD::ACLR(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADD(uint64 instruction)
+std::string NMD::ADD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1930,7 +1934,7 @@ std::string NMD::ADD(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ADD_D(uint64 instruction)
+std::string NMD::ADD_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1955,7 +1959,7 @@ std::string NMD::ADD_D(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ADD_S(uint64 instruction)
+std::string NMD::ADD_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1978,7 +1982,7 @@ std::string NMD::ADD_S(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_32_(uint64 instruction)
+std::string NMD::ADDIU_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2001,7 +2005,7 @@ std::string NMD::ADDIU_32_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_48_(uint64 instruction)
+std::string NMD::ADDIU_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -2022,7 +2026,7 @@ std::string NMD::ADDIU_48_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP48_(uint64 instruction)
+std::string NMD::ADDIU_GP48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -2043,7 +2047,7 @@ std::string NMD::ADDIU_GP48_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP_B_(uint64 instruction)
+std::string NMD::ADDIU_GP_B_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -2064,7 +2068,7 @@ std::string NMD::ADDIU_GP_B_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP_W_(uint64 instruction)
+std::string NMD::ADDIU_GP_W_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -2085,7 +2089,7 @@ std::string NMD::ADDIU_GP_W_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_NEG_(uint64 instruction)
+std::string NMD::ADDIU_NEG_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2108,7 +2112,7 @@ std::string NMD::ADDIU_NEG_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_R1_SP_(uint64 instruction)
+std::string NMD::ADDIU_R1_SP_(uint64 instruction, Dis_info *info)
 {
     uint64 u_value = extract_u_5_4_3_2_1_0__s2(instruction);
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
@@ -2129,7 +2133,7 @@ std::string NMD::ADDIU_R1_SP_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_R2_(uint64 instruction)
+std::string NMD::ADDIU_R2_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2151,7 +2155,7 @@ std::string NMD::ADDIU_R2_(uint64 instruction)
  *     rt -----
  *           s - ---
  */
-std::string NMD::ADDIU_RS5_(uint64 instruction)
+std::string NMD::ADDIU_RS5_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
@@ -2173,13 +2177,13 @@ std::string NMD::ADDIU_RS5_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDIUPC_32_(uint64 instruction)
+std::string NMD::ADDIUPC_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2195,13 +2199,13 @@ std::string NMD::ADDIUPC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDIUPC_48_(uint64 instruction)
+std::string NMD::ADDIUPC_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 6, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2217,7 +2221,7 @@ std::string NMD::ADDIUPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_PH(uint64 instruction)
+std::string NMD::ADDQ_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2242,7 +2246,7 @@ std::string NMD::ADDQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_S_PH(uint64 instruction)
+std::string NMD::ADDQ_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2266,7 +2270,7 @@ std::string NMD::ADDQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_S_W(uint64 instruction)
+std::string NMD::ADDQ_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2291,7 +2295,7 @@ std::string NMD::ADDQ_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_PH(uint64 instruction)
+std::string NMD::ADDQH_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2316,7 +2320,7 @@ std::string NMD::ADDQH_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_R_PH(uint64 instruction)
+std::string NMD::ADDQH_R_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2341,7 +2345,7 @@ std::string NMD::ADDQH_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_R_W(uint64 instruction)
+std::string NMD::ADDQH_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2366,7 +2370,7 @@ std::string NMD::ADDQH_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_W(uint64 instruction)
+std::string NMD::ADDQH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2390,7 +2394,7 @@ std::string NMD::ADDQH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDSC(uint64 instruction)
+std::string NMD::ADDSC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2413,7 +2417,7 @@ std::string NMD::ADDSC(uint64 instruction)
  *       rs3 ---
  *          rd3 ---
  */
-std::string NMD::ADDU_16_(uint64 instruction)
+std::string NMD::ADDU_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2437,7 +2441,7 @@ std::string NMD::ADDU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_32_(uint64 instruction)
+std::string NMD::ADDU_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2461,7 +2465,7 @@ std::string NMD::ADDU_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_4X4_(uint64 instruction)
+std::string NMD::ADDU_4X4_(uint64 instruction, Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -2483,7 +2487,7 @@ std::string NMD::ADDU_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_PH(uint64 instruction)
+std::string NMD::ADDU_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2507,7 +2511,7 @@ std::string NMD::ADDU_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_QB(uint64 instruction)
+std::string NMD::ADDU_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2532,7 +2536,7 @@ std::string NMD::ADDU_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_S_PH(uint64 instruction)
+std::string NMD::ADDU_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2556,7 +2560,7 @@ std::string NMD::ADDU_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_S_QB(uint64 instruction)
+std::string NMD::ADDU_S_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2581,7 +2585,7 @@ std::string NMD::ADDU_S_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDUH_QB(uint64 instruction)
+std::string NMD::ADDUH_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2606,7 +2610,7 @@ std::string NMD::ADDUH_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDUH_R_QB(uint64 instruction)
+std::string NMD::ADDUH_R_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2629,7 +2633,7 @@ std::string NMD::ADDUH_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDWC(uint64 instruction)
+std::string NMD::ADDWC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2653,13 +2657,13 @@ std::string NMD::ADDWC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ALUIPC(uint64 instruction)
+std::string NMD::ALUIPC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
@@ -2674,7 +2678,7 @@ std::string NMD::ALUIPC(uint64 instruction)
  *       rs3 ---
  *           eu ----
  */
-std::string NMD::AND_16_(uint64 instruction)
+std::string NMD::AND_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2696,7 +2700,7 @@ std::string NMD::AND_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::AND_32_(uint64 instruction)
+std::string NMD::AND_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2719,7 +2723,7 @@ std::string NMD::AND_32_(uint64 instruction)
  *       rs3 ---
  *           eu ----
  */
-std::string NMD::ANDI_16_(uint64 instruction)
+std::string NMD::ANDI_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2743,7 +2747,7 @@ std::string NMD::ANDI_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ANDI_32_(uint64 instruction)
+std::string NMD::ANDI_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2767,7 +2771,7 @@ std::string NMD::ANDI_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::APPEND(uint64 instruction)
+std::string NMD::APPEND(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2791,7 +2795,7 @@ std::string NMD::APPEND(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ASET(uint64 instruction)
+std::string NMD::ASET(uint64 instruction, Dis_info *info)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2815,11 +2819,11 @@ std::string NMD::ASET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALC_16_(uint64 instruction)
+std::string NMD::BALC_16_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 2, info);
 
     return img_format("BALC %s", s);
 }
@@ -2835,11 +2839,11 @@ std::string NMD::BALC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALC_32_(uint64 instruction)
+std::string NMD::BALC_32_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BALC %s", s);
 }
@@ -2855,7 +2859,7 @@ std::string NMD::BALC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALRSC(uint64 instruction)
+std::string NMD::BALRSC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2877,7 +2881,7 @@ std::string NMD::BALRSC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BBEQZC(uint64 instruction)
+std::string NMD::BBEQZC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
@@ -2885,7 +2889,7 @@ std::string NMD::BBEQZC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BBEQZC %s, %s, %s", rt, bit, s);
 }
@@ -2901,7 +2905,7 @@ std::string NMD::BBEQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BBNEZC(uint64 instruction)
+std::string NMD::BBNEZC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
@@ -2909,7 +2913,7 @@ std::string NMD::BBNEZC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BBNEZC %s, %s, %s", rt, bit, s);
 }
@@ -2925,11 +2929,11 @@ std::string NMD::BBNEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC_16_(uint64 instruction)
+std::string NMD::BC_16_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 2, info);
 
     return img_format("BC %s", s);
 }
@@ -2945,11 +2949,11 @@ std::string NMD::BC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC_32_(uint64 instruction)
+std::string NMD::BC_32_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BC %s", s);
 }
@@ -2965,13 +2969,13 @@ std::string NMD::BC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC1EQZC(uint64 instruction)
+std::string NMD::BC1EQZC(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BC1EQZC %s, %s", ft, s);
 }
@@ -2987,13 +2991,13 @@ std::string NMD::BC1EQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC1NEZC(uint64 instruction)
+std::string NMD::BC1NEZC(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BC1NEZC %s, %s", ft, s);
 }
@@ -3009,13 +3013,13 @@ std::string NMD::BC1NEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC2EQZC(uint64 instruction)
+std::string NMD::BC2EQZC(uint64 instruction, Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BC2EQZC %s, %s", ct, s);
 }
@@ -3031,13 +3035,13 @@ std::string NMD::BC2EQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC2NEZC(uint64 instruction)
+std::string NMD::BC2NEZC(uint64 instruction, Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BC2NEZC %s, %s", ct, s);
 }
@@ -3053,7 +3057,7 @@ std::string NMD::BC2NEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQC_16_(uint64 instruction)
+std::string NMD::BEQC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -3061,7 +3065,7 @@ std::string NMD::BEQC_16_(uint64 instruction)
 
     std::string rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2);
+    std::string u = ADDRESS(encode_u_from_address(u_value), 2, info);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
@@ -3077,7 +3081,7 @@ std::string NMD::BEQC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQC_32_(uint64 instruction)
+std::string NMD::BEQC_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3085,7 +3089,7 @@ std::string NMD::BEQC_32_(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
@@ -3101,7 +3105,7 @@ std::string NMD::BEQC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQIC(uint64 instruction)
+std::string NMD::BEQIC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3109,7 +3113,7 @@ std::string NMD::BEQIC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BEQIC %s, %s, %s", rt, u, s);
 }
@@ -3125,13 +3129,13 @@ std::string NMD::BEQIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQZC_16_(uint64 instruction)
+std::string NMD::BEQZC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 2, info);
 
     return img_format("BEQZC %s, %s", rt3, s);
 }
@@ -3147,7 +3151,7 @@ std::string NMD::BEQZC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEC(uint64 instruction)
+std::string NMD::BGEC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3155,7 +3159,7 @@ std::string NMD::BGEC(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
@@ -3171,7 +3175,7 @@ std::string NMD::BGEC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEIC(uint64 instruction)
+std::string NMD::BGEIC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3179,7 +3183,7 @@ std::string NMD::BGEIC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BGEIC %s, %s, %s", rt, u, s);
 }
@@ -3195,7 +3199,7 @@ std::string NMD::BGEIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEIUC(uint64 instruction)
+std::string NMD::BGEIUC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3203,7 +3207,7 @@ std::string NMD::BGEIUC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BGEIUC %s, %s, %s", rt, u, s);
 }
@@ -3219,7 +3223,7 @@ std::string NMD::BGEIUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEUC(uint64 instruction)
+std::string NMD::BGEUC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3227,7 +3231,7 @@ std::string NMD::BGEUC(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
@@ -3243,7 +3247,7 @@ std::string NMD::BGEUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTC(uint64 instruction)
+std::string NMD::BLTC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3251,7 +3255,7 @@ std::string NMD::BLTC(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
@@ -3267,7 +3271,7 @@ std::string NMD::BLTC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTIC(uint64 instruction)
+std::string NMD::BLTIC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3275,7 +3279,7 @@ std::string NMD::BLTIC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BLTIC %s, %s, %s", rt, u, s);
 }
@@ -3291,7 +3295,7 @@ std::string NMD::BLTIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTIUC(uint64 instruction)
+std::string NMD::BLTIUC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3299,7 +3303,7 @@ std::string NMD::BLTIUC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BLTIUC %s, %s, %s", rt, u, s);
 }
@@ -3315,7 +3319,7 @@ std::string NMD::BLTIUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTUC(uint64 instruction)
+std::string NMD::BLTUC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3323,7 +3327,7 @@ std::string NMD::BLTUC(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
@@ -3339,7 +3343,7 @@ std::string NMD::BLTUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEC_16_(uint64 instruction)
+std::string NMD::BNEC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -3347,7 +3351,7 @@ std::string NMD::BNEC_16_(uint64 instruction)
 
     std::string rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2);
+    std::string u = ADDRESS(encode_u_from_address(u_value), 2, info);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
@@ -3363,7 +3367,7 @@ std::string NMD::BNEC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEC_32_(uint64 instruction)
+std::string NMD::BNEC_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3371,7 +3375,7 @@ std::string NMD::BNEC_32_(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
@@ -3387,7 +3391,7 @@ std::string NMD::BNEC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEIC(uint64 instruction)
+std::string NMD::BNEIC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3395,7 +3399,7 @@ std::string NMD::BNEIC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BNEIC %s, %s, %s", rt, u, s);
 }
@@ -3411,13 +3415,13 @@ std::string NMD::BNEIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEZC_16_(uint64 instruction)
+std::string NMD::BNEZC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 2, info);
 
     return img_format("BNEZC %s, %s", rt3, s);
 }
@@ -3433,11 +3437,11 @@ std::string NMD::BNEZC_16_(uint64 instruction)
  *            s[13:1] -------------
  *                           s[14] -
  */
-std::string NMD::BPOSGE32C(uint64 instruction)
+std::string NMD::BPOSGE32C(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("BPOSGE32C %s", s);
 }
@@ -3453,7 +3457,7 @@ std::string NMD::BPOSGE32C(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BREAK_16_(uint64 instruction)
+std::string NMD::BREAK_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
@@ -3473,7 +3477,7 @@ std::string NMD::BREAK_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BREAK_32_(uint64 instruction)
+std::string NMD::BREAK_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -3493,7 +3497,7 @@ std::string NMD::BREAK_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BRSC(uint64 instruction)
+std::string NMD::BRSC(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
@@ -3513,7 +3517,7 @@ std::string NMD::BRSC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CACHE(uint64 instruction)
+std::string NMD::CACHE(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3537,7 +3541,7 @@ std::string NMD::CACHE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CACHEE(uint64 instruction)
+std::string NMD::CACHEE(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3561,7 +3565,7 @@ std::string NMD::CACHEE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_L_D(uint64 instruction)
+std::string NMD::CEIL_L_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3583,7 +3587,7 @@ std::string NMD::CEIL_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_L_S(uint64 instruction)
+std::string NMD::CEIL_L_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3605,7 +3609,7 @@ std::string NMD::CEIL_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_W_D(uint64 instruction)
+std::string NMD::CEIL_W_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3627,7 +3631,7 @@ std::string NMD::CEIL_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_W_S(uint64 instruction)
+std::string NMD::CEIL_W_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3649,7 +3653,7 @@ std::string NMD::CEIL_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CFC1(uint64 instruction)
+std::string NMD::CFC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -3671,7 +3675,7 @@ std::string NMD::CFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CFC2(uint64 instruction)
+std::string NMD::CFC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -3693,7 +3697,7 @@ std::string NMD::CFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLASS_D(uint64 instruction)
+std::string NMD::CLASS_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3715,7 +3719,7 @@ std::string NMD::CLASS_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLASS_S(uint64 instruction)
+std::string NMD::CLASS_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3737,7 +3741,7 @@ std::string NMD::CLASS_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLO(uint64 instruction)
+std::string NMD::CLO(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3759,7 +3763,7 @@ std::string NMD::CLO(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLZ(uint64 instruction)
+std::string NMD::CLZ(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3781,7 +3785,7 @@ std::string NMD::CLZ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_AF_D(uint64 instruction)
+std::string NMD::CMP_AF_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3805,7 +3809,7 @@ std::string NMD::CMP_AF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_AF_S(uint64 instruction)
+std::string NMD::CMP_AF_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3829,7 +3833,7 @@ std::string NMD::CMP_AF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_EQ_D(uint64 instruction)
+std::string NMD::CMP_EQ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3852,7 +3856,7 @@ std::string NMD::CMP_EQ_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_EQ_PH(uint64 instruction)
+std::string NMD::CMP_EQ_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3874,7 +3878,7 @@ std::string NMD::CMP_EQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_EQ_S(uint64 instruction)
+std::string NMD::CMP_EQ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3898,7 +3902,7 @@ std::string NMD::CMP_EQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LE_D(uint64 instruction)
+std::string NMD::CMP_LE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3921,7 +3925,7 @@ std::string NMD::CMP_LE_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_LE_PH(uint64 instruction)
+std::string NMD::CMP_LE_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3943,7 +3947,7 @@ std::string NMD::CMP_LE_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LE_S(uint64 instruction)
+std::string NMD::CMP_LE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3967,7 +3971,7 @@ std::string NMD::CMP_LE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LT_D(uint64 instruction)
+std::string NMD::CMP_LT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3990,7 +3994,7 @@ std::string NMD::CMP_LT_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_LT_PH(uint64 instruction)
+std::string NMD::CMP_LT_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4012,7 +4016,7 @@ std::string NMD::CMP_LT_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LT_S(uint64 instruction)
+std::string NMD::CMP_LT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4036,7 +4040,7 @@ std::string NMD::CMP_LT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_NE_D(uint64 instruction)
+std::string NMD::CMP_NE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4060,7 +4064,7 @@ std::string NMD::CMP_NE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_NE_S(uint64 instruction)
+std::string NMD::CMP_NE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4084,7 +4088,7 @@ std::string NMD::CMP_NE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_OR_D(uint64 instruction)
+std::string NMD::CMP_OR_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4108,7 +4112,7 @@ std::string NMD::CMP_OR_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_OR_S(uint64 instruction)
+std::string NMD::CMP_OR_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4132,7 +4136,7 @@ std::string NMD::CMP_OR_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SAF_D(uint64 instruction)
+std::string NMD::CMP_SAF_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4156,7 +4160,7 @@ std::string NMD::CMP_SAF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SAF_S(uint64 instruction)
+std::string NMD::CMP_SAF_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4180,7 +4184,7 @@ std::string NMD::CMP_SAF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SEQ_D(uint64 instruction)
+std::string NMD::CMP_SEQ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4204,7 +4208,7 @@ std::string NMD::CMP_SEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SEQ_S(uint64 instruction)
+std::string NMD::CMP_SEQ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4228,7 +4232,7 @@ std::string NMD::CMP_SEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLE_D(uint64 instruction)
+std::string NMD::CMP_SLE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4252,7 +4256,7 @@ std::string NMD::CMP_SLE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLE_S(uint64 instruction)
+std::string NMD::CMP_SLE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4276,7 +4280,7 @@ std::string NMD::CMP_SLE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLT_D(uint64 instruction)
+std::string NMD::CMP_SLT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4300,7 +4304,7 @@ std::string NMD::CMP_SLT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLT_S(uint64 instruction)
+std::string NMD::CMP_SLT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4324,7 +4328,7 @@ std::string NMD::CMP_SLT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SNE_D(uint64 instruction)
+std::string NMD::CMP_SNE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4348,7 +4352,7 @@ std::string NMD::CMP_SNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SNE_S(uint64 instruction)
+std::string NMD::CMP_SNE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4372,7 +4376,7 @@ std::string NMD::CMP_SNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SOR_D(uint64 instruction)
+std::string NMD::CMP_SOR_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4396,7 +4400,7 @@ std::string NMD::CMP_SOR_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SOR_S(uint64 instruction)
+std::string NMD::CMP_SOR_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4420,7 +4424,7 @@ std::string NMD::CMP_SOR_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUEQ_D(uint64 instruction)
+std::string NMD::CMP_SUEQ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4444,7 +4448,7 @@ std::string NMD::CMP_SUEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUEQ_S(uint64 instruction)
+std::string NMD::CMP_SUEQ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4468,7 +4472,7 @@ std::string NMD::CMP_SUEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULE_D(uint64 instruction)
+std::string NMD::CMP_SULE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4492,7 +4496,7 @@ std::string NMD::CMP_SULE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULE_S(uint64 instruction)
+std::string NMD::CMP_SULE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4516,7 +4520,7 @@ std::string NMD::CMP_SULE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULT_D(uint64 instruction)
+std::string NMD::CMP_SULT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4540,7 +4544,7 @@ std::string NMD::CMP_SULT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULT_S(uint64 instruction)
+std::string NMD::CMP_SULT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4564,7 +4568,7 @@ std::string NMD::CMP_SULT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUN_D(uint64 instruction)
+std::string NMD::CMP_SUN_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4588,7 +4592,7 @@ std::string NMD::CMP_SUN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUNE_D(uint64 instruction)
+std::string NMD::CMP_SUNE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4612,7 +4616,7 @@ std::string NMD::CMP_SUNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUNE_S(uint64 instruction)
+std::string NMD::CMP_SUNE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4636,7 +4640,7 @@ std::string NMD::CMP_SUNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUN_S(uint64 instruction)
+std::string NMD::CMP_SUN_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4660,7 +4664,7 @@ std::string NMD::CMP_SUN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UEQ_D(uint64 instruction)
+std::string NMD::CMP_UEQ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4684,7 +4688,7 @@ std::string NMD::CMP_UEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UEQ_S(uint64 instruction)
+std::string NMD::CMP_UEQ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4708,7 +4712,7 @@ std::string NMD::CMP_UEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULE_D(uint64 instruction)
+std::string NMD::CMP_ULE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4732,7 +4736,7 @@ std::string NMD::CMP_ULE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULE_S(uint64 instruction)
+std::string NMD::CMP_ULE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4756,7 +4760,7 @@ std::string NMD::CMP_ULE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULT_D(uint64 instruction)
+std::string NMD::CMP_ULT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4780,7 +4784,7 @@ std::string NMD::CMP_ULT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULT_S(uint64 instruction)
+std::string NMD::CMP_ULT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4804,7 +4808,7 @@ std::string NMD::CMP_ULT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UN_D(uint64 instruction)
+std::string NMD::CMP_UN_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4828,7 +4832,7 @@ std::string NMD::CMP_UN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UNE_D(uint64 instruction)
+std::string NMD::CMP_UNE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4852,7 +4856,7 @@ std::string NMD::CMP_UNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UNE_S(uint64 instruction)
+std::string NMD::CMP_UNE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4876,7 +4880,7 @@ std::string NMD::CMP_UNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UN_S(uint64 instruction)
+std::string NMD::CMP_UN_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4901,7 +4905,7 @@ std::string NMD::CMP_UN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_EQ_QB(uint64 instruction)
+std::string NMD::CMPGDU_EQ_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4926,7 +4930,7 @@ std::string NMD::CMPGDU_EQ_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_LE_QB(uint64 instruction)
+std::string NMD::CMPGDU_LE_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4951,7 +4955,7 @@ std::string NMD::CMPGDU_LE_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_LT_QB(uint64 instruction)
+std::string NMD::CMPGDU_LT_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4976,7 +4980,7 @@ std::string NMD::CMPGDU_LT_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_EQ_QB(uint64 instruction)
+std::string NMD::CMPGU_EQ_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5001,7 +5005,7 @@ std::string NMD::CMPGU_EQ_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_LE_QB(uint64 instruction)
+std::string NMD::CMPGU_LE_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5026,7 +5030,7 @@ std::string NMD::CMPGU_LE_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_LT_QB(uint64 instruction)
+std::string NMD::CMPGU_LT_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5050,7 +5054,7 @@ std::string NMD::CMPGU_LT_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_EQ_QB(uint64 instruction)
+std::string NMD::CMPU_EQ_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5072,7 +5076,7 @@ std::string NMD::CMPU_EQ_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_LE_QB(uint64 instruction)
+std::string NMD::CMPU_LE_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5094,7 +5098,7 @@ std::string NMD::CMPU_LE_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_LT_QB(uint64 instruction)
+std::string NMD::CMPU_LT_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5116,7 +5120,7 @@ std::string NMD::CMPU_LT_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::COP2_1(uint64 instruction)
+std::string NMD::COP2_1(uint64 instruction, Dis_info *info)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
@@ -5136,7 +5140,7 @@ std::string NMD::COP2_1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CTC1(uint64 instruction)
+std::string NMD::CTC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -5158,7 +5162,7 @@ std::string NMD::CTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CTC2(uint64 instruction)
+std::string NMD::CTC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -5180,7 +5184,7 @@ std::string NMD::CTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_L(uint64 instruction)
+std::string NMD::CVT_D_L(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5202,7 +5206,7 @@ std::string NMD::CVT_D_L(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_S(uint64 instruction)
+std::string NMD::CVT_D_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5224,7 +5228,7 @@ std::string NMD::CVT_D_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_W(uint64 instruction)
+std::string NMD::CVT_D_W(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5246,7 +5250,7 @@ std::string NMD::CVT_D_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_L_D(uint64 instruction)
+std::string NMD::CVT_L_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5268,7 +5272,7 @@ std::string NMD::CVT_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_L_S(uint64 instruction)
+std::string NMD::CVT_L_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5290,7 +5294,7 @@ std::string NMD::CVT_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_D(uint64 instruction)
+std::string NMD::CVT_S_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5312,7 +5316,7 @@ std::string NMD::CVT_S_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_L(uint64 instruction)
+std::string NMD::CVT_S_L(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5334,7 +5338,7 @@ std::string NMD::CVT_S_L(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_PL(uint64 instruction)
+std::string NMD::CVT_S_PL(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5356,7 +5360,7 @@ std::string NMD::CVT_S_PL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_PU(uint64 instruction)
+std::string NMD::CVT_S_PU(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5378,7 +5382,7 @@ std::string NMD::CVT_S_PU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_W(uint64 instruction)
+std::string NMD::CVT_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5400,7 +5404,7 @@ std::string NMD::CVT_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_W_D(uint64 instruction)
+std::string NMD::CVT_W_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5422,7 +5426,7 @@ std::string NMD::CVT_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_W_S(uint64 instruction)
+std::string NMD::CVT_W_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5444,7 +5448,7 @@ std::string NMD::CVT_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_48_(uint64 instruction)
+std::string NMD::DADDIU_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -5466,7 +5470,7 @@ std::string NMD::DADDIU_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_NEG_(uint64 instruction)
+std::string NMD::DADDIU_NEG_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5490,7 +5494,7 @@ std::string NMD::DADDIU_NEG_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_U12_(uint64 instruction)
+std::string NMD::DADDIU_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5514,7 +5518,7 @@ std::string NMD::DADDIU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADD(uint64 instruction)
+std::string NMD::DADD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5538,7 +5542,7 @@ std::string NMD::DADD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDU(uint64 instruction)
+std::string NMD::DADDU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5562,7 +5566,7 @@ std::string NMD::DADDU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DCLO(uint64 instruction)
+std::string NMD::DCLO(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5584,7 +5588,7 @@ std::string NMD::DCLO(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DCLZ(uint64 instruction)
+std::string NMD::DCLZ(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5606,7 +5610,7 @@ std::string NMD::DCLZ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DDIV(uint64 instruction)
+std::string NMD::DDIV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5630,7 +5634,7 @@ std::string NMD::DDIV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DDIVU(uint64 instruction)
+std::string NMD::DDIVU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5654,7 +5658,7 @@ std::string NMD::DDIVU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DERET(uint64 instruction)
+std::string NMD::DERET(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -5672,7 +5676,7 @@ std::string NMD::DERET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXTM(uint64 instruction)
+std::string NMD::DEXTM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5698,7 +5702,7 @@ std::string NMD::DEXTM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXT(uint64 instruction)
+std::string NMD::DEXT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5724,7 +5728,7 @@ std::string NMD::DEXT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXTU(uint64 instruction)
+std::string NMD::DEXTU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5750,7 +5754,7 @@ std::string NMD::DEXTU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINSM(uint64 instruction)
+std::string NMD::DINSM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5778,7 +5782,7 @@ std::string NMD::DINSM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINS(uint64 instruction)
+std::string NMD::DINS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5806,7 +5810,7 @@ std::string NMD::DINS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINSU(uint64 instruction)
+std::string NMD::DINSU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5834,7 +5838,7 @@ std::string NMD::DINSU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DI(uint64 instruction)
+std::string NMD::DI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -5854,7 +5858,7 @@ std::string NMD::DI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV(uint64 instruction)
+std::string NMD::DIV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5878,7 +5882,7 @@ std::string NMD::DIV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV_D(uint64 instruction)
+std::string NMD::DIV_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5902,7 +5906,7 @@ std::string NMD::DIV_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV_S(uint64 instruction)
+std::string NMD::DIV_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5926,7 +5930,7 @@ std::string NMD::DIV_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIVU(uint64 instruction)
+std::string NMD::DIVU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5950,7 +5954,7 @@ std::string NMD::DIVU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DLSA(uint64 instruction)
+std::string NMD::DLSA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5976,7 +5980,7 @@ std::string NMD::DLSA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DLUI_48_(uint64 instruction)
+std::string NMD::DLUI_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
@@ -5998,7 +6002,7 @@ std::string NMD::DLUI_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC0(uint64 instruction)
+std::string NMD::DMFC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6022,7 +6026,7 @@ std::string NMD::DMFC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC1(uint64 instruction)
+std::string NMD::DMFC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -6044,7 +6048,7 @@ std::string NMD::DMFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC2(uint64 instruction)
+std::string NMD::DMFC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -6066,7 +6070,7 @@ std::string NMD::DMFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFGC0(uint64 instruction)
+std::string NMD::DMFGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6090,7 +6094,7 @@ std::string NMD::DMFGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMOD(uint64 instruction)
+std::string NMD::DMOD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6114,7 +6118,7 @@ std::string NMD::DMOD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMODU(uint64 instruction)
+std::string NMD::DMODU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6138,7 +6142,7 @@ std::string NMD::DMODU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC0(uint64 instruction)
+std::string NMD::DMTC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6162,7 +6166,7 @@ std::string NMD::DMTC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC1(uint64 instruction)
+std::string NMD::DMTC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -6184,7 +6188,7 @@ std::string NMD::DMTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC2(uint64 instruction)
+std::string NMD::DMTC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -6206,7 +6210,7 @@ std::string NMD::DMTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTGC0(uint64 instruction)
+std::string NMD::DMTGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6230,7 +6234,7 @@ std::string NMD::DMTGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMT(uint64 instruction)
+std::string NMD::DMT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -6250,7 +6254,7 @@ std::string NMD::DMT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUH(uint64 instruction)
+std::string NMD::DMUH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6274,7 +6278,7 @@ std::string NMD::DMUH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUHU(uint64 instruction)
+std::string NMD::DMUHU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6298,7 +6302,7 @@ std::string NMD::DMUHU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUL(uint64 instruction)
+std::string NMD::DMUL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6322,7 +6326,7 @@ std::string NMD::DMUL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMULU(uint64 instruction)
+std::string NMD::DMULU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6347,7 +6351,7 @@ std::string NMD::DMULU(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::DPA_W_PH(uint64 instruction)
+std::string NMD::DPA_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6371,7 +6375,7 @@ std::string NMD::DPA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQ_SA_L_W(uint64 instruction)
+std::string NMD::DPAQ_SA_L_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6395,7 +6399,7 @@ std::string NMD::DPAQ_SA_L_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQ_S_W_PH(uint64 instruction)
+std::string NMD::DPAQ_S_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6419,7 +6423,7 @@ std::string NMD::DPAQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQX_SA_W_PH(uint64 instruction)
+std::string NMD::DPAQX_SA_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6443,7 +6447,7 @@ std::string NMD::DPAQX_SA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQX_S_W_PH(uint64 instruction)
+std::string NMD::DPAQX_S_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6467,7 +6471,7 @@ std::string NMD::DPAQX_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAU_H_QBL(uint64 instruction)
+std::string NMD::DPAU_H_QBL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6491,7 +6495,7 @@ std::string NMD::DPAU_H_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAU_H_QBR(uint64 instruction)
+std::string NMD::DPAU_H_QBR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6515,7 +6519,7 @@ std::string NMD::DPAU_H_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAX_W_PH(uint64 instruction)
+std::string NMD::DPAX_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6539,7 +6543,7 @@ std::string NMD::DPAX_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPS_W_PH(uint64 instruction)
+std::string NMD::DPS_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6563,7 +6567,7 @@ std::string NMD::DPS_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQ_SA_L_W(uint64 instruction)
+std::string NMD::DPSQ_SA_L_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6587,7 +6591,7 @@ std::string NMD::DPSQ_SA_L_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQ_S_W_PH(uint64 instruction)
+std::string NMD::DPSQ_S_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6611,7 +6615,7 @@ std::string NMD::DPSQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQX_SA_W_PH(uint64 instruction)
+std::string NMD::DPSQX_SA_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6635,7 +6639,7 @@ std::string NMD::DPSQX_SA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQX_S_W_PH(uint64 instruction)
+std::string NMD::DPSQX_S_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6659,7 +6663,7 @@ std::string NMD::DPSQX_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSU_H_QBL(uint64 instruction)
+std::string NMD::DPSU_H_QBL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6683,7 +6687,7 @@ std::string NMD::DPSU_H_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSU_H_QBR(uint64 instruction)
+std::string NMD::DPSU_H_QBR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6707,7 +6711,7 @@ std::string NMD::DPSU_H_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSX_W_PH(uint64 instruction)
+std::string NMD::DPSX_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6731,7 +6735,7 @@ std::string NMD::DPSX_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTR(uint64 instruction)
+std::string NMD::DROTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6755,7 +6759,7 @@ std::string NMD::DROTR(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DROTR32(uint64 instruction)
+std::string NMD::DROTR32(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6779,7 +6783,7 @@ std::string NMD::DROTR32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTRV(uint64 instruction)
+std::string NMD::DROTRV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6803,7 +6807,7 @@ std::string NMD::DROTRV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTX(uint64 instruction)
+std::string NMD::DROTX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6829,7 +6833,7 @@ std::string NMD::DROTX(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSLL(uint64 instruction)
+std::string NMD::DSLL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6853,7 +6857,7 @@ std::string NMD::DSLL(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSLL32(uint64 instruction)
+std::string NMD::DSLL32(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6877,7 +6881,7 @@ std::string NMD::DSLL32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSLLV(uint64 instruction)
+std::string NMD::DSLLV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6901,7 +6905,7 @@ std::string NMD::DSLLV(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRA(uint64 instruction)
+std::string NMD::DSRA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6925,7 +6929,7 @@ std::string NMD::DSRA(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRA32(uint64 instruction)
+std::string NMD::DSRA32(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6949,7 +6953,7 @@ std::string NMD::DSRA32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSRAV(uint64 instruction)
+std::string NMD::DSRAV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6973,7 +6977,7 @@ std::string NMD::DSRAV(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRL(uint64 instruction)
+std::string NMD::DSRL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6997,7 +7001,7 @@ std::string NMD::DSRL(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRL32(uint64 instruction)
+std::string NMD::DSRL32(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7021,7 +7025,7 @@ std::string NMD::DSRL32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSRLV(uint64 instruction)
+std::string NMD::DSRLV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7045,7 +7049,7 @@ std::string NMD::DSRLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSUB(uint64 instruction)
+std::string NMD::DSUB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7069,7 +7073,7 @@ std::string NMD::DSUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSUBU(uint64 instruction)
+std::string NMD::DSUBU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7093,7 +7097,7 @@ std::string NMD::DSUBU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DVPE(uint64 instruction)
+std::string NMD::DVPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7113,7 +7117,7 @@ std::string NMD::DVPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DVP(uint64 instruction)
+std::string NMD::DVP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7133,7 +7137,7 @@ std::string NMD::DVP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EHB(uint64 instruction)
+std::string NMD::EHB(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -7151,7 +7155,7 @@ std::string NMD::EHB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EI(uint64 instruction)
+std::string NMD::EI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7171,7 +7175,7 @@ std::string NMD::EI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EMT(uint64 instruction)
+std::string NMD::EMT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7191,7 +7195,7 @@ std::string NMD::EMT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ERET(uint64 instruction)
+std::string NMD::ERET(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -7209,7 +7213,7 @@ std::string NMD::ERET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ERETNC(uint64 instruction)
+std::string NMD::ERETNC(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -7227,7 +7231,7 @@ std::string NMD::ERETNC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EVP(uint64 instruction)
+std::string NMD::EVP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7247,7 +7251,7 @@ std::string NMD::EVP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EVPE(uint64 instruction)
+std::string NMD::EVPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7267,7 +7271,7 @@ std::string NMD::EVPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXT(uint64 instruction)
+std::string NMD::EXT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7293,7 +7297,7 @@ std::string NMD::EXT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTD(uint64 instruction)
+std::string NMD::EXTD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7319,7 +7323,7 @@ std::string NMD::EXTD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTD32(uint64 instruction)
+std::string NMD::EXTD32(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7345,7 +7349,7 @@ std::string NMD::EXTD32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPDP(uint64 instruction)
+std::string NMD::EXTPDP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
@@ -7369,7 +7373,7 @@ std::string NMD::EXTPDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPDPV(uint64 instruction)
+std::string NMD::EXTPDPV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7393,7 +7397,7 @@ std::string NMD::EXTPDPV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTP(uint64 instruction)
+std::string NMD::EXTP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
@@ -7417,7 +7421,7 @@ std::string NMD::EXTP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPV(uint64 instruction)
+std::string NMD::EXTPV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7442,7 +7446,7 @@ std::string NMD::EXTPV(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_RS_W(uint64 instruction)
+std::string NMD::EXTR_RS_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7467,7 +7471,7 @@ std::string NMD::EXTR_RS_W(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_R_W(uint64 instruction)
+std::string NMD::EXTR_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7492,7 +7496,7 @@ std::string NMD::EXTR_R_W(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_S_H(uint64 instruction)
+std::string NMD::EXTR_S_H(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7517,7 +7521,7 @@ std::string NMD::EXTR_S_H(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_W(uint64 instruction)
+std::string NMD::EXTR_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7542,7 +7546,7 @@ std::string NMD::EXTR_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_RS_W(uint64 instruction)
+std::string NMD::EXTRV_RS_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7567,7 +7571,7 @@ std::string NMD::EXTRV_RS_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_R_W(uint64 instruction)
+std::string NMD::EXTRV_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7592,7 +7596,7 @@ std::string NMD::EXTRV_R_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_S_H(uint64 instruction)
+std::string NMD::EXTRV_S_H(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7617,7 +7621,7 @@ std::string NMD::EXTRV_S_H(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_W(uint64 instruction)
+std::string NMD::EXTRV_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7642,7 +7646,7 @@ std::string NMD::EXTRV_W(uint64 instruction)
  *               rd -----
  *                 shift -----
  */
-std::string NMD::EXTW(uint64 instruction)
+std::string NMD::EXTW(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7668,7 +7672,7 @@ std::string NMD::EXTW(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_L_D(uint64 instruction)
+std::string NMD::FLOOR_L_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7690,7 +7694,7 @@ std::string NMD::FLOOR_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_L_S(uint64 instruction)
+std::string NMD::FLOOR_L_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7712,7 +7716,7 @@ std::string NMD::FLOOR_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_W_D(uint64 instruction)
+std::string NMD::FLOOR_W_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7734,7 +7738,7 @@ std::string NMD::FLOOR_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_W_S(uint64 instruction)
+std::string NMD::FLOOR_W_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7756,7 +7760,7 @@ std::string NMD::FLOOR_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FORK(uint64 instruction)
+std::string NMD::FORK(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7780,7 +7784,7 @@ std::string NMD::FORK(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::HYPCALL(uint64 instruction)
+std::string NMD::HYPCALL(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
@@ -7800,7 +7804,7 @@ std::string NMD::HYPCALL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::HYPCALL_16_(uint64 instruction)
+std::string NMD::HYPCALL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
@@ -7820,7 +7824,7 @@ std::string NMD::HYPCALL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::INS(uint64 instruction)
+std::string NMD::INS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7847,7 +7851,7 @@ std::string NMD::INS(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::INSV(uint64 instruction)
+std::string NMD::INSV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7869,7 +7873,7 @@ std::string NMD::INSV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::IRET(uint64 instruction)
+std::string NMD::IRET(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -7887,7 +7891,7 @@ std::string NMD::IRET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_16_(uint64 instruction)
+std::string NMD::JALRC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
@@ -7907,7 +7911,7 @@ std::string NMD::JALRC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_32_(uint64 instruction)
+std::string NMD::JALRC_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7929,7 +7933,7 @@ std::string NMD::JALRC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_HB(uint64 instruction)
+std::string NMD::JALRC_HB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7951,7 +7955,7 @@ std::string NMD::JALRC_HB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JRC(uint64 instruction)
+std::string NMD::JRC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
@@ -7971,7 +7975,7 @@ std::string NMD::JRC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_16_(uint64 instruction)
+std::string NMD::LB_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -7995,7 +7999,7 @@ std::string NMD::LB_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_GP_(uint64 instruction)
+std::string NMD::LB_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -8017,7 +8021,7 @@ std::string NMD::LB_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_S9_(uint64 instruction)
+std::string NMD::LB_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8041,7 +8045,7 @@ std::string NMD::LB_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_U12_(uint64 instruction)
+std::string NMD::LB_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8065,7 +8069,7 @@ std::string NMD::LB_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBE(uint64 instruction)
+std::string NMD::LBE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8089,7 +8093,7 @@ std::string NMD::LBE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_16_(uint64 instruction)
+std::string NMD::LBU_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8113,7 +8117,7 @@ std::string NMD::LBU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_GP_(uint64 instruction)
+std::string NMD::LBU_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -8135,7 +8139,7 @@ std::string NMD::LBU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_S9_(uint64 instruction)
+std::string NMD::LBU_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8159,7 +8163,7 @@ std::string NMD::LBU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_U12_(uint64 instruction)
+std::string NMD::LBU_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8183,7 +8187,7 @@ std::string NMD::LBU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBUE(uint64 instruction)
+std::string NMD::LBUE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8207,7 +8211,7 @@ std::string NMD::LBUE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBUX(uint64 instruction)
+std::string NMD::LBUX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8231,7 +8235,7 @@ std::string NMD::LBUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBX(uint64 instruction)
+std::string NMD::LBX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8255,7 +8259,7 @@ std::string NMD::LBX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_GP_(uint64 instruction)
+std::string NMD::LD_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
@@ -8277,7 +8281,7 @@ std::string NMD::LD_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_S9_(uint64 instruction)
+std::string NMD::LD_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8301,7 +8305,7 @@ std::string NMD::LD_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_U12_(uint64 instruction)
+std::string NMD::LD_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8325,7 +8329,7 @@ std::string NMD::LD_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_GP_(uint64 instruction)
+std::string NMD::LDC1_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -8347,7 +8351,7 @@ std::string NMD::LDC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_S9_(uint64 instruction)
+std::string NMD::LDC1_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8371,7 +8375,7 @@ std::string NMD::LDC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_U12_(uint64 instruction)
+std::string NMD::LDC1_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8395,7 +8399,7 @@ std::string NMD::LDC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1XS(uint64 instruction)
+std::string NMD::LDC1XS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8419,7 +8423,7 @@ std::string NMD::LDC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1X(uint64 instruction)
+std::string NMD::LDC1X(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8443,7 +8447,7 @@ std::string NMD::LDC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC2(uint64 instruction)
+std::string NMD::LDC2(uint64 instruction, Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8467,7 +8471,7 @@ std::string NMD::LDC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDM(uint64 instruction)
+std::string NMD::LDM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8493,13 +8497,13 @@ std::string NMD::LDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDPC_48_(uint64 instruction)
+std::string NMD::LDPC_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 6, info);
 
     return img_format("LDPC %s, %s", rt, s);
 }
@@ -8515,7 +8519,7 @@ std::string NMD::LDPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDX(uint64 instruction)
+std::string NMD::LDX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8539,7 +8543,7 @@ std::string NMD::LDX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDXS(uint64 instruction)
+std::string NMD::LDXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8563,7 +8567,7 @@ std::string NMD::LDXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_16_(uint64 instruction)
+std::string NMD::LH_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8587,7 +8591,7 @@ std::string NMD::LH_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_GP_(uint64 instruction)
+std::string NMD::LH_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -8609,7 +8613,7 @@ std::string NMD::LH_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_S9_(uint64 instruction)
+std::string NMD::LH_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8633,7 +8637,7 @@ std::string NMD::LH_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_U12_(uint64 instruction)
+std::string NMD::LH_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8657,7 +8661,7 @@ std::string NMD::LH_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHE(uint64 instruction)
+std::string NMD::LHE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8681,7 +8685,7 @@ std::string NMD::LHE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_16_(uint64 instruction)
+std::string NMD::LHU_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8705,7 +8709,7 @@ std::string NMD::LHU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_GP_(uint64 instruction)
+std::string NMD::LHU_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -8727,7 +8731,7 @@ std::string NMD::LHU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_S9_(uint64 instruction)
+std::string NMD::LHU_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8751,7 +8755,7 @@ std::string NMD::LHU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_U12_(uint64 instruction)
+std::string NMD::LHU_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8775,7 +8779,7 @@ std::string NMD::LHU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUE(uint64 instruction)
+std::string NMD::LHUE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8799,7 +8803,7 @@ std::string NMD::LHUE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUX(uint64 instruction)
+std::string NMD::LHUX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8823,7 +8827,7 @@ std::string NMD::LHUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUXS(uint64 instruction)
+std::string NMD::LHUXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8847,7 +8851,7 @@ std::string NMD::LHUXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHXS(uint64 instruction)
+std::string NMD::LHXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8871,7 +8875,7 @@ std::string NMD::LHXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHX(uint64 instruction)
+std::string NMD::LHX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8895,7 +8899,7 @@ std::string NMD::LHX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LI_16_(uint64 instruction)
+std::string NMD::LI_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
@@ -8917,7 +8921,7 @@ std::string NMD::LI_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LI_48_(uint64 instruction)
+std::string NMD::LI_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -8939,7 +8943,7 @@ std::string NMD::LI_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LL(uint64 instruction)
+std::string NMD::LL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8963,7 +8967,7 @@ std::string NMD::LL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLD(uint64 instruction)
+std::string NMD::LLD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8987,7 +8991,7 @@ std::string NMD::LLD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLDP(uint64 instruction)
+std::string NMD::LLDP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9011,7 +9015,7 @@ std::string NMD::LLDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLE(uint64 instruction)
+std::string NMD::LLE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9035,7 +9039,7 @@ std::string NMD::LLE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLWP(uint64 instruction)
+std::string NMD::LLWP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9059,7 +9063,7 @@ std::string NMD::LLWP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLWPE(uint64 instruction)
+std::string NMD::LLWPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9083,7 +9087,7 @@ std::string NMD::LLWPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LSA(uint64 instruction)
+std::string NMD::LSA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9109,7 +9113,7 @@ std::string NMD::LSA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LUI(uint64 instruction)
+std::string NMD::LUI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
@@ -9131,7 +9135,7 @@ std::string NMD::LUI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_16_(uint64 instruction)
+std::string NMD::LW_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -9155,7 +9159,7 @@ std::string NMD::LW_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_4X4_(uint64 instruction)
+std::string NMD::LW_4X4_(uint64 instruction, Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -9179,7 +9183,7 @@ std::string NMD::LW_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_GP_(uint64 instruction)
+std::string NMD::LW_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -9201,7 +9205,7 @@ std::string NMD::LW_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_GP16_(uint64 instruction)
+std::string NMD::LW_GP16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
@@ -9223,7 +9227,7 @@ std::string NMD::LW_GP16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_S9_(uint64 instruction)
+std::string NMD::LW_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9247,7 +9251,7 @@ std::string NMD::LW_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_SP_(uint64 instruction)
+std::string NMD::LW_SP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
@@ -9269,7 +9273,7 @@ std::string NMD::LW_SP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_U12_(uint64 instruction)
+std::string NMD::LW_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9293,7 +9297,7 @@ std::string NMD::LW_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_GP_(uint64 instruction)
+std::string NMD::LWC1_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -9315,7 +9319,7 @@ std::string NMD::LWC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_S9_(uint64 instruction)
+std::string NMD::LWC1_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9339,7 +9343,7 @@ std::string NMD::LWC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_U12_(uint64 instruction)
+std::string NMD::LWC1_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9363,7 +9367,7 @@ std::string NMD::LWC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1X(uint64 instruction)
+std::string NMD::LWC1X(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9387,7 +9391,7 @@ std::string NMD::LWC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1XS(uint64 instruction)
+std::string NMD::LWC1XS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9411,7 +9415,7 @@ std::string NMD::LWC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC2(uint64 instruction)
+std::string NMD::LWC2(uint64 instruction, Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9435,7 +9439,7 @@ std::string NMD::LWC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWE(uint64 instruction)
+std::string NMD::LWE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9459,7 +9463,7 @@ std::string NMD::LWE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWM(uint64 instruction)
+std::string NMD::LWM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9485,13 +9489,13 @@ std::string NMD::LWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWPC_48_(uint64 instruction)
+std::string NMD::LWPC_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 6, info);
 
     return img_format("LWPC %s, %s", rt, s);
 }
@@ -9507,7 +9511,7 @@ std::string NMD::LWPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_GP_(uint64 instruction)
+std::string NMD::LWU_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -9529,7 +9533,7 @@ std::string NMD::LWU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_S9_(uint64 instruction)
+std::string NMD::LWU_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9553,7 +9557,7 @@ std::string NMD::LWU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_U12_(uint64 instruction)
+std::string NMD::LWU_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9577,7 +9581,7 @@ std::string NMD::LWU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWUX(uint64 instruction)
+std::string NMD::LWUX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9601,7 +9605,7 @@ std::string NMD::LWUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWUXS(uint64 instruction)
+std::string NMD::LWUXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9625,7 +9629,7 @@ std::string NMD::LWUXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWX(uint64 instruction)
+std::string NMD::LWX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9649,7 +9653,7 @@ std::string NMD::LWX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWXS_16_(uint64 instruction)
+std::string NMD::LWXS_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -9673,7 +9677,7 @@ std::string NMD::LWXS_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWXS_32_(uint64 instruction)
+std::string NMD::LWXS_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9698,7 +9702,7 @@ std::string NMD::LWXS_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADD_DSP_(uint64 instruction)
+std::string NMD::MADD_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9722,7 +9726,7 @@ std::string NMD::MADD_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDF_D(uint64 instruction)
+std::string NMD::MADDF_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9746,7 +9750,7 @@ std::string NMD::MADDF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDF_S(uint64 instruction)
+std::string NMD::MADDF_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9771,7 +9775,7 @@ std::string NMD::MADDF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDU_DSP_(uint64 instruction)
+std::string NMD::MADDU_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9796,7 +9800,7 @@ std::string NMD::MADDU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_S_W_PHL(uint64 instruction)
+std::string NMD::MAQ_S_W_PHL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9821,7 +9825,7 @@ std::string NMD::MAQ_S_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_S_W_PHR(uint64 instruction)
+std::string NMD::MAQ_S_W_PHR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9846,7 +9850,7 @@ std::string NMD::MAQ_S_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_SA_W_PHL(uint64 instruction)
+std::string NMD::MAQ_SA_W_PHL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9871,7 +9875,7 @@ std::string NMD::MAQ_SA_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_SA_W_PHR(uint64 instruction)
+std::string NMD::MAQ_SA_W_PHR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9895,7 +9899,7 @@ std::string NMD::MAQ_SA_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAX_D(uint64 instruction)
+std::string NMD::MAX_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9919,7 +9923,7 @@ std::string NMD::MAX_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAX_S(uint64 instruction)
+std::string NMD::MAX_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9943,7 +9947,7 @@ std::string NMD::MAX_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAXA_D(uint64 instruction)
+std::string NMD::MAXA_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9967,7 +9971,7 @@ std::string NMD::MAXA_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAXA_S(uint64 instruction)
+std::string NMD::MAXA_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9991,7 +9995,7 @@ std::string NMD::MAXA_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC0(uint64 instruction)
+std::string NMD::MFC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10015,7 +10019,7 @@ std::string NMD::MFC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC1(uint64 instruction)
+std::string NMD::MFC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10037,7 +10041,7 @@ std::string NMD::MFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC2(uint64 instruction)
+std::string NMD::MFC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10059,7 +10063,7 @@ std::string NMD::MFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFGC0(uint64 instruction)
+std::string NMD::MFGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10083,7 +10087,7 @@ std::string NMD::MFGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC0(uint64 instruction)
+std::string NMD::MFHC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10107,7 +10111,7 @@ std::string NMD::MFHC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC1(uint64 instruction)
+std::string NMD::MFHC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10129,7 +10133,7 @@ std::string NMD::MFHC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC2(uint64 instruction)
+std::string NMD::MFHC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10151,7 +10155,7 @@ std::string NMD::MFHC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHGC0(uint64 instruction)
+std::string NMD::MFHGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10174,7 +10178,7 @@ std::string NMD::MFHGC0(uint64 instruction)
  *     rt -----
  *               ac --
  */
-std::string NMD::MFHI_DSP_(uint64 instruction)
+std::string NMD::MFHI_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10196,7 +10200,7 @@ std::string NMD::MFHI_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHTR(uint64 instruction)
+std::string NMD::MFHTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10221,7 +10225,7 @@ std::string NMD::MFHTR(uint64 instruction)
  *     rt -----
  *               ac --
  */
-std::string NMD::MFLO_DSP_(uint64 instruction)
+std::string NMD::MFLO_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10243,7 +10247,7 @@ std::string NMD::MFLO_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFTR(uint64 instruction)
+std::string NMD::MFTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10269,7 +10273,7 @@ std::string NMD::MFTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MIN_D(uint64 instruction)
+std::string NMD::MIN_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10293,7 +10297,7 @@ std::string NMD::MIN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MIN_S(uint64 instruction)
+std::string NMD::MIN_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10317,7 +10321,7 @@ std::string NMD::MIN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MINA_D(uint64 instruction)
+std::string NMD::MINA_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10341,7 +10345,7 @@ std::string NMD::MINA_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MINA_S(uint64 instruction)
+std::string NMD::MINA_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10365,7 +10369,7 @@ std::string NMD::MINA_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOD(uint64 instruction)
+std::string NMD::MOD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10389,7 +10393,7 @@ std::string NMD::MOD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MODSUB(uint64 instruction)
+std::string NMD::MODSUB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10413,7 +10417,7 @@ std::string NMD::MODSUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MODU(uint64 instruction)
+std::string NMD::MODU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10437,7 +10441,7 @@ std::string NMD::MODU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOV_D(uint64 instruction)
+std::string NMD::MOV_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10459,7 +10463,7 @@ std::string NMD::MOV_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOV_S(uint64 instruction)
+std::string NMD::MOV_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10481,7 +10485,7 @@ std::string NMD::MOV_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVE_BALC(uint64 instruction)
+std::string NMD::MOVE_BALC(uint64 instruction, Dis_info *info)
 {
     uint64 rtz4_value = extract_rtz4_27_26_25_23_22_21(instruction);
     uint64 rd1_value = extract_rdl_25_24(instruction);
@@ -10489,7 +10493,7 @@ std::string NMD::MOVE_BALC(uint64 instruction)
 
     std::string rd1 = GPR(decode_gpr_gpr1(rd1_value));
     std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, info);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
@@ -10505,7 +10509,7 @@ std::string NMD::MOVE_BALC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVEP(uint64 instruction)
+std::string NMD::MOVEP(uint64 instruction, Dis_info *info)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
@@ -10532,7 +10536,7 @@ std::string NMD::MOVEP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVEP_REV_(uint64 instruction)
+std::string NMD::MOVEP_REV_(uint64 instruction, Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
@@ -10559,7 +10563,7 @@ std::string NMD::MOVEP_REV_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVE(uint64 instruction)
+std::string NMD::MOVE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
@@ -10581,7 +10585,7 @@ std::string NMD::MOVE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVN(uint64 instruction)
+std::string NMD::MOVN(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10605,7 +10609,7 @@ std::string NMD::MOVN(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVZ(uint64 instruction)
+std::string NMD::MOVZ(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10629,7 +10633,7 @@ std::string NMD::MOVZ(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MSUB_DSP_(uint64 instruction)
+std::string NMD::MSUB_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10653,7 +10657,7 @@ std::string NMD::MSUB_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MSUBF_D(uint64 instruction)
+std::string NMD::MSUBF_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10677,7 +10681,7 @@ std::string NMD::MSUBF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MSUBF_S(uint64 instruction)
+std::string NMD::MSUBF_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10701,7 +10705,7 @@ std::string NMD::MSUBF_S(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MSUBU_DSP_(uint64 instruction)
+std::string NMD::MSUBU_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10725,7 +10729,7 @@ std::string NMD::MSUBU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC0(uint64 instruction)
+std::string NMD::MTC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10749,7 +10753,7 @@ std::string NMD::MTC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC1(uint64 instruction)
+std::string NMD::MTC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10771,7 +10775,7 @@ std::string NMD::MTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC2(uint64 instruction)
+std::string NMD::MTC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10793,7 +10797,7 @@ std::string NMD::MTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTGC0(uint64 instruction)
+std::string NMD::MTGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10817,7 +10821,7 @@ std::string NMD::MTGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC0(uint64 instruction)
+std::string NMD::MTHC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10841,7 +10845,7 @@ std::string NMD::MTHC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC1(uint64 instruction)
+std::string NMD::MTHC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10863,7 +10867,7 @@ std::string NMD::MTHC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC2(uint64 instruction)
+std::string NMD::MTHC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10885,7 +10889,7 @@ std::string NMD::MTHC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHGC0(uint64 instruction)
+std::string NMD::MTHGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10908,7 +10912,7 @@ std::string NMD::MTHGC0(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTHI_DSP_(uint64 instruction)
+std::string NMD::MTHI_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10929,7 +10933,7 @@ std::string NMD::MTHI_DSP_(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTHLIP(uint64 instruction)
+std::string NMD::MTHLIP(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10951,7 +10955,7 @@ std::string NMD::MTHLIP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHTR(uint64 instruction)
+std::string NMD::MTHTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10976,7 +10980,7 @@ std::string NMD::MTHTR(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTLO_DSP_(uint64 instruction)
+std::string NMD::MTLO_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10998,7 +11002,7 @@ std::string NMD::MTLO_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTTR(uint64 instruction)
+std::string NMD::MTTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -11024,7 +11028,7 @@ std::string NMD::MTTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUH(uint64 instruction)
+std::string NMD::MUH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11048,7 +11052,7 @@ std::string NMD::MUH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUHU(uint64 instruction)
+std::string NMD::MUHU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11072,7 +11076,7 @@ std::string NMD::MUHU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_32_(uint64 instruction)
+std::string NMD::MUL_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11096,7 +11100,7 @@ std::string NMD::MUL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_4X4_(uint64 instruction)
+std::string NMD::MUL_4X4_(uint64 instruction, Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -11118,7 +11122,7 @@ std::string NMD::MUL_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_D(uint64 instruction)
+std::string NMD::MUL_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11143,7 +11147,7 @@ std::string NMD::MUL_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_PH(uint64 instruction)
+std::string NMD::MUL_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11168,7 +11172,7 @@ std::string NMD::MUL_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_S_PH(uint64 instruction)
+std::string NMD::MUL_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11192,7 +11196,7 @@ std::string NMD::MUL_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_S(uint64 instruction)
+std::string NMD::MUL_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11217,7 +11221,7 @@ std::string NMD::MUL_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEQ_S_W_PHL(uint64 instruction)
+std::string NMD::MULEQ_S_W_PHL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11242,7 +11246,7 @@ std::string NMD::MULEQ_S_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEQ_S_W_PHR(uint64 instruction)
+std::string NMD::MULEQ_S_W_PHR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11267,7 +11271,7 @@ std::string NMD::MULEQ_S_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEU_S_PH_QBL(uint64 instruction)
+std::string NMD::MULEU_S_PH_QBL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11292,7 +11296,7 @@ std::string NMD::MULEU_S_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEU_S_PH_QBR(uint64 instruction)
+std::string NMD::MULEU_S_PH_QBR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11317,7 +11321,7 @@ std::string NMD::MULEU_S_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_RS_PH(uint64 instruction)
+std::string NMD::MULQ_RS_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11342,7 +11346,7 @@ std::string NMD::MULQ_RS_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_RS_W(uint64 instruction)
+std::string NMD::MULQ_RS_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11367,7 +11371,7 @@ std::string NMD::MULQ_RS_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_S_PH(uint64 instruction)
+std::string NMD::MULQ_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11392,7 +11396,7 @@ std::string NMD::MULQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_S_W(uint64 instruction)
+std::string NMD::MULQ_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11417,7 +11421,7 @@ std::string NMD::MULQ_S_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULSA_W_PH(uint64 instruction)
+std::string NMD::MULSA_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11442,7 +11446,7 @@ std::string NMD::MULSA_W_PH(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULSAQ_S_W_PH(uint64 instruction)
+std::string NMD::MULSAQ_S_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11466,7 +11470,7 @@ std::string NMD::MULSAQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULT_DSP_(uint64 instruction)
+std::string NMD::MULT_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11490,7 +11494,7 @@ std::string NMD::MULT_DSP_(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULTU_DSP_(uint64 instruction)
+std::string NMD::MULTU_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11514,7 +11518,7 @@ std::string NMD::MULTU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULU(uint64 instruction)
+std::string NMD::MULU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11538,7 +11542,7 @@ std::string NMD::MULU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NEG_D(uint64 instruction)
+std::string NMD::NEG_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11560,7 +11564,7 @@ std::string NMD::NEG_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NEG_S(uint64 instruction)
+std::string NMD::NEG_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11582,7 +11586,7 @@ std::string NMD::NEG_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOP_16_(uint64 instruction)
+std::string NMD::NOP_16_(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -11600,7 +11604,7 @@ std::string NMD::NOP_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOP_32_(uint64 instruction)
+std::string NMD::NOP_32_(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -11618,7 +11622,7 @@ std::string NMD::NOP_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOR(uint64 instruction)
+std::string NMD::NOR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11642,7 +11646,7 @@ std::string NMD::NOR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOT_16_(uint64 instruction)
+std::string NMD::NOT_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -11664,7 +11668,7 @@ std::string NMD::NOT_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::OR_16_(uint64 instruction)
+std::string NMD::OR_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -11686,7 +11690,7 @@ std::string NMD::OR_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::OR_32_(uint64 instruction)
+std::string NMD::OR_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11710,7 +11714,7 @@ std::string NMD::OR_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ORI(uint64 instruction)
+std::string NMD::ORI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11735,7 +11739,7 @@ std::string NMD::ORI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PACKRL_PH(uint64 instruction)
+std::string NMD::PACKRL_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11759,7 +11763,7 @@ std::string NMD::PACKRL_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PAUSE(uint64 instruction)
+std::string NMD::PAUSE(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -11778,7 +11782,7 @@ std::string NMD::PAUSE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PICK_PH(uint64 instruction)
+std::string NMD::PICK_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11803,7 +11807,7 @@ std::string NMD::PICK_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PICK_QB(uint64 instruction)
+std::string NMD::PICK_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11828,7 +11832,7 @@ std::string NMD::PICK_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQ_W_PHL(uint64 instruction)
+std::string NMD::PRECEQ_W_PHL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11851,7 +11855,7 @@ std::string NMD::PRECEQ_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQ_W_PHR(uint64 instruction)
+std::string NMD::PRECEQ_W_PHR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11874,7 +11878,7 @@ std::string NMD::PRECEQ_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBLA(uint64 instruction)
+std::string NMD::PRECEQU_PH_QBLA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11897,7 +11901,7 @@ std::string NMD::PRECEQU_PH_QBLA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBL(uint64 instruction)
+std::string NMD::PRECEQU_PH_QBL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11920,7 +11924,7 @@ std::string NMD::PRECEQU_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBRA(uint64 instruction)
+std::string NMD::PRECEQU_PH_QBRA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11943,7 +11947,7 @@ std::string NMD::PRECEQU_PH_QBRA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBR(uint64 instruction)
+std::string NMD::PRECEQU_PH_QBR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11967,7 +11971,7 @@ std::string NMD::PRECEQU_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBLA(uint64 instruction)
+std::string NMD::PRECEU_PH_QBLA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11990,7 +11994,7 @@ std::string NMD::PRECEU_PH_QBLA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBL(uint64 instruction)
+std::string NMD::PRECEU_PH_QBL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12014,7 +12018,7 @@ std::string NMD::PRECEU_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBRA(uint64 instruction)
+std::string NMD::PRECEU_PH_QBRA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12037,7 +12041,7 @@ std::string NMD::PRECEU_PH_QBRA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBR(uint64 instruction)
+std::string NMD::PRECEU_PH_QBR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12060,7 +12064,7 @@ std::string NMD::PRECEU_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_QB_PH(uint64 instruction)
+std::string NMD::PRECR_QB_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12085,7 +12089,7 @@ std::string NMD::PRECR_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_SRA_PH_W(uint64 instruction)
+std::string NMD::PRECR_SRA_PH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12110,7 +12114,7 @@ std::string NMD::PRECR_SRA_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction)
+std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12135,7 +12139,7 @@ std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_PH_W(uint64 instruction)
+std::string NMD::PRECRQ_PH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12160,7 +12164,7 @@ std::string NMD::PRECRQ_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_QB_PH(uint64 instruction)
+std::string NMD::PRECRQ_QB_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12185,7 +12189,7 @@ std::string NMD::PRECRQ_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_RS_PH_W(uint64 instruction)
+std::string NMD::PRECRQ_RS_PH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12210,7 +12214,7 @@ std::string NMD::PRECRQ_RS_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQU_S_QB_PH(uint64 instruction)
+std::string NMD::PRECRQU_S_QB_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12234,7 +12238,7 @@ std::string NMD::PRECRQU_S_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREF_S9_(uint64 instruction)
+std::string NMD::PREF_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12258,7 +12262,7 @@ std::string NMD::PREF_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREF_U12_(uint64 instruction)
+std::string NMD::PREF_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12282,7 +12286,7 @@ std::string NMD::PREF_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREFE(uint64 instruction)
+std::string NMD::PREFE(uint64 instruction, Dis_info *info)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12306,7 +12310,7 @@ std::string NMD::PREFE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREPEND(uint64 instruction)
+std::string NMD::PREPEND(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12329,7 +12333,7 @@ std::string NMD::PREPEND(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::RADDU_W_QB(uint64 instruction)
+std::string NMD::RADDU_W_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12350,7 +12354,7 @@ std::string NMD::RADDU_W_QB(uint64 instruction)
  *     rt -----
  *        mask -------
  */
-std::string NMD::RDDSP(uint64 instruction)
+std::string NMD::RDDSP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
@@ -12372,7 +12376,7 @@ std::string NMD::RDDSP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RDHWR(uint64 instruction)
+std::string NMD::RDHWR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
@@ -12396,7 +12400,7 @@ std::string NMD::RDHWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RDPGPR(uint64 instruction)
+std::string NMD::RDPGPR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12418,7 +12422,7 @@ std::string NMD::RDPGPR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RECIP_D(uint64 instruction)
+std::string NMD::RECIP_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12440,7 +12444,7 @@ std::string NMD::RECIP_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RECIP_S(uint64 instruction)
+std::string NMD::RECIP_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12462,7 +12466,7 @@ std::string NMD::RECIP_S(uint64 instruction)
  *     rt -----
  *           s ----------
  */
-std::string NMD::REPL_PH(uint64 instruction)
+std::string NMD::REPL_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
@@ -12484,7 +12488,7 @@ std::string NMD::REPL_PH(uint64 instruction)
  *     rt -----
  *           u --------
  */
-std::string NMD::REPL_QB(uint64 instruction)
+std::string NMD::REPL_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
@@ -12506,7 +12510,7 @@ std::string NMD::REPL_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::REPLV_PH(uint64 instruction)
+std::string NMD::REPLV_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12527,7 +12531,7 @@ std::string NMD::REPLV_PH(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::REPLV_QB(uint64 instruction)
+std::string NMD::REPLV_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12549,7 +12553,7 @@ std::string NMD::REPLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_32_(uint64 instruction)
+std::string NMD::RESTORE_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
@@ -12572,7 +12576,7 @@ std::string NMD::RESTORE_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_JRC_16_(uint64 instruction)
+std::string NMD::RESTORE_JRC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
@@ -12594,7 +12598,7 @@ std::string NMD::RESTORE_JRC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_JRC_32_(uint64 instruction)
+std::string NMD::RESTORE_JRC_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
@@ -12617,7 +12621,7 @@ std::string NMD::RESTORE_JRC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTOREF(uint64 instruction)
+std::string NMD::RESTOREF(uint64 instruction, Dis_info *info)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
@@ -12639,7 +12643,7 @@ std::string NMD::RESTOREF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RINT_D(uint64 instruction)
+std::string NMD::RINT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12661,7 +12665,7 @@ std::string NMD::RINT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RINT_S(uint64 instruction)
+std::string NMD::RINT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12683,7 +12687,7 @@ std::string NMD::RINT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTR(uint64 instruction)
+std::string NMD::ROTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12707,7 +12711,7 @@ std::string NMD::ROTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTRV(uint64 instruction)
+std::string NMD::ROTRV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12731,7 +12735,7 @@ std::string NMD::ROTRV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTX(uint64 instruction)
+std::string NMD::ROTX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12760,7 +12764,7 @@ std::string NMD::ROTX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_L_D(uint64 instruction)
+std::string NMD::ROUND_L_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12782,7 +12786,7 @@ std::string NMD::ROUND_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_L_S(uint64 instruction)
+std::string NMD::ROUND_L_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12804,7 +12808,7 @@ std::string NMD::ROUND_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_W_D(uint64 instruction)
+std::string NMD::ROUND_W_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12826,7 +12830,7 @@ std::string NMD::ROUND_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_W_S(uint64 instruction)
+std::string NMD::ROUND_W_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12848,7 +12852,7 @@ std::string NMD::ROUND_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RSQRT_D(uint64 instruction)
+std::string NMD::RSQRT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12870,7 +12874,7 @@ std::string NMD::RSQRT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RSQRT_S(uint64 instruction)
+std::string NMD::RSQRT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12892,7 +12896,7 @@ std::string NMD::RSQRT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVE_16_(uint64 instruction)
+std::string NMD::SAVE_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
@@ -12914,7 +12918,7 @@ std::string NMD::SAVE_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVE_32_(uint64 instruction)
+std::string NMD::SAVE_32_(uint64 instruction, Dis_info *info)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
@@ -12937,7 +12941,7 @@ std::string NMD::SAVE_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVEF(uint64 instruction)
+std::string NMD::SAVEF(uint64 instruction, Dis_info *info)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
@@ -12959,7 +12963,7 @@ std::string NMD::SAVEF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_16_(uint64 instruction)
+std::string NMD::SB_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -12983,7 +12987,7 @@ std::string NMD::SB_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_GP_(uint64 instruction)
+std::string NMD::SB_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -13005,7 +13009,7 @@ std::string NMD::SB_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_S9_(uint64 instruction)
+std::string NMD::SB_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13029,7 +13033,7 @@ std::string NMD::SB_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_U12_(uint64 instruction)
+std::string NMD::SB_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13053,7 +13057,7 @@ std::string NMD::SB_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SBE(uint64 instruction)
+std::string NMD::SBE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13077,7 +13081,7 @@ std::string NMD::SBE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SBX(uint64 instruction)
+std::string NMD::SBX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13101,7 +13105,7 @@ std::string NMD::SBX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SC(uint64 instruction)
+std::string NMD::SC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13125,7 +13129,7 @@ std::string NMD::SC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCD(uint64 instruction)
+std::string NMD::SCD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13149,7 +13153,7 @@ std::string NMD::SCD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCDP(uint64 instruction)
+std::string NMD::SCDP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13173,7 +13177,7 @@ std::string NMD::SCDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCE(uint64 instruction)
+std::string NMD::SCE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13197,7 +13201,7 @@ std::string NMD::SCE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCWP(uint64 instruction)
+std::string NMD::SCWP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13221,7 +13225,7 @@ std::string NMD::SCWP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCWPE(uint64 instruction)
+std::string NMD::SCWPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13245,7 +13249,7 @@ std::string NMD::SCWPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_GP_(uint64 instruction)
+std::string NMD::SD_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
@@ -13267,7 +13271,7 @@ std::string NMD::SD_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_S9_(uint64 instruction)
+std::string NMD::SD_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13291,7 +13295,7 @@ std::string NMD::SD_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_U12_(uint64 instruction)
+std::string NMD::SD_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13315,7 +13319,7 @@ std::string NMD::SD_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDBBP_16_(uint64 instruction)
+std::string NMD::SDBBP_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
@@ -13335,7 +13339,7 @@ std::string NMD::SDBBP_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDBBP_32_(uint64 instruction)
+std::string NMD::SDBBP_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -13355,7 +13359,7 @@ std::string NMD::SDBBP_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_GP_(uint64 instruction)
+std::string NMD::SDC1_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -13377,7 +13381,7 @@ std::string NMD::SDC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_S9_(uint64 instruction)
+std::string NMD::SDC1_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13401,7 +13405,7 @@ std::string NMD::SDC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_U12_(uint64 instruction)
+std::string NMD::SDC1_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13425,7 +13429,7 @@ std::string NMD::SDC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1X(uint64 instruction)
+std::string NMD::SDC1X(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13449,7 +13453,7 @@ std::string NMD::SDC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1XS(uint64 instruction)
+std::string NMD::SDC1XS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13473,7 +13477,7 @@ std::string NMD::SDC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC2(uint64 instruction)
+std::string NMD::SDC2(uint64 instruction, Dis_info *info)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13497,7 +13501,7 @@ std::string NMD::SDC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDM(uint64 instruction)
+std::string NMD::SDM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13523,13 +13527,13 @@ std::string NMD::SDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDPC_48_(uint64 instruction)
+std::string NMD::SDPC_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 6, info);
 
     return img_format("SDPC %s, %s", rt, s);
 }
@@ -13545,7 +13549,7 @@ std::string NMD::SDPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDXS(uint64 instruction)
+std::string NMD::SDXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13569,7 +13573,7 @@ std::string NMD::SDXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDX(uint64 instruction)
+std::string NMD::SDX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13593,7 +13597,7 @@ std::string NMD::SDX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEB(uint64 instruction)
+std::string NMD::SEB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13615,7 +13619,7 @@ std::string NMD::SEB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEH(uint64 instruction)
+std::string NMD::SEH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13637,7 +13641,7 @@ std::string NMD::SEH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEL_D(uint64 instruction)
+std::string NMD::SEL_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13661,7 +13665,7 @@ std::string NMD::SEL_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEL_S(uint64 instruction)
+std::string NMD::SEL_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13685,7 +13689,7 @@ std::string NMD::SEL_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELEQZ_D(uint64 instruction)
+std::string NMD::SELEQZ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13709,7 +13713,7 @@ std::string NMD::SELEQZ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELEQZ_S(uint64 instruction)
+std::string NMD::SELEQZ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13733,7 +13737,7 @@ std::string NMD::SELEQZ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELNEZ_D(uint64 instruction)
+std::string NMD::SELNEZ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13757,7 +13761,7 @@ std::string NMD::SELNEZ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELNEZ_S(uint64 instruction)
+std::string NMD::SELNEZ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13781,7 +13785,7 @@ std::string NMD::SELNEZ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEQI(uint64 instruction)
+std::string NMD::SEQI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13805,7 +13809,7 @@ std::string NMD::SEQI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_16_(uint64 instruction)
+std::string NMD::SH_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -13829,7 +13833,7 @@ std::string NMD::SH_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_GP_(uint64 instruction)
+std::string NMD::SH_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -13851,7 +13855,7 @@ std::string NMD::SH_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_S9_(uint64 instruction)
+std::string NMD::SH_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13875,7 +13879,7 @@ std::string NMD::SH_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_U12_(uint64 instruction)
+std::string NMD::SH_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13899,7 +13903,7 @@ std::string NMD::SH_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHE(uint64 instruction)
+std::string NMD::SHE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13923,7 +13927,7 @@ std::string NMD::SHE(uint64 instruction)
  *      shift ------
  *               ac --
  */
-std::string NMD::SHILO(uint64 instruction)
+std::string NMD::SHILO(uint64 instruction, Dis_info *info)
 {
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -13945,7 +13949,7 @@ std::string NMD::SHILO(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::SHILOV(uint64 instruction)
+std::string NMD::SHILOV(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -13967,7 +13971,7 @@ std::string NMD::SHILOV(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHLL_PH(uint64 instruction)
+std::string NMD::SHLL_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13991,7 +13995,7 @@ std::string NMD::SHLL_PH(uint64 instruction)
  *          rs -----
  *               sa ---
  */
-std::string NMD::SHLL_QB(uint64 instruction)
+std::string NMD::SHLL_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14016,7 +14020,7 @@ std::string NMD::SHLL_QB(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHLL_S_PH(uint64 instruction)
+std::string NMD::SHLL_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14040,7 +14044,7 @@ std::string NMD::SHLL_S_PH(uint64 instruction)
  *          rs -----
  *               sa -----
  */
-std::string NMD::SHLL_S_W(uint64 instruction)
+std::string NMD::SHLL_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14065,7 +14069,7 @@ std::string NMD::SHLL_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_PH(uint64 instruction)
+std::string NMD::SHLLV_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14089,7 +14093,7 @@ std::string NMD::SHLLV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_QB(uint64 instruction)
+std::string NMD::SHLLV_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14114,7 +14118,7 @@ std::string NMD::SHLLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_S_PH(uint64 instruction)
+std::string NMD::SHLLV_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14138,7 +14142,7 @@ std::string NMD::SHLLV_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_S_W(uint64 instruction)
+std::string NMD::SHLLV_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14162,7 +14166,7 @@ std::string NMD::SHLLV_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_PH(uint64 instruction)
+std::string NMD::SHRA_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14186,7 +14190,7 @@ std::string NMD::SHRA_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_QB(uint64 instruction)
+std::string NMD::SHRA_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14210,7 +14214,7 @@ std::string NMD::SHRA_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_PH(uint64 instruction)
+std::string NMD::SHRA_R_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14234,7 +14238,7 @@ std::string NMD::SHRA_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_QB(uint64 instruction)
+std::string NMD::SHRA_R_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14258,7 +14262,7 @@ std::string NMD::SHRA_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_W(uint64 instruction)
+std::string NMD::SHRA_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14282,7 +14286,7 @@ std::string NMD::SHRA_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_PH(uint64 instruction)
+std::string NMD::SHRAV_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14306,7 +14310,7 @@ std::string NMD::SHRAV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_QB(uint64 instruction)
+std::string NMD::SHRAV_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14330,7 +14334,7 @@ std::string NMD::SHRAV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_PH(uint64 instruction)
+std::string NMD::SHRAV_R_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14354,7 +14358,7 @@ std::string NMD::SHRAV_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_QB(uint64 instruction)
+std::string NMD::SHRAV_R_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14378,7 +14382,7 @@ std::string NMD::SHRAV_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_W(uint64 instruction)
+std::string NMD::SHRAV_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14402,7 +14406,7 @@ std::string NMD::SHRAV_R_W(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHRL_PH(uint64 instruction)
+std::string NMD::SHRL_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14426,7 +14430,7 @@ std::string NMD::SHRL_PH(uint64 instruction)
  *          rs -----
  *               sa ---
  */
-std::string NMD::SHRL_QB(uint64 instruction)
+std::string NMD::SHRL_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14451,7 +14455,7 @@ std::string NMD::SHRL_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRLV_PH(uint64 instruction)
+std::string NMD::SHRLV_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14475,7 +14479,7 @@ std::string NMD::SHRLV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRLV_QB(uint64 instruction)
+std::string NMD::SHRLV_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14499,7 +14503,7 @@ std::string NMD::SHRLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHX(uint64 instruction)
+std::string NMD::SHX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14523,7 +14527,7 @@ std::string NMD::SHX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHXS(uint64 instruction)
+std::string NMD::SHXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14547,7 +14551,7 @@ std::string NMD::SHXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SIGRIE(uint64 instruction)
+std::string NMD::SIGRIE(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -14567,7 +14571,7 @@ std::string NMD::SIGRIE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLL_16_(uint64 instruction)
+std::string NMD::SLL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -14591,7 +14595,7 @@ std::string NMD::SLL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLL_32_(uint64 instruction)
+std::string NMD::SLL_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14615,7 +14619,7 @@ std::string NMD::SLL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLLV(uint64 instruction)
+std::string NMD::SLLV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14639,7 +14643,7 @@ std::string NMD::SLLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLT(uint64 instruction)
+std::string NMD::SLT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14663,7 +14667,7 @@ std::string NMD::SLT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTI(uint64 instruction)
+std::string NMD::SLTI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14687,7 +14691,7 @@ std::string NMD::SLTI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTIU(uint64 instruction)
+std::string NMD::SLTIU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14711,7 +14715,7 @@ std::string NMD::SLTIU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTU(uint64 instruction)
+std::string NMD::SLTU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14735,7 +14739,7 @@ std::string NMD::SLTU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SOV(uint64 instruction)
+std::string NMD::SOV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14759,7 +14763,7 @@ std::string NMD::SOV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SPECIAL2(uint64 instruction)
+std::string NMD::SPECIAL2(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
@@ -14779,7 +14783,7 @@ std::string NMD::SPECIAL2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SQRT_D(uint64 instruction)
+std::string NMD::SQRT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14801,7 +14805,7 @@ std::string NMD::SQRT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SQRT_S(uint64 instruction)
+std::string NMD::SQRT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14823,7 +14827,7 @@ std::string NMD::SQRT_S(uint64 instruction)
  *               rd -----
  *                    sa -----
  */
-std::string NMD::SRA(uint64 instruction)
+std::string NMD::SRA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14847,7 +14851,7 @@ std::string NMD::SRA(uint64 instruction)
  *          rt -----
  *               rd -----
  */
-std::string NMD::SRAV(uint64 instruction)
+std::string NMD::SRAV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14871,7 +14875,7 @@ std::string NMD::SRAV(uint64 instruction)
  *          rt -----
  *               rd -----
  */
-std::string NMD::SRL_16_(uint64 instruction)
+std::string NMD::SRL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -14895,7 +14899,7 @@ std::string NMD::SRL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SRL_32_(uint64 instruction)
+std::string NMD::SRL_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14919,7 +14923,7 @@ std::string NMD::SRL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SRLV(uint64 instruction)
+std::string NMD::SRLV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14943,7 +14947,7 @@ std::string NMD::SRLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB(uint64 instruction)
+std::string NMD::SUB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14967,7 +14971,7 @@ std::string NMD::SUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB_D(uint64 instruction)
+std::string NMD::SUB_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14991,7 +14995,7 @@ std::string NMD::SUB_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB_S(uint64 instruction)
+std::string NMD::SUB_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -15015,7 +15019,7 @@ std::string NMD::SUB_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_PH(uint64 instruction)
+std::string NMD::SUBQ_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15040,7 +15044,7 @@ std::string NMD::SUBQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_S_PH(uint64 instruction)
+std::string NMD::SUBQ_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15065,7 +15069,7 @@ std::string NMD::SUBQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_S_W(uint64 instruction)
+std::string NMD::SUBQ_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15090,7 +15094,7 @@ std::string NMD::SUBQ_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_PH(uint64 instruction)
+std::string NMD::SUBQH_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15115,7 +15119,7 @@ std::string NMD::SUBQH_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_R_PH(uint64 instruction)
+std::string NMD::SUBQH_R_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15140,7 +15144,7 @@ std::string NMD::SUBQH_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_R_W(uint64 instruction)
+std::string NMD::SUBQH_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15165,7 +15169,7 @@ std::string NMD::SUBQH_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_W(uint64 instruction)
+std::string NMD::SUBQH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15189,7 +15193,7 @@ std::string NMD::SUBQH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_16_(uint64 instruction)
+std::string NMD::SUBU_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -15213,7 +15217,7 @@ std::string NMD::SUBU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_32_(uint64 instruction)
+std::string NMD::SUBU_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15237,7 +15241,7 @@ std::string NMD::SUBU_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_PH(uint64 instruction)
+std::string NMD::SUBU_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15261,7 +15265,7 @@ std::string NMD::SUBU_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_QB(uint64 instruction)
+std::string NMD::SUBU_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15286,7 +15290,7 @@ std::string NMD::SUBU_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_S_PH(uint64 instruction)
+std::string NMD::SUBU_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15311,7 +15315,7 @@ std::string NMD::SUBU_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_S_QB(uint64 instruction)
+std::string NMD::SUBU_S_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15336,7 +15340,7 @@ std::string NMD::SUBU_S_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBUH_QB(uint64 instruction)
+std::string NMD::SUBUH_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15361,7 +15365,7 @@ std::string NMD::SUBUH_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBUH_R_QB(uint64 instruction)
+std::string NMD::SUBUH_R_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15385,7 +15389,7 @@ std::string NMD::SUBUH_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_16_(uint64 instruction)
+std::string NMD::SW_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -15409,7 +15413,7 @@ std::string NMD::SW_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_4X4_(uint64 instruction)
+std::string NMD::SW_4X4_(uint64 instruction, Dis_info *info)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -15433,7 +15437,7 @@ std::string NMD::SW_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_GP16_(uint64 instruction)
+std::string NMD::SW_GP16_(uint64 instruction, Dis_info *info)
 {
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
@@ -15455,7 +15459,7 @@ std::string NMD::SW_GP16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_GP_(uint64 instruction)
+std::string NMD::SW_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -15477,7 +15481,7 @@ std::string NMD::SW_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_S9_(uint64 instruction)
+std::string NMD::SW_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15501,7 +15505,7 @@ std::string NMD::SW_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_SP_(uint64 instruction)
+std::string NMD::SW_SP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
@@ -15523,7 +15527,7 @@ std::string NMD::SW_SP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_U12_(uint64 instruction)
+std::string NMD::SW_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15547,7 +15551,7 @@ std::string NMD::SW_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_GP_(uint64 instruction)
+std::string NMD::SWC1_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -15569,7 +15573,7 @@ std::string NMD::SWC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_S9_(uint64 instruction)
+std::string NMD::SWC1_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15593,7 +15597,7 @@ std::string NMD::SWC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_U12_(uint64 instruction)
+std::string NMD::SWC1_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15617,7 +15621,7 @@ std::string NMD::SWC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1X(uint64 instruction)
+std::string NMD::SWC1X(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15641,7 +15645,7 @@ std::string NMD::SWC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1XS(uint64 instruction)
+std::string NMD::SWC1XS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15665,7 +15669,7 @@ std::string NMD::SWC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC2(uint64 instruction)
+std::string NMD::SWC2(uint64 instruction, Dis_info *info)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15689,7 +15693,7 @@ std::string NMD::SWC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWE(uint64 instruction)
+std::string NMD::SWE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15713,7 +15717,7 @@ std::string NMD::SWE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWM(uint64 instruction)
+std::string NMD::SWM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15739,13 +15743,13 @@ std::string NMD::SWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWPC_48_(uint64 instruction)
+std::string NMD::SWPC_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 6, info);
 
     return img_format("SWPC %s, %s", rt, s);
 }
@@ -15761,7 +15765,7 @@ std::string NMD::SWPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWX(uint64 instruction)
+std::string NMD::SWX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15785,7 +15789,7 @@ std::string NMD::SWX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWXS(uint64 instruction)
+std::string NMD::SWXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15809,7 +15813,7 @@ std::string NMD::SWXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNC(uint64 instruction)
+std::string NMD::SYNC(uint64 instruction, Dis_info *info)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
@@ -15829,7 +15833,7 @@ std::string NMD::SYNC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNCI(uint64 instruction)
+std::string NMD::SYNCI(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15851,7 +15855,7 @@ std::string NMD::SYNCI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNCIE(uint64 instruction)
+std::string NMD::SYNCIE(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15873,7 +15877,7 @@ std::string NMD::SYNCIE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYSCALL_16_(uint64 instruction)
+std::string NMD::SYSCALL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
@@ -15891,7 +15895,7 @@ std::string NMD::SYSCALL_16_(uint64 instruction)
  *  00000000000010
  *           code ------------------
  */
-std::string NMD::SYSCALL_32_(uint64 instruction)
+std::string NMD::SYSCALL_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
@@ -15911,7 +15915,7 @@ std::string NMD::SYSCALL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TEQ(uint64 instruction)
+std::string NMD::TEQ(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15933,7 +15937,7 @@ std::string NMD::TEQ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGINV(uint64 instruction)
+std::string NMD::TLBGINV(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -15951,7 +15955,7 @@ std::string NMD::TLBGINV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGINVF(uint64 instruction)
+std::string NMD::TLBGINVF(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -15969,7 +15973,7 @@ std::string NMD::TLBGINVF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGP(uint64 instruction)
+std::string NMD::TLBGP(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -15987,7 +15991,7 @@ std::string NMD::TLBGP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGR(uint64 instruction)
+std::string NMD::TLBGR(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -16005,7 +16009,7 @@ std::string NMD::TLBGR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGWI(uint64 instruction)
+std::string NMD::TLBGWI(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -16023,7 +16027,7 @@ std::string NMD::TLBGWI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGWR(uint64 instruction)
+std::string NMD::TLBGWR(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -16041,7 +16045,7 @@ std::string NMD::TLBGWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBINV(uint64 instruction)
+std::string NMD::TLBINV(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -16059,7 +16063,7 @@ std::string NMD::TLBINV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBINVF(uint64 instruction)
+std::string NMD::TLBINVF(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -16077,7 +16081,7 @@ std::string NMD::TLBINVF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBP(uint64 instruction)
+std::string NMD::TLBP(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -16095,7 +16099,7 @@ std::string NMD::TLBP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBR(uint64 instruction)
+std::string NMD::TLBR(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -16113,7 +16117,7 @@ std::string NMD::TLBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBWI(uint64 instruction)
+std::string NMD::TLBWI(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -16131,7 +16135,7 @@ std::string NMD::TLBWI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBWR(uint64 instruction)
+std::string NMD::TLBWR(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
@@ -16149,7 +16153,7 @@ std::string NMD::TLBWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TNE(uint64 instruction)
+std::string NMD::TNE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16171,7 +16175,7 @@ std::string NMD::TNE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_L_D(uint64 instruction)
+std::string NMD::TRUNC_L_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16193,7 +16197,7 @@ std::string NMD::TRUNC_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_L_S(uint64 instruction)
+std::string NMD::TRUNC_L_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16215,7 +16219,7 @@ std::string NMD::TRUNC_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_W_D(uint64 instruction)
+std::string NMD::TRUNC_W_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16237,7 +16241,7 @@ std::string NMD::TRUNC_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_W_S(uint64 instruction)
+std::string NMD::TRUNC_W_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16259,7 +16263,7 @@ std::string NMD::TRUNC_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALDM(uint64 instruction)
+std::string NMD::UALDM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16285,7 +16289,7 @@ std::string NMD::UALDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALH(uint64 instruction)
+std::string NMD::UALH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16309,7 +16313,7 @@ std::string NMD::UALH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALWM(uint64 instruction)
+std::string NMD::UALWM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16335,7 +16339,7 @@ std::string NMD::UALWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASDM(uint64 instruction)
+std::string NMD::UASDM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16361,7 +16365,7 @@ std::string NMD::UASDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASH(uint64 instruction)
+std::string NMD::UASH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16385,7 +16389,7 @@ std::string NMD::UASH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASWM(uint64 instruction)
+std::string NMD::UASWM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16411,7 +16415,7 @@ std::string NMD::UASWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UDI(uint64 instruction)
+std::string NMD::UDI(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
@@ -16429,7 +16433,7 @@ std::string NMD::UDI(uint64 instruction)
  *  001000          1100001101111111
  *   code ----------
  */
-std::string NMD::WAIT(uint64 instruction)
+std::string NMD::WAIT(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
@@ -16449,7 +16453,7 @@ std::string NMD::WAIT(uint64 instruction)
  *     rt -----
  *        mask -------
  */
-std::string NMD::WRDSP(uint64 instruction)
+std::string NMD::WRDSP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
@@ -16471,7 +16475,7 @@ std::string NMD::WRDSP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::WRPGPR(uint64 instruction)
+std::string NMD::WRPGPR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16493,7 +16497,7 @@ std::string NMD::WRPGPR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XOR_16_(uint64 instruction)
+std::string NMD::XOR_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -16515,7 +16519,7 @@ std::string NMD::XOR_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XOR_32_(uint64 instruction)
+std::string NMD::XOR_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16539,7 +16543,7 @@ std::string NMD::XOR_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XORI(uint64 instruction)
+std::string NMD::XORI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16562,7 +16566,7 @@ std::string NMD::XORI(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::YIELD(uint64 instruction)
+std::string NMD::YIELD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 5bdfe1e30b..fcd41c405c 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -60,24 +60,21 @@ enum TABLE_ATTRIBUTE_TYPE {
     ALL_ATTRIBUTES = 0xffffffffull,
 };
 
+typedef struct Dis_info {
+  img_address m_pc;
+} Dis_info;
 
 class NMD
 {
 public:
 
-    NMD(img_address pc)
-        : m_pc(pc)
-    {
-    }
-
     int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type);
+                    TABLE_ENTRY_TYPE & type, Dis_info *info);
 
 private:
 
-    img_address           m_pc;
-
-    typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
+    typedef std::string(NMD:: *disassembly_function)(uint64 instruction,
+                                                     Dis_info *info);
     typedef bool(NMD:: *conditional_function)(uint64 instruction);
 
     struct Pool {
@@ -94,7 +91,8 @@ private:
 
     uint64 extract_op_code_value(const uint16 *data, int size);
     int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type, const Pool *table, int table_size);
+                    TABLE_ENTRY_TYPE & type, const Pool *table, int table_size,
+                    Dis_info *info);
 
     uint64 renumber_registers(uint64 index, uint64 *register_list,
                               size_t register_list_size);
@@ -135,7 +133,7 @@ private:
     std::string IMMEDIATE(uint64 value);
     std::string IMMEDIATE(int64 value);
     std::string CPR(uint64 reg);
-    std::string ADDRESS(uint64 value, int instruction_size);
+    std::string ADDRESS(uint64 value, int instruction_size, Dis_info *info);
 
     int64 extract_s__se3_4_2_1_0(uint64 instruction);
     int64 extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction);
@@ -251,642 +249,642 @@ private:
     bool PREFE_cond(uint64 instruction);
     bool SLTU_cond(uint64 instruction);
 
-    std::string ABS_D(uint64 instruction);
-    std::string ABS_S(uint64 instruction);
-    std::string ABSQ_S_PH(uint64 instruction);
-    std::string ABSQ_S_QB(uint64 instruction);
-    std::string ABSQ_S_W(uint64 instruction);
-    std::string ACLR(uint64 instruction);
-    std::string ADD(uint64 instruction);
-    std::string ADD_D(uint64 instruction);
-    std::string ADD_S(uint64 instruction);
-    std::string ADDIU_32_(uint64 instruction);
-    std::string ADDIU_48_(uint64 instruction);
-    std::string ADDIU_GP48_(uint64 instruction);
-    std::string ADDIU_GP_B_(uint64 instruction);
-    std::string ADDIU_GP_W_(uint64 instruction);
-    std::string ADDIU_NEG_(uint64 instruction);
-    std::string ADDIU_R1_SP_(uint64 instruction);
-    std::string ADDIU_R2_(uint64 instruction);
-    std::string ADDIU_RS5_(uint64 instruction);
-    std::string ADDIUPC_32_(uint64 instruction);
-    std::string ADDIUPC_48_(uint64 instruction);
-    std::string ADDQ_PH(uint64 instruction);
-    std::string ADDQ_S_PH(uint64 instruction);
-    std::string ADDQ_S_W(uint64 instruction);
-    std::string ADDQH_PH(uint64 instruction);
-    std::string ADDQH_R_PH(uint64 instruction);
-    std::string ADDQH_R_W(uint64 instruction);
-    std::string ADDQH_W(uint64 instruction);
-    std::string ADDSC(uint64 instruction);
-    std::string ADDU_16_(uint64 instruction);
-    std::string ADDU_32_(uint64 instruction);
-    std::string ADDU_4X4_(uint64 instruction);
-    std::string ADDU_PH(uint64 instruction);
-    std::string ADDU_QB(uint64 instruction);
-    std::string ADDU_S_PH(uint64 instruction);
-    std::string ADDU_S_QB(uint64 instruction);
-    std::string ADDUH_QB(uint64 instruction);
-    std::string ADDUH_R_QB(uint64 instruction);
-    std::string ADDWC(uint64 instruction);
-    std::string ALUIPC(uint64 instruction);
-    std::string AND_16_(uint64 instruction);
-    std::string AND_32_(uint64 instruction);
-    std::string ANDI_16_(uint64 instruction);
-    std::string ANDI_32_(uint64 instruction);
-    std::string APPEND(uint64 instruction);
-    std::string ASET(uint64 instruction);
-    std::string BALC_16_(uint64 instruction);
-    std::string BALC_32_(uint64 instruction);
-    std::string BALRSC(uint64 instruction);
-    std::string BBEQZC(uint64 instruction);
-    std::string BBNEZC(uint64 instruction);
-    std::string BC_16_(uint64 instruction);
-    std::string BC_32_(uint64 instruction);
-    std::string BC1EQZC(uint64 instruction);
-    std::string BC1NEZC(uint64 instruction);
-    std::string BC2EQZC(uint64 instruction);
-    std::string BC2NEZC(uint64 instruction);
-    std::string BEQC_16_(uint64 instruction);
-    std::string BEQC_32_(uint64 instruction);
-    std::string BEQIC(uint64 instruction);
-    std::string BEQZC_16_(uint64 instruction);
-    std::string BGEC(uint64 instruction);
-    std::string BGEIC(uint64 instruction);
-    std::string BGEIUC(uint64 instruction);
-    std::string BGEUC(uint64 instruction);
-    std::string BLTC(uint64 instruction);
-    std::string BLTIC(uint64 instruction);
-    std::string BLTIUC(uint64 instruction);
-    std::string BLTUC(uint64 instruction);
-    std::string BNEC_16_(uint64 instruction);
-    std::string BNEC_32_(uint64 instruction);
-    std::string BNEIC(uint64 instruction);
-    std::string BNEZC_16_(uint64 instruction);
-    std::string BPOSGE32C(uint64 instruction);
-    std::string BREAK_16_(uint64 instruction);
-    std::string BREAK_32_(uint64 instruction);
-    std::string BRSC(uint64 instruction);
-    std::string CACHE(uint64 instruction);
-    std::string CACHEE(uint64 instruction);
-    std::string CEIL_L_D(uint64 instruction);
-    std::string CEIL_L_S(uint64 instruction);
-    std::string CEIL_W_D(uint64 instruction);
-    std::string CEIL_W_S(uint64 instruction);
-    std::string CFC1(uint64 instruction);
-    std::string CFC2(uint64 instruction);
-    std::string CLASS_D(uint64 instruction);
-    std::string CLASS_S(uint64 instruction);
-    std::string CLO(uint64 instruction);
-    std::string CLZ(uint64 instruction);
-    std::string CMP_AF_D(uint64 instruction);
-    std::string CMP_AF_S(uint64 instruction);
-    std::string CMP_EQ_D(uint64 instruction);
-    std::string CMP_EQ_PH(uint64 instruction);
-    std::string CMP_EQ_S(uint64 instruction);
-    std::string CMP_LE_D(uint64 instruction);
-    std::string CMP_LE_PH(uint64 instruction);
-    std::string CMP_LE_S(uint64 instruction);
-    std::string CMP_LT_D(uint64 instruction);
-    std::string CMP_LT_PH(uint64 instruction);
-    std::string CMP_LT_S(uint64 instruction);
-    std::string CMP_NE_D(uint64 instruction);
-    std::string CMP_NE_S(uint64 instruction);
-    std::string CMP_OR_D(uint64 instruction);
-    std::string CMP_OR_S(uint64 instruction);
-    std::string CMP_SAF_D(uint64 instruction);
-    std::string CMP_SAF_S(uint64 instruction);
-    std::string CMP_SEQ_D(uint64 instruction);
-    std::string CMP_SEQ_S(uint64 instruction);
-    std::string CMP_SLE_D(uint64 instruction);
-    std::string CMP_SLE_S(uint64 instruction);
-    std::string CMP_SLT_D(uint64 instruction);
-    std::string CMP_SLT_S(uint64 instruction);
-    std::string CMP_SNE_D(uint64 instruction);
-    std::string CMP_SNE_S(uint64 instruction);
-    std::string CMP_SOR_D(uint64 instruction);
-    std::string CMP_SOR_S(uint64 instruction);
-    std::string CMP_SUEQ_D(uint64 instruction);
-    std::string CMP_SUEQ_S(uint64 instruction);
-    std::string CMP_SULE_D(uint64 instruction);
-    std::string CMP_SULE_S(uint64 instruction);
-    std::string CMP_SULT_D(uint64 instruction);
-    std::string CMP_SULT_S(uint64 instruction);
-    std::string CMP_SUN_D(uint64 instruction);
-    std::string CMP_SUN_S(uint64 instruction);
-    std::string CMP_SUNE_D(uint64 instruction);
-    std::string CMP_SUNE_S(uint64 instruction);
-    std::string CMP_UEQ_D(uint64 instruction);
-    std::string CMP_UEQ_S(uint64 instruction);
-    std::string CMP_ULE_D(uint64 instruction);
-    std::string CMP_ULE_S(uint64 instruction);
-    std::string CMP_ULT_D(uint64 instruction);
-    std::string CMP_ULT_S(uint64 instruction);
-    std::string CMP_UN_D(uint64 instruction);
-    std::string CMP_UN_S(uint64 instruction);
-    std::string CMP_UNE_D(uint64 instruction);
-    std::string CMP_UNE_S(uint64 instruction);
-    std::string CMPGDU_EQ_QB(uint64 instruction);
-    std::string CMPGDU_LE_QB(uint64 instruction);
-    std::string CMPGDU_LT_QB(uint64 instruction);
-    std::string CMPGU_EQ_QB(uint64 instruction);
-    std::string CMPGU_LE_QB(uint64 instruction);
-    std::string CMPGU_LT_QB(uint64 instruction);
-    std::string CMPU_EQ_QB(uint64 instruction);
-    std::string CMPU_LE_QB(uint64 instruction);
-    std::string CMPU_LT_QB(uint64 instruction);
-    std::string COP2_1(uint64 instruction);
-    std::string CTC1(uint64 instruction);
-    std::string CTC2(uint64 instruction);
-    std::string CVT_D_L(uint64 instruction);
-    std::string CVT_D_S(uint64 instruction);
-    std::string CVT_D_W(uint64 instruction);
-    std::string CVT_L_D(uint64 instruction);
-    std::string CVT_L_S(uint64 instruction);
-    std::string CVT_S_D(uint64 instruction);
-    std::string CVT_S_L(uint64 instruction);
-    std::string CVT_S_PL(uint64 instruction);
-    std::string CVT_S_PU(uint64 instruction);
-    std::string CVT_S_W(uint64 instruction);
-    std::string CVT_W_D(uint64 instruction);
-    std::string CVT_W_S(uint64 instruction);
-    std::string DADDIU_48_(uint64 instruction);
-    std::string DADDIU_NEG_(uint64 instruction);
-    std::string DADDIU_U12_(uint64 instruction);
-    std::string DADD(uint64 instruction);
-    std::string DADDU(uint64 instruction);
-    std::string DCLO(uint64 instruction);
-    std::string DCLZ(uint64 instruction);
-    std::string DDIV(uint64 instruction);
-    std::string DDIVU(uint64 instruction);
-    std::string DERET(uint64 instruction);
-    std::string DEXTM(uint64 instruction);
-    std::string DEXT(uint64 instruction);
-    std::string DEXTU(uint64 instruction);
-    std::string DINSM(uint64 instruction);
-    std::string DINS(uint64 instruction);
-    std::string DINSU(uint64 instruction);
-    std::string DI(uint64 instruction);
-    std::string DIV(uint64 instruction);
-    std::string DIV_D(uint64 instruction);
-    std::string DIV_S(uint64 instruction);
-    std::string DIVU(uint64 instruction);
-    std::string DLSA(uint64 instruction);
-    std::string DLUI_48_(uint64 instruction);
-    std::string DMFC0(uint64 instruction);
-    std::string DMFC1(uint64 instruction);
-    std::string DMFC2(uint64 instruction);
-    std::string DMFGC0(uint64 instruction);
-    std::string DMOD(uint64 instruction);
-    std::string DMODU(uint64 instruction);
-    std::string DMTC0(uint64 instruction);
-    std::string DMTC1(uint64 instruction);
-    std::string DMTC2(uint64 instruction);
-    std::string DMTGC0(uint64 instruction);
-    std::string DMT(uint64 instruction);
-    std::string DMUH(uint64 instruction);
-    std::string DMUHU(uint64 instruction);
-    std::string DMUL(uint64 instruction);
-    std::string DMULU(uint64 instruction);
-    std::string DPAQ_S_W_PH(uint64 instruction);
-    std::string DPAQ_SA_L_W(uint64 instruction);
-    std::string DPAQX_S_W_PH(uint64 instruction);
-    std::string DPAQX_SA_W_PH(uint64 instruction);
-    std::string DPAU_H_QBL(uint64 instruction);
-    std::string DPAU_H_QBR(uint64 instruction);
-    std::string DPA_W_PH(uint64 instruction);
-    std::string DPAX_W_PH(uint64 instruction);
-    std::string DPS_W_PH(uint64 instruction);
-    std::string DPSQ_SA_L_W(uint64 instruction);
-    std::string DPSQ_S_W_PH(uint64 instruction);
-    std::string DPSQX_SA_W_PH(uint64 instruction);
-    std::string DPSQX_S_W_PH(uint64 instruction);
-    std::string DPSU_H_QBL(uint64 instruction);
-    std::string DPSU_H_QBR(uint64 instruction);
-    std::string DPSX_W_PH(uint64 instruction);
-    std::string DROTR(uint64 instruction);
-    std::string DROTR32(uint64 instruction);
-    std::string DROTRV(uint64 instruction);
-    std::string DROTX(uint64 instruction);
-    std::string DSLL(uint64 instruction);
-    std::string DSLL32(uint64 instruction);
-    std::string DSLLV(uint64 instruction);
-    std::string DSRA(uint64 instruction);
-    std::string DSRA32(uint64 instruction);
-    std::string DSRAV(uint64 instruction);
-    std::string DSRL32(uint64 instruction);
-    std::string DSRL(uint64 instruction);
-    std::string DSRLV(uint64 instruction);
-    std::string DSUB(uint64 instruction);
-    std::string DSUBU(uint64 instruction);
-    std::string DVP(uint64 instruction);
-    std::string DVPE(uint64 instruction);
-    std::string EHB(uint64 instruction);
-    std::string EI(uint64 instruction);
-    std::string EMT(uint64 instruction);
-    std::string ERET(uint64 instruction);
-    std::string ERETNC(uint64 instruction);
-    std::string EVP(uint64 instruction);
-    std::string EVPE(uint64 instruction);
-    std::string EXT(uint64 instruction);
-    std::string EXTD(uint64 instruction);
-    std::string EXTD32(uint64 instruction);
-    std::string EXTP(uint64 instruction);
-    std::string EXTPDP(uint64 instruction);
-    std::string EXTPDPV(uint64 instruction);
-    std::string EXTPV(uint64 instruction);
-    std::string EXTR_RS_W(uint64 instruction);
-    std::string EXTR_R_W(uint64 instruction);
-    std::string EXTR_S_H(uint64 instruction);
-    std::string EXTR_W(uint64 instruction);
-    std::string EXTRV_R_W(uint64 instruction);
-    std::string EXTRV_RS_W(uint64 instruction);
-    std::string EXTRV_S_H(uint64 instruction);
-    std::string EXTRV_W(uint64 instruction);
-    std::string EXTW(uint64 instruction);
-    std::string FLOOR_L_D(uint64 instruction);
-    std::string FLOOR_L_S(uint64 instruction);
-    std::string FLOOR_W_D(uint64 instruction);
-    std::string FLOOR_W_S(uint64 instruction);
-    std::string FORK(uint64 instruction);
-    std::string HYPCALL(uint64 instruction);
-    std::string HYPCALL_16_(uint64 instruction);
-    std::string INS(uint64 instruction);
-    std::string INSV(uint64 instruction);
-    std::string IRET(uint64 instruction);
-    std::string JALRC_16_(uint64 instruction);
-    std::string JALRC_32_(uint64 instruction);
-    std::string JALRC_HB(uint64 instruction);
-    std::string JRC(uint64 instruction);
-    std::string LB_16_(uint64 instruction);
-    std::string LB_GP_(uint64 instruction);
-    std::string LB_S9_(uint64 instruction);
-    std::string LB_U12_(uint64 instruction);
-    std::string LBE(uint64 instruction);
-    std::string LBU_16_(uint64 instruction);
-    std::string LBU_GP_(uint64 instruction);
-    std::string LBU_S9_(uint64 instruction);
-    std::string LBU_U12_(uint64 instruction);
-    std::string LBUE(uint64 instruction);
-    std::string LBUX(uint64 instruction);
-    std::string LBX(uint64 instruction);
-    std::string LD_GP_(uint64 instruction);
-    std::string LD_S9_(uint64 instruction);
-    std::string LD_U12_(uint64 instruction);
-    std::string LDC1_GP_(uint64 instruction);
-    std::string LDC1_S9_(uint64 instruction);
-    std::string LDC1_U12_(uint64 instruction);
-    std::string LDC1X(uint64 instruction);
-    std::string LDC1XS(uint64 instruction);
-    std::string LDC2(uint64 instruction);
-    std::string LDM(uint64 instruction);
-    std::string LDPC_48_(uint64 instruction);
-    std::string LDX(uint64 instruction);
-    std::string LDXS(uint64 instruction);
-    std::string LH_16_(uint64 instruction);
-    std::string LH_GP_(uint64 instruction);
-    std::string LH_S9_(uint64 instruction);
-    std::string LH_U12_(uint64 instruction);
-    std::string LHE(uint64 instruction);
-    std::string LHU_16_(uint64 instruction);
-    std::string LHU_GP_(uint64 instruction);
-    std::string LHU_S9_(uint64 instruction);
-    std::string LHU_U12_(uint64 instruction);
-    std::string LHUE(uint64 instruction);
-    std::string LHUX(uint64 instruction);
-    std::string LHUXS(uint64 instruction);
-    std::string LHX(uint64 instruction);
-    std::string LHXS(uint64 instruction);
-    std::string LI_16_(uint64 instruction);
-    std::string LI_48_(uint64 instruction);
-    std::string LL(uint64 instruction);
-    std::string LLD(uint64 instruction);
-    std::string LLDP(uint64 instruction);
-    std::string LLE(uint64 instruction);
-    std::string LLWP(uint64 instruction);
-    std::string LLWPE(uint64 instruction);
-    std::string LSA(uint64 instruction);
-    std::string LUI(uint64 instruction);
-    std::string LW_16_(uint64 instruction);
-    std::string LW_4X4_(uint64 instruction);
-    std::string LWC1_GP_(uint64 instruction);
-    std::string LWC1_S9_(uint64 instruction);
-    std::string LWC1_U12_(uint64 instruction);
-    std::string LWC1X(uint64 instruction);
-    std::string LWC1XS(uint64 instruction);
-    std::string LWC2(uint64 instruction);
-    std::string LWE(uint64 instruction);
-    std::string LW_GP_(uint64 instruction);
-    std::string LW_GP16_(uint64 instruction);
-    std::string LWM(uint64 instruction);
-    std::string LWPC_48_(uint64 instruction);
-    std::string LW_S9_(uint64 instruction);
-    std::string LW_SP_(uint64 instruction);
-    std::string LW_U12_(uint64 instruction);
-    std::string LWU_GP_(uint64 instruction);
-    std::string LWU_S9_(uint64 instruction);
-    std::string LWU_U12_(uint64 instruction);
-    std::string LWUX(uint64 instruction);
-    std::string LWUXS(uint64 instruction);
-    std::string LWX(uint64 instruction);
-    std::string LWXS_16_(uint64 instruction);
-    std::string LWXS_32_(uint64 instruction);
-    std::string MADD_DSP_(uint64 instruction);
-    std::string MADDF_D(uint64 instruction);
-    std::string MADDF_S(uint64 instruction);
-    std::string MADDU_DSP_(uint64 instruction);
-    std::string MAQ_S_W_PHL(uint64 instruction);
-    std::string MAQ_S_W_PHR(uint64 instruction);
-    std::string MAQ_SA_W_PHL(uint64 instruction);
-    std::string MAQ_SA_W_PHR(uint64 instruction);
-    std::string MAX_D(uint64 instruction);
-    std::string MAX_S(uint64 instruction);
-    std::string MAXA_D(uint64 instruction);
-    std::string MAXA_S(uint64 instruction);
-    std::string MFC0(uint64 instruction);
-    std::string MFC1(uint64 instruction);
-    std::string MFC2(uint64 instruction);
-    std::string MFGC0(uint64 instruction);
-    std::string MFHC0(uint64 instruction);
-    std::string MFHC1(uint64 instruction);
-    std::string MFHC2(uint64 instruction);
-    std::string MFHGC0(uint64 instruction);
-    std::string MFHI_DSP_(uint64 instruction);
-    std::string MFHTR(uint64 instruction);
-    std::string MFLO_DSP_(uint64 instruction);
-    std::string MFTR(uint64 instruction);
-    std::string MIN_D(uint64 instruction);
-    std::string MIN_S(uint64 instruction);
-    std::string MINA_D(uint64 instruction);
-    std::string MINA_S(uint64 instruction);
-    std::string MOD(uint64 instruction);
-    std::string MODSUB(uint64 instruction);
-    std::string MODU(uint64 instruction);
-    std::string MOV_D(uint64 instruction);
-    std::string MOV_S(uint64 instruction);
-    std::string MOVE_BALC(uint64 instruction);
-    std::string MOVEP(uint64 instruction);
-    std::string MOVEP_REV_(uint64 instruction);
-    std::string MOVE(uint64 instruction);
-    std::string MOVN(uint64 instruction);
-    std::string MOVZ(uint64 instruction);
-    std::string MSUB_DSP_(uint64 instruction);
-    std::string MSUBF_D(uint64 instruction);
-    std::string MSUBF_S(uint64 instruction);
-    std::string MSUBU_DSP_(uint64 instruction);
-    std::string MTC0(uint64 instruction);
-    std::string MTC1(uint64 instruction);
-    std::string MTC2(uint64 instruction);
-    std::string MTGC0(uint64 instruction);
-    std::string MTHC0(uint64 instruction);
-    std::string MTHC1(uint64 instruction);
-    std::string MTHC2(uint64 instruction);
-    std::string MTHGC0(uint64 instruction);
-    std::string MTHI_DSP_(uint64 instruction);
-    std::string MTHLIP(uint64 instruction);
-    std::string MTHTR(uint64 instruction);
-    std::string MTLO_DSP_(uint64 instruction);
-    std::string MTTR(uint64 instruction);
-    std::string MUH(uint64 instruction);
-    std::string MUHU(uint64 instruction);
-    std::string MUL_32_(uint64 instruction);
-    std::string MUL_4X4_(uint64 instruction);
-    std::string MUL_D(uint64 instruction);
-    std::string MUL_PH(uint64 instruction);
-    std::string MUL_S(uint64 instruction);
-    std::string MUL_S_PH(uint64 instruction);
-    std::string MULEQ_S_W_PHL(uint64 instruction);
-    std::string MULEQ_S_W_PHR(uint64 instruction);
-    std::string MULEU_S_PH_QBL(uint64 instruction);
-    std::string MULEU_S_PH_QBR(uint64 instruction);
-    std::string MULQ_RS_PH(uint64 instruction);
-    std::string MULQ_RS_W(uint64 instruction);
-    std::string MULQ_S_PH(uint64 instruction);
-    std::string MULQ_S_W(uint64 instruction);
-    std::string MULSA_W_PH(uint64 instruction);
-    std::string MULSAQ_S_W_PH(uint64 instruction);
-    std::string MULT_DSP_(uint64 instruction);
-    std::string MULTU_DSP_(uint64 instruction);
-    std::string MULU(uint64 instruction);
-    std::string NEG_D(uint64 instruction);
-    std::string NEG_S(uint64 instruction);
-    std::string NOP_16_(uint64 instruction);
-    std::string NOP_32_(uint64 instruction);
-    std::string NOR(uint64 instruction);
-    std::string NOT_16_(uint64 instruction);
-    std::string OR_16_(uint64 instruction);
-    std::string OR_32_(uint64 instruction);
-    std::string ORI(uint64 instruction);
-    std::string PACKRL_PH(uint64 instruction);
-    std::string PAUSE(uint64 instruction);
-    std::string PICK_PH(uint64 instruction);
-    std::string PICK_QB(uint64 instruction);
-    std::string PRECEQ_W_PHL(uint64 instruction);
-    std::string PRECEQ_W_PHR(uint64 instruction);
-    std::string PRECEQU_PH_QBL(uint64 instruction);
-    std::string PRECEQU_PH_QBLA(uint64 instruction);
-    std::string PRECEQU_PH_QBR(uint64 instruction);
-    std::string PRECEQU_PH_QBRA(uint64 instruction);
-    std::string PRECEU_PH_QBL(uint64 instruction);
-    std::string PRECEU_PH_QBLA(uint64 instruction);
-    std::string PRECEU_PH_QBR(uint64 instruction);
-    std::string PRECEU_PH_QBRA(uint64 instruction);
-    std::string PRECR_QB_PH(uint64 instruction);
-    std::string PRECR_SRA_PH_W(uint64 instruction);
-    std::string PRECR_SRA_R_PH_W(uint64 instruction);
-    std::string PRECRQ_PH_W(uint64 instruction);
-    std::string PRECRQ_QB_PH(uint64 instruction);
-    std::string PRECRQ_RS_PH_W(uint64 instruction);
-    std::string PRECRQU_S_QB_PH(uint64 instruction);
-    std::string PREF_S9_(uint64 instruction);
-    std::string PREF_U12_(uint64 instruction);
-    std::string PREFE(uint64 instruction);
-    std::string PREPEND(uint64 instruction);
-    std::string RADDU_W_QB(uint64 instruction);
-    std::string RDDSP(uint64 instruction);
-    std::string RDHWR(uint64 instruction);
-    std::string RDPGPR(uint64 instruction);
-    std::string RECIP_D(uint64 instruction);
-    std::string RECIP_S(uint64 instruction);
-    std::string REPL_PH(uint64 instruction);
-    std::string REPL_QB(uint64 instruction);
-    std::string REPLV_PH(uint64 instruction);
-    std::string REPLV_QB(uint64 instruction);
-    std::string RESTORE_32_(uint64 instruction);
-    std::string RESTORE_JRC_16_(uint64 instruction);
-    std::string RESTORE_JRC_32_(uint64 instruction);
-    std::string RESTOREF(uint64 instruction);
-    std::string RINT_D(uint64 instruction);
-    std::string RINT_S(uint64 instruction);
-    std::string ROTR(uint64 instruction);
-    std::string ROTRV(uint64 instruction);
-    std::string ROTX(uint64 instruction);
-    std::string ROUND_L_D(uint64 instruction);
-    std::string ROUND_L_S(uint64 instruction);
-    std::string ROUND_W_D(uint64 instruction);
-    std::string ROUND_W_S(uint64 instruction);
-    std::string RSQRT_D(uint64 instruction);
-    std::string RSQRT_S(uint64 instruction);
-    std::string SAVE_16_(uint64 instruction);
-    std::string SAVE_32_(uint64 instruction);
-    std::string SAVEF(uint64 instruction);
-    std::string SB_16_(uint64 instruction);
-    std::string SB_GP_(uint64 instruction);
-    std::string SB_S9_(uint64 instruction);
-    std::string SB_U12_(uint64 instruction);
-    std::string SBE(uint64 instruction);
-    std::string SBX(uint64 instruction);
-    std::string SC(uint64 instruction);
-    std::string SCD(uint64 instruction);
-    std::string SCDP(uint64 instruction);
-    std::string SCE(uint64 instruction);
-    std::string SCWP(uint64 instruction);
-    std::string SCWPE(uint64 instruction);
-    std::string SD_GP_(uint64 instruction);
-    std::string SD_S9_(uint64 instruction);
-    std::string SD_U12_(uint64 instruction);
-    std::string SDBBP_16_(uint64 instruction);
-    std::string SDBBP_32_(uint64 instruction);
-    std::string SDC1_GP_(uint64 instruction);
-    std::string SDC1_S9_(uint64 instruction);
-    std::string SDC1_U12_(uint64 instruction);
-    std::string SDC1X(uint64 instruction);
-    std::string SDC1XS(uint64 instruction);
-    std::string SDC2(uint64 instruction);
-    std::string SDM(uint64 instruction);
-    std::string SDPC_48_(uint64 instruction);
-    std::string SDX(uint64 instruction);
-    std::string SDXS(uint64 instruction);
-    std::string SEB(uint64 instruction);
-    std::string SEH(uint64 instruction);
-    std::string SEL_D(uint64 instruction);
-    std::string SEL_S(uint64 instruction);
-    std::string SELEQZ_D(uint64 instruction);
-    std::string SELEQZ_S(uint64 instruction);
-    std::string SELNEZ_D(uint64 instruction);
-    std::string SELNEZ_S(uint64 instruction);
-    std::string SEQI(uint64 instruction);
-    std::string SH_16_(uint64 instruction);
-    std::string SH_GP_(uint64 instruction);
-    std::string SH_S9_(uint64 instruction);
-    std::string SH_U12_(uint64 instruction);
-    std::string SHE(uint64 instruction);
-    std::string SHILO(uint64 instruction);
-    std::string SHILOV(uint64 instruction);
-    std::string SHLL_PH(uint64 instruction);
-    std::string SHLL_QB(uint64 instruction);
-    std::string SHLL_S_PH(uint64 instruction);
-    std::string SHLL_S_W(uint64 instruction);
-    std::string SHLLV_PH(uint64 instruction);
-    std::string SHLLV_QB(uint64 instruction);
-    std::string SHLLV_S_PH(uint64 instruction);
-    std::string SHLLV_S_W(uint64 instruction);
-    std::string SHRA_PH(uint64 instruction);
-    std::string SHRA_QB(uint64 instruction);
-    std::string SHRA_R_PH(uint64 instruction);
-    std::string SHRA_R_QB(uint64 instruction);
-    std::string SHRA_R_W(uint64 instruction);
-    std::string SHRAV_PH(uint64 instruction);
-    std::string SHRAV_QB(uint64 instruction);
-    std::string SHRAV_R_PH(uint64 instruction);
-    std::string SHRAV_R_QB(uint64 instruction);
-    std::string SHRAV_R_W(uint64 instruction);
-    std::string SHRL_PH(uint64 instruction);
-    std::string SHRL_QB(uint64 instruction);
-    std::string SHRLV_PH(uint64 instruction);
-    std::string SHRLV_QB(uint64 instruction);
-    std::string SHX(uint64 instruction);
-    std::string SHXS(uint64 instruction);
-    std::string SIGRIE(uint64 instruction);
-    std::string SLL_16_(uint64 instruction);
-    std::string SLL_32_(uint64 instruction);
-    std::string SLLV(uint64 instruction);
-    std::string SLT(uint64 instruction);
-    std::string SLTI(uint64 instruction);
-    std::string SLTIU(uint64 instruction);
-    std::string SLTU(uint64 instruction);
-    std::string SOV(uint64 instruction);
-    std::string SPECIAL2(uint64 instruction);
-    std::string SQRT_D(uint64 instruction);
-    std::string SQRT_S(uint64 instruction);
-    std::string SRA(uint64 instruction);
-    std::string SRAV(uint64 instruction);
-    std::string SRL_16_(uint64 instruction);
-    std::string SRL_32_(uint64 instruction);
-    std::string SRLV(uint64 instruction);
-    std::string SUB(uint64 instruction);
-    std::string SUB_D(uint64 instruction);
-    std::string SUB_S(uint64 instruction);
-    std::string SUBQ_PH(uint64 instruction);
-    std::string SUBQ_S_PH(uint64 instruction);
-    std::string SUBQ_S_W(uint64 instruction);
-    std::string SUBQH_PH(uint64 instruction);
-    std::string SUBQH_R_PH(uint64 instruction);
-    std::string SUBQH_R_W(uint64 instruction);
-    std::string SUBQH_W(uint64 instruction);
-    std::string SUBU_16_(uint64 instruction);
-    std::string SUBU_32_(uint64 instruction);
-    std::string SUBU_PH(uint64 instruction);
-    std::string SUBU_QB(uint64 instruction);
-    std::string SUBU_S_PH(uint64 instruction);
-    std::string SUBU_S_QB(uint64 instruction);
-    std::string SUBUH_QB(uint64 instruction);
-    std::string SUBUH_R_QB(uint64 instruction);
-    std::string SW_16_(uint64 instruction);
-    std::string SW_4X4_(uint64 instruction);
-    std::string SW_GP16_(uint64 instruction);
-    std::string SW_GP_(uint64 instruction);
-    std::string SW_S9_(uint64 instruction);
-    std::string SW_SP_(uint64 instruction);
-    std::string SW_U12_(uint64 instruction);
-    std::string SWC1_GP_(uint64 instruction);
-    std::string SWC1_S9_(uint64 instruction);
-    std::string SWC1_U12_(uint64 instruction);
-    std::string SWC1X(uint64 instruction);
-    std::string SWC1XS(uint64 instruction);
-    std::string SWC2(uint64 instruction);
-    std::string SWE(uint64 instruction);
-    std::string SWM(uint64 instruction);
-    std::string SWPC_48_(uint64 instruction);
-    std::string SWX(uint64 instruction);
-    std::string SWXS(uint64 instruction);
-    std::string SYNC(uint64 instruction);
-    std::string SYNCI(uint64 instruction);
-    std::string SYNCIE(uint64 instruction);
-    std::string SYSCALL_16_(uint64 instruction);
-    std::string SYSCALL_32_(uint64 instruction);
-    std::string TEQ(uint64 instruction);
-    std::string TLBGINV(uint64 instruction);
-    std::string TLBGINVF(uint64 instruction);
-    std::string TLBGP(uint64 instruction);
-    std::string TLBGR(uint64 instruction);
-    std::string TLBGWI(uint64 instruction);
-    std::string TLBGWR(uint64 instruction);
-    std::string TLBINV(uint64 instruction);
-    std::string TLBINVF(uint64 instruction);
-    std::string TLBP(uint64 instruction);
-    std::string TLBR(uint64 instruction);
-    std::string TLBWI(uint64 instruction);
-    std::string TLBWR(uint64 instruction);
-    std::string TNE(uint64 instruction);
-    std::string TRUNC_L_D(uint64 instruction);
-    std::string TRUNC_L_S(uint64 instruction);
-    std::string TRUNC_W_D(uint64 instruction);
-    std::string TRUNC_W_S(uint64 instruction);
-    std::string UALDM(uint64 instruction);
-    std::string UALH(uint64 instruction);
-    std::string UALWM(uint64 instruction);
-    std::string UASDM(uint64 instruction);
-    std::string UASH(uint64 instruction);
-    std::string UASWM(uint64 instruction);
-    std::string UDI(uint64 instruction);
-    std::string WAIT(uint64 instruction);
-    std::string WRDSP(uint64 instruction);
-    std::string WRPGPR(uint64 instruction);
-    std::string XOR_16_(uint64 instruction);
-    std::string XOR_32_(uint64 instruction);
-    std::string XORI(uint64 instruction);
-    std::string YIELD(uint64 instruction);
+    std::string ABS_D(uint64 instruction, Dis_info *info);
+    std::string ABS_S(uint64 instruction, Dis_info *info);
+    std::string ABSQ_S_PH(uint64 instruction, Dis_info *info);
+    std::string ABSQ_S_QB(uint64 instruction, Dis_info *info);
+    std::string ABSQ_S_W(uint64 instruction, Dis_info *info);
+    std::string ACLR(uint64 instruction, Dis_info *info);
+    std::string ADD(uint64 instruction, Dis_info *info);
+    std::string ADD_D(uint64 instruction, Dis_info *info);
+    std::string ADD_S(uint64 instruction, Dis_info *info);
+    std::string ADDIU_32_(uint64 instruction, Dis_info *info);
+    std::string ADDIU_48_(uint64 instruction, Dis_info *info);
+    std::string ADDIU_GP48_(uint64 instruction, Dis_info *info);
+    std::string ADDIU_GP_B_(uint64 instruction, Dis_info *info);
+    std::string ADDIU_GP_W_(uint64 instruction, Dis_info *info);
+    std::string ADDIU_NEG_(uint64 instruction, Dis_info *info);
+    std::string ADDIU_R1_SP_(uint64 instruction, Dis_info *info);
+    std::string ADDIU_R2_(uint64 instruction, Dis_info *info);
+    std::string ADDIU_RS5_(uint64 instruction, Dis_info *info);
+    std::string ADDIUPC_32_(uint64 instruction, Dis_info *info);
+    std::string ADDIUPC_48_(uint64 instruction, Dis_info *info);
+    std::string ADDQ_PH(uint64 instruction, Dis_info *info);
+    std::string ADDQ_S_PH(uint64 instruction, Dis_info *info);
+    std::string ADDQ_S_W(uint64 instruction, Dis_info *info);
+    std::string ADDQH_PH(uint64 instruction, Dis_info *info);
+    std::string ADDQH_R_PH(uint64 instruction, Dis_info *info);
+    std::string ADDQH_R_W(uint64 instruction, Dis_info *info);
+    std::string ADDQH_W(uint64 instruction, Dis_info *info);
+    std::string ADDSC(uint64 instruction, Dis_info *info);
+    std::string ADDU_16_(uint64 instruction, Dis_info *info);
+    std::string ADDU_32_(uint64 instruction, Dis_info *info);
+    std::string ADDU_4X4_(uint64 instruction, Dis_info *info);
+    std::string ADDU_PH(uint64 instruction, Dis_info *info);
+    std::string ADDU_QB(uint64 instruction, Dis_info *info);
+    std::string ADDU_S_PH(uint64 instruction, Dis_info *info);
+    std::string ADDU_S_QB(uint64 instruction, Dis_info *info);
+    std::string ADDUH_QB(uint64 instruction, Dis_info *info);
+    std::string ADDUH_R_QB(uint64 instruction, Dis_info *info);
+    std::string ADDWC(uint64 instruction, Dis_info *info);
+    std::string ALUIPC(uint64 instruction, Dis_info *info);
+    std::string AND_16_(uint64 instruction, Dis_info *info);
+    std::string AND_32_(uint64 instruction, Dis_info *info);
+    std::string ANDI_16_(uint64 instruction, Dis_info *info);
+    std::string ANDI_32_(uint64 instruction, Dis_info *info);
+    std::string APPEND(uint64 instruction, Dis_info *info);
+    std::string ASET(uint64 instruction, Dis_info *info);
+    std::string BALC_16_(uint64 instruction, Dis_info *info);
+    std::string BALC_32_(uint64 instruction, Dis_info *info);
+    std::string BALRSC(uint64 instruction, Dis_info *info);
+    std::string BBEQZC(uint64 instruction, Dis_info *info);
+    std::string BBNEZC(uint64 instruction, Dis_info *info);
+    std::string BC_16_(uint64 instruction, Dis_info *info);
+    std::string BC_32_(uint64 instruction, Dis_info *info);
+    std::string BC1EQZC(uint64 instruction, Dis_info *info);
+    std::string BC1NEZC(uint64 instruction, Dis_info *info);
+    std::string BC2EQZC(uint64 instruction, Dis_info *info);
+    std::string BC2NEZC(uint64 instruction, Dis_info *info);
+    std::string BEQC_16_(uint64 instruction, Dis_info *info);
+    std::string BEQC_32_(uint64 instruction, Dis_info *info);
+    std::string BEQIC(uint64 instruction, Dis_info *info);
+    std::string BEQZC_16_(uint64 instruction, Dis_info *info);
+    std::string BGEC(uint64 instruction, Dis_info *info);
+    std::string BGEIC(uint64 instruction, Dis_info *info);
+    std::string BGEIUC(uint64 instruction, Dis_info *info);
+    std::string BGEUC(uint64 instruction, Dis_info *info);
+    std::string BLTC(uint64 instruction, Dis_info *info);
+    std::string BLTIC(uint64 instruction, Dis_info *info);
+    std::string BLTIUC(uint64 instruction, Dis_info *info);
+    std::string BLTUC(uint64 instruction, Dis_info *info);
+    std::string BNEC_16_(uint64 instruction, Dis_info *info);
+    std::string BNEC_32_(uint64 instruction, Dis_info *info);
+    std::string BNEIC(uint64 instruction, Dis_info *info);
+    std::string BNEZC_16_(uint64 instruction, Dis_info *info);
+    std::string BPOSGE32C(uint64 instruction, Dis_info *info);
+    std::string BREAK_16_(uint64 instruction, Dis_info *info);
+    std::string BREAK_32_(uint64 instruction, Dis_info *info);
+    std::string BRSC(uint64 instruction, Dis_info *info);
+    std::string CACHE(uint64 instruction, Dis_info *info);
+    std::string CACHEE(uint64 instruction, Dis_info *info);
+    std::string CEIL_L_D(uint64 instruction, Dis_info *info);
+    std::string CEIL_L_S(uint64 instruction, Dis_info *info);
+    std::string CEIL_W_D(uint64 instruction, Dis_info *info);
+    std::string CEIL_W_S(uint64 instruction, Dis_info *info);
+    std::string CFC1(uint64 instruction, Dis_info *info);
+    std::string CFC2(uint64 instruction, Dis_info *info);
+    std::string CLASS_D(uint64 instruction, Dis_info *info);
+    std::string CLASS_S(uint64 instruction, Dis_info *info);
+    std::string CLO(uint64 instruction, Dis_info *info);
+    std::string CLZ(uint64 instruction, Dis_info *info);
+    std::string CMP_AF_D(uint64 instruction, Dis_info *info);
+    std::string CMP_AF_S(uint64 instruction, Dis_info *info);
+    std::string CMP_EQ_D(uint64 instruction, Dis_info *info);
+    std::string CMP_EQ_PH(uint64 instruction, Dis_info *info);
+    std::string CMP_EQ_S(uint64 instruction, Dis_info *info);
+    std::string CMP_LE_D(uint64 instruction, Dis_info *info);
+    std::string CMP_LE_PH(uint64 instruction, Dis_info *info);
+    std::string CMP_LE_S(uint64 instruction, Dis_info *info);
+    std::string CMP_LT_D(uint64 instruction, Dis_info *info);
+    std::string CMP_LT_PH(uint64 instruction, Dis_info *info);
+    std::string CMP_LT_S(uint64 instruction, Dis_info *info);
+    std::string CMP_NE_D(uint64 instruction, Dis_info *info);
+    std::string CMP_NE_S(uint64 instruction, Dis_info *info);
+    std::string CMP_OR_D(uint64 instruction, Dis_info *info);
+    std::string CMP_OR_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SAF_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SAF_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SEQ_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SEQ_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SLE_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SLE_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SLT_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SLT_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SNE_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SNE_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SOR_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SOR_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SUEQ_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SUEQ_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SULE_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SULE_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SULT_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SULT_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SUN_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SUN_S(uint64 instruction, Dis_info *info);
+    std::string CMP_SUNE_D(uint64 instruction, Dis_info *info);
+    std::string CMP_SUNE_S(uint64 instruction, Dis_info *info);
+    std::string CMP_UEQ_D(uint64 instruction, Dis_info *info);
+    std::string CMP_UEQ_S(uint64 instruction, Dis_info *info);
+    std::string CMP_ULE_D(uint64 instruction, Dis_info *info);
+    std::string CMP_ULE_S(uint64 instruction, Dis_info *info);
+    std::string CMP_ULT_D(uint64 instruction, Dis_info *info);
+    std::string CMP_ULT_S(uint64 instruction, Dis_info *info);
+    std::string CMP_UN_D(uint64 instruction, Dis_info *info);
+    std::string CMP_UN_S(uint64 instruction, Dis_info *info);
+    std::string CMP_UNE_D(uint64 instruction, Dis_info *info);
+    std::string CMP_UNE_S(uint64 instruction, Dis_info *info);
+    std::string CMPGDU_EQ_QB(uint64 instruction, Dis_info *info);
+    std::string CMPGDU_LE_QB(uint64 instruction, Dis_info *info);
+    std::string CMPGDU_LT_QB(uint64 instruction, Dis_info *info);
+    std::string CMPGU_EQ_QB(uint64 instruction, Dis_info *info);
+    std::string CMPGU_LE_QB(uint64 instruction, Dis_info *info);
+    std::string CMPGU_LT_QB(uint64 instruction, Dis_info *info);
+    std::string CMPU_EQ_QB(uint64 instruction, Dis_info *info);
+    std::string CMPU_LE_QB(uint64 instruction, Dis_info *info);
+    std::string CMPU_LT_QB(uint64 instruction, Dis_info *info);
+    std::string COP2_1(uint64 instruction, Dis_info *info);
+    std::string CTC1(uint64 instruction, Dis_info *info);
+    std::string CTC2(uint64 instruction, Dis_info *info);
+    std::string CVT_D_L(uint64 instruction, Dis_info *info);
+    std::string CVT_D_S(uint64 instruction, Dis_info *info);
+    std::string CVT_D_W(uint64 instruction, Dis_info *info);
+    std::string CVT_L_D(uint64 instruction, Dis_info *info);
+    std::string CVT_L_S(uint64 instruction, Dis_info *info);
+    std::string CVT_S_D(uint64 instruction, Dis_info *info);
+    std::string CVT_S_L(uint64 instruction, Dis_info *info);
+    std::string CVT_S_PL(uint64 instruction, Dis_info *info);
+    std::string CVT_S_PU(uint64 instruction, Dis_info *info);
+    std::string CVT_S_W(uint64 instruction, Dis_info *info);
+    std::string CVT_W_D(uint64 instruction, Dis_info *info);
+    std::string CVT_W_S(uint64 instruction, Dis_info *info);
+    std::string DADDIU_48_(uint64 instruction, Dis_info *info);
+    std::string DADDIU_NEG_(uint64 instruction, Dis_info *info);
+    std::string DADDIU_U12_(uint64 instruction, Dis_info *info);
+    std::string DADD(uint64 instruction, Dis_info *info);
+    std::string DADDU(uint64 instruction, Dis_info *info);
+    std::string DCLO(uint64 instruction, Dis_info *info);
+    std::string DCLZ(uint64 instruction, Dis_info *info);
+    std::string DDIV(uint64 instruction, Dis_info *info);
+    std::string DDIVU(uint64 instruction, Dis_info *info);
+    std::string DERET(uint64 instruction, Dis_info *info);
+    std::string DEXTM(uint64 instruction, Dis_info *info);
+    std::string DEXT(uint64 instruction, Dis_info *info);
+    std::string DEXTU(uint64 instruction, Dis_info *info);
+    std::string DINSM(uint64 instruction, Dis_info *info);
+    std::string DINS(uint64 instruction, Dis_info *info);
+    std::string DINSU(uint64 instruction, Dis_info *info);
+    std::string DI(uint64 instruction, Dis_info *info);
+    std::string DIV(uint64 instruction, Dis_info *info);
+    std::string DIV_D(uint64 instruction, Dis_info *info);
+    std::string DIV_S(uint64 instruction, Dis_info *info);
+    std::string DIVU(uint64 instruction, Dis_info *info);
+    std::string DLSA(uint64 instruction, Dis_info *info);
+    std::string DLUI_48_(uint64 instruction, Dis_info *info);
+    std::string DMFC0(uint64 instruction, Dis_info *info);
+    std::string DMFC1(uint64 instruction, Dis_info *info);
+    std::string DMFC2(uint64 instruction, Dis_info *info);
+    std::string DMFGC0(uint64 instruction, Dis_info *info);
+    std::string DMOD(uint64 instruction, Dis_info *info);
+    std::string DMODU(uint64 instruction, Dis_info *info);
+    std::string DMTC0(uint64 instruction, Dis_info *info);
+    std::string DMTC1(uint64 instruction, Dis_info *info);
+    std::string DMTC2(uint64 instruction, Dis_info *info);
+    std::string DMTGC0(uint64 instruction, Dis_info *info);
+    std::string DMT(uint64 instruction, Dis_info *info);
+    std::string DMUH(uint64 instruction, Dis_info *info);
+    std::string DMUHU(uint64 instruction, Dis_info *info);
+    std::string DMUL(uint64 instruction, Dis_info *info);
+    std::string DMULU(uint64 instruction, Dis_info *info);
+    std::string DPAQ_S_W_PH(uint64 instruction, Dis_info *info);
+    std::string DPAQ_SA_L_W(uint64 instruction, Dis_info *info);
+    std::string DPAQX_S_W_PH(uint64 instruction, Dis_info *info);
+    std::string DPAQX_SA_W_PH(uint64 instruction, Dis_info *info);
+    std::string DPAU_H_QBL(uint64 instruction, Dis_info *info);
+    std::string DPAU_H_QBR(uint64 instruction, Dis_info *info);
+    std::string DPA_W_PH(uint64 instruction, Dis_info *info);
+    std::string DPAX_W_PH(uint64 instruction, Dis_info *info);
+    std::string DPS_W_PH(uint64 instruction, Dis_info *info);
+    std::string DPSQ_SA_L_W(uint64 instruction, Dis_info *info);
+    std::string DPSQ_S_W_PH(uint64 instruction, Dis_info *info);
+    std::string DPSQX_SA_W_PH(uint64 instruction, Dis_info *info);
+    std::string DPSQX_S_W_PH(uint64 instruction, Dis_info *info);
+    std::string DPSU_H_QBL(uint64 instruction, Dis_info *info);
+    std::string DPSU_H_QBR(uint64 instruction, Dis_info *info);
+    std::string DPSX_W_PH(uint64 instruction, Dis_info *info);
+    std::string DROTR(uint64 instruction, Dis_info *info);
+    std::string DROTR32(uint64 instruction, Dis_info *info);
+    std::string DROTRV(uint64 instruction, Dis_info *info);
+    std::string DROTX(uint64 instruction, Dis_info *info);
+    std::string DSLL(uint64 instruction, Dis_info *info);
+    std::string DSLL32(uint64 instruction, Dis_info *info);
+    std::string DSLLV(uint64 instruction, Dis_info *info);
+    std::string DSRA(uint64 instruction, Dis_info *info);
+    std::string DSRA32(uint64 instruction, Dis_info *info);
+    std::string DSRAV(uint64 instruction, Dis_info *info);
+    std::string DSRL32(uint64 instruction, Dis_info *info);
+    std::string DSRL(uint64 instruction, Dis_info *info);
+    std::string DSRLV(uint64 instruction, Dis_info *info);
+    std::string DSUB(uint64 instruction, Dis_info *info);
+    std::string DSUBU(uint64 instruction, Dis_info *info);
+    std::string DVP(uint64 instruction, Dis_info *info);
+    std::string DVPE(uint64 instruction, Dis_info *info);
+    std::string EHB(uint64 instruction, Dis_info *info);
+    std::string EI(uint64 instruction, Dis_info *info);
+    std::string EMT(uint64 instruction, Dis_info *info);
+    std::string ERET(uint64 instruction, Dis_info *info);
+    std::string ERETNC(uint64 instruction, Dis_info *info);
+    std::string EVP(uint64 instruction, Dis_info *info);
+    std::string EVPE(uint64 instruction, Dis_info *info);
+    std::string EXT(uint64 instruction, Dis_info *info);
+    std::string EXTD(uint64 instruction, Dis_info *info);
+    std::string EXTD32(uint64 instruction, Dis_info *info);
+    std::string EXTP(uint64 instruction, Dis_info *info);
+    std::string EXTPDP(uint64 instruction, Dis_info *info);
+    std::string EXTPDPV(uint64 instruction, Dis_info *info);
+    std::string EXTPV(uint64 instruction, Dis_info *info);
+    std::string EXTR_RS_W(uint64 instruction, Dis_info *info);
+    std::string EXTR_R_W(uint64 instruction, Dis_info *info);
+    std::string EXTR_S_H(uint64 instruction, Dis_info *info);
+    std::string EXTR_W(uint64 instruction, Dis_info *info);
+    std::string EXTRV_R_W(uint64 instruction, Dis_info *info);
+    std::string EXTRV_RS_W(uint64 instruction, Dis_info *info);
+    std::string EXTRV_S_H(uint64 instruction, Dis_info *info);
+    std::string EXTRV_W(uint64 instruction, Dis_info *info);
+    std::string EXTW(uint64 instruction, Dis_info *info);
+    std::string FLOOR_L_D(uint64 instruction, Dis_info *info);
+    std::string FLOOR_L_S(uint64 instruction, Dis_info *info);
+    std::string FLOOR_W_D(uint64 instruction, Dis_info *info);
+    std::string FLOOR_W_S(uint64 instruction, Dis_info *info);
+    std::string FORK(uint64 instruction, Dis_info *info);
+    std::string HYPCALL(uint64 instruction, Dis_info *info);
+    std::string HYPCALL_16_(uint64 instruction, Dis_info *info);
+    std::string INS(uint64 instruction, Dis_info *info);
+    std::string INSV(uint64 instruction, Dis_info *info);
+    std::string IRET(uint64 instruction, Dis_info *info);
+    std::string JALRC_16_(uint64 instruction, Dis_info *info);
+    std::string JALRC_32_(uint64 instruction, Dis_info *info);
+    std::string JALRC_HB(uint64 instruction, Dis_info *info);
+    std::string JRC(uint64 instruction, Dis_info *info);
+    std::string LB_16_(uint64 instruction, Dis_info *info);
+    std::string LB_GP_(uint64 instruction, Dis_info *info);
+    std::string LB_S9_(uint64 instruction, Dis_info *info);
+    std::string LB_U12_(uint64 instruction, Dis_info *info);
+    std::string LBE(uint64 instruction, Dis_info *info);
+    std::string LBU_16_(uint64 instruction, Dis_info *info);
+    std::string LBU_GP_(uint64 instruction, Dis_info *info);
+    std::string LBU_S9_(uint64 instruction, Dis_info *info);
+    std::string LBU_U12_(uint64 instruction, Dis_info *info);
+    std::string LBUE(uint64 instruction, Dis_info *info);
+    std::string LBUX(uint64 instruction, Dis_info *info);
+    std::string LBX(uint64 instruction, Dis_info *info);
+    std::string LD_GP_(uint64 instruction, Dis_info *info);
+    std::string LD_S9_(uint64 instruction, Dis_info *info);
+    std::string LD_U12_(uint64 instruction, Dis_info *info);
+    std::string LDC1_GP_(uint64 instruction, Dis_info *info);
+    std::string LDC1_S9_(uint64 instruction, Dis_info *info);
+    std::string LDC1_U12_(uint64 instruction, Dis_info *info);
+    std::string LDC1X(uint64 instruction, Dis_info *info);
+    std::string LDC1XS(uint64 instruction, Dis_info *info);
+    std::string LDC2(uint64 instruction, Dis_info *info);
+    std::string LDM(uint64 instruction, Dis_info *info);
+    std::string LDPC_48_(uint64 instruction, Dis_info *info);
+    std::string LDX(uint64 instruction, Dis_info *info);
+    std::string LDXS(uint64 instruction, Dis_info *info);
+    std::string LH_16_(uint64 instruction, Dis_info *info);
+    std::string LH_GP_(uint64 instruction, Dis_info *info);
+    std::string LH_S9_(uint64 instruction, Dis_info *info);
+    std::string LH_U12_(uint64 instruction, Dis_info *info);
+    std::string LHE(uint64 instruction, Dis_info *info);
+    std::string LHU_16_(uint64 instruction, Dis_info *info);
+    std::string LHU_GP_(uint64 instruction, Dis_info *info);
+    std::string LHU_S9_(uint64 instruction, Dis_info *info);
+    std::string LHU_U12_(uint64 instruction, Dis_info *info);
+    std::string LHUE(uint64 instruction, Dis_info *info);
+    std::string LHUX(uint64 instruction, Dis_info *info);
+    std::string LHUXS(uint64 instruction, Dis_info *info);
+    std::string LHX(uint64 instruction, Dis_info *info);
+    std::string LHXS(uint64 instruction, Dis_info *info);
+    std::string LI_16_(uint64 instruction, Dis_info *info);
+    std::string LI_48_(uint64 instruction, Dis_info *info);
+    std::string LL(uint64 instruction, Dis_info *info);
+    std::string LLD(uint64 instruction, Dis_info *info);
+    std::string LLDP(uint64 instruction, Dis_info *info);
+    std::string LLE(uint64 instruction, Dis_info *info);
+    std::string LLWP(uint64 instruction, Dis_info *info);
+    std::string LLWPE(uint64 instruction, Dis_info *info);
+    std::string LSA(uint64 instruction, Dis_info *info);
+    std::string LUI(uint64 instruction, Dis_info *info);
+    std::string LW_16_(uint64 instruction, Dis_info *info);
+    std::string LW_4X4_(uint64 instruction, Dis_info *info);
+    std::string LWC1_GP_(uint64 instruction, Dis_info *info);
+    std::string LWC1_S9_(uint64 instruction, Dis_info *info);
+    std::string LWC1_U12_(uint64 instruction, Dis_info *info);
+    std::string LWC1X(uint64 instruction, Dis_info *info);
+    std::string LWC1XS(uint64 instruction, Dis_info *info);
+    std::string LWC2(uint64 instruction, Dis_info *info);
+    std::string LWE(uint64 instruction, Dis_info *info);
+    std::string LW_GP_(uint64 instruction, Dis_info *info);
+    std::string LW_GP16_(uint64 instruction, Dis_info *info);
+    std::string LWM(uint64 instruction, Dis_info *info);
+    std::string LWPC_48_(uint64 instruction, Dis_info *info);
+    std::string LW_S9_(uint64 instruction, Dis_info *info);
+    std::string LW_SP_(uint64 instruction, Dis_info *info);
+    std::string LW_U12_(uint64 instruction, Dis_info *info);
+    std::string LWU_GP_(uint64 instruction, Dis_info *info);
+    std::string LWU_S9_(uint64 instruction, Dis_info *info);
+    std::string LWU_U12_(uint64 instruction, Dis_info *info);
+    std::string LWUX(uint64 instruction, Dis_info *info);
+    std::string LWUXS(uint64 instruction, Dis_info *info);
+    std::string LWX(uint64 instruction, Dis_info *info);
+    std::string LWXS_16_(uint64 instruction, Dis_info *info);
+    std::string LWXS_32_(uint64 instruction, Dis_info *info);
+    std::string MADD_DSP_(uint64 instruction, Dis_info *info);
+    std::string MADDF_D(uint64 instruction, Dis_info *info);
+    std::string MADDF_S(uint64 instruction, Dis_info *info);
+    std::string MADDU_DSP_(uint64 instruction, Dis_info *info);
+    std::string MAQ_S_W_PHL(uint64 instruction, Dis_info *info);
+    std::string MAQ_S_W_PHR(uint64 instruction, Dis_info *info);
+    std::string MAQ_SA_W_PHL(uint64 instruction, Dis_info *info);
+    std::string MAQ_SA_W_PHR(uint64 instruction, Dis_info *info);
+    std::string MAX_D(uint64 instruction, Dis_info *info);
+    std::string MAX_S(uint64 instruction, Dis_info *info);
+    std::string MAXA_D(uint64 instruction, Dis_info *info);
+    std::string MAXA_S(uint64 instruction, Dis_info *info);
+    std::string MFC0(uint64 instruction, Dis_info *info);
+    std::string MFC1(uint64 instruction, Dis_info *info);
+    std::string MFC2(uint64 instruction, Dis_info *info);
+    std::string MFGC0(uint64 instruction, Dis_info *info);
+    std::string MFHC0(uint64 instruction, Dis_info *info);
+    std::string MFHC1(uint64 instruction, Dis_info *info);
+    std::string MFHC2(uint64 instruction, Dis_info *info);
+    std::string MFHGC0(uint64 instruction, Dis_info *info);
+    std::string MFHI_DSP_(uint64 instruction, Dis_info *info);
+    std::string MFHTR(uint64 instruction, Dis_info *info);
+    std::string MFLO_DSP_(uint64 instruction, Dis_info *info);
+    std::string MFTR(uint64 instruction, Dis_info *info);
+    std::string MIN_D(uint64 instruction, Dis_info *info);
+    std::string MIN_S(uint64 instruction, Dis_info *info);
+    std::string MINA_D(uint64 instruction, Dis_info *info);
+    std::string MINA_S(uint64 instruction, Dis_info *info);
+    std::string MOD(uint64 instruction, Dis_info *info);
+    std::string MODSUB(uint64 instruction, Dis_info *info);
+    std::string MODU(uint64 instruction, Dis_info *info);
+    std::string MOV_D(uint64 instruction, Dis_info *info);
+    std::string MOV_S(uint64 instruction, Dis_info *info);
+    std::string MOVE_BALC(uint64 instruction, Dis_info *info);
+    std::string MOVEP(uint64 instruction, Dis_info *info);
+    std::string MOVEP_REV_(uint64 instruction, Dis_info *info);
+    std::string MOVE(uint64 instruction, Dis_info *info);
+    std::string MOVN(uint64 instruction, Dis_info *info);
+    std::string MOVZ(uint64 instruction, Dis_info *info);
+    std::string MSUB_DSP_(uint64 instruction, Dis_info *info);
+    std::string MSUBF_D(uint64 instruction, Dis_info *info);
+    std::string MSUBF_S(uint64 instruction, Dis_info *info);
+    std::string MSUBU_DSP_(uint64 instruction, Dis_info *info);
+    std::string MTC0(uint64 instruction, Dis_info *info);
+    std::string MTC1(uint64 instruction, Dis_info *info);
+    std::string MTC2(uint64 instruction, Dis_info *info);
+    std::string MTGC0(uint64 instruction, Dis_info *info);
+    std::string MTHC0(uint64 instruction, Dis_info *info);
+    std::string MTHC1(uint64 instruction, Dis_info *info);
+    std::string MTHC2(uint64 instruction, Dis_info *info);
+    std::string MTHGC0(uint64 instruction, Dis_info *info);
+    std::string MTHI_DSP_(uint64 instruction, Dis_info *info);
+    std::string MTHLIP(uint64 instruction, Dis_info *info);
+    std::string MTHTR(uint64 instruction, Dis_info *info);
+    std::string MTLO_DSP_(uint64 instruction, Dis_info *info);
+    std::string MTTR(uint64 instruction, Dis_info *info);
+    std::string MUH(uint64 instruction, Dis_info *info);
+    std::string MUHU(uint64 instruction, Dis_info *info);
+    std::string MUL_32_(uint64 instruction, Dis_info *info);
+    std::string MUL_4X4_(uint64 instruction, Dis_info *info);
+    std::string MUL_D(uint64 instruction, Dis_info *info);
+    std::string MUL_PH(uint64 instruction, Dis_info *info);
+    std::string MUL_S(uint64 instruction, Dis_info *info);
+    std::string MUL_S_PH(uint64 instruction, Dis_info *info);
+    std::string MULEQ_S_W_PHL(uint64 instruction, Dis_info *info);
+    std::string MULEQ_S_W_PHR(uint64 instruction, Dis_info *info);
+    std::string MULEU_S_PH_QBL(uint64 instruction, Dis_info *info);
+    std::string MULEU_S_PH_QBR(uint64 instruction, Dis_info *info);
+    std::string MULQ_RS_PH(uint64 instruction, Dis_info *info);
+    std::string MULQ_RS_W(uint64 instruction, Dis_info *info);
+    std::string MULQ_S_PH(uint64 instruction, Dis_info *info);
+    std::string MULQ_S_W(uint64 instruction, Dis_info *info);
+    std::string MULSA_W_PH(uint64 instruction, Dis_info *info);
+    std::string MULSAQ_S_W_PH(uint64 instruction, Dis_info *info);
+    std::string MULT_DSP_(uint64 instruction, Dis_info *info);
+    std::string MULTU_DSP_(uint64 instruction, Dis_info *info);
+    std::string MULU(uint64 instruction, Dis_info *info);
+    std::string NEG_D(uint64 instruction, Dis_info *info);
+    std::string NEG_S(uint64 instruction, Dis_info *info);
+    std::string NOP_16_(uint64 instruction, Dis_info *info);
+    std::string NOP_32_(uint64 instruction, Dis_info *info);
+    std::string NOR(uint64 instruction, Dis_info *info);
+    std::string NOT_16_(uint64 instruction, Dis_info *info);
+    std::string OR_16_(uint64 instruction, Dis_info *info);
+    std::string OR_32_(uint64 instruction, Dis_info *info);
+    std::string ORI(uint64 instruction, Dis_info *info);
+    std::string PACKRL_PH(uint64 instruction, Dis_info *info);
+    std::string PAUSE(uint64 instruction, Dis_info *info);
+    std::string PICK_PH(uint64 instruction, Dis_info *info);
+    std::string PICK_QB(uint64 instruction, Dis_info *info);
+    std::string PRECEQ_W_PHL(uint64 instruction, Dis_info *info);
+    std::string PRECEQ_W_PHR(uint64 instruction, Dis_info *info);
+    std::string PRECEQU_PH_QBL(uint64 instruction, Dis_info *info);
+    std::string PRECEQU_PH_QBLA(uint64 instruction, Dis_info *info);
+    std::string PRECEQU_PH_QBR(uint64 instruction, Dis_info *info);
+    std::string PRECEQU_PH_QBRA(uint64 instruction, Dis_info *info);
+    std::string PRECEU_PH_QBL(uint64 instruction, Dis_info *info);
+    std::string PRECEU_PH_QBLA(uint64 instruction, Dis_info *info);
+    std::string PRECEU_PH_QBR(uint64 instruction, Dis_info *info);
+    std::string PRECEU_PH_QBRA(uint64 instruction, Dis_info *info);
+    std::string PRECR_QB_PH(uint64 instruction, Dis_info *info);
+    std::string PRECR_SRA_PH_W(uint64 instruction, Dis_info *info);
+    std::string PRECR_SRA_R_PH_W(uint64 instruction, Dis_info *info);
+    std::string PRECRQ_PH_W(uint64 instruction, Dis_info *info);
+    std::string PRECRQ_QB_PH(uint64 instruction, Dis_info *info);
+    std::string PRECRQ_RS_PH_W(uint64 instruction, Dis_info *info);
+    std::string PRECRQU_S_QB_PH(uint64 instruction, Dis_info *info);
+    std::string PREF_S9_(uint64 instruction, Dis_info *info);
+    std::string PREF_U12_(uint64 instruction, Dis_info *info);
+    std::string PREFE(uint64 instruction, Dis_info *info);
+    std::string PREPEND(uint64 instruction, Dis_info *info);
+    std::string RADDU_W_QB(uint64 instruction, Dis_info *info);
+    std::string RDDSP(uint64 instruction, Dis_info *info);
+    std::string RDHWR(uint64 instruction, Dis_info *info);
+    std::string RDPGPR(uint64 instruction, Dis_info *info);
+    std::string RECIP_D(uint64 instruction, Dis_info *info);
+    std::string RECIP_S(uint64 instruction, Dis_info *info);
+    std::string REPL_PH(uint64 instruction, Dis_info *info);
+    std::string REPL_QB(uint64 instruction, Dis_info *info);
+    std::string REPLV_PH(uint64 instruction, Dis_info *info);
+    std::string REPLV_QB(uint64 instruction, Dis_info *info);
+    std::string RESTORE_32_(uint64 instruction, Dis_info *info);
+    std::string RESTORE_JRC_16_(uint64 instruction, Dis_info *info);
+    std::string RESTORE_JRC_32_(uint64 instruction, Dis_info *info);
+    std::string RESTOREF(uint64 instruction, Dis_info *info);
+    std::string RINT_D(uint64 instruction, Dis_info *info);
+    std::string RINT_S(uint64 instruction, Dis_info *info);
+    std::string ROTR(uint64 instruction, Dis_info *info);
+    std::string ROTRV(uint64 instruction, Dis_info *info);
+    std::string ROTX(uint64 instruction, Dis_info *info);
+    std::string ROUND_L_D(uint64 instruction, Dis_info *info);
+    std::string ROUND_L_S(uint64 instruction, Dis_info *info);
+    std::string ROUND_W_D(uint64 instruction, Dis_info *info);
+    std::string ROUND_W_S(uint64 instruction, Dis_info *info);
+    std::string RSQRT_D(uint64 instruction, Dis_info *info);
+    std::string RSQRT_S(uint64 instruction, Dis_info *info);
+    std::string SAVE_16_(uint64 instruction, Dis_info *info);
+    std::string SAVE_32_(uint64 instruction, Dis_info *info);
+    std::string SAVEF(uint64 instruction, Dis_info *info);
+    std::string SB_16_(uint64 instruction, Dis_info *info);
+    std::string SB_GP_(uint64 instruction, Dis_info *info);
+    std::string SB_S9_(uint64 instruction, Dis_info *info);
+    std::string SB_U12_(uint64 instruction, Dis_info *info);
+    std::string SBE(uint64 instruction, Dis_info *info);
+    std::string SBX(uint64 instruction, Dis_info *info);
+    std::string SC(uint64 instruction, Dis_info *info);
+    std::string SCD(uint64 instruction, Dis_info *info);
+    std::string SCDP(uint64 instruction, Dis_info *info);
+    std::string SCE(uint64 instruction, Dis_info *info);
+    std::string SCWP(uint64 instruction, Dis_info *info);
+    std::string SCWPE(uint64 instruction, Dis_info *info);
+    std::string SD_GP_(uint64 instruction, Dis_info *info);
+    std::string SD_S9_(uint64 instruction, Dis_info *info);
+    std::string SD_U12_(uint64 instruction, Dis_info *info);
+    std::string SDBBP_16_(uint64 instruction, Dis_info *info);
+    std::string SDBBP_32_(uint64 instruction, Dis_info *info);
+    std::string SDC1_GP_(uint64 instruction, Dis_info *info);
+    std::string SDC1_S9_(uint64 instruction, Dis_info *info);
+    std::string SDC1_U12_(uint64 instruction, Dis_info *info);
+    std::string SDC1X(uint64 instruction, Dis_info *info);
+    std::string SDC1XS(uint64 instruction, Dis_info *info);
+    std::string SDC2(uint64 instruction, Dis_info *info);
+    std::string SDM(uint64 instruction, Dis_info *info);
+    std::string SDPC_48_(uint64 instruction, Dis_info *info);
+    std::string SDX(uint64 instruction, Dis_info *info);
+    std::string SDXS(uint64 instruction, Dis_info *info);
+    std::string SEB(uint64 instruction, Dis_info *info);
+    std::string SEH(uint64 instruction, Dis_info *info);
+    std::string SEL_D(uint64 instruction, Dis_info *info);
+    std::string SEL_S(uint64 instruction, Dis_info *info);
+    std::string SELEQZ_D(uint64 instruction, Dis_info *info);
+    std::string SELEQZ_S(uint64 instruction, Dis_info *info);
+    std::string SELNEZ_D(uint64 instruction, Dis_info *info);
+    std::string SELNEZ_S(uint64 instruction, Dis_info *info);
+    std::string SEQI(uint64 instruction, Dis_info *info);
+    std::string SH_16_(uint64 instruction, Dis_info *info);
+    std::string SH_GP_(uint64 instruction, Dis_info *info);
+    std::string SH_S9_(uint64 instruction, Dis_info *info);
+    std::string SH_U12_(uint64 instruction, Dis_info *info);
+    std::string SHE(uint64 instruction, Dis_info *info);
+    std::string SHILO(uint64 instruction, Dis_info *info);
+    std::string SHILOV(uint64 instruction, Dis_info *info);
+    std::string SHLL_PH(uint64 instruction, Dis_info *info);
+    std::string SHLL_QB(uint64 instruction, Dis_info *info);
+    std::string SHLL_S_PH(uint64 instruction, Dis_info *info);
+    std::string SHLL_S_W(uint64 instruction, Dis_info *info);
+    std::string SHLLV_PH(uint64 instruction, Dis_info *info);
+    std::string SHLLV_QB(uint64 instruction, Dis_info *info);
+    std::string SHLLV_S_PH(uint64 instruction, Dis_info *info);
+    std::string SHLLV_S_W(uint64 instruction, Dis_info *info);
+    std::string SHRA_PH(uint64 instruction, Dis_info *info);
+    std::string SHRA_QB(uint64 instruction, Dis_info *info);
+    std::string SHRA_R_PH(uint64 instruction, Dis_info *info);
+    std::string SHRA_R_QB(uint64 instruction, Dis_info *info);
+    std::string SHRA_R_W(uint64 instruction, Dis_info *info);
+    std::string SHRAV_PH(uint64 instruction, Dis_info *info);
+    std::string SHRAV_QB(uint64 instruction, Dis_info *info);
+    std::string SHRAV_R_PH(uint64 instruction, Dis_info *info);
+    std::string SHRAV_R_QB(uint64 instruction, Dis_info *info);
+    std::string SHRAV_R_W(uint64 instruction, Dis_info *info);
+    std::string SHRL_PH(uint64 instruction, Dis_info *info);
+    std::string SHRL_QB(uint64 instruction, Dis_info *info);
+    std::string SHRLV_PH(uint64 instruction, Dis_info *info);
+    std::string SHRLV_QB(uint64 instruction, Dis_info *info);
+    std::string SHX(uint64 instruction, Dis_info *info);
+    std::string SHXS(uint64 instruction, Dis_info *info);
+    std::string SIGRIE(uint64 instruction, Dis_info *info);
+    std::string SLL_16_(uint64 instruction, Dis_info *info);
+    std::string SLL_32_(uint64 instruction, Dis_info *info);
+    std::string SLLV(uint64 instruction, Dis_info *info);
+    std::string SLT(uint64 instruction, Dis_info *info);
+    std::string SLTI(uint64 instruction, Dis_info *info);
+    std::string SLTIU(uint64 instruction, Dis_info *info);
+    std::string SLTU(uint64 instruction, Dis_info *info);
+    std::string SOV(uint64 instruction, Dis_info *info);
+    std::string SPECIAL2(uint64 instruction, Dis_info *info);
+    std::string SQRT_D(uint64 instruction, Dis_info *info);
+    std::string SQRT_S(uint64 instruction, Dis_info *info);
+    std::string SRA(uint64 instruction, Dis_info *info);
+    std::string SRAV(uint64 instruction, Dis_info *info);
+    std::string SRL_16_(uint64 instruction, Dis_info *info);
+    std::string SRL_32_(uint64 instruction, Dis_info *info);
+    std::string SRLV(uint64 instruction, Dis_info *info);
+    std::string SUB(uint64 instruction, Dis_info *info);
+    std::string SUB_D(uint64 instruction, Dis_info *info);
+    std::string SUB_S(uint64 instruction, Dis_info *info);
+    std::string SUBQ_PH(uint64 instruction, Dis_info *info);
+    std::string SUBQ_S_PH(uint64 instruction, Dis_info *info);
+    std::string SUBQ_S_W(uint64 instruction, Dis_info *info);
+    std::string SUBQH_PH(uint64 instruction, Dis_info *info);
+    std::string SUBQH_R_PH(uint64 instruction, Dis_info *info);
+    std::string SUBQH_R_W(uint64 instruction, Dis_info *info);
+    std::string SUBQH_W(uint64 instruction, Dis_info *info);
+    std::string SUBU_16_(uint64 instruction, Dis_info *info);
+    std::string SUBU_32_(uint64 instruction, Dis_info *info);
+    std::string SUBU_PH(uint64 instruction, Dis_info *info);
+    std::string SUBU_QB(uint64 instruction, Dis_info *info);
+    std::string SUBU_S_PH(uint64 instruction, Dis_info *info);
+    std::string SUBU_S_QB(uint64 instruction, Dis_info *info);
+    std::string SUBUH_QB(uint64 instruction, Dis_info *info);
+    std::string SUBUH_R_QB(uint64 instruction, Dis_info *info);
+    std::string SW_16_(uint64 instruction, Dis_info *info);
+    std::string SW_4X4_(uint64 instruction, Dis_info *info);
+    std::string SW_GP16_(uint64 instruction, Dis_info *info);
+    std::string SW_GP_(uint64 instruction, Dis_info *info);
+    std::string SW_S9_(uint64 instruction, Dis_info *info);
+    std::string SW_SP_(uint64 instruction, Dis_info *info);
+    std::string SW_U12_(uint64 instruction, Dis_info *info);
+    std::string SWC1_GP_(uint64 instruction, Dis_info *info);
+    std::string SWC1_S9_(uint64 instruction, Dis_info *info);
+    std::string SWC1_U12_(uint64 instruction, Dis_info *info);
+    std::string SWC1X(uint64 instruction, Dis_info *info);
+    std::string SWC1XS(uint64 instruction, Dis_info *info);
+    std::string SWC2(uint64 instruction, Dis_info *info);
+    std::string SWE(uint64 instruction, Dis_info *info);
+    std::string SWM(uint64 instruction, Dis_info *info);
+    std::string SWPC_48_(uint64 instruction, Dis_info *info);
+    std::string SWX(uint64 instruction, Dis_info *info);
+    std::string SWXS(uint64 instruction, Dis_info *info);
+    std::string SYNC(uint64 instruction, Dis_info *info);
+    std::string SYNCI(uint64 instruction, Dis_info *info);
+    std::string SYNCIE(uint64 instruction, Dis_info *info);
+    std::string SYSCALL_16_(uint64 instruction, Dis_info *info);
+    std::string SYSCALL_32_(uint64 instruction, Dis_info *info);
+    std::string TEQ(uint64 instruction, Dis_info *info);
+    std::string TLBGINV(uint64 instruction, Dis_info *info);
+    std::string TLBGINVF(uint64 instruction, Dis_info *info);
+    std::string TLBGP(uint64 instruction, Dis_info *info);
+    std::string TLBGR(uint64 instruction, Dis_info *info);
+    std::string TLBGWI(uint64 instruction, Dis_info *info);
+    std::string TLBGWR(uint64 instruction, Dis_info *info);
+    std::string TLBINV(uint64 instruction, Dis_info *info);
+    std::string TLBINVF(uint64 instruction, Dis_info *info);
+    std::string TLBP(uint64 instruction, Dis_info *info);
+    std::string TLBR(uint64 instruction, Dis_info *info);
+    std::string TLBWI(uint64 instruction, Dis_info *info);
+    std::string TLBWR(uint64 instruction, Dis_info *info);
+    std::string TNE(uint64 instruction, Dis_info *info);
+    std::string TRUNC_L_D(uint64 instruction, Dis_info *info);
+    std::string TRUNC_L_S(uint64 instruction, Dis_info *info);
+    std::string TRUNC_W_D(uint64 instruction, Dis_info *info);
+    std::string TRUNC_W_S(uint64 instruction, Dis_info *info);
+    std::string UALDM(uint64 instruction, Dis_info *info);
+    std::string UALH(uint64 instruction, Dis_info *info);
+    std::string UALWM(uint64 instruction, Dis_info *info);
+    std::string UASDM(uint64 instruction, Dis_info *info);
+    std::string UASH(uint64 instruction, Dis_info *info);
+    std::string UASWM(uint64 instruction, Dis_info *info);
+    std::string UDI(uint64 instruction, Dis_info *info);
+    std::string WAIT(uint64 instruction, Dis_info *info);
+    std::string WRDSP(uint64 instruction, Dis_info *info);
+    std::string WRPGPR(uint64 instruction, Dis_info *info);
+    std::string XOR_16_(uint64 instruction, Dis_info *info);
+    std::string XOR_32_(uint64 instruction, Dis_info *info);
+    std::string XORI(uint64 instruction, Dis_info *info);
+    std::string YIELD(uint64 instruction, Dis_info *info);
 
     static Pool P_SYSCALL[2];
     static Pool P_RI[4];
-- 
2.37.3


