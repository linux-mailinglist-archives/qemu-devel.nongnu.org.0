Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A860612D77
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:35:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGpv-0006NM-5o; Sun, 30 Oct 2022 18:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpt-0006KQ-VU
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:21 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpr-0008BD-St
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o4so13670761wrq.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ITJ3L4PwJ5ZsTmRJYtpX31PZ6QQa3WN9qI3FxP4ohSo=;
 b=yqfyFZw/G/u5t1W4Q9dJIxiXyw23pQmFELyTrblG33sL5gdUBbBz5PPgmLOYLHZrDU
 SbxOdRIU4W05TFprolos+ylto2tKHoB2TasoVOWQCLVFFReq+GGST3nHHJ2J1TvbQysm
 hKYdunYj0+zMhlFTM5ZJtJhaUhOGVR6IilSdSijeAGWGGfEUm6E1jdUI4yCB77rlMvzn
 Jc+jHQY35WxCkKw0rzGUG5dMpg+RfVdUOfIVrb2tIjwPEqNvYoeFzs21lU0CD6/DsWDy
 5xS99/FLinl4PMPUJ7dE7fXVbQtQID7grGZINU9WRFnza0siv8O40tSKW88gQT4p9qZ5
 IpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ITJ3L4PwJ5ZsTmRJYtpX31PZ6QQa3WN9qI3FxP4ohSo=;
 b=0AyMrtL6XAJPtl0qYuRKZwiqjw33nUn0/MgM3Wx4k9twPT0YE7xNlKzhoYE03FNc0X
 VdggnV3ltd2g+3GIiHhthDLJH614xV7YsPK7FyP48v2WLptPcY3gAx4MWMT2hm7k6giK
 LaRuhFyFWn/R9h7bBIQUaQFvWKqaq/32PG52QNbsS9ZASLHEY7j5BAPYPAPeEvuYNS6B
 qDd2M+jBwMj8XBbdgHy3WyhcRl9YwcwDd7wsryncgKV5zxfyD7CmW0T3VA19WhqZw2Aa
 dr7xYScErKkLAy8HDRTJB3DQGrmGDuS559jvemEeedeaLXYRhJTL5yG53PKI+CQ60xRu
 uhqQ==
X-Gm-Message-State: ACrzQf0JGAohqJJdJRqKF5KIfbVswg0MWDgS6CBGw0hzwoWx625AizcX
 fG8jupFKO4lRma2ptmYLYnZ0RkAQpOehgQ==
X-Google-Smtp-Source: AMsMyM41eEo7B2tHom/2F8BtSdvSfT+DRcBQEywazH/rC+04T6fY8GOGuwkKq0b3YRrBCBUKtLUyIw==
X-Received: by 2002:a5d:4604:0:b0:236:cfce:879d with SMTP id
 t4-20020a5d4604000000b00236cfce879dmr359677wrq.152.1667169078265; 
 Sun, 30 Oct 2022 15:31:18 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bv5-20020a0560001f0500b0022ac38fb20asm5211947wrb.111.2022.10.30.15.31.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:31:17 -0700 (PDT)
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
Subject: [PULL 23/55] disas/nanomips: Remove NMD class
Date: Sun, 30 Oct 2022 23:28:09 +0100
Message-Id: <20221030222841.42377-24-philmd@linaro.org>
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

NMD class has been deleted. The following methods are now declared as
static functions:
- public NMD::Disassemble method
- private NMD::Disassemble method
- private NMD::extract_op_code_value helper method

Also, the implementation of the print_insn_nanomips function and
nanomips_dis function is moved to the end of the nanomips.cpp file,
right after the implementation of the Disassemble function.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-10-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 204 ++++++++++++++++++++++-----------------------
 disas/nanomips.h   |  15 ----
 2 files changed, 101 insertions(+), 118 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index a73eae5b33..0d67462e5d 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -41,105 +41,6 @@
 #define IMGASSERTONCE(test)
 
 
