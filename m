Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FE9612D69
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:33:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGr6-0000ZI-4y; Sun, 30 Oct 2022 18:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqa-00086X-G9
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqU-0008NZ-IC
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id j15so13680001wrq.3
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLMrMF9JUG9JRw5xeMgsiyRkmV+wD0Dv9qV524c2ZG0=;
 b=H9P7pDfM6oOv8A/k9KcvUdwwvv2KpcsEaaM0fr1Ckj+jE00+J9yPQEVabZfmtq0mxp
 R591KWFvpUylZg+mdv0aZ+TQDpP6tvJoGzuxTAEsXUWz/iD50NRt64C7N9YWhjj850BK
 LsphJ4qDXBhHSjn2Ycc1gNx6XLcGTfsuCSOFDrTAvqdkaTNMYCmam5ki8jl4UrTRyoxS
 Qf86xPziuKt/MxkNoyHtLfdVt5gSR3akxEe4YG5gZZ8+hFTdoBNU656YYG9sOGMIU+sE
 0Ij9yc34Hd8pIus8VjOqRYLPvq1zZby6kiIxMNoI9uBQVMm01/ythkhvZceWXInxP2w+
 Br+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLMrMF9JUG9JRw5xeMgsiyRkmV+wD0Dv9qV524c2ZG0=;
 b=4mlX9yVqZ5dvlt6bdtxGnox1Nwr7R+XpdwzMWwaEGiO+B27HT6pSit73hfrdRivYDf
 9HzFbl8tBBFC/rYNAT8I/l8j+WCMCrHxZsFnfacqqVpQhQhGzgIjOSbyxxA5LMZjH+v7
 oN1GyUKJXjjnuE0MC03KqcCEnMXmAmOufTkiF4L0kz3JIu/ZhLOBBpbIjOBT1w+aoFxq
 jtQuL5EXl8UxvdT7dxYquXFWPyv9/dGPqL6Hzpc5xIfPUifSs1a8G3SwJjeKZEdf6Rht
 4niauXd2MvgnuBCTs2EmIcM5+AJUkpPAFFpPyOrA7uSrb+pjrZTZdJK2K6u2QBkfI0Aq
 JMaQ==
X-Gm-Message-State: ACrzQf3T6NZoA5H1YJzIYZ6LAcK1psLJdItp6zRBE1qkrHmujFVTs6sg
 HIGdOgTXVms4K2pSsz14TPvqjj5vg4MqAw==
X-Google-Smtp-Source: AMsMyM7FhRYaL9hiyXPmXlJnZJrym2V+vnUXuHvaceRQEbmHo8R4HwicbioAM9uoeIzxuG/Jy6L1Lg==
X-Received: by 2002:adf:ee46:0:b0:236:57e4:60d9 with SMTP id
 w6-20020adfee46000000b0023657e460d9mr5966296wro.208.1667169114835; 
 Sun, 30 Oct 2022 15:31:54 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05600c34c200b003b3365b38f9sm5440099wmq.10.2022.10.30.15.31.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:31:54 -0700 (PDT)
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
Subject: [PULL 29/55] disas/nanomips: Replace std::string type
Date: Sun, 30 Oct 2022 23:28:15 +0100
Message-Id: <20221030222841.42377-30-philmd@linaro.org>
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

The return type of typedef disassembly_function is changed to char *
instead of std::string. Therefore, for every particular
disassembly_function function signature is changed.
For example:
- static std::string ABS_D(uint64 instruction, img_address m_pc) {...}
is replaced with
- static char *ABS_D(uint64 instruction, img_address m_pc) {...}

Every helper function used to return std::string is changed to return
const char * or char *. Where the return value points to a static string
that the caller must not free, the return type is const char *. If a
function allocates memory and the caller is required to free it, the
return type is a char *. This applies to the following functions:
img_format, to_string, GPR, save_restore_list, FPR, etc.

Now that we replaced every std::string for const char * or char *, it is
possible to delete multiple versions of the img_format function. The
general version:
- static char *img_format(const char *format, ...) {...}
can handle all string formatting, so others have been deleted.

Where necessary, strings are dynamically allocated with g_strjoinv,
g_strdup, g_strdup_vprintf, and g_strdup_printf. Memory leaking will be
prevented later.

String concatenation in the save_restore_list() function is handled
using g_strjoinv() function instead of += operator.

The type of the "dis" parameter in the Disassemble function is changed
- from std::string &
- to char **

Without applying all of these changes, the nanomips disassembler may be
buildable but can't produce the appropriate output, so all of them are
made together.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-16-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 4778 ++++++++++++++++++++++----------------------
 1 file changed, 2338 insertions(+), 2440 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 170f5c5c17..e4e122f3cf 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -30,13 +30,11 @@
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 
-#include <cstring>
+#include <string.h>
 #include <stdexcept>
 #include <stdio.h>
 #include <stdarg.h>
 
-#include <string>
-
 typedef int64_t int64;
 typedef uint64_t uint64;
 typedef uint32_t uint32;
@@ -77,7 +75,7 @@ typedef struct Dis_info {
 } Dis_info;
 
 typedef bool (*conditional_function)(uint64 instruction);
-typedef std::string (*disassembly_function)(uint64 instruction,
+typedef char * (*disassembly_function)(uint64 instruction,
                                             Dis_info *info);
 
 typedef struct Pool {
@@ -95,122 +93,20 @@ typedef struct Pool {
 #define IMGASSERTONCE(test)
 
 
-std::string img_format(const char *format, ...)
+static char *img_format(const char *format, ...)
 {
-    char buffer[256];
+    char *buffer;
     va_list args;
     va_start(args, format);
-    int err = vsprintf(buffer, format, args);
-    if (err < 0) {
-        perror(buffer);
-    }
+    buffer = g_strdup_vprintf(format, args);
     va_end(args);
     return buffer;
 }
 
-std::string img_format(const char *format,
-                   std::string s)
+
+static char *to_string(img_address a)
 {
-    char buffer[256];
-
-    sprintf(buffer, format, s.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   std::string s3)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   std::string s3,
-                   std::string s4)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
-                            s4.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   std::string s3,
-                   std::string s4,
-                   std::string s5)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
-                            s4.c_str(), s5.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   uint64 d,
-                   std::string s2)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, d, s2.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   uint64 d,
-                   std::string s2)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), d, s2.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   uint64 d)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), d);
-
-    return buffer;
-}
-
-
-std::string to_string(img_address a)
-{
-    char buffer[256];
-    sprintf(buffer, "0x%" PRIx64, a);
-    return buffer;
+    return g_strdup_printf("0x%" PRIx64, a);
 }
 
 
@@ -554,7 +450,7 @@ static uint64 encode_rt1_from_rt(uint64 d)
 }
 
 
-static std::string GPR(uint64 reg)
+static const char *GPR(uint64 reg)
 {
     static const char *gpr_reg[32] = {
         "zero", "at",   "v0",   "v1",   "a0",   "a1",   "a2",   "a3",
@@ -572,21 +468,25 @@ static std::string GPR(uint64 reg)
 }
 
 
-static std::string save_restore_list(uint64 rt, uint64 count, uint64 gp)
+static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
 {
-    std::string str;
+    char *reg_list[34];
+    reg_list[0] = (char *)"";
 
+    assert(count <= 32);
     for (uint64 counter = 0; counter != count; counter++) {
         bool use_gp = gp && (counter == count - 1);
         uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
-        str += img_format(",%s", GPR(this_rt));
+        /* glib usage below requires casting away const */
+        reg_list[counter + 1] = (char *)GPR(this_rt);
     }
+    reg_list[count + 1] = NULL;
 
-    return str;
+    return g_strjoinv(",", reg_list);
 }
 
 
-static std::string FPR(uint64 reg)
+static const char *FPR(uint64 reg)
 {
     static const char *fpr_reg[32] = {
         "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
@@ -604,7 +504,7 @@ static std::string FPR(uint64 reg)
 }
 
 
-static std::string AC(uint64 reg)
+static const char *AC(uint64 reg)
 {
     static const char *ac_reg[4] = {
         "ac0",  "ac1",  "ac2",  "ac3"
@@ -619,26 +519,26 @@ static std::string AC(uint64 reg)
 }
 
 
-static std::string IMMEDIATE(uint64 value)
+static char *IMMEDIATE(uint64 value)
 {
     return img_format("0x%" PRIx64, value);
 }
 
 
-static std::string IMMEDIATE(int64 value)
+static char *IMMEDIATE(int64 value)
 {
     return img_format("%" PRId64, value);
 }
 
 
-static std::string CPR(uint64 reg)
+static char *CPR(uint64 reg)
 {
     /* needs more work */
     return img_format("CP%" PRIu64, reg);
 }
 
 
-static std::string ADDRESS(uint64 value, int instruction_size, Dis_info *info)
+static char *ADDRESS(uint64 value, int instruction_size, Dis_info *info)
 {
     /* token for string replace */
     img_address address = info->m_pc + value + instruction_size;
@@ -673,7 +573,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
  *      instruction size    - negative is error
  *      disassembly string  - on error will constain error string
  */
-static int Disassemble(const uint16 *data, std::string & dis,
+static int Disassemble(const uint16 *data, char **dis,
                      TABLE_ENTRY_TYPE & type, const Pool *table,
                      int table_size, Dis_info *info)
 {
@@ -699,20 +599,21 @@ static int Disassemble(const uint16 *data, std::string & dis,
                                    (table[i].type == return_instruction)) {
                             disassembly_function dis_fn = table[i].disassembly;
                             if (dis_fn == 0) {
-                                dis = "disassembler failure - bad table entry";
+                                *dis = g_strdup(
+                                    "disassembler failure - bad table entry");
                                 return -6;
                             }
                             type = table[i].type;
-                            dis = dis_fn(op_code, info);
+                            *dis = dis_fn(op_code, info);
                             return table[i].instructions_size;
                         } else {
-                            dis = "reserved instruction";
+                            *dis = g_strdup("reserved instruction");
                             return -2;
                         }
                     }
                     catch (std::runtime_error & e)
                     {
-                        dis = e.what();
+                        *dis = g_strdup(e.what());
                         return -3;          /* runtime error */
                     }
                 }
@@ -721,11 +622,11 @@ static int Disassemble(const uint16 *data, std::string & dis,
     }
     catch (std::exception & e)
     {
-        dis = e.what();
+        *dis = g_strdup(e.what());
         return -4;          /* runtime error */
     }
 
-    dis = "failed to disassemble";
+    *dis = g_strdup("failed to disassemble");
     return -1;      /* failed to disassemble        */
 }
 
@@ -1658,13 +1559,13 @@ static bool SLTU_cond(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-static std::string ABS_D(uint64 instruction, Dis_info *info)
+static char *ABS_D(uint64 instruction, Dis_info *info)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string fs = FPR(fs_value);
-    std::string fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *fd = FPR(fd_value);
 
     return img_format("ABS.D %s, %s", fd, fs);
 }
@@ -1680,13 +1581,13 @@ static std::string ABS_D(uint64 instruction, Dis_info *info)
  *               fd -----
  *                    fs -----
  */
-static std::string ABS_S(uint64 instruction, Dis_info *info)
+static char *ABS_S(uint64 instruction, Dis_info *info)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string fs = FPR(fs_value);
-    std::string fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *fd = FPR(fd_value);
 
     return img_format("ABS.S %s, %s", fd, fs);
 }
@@ -1702,13 +1603,13 @@ static std::string ABS_S(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ABSQ_S_PH(uint64 instruction, Dis_info *info)
+static char *ABSQ_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("ABSQ_S.PH %s, %s", rt, rs);
 }
@@ -1724,13 +1625,13 @@ static std::string ABSQ_S_PH(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ABSQ_S_QB(uint64 instruction, Dis_info *info)
+static char *ABSQ_S_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("ABSQ_S.QB %s, %s", rt, rs);
 }
@@ -1746,13 +1647,13 @@ static std::string ABSQ_S_QB(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ABSQ_S_W(uint64 instruction, Dis_info *info)
+static char *ABSQ_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("ABSQ_S.W %s, %s", rt, rs);
 }
@@ -1767,15 +1668,15 @@ static std::string ABSQ_S_W(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ACLR(uint64 instruction, Dis_info *info)
+static char *ACLR(uint64 instruction, Dis_info *info)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string bit = IMMEDIATE(bit_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *bit = IMMEDIATE(bit_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("ACLR %s, %s(%s)", bit, s, rs);
 }
@@ -1790,15 +1691,15 @@ static std::string ACLR(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ADD(uint64 instruction, Dis_info *info)
+static char *ADD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADD %s, %s, %s", rd, rs, rt);
 }
@@ -1815,15 +1716,15 @@ static std::string ADD(uint64 instruction, Dis_info *info)
  *               fs -----
  *                    fd -----
  */
-static std::string ADD_D(uint64 instruction, Dis_info *info)
+static char *ADD_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
-    std::string fd = FPR(fd_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
+    const char *fd = FPR(fd_value);
 
     return img_format("ADD.D %s, %s, %s", fd, fs, ft);
 }
@@ -1840,15 +1741,15 @@ static std::string ADD_D(uint64 instruction, Dis_info *info)
  *               fs -----
  *                    fd -----
  */
-static std::string ADD_S(uint64 instruction, Dis_info *info)
+static char *ADD_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
-    std::string fd = FPR(fd_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
+    const char *fd = FPR(fd_value);
 
     return img_format("ADD.S %s, %s, %s", fd, fs, ft);
 }
@@ -1863,15 +1764,15 @@ static std::string ADD_S(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_32_(uint64 instruction, Dis_info *info)
+static char *ADDIU_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_15_to_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -1886,13 +1787,13 @@ static std::string ADDIU_32_(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_48_(uint64 instruction, Dis_info *info)
+static char *ADDIU_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -1907,13 +1808,13 @@ static std::string ADDIU_48_(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_GP48_(uint64 instruction, Dis_info *info)
+static char *ADDIU_GP48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, s);
 }
@@ -1928,13 +1829,13 @@ static std::string ADDIU_GP48_(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_GP_B_(uint64 instruction, Dis_info *info)
+static char *ADDIU_GP_B_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -1949,13 +1850,13 @@ static std::string ADDIU_GP_B_(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_GP_W_(uint64 instruction, Dis_info *info)
+static char *ADDIU_GP_W_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -1970,15 +1871,15 @@ static std::string ADDIU_GP_W_(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_NEG_(uint64 instruction, Dis_info *info)
+static char *ADDIU_NEG_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *u = IMMEDIATE(neg_copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -1993,13 +1894,13 @@ static std::string ADDIU_NEG_(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_R1_SP_(uint64 instruction, Dis_info *info)
+static char *ADDIU_R1_SP_(uint64 instruction, Dis_info *info)
 {
     uint64 u_value = extract_u_5_4_3_2_1_0__s2(instruction);
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(u_value);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(u_value);
 
     return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
 }
@@ -2014,15 +1915,15 @@ static std::string ADDIU_R1_SP_(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_R2_(uint64 instruction, Dis_info *info)
+static char *ADDIU_R2_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string u = IMMEDIATE(u_value);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    char *u = IMMEDIATE(u_value);
 
     return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
 }
@@ -2036,13 +1937,13 @@ static std::string ADDIU_R2_(uint64 instruction, Dis_info *info)
  *     rt -----
  *           s - ---
  */
-static std::string ADDIU_RS5_(uint64 instruction, Dis_info *info)
+static char *ADDIU_RS5_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -2058,13 +1959,13 @@ static std::string ADDIU_RS5_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDIUPC_32_(uint64 instruction, Dis_info *info)
+static char *ADDIUPC_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2080,13 +1981,13 @@ static std::string ADDIUPC_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDIUPC_48_(uint64 instruction, Dis_info *info)
+static char *ADDIUPC_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 6, info);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 6, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2102,15 +2003,15 @@ static std::string ADDIUPC_48_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQ_PH(uint64 instruction, Dis_info *info)
+static char *ADDQ_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2127,15 +2028,15 @@ static std::string ADDQ_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQ_S_PH(uint64 instruction, Dis_info *info)
+static char *ADDQ_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2151,15 +2052,15 @@ static std::string ADDQ_S_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQ_S_W(uint64 instruction, Dis_info *info)
+static char *ADDQ_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -2176,15 +2077,15 @@ static std::string ADDQ_S_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_PH(uint64 instruction, Dis_info *info)
+static char *ADDQH_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2201,15 +2102,15 @@ static std::string ADDQH_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_R_PH(uint64 instruction, Dis_info *info)
+static char *ADDQH_R_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2226,15 +2127,15 @@ static std::string ADDQH_R_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_R_W(uint64 instruction, Dis_info *info)
+static char *ADDQH_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -2251,15 +2152,15 @@ static std::string ADDQH_R_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_W(uint64 instruction, Dis_info *info)
+static char *ADDQH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -2275,15 +2176,15 @@ static std::string ADDQH_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDSC(uint64 instruction, Dis_info *info)
+static char *ADDSC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDSC %s, %s, %s", rd, rs, rt);
 }
@@ -2298,15 +2199,15 @@ static std::string ADDSC(uint64 instruction, Dis_info *info)
  *       rs3 ---
  *          rd3 ---
  */
-static std::string ADDU_16_(uint64 instruction, Dis_info *info)
+static char *ADDU_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
 
     return img_format("ADDU %s, %s, %s", rd3, rs3, rt3);
 }
@@ -2322,15 +2223,15 @@ static std::string ADDU_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_32_(uint64 instruction, Dis_info *info)
+static char *ADDU_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDU %s, %s, %s", rd, rs, rt);
 }
@@ -2346,13 +2247,13 @@ static std::string ADDU_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_4X4_(uint64 instruction, Dis_info *info)
+static char *ADDU_4X4_(uint64 instruction, Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
 
     return img_format("ADDU %s, %s", rs4, rt4);
 }
@@ -2368,15 +2269,15 @@ static std::string ADDU_4X4_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_PH(uint64 instruction, Dis_info *info)
+static char *ADDU_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2392,15 +2293,15 @@ static std::string ADDU_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_QB(uint64 instruction, Dis_info *info)
+static char *ADDU_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2417,15 +2318,15 @@ static std::string ADDU_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_S_PH(uint64 instruction, Dis_info *info)
+static char *ADDU_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2441,15 +2342,15 @@ static std::string ADDU_S_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_S_QB(uint64 instruction, Dis_info *info)
+static char *ADDU_S_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2466,15 +2367,15 @@ static std::string ADDU_S_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDUH_QB(uint64 instruction, Dis_info *info)
+static char *ADDUH_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2491,15 +2392,15 @@ static std::string ADDUH_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDUH_R_QB(uint64 instruction, Dis_info *info)
+static char *ADDUH_R_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2514,15 +2415,15 @@ static std::string ADDUH_R_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ADDWC(uint64 instruction, Dis_info *info)
+static char *ADDWC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ADDWC %s, %s, %s", rd, rs, rt);
 }
@@ -2538,13 +2439,13 @@ static std::string ADDWC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ALUIPC(uint64 instruction, Dis_info *info)
+static char *ALUIPC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
@@ -2559,13 +2460,13 @@ static std::string ALUIPC(uint64 instruction, Dis_info *info)
  *       rs3 ---
  *           eu ----
  */
-static std::string AND_16_(uint64 instruction, Dis_info *info)
+static char *AND_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("AND %s, %s", rs3, rt3);
 }
@@ -2581,15 +2482,15 @@ static std::string AND_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string AND_32_(uint64 instruction, Dis_info *info)
+static char *AND_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("AND %s, %s, %s", rd, rs, rt);
 }
@@ -2604,15 +2505,15 @@ static std::string AND_32_(uint64 instruction, Dis_info *info)
  *       rs3 ---
  *           eu ----
  */
-static std::string ANDI_16_(uint64 instruction, Dis_info *info)
+static char *ANDI_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 eu_value = extract_eu_3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    char *eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
 
     return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
 }
@@ -2628,15 +2529,15 @@ static std::string ANDI_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ANDI_32_(uint64 instruction, Dis_info *info)
+static char *ANDI_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("ANDI %s, %s, %s", rt, rs, u);
 }
@@ -2652,15 +2553,15 @@ static std::string ANDI_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string APPEND(uint64 instruction, Dis_info *info)
+static char *APPEND(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("APPEND %s, %s, %s", rt, rs, sa);
 }
@@ -2676,15 +2577,15 @@ static std::string APPEND(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ASET(uint64 instruction, Dis_info *info)
+static char *ASET(uint64 instruction, Dis_info *info)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string bit = IMMEDIATE(bit_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *bit = IMMEDIATE(bit_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("ASET %s, %s(%s)", bit, s, rs);
 }
@@ -2700,11 +2601,11 @@ static std::string ASET(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BALC_16_(uint64 instruction, Dis_info *info)
+static char *BALC_16_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(s_value, 2, info);
+    char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BALC %s", s);
 }
@@ -2720,11 +2621,11 @@ static std::string BALC_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BALC_32_(uint64 instruction, Dis_info *info)
+static char *BALC_32_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(s_value, 4, info);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BALC %s", s);
 }
@@ -2740,13 +2641,13 @@ static std::string BALC_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BALRSC(uint64 instruction, Dis_info *info)
+static char *BALRSC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("BALRSC %s, %s", rt, rs);
 }
@@ -2762,15 +2663,15 @@ static std::string BALRSC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BBEQZC(uint64 instruction, Dis_info *info)
+static char *BBEQZC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string bit = IMMEDIATE(bit_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rt = GPR(rt_value);
+    char *bit = IMMEDIATE(bit_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BBEQZC %s, %s, %s", rt, bit, s);
 }
@@ -2786,15 +2687,15 @@ static std::string BBEQZC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BBNEZC(uint64 instruction, Dis_info *info)
+static char *BBNEZC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string bit = IMMEDIATE(bit_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rt = GPR(rt_value);
+    char *bit = IMMEDIATE(bit_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BBNEZC %s, %s, %s", rt, bit, s);
 }
@@ -2810,11 +2711,11 @@ static std::string BBNEZC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BC_16_(uint64 instruction, Dis_info *info)
+static char *BC_16_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(s_value, 2, info);
+    char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BC %s", s);
 }
@@ -2830,11 +2731,11 @@ static std::string BC_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BC_32_(uint64 instruction, Dis_info *info)
+static char *BC_32_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(s_value, 4, info);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC %s", s);
 }
@@ -2850,13 +2751,13 @@ static std::string BC_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BC1EQZC(uint64 instruction, Dis_info *info)
+static char *BC1EQZC(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *ft = FPR(ft_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC1EQZC %s, %s", ft, s);
 }
@@ -2872,13 +2773,13 @@ static std::string BC1EQZC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BC1NEZC(uint64 instruction, Dis_info *info)
+static char *BC1NEZC(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *ft = FPR(ft_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC1NEZC %s, %s", ft, s);
 }
@@ -2894,13 +2795,13 @@ static std::string BC1NEZC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BC2EQZC(uint64 instruction, Dis_info *info)
+static char *BC2EQZC(uint64 instruction, Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ct = CPR(ct_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    char *ct = CPR(ct_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC2EQZC %s, %s", ct, s);
 }
@@ -2916,13 +2817,13 @@ static std::string BC2EQZC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BC2NEZC(uint64 instruction, Dis_info *info)
+static char *BC2NEZC(uint64 instruction, Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ct = CPR(ct_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    char *ct = CPR(ct_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC2NEZC %s, %s", ct, s);
 }
@@ -2938,15 +2839,15 @@ static std::string BC2NEZC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BEQC_16_(uint64 instruction, Dis_info *info)
+static char *BEQC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(u_value, 2, info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = ADDRESS(u_value, 2, info);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
@@ -2962,15 +2863,15 @@ static std::string BEQC_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BEQC_32_(uint64 instruction, Dis_info *info)
+static char *BEQC_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
@@ -2986,15 +2887,15 @@ static std::string BEQC_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BEQIC(uint64 instruction, Dis_info *info)
+static char *BEQIC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BEQIC %s, %s, %s", rt, u, s);
 }
@@ -3010,13 +2911,13 @@ static std::string BEQIC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BEQZC_16_(uint64 instruction, Dis_info *info)
+static char *BEQZC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(s_value, 2, info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BEQZC %s, %s", rt3, s);
 }
@@ -3032,15 +2933,15 @@ static std::string BEQZC_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BGEC(uint64 instruction, Dis_info *info)
+static char *BGEC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
@@ -3056,15 +2957,15 @@ static std::string BGEC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BGEIC(uint64 instruction, Dis_info *info)
+static char *BGEIC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEIC %s, %s, %s", rt, u, s);
 }
@@ -3080,15 +2981,15 @@ static std::string BGEIC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BGEIUC(uint64 instruction, Dis_info *info)
+static char *BGEIUC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEIUC %s, %s, %s", rt, u, s);
 }
@@ -3104,15 +3005,15 @@ static std::string BGEIUC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BGEUC(uint64 instruction, Dis_info *info)
+static char *BGEUC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
@@ -3128,15 +3029,15 @@ static std::string BGEUC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BLTC(uint64 instruction, Dis_info *info)
+static char *BLTC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
@@ -3152,15 +3053,15 @@ static std::string BLTC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BLTIC(uint64 instruction, Dis_info *info)
+static char *BLTIC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTIC %s, %s, %s", rt, u, s);
 }
@@ -3176,15 +3077,15 @@ static std::string BLTIC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BLTIUC(uint64 instruction, Dis_info *info)
+static char *BLTIUC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTIUC %s, %s, %s", rt, u, s);
 }
@@ -3200,15 +3101,15 @@ static std::string BLTIUC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BLTUC(uint64 instruction, Dis_info *info)
+static char *BLTUC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
@@ -3224,15 +3125,15 @@ static std::string BLTUC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BNEC_16_(uint64 instruction, Dis_info *info)
+static char *BNEC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(u_value, 2, info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = ADDRESS(u_value, 2, info);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
@@ -3248,15 +3149,15 @@ static std::string BNEC_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BNEC_32_(uint64 instruction, Dis_info *info)
+static char *BNEC_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
@@ -3272,15 +3173,15 @@ static std::string BNEC_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BNEIC(uint64 instruction, Dis_info *info)
+static char *BNEIC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BNEIC %s, %s, %s", rt, u, s);
 }
@@ -3296,13 +3197,13 @@ static std::string BNEIC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BNEZC_16_(uint64 instruction, Dis_info *info)
+static char *BNEZC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(s_value, 2, info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BNEZC %s, %s", rt3, s);
 }
@@ -3318,11 +3219,11 @@ static std::string BNEZC_16_(uint64 instruction, Dis_info *info)
  *            s[13:1] -------------
  *                           s[14] -
  */
-static std::string BPOSGE32C(uint64 instruction, Dis_info *info)
+static char *BPOSGE32C(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string s = ADDRESS(s_value, 4, info);
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BPOSGE32C %s", s);
 }
@@ -3338,11 +3239,11 @@ static std::string BPOSGE32C(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BREAK_16_(uint64 instruction, Dis_info *info)
+static char *BREAK_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    std::string code = IMMEDIATE(code_value);
+    char *code = IMMEDIATE(code_value);
 
     return img_format("BREAK %s", code);
 }
@@ -3358,11 +3259,11 @@ static std::string BREAK_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BREAK_32_(uint64 instruction, Dis_info *info)
+static char *BREAK_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(code_value);
+    char *code = IMMEDIATE(code_value);
 
     return img_format("BREAK %s", code);
 }
@@ -3378,11 +3279,11 @@ static std::string BREAK_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string BRSC(uint64 instruction, Dis_info *info)
+static char *BRSC(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(rs_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("BRSC %s", rs);
 }
@@ -3398,15 +3299,15 @@ static std::string BRSC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CACHE(uint64 instruction, Dis_info *info)
+static char *CACHE(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string op = IMMEDIATE(op_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *op = IMMEDIATE(op_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("CACHE %s, %s(%s)", op, s, rs);
 }
@@ -3422,15 +3323,15 @@ static std::string CACHE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CACHEE(uint64 instruction, Dis_info *info)
+static char *CACHEE(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string op = IMMEDIATE(op_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *op = IMMEDIATE(op_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("CACHEE %s, %s(%s)", op, s, rs);
 }
@@ -3446,13 +3347,13 @@ static std::string CACHEE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_L_D(uint64 instruction, Dis_info *info)
+static char *CEIL_L_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CEIL.L.D %s, %s", ft, fs);
 }
@@ -3468,13 +3369,13 @@ static std::string CEIL_L_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_L_S(uint64 instruction, Dis_info *info)
+static char *CEIL_L_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CEIL.L.S %s, %s", ft, fs);
 }
@@ -3490,13 +3391,13 @@ static std::string CEIL_L_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_W_D(uint64 instruction, Dis_info *info)
+static char *CEIL_W_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CEIL.W.D %s, %s", ft, fs);
 }
@@ -3512,13 +3413,13 @@ static std::string CEIL_W_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_W_S(uint64 instruction, Dis_info *info)
+static char *CEIL_W_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CEIL.W.S %s, %s", ft, fs);
 }
@@ -3534,13 +3435,13 @@ static std::string CEIL_W_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CFC1(uint64 instruction, Dis_info *info)
+static char *CFC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string cs = CPR(cs_value);
+    const char *rt = GPR(rt_value);
+    char *cs = CPR(cs_value);
 
     return img_format("CFC1 %s, %s", rt, cs);
 }
@@ -3556,13 +3457,13 @@ static std::string CFC1(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CFC2(uint64 instruction, Dis_info *info)
+static char *CFC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string cs = CPR(cs_value);
+    const char *rt = GPR(rt_value);
+    char *cs = CPR(cs_value);
 
     return img_format("CFC2 %s, %s", rt, cs);
 }
@@ -3578,13 +3479,13 @@ static std::string CFC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CLASS_D(uint64 instruction, Dis_info *info)
+static char *CLASS_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CLASS.D %s, %s", ft, fs);
 }
@@ -3600,13 +3501,13 @@ static std::string CLASS_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CLASS_S(uint64 instruction, Dis_info *info)
+static char *CLASS_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CLASS.S %s, %s", ft, fs);
 }
