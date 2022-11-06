Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684A61E000
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 03:39:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orVXk-000088-ND; Sat, 05 Nov 2022 22:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXi-00007y-UV
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:37:50 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXh-0003Jv-Al
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:37:50 -0400
Received: by mail-pg1-x530.google.com with SMTP id 78so7583626pgb.13
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 19:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jPzAKdkfldBdnnuFvfcLc/ZV8BFriybI/aQvY3kdAw=;
 b=iXImIvMwFkFd/zbpk+4x1ANl3PVa9PS3hqkO8OWD2PNmp2gxBgnwh7PPngfhy82OOM
 vM6cTGXtTYHppneuqGl7amCdY3dRl08+J0sKljSUUmLXRL3Bq7R4q5Gf2SPddMbRh5PV
 rwsGuH6sGOPUpWHeuoxelmNAag4qNN+FkotZsrHDLeCtJ40sgMzxVpqoxW+NAQHx8Qos
 JYj13vMvYF+8VOSHMNPkWd8j8Hx5gcBHVb8vJrMgo1eRdnJGr83TWMlihJBm7TA8rex6
 jK5sEJElrdRbUJ535GyD9PtZVseeZHSB5MfoevvXAv9qmjjG4l1uoVMieF2D1Z14iRjT
 JJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jPzAKdkfldBdnnuFvfcLc/ZV8BFriybI/aQvY3kdAw=;
 b=DaRn7FF+mmGqQjeUw9AtwoARMov86KXlqlail1OY76U/yxUp3bHFrQVpySgffR53AD
 Zum6QHpsgzFrW8XAM2aPeLaOMTurG/mUEDGNOu9U3RgA0bsQJNjPQzlBEkmdxMPTS351
 oogQ7kVmOx6TbSSlMXoPTkF0hvyyG5IFjIGb7CWFqMHXoLL56xnZq0BhRnh73dnWg1iK
 R+/1Xxi2PzKosYlICtM3mP6k+kF1eAIu31N+0/p9EguJSrOTdufD2FFKwGL+FAZhyyEM
 or74L69rx3c5ST+XdH6BSsCrjCgyytiBUr/FXCxkkBXc7hRy8w0H9i71+2PvogpX2NRU
 xaBg==
X-Gm-Message-State: ACrzQf2rLHBbUz+d8oANIEZuds7F/5KPU0ZhXXGxqjktn4o2WXCOdaCN
 FmPWpKuMDva7sYytCPkvQ8gElGbx9dquN0vt
X-Google-Smtp-Source: AMsMyM6pOLq3Ye5RfrTG8dmV1PIuPLYmWC+V8eMCF7lRWnR9TlR6vkhQU22tkbjNeD3p/brXENaZyQ==
X-Received: by 2002:aa7:818f:0:b0:562:dc99:8a84 with SMTP id
 g15-20020aa7818f000000b00562dc998a84mr43320902pfi.30.1667702267861; 
 Sat, 05 Nov 2022 19:37:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:d918:7a00:e617:679e:af7:63d])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a170902d19500b0018862bb3976sm2259457plb.308.2022.11.05.19.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 19:37:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	sw@weilnetz.de
Subject: [RESEND PATCH 2/6] disas/nanomips: Merge insn{1,2,3} into words[3]
Date: Sun,  6 Nov 2022 13:37:31 +1100
Message-Id: <20221106023735.5277-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106023735.5277-1-richard.henderson@linaro.org>
References: <20221106023735.5277-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Since Disassemble wants the data in this format, collect
it that way.  This allows using a loop to print the bytes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.c | 44 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 9a69e6880a..5438def9af 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21905,12 +21905,8 @@ static const Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static bool nanomips_dis(char **buf, Dis_info *info,
-                         unsigned short one,
-                         unsigned short two,
-                         unsigned short three)
+static bool nanomips_dis(char **buf, Dis_info *info, uint16_t words[3])
 {
-    uint16 bits[3] = {one, two, three};
     TABLE_ENTRY_TYPE type;
     int ret;
 
@@ -21919,7 +21915,7 @@ static bool nanomips_dis(char **buf, Dis_info *info,
         return false;
     }
 
-    ret = Disassemble(bits, buf, &type, MAJOR, 2, info);
+    ret = Disassemble(words, buf, &type, MAJOR, 2, info);
     return ret >= 0;
 }
 
@@ -21927,7 +21923,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
 {
     int status, length;
     bfd_byte buffer[2];
-    uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
+    uint16_t words[3] = { };
     g_autofree char *buf = NULL;
 
     info->bytes_per_chunk = 2;
@@ -21951,15 +21947,14 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
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
@@ -21967,17 +21962,15 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
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
@@ -21985,18 +21978,23 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
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
+    }
+
+    for (int i = 0; i < 6; i += 2) {
+        if (i < length) {
+            (*info->fprintf_func)(info->stream, "%04x ", words[i / 2]);
+        } else {
+            (*info->fprintf_func)(info->stream, "     ");
+        }
     }
 
     /* Handle runtime errors. */
-    if (nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3)) {
+    if (nanomips_dis(&buf, &disassm_info, words)) {
         (*info->fprintf_func) (info->stream, "%s", buf);
     }
 
-- 
2.34.1


