Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF15B612D86
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGsP-00043u-FP; Sun, 30 Oct 2022 18:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGr8-0000uB-3Q
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGr6-0008VT-62
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j15so13681067wrq.3
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yO1r8Fwa563Hsdt0UFW2WgWZrxUFZcYN3UpLOzdbX6s=;
 b=iK2KmvfAW6L2RR261d31yxEFVOkIYUNR9bAu6AfkFhIRyqfJXnQtGUYVkp6CGJMoVq
 l4o0kQuUMe8iEC9m+RVUgLWfLU0reUPExH2xIWkiiVgDjEaeT0W6ZCccI04Ms6vo9fTD
 jVlaZzPrrPpjeoWISrhA8u1pHYsTzKWzu4PnRn51vkkqLKSqIIG4VKaUhtNeJbm58cXP
 f+2JWtJRfO2aQUGV/FHd3m7NkbDttTt/A8WlN+4bDvwh3h/Q4LfZyh8uJtBDWXBGBB16
 iCQUUcGP5lNpQyx2JQIKVA7uHzxkxF94E2cp1ESn4bc3SkiI4BBxvaxevsoFFWoLK1zP
 LEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yO1r8Fwa563Hsdt0UFW2WgWZrxUFZcYN3UpLOzdbX6s=;
 b=zupdkyt+m+NTmwR24ibUwvCfJ5UXCv5KKeyzrlblmWWGLyNybDxMYHuRXNZdzSBVrD
 ldsJVb3GDuMvldts8Yr09OCu6B8kA+DIX5e3I6RlxUYI7XkCYJ5e9AxyrX9L5nPLo51X
 KBIqvnUjLuTjL68CUZMWEhrtDmPdNCzy0NuqNnxYTDXskwfUk5SIS3NmVF7ObajyoDju
 eKqTsc2lecf3BlNhC++DyyitDwl//5Vp7aoY4yefl0DWniGXZZF4Z5PKhxW17jCxQEP6
 tlrkJs1O0nkhlmkZZ+WIxetblaeXsFmZhJRI/X+8pN6HSftKT4e4VAbyABK3IYD2I4dG
 D06Q==
X-Gm-Message-State: ACrzQf1+lk6SCp9Dt8RvhS+a1j3XlASYz3LtSOo9XSa3aC2dgRwKO/tD
 KUQ6yoD4+Vlbx7KZXltNSxYQrgN7KaXbQQ==
X-Google-Smtp-Source: AMsMyM6saImwMarmTAEbv2Dq64H1Oi1hXPBktloIXobAsNATqZAk+koWnEHqPfgr3M7aKp7P5zPbcw==
X-Received: by 2002:a5d:6481:0:b0:236:792e:790c with SMTP id
 o1-20020a5d6481000000b00236792e790cmr6087113wri.697.1667169154516; 
 Sun, 30 Oct 2022 15:32:34 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003c6c1686b10sm3832915wmb.7.2022.10.30.15.32.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:32:33 -0700 (PDT)
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
Subject: [PULL 35/55] disas/nanomips: Replace exception handling
Date: Sun, 30 Oct 2022 23:28:21 +0100
Message-Id: <20221030222841.42377-36-philmd@linaro.org>
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

Since there's no support for exception handling in C, the try-catch
blocks have been deleted, and throw clauses are replaced. When a runtime
error happens, we're printing out the error message. Disassembling of
the current instruction interrupts. This behavior is achieved by adding
sigsetjmp() to discard further disassembling after the error message
prints and by adding the siglongjmp() function to imitate throwing an
error. The goal was to maintain the same output as it was.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-22-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 100 ++++++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 55 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 73329462ee..1832c2d3cf 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -31,7 +31,6 @@
 #include "disas/dis-asm.h"
 
 #include <string.h>
-#include <stdexcept>
 #include <stdio.h>
 #include <stdarg.h>
 
@@ -133,10 +132,9 @@ static uint64 renumber_registers(uint64 index, uint64 *register_list,
         return register_list[index];
     }
 
-    throw std::runtime_error(img_format(
-                   "Invalid register mapping index %" PRIu64
-                   ", size of list = %zu",
-                   index, register_list_size));
+    info->fprintf_func(info->stream, "Invalid register mapping index %" PRIu64
+                       ", size of list = %zu", index, register_list_size);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -466,8 +464,9 @@ static const char *GPR(uint64 reg, Dis_info *info)
         return gpr_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid GPR register index %" PRIu64,