@@ -3622,13 +3523,13 @@ static std::string CLASS_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CLO(uint64 instruction, Dis_info *info)
+static char *CLO(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("CLO %s, %s", rt, rs);
 }
@@ -3644,13 +3545,13 @@ static std::string CLO(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CLZ(uint64 instruction, Dis_info *info)
+static char *CLZ(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("CLZ %s, %s", rt, rs);
 }
@@ -3666,15 +3567,15 @@ static std::string CLZ(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_AF_D(uint64 instruction, Dis_info *info)
+static char *CMP_AF_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.AF.D %s, %s, %s", fd, fs, ft);
 }
@@ -3690,15 +3591,15 @@ static std::string CMP_AF_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_AF_S(uint64 instruction, Dis_info *info)
+static char *CMP_AF_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.AF.S %s, %s, %s", fd, fs, ft);
 }
@@ -3714,15 +3615,15 @@ static std::string CMP_AF_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_EQ_D(uint64 instruction, Dis_info *info)
+static char *CMP_EQ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -3737,13 +3638,13 @@ static std::string CMP_EQ_D(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string CMP_EQ_PH(uint64 instruction, Dis_info *info)
+static char *CMP_EQ_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMP.EQ.PH %s, %s", rs, rt);
 }
@@ -3759,15 +3660,15 @@ static std::string CMP_EQ_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_EQ_S(uint64 instruction, Dis_info *info)
+static char *CMP_EQ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -3783,15 +3684,15 @@ static std::string CMP_EQ_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LE_D(uint64 instruction, Dis_info *info)
+static char *CMP_LE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.LE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3806,13 +3707,13 @@ static std::string CMP_LE_D(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string CMP_LE_PH(uint64 instruction, Dis_info *info)
+static char *CMP_LE_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMP.LE.PH %s, %s", rs, rt);
 }
@@ -3828,15 +3729,15 @@ static std::string CMP_LE_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LE_S(uint64 instruction, Dis_info *info)
+static char *CMP_LE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.LE.S %s, %s, %s", fd, fs, ft);
 }
@@ -3852,15 +3753,15 @@ static std::string CMP_LE_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LT_D(uint64 instruction, Dis_info *info)
+static char *CMP_LT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.LT.D %s, %s, %s", fd, fs, ft);
 }
@@ -3875,13 +3776,13 @@ static std::string CMP_LT_D(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string CMP_LT_PH(uint64 instruction, Dis_info *info)
+static char *CMP_LT_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMP.LT.PH %s, %s", rs, rt);
 }
@@ -3897,15 +3798,15 @@ static std::string CMP_LT_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LT_S(uint64 instruction, Dis_info *info)
+static char *CMP_LT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.LT.S %s, %s, %s", fd, fs, ft);
 }
@@ -3921,15 +3822,15 @@ static std::string CMP_LT_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_NE_D(uint64 instruction, Dis_info *info)
+static char *CMP_NE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.NE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3945,15 +3846,15 @@ static std::string CMP_NE_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_NE_S(uint64 instruction, Dis_info *info)
+static char *CMP_NE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.NE.S %s, %s, %s", fd, fs, ft);
 }
@@ -3969,15 +3870,15 @@ static std::string CMP_NE_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_OR_D(uint64 instruction, Dis_info *info)
+static char *CMP_OR_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.OR.D %s, %s, %s", fd, fs, ft);
 }
@@ -3993,15 +3894,15 @@ static std::string CMP_OR_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_OR_S(uint64 instruction, Dis_info *info)
+static char *CMP_OR_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.OR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4017,15 +3918,15 @@ static std::string CMP_OR_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SAF_D(uint64 instruction, Dis_info *info)
+static char *CMP_SAF_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
 }
@@ -4041,15 +3942,15 @@ static std::string CMP_SAF_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SAF_S(uint64 instruction, Dis_info *info)
+static char *CMP_SAF_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
 }
@@ -4065,15 +3966,15 @@ static std::string CMP_SAF_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SEQ_D(uint64 instruction, Dis_info *info)
+static char *CMP_SEQ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4089,15 +3990,15 @@ static std::string CMP_SEQ_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SEQ_S(uint64 instruction, Dis_info *info)
+static char *CMP_SEQ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4113,15 +4014,15 @@ static std::string CMP_SEQ_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLE_D(uint64 instruction, Dis_info *info)
+static char *CMP_SLE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4137,15 +4038,15 @@ static std::string CMP_SLE_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLE_S(uint64 instruction, Dis_info *info)
+static char *CMP_SLE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4161,15 +4062,15 @@ static std::string CMP_SLE_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLT_D(uint64 instruction, Dis_info *info)
+static char *CMP_SLT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4185,15 +4086,15 @@ static std::string CMP_SLT_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLT_S(uint64 instruction, Dis_info *info)
+static char *CMP_SLT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4209,15 +4110,15 @@ static std::string CMP_SLT_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SNE_D(uint64 instruction, Dis_info *info)
+static char *CMP_SNE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4233,15 +4134,15 @@ static std::string CMP_SNE_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SNE_S(uint64 instruction, Dis_info *info)
+static char *CMP_SNE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4257,15 +4158,15 @@ static std::string CMP_SNE_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SOR_D(uint64 instruction, Dis_info *info)
+static char *CMP_SOR_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4281,15 +4182,15 @@ static std::string CMP_SOR_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SOR_S(uint64 instruction, Dis_info *info)
+static char *CMP_SOR_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4305,15 +4206,15 @@ static std::string CMP_SOR_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUEQ_D(uint64 instruction, Dis_info *info)
+static char *CMP_SUEQ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4329,15 +4230,15 @@ static std::string CMP_SUEQ_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUEQ_S(uint64 instruction, Dis_info *info)
+static char *CMP_SUEQ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4353,15 +4254,15 @@ static std::string CMP_SUEQ_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULE_D(uint64 instruction, Dis_info *info)
+static char *CMP_SULE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4377,15 +4278,15 @@ static std::string CMP_SULE_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULE_S(uint64 instruction, Dis_info *info)
+static char *CMP_SULE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4401,15 +4302,15 @@ static std::string CMP_SULE_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULT_D(uint64 instruction, Dis_info *info)
+static char *CMP_SULT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4425,15 +4326,15 @@ static std::string CMP_SULT_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULT_S(uint64 instruction, Dis_info *info)
+static char *CMP_SULT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4449,15 +4350,15 @@ static std::string CMP_SULT_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUN_D(uint64 instruction, Dis_info *info)
+static char *CMP_SUN_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4473,15 +4374,15 @@ static std::string CMP_SUN_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUNE_D(uint64 instruction, Dis_info *info)
+static char *CMP_SUNE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4497,15 +4398,15 @@ static std::string CMP_SUNE_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUNE_S(uint64 instruction, Dis_info *info)
+static char *CMP_SUNE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4521,15 +4422,15 @@ static std::string CMP_SUNE_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUN_S(uint64 instruction, Dis_info *info)
+static char *CMP_SUN_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4545,15 +4446,15 @@ static std::string CMP_SUN_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UEQ_D(uint64 instruction, Dis_info *info)
+static char *CMP_UEQ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4569,15 +4470,15 @@ static std::string CMP_UEQ_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UEQ_S(uint64 instruction, Dis_info *info)
+static char *CMP_UEQ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4593,15 +4494,15 @@ static std::string CMP_UEQ_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULE_D(uint64 instruction, Dis_info *info)
+static char *CMP_ULE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4617,15 +4518,15 @@ static std::string CMP_ULE_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULE_S(uint64 instruction, Dis_info *info)
+static char *CMP_ULE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4641,15 +4542,15 @@ static std::string CMP_ULE_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULT_D(uint64 instruction, Dis_info *info)
+static char *CMP_ULT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4665,15 +4566,15 @@ static std::string CMP_ULT_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULT_S(uint64 instruction, Dis_info *info)
+static char *CMP_ULT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4689,15 +4590,15 @@ static std::string CMP_ULT_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UN_D(uint64 instruction, Dis_info *info)
+static char *CMP_UN_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.UN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4713,15 +4614,15 @@ static std::string CMP_UN_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UNE_D(uint64 instruction, Dis_info *info)
+static char *CMP_UNE_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4737,15 +4638,15 @@ static std::string CMP_UNE_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UNE_S(uint64 instruction, Dis_info *info)
+static char *CMP_UNE_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4761,15 +4662,15 @@ static std::string CMP_UNE_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UN_S(uint64 instruction, Dis_info *info)
+static char *CMP_UN_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("CMP.UN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4786,15 +4687,15 @@ static std::string CMP_UN_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGDU_EQ_QB(uint64 instruction, Dis_info *info)
+static char *CMPGDU_EQ_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4811,15 +4712,15 @@ static std::string CMPGDU_EQ_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGDU_LE_QB(uint64 instruction, Dis_info *info)
+static char *CMPGDU_LE_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4836,15 +4737,15 @@ static std::string CMPGDU_LE_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGDU_LT_QB(uint64 instruction, Dis_info *info)
+static char *CMPGDU_LT_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4861,15 +4762,15 @@ static std::string CMPGDU_LT_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGU_EQ_QB(uint64 instruction, Dis_info *info)
+static char *CMPGU_EQ_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4886,15 +4787,15 @@ static std::string CMPGU_EQ_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGU_LE_QB(uint64 instruction, Dis_info *info)
+static char *CMPGU_LE_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4911,15 +4812,15 @@ static std::string CMPGU_LE_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGU_LT_QB(uint64 instruction, Dis_info *info)
+static char *CMPGU_LT_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4935,13 +4836,13 @@ static std::string CMPGU_LT_QB(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string CMPU_EQ_QB(uint64 instruction, Dis_info *info)
+static char *CMPU_EQ_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMPU.EQ.QB %s, %s", rs, rt);
 }
@@ -4957,13 +4858,13 @@ static std::string CMPU_EQ_QB(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string CMPU_LE_QB(uint64 instruction, Dis_info *info)
+static char *CMPU_LE_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMPU.LE.QB %s, %s", rs, rt);
 }
@@ -4979,13 +4880,13 @@ static std::string CMPU_LE_QB(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string CMPU_LT_QB(uint64 instruction, Dis_info *info)
+static char *CMPU_LT_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("CMPU.LT.QB %s, %s", rs, rt);
 }
@@ -5001,11 +4902,11 @@ static std::string CMPU_LT_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string COP2_1(uint64 instruction, Dis_info *info)
+static char *COP2_1(uint64 instruction, Dis_info *info)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
-    std::string cofun = IMMEDIATE(cofun_value);
+    char *cofun = IMMEDIATE(cofun_value);
 
     return img_format("COP2_1 %s", cofun);
 }
