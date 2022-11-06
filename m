Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0E61DFC1
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 01:17:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orTKR-0006il-UN; Sat, 05 Nov 2022 20:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orTKQ-0006iF-Et
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 20:15:58 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orTKO-0004a0-Lq
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 20:15:58 -0400
Received: by mail-pf1-x433.google.com with SMTP id q9so7601993pfg.5
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 17:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bxbWEJoBOyBo+VR3YhlP4vcU+d1LVS2IqLK4lRXDSc=;
 b=c8ufsyj4IAX0ifFAPi4m8mp5uuEHkMa7+wA3mMI00MX5euUWtY9X8nN725+fHYuHiw
 OV5UZneKmbvW2FLbO7dNlSaxv+N6KjVP2iuPpIchbRGuGWXVr6S8/TlQ/MpVQO2WngrR
 Xh/CjC1zo073hP2O58R4Mys4vNMr/N9lpw+cqFkUV/yiRVK5MWCXmbojCGlwmdk93h95
 Swh3ERy5qca2r7Y28AMSttoPnY5N3YbK7sYfYOrgDyM20qg4OTKabd55a4VS4zF5FkOJ
 MIE3y7+7RtH9dZxjdRvs/dmTbR7o+vs7K3lWFLjBATCnHt1HNknEeGBnk8vhp6h2X9/b
 bOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bxbWEJoBOyBo+VR3YhlP4vcU+d1LVS2IqLK4lRXDSc=;
 b=I+Z9k4Ru+FXGgO4uydzY6Q4/+hWZV8m3K769zs+QcZ21wOtzy+1yxzIZjV41sjkbv4
 vlTYzhk5TUiN3giLgOI5X3cxgwxUXfS8bkAXKeJqUI5jBO9DiH2ZecqJCk7TXrr3itBc
 0HOkvXtKERhxhH8kuDo3fsrSBlLrRGY0G3pt2rxbixuNR8TQIDjRmV4Ed63O5ukUYlUY
 KgavVe/Udx0r8+DeTIiECkPY6MNWvmbFI5VIzKHtaa0KzWIvK0iXLVwWLPmlWVfK84QQ
 ibA2pYTBXyqoKdd0ZkRzgmSWx/0dRH+8modA3VDy9KEWsCGIeaJjuaorlv3RKDCYR1mr
 voVQ==
X-Gm-Message-State: ACrzQf0Pdb4XbkHIWNTv6B/8Uml93vDU7UmY50/jadzdQF1ZplO0XfzW
 ZBhsA5kFGgTV2m4YVAagfbspmTO12lZZ5w==
X-Google-Smtp-Source: AMsMyM4O2lORnXDaYOe6Kxsbt4IaSM57mbgTwJQSP3xhyDwoh/IQ75OlT0sxQ9aZFSCOasUP6j5DBw==
X-Received: by 2002:a63:f452:0:b0:46f:6d7b:3fc9 with SMTP id
 p18-20020a63f452000000b0046f6d7b3fc9mr37009666pgk.472.1667693755095; 
 Sat, 05 Nov 2022 17:15:55 -0700 (PDT)
Received: from stoup.. ([172.58.27.185]) by smtp.gmail.com with ESMTPSA id
 b6-20020a170903228600b00186b0ac12c5sm2192692plh.172.2022.11.05.17.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 17:15:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	sw@weilnetz.de
Subject: [PATCH 1/6] disas/nanomips: Move setjmp into nanomips_dis
Date: Sun,  6 Nov 2022 11:15:34 +1100
Message-Id: <20221106001540.108571-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106001540.108571-1-richard.henderson@linaro.org>
References: <20221106001540.108571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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