-static int nanomips_dis(char *buf,
-                 Dis_info *info,
-                 unsigned short one,
-                 unsigned short two,
-                 unsigned short three)
-{
-    std::string disasm;
-    uint16 bits[3] = {one, two, three};
-
-    TABLE_ENTRY_TYPE type;
-    NMD d;
-    int size = d.Disassemble(bits, disasm, type, info);
-
-    strcpy(buf, disasm.c_str());
-    return size;
-}
-
-int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
-{
-    int status;
-    bfd_byte buffer[2];
-    uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
-    char buf[200];
-
-    info->bytes_per_chunk = 2;
-    info->display_endian = info->endian;
-    info->insn_info_valid = 1;
-    info->branch_delay_insns = 0;
-    info->data_size = 0;
-    info->insn_type = dis_nonbranch;
-    info->target = 0;
-    info->target2 = 0;
-
-    Dis_info disassm_info;
-    disassm_info.m_pc = memaddr;
-
-    status = (*info->read_memory_func)(memaddr, buffer, 2, info);
-    if (status != 0) {
-        (*info->memory_error_func)(status, memaddr, info);
-        return -1;
-    }
-
-    if (info->endian == BFD_ENDIAN_BIG) {
-        insn1 = bfd_getb16(buffer);
-    } else {
-        insn1 = bfd_getl16(buffer);
-    }
-    (*info->fprintf_func)(info->stream, "%04x ", insn1);
-
-    /* Handle 32-bit opcodes.  */
-    if ((insn1 & 0x1000) == 0) {
-        status = (*info->read_memory_func)(memaddr + 2, buffer, 2, info);
-        if (status != 0) {
-            (*info->memory_error_func)(status, memaddr + 2, info);
-            return -1;
-        }
-
-        if (info->endian == BFD_ENDIAN_BIG) {
-            insn2 = bfd_getb16(buffer);
-        } else {
-            insn2 = bfd_getl16(buffer);
-        }
-        (*info->fprintf_func)(info->stream, "%04x ", insn2);
-    } else {
-        (*info->fprintf_func)(info->stream, "     ");
-    }
-    /* Handle 48-bit opcodes.  */
-    if ((insn1 >> 10) == 0x18) {
-        status = (*info->read_memory_func)(memaddr + 4, buffer, 2, info);
-        if (status != 0) {
-            (*info->memory_error_func)(status, memaddr + 4, info);
-            return -1;
-        }
-
-        if (info->endian == BFD_ENDIAN_BIG) {
-            insn3 = bfd_getb16(buffer);
-        } else {
-            insn3 = bfd_getl16(buffer);
-        }
-        (*info->fprintf_func)(info->stream, "%04x ", insn3);
-    } else {
-        (*info->fprintf_func)(info->stream, "     ");
-    }
-
-    int length = nanomips_dis(buf, &disassm_info, insn1, insn2, insn3);
-
-    /* FIXME: Should probably use a hash table on the major opcode here.  */
-
-    (*info->fprintf_func) (info->stream, "%s", buf);
-    if (length > 0) {
-        return length / 8;
-    }
-
-    info->insn_type = dis_noninsn;
-
-    return insn3 ? 6 : insn2 ? 4 : 2;
-}
-
-
 std::string img_format(const char *format, ...)
 {
     char buffer[256];
@@ -739,7 +640,7 @@ static std::string ADDRESS(uint64 value, int instruction_size, Dis_info *info)
 }
 
 