@@ -5021,13 +4922,13 @@ static std::string COP2_1(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CTC1(uint64 instruction, Dis_info *info)
+static char *CTC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string cs = CPR(cs_value);
+    const char *rt = GPR(rt_value);
+    char *cs = CPR(cs_value);
 
     return img_format("CTC1 %s, %s", rt, cs);
 }
@@ -5043,13 +4944,13 @@ static std::string CTC1(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CTC2(uint64 instruction, Dis_info *info)
+static char *CTC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string cs = CPR(cs_value);
+    const char *rt = GPR(rt_value);
+    char *cs = CPR(cs_value);
 
     return img_format("CTC2 %s, %s", rt, cs);
 }
@@ -5065,13 +4966,13 @@ static std::string CTC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_D_L(uint64 instruction, Dis_info *info)
+static char *CVT_D_L(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.D.L %s, %s", ft, fs);
 }
@@ -5087,13 +4988,13 @@ static std::string CVT_D_L(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_D_S(uint64 instruction, Dis_info *info)
+static char *CVT_D_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.D.S %s, %s", ft, fs);
 }
@@ -5109,13 +5010,13 @@ static std::string CVT_D_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_D_W(uint64 instruction, Dis_info *info)
+static char *CVT_D_W(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.D.W %s, %s", ft, fs);
 }
@@ -5131,13 +5032,13 @@ static std::string CVT_D_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_L_D(uint64 instruction, Dis_info *info)
+static char *CVT_L_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.L.D %s, %s", ft, fs);
 }
@@ -5153,13 +5054,13 @@ static std::string CVT_L_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_L_S(uint64 instruction, Dis_info *info)
+static char *CVT_L_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.L.S %s, %s", ft, fs);
 }
@@ -5175,13 +5076,13 @@ static std::string CVT_L_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_D(uint64 instruction, Dis_info *info)
+static char *CVT_S_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.S.D %s, %s", ft, fs);
 }
@@ -5197,13 +5098,13 @@ static std::string CVT_S_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_L(uint64 instruction, Dis_info *info)
+static char *CVT_S_L(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.S.L %s, %s", ft, fs);
 }
@@ -5219,13 +5120,13 @@ static std::string CVT_S_L(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_PL(uint64 instruction, Dis_info *info)
+static char *CVT_S_PL(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.S.PL %s, %s", ft, fs);
 }
@@ -5241,13 +5142,13 @@ static std::string CVT_S_PL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_PU(uint64 instruction, Dis_info *info)
+static char *CVT_S_PU(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.S.PU %s, %s", ft, fs);
 }
@@ -5263,13 +5164,13 @@ static std::string CVT_S_PU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_W(uint64 instruction, Dis_info *info)
+static char *CVT_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.S.W %s, %s", ft, fs);
 }
@@ -5285,13 +5186,13 @@ static std::string CVT_S_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_W_D(uint64 instruction, Dis_info *info)
+static char *CVT_W_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.W.D %s, %s", ft, fs);
 }
@@ -5307,13 +5208,13 @@ static std::string CVT_W_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_W_S(uint64 instruction, Dis_info *info)
+static char *CVT_W_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("CVT.W.S %s, %s", ft, fs);
 }
@@ -5329,13 +5230,13 @@ static std::string CVT_W_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DADDIU_48_(uint64 instruction, Dis_info *info)
+static char *DADDIU_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
 
     return img_format("DADDIU %s, %s", rt, s);
 }
@@ -5351,15 +5252,15 @@ static std::string DADDIU_48_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DADDIU_NEG_(uint64 instruction, Dis_info *info)
+static char *DADDIU_NEG_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *u = IMMEDIATE(neg_copy(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5375,15 +5276,15 @@ static std::string DADDIU_NEG_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DADDIU_U12_(uint64 instruction, Dis_info *info)
+static char *DADDIU_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5399,15 +5300,15 @@ static std::string DADDIU_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DADD(uint64 instruction, Dis_info *info)
+static char *DADD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DADD %s, %s, %s", rd, rs, rt);
 }
@@ -5423,15 +5324,15 @@ static std::string DADD(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DADDU(uint64 instruction, Dis_info *info)
+static char *DADDU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DADDU %s, %s, %s", rd, rs, rt);
 }
@@ -5447,13 +5348,13 @@ static std::string DADDU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DCLO(uint64 instruction, Dis_info *info)
+static char *DCLO(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("DCLO %s, %s", rt, rs);
 }
@@ -5469,13 +5370,13 @@ static std::string DCLO(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DCLZ(uint64 instruction, Dis_info *info)
+static char *DCLZ(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("DCLZ %s, %s", rt, rs);
 }
@@ -5491,15 +5392,15 @@ static std::string DCLZ(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DDIV(uint64 instruction, Dis_info *info)
+static char *DDIV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DDIV %s, %s, %s", rd, rs, rt);
 }
@@ -5515,15 +5416,15 @@ static std::string DDIV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DDIVU(uint64 instruction, Dis_info *info)
+static char *DDIVU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DDIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5539,11 +5440,11 @@ static std::string DDIVU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DERET(uint64 instruction, Dis_info *info)
+static char *DERET(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "DERET ";
+    return g_strdup("DERET ");
 }
 
 
@@ -5557,17 +5458,17 @@ static std::string DERET(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DEXTM(uint64 instruction, Dis_info *info)
+static char *DEXTM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string lsb = IMMEDIATE(lsb_value);
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *lsb = IMMEDIATE(lsb_value);
+    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5583,17 +5484,17 @@ static std::string DEXTM(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DEXT(uint64 instruction, Dis_info *info)
+static char *DEXT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string lsb = IMMEDIATE(lsb_value);
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *lsb = IMMEDIATE(lsb_value);
+    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5609,17 +5510,17 @@ static std::string DEXT(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DEXTU(uint64 instruction, Dis_info *info)
+static char *DEXTU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string lsb = IMMEDIATE(lsb_value);
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *lsb = IMMEDIATE(lsb_value);
+    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5635,17 +5536,17 @@ static std::string DEXTU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DINSM(uint64 instruction, Dis_info *info)
+static char *DINSM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string pos = IMMEDIATE(lsb_value);
-    std::string size = IMMEDIATE(msbd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *pos = IMMEDIATE(lsb_value);
+    char *size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
@@ -5663,17 +5564,17 @@ static std::string DINSM(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DINS(uint64 instruction, Dis_info *info)
+static char *DINS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string pos = IMMEDIATE(lsb_value);
-    std::string size = IMMEDIATE(msbd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *pos = IMMEDIATE(lsb_value);
+    char *size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
@@ -5691,17 +5592,17 @@ static std::string DINS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DINSU(uint64 instruction, Dis_info *info)
+static char *DINSU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string pos = IMMEDIATE(lsb_value);
-    std::string size = IMMEDIATE(msbd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *pos = IMMEDIATE(lsb_value);
+    char *size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
@@ -5719,11 +5620,11 @@ static std::string DINSU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DI(uint64 instruction, Dis_info *info)
+static char *DI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(rt_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DI %s", rt);
 }
@@ -5739,15 +5640,15 @@ static std::string DI(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DIV(uint64 instruction, Dis_info *info)
+static char *DIV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DIV %s, %s, %s", rd, rs, rt);
 }
@@ -5763,15 +5664,15 @@ static std::string DIV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DIV_D(uint64 instruction, Dis_info *info)
+static char *DIV_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("DIV.D %s, %s, %s", fd, fs, ft);
 }
@@ -5787,15 +5688,15 @@ static std::string DIV_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DIV_S(uint64 instruction, Dis_info *info)
+static char *DIV_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("DIV.S %s, %s, %s", fd, fs, ft);
 }
@@ -5811,15 +5712,15 @@ static std::string DIV_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DIVU(uint64 instruction, Dis_info *info)
+static char *DIVU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5835,17 +5736,17 @@ static std::string DIVU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DLSA(uint64 instruction, Dis_info *info)
+static char *DLSA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string u2 = IMMEDIATE(u2_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u2 = IMMEDIATE(u2_value);
 
     return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -5861,13 +5762,13 @@ static std::string DLSA(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DLUI_48_(uint64 instruction, Dis_info *info)
+static char *DLUI_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("DLUI %s, %s", rt, u);
 }
@@ -5883,15 +5784,15 @@ static std::string DLUI_48_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMFC0(uint64 instruction, Dis_info *info)
+static char *DMFC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -5907,13 +5808,13 @@ static std::string DMFC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMFC1(uint64 instruction, Dis_info *info)
+static char *DMFC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string fs = FPR(fs_value);
+    const char *rt = GPR(rt_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("DMFC1 %s, %s", rt, fs);
 }
@@ -5929,13 +5830,13 @@ static std::string DMFC1(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMFC2(uint64 instruction, Dis_info *info)
+static char *DMFC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string cs = CPR(cs_value);
+    const char *rt = GPR(rt_value);
+    char *cs = CPR(cs_value);
 
     return img_format("DMFC2 %s, %s", rt, cs);
 }
@@ -5951,15 +5852,15 @@ static std::string DMFC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMFGC0(uint64 instruction, Dis_info *info)
+static char *DMFGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -5975,15 +5876,15 @@ static std::string DMFGC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMOD(uint64 instruction, Dis_info *info)
+static char *DMOD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DMOD %s, %s, %s", rd, rs, rt);
 }
@@ -5999,15 +5900,15 @@ static std::string DMOD(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMODU(uint64 instruction, Dis_info *info)
+static char *DMODU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DMODU %s, %s, %s", rd, rs, rt);
 }
@@ -6023,15 +5924,15 @@ static std::string DMODU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMTC0(uint64 instruction, Dis_info *info)
+static char *DMTC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6047,13 +5948,13 @@ static std::string DMTC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMTC1(uint64 instruction, Dis_info *info)
+static char *DMTC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string fs = FPR(fs_value);
+    const char *rt = GPR(rt_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("DMTC1 %s, %s", rt, fs);
 }
@@ -6069,13 +5970,13 @@ static std::string DMTC1(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMTC2(uint64 instruction, Dis_info *info)
+static char *DMTC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string cs = CPR(cs_value);
+    const char *rt = GPR(rt_value);
+    char *cs = CPR(cs_value);
 
     return img_format("DMTC2 %s, %s", rt, cs);
 }
@@ -6091,15 +5992,15 @@ static std::string DMTC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMTGC0(uint64 instruction, Dis_info *info)
+static char *DMTGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6115,11 +6016,11 @@ static std::string DMTGC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMT(uint64 instruction, Dis_info *info)
+static char *DMT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(rt_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DMT %s", rt);
 }
@@ -6135,15 +6036,15 @@ static std::string DMT(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMUH(uint64 instruction, Dis_info *info)
+static char *DMUH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DMUH %s, %s, %s", rd, rs, rt);
 }
@@ -6159,15 +6060,15 @@ static std::string DMUH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMUHU(uint64 instruction, Dis_info *info)
+static char *DMUHU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DMUHU %s, %s, %s", rd, rs, rt);
 }
@@ -6183,15 +6084,15 @@ static std::string DMUHU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMUL(uint64 instruction, Dis_info *info)
+static char *DMUL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DMUL %s, %s, %s", rd, rs, rt);
 }
@@ -6207,15 +6108,15 @@ static std::string DMUL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DMULU(uint64 instruction, Dis_info *info)
+static char *DMULU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DMULU %s, %s, %s", rd, rs, rt);
 }
@@ -6232,15 +6133,15 @@ static std::string DMULU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string DPA_W_PH(uint64 instruction, Dis_info *info)
+static char *DPA_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6256,15 +6157,15 @@ static std::string DPA_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQ_SA_L_W(uint64 instruction, Dis_info *info)
+static char *DPAQ_SA_L_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6280,15 +6181,15 @@ static std::string DPAQ_SA_L_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQ_S_W_PH(uint64 instruction, Dis_info *info)
+static char *DPAQ_S_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6304,15 +6205,15 @@ static std::string DPAQ_S_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQX_SA_W_PH(uint64 instruction, Dis_info *info)
+static char *DPAQX_SA_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6328,15 +6229,15 @@ static std::string DPAQX_SA_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQX_S_W_PH(uint64 instruction, Dis_info *info)
+static char *DPAQX_S_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6352,15 +6253,15 @@ static std::string DPAQX_S_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPAU_H_QBL(uint64 instruction, Dis_info *info)
+static char *DPAU_H_QBL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6376,15 +6277,15 @@ static std::string DPAU_H_QBL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPAU_H_QBR(uint64 instruction, Dis_info *info)
+static char *DPAU_H_QBR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6400,15 +6301,15 @@ static std::string DPAU_H_QBR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPAX_W_PH(uint64 instruction, Dis_info *info)
+static char *DPAX_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6424,15 +6325,15 @@ static std::string DPAX_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPS_W_PH(uint64 instruction, Dis_info *info)
+static char *DPS_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPS.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6448,15 +6349,15 @@ static std::string DPS_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQ_SA_L_W(uint64 instruction, Dis_info *info)
+static char *DPSQ_SA_L_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6472,15 +6373,15 @@ static std::string DPSQ_SA_L_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQ_S_W_PH(uint64 instruction, Dis_info *info)
+static char *DPSQ_S_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6496,15 +6397,15 @@ static std::string DPSQ_S_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQX_SA_W_PH(uint64 instruction, Dis_info *info)
+static char *DPSQX_SA_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6520,15 +6421,15 @@ static std::string DPSQX_SA_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQX_S_W_PH(uint64 instruction, Dis_info *info)
+static char *DPSQX_S_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6544,15 +6445,15 @@ static std::string DPSQX_S_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPSU_H_QBL(uint64 instruction, Dis_info *info)
+static char *DPSU_H_QBL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6568,15 +6469,15 @@ static std::string DPSU_H_QBL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPSU_H_QBR(uint64 instruction, Dis_info *info)
+static char *DPSU_H_QBR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6592,15 +6493,15 @@ static std::string DPSU_H_QBR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DPSX_W_PH(uint64 instruction, Dis_info *info)
+static char *DPSX_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6616,15 +6517,15 @@ static std::string DPSX_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DROTR(uint64 instruction, Dis_info *info)
+static char *DROTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("DROTR %s, %s, %s", rt, rs, shift);
 }
@@ -6640,15 +6541,15 @@ static std::string DROTR(uint64 instruction, Dis_info *info)
  *          rs -----
  *                       shift -----
  */
-static std::string DROTR32(uint64 instruction, Dis_info *info)
+static char *DROTR32(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
 }
@@ -6664,15 +6565,15 @@ static std::string DROTR32(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DROTRV(uint64 instruction, Dis_info *info)
+static char *DROTRV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -6688,17 +6589,17 @@ static std::string DROTRV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DROTX(uint64 instruction, Dis_info *info)
+static char *DROTX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shiftx_value = extract_shiftx_11_10_9_8_7_6(instruction);
     uint64 shift_value = extract_shift_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
-    std::string shiftx = IMMEDIATE(shiftx_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
+    char *shiftx = IMMEDIATE(shiftx_value);
 
     return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
 }
@@ -6714,15 +6615,15 @@ static std::string DROTX(uint64 instruction, Dis_info *info)
  *          rs -----
  *                       shift -----
  */
-static std::string DSLL(uint64 instruction, Dis_info *info)
+static char *DSLL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("DSLL %s, %s, %s", rt, rs, shift);
 }
@@ -6738,15 +6639,15 @@ static std::string DSLL(uint64 instruction, Dis_info *info)
  *          rs -----
  *                       shift -----
  */
-static std::string DSLL32(uint64 instruction, Dis_info *info)
+static char *DSLL32(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6762,15 +6663,15 @@ static std::string DSLL32(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DSLLV(uint64 instruction, Dis_info *info)
+static char *DSLLV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DSLLV %s, %s, %s", rd, rs, rt);
 }
@@ -6786,15 +6687,15 @@ static std::string DSLLV(uint64 instruction, Dis_info *info)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRA(uint64 instruction, Dis_info *info)
+static char *DSRA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("DSRA %s, %s, %s", rt, rs, shift);
 }
@@ -6810,15 +6711,15 @@ static std::string DSRA(uint64 instruction, Dis_info *info)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRA32(uint64 instruction, Dis_info *info)
+static char *DSRA32(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
 }
@@ -6834,15 +6735,15 @@ static std::string DSRA32(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DSRAV(uint64 instruction, Dis_info *info)
+static char *DSRAV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DSRAV %s, %s, %s", rd, rs, rt);
 }
@@ -6858,15 +6759,15 @@ static std::string DSRAV(uint64 instruction, Dis_info *info)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRL(uint64 instruction, Dis_info *info)
+static char *DSRL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("DSRL %s, %s, %s", rt, rs, shift);
 }
@@ -6882,15 +6783,15 @@ static std::string DSRL(uint64 instruction, Dis_info *info)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRL32(uint64 instruction, Dis_info *info)
+static char *DSRL32(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6906,15 +6807,15 @@ static std::string DSRL32(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DSRLV(uint64 instruction, Dis_info *info)
+static char *DSRLV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DSRLV %s, %s, %s", rd, rs, rt);
 }
@@ -6930,15 +6831,15 @@ static std::string DSRLV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DSUB(uint64 instruction, Dis_info *info)
+static char *DSUB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DSUB %s, %s, %s", rd, rs, rt);
 }
@@ -6954,15 +6855,15 @@ static std::string DSUB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DSUBU(uint64 instruction, Dis_info *info)
+static char *DSUBU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DSUBU %s, %s, %s", rd, rs, rt);
 }
@@ -6978,11 +6879,11 @@ static std::string DSUBU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DVPE(uint64 instruction, Dis_info *info)
+static char *DVPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(rt_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DVPE %s", rt);
 }
@@ -6998,11 +6899,11 @@ static std::string DVPE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string DVP(uint64 instruction, Dis_info *info)
+static char *DVP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(rt_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("DVP %s", rt);
 }
@@ -7018,11 +6919,11 @@ static std::string DVP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EHB(uint64 instruction, Dis_info *info)
+static char *EHB(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "EHB ";
+    return g_strdup("EHB ");
 }
 
 
@@ -7036,11 +6937,11 @@ static std::string EHB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EI(uint64 instruction, Dis_info *info)
+static char *EI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(rt_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("EI %s", rt);
 }
@@ -7056,11 +6957,11 @@ static std::string EI(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EMT(uint64 instruction, Dis_info *info)
+static char *EMT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(rt_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("EMT %s", rt);
 }
@@ -7076,11 +6977,11 @@ static std::string EMT(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ERET(uint64 instruction, Dis_info *info)
+static char *ERET(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "ERET ";
+    return g_strdup("ERET ");
 }
 
 
@@ -7094,11 +6995,11 @@ static std::string ERET(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ERETNC(uint64 instruction, Dis_info *info)
+static char *ERETNC(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "ERETNC ";
+    return g_strdup("ERETNC ");
 }
 
 
@@ -7112,11 +7013,11 @@ static std::string ERETNC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EVP(uint64 instruction, Dis_info *info)
+static char *EVP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(rt_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("EVP %s", rt);
 }
@@ -7132,11 +7033,11 @@ static std::string EVP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EVPE(uint64 instruction, Dis_info *info)
+static char *EVPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(rt_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("EVPE %s", rt);
 }
@@ -7152,17 +7053,17 @@ static std::string EVPE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EXT(uint64 instruction, Dis_info *info)
+static char *EXT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string lsb = IMMEDIATE(lsb_value);
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *lsb = IMMEDIATE(lsb_value);
+    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -7178,17 +7079,17 @@ static std::string EXT(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EXTD(uint64 instruction, Dis_info *info)
+static char *EXTD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7204,17 +7105,17 @@ static std::string EXTD(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EXTD32(uint64 instruction, Dis_info *info)
+static char *EXTD32(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7230,15 +7131,15 @@ static std::string EXTD32(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EXTPDP(uint64 instruction, Dis_info *info)
+static char *EXTPDP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string size = IMMEDIATE(size_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    char *size = IMMEDIATE(size_value);
 
     return img_format("EXTPDP %s, %s, %s", rt, ac, size);
 }
@@ -7254,15 +7155,15 @@ static std::string EXTPDP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EXTPDPV(uint64 instruction, Dis_info *info)
+static char *EXTPDPV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("EXTPDPV %s, %s, %s", rt, ac, rs);
 }
@@ -7278,15 +7179,15 @@ static std::string EXTPDPV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EXTP(uint64 instruction, Dis_info *info)
+static char *EXTP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string size = IMMEDIATE(size_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    char *size = IMMEDIATE(size_value);
 
     return img_format("EXTP %s, %s, %s", rt, ac, size);
 }
@@ -7302,15 +7203,15 @@ static std::string EXTP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string EXTPV(uint64 instruction, Dis_info *info)
+static char *EXTPV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("EXTPV %s, %s, %s", rt, ac, rs);
 }
@@ -7327,15 +7228,15 @@ static std::string EXTPV(uint64 instruction, Dis_info *info)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_RS_W(uint64 instruction, Dis_info *info)
+static char *EXTR_RS_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
 }
@@ -7352,15 +7253,15 @@ static std::string EXTR_RS_W(uint64 instruction, Dis_info *info)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_R_W(uint64 instruction, Dis_info *info)
+static char *EXTR_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
 }
@@ -7377,15 +7278,15 @@ static std::string EXTR_R_W(uint64 instruction, Dis_info *info)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_S_H(uint64 instruction, Dis_info *info)
+static char *EXTR_S_H(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
 }
@@ -7402,15 +7303,15 @@ static std::string EXTR_S_H(uint64 instruction, Dis_info *info)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_W(uint64 instruction, Dis_info *info)
+static char *EXTR_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
 }
@@ -7427,15 +7328,15 @@ static std::string EXTR_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_RS_W(uint64 instruction, Dis_info *info)
+static char *EXTRV_RS_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
 }
@@ -7452,15 +7353,15 @@ static std::string EXTRV_RS_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_R_W(uint64 instruction, Dis_info *info)
+static char *EXTRV_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
 }
@@ -7477,15 +7378,15 @@ static std::string EXTRV_R_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_S_H(uint64 instruction, Dis_info *info)
+static char *EXTRV_S_H(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
 }
@@ -7502,15 +7403,15 @@ static std::string EXTRV_S_H(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_W(uint64 instruction, Dis_info *info)
+static char *EXTRV_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("EXTRV.W %s, %s, %s", rt, ac, rs);
 }
@@ -7527,17 +7428,17 @@ static std::string EXTRV_W(uint64 instruction, Dis_info *info)
  *               rd -----
  *                 shift -----
  */
-static std::string EXTW(uint64 instruction, Dis_info *info)
+static char *EXTW(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7553,13 +7454,13 @@ static std::string EXTW(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_L_D(uint64 instruction, Dis_info *info)
+static char *FLOOR_L_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("FLOOR.L.D %s, %s", ft, fs);
 }
@@ -7575,13 +7476,13 @@ static std::string FLOOR_L_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_L_S(uint64 instruction, Dis_info *info)
+static char *FLOOR_L_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("FLOOR.L.S %s, %s", ft, fs);
 }
@@ -7597,13 +7498,13 @@ static std::string FLOOR_L_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_W_D(uint64 instruction, Dis_info *info)
+static char *FLOOR_W_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("FLOOR.W.D %s, %s", ft, fs);
 }
