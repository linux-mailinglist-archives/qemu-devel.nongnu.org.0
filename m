Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4847761E001
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 03:39:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orVXi-00007c-6g; Sat, 05 Nov 2022 22:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXf-00007H-Fr
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:37:47 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXd-0003Je-Q3
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:37:47 -0400
Received: by mail-pf1-x42b.google.com with SMTP id k22so7751849pfd.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 19:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bxbWEJoBOyBo+VR3YhlP4vcU+d1LVS2IqLK4lRXDSc=;
 b=B3RoaapCzBJW3nhw+wBbjruevOuVxFJpxmJEEiQgS+lsJOqlis1IHpm3AlZWV/mHtd
 NsiI9P9n52U/SE4SZz5M0oKgtSi9eZXiX25gzB4IeFR74HU0xJX9vfFzUX4p7AktGLIm
 pghyhoSLL3798lLt4n1gupVA8YYStapxoUn/ZE1s+tgWUbYIW9KxjjptHAr6mO1eJIhu
 VHbVHaTryTOK77nP3X6H2P+GI1MO3QjzCeyfbwnFj36ZCtgL1aFkeclvPZOzUbnM4iuh
 x82bMqn6QMWHU3PVdL2MiM687Odiw8yjTbTDCgXy2r7ObuprBQm7kNyB9fnfeJbEFJhz
 Husg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bxbWEJoBOyBo+VR3YhlP4vcU+d1LVS2IqLK4lRXDSc=;
 b=k4YorXMr9I8aLJtTIwcU0ecg+PB8wRegu4n4mVCWZRFc0IQDuBtjnYbimDRPC0922O
 yU47LYNGbe1XKaoiaXx/2dfL7JqCB8fVSvIsiht8N/BL3gzz90fr0St39amqebWiezCV
 vUPd8bs/KnVfw5paEd2f688d2qg90+iqG7nBsKPfIVnHtcjL3QsKcANh4Vq8NfA9gnnk
 IeMCCgbPX2v42Uc0hcJJ71sNcFe9A8c4wWRq6f7vvElXpogw74FxlSTflQMDVJTVRFSI
 ly4us72ATxzJB1CYj6jgptkTRBq/9X4lw3up5mXZYqNFimkq2T9+GUwX5/zSACCI/DUu
 Z1UA==
X-Gm-Message-State: ACrzQf3toNnxItgQyZgq48ZhG4vClsnLy1zSTmZGb9k88lLTFCijV26P
 yvTzFdC8ABrh//sD0Qwed6kz9sgjnTzZVPDF
X-Google-Smtp-Source: AMsMyM6qT7UOMXfTMbjpuVX73vf17kpEB7Kbu0940jSqz9NUH/5NJOFJblLhegjDnghpuKZsElzi/Q==
X-Received: by 2002:a05:6a02:199:b0:469:d0e6:dab8 with SMTP id
 bj25-20020a056a02019900b00469d0e6dab8mr37757606pgb.97.1667702264479; 
 Sat, 05 Nov 2022 19:37:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:d918:7a00:e617:679e:af7:63d])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a170902d19500b0018862bb3976sm2259457plb.308.2022.11.05.19.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 19:37:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	sw@weilnetz.de
Subject: [RESEND PATCH 1/6] disas/nanomips: Move setjmp into nanomips_dis
Date: Sun,  6 Nov 2022 13:37:30 +1100
Message-Id: <20221106023735.5277-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106023735.5277-1-richard.henderson@linaro.org>
References: <20221106023735.5277-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Reduce the number of local variables within the scope of the
setjmp by moving it to the existing helper.  The actual length
returned from Disassemble is not used, because we have already
determined the length while reading bytes.  Fixes:

nanomips.c: In function ‘print_insn_nanomips’:
nanomips.c:21925:14: error: variable ‘insn1’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
nanomips.c:21925:25: error: variable ‘insn2’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
nanomips.c:21925:36: error: variable ‘insn3’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
nanomips.c:21926:22: error: variable ‘buf’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.c | 44 ++++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 9647f1a8e3..9a69e6880a 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21905,22 +21905,27 @@ static const Pool MAJOR[2] = {
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
+    int ret;
+
+    ret = sigsetjmp(info->buf, 0);
+    if (ret != 0) {
+        return false;
+    }
+
+    ret = Disassemble(bits, buf, &type, MAJOR, 2, info);
+    return ret >= 0;
 }
 
 int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
 {
-    int status;
+    int status, length;
     bfd_byte buffer[2];
     uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
     g_autofree char *buf = NULL;
@@ -21950,6 +21955,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     } else {
         insn1 = bfd_getl16(buffer);
     }
+    length = 2;
     (*info->fprintf_func)(info->stream, "%04x ", insn1);
 
     /* Handle 32-bit opcodes.  */
@@ -21965,6 +21971,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         } else {
             insn2 = bfd_getl16(buffer);
         }
+        length = 4;
         (*info->fprintf_func)(info->stream, "%04x ", insn2);
     } else {
         (*info->fprintf_func)(info->stream, "     ");
@@ -21982,27 +21989,16 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         } else {
             insn3 = bfd_getl16(buffer);
         }
+        length = 6;
         (*info->fprintf_func)(info->stream, "%04x ", insn3);
     } else {
         (*info->fprintf_func)(info->stream, "     ");
     }
 
     /* Handle runtime errors. */
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