-uint64 NMD::extract_op_code_value(const uint16 * data, int size)
+static uint64 extract_op_code_value(const uint16 *data, int size)
 {
     switch (size) {
     case 16:
@@ -765,7 +666,7 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
  *      instruction size    - negative is error
  *      disassembly string  - on error will constain error string
  */
-int NMD::Disassemble(const uint16 * data, std::string & dis,
+static int Disassemble(const uint16 *data, std::string & dis,
                      TABLE_ENTRY_TYPE & type, const Pool *table,
                      int table_size, Dis_info *info)
 {
@@ -22348,8 +22249,105 @@ static const Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-int NMD::Disassemble(const uint16 *data, std::string & dis,
-                     TABLE_ENTRY_TYPE & type, Dis_info *info)
+static int Disassemble(const uint16 *data, std::string & dis,
+                       TABLE_ENTRY_TYPE & type, Dis_info *info)
 {
     return Disassemble(data, dis, type, MAJOR, 2, info);
 }
+
+static int nanomips_dis(char *buf,
+                 Dis_info *info,
+                 unsigned short one,
+                 unsigned short two,
+                 unsigned short three)
+{
+    std::string disasm;
+    uint16 bits[3] = {one, two, three};
+
+    TABLE_ENTRY_TYPE type;
+    int size = Disassemble(bits, disasm, type, info);
+
+    strcpy(buf, disasm.c_str());
+    return size;
+}
+
+int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
+{
+    int status;
+    bfd_byte buffer[2];
+    uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
+    char buf[200];
+
+    info->bytes_per_chunk = 2;
+    info->display_endian = info->endian;
+    info->insn_info_valid = 1;
+    info->branch_delay_insns = 0;
+    info->data_size = 0;
+    info->insn_type = dis_nonbranch;
+    info->target = 0;
+    info->target2 = 0;
+
+    Dis_info disassm_info;
+    disassm_info.m_pc = memaddr;
+
+    status = (*info->read_memory_func)(memaddr, buffer, 2, info);
+    if (status != 0) {
+        (*info->memory_error_func)(status, memaddr, info);
+        return -1;
+    }
+
+    if (info->endian == BFD_ENDIAN_BIG) {
+        insn1 = bfd_getb16(buffer);
+    } else {
+        insn1 = bfd_getl16(buffer);
+    }
+    (*info->fprintf_func)(info->stream, "%04x ", insn1);
+
+    /* Handle 32-bit opcodes.  */
+    if ((insn1 & 0x1000) == 0) {
+        status = (*info->read_memory_func)(memaddr + 2, buffer, 2, info);
+        if (status != 0) {
+            (*info->memory_error_func)(status, memaddr + 2, info);
+            return -1;
+        }
+
+        if (info->endian == BFD_ENDIAN_BIG) {
+            insn2 = bfd_getb16(buffer);
+        } else {
+            insn2 = bfd_getl16(buffer);
+        }
+        (*info->fprintf_func)(info->stream, "%04x ", insn2);
+    } else {
+        (*info->fprintf_func)(info->stream, "     ");
+    }
+    /* Handle 48-bit opcodes.  */
+    if ((insn1 >> 10) == 0x18) {
+        status = (*info->read_memory_func)(memaddr + 4, buffer, 2, info);
+        if (status != 0) {
+            (*info->memory_error_func)(status, memaddr + 4, info);
+            return -1;
+        }
+
+        if (info->endian == BFD_ENDIAN_BIG) {
+            insn3 = bfd_getb16(buffer);
+        } else {
+            insn3 = bfd_getl16(buffer);
+        }
+        (*info->fprintf_func)(info->stream, "%04x ", insn3);
+    } else {
+        (*info->fprintf_func)(info->stream, "     ");
+    }
+
+    int length = nanomips_dis(buf, &disassm_info, insn1, insn2, insn3);
+
+    /* FIXME: Should probably use a hash table on the major opcode here.  */
+
+    (*info->fprintf_func) (info->stream, "%s", buf);
+    if (length > 0) {
+        return length / 8;
+    }
+
+    info->insn_type = dis_noninsn;
+
+    return insn3 ? 6 : insn2 ? 4 : 2;
+}
diff --git a/disas/nanomips.h b/disas/nanomips.h
index c56fc32b1e..47b44af751 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -80,19 +80,4 @@ typedef struct Pool {
     uint64               attributes;
 } Pool;
 
-class NMD
-{
-public:
-
-    int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type, Dis_info *info);
-
-private:
-
-    uint64 extract_op_code_value(const uint16 *data, int size);
-    int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type, const Pool *table, int table_size,
-                    Dis_info *info);
-};
-
 #endif
-- 
2.37.3