@@ -7619,13 +7520,13 @@ static std::string FLOOR_W_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_W_S(uint64 instruction, Dis_info *info)
+static char *FLOOR_W_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("FLOOR.W.S %s, %s", ft, fs);
 }
@@ -7641,15 +7542,15 @@ static std::string FLOOR_W_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string FORK(uint64 instruction, Dis_info *info)
+static char *FORK(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("FORK %s, %s, %s", rd, rs, rt);
 }
@@ -7665,11 +7566,11 @@ static std::string FORK(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string HYPCALL(uint64 instruction, Dis_info *info)
+static char *HYPCALL(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    std::string code = IMMEDIATE(code_value);
+    char *code = IMMEDIATE(code_value);
 
     return img_format("HYPCALL %s", code);
 }
@@ -7685,11 +7586,11 @@ static std::string HYPCALL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string HYPCALL_16_(uint64 instruction, Dis_info *info)
+static char *HYPCALL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    std::string code = IMMEDIATE(code_value);
+    char *code = IMMEDIATE(code_value);
 
     return img_format("HYPCALL %s", code);
 }
@@ -7705,17 +7606,17 @@ static std::string HYPCALL_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string INS(uint64 instruction, Dis_info *info)
+static char *INS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string pos = IMMEDIATE(lsb_value);
-    std::string size = IMMEDIATE(msbd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *pos = IMMEDIATE(lsb_value);
+    char *size = IMMEDIATE(msbd_value);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
@@ -7732,13 +7633,13 @@ static std::string INS(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string INSV(uint64 instruction, Dis_info *info)
+static char *INSV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("INSV %s, %s", rt, rs);
 }
@@ -7754,11 +7655,11 @@ static std::string INSV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string IRET(uint64 instruction, Dis_info *info)
+static char *IRET(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "IRET ";
+    return g_strdup("IRET ");
 }
 
 
@@ -7772,11 +7673,11 @@ static std::string IRET(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string JALRC_16_(uint64 instruction, Dis_info *info)
+static char *JALRC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    std::string rt = GPR(rt_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("JALRC $%d, %s", 31, rt);
 }
@@ -7792,13 +7693,13 @@ static std::string JALRC_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string JALRC_32_(uint64 instruction, Dis_info *info)
+static char *JALRC_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("JALRC %s, %s", rt, rs);
 }
@@ -7814,13 +7715,13 @@ static std::string JALRC_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string JALRC_HB(uint64 instruction, Dis_info *info)
+static char *JALRC_HB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("JALRC.HB %s, %s", rt, rs);
 }
@@ -7836,11 +7737,11 @@ static std::string JALRC_HB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string JRC(uint64 instruction, Dis_info *info)
+static char *JRC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    std::string rt = GPR(rt_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("JRC %s", rt);
 }
@@ -7856,15 +7757,15 @@ static std::string JRC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LB_16_(uint64 instruction, Dis_info *info)
+static char *LB_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(u_value);
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(u_value);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LB %s, %s(%s)", rt3, u, rs3);
 }
@@ -7880,13 +7781,13 @@ static std::string LB_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LB_GP_(uint64 instruction, Dis_info *info)
+static char *LB_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LB %s, %s($%d)", rt, u, 28);
 }
@@ -7902,15 +7803,15 @@ static std::string LB_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LB_S9_(uint64 instruction, Dis_info *info)
+static char *LB_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LB %s, %s(%s)", rt, s, rs);
 }
@@ -7926,15 +7827,15 @@ static std::string LB_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LB_U12_(uint64 instruction, Dis_info *info)
+static char *LB_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LB %s, %s(%s)", rt, u, rs);
 }
@@ -7950,15 +7851,15 @@ static std::string LB_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LBE(uint64 instruction, Dis_info *info)
+static char *LBE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LBE %s, %s(%s)", rt, s, rs);
 }
@@ -7974,15 +7875,15 @@ static std::string LBE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_16_(uint64 instruction, Dis_info *info)
+static char *LBU_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(u_value);
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(u_value);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LBU %s, %s(%s)", rt3, u, rs3);
 }
@@ -7998,13 +7899,13 @@ static std::string LBU_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_GP_(uint64 instruction, Dis_info *info)
+static char *LBU_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LBU %s, %s($%d)", rt, u, 28);
 }
@@ -8020,15 +7921,15 @@ static std::string LBU_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_S9_(uint64 instruction, Dis_info *info)
+static char *LBU_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LBU %s, %s(%s)", rt, s, rs);
 }
@@ -8044,15 +7945,15 @@ static std::string LBU_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_U12_(uint64 instruction, Dis_info *info)
+static char *LBU_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LBU %s, %s(%s)", rt, u, rs);
 }
@@ -8068,15 +7969,15 @@ static std::string LBU_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LBUE(uint64 instruction, Dis_info *info)
+static char *LBUE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LBUE %s, %s(%s)", rt, s, rs);
 }
@@ -8092,15 +7993,15 @@ static std::string LBUE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LBUX(uint64 instruction, Dis_info *info)
+static char *LBUX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LBUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8116,15 +8017,15 @@ static std::string LBUX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LBX(uint64 instruction, Dis_info *info)
+static char *LBX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LBX %s, %s(%s)", rd, rs, rt);
 }
@@ -8140,13 +8041,13 @@ static std::string LBX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LD_GP_(uint64 instruction, Dis_info *info)
+static char *LD_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LD %s, %s($%d)", rt, u, 28);
 }
@@ -8162,15 +8063,15 @@ static std::string LD_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LD_S9_(uint64 instruction, Dis_info *info)
+static char *LD_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LD %s, %s(%s)", rt, s, rs);
 }
@@ -8186,15 +8087,15 @@ static std::string LD_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LD_U12_(uint64 instruction, Dis_info *info)
+static char *LD_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LD %s, %s(%s)", rt, u, rs);
 }
@@ -8210,13 +8111,13 @@ static std::string LD_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1_GP_(uint64 instruction, Dis_info *info)
+static char *LDC1_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *ft = FPR(ft_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -8232,15 +8133,15 @@ static std::string LDC1_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1_S9_(uint64 instruction, Dis_info *info)
+static char *LDC1_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *ft = FPR(ft_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -8256,15 +8157,15 @@ static std::string LDC1_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1_U12_(uint64 instruction, Dis_info *info)
+static char *LDC1_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *ft = FPR(ft_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -8280,15 +8181,15 @@ static std::string LDC1_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1XS(uint64 instruction, Dis_info *info)
+static char *LDC1XS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ft = FPR(ft_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -8304,15 +8205,15 @@ static std::string LDC1XS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1X(uint64 instruction, Dis_info *info)
+static char *LDC1X(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ft = FPR(ft_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -8328,15 +8229,15 @@ static std::string LDC1X(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LDC2(uint64 instruction, Dis_info *info)
+static char *LDC2(uint64 instruction, Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ct = CPR(ct_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *ct = CPR(ct_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LDC2 %s, %s(%s)", ct, s, rs);
 }
@@ -8352,17 +8253,17 @@ static std::string LDC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LDM(uint64 instruction, Dis_info *info)
+static char *LDM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -8378,13 +8279,13 @@ static std::string LDM(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LDPC_48_(uint64 instruction, Dis_info *info)
+static char *LDPC_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 6, info);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 6, info);
 
     return img_format("LDPC %s, %s", rt, s);
 }
@@ -8400,15 +8301,15 @@ static std::string LDPC_48_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LDX(uint64 instruction, Dis_info *info)
+static char *LDX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LDX %s, %s(%s)", rd, rs, rt);
 }
@@ -8424,15 +8325,15 @@ static std::string LDX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LDXS(uint64 instruction, Dis_info *info)
+static char *LDXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8448,15 +8349,15 @@ static std::string LDXS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LH_16_(uint64 instruction, Dis_info *info)
+static char *LH_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(u_value);
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(u_value);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LH %s, %s(%s)", rt3, u, rs3);
 }
@@ -8472,13 +8373,13 @@ static std::string LH_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LH_GP_(uint64 instruction, Dis_info *info)
+static char *LH_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LH %s, %s($%d)", rt, u, 28);
 }
@@ -8494,15 +8395,15 @@ static std::string LH_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LH_S9_(uint64 instruction, Dis_info *info)
+static char *LH_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LH %s, %s(%s)", rt, s, rs);
 }
@@ -8518,15 +8419,15 @@ static std::string LH_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LH_U12_(uint64 instruction, Dis_info *info)
+static char *LH_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LH %s, %s(%s)", rt, u, rs);
 }
@@ -8542,15 +8443,15 @@ static std::string LH_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LHE(uint64 instruction, Dis_info *info)
+static char *LHE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LHE %s, %s(%s)", rt, s, rs);
 }
@@ -8566,15 +8467,15 @@ static std::string LHE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_16_(uint64 instruction, Dis_info *info)
+static char *LHU_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(u_value);
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(u_value);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LHU %s, %s(%s)", rt3, u, rs3);
 }
@@ -8590,13 +8491,13 @@ static std::string LHU_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_GP_(uint64 instruction, Dis_info *info)
+static char *LHU_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LHU %s, %s($%d)", rt, u, 28);
 }
@@ -8612,15 +8513,15 @@ static std::string LHU_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_S9_(uint64 instruction, Dis_info *info)
+static char *LHU_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LHU %s, %s(%s)", rt, s, rs);
 }
@@ -8636,15 +8537,15 @@ static std::string LHU_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_U12_(uint64 instruction, Dis_info *info)
+static char *LHU_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LHU %s, %s(%s)", rt, u, rs);
 }
@@ -8660,15 +8561,15 @@ static std::string LHU_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LHUE(uint64 instruction, Dis_info *info)
+static char *LHUE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LHUE %s, %s(%s)", rt, s, rs);
 }
@@ -8684,15 +8585,15 @@ static std::string LHUE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LHUX(uint64 instruction, Dis_info *info)
+static char *LHUX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LHUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8708,15 +8609,15 @@ static std::string LHUX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LHUXS(uint64 instruction, Dis_info *info)
+static char *LHUXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LHUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8732,15 +8633,15 @@ static std::string LHUXS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LHXS(uint64 instruction, Dis_info *info)
+static char *LHXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8756,15 +8657,15 @@ static std::string LHXS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LHX(uint64 instruction, Dis_info *info)
+static char *LHX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LHX %s, %s(%s)", rd, rs, rt);
 }
@@ -8780,13 +8681,13 @@ static std::string LHX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LI_16_(uint64 instruction, Dis_info *info)
+static char *LI_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
 
     return img_format("LI %s, %s", rt3, eu);
 }
@@ -8802,13 +8703,13 @@ static std::string LI_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LI_48_(uint64 instruction, Dis_info *info)
+static char *LI_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
 
     return img_format("LI %s, %s", rt, s);
 }
@@ -8824,15 +8725,15 @@ static std::string LI_48_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LL(uint64 instruction, Dis_info *info)
+static char *LL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LL %s, %s(%s)", rt, s, rs);
 }
