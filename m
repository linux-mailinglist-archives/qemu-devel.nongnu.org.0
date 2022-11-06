Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB161E696
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:30:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ornCY-0005NK-I7; Sun, 06 Nov 2022 16:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCV-0005N9-Lk
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:07 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCT-0004FZ-Vu
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:07 -0500
Received: by mail-pf1-x42c.google.com with SMTP id q9so8959184pfg.5
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 13:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEJwA4/1nvvScgj1A3FZC/cPQjc5wW51x5R4pumobJc=;
 b=XwwJC0Ahu9dW82bAQBKGuE2Gd1/stUT4CNZSv6aM5toXTuXaGGkaiodzHdN5yv1L/w
 uZ2OOQBpSjTrlRUqeNMNomIQJRHqqxTlp1yeLVZRRhmscypcar6IngxpRITZDjsUztRJ
 HTCFdTquHKUiphoJ6kULl+H9o+53pJMg39Imv+SoccOjrr8tpVeP8zM/TsZHSmNO65ER
 1fWl+BYqPoYZa2dBgGGMc5kzzqkHla9x1SQd6nIE35/Kv1SZNVkVjqWBhdjtYQ71xKzS
 itqtUQY0q1JBFF4BklfjYB0lJ7uA5IJvA6/ojO2lBZgcGZmjiscYCUkSJZGj+WIcq9FF
 3Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEJwA4/1nvvScgj1A3FZC/cPQjc5wW51x5R4pumobJc=;
 b=SU0+7/PSQjciakC+fIaK2NEHznXFHC6+E/Ik8Y2XxzInOAwnOT/1T8xqskRl0sMUL1
 +d/8l0pLp2M3y/jW842otbVsQxsikjKcmi0q6+4VYBqIsAVCx8EQFiwyYeMGSCbNXsPL
 opeCS56+ySFN6iMMUqfM6sVlKz52tlgLc6+hrL5gB4hQcXw9+eCMXl2wvF8JLwkmFP2P
 de6I4U0nypCFMnBBn2L0y287Qbs+h4IRdD6YuQQG27WspdLgeFH/UVhnRAmERjrmJrxZ
 fyZ9lNpXOqb8zuK0lOIianbBq6V9x5IexZ+f9985ZPs5VzIvM02coUUw/lRyJG4inGbB
 NdAQ==
X-Gm-Message-State: ANoB5pmyaByoZfjyxKk0F3PDt0R79/ntLBzAqVqKVw797j28/V03gtuO
 gPOQ9tymiNvsYi8qX9u0SObntz1/W7DY6pKd
X-Google-Smtp-Source: AA0mqf72I5ytKFrYeQfi1txbsApj3Gj5MHzbcC2vdABU/0l5VuyKZ1uJfXDikSflGWgNAz12nUUdcQ==
X-Received: by 2002:a63:550a:0:b0:470:71e2:132f with SMTP id
 j10-20020a63550a000000b0047071e2132fmr2763539pgb.614.1667770144637; 
 Sun, 06 Nov 2022 13:29:04 -0800 (PST)
Received: from localhost.localdomain ([2001:8003:d918:7a00:f28:fa55:3b51:3624])
 by smtp.gmail.com with ESMTPSA id
 20-20020a621914000000b00563ce1905f4sm2998746pfz.5.2022.11.06.13.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 13:29:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu,
	philmd@linaro.org,
	sw@weilnetz.de
Subject: [PATCH v2 2/6] disas/nanomips: Merge insn{1,2,3} into words[3]
Date: Mon,  7 Nov 2022 08:28:48 +1100
Message-Id: <20221106212852.152384-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106212852.152384-1-richard.henderson@linaro.org>
References: <20221106212852.152384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Since Disassemble wants the data in this format, collect
it that way.  This allows using a loop to print the bytes.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.c | 44 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index ea3e9202ac..1645d6d7aa 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21905,26 +21905,22 @@ static const Pool MAJOR[2] = {
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
@@ -21948,15 +21944,14 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
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
@@ -21964,17 +21959,15 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
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
@@ -21982,17 +21975,22 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
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
2.34.1


