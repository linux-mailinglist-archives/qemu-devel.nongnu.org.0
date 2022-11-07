Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA3362046A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 01:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC1T-0004mW-Aq; Mon, 07 Nov 2022 18:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1R-0004jQ-KC
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1P-0003oE-OM
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so8109329wmg.2
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Pw+X+98wJbowb3l/tH9X0PDnSwp80eLiabwKC+40Qw=;
 b=WUQL36oNzI/wCNl6MUiQVhtcAQ4FrmZTKu3o70XgxuVCxnQSpzwMgViOn/+SI5ESJi
 vMitgO6QW4G14tE7rPrEnldH5/qDtiwiaj0yc+/1+oBKzJhAVlzDJxfPPLhU1GfqCDJ7
 i1tKcybb/Bw1OLGFWQg6GevgQAstEp1+wBITmCcKEhYfDYQaVugxWWM7XHK1IniIIQ+3
 conWsacLGIm3KEXqtOc4t35MZiTBM5MBjY4ojgQZCFvbUKJ8UyTfTTzkWi8aHLj0JBo1
 BG63c/ucW772Dj+BvrQD4fYDHLhCZy6Q6cweHHoG2b21zeW/4vIuxfuoR8rXs1skrLvc
 jtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Pw+X+98wJbowb3l/tH9X0PDnSwp80eLiabwKC+40Qw=;
 b=DW9RZo77MZWGOVPyLd0qo6NEX59zxVhl4eOgydHRrRUheFG5wqcyic7909SSQV1pzJ
 F/WsgiYG5MToHcdOPGQGCmwW2S5U9HCoZQ6Unhd4UKSs9fmxGZex7TyBEoTLb9VWzMan
 eZ0mwyn8u+CTLTocv2CzB45D716p6H70kyxtFiB3K4N6uctYTB1DzDh2XFG9YzdwZ+8O
 apW+7vwFgAOxRjXJDYYavnO7XJdn14meFvClfJ6aulTaJNM66SoPLn2rqR/15OMfBs+8
 bjCS3Mg9VXb5WFVX1gR478frSqYjwGz8oTi6+0e+IPtCJY9WsHsYnUcSXUtgGGtXNys2
 UNjA==
X-Gm-Message-State: ACrzQf3d+kGwVcyEVHW/WH5EKAydTwD80AJL/SgSviPMym2ooUe4E9M3
 5Sjq2DblSonlHqcY3lelSeZLqnogiPVjsQ==
X-Google-Smtp-Source: AMsMyM7gRe0IU2cvjH3S0Pxrobyeix2BPyYA6CJ7HnlYY+dcktrWZTaiSHGCcbrkfbPogNKX5RpSMw==
X-Received: by 2002:a7b:cb49:0:b0:3b4:b08a:89b with SMTP id
 v9-20020a7bcb49000000b003b4b08a089bmr34503334wmj.173.1667865558096; 
 Mon, 07 Nov 2022 15:59:18 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c320800b003b4935f04a4sm10990386wmp.5.2022.11.07.15.59.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:59:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/14] disas/nanomips: Merge insn{1,2,3} into words[3]
Date: Tue,  8 Nov 2022 00:58:19 +0100
Message-Id: <20221107235822.71458-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Since Disassemble wants the data in this format, collect
it that way.  This allows using a loop to print the bytes.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221106212852.152384-3-richard.henderson@linaro.org>
---
 disas/nanomips.c | 44 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 83a39a878c..e462256760 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21907,26 +21907,22 @@ static const Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static bool nanomips_dis(char **buf, Dis_info *info,
-                         unsigned short one,
-                         unsigned short two,
-                         unsigned short three)
+static bool nanomips_dis(const uint16_t *data, char **buf, Dis_info *info)
 {
-    uint16 bits[3] = {one, two, three};
     TABLE_ENTRY_TYPE type;
 
     /* Handle runtime errors. */
     if (unlikely(sigsetjmp(info->buf, 0) != 0)) {
         return false;
     }
-    return Disassemble(bits, buf, &type, MAJOR, ARRAY_SIZE(MAJOR), info) >= 0;
+    return Disassemble(data, buf, &type, MAJOR, ARRAY_SIZE(MAJOR), info) >= 0;
 }
 
 int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
 {
     int status, length;
     bfd_byte buffer[2];
-    uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
+    uint16_t words[3] = { };
     g_autofree char *buf = NULL;
 
     info->bytes_per_chunk = 2;
@@ -21950,15 +21946,14 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     }
 
     if (info->endian == BFD_ENDIAN_BIG) {
-        insn1 = bfd_getb16(buffer);
+        words[0] = bfd_getb16(buffer);
     } else {
-        insn1 = bfd_getl16(buffer);
+        words[0] = bfd_getl16(buffer);
     }
     length = 2;
-    (*info->fprintf_func)(info->stream, "%04x ", insn1);
 
     /* Handle 32-bit opcodes.  */
-    if ((insn1 & 0x1000) == 0) {
+    if ((words[0] & 0x1000) == 0) {
         status = (*info->read_memory_func)(memaddr + 2, buffer, 2, info);
         if (status != 0) {
             (*info->memory_error_func)(status, memaddr + 2, info);
@@ -21966,17 +21961,15 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         }
 
         if (info->endian == BFD_ENDIAN_BIG) {
-            insn2 = bfd_getb16(buffer);
+            words[1] = bfd_getb16(buffer);
         } else {
-            insn2 = bfd_getl16(buffer);
+            words[1] = bfd_getl16(buffer);
         }
         length = 4;
-        (*info->fprintf_func)(info->stream, "%04x ", insn2);
-    } else {
-        (*info->fprintf_func)(info->stream, "     ");
     }
+
     /* Handle 48-bit opcodes.  */
-    if ((insn1 >> 10) == 0x18) {
+    if ((words[0] >> 10) == 0x18) {
         status = (*info->read_memory_func)(memaddr + 4, buffer, 2, info);
         if (status != 0) {
             (*info->memory_error_func)(status, memaddr + 4, info);
@@ -21984,17 +21977,22 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         }
 
         if (info->endian == BFD_ENDIAN_BIG) {
-            insn3 = bfd_getb16(buffer);
+            words[2] = bfd_getb16(buffer);
         } else {
-            insn3 = bfd_getl16(buffer);
+            words[2] = bfd_getl16(buffer);
         }
         length = 6;
-        (*info->fprintf_func)(info->stream, "%04x ", insn3);
-    } else {
-        (*info->fprintf_func)(info->stream, "     ");
     }
 
-    if (nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3)) {
+    for (int i = 0; i < ARRAY_SIZE(words); i++) {
+        if (i * 2 < length) {
+            (*info->fprintf_func)(info->stream, "%04x ", words[i]);
+        } else {
+            (*info->fprintf_func)(info->stream, "     ");
+        }
+    }
+
+    if (nanomips_dis(words, &buf, &disassm_info)) {
         (*info->fprintf_func) (info->stream, "%s", buf);
     }
 
-- 
2.38.1