@@ -8848,15 +8749,15 @@ static std::string LL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LLD(uint64 instruction, Dis_info *info)
+static char *LLD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LLD %s, %s(%s)", rt, s, rs);
 }
@@ -8872,15 +8773,15 @@ static std::string LLD(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LLDP(uint64 instruction, Dis_info *info)
+static char *LLDP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ru = GPR(ru_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ru = GPR(ru_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LLDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8896,15 +8797,15 @@ static std::string LLDP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LLE(uint64 instruction, Dis_info *info)
+static char *LLE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LLE %s, %s(%s)", rt, s, rs);
 }
@@ -8920,15 +8821,15 @@ static std::string LLE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LLWP(uint64 instruction, Dis_info *info)
+static char *LLWP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ru = GPR(ru_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ru = GPR(ru_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LLWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8944,15 +8845,15 @@ static std::string LLWP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LLWPE(uint64 instruction, Dis_info *info)
+static char *LLWPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ru = GPR(ru_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ru = GPR(ru_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LLWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -8968,17 +8869,17 @@ static std::string LLWPE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LSA(uint64 instruction, Dis_info *info)
+static char *LSA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
-    std::string u2 = IMMEDIATE(u2_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u2 = IMMEDIATE(u2_value);
 
     return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -8994,13 +8895,13 @@ static std::string LSA(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LUI(uint64 instruction, Dis_info *info)
+static char *LUI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
 
     return img_format("LUI %s, %%hi(%s)", rt, s);
 }
@@ -9016,15 +8917,15 @@ static std::string LUI(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LW_16_(uint64 instruction, Dis_info *info)
+static char *LW_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(u_value);
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(u_value);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LW %s, %s(%s)", rt3, u, rs3);
 }
@@ -9040,15 +8941,15 @@ static std::string LW_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LW_4X4_(uint64 instruction, Dis_info *info)
+static char *LW_4X4_(uint64 instruction, Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    std::string u = IMMEDIATE(u_value);
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    char *u = IMMEDIATE(u_value);
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("LW %s, %s(%s)", rt4, u, rs4);
 }
@@ -9064,13 +8965,13 @@ static std::string LW_4X4_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LW_GP_(uint64 instruction, Dis_info *info)
+static char *LW_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LW %s, %s($%d)", rt, u, 28);
 }
@@ -9086,13 +8987,13 @@ static std::string LW_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LW_GP16_(uint64 instruction, Dis_info *info)
+static char *LW_GP16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(u_value);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LW %s, %s($%d)", rt3, u, 28);
 }
@@ -9108,15 +9009,15 @@ static std::string LW_GP16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LW_S9_(uint64 instruction, Dis_info *info)
+static char *LW_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LW %s, %s(%s)", rt, s, rs);
 }
@@ -9132,13 +9033,13 @@ static std::string LW_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LW_SP_(uint64 instruction, Dis_info *info)
+static char *LW_SP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LW %s, %s($%d)", rt, u, 29);
 }
@@ -9154,15 +9055,15 @@ static std::string LW_SP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LW_U12_(uint64 instruction, Dis_info *info)
+static char *LW_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LW %s, %s(%s)", rt, u, rs);
 }
@@ -9178,13 +9079,13 @@ static std::string LW_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1_GP_(uint64 instruction, Dis_info *info)
+static char *LWC1_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *ft = FPR(ft_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -9200,15 +9101,15 @@ static std::string LWC1_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1_S9_(uint64 instruction, Dis_info *info)
+static char *LWC1_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *ft = FPR(ft_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -9224,15 +9125,15 @@ static std::string LWC1_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1_U12_(uint64 instruction, Dis_info *info)
+static char *LWC1_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *ft = FPR(ft_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -9248,15 +9149,15 @@ static std::string LWC1_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1X(uint64 instruction, Dis_info *info)
+static char *LWC1X(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ft = FPR(ft_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -9272,15 +9173,15 @@ static std::string LWC1X(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1XS(uint64 instruction, Dis_info *info)
+static char *LWC1XS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ft = FPR(ft_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -9296,15 +9197,15 @@ static std::string LWC1XS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWC2(uint64 instruction, Dis_info *info)
+static char *LWC2(uint64 instruction, Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ct = CPR(ct_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *ct = CPR(ct_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LWC2 %s, %s(%s)", ct, s, rs);
 }
@@ -9320,15 +9221,15 @@ static std::string LWC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWE(uint64 instruction, Dis_info *info)
+static char *LWE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LWE %s, %s(%s)", rt, s, rs);
 }
@@ -9344,17 +9245,17 @@ static std::string LWE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWM(uint64 instruction, Dis_info *info)
+static char *LWM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -9370,13 +9271,13 @@ static std::string LWM(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWPC_48_(uint64 instruction, Dis_info *info)
+static char *LWPC_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 6, info);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 6, info);
 
     return img_format("LWPC %s, %s", rt, s);
 }
@@ -9392,13 +9293,13 @@ static std::string LWPC_48_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWU_GP_(uint64 instruction, Dis_info *info)
+static char *LWU_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("LWU %s, %s($%d)", rt, u, 28);
 }
@@ -9414,15 +9315,15 @@ static std::string LWU_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWU_S9_(uint64 instruction, Dis_info *info)
+static char *LWU_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LWU %s, %s(%s)", rt, s, rs);
 }
@@ -9438,15 +9339,15 @@ static std::string LWU_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWU_U12_(uint64 instruction, Dis_info *info)
+static char *LWU_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("LWU %s, %s(%s)", rt, u, rs);
 }
@@ -9462,15 +9363,15 @@ static std::string LWU_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWUX(uint64 instruction, Dis_info *info)
+static char *LWUX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LWUX %s, %s(%s)", rd, rs, rt);
 }
@@ -9486,15 +9387,15 @@ static std::string LWUX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWUXS(uint64 instruction, Dis_info *info)
+static char *LWUXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LWUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9510,15 +9411,15 @@ static std::string LWUXS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWX(uint64 instruction, Dis_info *info)
+static char *LWX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LWX %s, %s(%s)", rd, rs, rt);
 }
@@ -9534,15 +9435,15 @@ static std::string LWX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWXS_16_(uint64 instruction, Dis_info *info)
+static char *LWXS_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    char *rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
 
     return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
 }
@@ -9558,15 +9459,15 @@ static std::string LWXS_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string LWXS_32_(uint64 instruction, Dis_info *info)
+static char *LWXS_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("LWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9583,15 +9484,15 @@ static std::string LWXS_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MADD_DSP_(uint64 instruction, Dis_info *info)
+static char *MADD_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MADD %s, %s, %s", ac, rs, rt);
 }
@@ -9607,15 +9508,15 @@ static std::string MADD_DSP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MADDF_D(uint64 instruction, Dis_info *info)
+static char *MADDF_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MADDF.D %s, %s, %s", fd, fs, ft);
 }
@@ -9631,15 +9532,15 @@ static std::string MADDF_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MADDF_S(uint64 instruction, Dis_info *info)
+static char *MADDF_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MADDF.S %s, %s, %s", fd, fs, ft);
 }
@@ -9656,15 +9557,15 @@ static std::string MADDF_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MADDU_DSP_(uint64 instruction, Dis_info *info)
+static char *MADDU_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MADDU %s, %s, %s", ac, rs, rt);
 }
@@ -9681,15 +9582,15 @@ static std::string MADDU_DSP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_S_W_PHL(uint64 instruction, Dis_info *info)
+static char *MAQ_S_W_PHL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9706,15 +9607,15 @@ static std::string MAQ_S_W_PHL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_S_W_PHR(uint64 instruction, Dis_info *info)
+static char *MAQ_S_W_PHR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9731,15 +9632,15 @@ static std::string MAQ_S_W_PHR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_SA_W_PHL(uint64 instruction, Dis_info *info)
+static char *MAQ_SA_W_PHL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9756,15 +9657,15 @@ static std::string MAQ_SA_W_PHL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_SA_W_PHR(uint64 instruction, Dis_info *info)
+static char *MAQ_SA_W_PHR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9780,15 +9681,15 @@ static std::string MAQ_SA_W_PHR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MAX_D(uint64 instruction, Dis_info *info)
+static char *MAX_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MAX.D %s, %s, %s", fd, fs, ft);
 }
@@ -9804,15 +9705,15 @@ static std::string MAX_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MAX_S(uint64 instruction, Dis_info *info)
+static char *MAX_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MAX.S %s, %s, %s", fd, fs, ft);
 }
@@ -9828,15 +9729,15 @@ static std::string MAX_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MAXA_D(uint64 instruction, Dis_info *info)
+static char *MAXA_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MAXA.D %s, %s, %s", fd, fs, ft);
 }
@@ -9852,15 +9753,15 @@ static std::string MAXA_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MAXA_S(uint64 instruction, Dis_info *info)
+static char *MAXA_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MAXA.S %s, %s, %s", fd, fs, ft);
 }
@@ -9876,15 +9777,15 @@ static std::string MAXA_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MFC0(uint64 instruction, Dis_info *info)
+static char *MFC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9900,13 +9801,13 @@ static std::string MFC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MFC1(uint64 instruction, Dis_info *info)
+static char *MFC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string fs = FPR(fs_value);
+    const char *rt = GPR(rt_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("MFC1 %s, %s", rt, fs);
 }
@@ -9922,13 +9823,13 @@ static std::string MFC1(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MFC2(uint64 instruction, Dis_info *info)
+static char *MFC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string cs = CPR(cs_value);
+    const char *rt = GPR(rt_value);
+    char *cs = CPR(cs_value);
 
     return img_format("MFC2 %s, %s", rt, cs);
 }
@@ -9944,15 +9845,15 @@ static std::string MFC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MFGC0(uint64 instruction, Dis_info *info)
+static char *MFGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9968,15 +9869,15 @@ static std::string MFGC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MFHC0(uint64 instruction, Dis_info *info)
+static char *MFHC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9992,13 +9893,13 @@ static std::string MFHC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MFHC1(uint64 instruction, Dis_info *info)
+static char *MFHC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string fs = FPR(fs_value);
+    const char *rt = GPR(rt_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("MFHC1 %s, %s", rt, fs);
 }
@@ -10014,13 +9915,13 @@ static std::string MFHC1(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MFHC2(uint64 instruction, Dis_info *info)
+static char *MFHC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string cs = CPR(cs_value);
+    const char *rt = GPR(rt_value);
+    char *cs = CPR(cs_value);
 
     return img_format("MFHC2 %s, %s", rt, cs);
 }
@@ -10036,15 +9937,15 @@ static std::string MFHC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MFHGC0(uint64 instruction, Dis_info *info)
+static char *MFHGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10059,13 +9960,13 @@ static std::string MFHGC0(uint64 instruction, Dis_info *info)
  *     rt -----
  *               ac --
  */
-static std::string MFHI_DSP_(uint64 instruction, Dis_info *info)
+static char *MFHI_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
 
     return img_format("MFHI %s, %s", rt, ac);
 }
@@ -10081,17 +9982,17 @@ static std::string MFHI_DSP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MFHTR(uint64 instruction, Dis_info *info)
+static char *MFHTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = IMMEDIATE(c0s_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = IMMEDIATE(c0s_value);
+    char *u = IMMEDIATE(u_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10106,13 +10007,13 @@ static std::string MFHTR(uint64 instruction, Dis_info *info)
  *     rt -----
  *               ac --
  */
-static std::string MFLO_DSP_(uint64 instruction, Dis_info *info)
+static char *MFLO_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ac = AC(ac_value);
+    const char *rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
 
     return img_format("MFLO %s, %s", rt, ac);
 }
@@ -10128,17 +10029,17 @@ static std::string MFLO_DSP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MFTR(uint64 instruction, Dis_info *info)
+static char *MFTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = IMMEDIATE(c0s_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = IMMEDIATE(c0s_value);
+    char *u = IMMEDIATE(u_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10154,15 +10055,15 @@ static std::string MFTR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MIN_D(uint64 instruction, Dis_info *info)
+static char *MIN_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MIN.D %s, %s, %s", fd, fs, ft);
 }
@@ -10178,15 +10079,15 @@ static std::string MIN_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MIN_S(uint64 instruction, Dis_info *info)
+static char *MIN_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MIN.S %s, %s, %s", fd, fs, ft);
 }
@@ -10202,15 +10103,15 @@ static std::string MIN_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MINA_D(uint64 instruction, Dis_info *info)
+static char *MINA_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MINA.D %s, %s, %s", fd, fs, ft);
 }
@@ -10226,15 +10127,15 @@ static std::string MINA_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MINA_S(uint64 instruction, Dis_info *info)
+static char *MINA_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MINA.S %s, %s, %s", fd, fs, ft);
 }
@@ -10250,15 +10151,15 @@ static std::string MINA_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MOD(uint64 instruction, Dis_info *info)
+static char *MOD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MOD %s, %s, %s", rd, rs, rt);
 }
@@ -10274,15 +10175,15 @@ static std::string MOD(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MODSUB(uint64 instruction, Dis_info *info)
+static char *MODSUB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MODSUB %s, %s, %s", rd, rs, rt);
 }
@@ -10298,15 +10199,15 @@ static std::string MODSUB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MODU(uint64 instruction, Dis_info *info)
+static char *MODU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MODU %s, %s, %s", rd, rs, rt);
 }
@@ -10322,13 +10223,13 @@ static std::string MODU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MOV_D(uint64 instruction, Dis_info *info)
+static char *MOV_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("MOV.D %s, %s", ft, fs);
 }
@@ -10344,13 +10245,13 @@ static std::string MOV_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MOV_S(uint64 instruction, Dis_info *info)
+static char *MOV_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("MOV.S %s, %s", ft, fs);
 }
@@ -10366,15 +10267,15 @@ static std::string MOV_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MOVE_BALC(uint64 instruction, Dis_info *info)
+static char *MOVE_BALC(uint64 instruction, Dis_info *info)
 {
     uint64 rtz4_value = extract_rtz4_27_26_25_23_22_21(instruction);
     uint64 rd1_value = extract_rdl_25_24(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    std::string rd1 = GPR(decode_gpr_gpr1(rd1_value));
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string s = ADDRESS(s_value, 4, info);
+    const char *rd1 = GPR(decode_gpr_gpr1(rd1_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    char *s = ADDRESS(s_value, 4, info);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
@@ -10390,17 +10291,17 @@ static std::string MOVE_BALC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MOVEP(uint64 instruction, Dis_info *info)
+static char *MOVEP(uint64 instruction, Dis_info *info)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rsz4_value = extract_rsz4_4_2_1_0(instruction);
 
-    std::string rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    std::string re2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
+    const char *re2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
     /* !!!!!!!!!! - no conversion function */
-    std::string rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
 
     return img_format("MOVEP %s, %s, %s, %s", rd2, re2, rsz4, rtz4);
     /* hand edited */
@@ -10417,16 +10318,16 @@ static std::string MOVEP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MOVEP_REV_(uint64 instruction, Dis_info *info)
+static char *MOVEP_REV_(uint64 instruction, Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    std::string rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    std::string rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
+    const char *rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("MOVEP %s, %s, %s, %s", rs4, rt4, rd2, rs2);
@@ -10444,13 +10345,13 @@ static std::string MOVEP_REV_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MOVE(uint64 instruction, Dis_info *info)
+static char *MOVE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("MOVE %s, %s", rt, rs);
 }
@@ -10466,15 +10367,15 @@ static std::string MOVE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MOVN(uint64 instruction, Dis_info *info)
+static char *MOVN(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MOVN %s, %s, %s", rd, rs, rt);
 }
@@ -10490,15 +10391,15 @@ static std::string MOVN(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MOVZ(uint64 instruction, Dis_info *info)
+static char *MOVZ(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MOVZ %s, %s, %s", rd, rs, rt);
 }
@@ -10514,15 +10415,15 @@ static std::string MOVZ(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string MSUB_DSP_(uint64 instruction, Dis_info *info)
+static char *MSUB_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MSUB %s, %s, %s", ac, rs, rt);
 }
@@ -10538,15 +10439,15 @@ static std::string MSUB_DSP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MSUBF_D(uint64 instruction, Dis_info *info)
+static char *MSUBF_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MSUBF.D %s, %s, %s", fd, fs, ft);
 }
@@ -10562,15 +10463,15 @@ static std::string MSUBF_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MSUBF_S(uint64 instruction, Dis_info *info)
+static char *MSUBF_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MSUBF.S %s, %s, %s", fd, fs, ft);
 }
@@ -10586,15 +10487,15 @@ static std::string MSUBF_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string MSUBU_DSP_(uint64 instruction, Dis_info *info)
+static char *MSUBU_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MSUBU %s, %s, %s", ac, rs, rt);
 }
@@ -10610,15 +10511,15 @@ static std::string MSUBU_DSP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MTC0(uint64 instruction, Dis_info *info)
+static char *MTC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10634,13 +10535,13 @@ static std::string MTC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MTC1(uint64 instruction, Dis_info *info)
+static char *MTC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string fs = FPR(fs_value);
+    const char *rt = GPR(rt_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("MTC1 %s, %s", rt, fs);
 }
@@ -10656,13 +10557,13 @@ static std::string MTC1(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MTC2(uint64 instruction, Dis_info *info)
+static char *MTC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string cs = CPR(cs_value);
+    const char *rt = GPR(rt_value);
+    char *cs = CPR(cs_value);
 
     return img_format("MTC2 %s, %s", rt, cs);
 }
@@ -10678,15 +10579,15 @@ static std::string MTC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MTGC0(uint64 instruction, Dis_info *info)
+static char *MTGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10702,15 +10603,15 @@ static std::string MTGC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MTHC0(uint64 instruction, Dis_info *info)
+static char *MTHC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10726,13 +10627,13 @@ static std::string MTHC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MTHC1(uint64 instruction, Dis_info *info)
+static char *MTHC1(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string fs = FPR(fs_value);
+    const char *rt = GPR(rt_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("MTHC1 %s, %s", rt, fs);
 }
@@ -10748,13 +10649,13 @@ static std::string MTHC1(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MTHC2(uint64 instruction, Dis_info *info)
+static char *MTHC2(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string cs = CPR(cs_value);
+    const char *rt = GPR(rt_value);
+    char *cs = CPR(cs_value);
 
     return img_format("MTHC2 %s, %s", rt, cs);
 }
@@ -10770,15 +10671,15 @@ static std::string MTHC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MTHGC0(uint64 instruction, Dis_info *info)
+static char *MTHGC0(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = CPR(c0s_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = CPR(c0s_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10793,13 +10694,13 @@ static std::string MTHGC0(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string MTHI_DSP_(uint64 instruction, Dis_info *info)
+static char *MTHI_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *ac = AC(ac_value);
 
     return img_format("MTHI %s, %s", rs, ac);
 }
@@ -10814,13 +10715,13 @@ static std::string MTHI_DSP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string MTHLIP(uint64 instruction, Dis_info *info)
+static char *MTHLIP(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *ac = AC(ac_value);
 
     return img_format("MTHLIP %s, %s", rs, ac);
 }
@@ -10836,17 +10737,17 @@ static std::string MTHLIP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MTHTR(uint64 instruction, Dis_info *info)
+static char *MTHTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = IMMEDIATE(c0s_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = IMMEDIATE(c0s_value);
+    char *u = IMMEDIATE(u_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10861,13 +10762,13 @@ static std::string MTHTR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string MTLO_DSP_(uint64 instruction, Dis_info *info)
+static char *MTLO_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *ac = AC(ac_value);
 
     return img_format("MTLO %s, %s", rs, ac);
 }
@@ -10883,17 +10784,17 @@ static std::string MTLO_DSP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MTTR(uint64 instruction, Dis_info *info)
+static char *MTTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string c0s = IMMEDIATE(c0s_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *c0s = IMMEDIATE(c0s_value);
+    char *u = IMMEDIATE(u_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10909,15 +10810,15 @@ static std::string MTTR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MUH(uint64 instruction, Dis_info *info)
+static char *MUH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MUH %s, %s, %s", rd, rs, rt);
 }
@@ -10933,15 +10834,15 @@ static std::string MUH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MUHU(uint64 instruction, Dis_info *info)
+static char *MUHU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MUHU %s, %s, %s", rd, rs, rt);
 }
@@ -10957,15 +10858,15 @@ static std::string MUHU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_32_(uint64 instruction, Dis_info *info)
+static char *MUL_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MUL %s, %s, %s", rd, rs, rt);
 }
@@ -10981,13 +10882,13 @@ static std::string MUL_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_4X4_(uint64 instruction, Dis_info *info)
+static char *MUL_4X4_(uint64 instruction, Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
 
     return img_format("MUL %s, %s", rs4, rt4);
 }
@@ -11003,15 +10904,15 @@ static std::string MUL_4X4_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_D(uint64 instruction, Dis_info *info)
+static char *MUL_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MUL.D %s, %s, %s", fd, fs, ft);
 }
@@ -11028,15 +10929,15 @@ static std::string MUL_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_PH(uint64 instruction, Dis_info *info)
+static char *MUL_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MUL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11053,15 +10954,15 @@ static std::string MUL_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_S_PH(uint64 instruction, Dis_info *info)
+static char *MUL_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MUL_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11077,15 +10978,15 @@ static std::string MUL_S_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_S(uint64 instruction, Dis_info *info)
+static char *MUL_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("MUL.S %s, %s, %s", fd, fs, ft);
 }
@@ -11102,15 +11003,15 @@ static std::string MUL_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MULEQ_S_W_PHL(uint64 instruction, Dis_info *info)
+static char *MULEQ_S_W_PHL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
 }
@@ -11127,15 +11028,15 @@ static std::string MULEQ_S_W_PHL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MULEQ_S_W_PHR(uint64 instruction, Dis_info *info)
+static char *MULEQ_S_W_PHR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
 }
@@ -11152,15 +11053,15 @@ static std::string MULEQ_S_W_PHR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MULEU_S_PH_QBL(uint64 instruction, Dis_info *info)
+static char *MULEU_S_PH_QBL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
 }
@@ -11177,15 +11078,15 @@ static std::string MULEU_S_PH_QBL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MULEU_S_PH_QBR(uint64 instruction, Dis_info *info)
+static char *MULEU_S_PH_QBR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
 }
@@ -11202,15 +11103,15 @@ static std::string MULEU_S_PH_QBR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_RS_PH(uint64 instruction, Dis_info *info)
+static char *MULQ_RS_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11227,15 +11128,15 @@ static std::string MULQ_RS_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_RS_W(uint64 instruction, Dis_info *info)
+static char *MULQ_RS_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
 }
