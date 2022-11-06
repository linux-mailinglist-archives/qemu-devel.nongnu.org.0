Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F161E695
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ornCU-0005Lq-M6; Sun, 06 Nov 2022 16:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCS-0005LK-I0
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:04 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCQ-0004FE-Sq
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:04 -0500
Received: by mail-pf1-x42f.google.com with SMTP id z26so8975665pff.1
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 13:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqX80AVODcxG/RhHKynAet5XMKQZScZhVL1xtE8ALDQ=;
 b=L5vnkJJWpzrROp0UGHSIv4JPL7/HaKTguRboWdf9IJqA/1XbxpqrhXqNQLBJ6CQ7Iq
 jjKbZry/2FH2CIm5dBUPLN5Us9JfXo0R/la/PepmyCMMJliaIi3/4SYXjg0IsM1e6BtM
 ejgqXEqXrbL5cxQfHsAfUL4TkgqgKjzs23aDAnUcTTjjaTPp3yUuZ4d4ukxcXViaYsZZ
 QnEgQnpsirDx8Qzc9agGEftLCujORo0aaKuolC5JKdwDHzqVmZl1kozFk9i5fwAAiWq2
 RRszNejZMAjQqThpCTuD4KRuceGExXFlciJ69Wv3AugYpvY1GPUCAhwXb7FdFC4YyCeT
 EDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gqX80AVODcxG/RhHKynAet5XMKQZScZhVL1xtE8ALDQ=;
 b=8FSXhwLHcGnO2bqvuH0jHtd7S+qbmrK09GXE2tMx5LwcpUGxkeBrP9g+29fciSG5oW
 3M9FPkumhnYWZ453ab8YqQhrmJlWUbxzvwjVEG6D40XpVzY+RRLeqKVtW5cNeMVZZ5l0
 9ZhGlIhZA7fFxgF5Tcy7nG3WtyXrcSfKx9y3RDRg1vodPKD0OuPKwz6VEtQPCEdYTwLE
 TRoX+Ah77cMGbjtHnnebCdVHG37ZH/9k1hpI3d7DdqzBs4gQ6AwsYwbE8gYMtmJg9slc
 zcbBPyR6l53iF/GvlRJsb/8AbzcGe+zVlYHsKl1cXNpwEXZEgQ5BgjZTR8NsDowHDRQ9
 0HrA==
X-Gm-Message-State: ACrzQf3RfrAw427VwRvHaOkj6z1PfVviRxyMu34jFz3cxz3XQhPXzw9e
 bADs7Kg8pbl0xRBHlr8QhuChZpgvbwoigCPX
X-Google-Smtp-Source: AMsMyM4g7lPu1448AvrqE64y6h1qp3acxaOoyU8PlKZxQgOhCiFsTAv/CYShXx78MY+ZVc5GME/SjQ==
X-Received: by 2002:a05:6a00:1749:b0:56e:47b2:f0b with SMTP id
 j9-20020a056a00174900b0056e47b20f0bmr20219641pfc.68.1667770141611; 
 Sun, 06 Nov 2022 13:29:01 -0800 (PST)
Received: from localhost.localdomain ([2001:8003:d918:7a00:f28:fa55:3b51:3624])
 by smtp.gmail.com with ESMTPSA id
 20-20020a621914000000b00563ce1905f4sm2998746pfz.5.2022.11.06.13.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 13:29:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu,
	philmd@linaro.org,
	sw@weilnetz.de
Subject: [PATCH v2 1/6] disas/nanomips: Move setjmp into nanomips_dis
Date: Mon,  7 Nov 2022 08:28:47 +1100
Message-Id: <20221106212852.152384-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106212852.152384-1-richard.henderson@linaro.org>
References: <20221106212852.152384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Reduce the number of local variables within the scope of the
setjmp by moving it to the existing helper.  The actual length
returned from Disassemble is not used, because we have already
determined the length while reading bytes.  Fixes:

nanomips.c: In function ‘print_insn_nanomips’:
nanomips.c:21925:14: error: variable ‘insn1’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
nanomips.c:21925:25: error: variable ‘insn2’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
nanomips.c:21925:36: error: variable ‘insn3’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
nanomips.c:21926:22: error: variable ‘buf’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.c | 42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 9647f1a8e3..ea3e9202ac 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21905,22 +21905,24 @@ static const Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static int nanomips_dis(char **buf,
-                 Dis_info *info,
-                 unsigned short one,
-                 unsigned short two,
-                 unsigned short three)
+static bool nanomips_dis(char **buf, Dis_info *info,
+                         unsigned short one,
+                         unsigned short two,
+                         unsigned short three)
 {
     uint16 bits[3] = {one, two, three};
-
     TABLE_ENTRY_TYPE type;
-    int size = Disassemble(bits, buf, &type, MAJOR, 2, info);
-    return size;
+
+    /* Handle runtime errors. */
+    if (unlikely(sigsetjmp(info->buf, 0) != 0)) {
+        return false;
+    }
+    return Disassemble(bits, buf, &type, MAJOR, ARRAY_SIZE(MAJOR), info) >= 0;
 }
 
 int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
 {
-    int status;
+    int status, length;
     bfd_byte buffer[2];
     uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
     g_autofree char *buf = NULL;
@@ -21950,6 +21952,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     } else {
         insn1 = bfd_getl16(buffer);
     }
+    length = 2;
     (*info->fprintf_func)(info->stream, "%04x ", insn1);
 
     /* Handle 32-bit opcodes.  */
@@ -21965,6 +21968,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         } else {
             insn2 = bfd_getl16(buffer);
         }
+        length = 4;
         (*info->fprintf_func)(info->stream, "%04x ", insn2);
     } else {
         (*info->fprintf_func)(info->stream, "     ");
@@ -21982,27 +21986,15 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         } else {
             insn3 = bfd_getl16(buffer);
         }
+        length = 6;
         (*info->fprintf_func)(info->stream, "%04x ", insn3);
     } else {
         (*info->fprintf_func)(info->stream, "     ");
     }
 
-    /* Handle runtime errors. */
-    if (sigsetjmp(disassm_info.buf, 0) != 0) {
-        info->insn_type = dis_noninsn;
-        return insn3 ? 6 : insn2 ? 4 : 2;
+    if (nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3)) {
+        (*info->fprintf_func) (info->stream, "%s", buf);
     }
 
-    int length = nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3);
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
+    return length;
 }
-- 
2.34.1