-                                         reg));
+    info->fprintf_func(info->stream, "Invalid GPR register index %" PRIu64,
+                       reg);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -503,8 +502,9 @@ static const char *FPR(uint64 reg, Dis_info *info)
         return fpr_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid FPR register index %" PRIu64,
-                                         reg));
+    info->fprintf_func(info->stream, "Invalid FPR register index %" PRIu64,
+                       reg);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -518,8 +518,9 @@ static const char *AC(uint64 reg, Dis_info *info)
         return ac_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid AC register index %" PRIu64,
-                                         reg));
+    info->fprintf_func(info->stream, "Invalid AC register index %" PRIu64,
+                       reg);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -562,55 +563,38 @@ static int Disassemble(const uint16 *data, char **dis,
                      TABLE_ENTRY_TYPE & type, const Pool *table,
                      int table_size, Dis_info *info)
 {
-    try
-    {
-        for (int i = 0; i < table_size; i++) {
-            uint64 op_code = extract_op_code_value(data,
-                                 table[i].instructions_size);
-            if ((op_code & table[i].mask) == table[i].value) {
-                /* possible match */
-                conditional_function cond = table[i].condition;
-                if ((cond == NULL) || cond(op_code)) {
-                    try
-                    {
-                        if (table[i].type == pool) {
-                            return Disassemble(data, dis, type,
-                                               table[i].next_table,
-                                               table[i].next_table_size,
-                                               info);
-                        } else if ((table[i].type == instruction) ||
-                                   (table[i].type == call_instruction) ||
-                                   (table[i].type == branch_instruction) ||
-                                   (table[i].type == return_instruction)) {
-                            disassembly_function dis_fn = table[i].disassembly;
-                            if (dis_fn == 0) {
-                                *dis = g_strdup(
-                                    "disassembler failure - bad table entry");
-                                return -6;
-                            }
-                            type = table[i].type;
-                            *dis = dis_fn(op_code, info);
-                            return table[i].instructions_size;
-                        } else {
-                            *dis = g_strdup("reserved instruction");
-                            return -2;
-                        }
-                    }
-                    catch (std::runtime_error & e)
-                    {
-                        *dis = g_strdup(e.what());
-                        return -3;          /* runtime error */
+    for (int i = 0; i < table_size; i++) {
+        uint64 op_code = extract_op_code_value(data,
+                             table[i].instructions_size);
+        if ((op_code & table[i].mask) == table[i].value) {
+            /* possible match */
+            conditional_function cond = table[i].condition;
+            if ((cond == NULL) || cond(op_code)) {
+                if (table[i].type == pool) {
+                    return Disassemble(data, dis, type,
+                                       table[i].next_table,
+                                       table[i].next_table_size,
+                                       info);
+                } else if ((table[i].type == instruction) ||
+                           (table[i].type == call_instruction) ||
+                           (table[i].type == branch_instruction) ||
+                           (table[i].type == return_instruction)) {
+                    disassembly_function dis_fn = table[i].disassembly;
+                    if (dis_fn == 0) {
+                        *dis = g_strdup(
+                            "disassembler failure - bad table entry");
+                        return -6;
                     }
+                    type = table[i].type;
+                    *dis = dis_fn(op_code, info);
+                    return table[i].instructions_size;
+                } else {
+                    *dis = g_strdup("reserved instruction");
+                    return -2;
                 }
             }
         }
     }
-    catch (std::exception & e)
-    {
-        *dis = g_strdup(e.what());
-        return -4;          /* runtime error */
-    }
-
     *dis = g_strdup("failed to disassemble");
     return -1;      /* failed to disassemble        */
 }
@@ -22003,6 +21987,12 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         (*info->fprintf_func)(info->stream, "     ");
     }
 
+    /* Handle runtime errors. */
+    if (sigsetjmp(disassm_info.buf, 0) != 0) {
+        info->insn_type = dis_noninsn;
+        return insn3 ? 6 : insn2 ? 4 : 2;
+    }
+
     int length = nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3);
 
     /* FIXME: Should probably use a hash table on the major opcode here.  */
-- 
2.37.3