@@ -11252,15 +11153,15 @@ static std::string MULQ_RS_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_S_PH(uint64 instruction, Dis_info *info)
+static char *MULQ_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11277,15 +11178,15 @@ static std::string MULQ_S_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_S_W(uint64 instruction, Dis_info *info)
+static char *MULQ_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -11302,15 +11203,15 @@ static std::string MULQ_S_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string MULSA_W_PH(uint64 instruction, Dis_info *info)
+static char *MULSA_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11327,15 +11228,15 @@ static std::string MULSA_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string MULSAQ_S_W_PH(uint64 instruction, Dis_info *info)
+static char *MULSAQ_S_W_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11351,15 +11252,15 @@ static std::string MULSAQ_S_W_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string MULT_DSP_(uint64 instruction, Dis_info *info)
+static char *MULT_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULT %s, %s, %s", ac, rs, rt);
 }
@@ -11375,15 +11276,15 @@ static std::string MULT_DSP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string MULTU_DSP_(uint64 instruction, Dis_info *info)
+static char *MULTU_DSP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(ac_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULTU %s, %s, %s", ac, rs, rt);
 }
@@ -11399,15 +11300,15 @@ static std::string MULTU_DSP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string MULU(uint64 instruction, Dis_info *info)
+static char *MULU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("MULU %s, %s, %s", rd, rs, rt);
 }
@@ -11423,13 +11324,13 @@ static std::string MULU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string NEG_D(uint64 instruction, Dis_info *info)
+static char *NEG_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("NEG.D %s, %s", ft, fs);
 }
@@ -11445,13 +11346,13 @@ static std::string NEG_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string NEG_S(uint64 instruction, Dis_info *info)
+static char *NEG_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("NEG.S %s, %s", ft, fs);
 }
@@ -11467,11 +11368,11 @@ static std::string NEG_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string NOP_16_(uint64 instruction, Dis_info *info)
+static char *NOP_16_(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "NOP ";
+    return g_strdup("NOP ");
 }
 
 
@@ -11485,11 +11386,11 @@ static std::string NOP_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string NOP_32_(uint64 instruction, Dis_info *info)
+static char *NOP_32_(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "NOP ";
+    return g_strdup("NOP ");
 }
 
 
@@ -11503,15 +11404,15 @@ static std::string NOP_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string NOR(uint64 instruction, Dis_info *info)
+static char *NOR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("NOR %s, %s, %s", rd, rs, rt);
 }
@@ -11527,13 +11428,13 @@ static std::string NOR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string NOT_16_(uint64 instruction, Dis_info *info)
+static char *NOT_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("NOT %s, %s", rt3, rs3);
 }
@@ -11549,13 +11450,13 @@ static std::string NOT_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string OR_16_(uint64 instruction, Dis_info *info)
+static char *OR_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
     return img_format("OR %s, %s", rs3, rt3);
 }
@@ -11571,15 +11472,15 @@ static std::string OR_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string OR_32_(uint64 instruction, Dis_info *info)
+static char *OR_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("OR %s, %s, %s", rd, rs, rt);
 }
@@ -11595,15 +11496,15 @@ static std::string OR_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ORI(uint64 instruction, Dis_info *info)
+static char *ORI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("ORI %s, %s, %s", rt, rs, u);
 }
@@ -11620,15 +11521,15 @@ static std::string ORI(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PACKRL_PH(uint64 instruction, Dis_info *info)
+static char *PACKRL_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("PACKRL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11644,11 +11545,11 @@ static std::string PACKRL_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PAUSE(uint64 instruction, Dis_info *info)
+static char *PAUSE(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "PAUSE ";
+    return g_strdup("PAUSE ");
 }
 
 
@@ -11663,15 +11564,15 @@ static std::string PAUSE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PICK_PH(uint64 instruction, Dis_info *info)
+static char *PICK_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("PICK.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11688,15 +11589,15 @@ static std::string PICK_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PICK_QB(uint64 instruction, Dis_info *info)
+static char *PICK_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("PICK.QB %s, %s, %s", rd, rs, rt);
 }
@@ -11713,13 +11614,13 @@ static std::string PICK_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQ_W_PHL(uint64 instruction, Dis_info *info)
+static char *PRECEQ_W_PHL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PRECEQ.W.PHL %s, %s", rt, rs);
 }
@@ -11736,13 +11637,13 @@ static std::string PRECEQ_W_PHL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQ_W_PHR(uint64 instruction, Dis_info *info)
+static char *PRECEQ_W_PHR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PRECEQ.W.PHR %s, %s", rt, rs);
 }
@@ -11759,13 +11660,13 @@ static std::string PRECEQ_W_PHR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBLA(uint64 instruction, Dis_info *info)
+static char *PRECEQU_PH_QBLA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PRECEQU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11782,13 +11683,13 @@ static std::string PRECEQU_PH_QBLA(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBL(uint64 instruction, Dis_info *info)
+static char *PRECEQU_PH_QBL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PRECEQU.PH.QBL %s, %s", rt, rs);
 }
@@ -11805,13 +11706,13 @@ static std::string PRECEQU_PH_QBL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBRA(uint64 instruction, Dis_info *info)
+static char *PRECEQU_PH_QBRA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PRECEQU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11828,13 +11729,13 @@ static std::string PRECEQU_PH_QBRA(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBR(uint64 instruction, Dis_info *info)
+static char *PRECEQU_PH_QBR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PRECEQU.PH.QBR %s, %s", rt, rs);
 }
@@ -11852,13 +11753,13 @@ static std::string PRECEQU_PH_QBR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBLA(uint64 instruction, Dis_info *info)
+static char *PRECEU_PH_QBLA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PRECEU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11875,13 +11776,13 @@ static std::string PRECEU_PH_QBLA(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBL(uint64 instruction, Dis_info *info)
+static char *PRECEU_PH_QBL(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PRECEU.PH.QBL %s, %s", rt, rs);
 }
@@ -11899,13 +11800,13 @@ static std::string PRECEU_PH_QBL(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBRA(uint64 instruction, Dis_info *info)
+static char *PRECEU_PH_QBRA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PRECEU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11922,13 +11823,13 @@ static std::string PRECEU_PH_QBRA(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBR(uint64 instruction, Dis_info *info)
+static char *PRECEU_PH_QBR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PRECEU.PH.QBR %s, %s", rt, rs);
 }
@@ -11945,15 +11846,15 @@ static std::string PRECEU_PH_QBR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECR_QB_PH(uint64 instruction, Dis_info *info)
+static char *PRECR_QB_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11970,15 +11871,15 @@ static std::string PRECR_QB_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECR_SRA_PH_W(uint64 instruction, Dis_info *info)
+static char *PRECR_SRA_PH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -11995,15 +11896,15 @@ static std::string PRECR_SRA_PH_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECR_SRA_R_PH_W(uint64 instruction, Dis_info *info)
+static char *PRECR_SRA_R_PH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -12020,15 +11921,15 @@ static std::string PRECR_SRA_R_PH_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQ_PH_W(uint64 instruction, Dis_info *info)
+static char *PRECRQ_PH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12045,15 +11946,15 @@ static std::string PRECRQ_PH_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQ_QB_PH(uint64 instruction, Dis_info *info)
+static char *PRECRQ_QB_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12070,15 +11971,15 @@ static std::string PRECRQ_QB_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQ_RS_PH_W(uint64 instruction, Dis_info *info)
+static char *PRECRQ_RS_PH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12095,15 +11996,15 @@ static std::string PRECRQ_RS_PH_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQU_S_QB_PH(uint64 instruction, Dis_info *info)
+static char *PRECRQU_S_QB_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12119,15 +12020,15 @@ static std::string PRECRQU_S_QB_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PREF_S9_(uint64 instruction, Dis_info *info)
+static char *PREF_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(hint_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *hint = IMMEDIATE(hint_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PREF %s, %s(%s)", hint, s, rs);
 }
@@ -12143,15 +12044,15 @@ static std::string PREF_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PREF_U12_(uint64 instruction, Dis_info *info)
+static char *PREF_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(hint_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    char *hint = IMMEDIATE(hint_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PREF %s, %s(%s)", hint, u, rs);
 }
@@ -12167,15 +12068,15 @@ static std::string PREF_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PREFE(uint64 instruction, Dis_info *info)
+static char *PREFE(uint64 instruction, Dis_info *info)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(hint_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *hint = IMMEDIATE(hint_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("PREFE %s, %s(%s)", hint, s, rs);
 }
@@ -12191,15 +12092,15 @@ static std::string PREFE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string PREPEND(uint64 instruction, Dis_info *info)
+static char *PREPEND(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("PREPEND %s, %s, %s", rt, rs, sa);
 }
@@ -12214,13 +12115,13 @@ static std::string PREPEND(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string RADDU_W_QB(uint64 instruction, Dis_info *info)
+static char *RADDU_W_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("RADDU.W.QB %s, %s", rt, rs);
 }
@@ -12235,13 +12136,13 @@ static std::string RADDU_W_QB(uint64 instruction, Dis_info *info)
  *     rt -----
  *        mask -------
  */
-static std::string RDDSP(uint64 instruction, Dis_info *info)
+static char *RDDSP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string mask = IMMEDIATE(mask_value);
+    const char *rt = GPR(rt_value);
+    char *mask = IMMEDIATE(mask_value);
 
     return img_format("RDDSP %s, %s", rt, mask);
 }
@@ -12257,15 +12158,15 @@ static std::string RDDSP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RDHWR(uint64 instruction, Dis_info *info)
+static char *RDHWR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string hs = CPR(hs_value);
-    std::string sel = IMMEDIATE(sel_value);
+    const char *rt = GPR(rt_value);
+    char *hs = CPR(hs_value);
+    char *sel = IMMEDIATE(sel_value);
 
     return img_format("RDHWR %s, %s, %s", rt, hs, sel);
 }
@@ -12281,13 +12182,13 @@ static std::string RDHWR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RDPGPR(uint64 instruction, Dis_info *info)
+static char *RDPGPR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("RDPGPR %s, %s", rt, rs);
 }
@@ -12303,13 +12204,13 @@ static std::string RDPGPR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RECIP_D(uint64 instruction, Dis_info *info)
+static char *RECIP_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("RECIP.D %s, %s", ft, fs);
 }
@@ -12325,13 +12226,13 @@ static std::string RECIP_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RECIP_S(uint64 instruction, Dis_info *info)
+static char *RECIP_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("RECIP.S %s, %s", ft, fs);
 }
@@ -12347,13 +12248,13 @@ static std::string RECIP_S(uint64 instruction, Dis_info *info)
  *     rt -----
  *           s ----------
  */
-static std::string REPL_PH(uint64 instruction, Dis_info *info)
+static char *REPL_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
 
     return img_format("REPL.PH %s, %s", rt, s);
 }
@@ -12369,13 +12270,13 @@ static std::string REPL_PH(uint64 instruction, Dis_info *info)
  *     rt -----
  *           u --------
  */
-static std::string REPL_QB(uint64 instruction, Dis_info *info)
+static char *REPL_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("REPL.QB %s, %s", rt, u);
 }
@@ -12391,13 +12292,13 @@ static std::string REPL_QB(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string REPLV_PH(uint64 instruction, Dis_info *info)
+static char *REPLV_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("REPLV.PH %s, %s", rt, rs);
 }
@@ -12412,13 +12313,13 @@ static std::string REPLV_PH(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string REPLV_QB(uint64 instruction, Dis_info *info)
+static char *REPLV_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("REPLV.QB %s, %s", rt, rs);
 }
@@ -12434,14 +12335,14 @@ static std::string REPLV_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RESTORE_32_(uint64 instruction, Dis_info *info)
+static char *RESTORE_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(u_value);
+    char *u = IMMEDIATE(u_value);
     return img_format("RESTORE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12457,13 +12358,13 @@ static std::string RESTORE_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RESTORE_JRC_16_(uint64 instruction, Dis_info *info)
+static char *RESTORE_JRC_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    std::string u = IMMEDIATE(u_value);
+    char *u = IMMEDIATE(u_value);
     return img_format("RESTORE.JRC %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
@@ -12479,14 +12380,14 @@ static std::string RESTORE_JRC_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RESTORE_JRC_32_(uint64 instruction, Dis_info *info)
+static char *RESTORE_JRC_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(u_value);
+    char *u = IMMEDIATE(u_value);
     return img_format("RESTORE.JRC %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12502,13 +12403,13 @@ static std::string RESTORE_JRC_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RESTOREF(uint64 instruction, Dis_info *info)
+static char *RESTOREF(uint64 instruction, Dis_info *info)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    std::string u = IMMEDIATE(u_value);
-    std::string count = IMMEDIATE(count_value);
+    char *u = IMMEDIATE(u_value);
+    char *count = IMMEDIATE(count_value);
 
     return img_format("RESTOREF %s, %s", u, count);
 }
@@ -12524,13 +12425,13 @@ static std::string RESTOREF(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RINT_D(uint64 instruction, Dis_info *info)
+static char *RINT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("RINT.D %s, %s", ft, fs);
 }
@@ -12546,13 +12447,13 @@ static std::string RINT_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RINT_S(uint64 instruction, Dis_info *info)
+static char *RINT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("RINT.S %s, %s", ft, fs);
 }
@@ -12568,15 +12469,15 @@ static std::string RINT_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ROTR(uint64 instruction, Dis_info *info)
+static char *ROTR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("ROTR %s, %s, %s", rt, rs, shift);
 }
@@ -12592,15 +12493,15 @@ static std::string ROTR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ROTRV(uint64 instruction, Dis_info *info)
+static char *ROTRV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("ROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -12616,7 +12517,7 @@ static std::string ROTRV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ROTX(uint64 instruction, Dis_info *info)
+static char *ROTX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12624,11 +12525,11 @@ static std::string ROTX(uint64 instruction, Dis_info *info)
     uint64 stripe_value = extract_stripe_6(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
-    std::string shiftx = IMMEDIATE(shiftx_value);
-    std::string stripe = IMMEDIATE(stripe_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
+    char *shiftx = IMMEDIATE(shiftx_value);
+    char *stripe = IMMEDIATE(stripe_value);
 
     return img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
@@ -12645,13 +12546,13 @@ static std::string ROTX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_L_D(uint64 instruction, Dis_info *info)
+static char *ROUND_L_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("ROUND.L.D %s, %s", ft, fs);
 }
@@ -12667,13 +12568,13 @@ static std::string ROUND_L_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_L_S(uint64 instruction, Dis_info *info)
+static char *ROUND_L_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("ROUND.L.S %s, %s", ft, fs);
 }
@@ -12689,13 +12590,13 @@ static std::string ROUND_L_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_W_D(uint64 instruction, Dis_info *info)
+static char *ROUND_W_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("ROUND.W.D %s, %s", ft, fs);
 }
@@ -12711,13 +12612,13 @@ static std::string ROUND_W_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_W_S(uint64 instruction, Dis_info *info)
+static char *ROUND_W_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("ROUND.W.S %s, %s", ft, fs);
 }
@@ -12733,13 +12634,13 @@ static std::string ROUND_W_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RSQRT_D(uint64 instruction, Dis_info *info)
+static char *RSQRT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("RSQRT.D %s, %s", ft, fs);
 }
@@ -12755,13 +12656,13 @@ static std::string RSQRT_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string RSQRT_S(uint64 instruction, Dis_info *info)
+static char *RSQRT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("RSQRT.S %s, %s", ft, fs);
 }
@@ -12777,13 +12678,13 @@ static std::string RSQRT_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SAVE_16_(uint64 instruction, Dis_info *info)
+static char *SAVE_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    std::string u = IMMEDIATE(u_value);
+    char *u = IMMEDIATE(u_value);
     return img_format("SAVE %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
@@ -12799,14 +12700,14 @@ static std::string SAVE_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SAVE_32_(uint64 instruction, Dis_info *info)
+static char *SAVE_32_(uint64 instruction, Dis_info *info)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(u_value);
+    char *u = IMMEDIATE(u_value);
     return img_format("SAVE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12822,13 +12723,13 @@ static std::string SAVE_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SAVEF(uint64 instruction, Dis_info *info)
+static char *SAVEF(uint64 instruction, Dis_info *info)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    std::string u = IMMEDIATE(u_value);
-    std::string count = IMMEDIATE(count_value);
+    char *u = IMMEDIATE(u_value);
+    char *count = IMMEDIATE(count_value);
 
     return img_format("SAVEF %s, %s", u, count);
 }
@@ -12844,15 +12745,15 @@ static std::string SAVEF(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SB_16_(uint64 instruction, Dis_info *info)
+static char *SB_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(u_value);
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    char *u = IMMEDIATE(u_value);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SB %s, %s(%s)", rtz3, u, rs3);
 }
@@ -12868,13 +12769,13 @@ static std::string SB_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SB_GP_(uint64 instruction, Dis_info *info)
+static char *SB_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SB %s, %s($%d)", rt, u, 28);
 }
@@ -12890,15 +12791,15 @@ static std::string SB_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SB_S9_(uint64 instruction, Dis_info *info)
+static char *SB_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SB %s, %s(%s)", rt, s, rs);
 }
@@ -12914,15 +12815,15 @@ static std::string SB_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SB_U12_(uint64 instruction, Dis_info *info)
+static char *SB_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SB %s, %s(%s)", rt, u, rs);
 }
@@ -12938,15 +12839,15 @@ static std::string SB_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SBE(uint64 instruction, Dis_info *info)
+static char *SBE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SBE %s, %s(%s)", rt, s, rs);
 }
@@ -12962,15 +12863,15 @@ static std::string SBE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SBX(uint64 instruction, Dis_info *info)
+static char *SBX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SBX %s, %s(%s)", rd, rs, rt);
 }
@@ -12986,15 +12887,15 @@ static std::string SBX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SC(uint64 instruction, Dis_info *info)
+static char *SC(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SC %s, %s(%s)", rt, s, rs);
 }
@@ -13010,15 +12911,15 @@ static std::string SC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SCD(uint64 instruction, Dis_info *info)
+static char *SCD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SCD %s, %s(%s)", rt, s, rs);
 }
@@ -13034,15 +12935,15 @@ static std::string SCD(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SCDP(uint64 instruction, Dis_info *info)
+static char *SCDP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ru = GPR(ru_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ru = GPR(ru_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SCDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13058,15 +12959,15 @@ static std::string SCDP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SCE(uint64 instruction, Dis_info *info)
+static char *SCE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SCE %s, %s(%s)", rt, s, rs);
 }
@@ -13082,15 +12983,15 @@ static std::string SCE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SCWP(uint64 instruction, Dis_info *info)
+static char *SCWP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ru = GPR(ru_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ru = GPR(ru_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SCWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13106,15 +13007,15 @@ static std::string SCWP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SCWPE(uint64 instruction, Dis_info *info)
+static char *SCWPE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string ru = GPR(ru_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *ru = GPR(ru_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SCWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -13130,13 +13031,13 @@ static std::string SCWPE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SD_GP_(uint64 instruction, Dis_info *info)
+static char *SD_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SD %s, %s($%d)", rt, u, 28);
 }
@@ -13152,15 +13053,15 @@ static std::string SD_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SD_S9_(uint64 instruction, Dis_info *info)
+static char *SD_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SD %s, %s(%s)", rt, s, rs);
 }
@@ -13176,15 +13077,15 @@ static std::string SD_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SD_U12_(uint64 instruction, Dis_info *info)
+static char *SD_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SD %s, %s(%s)", rt, u, rs);
 }
@@ -13200,11 +13101,11 @@ static std::string SD_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDBBP_16_(uint64 instruction, Dis_info *info)
+static char *SDBBP_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    std::string code = IMMEDIATE(code_value);
+    char *code = IMMEDIATE(code_value);
 
     return img_format("SDBBP %s", code);
 }
@@ -13220,11 +13121,11 @@ static std::string SDBBP_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDBBP_32_(uint64 instruction, Dis_info *info)
+static char *SDBBP_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(code_value);
+    char *code = IMMEDIATE(code_value);
 
     return img_format("SDBBP %s", code);
 }
@@ -13240,13 +13141,13 @@ static std::string SDBBP_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1_GP_(uint64 instruction, Dis_info *info)
+static char *SDC1_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *ft = FPR(ft_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -13262,15 +13163,15 @@ static std::string SDC1_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1_S9_(uint64 instruction, Dis_info *info)
+static char *SDC1_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *ft = FPR(ft_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -13286,15 +13187,15 @@ static std::string SDC1_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1_U12_(uint64 instruction, Dis_info *info)
+static char *SDC1_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *ft = FPR(ft_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -13310,15 +13211,15 @@ static std::string SDC1_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1X(uint64 instruction, Dis_info *info)
+static char *SDC1X(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ft = FPR(ft_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -13334,15 +13235,15 @@ static std::string SDC1X(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1XS(uint64 instruction, Dis_info *info)
+static char *SDC1XS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ft = FPR(ft_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -13358,15 +13259,15 @@ static std::string SDC1XS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDC2(uint64 instruction, Dis_info *info)
+static char *SDC2(uint64 instruction, Dis_info *info)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string cs = CPR(cs_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *cs = CPR(cs_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SDC2 %s, %s(%s)", cs, s, rs);
 }
@@ -13382,17 +13283,17 @@ static std::string SDC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDM(uint64 instruction, Dis_info *info)
+static char *SDM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -13408,13 +13309,13 @@ static std::string SDM(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDPC_48_(uint64 instruction, Dis_info *info)
+static char *SDPC_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 6, info);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 6, info);
 
     return img_format("SDPC %s, %s", rt, s);
 }
@@ -13430,15 +13331,15 @@ static std::string SDPC_48_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDXS(uint64 instruction, Dis_info *info)
+static char *SDXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -13454,15 +13355,15 @@ static std::string SDXS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SDX(uint64 instruction, Dis_info *info)
+static char *SDX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SDX %s, %s(%s)", rd, rs, rt);
 }
@@ -13478,13 +13379,13 @@ static std::string SDX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SEB(uint64 instruction, Dis_info *info)
+static char *SEB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SEB %s, %s", rt, rs);
 }
@@ -13500,13 +13401,13 @@ static std::string SEB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SEH(uint64 instruction, Dis_info *info)
+static char *SEH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SEH %s, %s", rt, rs);
 }
@@ -13522,15 +13423,15 @@ static std::string SEH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SEL_D(uint64 instruction, Dis_info *info)
+static char *SEL_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("SEL.D %s, %s, %s", fd, fs, ft);
 }
@@ -13546,15 +13447,15 @@ static std::string SEL_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SEL_S(uint64 instruction, Dis_info *info)
+static char *SEL_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("SEL.S %s, %s, %s", fd, fs, ft);
 }
@@ -13570,15 +13471,15 @@ static std::string SEL_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SELEQZ_D(uint64 instruction, Dis_info *info)
+static char *SELEQZ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("SELEQZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13594,15 +13495,15 @@ static std::string SELEQZ_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SELEQZ_S(uint64 instruction, Dis_info *info)
+static char *SELEQZ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("SELEQZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13618,15 +13519,15 @@ static std::string SELEQZ_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SELNEZ_D(uint64 instruction, Dis_info *info)
+static char *SELNEZ_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("SELNEZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13642,15 +13543,15 @@ static std::string SELNEZ_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SELNEZ_S(uint64 instruction, Dis_info *info)
+static char *SELNEZ_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("SELNEZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13666,15 +13567,15 @@ static std::string SELNEZ_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SEQI(uint64 instruction, Dis_info *info)
+static char *SEQI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SEQI %s, %s, %s", rt, rs, u);
 }
@@ -13690,15 +13591,15 @@ static std::string SEQI(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SH_16_(uint64 instruction, Dis_info *info)
+static char *SH_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(u_value);
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    char *u = IMMEDIATE(u_value);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SH %s, %s(%s)", rtz3, u, rs3);
 }
@@ -13714,13 +13615,13 @@ static std::string SH_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SH_GP_(uint64 instruction, Dis_info *info)
+static char *SH_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SH %s, %s($%d)", rt, u, 28);
 }
@@ -13736,15 +13637,15 @@ static std::string SH_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SH_S9_(uint64 instruction, Dis_info *info)
+static char *SH_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SH %s, %s(%s)", rt, s, rs);
 }
@@ -13760,15 +13661,15 @@ static std::string SH_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SH_U12_(uint64 instruction, Dis_info *info)
+static char *SH_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SH %s, %s(%s)", rt, u, rs);
 }
@@ -13784,15 +13685,15 @@ static std::string SH_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHE(uint64 instruction, Dis_info *info)
+static char *SHE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHE %s, %s(%s)", rt, s, rs);
 }
@@ -13808,13 +13709,13 @@ static std::string SHE(uint64 instruction, Dis_info *info)
  *      shift ------
  *               ac --
  */
-static std::string SHILO(uint64 instruction, Dis_info *info)
+static char *SHILO(uint64 instruction, Dis_info *info)
 {
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string shift = IMMEDIATE(shift_value);
-    std::string ac = AC(ac_value);
+    char *shift = IMMEDIATE(shift_value);
+    const char *ac = AC(ac_value);
 
     return img_format("SHILO %s, %s", ac, shift);
 }
@@ -13830,13 +13731,13 @@ static std::string SHILO(uint64 instruction, Dis_info *info)
  *          rs -----
  *               ac --
  */
-static std::string SHILOV(uint64 instruction, Dis_info *info)
+static char *SHILOV(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string ac = AC(ac_value);
+    const char *rs = GPR(rs_value);
+    const char *ac = AC(ac_value);
 
     return img_format("SHILOV %s, %s", ac, rs);
 }
@@ -13852,15 +13753,15 @@ static std::string SHILOV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               sa ----
  */
-static std::string SHLL_PH(uint64 instruction, Dis_info *info)
+static char *SHLL_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13876,15 +13777,15 @@ static std::string SHLL_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               sa ---
  */
-static std::string SHLL_QB(uint64 instruction, Dis_info *info)
+static char *SHLL_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -13901,15 +13802,15 @@ static std::string SHLL_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               sa ----
  */
-static std::string SHLL_S_PH(uint64 instruction, Dis_info *info)
+static char *SHLL_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13925,15 +13826,15 @@ static std::string SHLL_S_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               sa -----
  */
-static std::string SHLL_S_W(uint64 instruction, Dis_info *info)
+static char *SHLL_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
 }
@@ -13950,15 +13851,15 @@ static std::string SHLL_S_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_PH(uint64 instruction, Dis_info *info)
+static char *SHLLV_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHLLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -13974,15 +13875,15 @@ static std::string SHLLV_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_QB(uint64 instruction, Dis_info *info)
+static char *SHLLV_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHLLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -13999,15 +13900,15 @@ static std::string SHLLV_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_S_PH(uint64 instruction, Dis_info *info)
+static char *SHLLV_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14023,15 +13924,15 @@ static std::string SHLLV_S_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_S_W(uint64 instruction, Dis_info *info)
+static char *SHLLV_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
 }
@@ -14047,15 +13948,15 @@ static std::string SHLLV_S_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_PH(uint64 instruction, Dis_info *info)
+static char *SHRA_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14071,15 +13972,15 @@ static std::string SHRA_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_QB(uint64 instruction, Dis_info *info)
+static char *SHRA_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14095,15 +13996,15 @@ static std::string SHRA_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_R_PH(uint64 instruction, Dis_info *info)
+static char *SHRA_R_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14119,15 +14020,15 @@ static std::string SHRA_R_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_R_QB(uint64 instruction, Dis_info *info)
+static char *SHRA_R_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14143,15 +14044,15 @@ static std::string SHRA_R_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_R_W(uint64 instruction, Dis_info *info)
+static char *SHRA_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
 }
@@ -14167,15 +14068,15 @@ static std::string SHRA_R_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_PH(uint64 instruction, Dis_info *info)
+static char *SHRAV_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHRAV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14191,15 +14092,15 @@ static std::string SHRAV_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_QB(uint64 instruction, Dis_info *info)
+static char *SHRAV_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHRAV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14215,15 +14116,15 @@ static std::string SHRAV_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_R_PH(uint64 instruction, Dis_info *info)
+static char *SHRAV_R_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14239,15 +14140,15 @@ static std::string SHRAV_R_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_R_QB(uint64 instruction, Dis_info *info)
+static char *SHRAV_R_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14263,15 +14164,15 @@ static std::string SHRAV_R_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_R_W(uint64 instruction, Dis_info *info)
+static char *SHRAV_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
 }
@@ -14287,15 +14188,15 @@ static std::string SHRAV_R_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               sa ----
  */
-static std::string SHRL_PH(uint64 instruction, Dis_info *info)
+static char *SHRL_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14311,15 +14212,15 @@ static std::string SHRL_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               sa ---
  */
-static std::string SHRL_QB(uint64 instruction, Dis_info *info)
+static char *SHRL_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string sa = IMMEDIATE(sa_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *sa = IMMEDIATE(sa_value);
 
     return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14336,15 +14237,15 @@ static std::string SHRL_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRLV_PH(uint64 instruction, Dis_info *info)
+static char *SHRLV_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHRLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14360,15 +14261,15 @@ static std::string SHRLV_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHRLV_QB(uint64 instruction, Dis_info *info)
+static char *SHRLV_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rd = GPR(rd_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SHRLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14384,15 +14285,15 @@ static std::string SHRLV_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHX(uint64 instruction, Dis_info *info)
+static char *SHX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SHX %s, %s(%s)", rd, rs, rt);
 }
@@ -14408,15 +14309,15 @@ static std::string SHX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SHXS(uint64 instruction, Dis_info *info)
+static char *SHXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -14432,11 +14333,11 @@ static std::string SHXS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SIGRIE(uint64 instruction, Dis_info *info)
+static char *SIGRIE(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(code_value);
+    char *code = IMMEDIATE(code_value);
 
     return img_format("SIGRIE %s", code);
 }
@@ -14452,15 +14353,15 @@ static std::string SIGRIE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SLL_16_(uint64 instruction, Dis_info *info)
+static char *SLL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
     return img_format("SLL %s, %s, %s", rt3, rs3, shift3);
 }
@@ -14476,15 +14377,15 @@ static std::string SLL_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SLL_32_(uint64 instruction, Dis_info *info)
+static char *SLL_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("SLL %s, %s, %s", rt, rs, shift);
 }
@@ -14500,15 +14401,15 @@ static std::string SLL_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SLLV(uint64 instruction, Dis_info *info)
+static char *SLLV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SLLV %s, %s, %s", rd, rs, rt);
 }
@@ -14524,15 +14425,15 @@ static std::string SLLV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SLT(uint64 instruction, Dis_info *info)
+static char *SLT(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SLT %s, %s, %s", rd, rs, rt);
 }
@@ -14548,15 +14449,15 @@ static std::string SLT(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SLTI(uint64 instruction, Dis_info *info)
+static char *SLTI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SLTI %s, %s, %s", rt, rs, u);
 }
@@ -14572,15 +14473,15 @@ static std::string SLTI(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SLTIU(uint64 instruction, Dis_info *info)
+static char *SLTIU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SLTIU %s, %s, %s", rt, rs, u);
 }
@@ -14596,15 +14497,15 @@ static std::string SLTIU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SLTU(uint64 instruction, Dis_info *info)
+static char *SLTU(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SLTU %s, %s, %s", rd, rs, rt);
 }
@@ -14620,15 +14521,15 @@ static std::string SLTU(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SOV(uint64 instruction, Dis_info *info)
+static char *SOV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SOV %s, %s, %s", rd, rs, rt);
 }
@@ -14644,11 +14545,11 @@ static std::string SOV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SPECIAL2(uint64 instruction, Dis_info *info)
+static char *SPECIAL2(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    std::string op = IMMEDIATE(op_value);
+    char *op = IMMEDIATE(op_value);
 
     return img_format("SPECIAL2 %s", op);
 }
@@ -14664,13 +14565,13 @@ static std::string SPECIAL2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SQRT_D(uint64 instruction, Dis_info *info)
+static char *SQRT_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("SQRT.D %s, %s", ft, fs);
 }
@@ -14686,13 +14587,13 @@ static std::string SQRT_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SQRT_S(uint64 instruction, Dis_info *info)
+static char *SQRT_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("SQRT.S %s, %s", ft, fs);
 }
@@ -14708,15 +14609,15 @@ static std::string SQRT_S(uint64 instruction, Dis_info *info)
  *               rd -----
  *                    sa -----
  */
-static std::string SRA(uint64 instruction, Dis_info *info)
+static char *SRA(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("SRA %s, %s, %s", rt, rs, shift);
 }
@@ -14732,15 +14633,15 @@ static std::string SRA(uint64 instruction, Dis_info *info)
  *          rt -----
  *               rd -----
  */
-static std::string SRAV(uint64 instruction, Dis_info *info)
+static char *SRAV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SRAV %s, %s, %s", rd, rs, rt);
 }
@@ -14756,15 +14657,15 @@ static std::string SRAV(uint64 instruction, Dis_info *info)
  *          rt -----
  *               rd -----
  */
-static std::string SRL_16_(uint64 instruction, Dis_info *info)
+static char *SRL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
     return img_format("SRL %s, %s, %s", rt3, rs3, shift3);
 }
@@ -14780,15 +14681,15 @@ static std::string SRL_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SRL_32_(uint64 instruction, Dis_info *info)
+static char *SRL_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string shift = IMMEDIATE(shift_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *shift = IMMEDIATE(shift_value);
 
     return img_format("SRL %s, %s, %s", rt, rs, shift);
 }
@@ -14804,15 +14705,15 @@ static std::string SRL_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SRLV(uint64 instruction, Dis_info *info)
+static char *SRLV(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SRLV %s, %s, %s", rd, rs, rt);
 }
@@ -14828,15 +14729,15 @@ static std::string SRLV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUB(uint64 instruction, Dis_info *info)
+static char *SUB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUB %s, %s, %s", rd, rs, rt);
 }
@@ -14852,15 +14753,15 @@ static std::string SUB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUB_D(uint64 instruction, Dis_info *info)
+static char *SUB_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("SUB.D %s, %s, %s", fd, fs, ft);
 }
@@ -14876,15 +14777,15 @@ static std::string SUB_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUB_S(uint64 instruction, Dis_info *info)
+static char *SUB_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(fd_value);
-    std::string fs = FPR(fs_value);
-    std::string ft = FPR(ft_value);
+    const char *fd = FPR(fd_value);
+    const char *fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
 
     return img_format("SUB.S %s, %s, %s", fd, fs, ft);
 }
@@ -14900,15 +14801,15 @@ static std::string SUB_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQ_PH(uint64 instruction, Dis_info *info)
+static char *SUBQ_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14925,15 +14826,15 @@ static std::string SUBQ_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQ_S_PH(uint64 instruction, Dis_info *info)
+static char *SUBQ_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14950,15 +14851,15 @@ static std::string SUBQ_S_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQ_S_W(uint64 instruction, Dis_info *info)
+static char *SUBQ_S_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -14975,15 +14876,15 @@ static std::string SUBQ_S_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_PH(uint64 instruction, Dis_info *info)
+static char *SUBQH_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15000,15 +14901,15 @@ static std::string SUBQH_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_R_PH(uint64 instruction, Dis_info *info)
+static char *SUBQH_R_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15025,15 +14926,15 @@ static std::string SUBQH_R_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_R_W(uint64 instruction, Dis_info *info)
+static char *SUBQH_R_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -15050,15 +14951,15 @@ static std::string SUBQH_R_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_W(uint64 instruction, Dis_info *info)
+static char *SUBQH_W(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -15074,15 +14975,15 @@ static std::string SUBQH_W(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_16_(uint64 instruction, Dis_info *info)
+static char *SUBU_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
     return img_format("SUBU %s, %s, %s", rd3, rs3, rt3);
 }
@@ -15098,15 +14999,15 @@ static std::string SUBU_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_32_(uint64 instruction, Dis_info *info)
+static char *SUBU_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBU %s, %s, %s", rd, rs, rt);
 }
@@ -15122,15 +15023,15 @@ static std::string SUBU_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_PH(uint64 instruction, Dis_info *info)
+static char *SUBU_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15146,15 +15047,15 @@ static std::string SUBU_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_QB(uint64 instruction, Dis_info *info)
+static char *SUBU_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15171,15 +15072,15 @@ static std::string SUBU_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_S_PH(uint64 instruction, Dis_info *info)
+static char *SUBU_S_PH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15196,15 +15097,15 @@ static std::string SUBU_S_PH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_S_QB(uint64 instruction, Dis_info *info)
+static char *SUBU_S_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15221,15 +15122,15 @@ static std::string SUBU_S_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBUH_QB(uint64 instruction, Dis_info *info)
+static char *SUBUH_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15246,15 +15147,15 @@ static std::string SUBUH_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SUBUH_R_QB(uint64 instruction, Dis_info *info)
+static char *SUBUH_R_QB(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15270,15 +15171,15 @@ static std::string SUBUH_R_QB(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SW_16_(uint64 instruction, Dis_info *info)
+static char *SW_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(u_value);
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    char *u = IMMEDIATE(u_value);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SW %s, %s(%s)", rtz3, u, rs3);
 }
@@ -15294,15 +15195,15 @@ static std::string SW_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SW_4X4_(uint64 instruction, Dis_info *info)
+static char *SW_4X4_(uint64 instruction, Dis_info *info)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string u = IMMEDIATE(u_value);
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    char *u = IMMEDIATE(u_value);
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("SW %s, %s(%s)", rtz4, u, rs4);
 }
@@ -15318,13 +15219,13 @@ static std::string SW_4X4_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SW_GP16_(uint64 instruction, Dis_info *info)
+static char *SW_GP16_(uint64 instruction, Dis_info *info)
 {
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(u_value);
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SW %s, %s($%d)", rtz3, u, 28);
 }
@@ -15340,13 +15241,13 @@ static std::string SW_GP16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SW_GP_(uint64 instruction, Dis_info *info)
+static char *SW_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SW %s, %s($%d)", rt, u, 28);
 }
@@ -15362,15 +15263,15 @@ static std::string SW_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SW_S9_(uint64 instruction, Dis_info *info)
+static char *SW_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SW %s, %s(%s)", rt, s, rs);
 }
@@ -15386,13 +15287,13 @@ static std::string SW_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SW_SP_(uint64 instruction, Dis_info *info)
+static char *SW_SP_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SW %s, %s($%d)", rt, u, 29);
 }
@@ -15408,15 +15309,15 @@ static std::string SW_SP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SW_U12_(uint64 instruction, Dis_info *info)
+static char *SW_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SW %s, %s(%s)", rt, u, rs);
 }
@@ -15432,13 +15333,13 @@ static std::string SW_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1_GP_(uint64 instruction, Dis_info *info)
+static char *SWC1_GP_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *ft = FPR(ft_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("SWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -15454,15 +15355,15 @@ static std::string SWC1_GP_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1_S9_(uint64 instruction, Dis_info *info)
+static char *SWC1_S9_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *ft = FPR(ft_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -15478,15 +15379,15 @@ static std::string SWC1_S9_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1_U12_(uint64 instruction, Dis_info *info)
+static char *SWC1_U12_(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string u = IMMEDIATE(u_value);
-    std::string rs = GPR(rs_value);
+    const char *ft = FPR(ft_value);
+    char *u = IMMEDIATE(u_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -15502,15 +15403,15 @@ static std::string SWC1_U12_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1X(uint64 instruction, Dis_info *info)
+static char *SWC1X(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ft = FPR(ft_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -15526,15 +15427,15 @@ static std::string SWC1X(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1XS(uint64 instruction, Dis_info *info)
+static char *SWC1XS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *ft = FPR(ft_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -15550,15 +15451,15 @@ static std::string SWC1XS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWC2(uint64 instruction, Dis_info *info)
+static char *SWC2(uint64 instruction, Dis_info *info)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string cs = CPR(cs_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *cs = CPR(cs_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SWC2 %s, %s(%s)", cs, s, rs);
 }
@@ -15574,15 +15475,15 @@ static std::string SWC2(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWE(uint64 instruction, Dis_info *info)
+static char *SWE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SWE %s, %s(%s)", rt, s, rs);
 }
@@ -15598,17 +15499,17 @@ static std::string SWE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWM(uint64 instruction, Dis_info *info)
+static char *SWM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -15624,13 +15525,13 @@ static std::string SWM(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWPC_48_(uint64 instruction, Dis_info *info)
+static char *SWPC_48_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = ADDRESS(s_value, 6, info);
+    const char *rt = GPR(rt_value);
+    char *s = ADDRESS(s_value, 6, info);
 
     return img_format("SWPC %s, %s", rt, s);
 }
@@ -15646,15 +15547,15 @@ static std::string SWPC_48_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWX(uint64 instruction, Dis_info *info)
+static char *SWX(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SWX %s, %s(%s)", rd, rs, rt);
 }
@@ -15670,15 +15571,15 @@ static std::string SWX(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SWXS(uint64 instruction, Dis_info *info)
+static char *SWXS(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("SWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -15694,11 +15595,11 @@ static std::string SWXS(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SYNC(uint64 instruction, Dis_info *info)
+static char *SYNC(uint64 instruction, Dis_info *info)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
-    std::string stype = IMMEDIATE(stype_value);
+    char *stype = IMMEDIATE(stype_value);
 
     return img_format("SYNC %s", stype);
 }
@@ -15714,13 +15615,13 @@ static std::string SYNC(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SYNCI(uint64 instruction, Dis_info *info)
+static char *SYNCI(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SYNCI %s(%s)", s, rs);
 }
@@ -15736,13 +15637,13 @@ static std::string SYNCI(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SYNCIE(uint64 instruction, Dis_info *info)
+static char *SYNCIE(uint64 instruction, Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("SYNCIE %s(%s)", s, rs);
 }
@@ -15758,11 +15659,11 @@ static std::string SYNCIE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string SYSCALL_16_(uint64 instruction, Dis_info *info)
+static char *SYSCALL_16_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    std::string code = IMMEDIATE(code_value);
+    char *code = IMMEDIATE(code_value);
 
     return img_format("SYSCALL %s", code);
 }
@@ -15776,11 +15677,11 @@ static std::string SYSCALL_16_(uint64 instruction, Dis_info *info)
  *  00000000000010
  *           code ------------------
  */
-static std::string SYSCALL_32_(uint64 instruction, Dis_info *info)
+static char *SYSCALL_32_(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    std::string code = IMMEDIATE(code_value);
+    char *code = IMMEDIATE(code_value);
 
     return img_format("SYSCALL %s", code);
 }
@@ -15796,13 +15697,13 @@ static std::string SYSCALL_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TEQ(uint64 instruction, Dis_info *info)
+static char *TEQ(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("TEQ %s, %s", rs, rt);
 }
@@ -15818,11 +15719,11 @@ static std::string TEQ(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGINV(uint64 instruction, Dis_info *info)
+static char *TLBGINV(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBGINV ";
+    return g_strdup("TLBGINV ");
 }
 
 
@@ -15836,11 +15737,11 @@ static std::string TLBGINV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGINVF(uint64 instruction, Dis_info *info)
+static char *TLBGINVF(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBGINVF ";
+    return g_strdup("TLBGINVF ");
 }
 
 
@@ -15854,11 +15755,11 @@ static std::string TLBGINVF(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGP(uint64 instruction, Dis_info *info)
+static char *TLBGP(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBGP ";
+    return g_strdup("TLBGP ");
 }
 
 
@@ -15872,11 +15773,11 @@ static std::string TLBGP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGR(uint64 instruction, Dis_info *info)
+static char *TLBGR(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBGR ";
+    return g_strdup("TLBGR ");
 }
 
 
@@ -15890,11 +15791,11 @@ static std::string TLBGR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGWI(uint64 instruction, Dis_info *info)
+static char *TLBGWI(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBGWI ";
+    return g_strdup("TLBGWI ");
 }
 
 
@@ -15908,11 +15809,11 @@ static std::string TLBGWI(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGWR(uint64 instruction, Dis_info *info)
+static char *TLBGWR(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBGWR ";
+    return g_strdup("TLBGWR ");
 }
 
 
@@ -15926,11 +15827,11 @@ static std::string TLBGWR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBINV(uint64 instruction, Dis_info *info)
+static char *TLBINV(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBINV ";
+    return g_strdup("TLBINV ");
 }
 
 
@@ -15944,11 +15845,11 @@ static std::string TLBINV(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBINVF(uint64 instruction, Dis_info *info)
+static char *TLBINVF(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBINVF ";
+    return g_strdup("TLBINVF ");
 }
 
 
@@ -15962,11 +15863,11 @@ static std::string TLBINVF(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBP(uint64 instruction, Dis_info *info)
+static char *TLBP(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBP ";
+    return g_strdup("TLBP ");
 }
 
 
@@ -15980,11 +15881,11 @@ static std::string TLBP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBR(uint64 instruction, Dis_info *info)
+static char *TLBR(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBR ";
+    return g_strdup("TLBR ");
 }
 
 
@@ -15998,11 +15899,11 @@ static std::string TLBR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBWI(uint64 instruction, Dis_info *info)
+static char *TLBWI(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBWI ";
+    return g_strdup("TLBWI ");
 }
 
 
@@ -16016,11 +15917,11 @@ static std::string TLBWI(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TLBWR(uint64 instruction, Dis_info *info)
+static char *TLBWR(uint64 instruction, Dis_info *info)
 {
     (void)instruction;
 
-    return "TLBWR ";
+    return g_strdup("TLBWR ");
 }
 
 
@@ -16034,13 +15935,13 @@ static std::string TLBWR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TNE(uint64 instruction, Dis_info *info)
+static char *TNE(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("TNE %s, %s", rs, rt);
 }
@@ -16056,13 +15957,13 @@ static std::string TNE(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_L_D(uint64 instruction, Dis_info *info)
+static char *TRUNC_L_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("TRUNC.L.D %s, %s", ft, fs);
 }
@@ -16078,13 +15979,13 @@ static std::string TRUNC_L_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_L_S(uint64 instruction, Dis_info *info)
+static char *TRUNC_L_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("TRUNC.L.S %s, %s", ft, fs);
 }
@@ -16100,13 +16001,13 @@ static std::string TRUNC_L_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_W_D(uint64 instruction, Dis_info *info)
+static char *TRUNC_W_D(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("TRUNC.W.D %s, %s", ft, fs);
 }
@@ -16122,13 +16023,13 @@ static std::string TRUNC_W_D(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_W_S(uint64 instruction, Dis_info *info)
+static char *TRUNC_W_S(uint64 instruction, Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(ft_value);
-    std::string fs = FPR(fs_value);
+    const char *ft = FPR(ft_value);
+    const char *fs = FPR(fs_value);
 
     return img_format("TRUNC.W.S %s, %s", ft, fs);
 }
@@ -16144,17 +16045,17 @@ static std::string TRUNC_W_S(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string UALDM(uint64 instruction, Dis_info *info)
+static char *UALDM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16170,15 +16071,15 @@ static std::string UALDM(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string UALH(uint64 instruction, Dis_info *info)
+static char *UALH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("UALH %s, %s(%s)", rt, s, rs);
 }
@@ -16194,17 +16095,17 @@ static std::string UALH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string UALWM(uint64 instruction, Dis_info *info)
+static char *UALWM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16220,17 +16121,17 @@ static std::string UALWM(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string UASDM(uint64 instruction, Dis_info *info)
+static char *UASDM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16246,15 +16147,15 @@ static std::string UASDM(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string UASH(uint64 instruction, Dis_info *info)
+static char *UASH(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("UASH %s, %s(%s)", rt, s, rs);
 }
@@ -16270,17 +16171,17 @@ static std::string UASH(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string UASWM(uint64 instruction, Dis_info *info)
+static char *UASWM(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string s = IMMEDIATE(s_value);
-    std::string rs = GPR(rs_value);
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(rt_value);
+    char *s = IMMEDIATE(s_value);
+    const char *rs = GPR(rs_value);
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16296,11 +16197,11 @@ static std::string UASWM(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string UDI(uint64 instruction, Dis_info *info)
+static char *UDI(uint64 instruction, Dis_info *info)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    std::string op = IMMEDIATE(op_value);
+    char *op = IMMEDIATE(op_value);
 
     return img_format("UDI %s", op);
 }
@@ -16314,11 +16215,11 @@ static std::string UDI(uint64 instruction, Dis_info *info)
  *  001000          1100001101111111
  *   code ----------
  */
-static std::string WAIT(uint64 instruction, Dis_info *info)
+static char *WAIT(uint64 instruction, Dis_info *info)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
-    std::string code = IMMEDIATE(code_value);
+    char *code = IMMEDIATE(code_value);
 
     return img_format("WAIT %s", code);
 }
@@ -16334,13 +16235,13 @@ static std::string WAIT(uint64 instruction, Dis_info *info)
  *     rt -----
  *        mask -------
  */
-static std::string WRDSP(uint64 instruction, Dis_info *info)
+static char *WRDSP(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string mask = IMMEDIATE(mask_value);
+    const char *rt = GPR(rt_value);
+    char *mask = IMMEDIATE(mask_value);
 
     return img_format("WRDSP %s, %s", rt, mask);
 }
@@ -16356,13 +16257,13 @@ static std::string WRDSP(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string WRPGPR(uint64 instruction, Dis_info *info)
+static char *WRPGPR(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("WRPGPR %s, %s", rt, rs);
 }
@@ -16378,13 +16279,13 @@ static std::string WRPGPR(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string XOR_16_(uint64 instruction, Dis_info *info)
+static char *XOR_16_(uint64 instruction, Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
     return img_format("XOR %s, %s", rs3, rt3);
 }
@@ -16400,15 +16301,15 @@ static std::string XOR_16_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string XOR_32_(uint64 instruction, Dis_info *info)
+static char *XOR_32_(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(rd_value);
-    std::string rs = GPR(rs_value);
-    std::string rt = GPR(rt_value);
+    const char *rd = GPR(rd_value);
+    const char *rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
 
     return img_format("XOR %s, %s, %s", rd, rs, rt);
 }
@@ -16424,15 +16325,15 @@ static std::string XOR_32_(uint64 instruction, Dis_info *info)
  *          rs -----
  *               rd -----
  */
-static std::string XORI(uint64 instruction, Dis_info *info)
+static char *XORI(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
-    std::string u = IMMEDIATE(u_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
+    char *u = IMMEDIATE(u_value);
 
     return img_format("XORI %s, %s, %s", rt, rs, u);
 }
@@ -16447,13 +16348,13 @@ static std::string XORI(uint64 instruction, Dis_info *info)
  *     rt -----
  *          rs -----
  */
-static std::string YIELD(uint64 instruction, Dis_info *info)
+static char *YIELD(uint64 instruction, Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(rt_value);
-    std::string rs = GPR(rs_value);
+    const char *rt = GPR(rt_value);
+    const char *rs = GPR(rs_value);
 
     return img_format("YIELD %s, %s", rt, rs);
 }
@@ -22256,25 +22157,22 @@ static const Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static int Disassemble(const uint16 *data, std::string & dis,
+static int Disassemble(const uint16 *data, char **dis,
                        TABLE_ENTRY_TYPE & type, Dis_info *info)
 {
     return Disassemble(data, dis, type, MAJOR, 2, info);
 }
 
-static int nanomips_dis(char *buf,
+static int nanomips_dis(char **buf,
                  Dis_info *info,
                  unsigned short one,
                  unsigned short two,
                  unsigned short three)
 {
-    std::string disasm;
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    int size = Disassemble(bits, disasm, type, info);
-
-    strcpy(buf, disasm.c_str());
+    int size = Disassemble(bits, buf, type, info);
     return size;
 }
 
@@ -22283,7 +22181,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     int status;
     bfd_byte buffer[2];
     uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
-    char buf[200];
+    char *buf = NULL;
 
     info->bytes_per_chunk = 2;
     info->display_endian = info->endian;
@@ -22345,7 +22243,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         (*info->fprintf_func)(info->stream, "     ");
     }
 
-    int length = nanomips_dis(buf, &disassm_info, insn1, insn2, insn3);
+    int length = nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3);
 
     /* FIXME: Should probably use a hash table on the major opcode here.  */
 
-- 
2.37.3


