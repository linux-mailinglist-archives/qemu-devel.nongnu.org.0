Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533F64F9B1A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 18:54:30 +0200 (CEST)
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrsT-0005Vn-Dv
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 12:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmM-0007Ao-A3
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:10 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:45593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmJ-00032N-9r
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:10 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso5979330wmz.4
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ubCqK51gYtJJDCrG/hEyxYZ9EfsVm0Z8CHCmeeA6FEk=;
 b=dARvqjpDhtGfCPvMid4GkAnwEvF+2Bo7ZNPEBM86YCHkx/S3XIp2wQAWSUd+bJLgsf
 su60hybV6dXHfB/UevbNjRCoWVqrU2og5y+hkk4UpFyn8DKgOtISLm8kXDVR3LImehS4
 NsmgGM1WgNJHOPiW2AXVbzIrqGgB8vpao5wIpozOLNvZW7A6f3oKPSSGY3Dk3YeoRy9V
 dbJdPzZdI2KxS1sTGvuIaZC0h331zdd162mn8E8Su+F5aREUT0PRiSEyncrn+jZjfre7
 NwD5zmKdnjQdRYHLGwtNoSbPySsjwu0y4xaeE/m7/nt25DpnzuzdDcQizxM/Zpt+7PsE
 Uqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ubCqK51gYtJJDCrG/hEyxYZ9EfsVm0Z8CHCmeeA6FEk=;
 b=bVox7MxiCP8uV+fdnd49BS2USRBjDPfr62nBO7jGnZ9LprGMMlrbpnzXjtbeI5EJxL
 +5AbEkFRyTtsoNYAXcAx68tpP+ClgqZjAccUgHWKt+FE/U6+jSc/mgq6XQBnIM17SufF
 maXCUWaVjdn7R75Pw6QjiV0X3rmbDID/B5DhGZnwZuDotrJe/7I/6Xq4gx0UMI+9b2mE
 4mq3Gl/Lys41/JDGntJNsgVbQAgkJ6NCUKun4BzfaTij5/TSJx1D2C/Pu8PwTY4j5WXN
 PGLvBZ2fyqxbLlxuhSyfmK+Y1J66mpganhHSai/5Ro9NRea4JAIDZWddfZR04nXo+37J
 fsNw==
X-Gm-Message-State: AOAM531bisvEC8avaRXKywYkBIwzODWSXmGWNTexOLr65TIXVE5DQcXc
 3lqgTcaUaAH46zrM7tiDBcuwWA==
X-Google-Smtp-Source: ABdhPJxJ5kM7u1En3/kjqIc2/4kgaVgVsV0kh9Wn8j8fLzAdcjTbWrkwH9i92s3Byb6wTVYH7eiYvg==
X-Received: by 2002:a05:600c:19cf:b0:38c:b1fd:1fc9 with SMTP id
 u15-20020a05600c19cf00b0038cb1fd1fc9mr17610060wmq.103.1649436477242; 
 Fri, 08 Apr 2022 09:47:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d59a8000000b00204178688d3sm22961446wrr.100.2022.04.08.09.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 624231FFB7;
 Fri,  8 Apr 2022 17:47:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 08/15] disas: use result of ->read_memory_func
Date: Fri,  8 Apr 2022 17:47:35 +0100
Message-Id: <20220408164742.2844631-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This gets especially confusing if you start plugging in host addresses
from a trace and you wonder why the output keeps changing. Report when
read_memory_func fails instead of blindly disassembling the buffer
contents.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 disas.c          | 20 ++++++-------
 disas/capstone.c | 73 ++++++++++++++++++++++++++++--------------------
 2 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/disas.c b/disas.c
index 9b52b2fa93..04329aae36 100644
--- a/disas.c
+++ b/disas.c
@@ -83,18 +83,18 @@ static int print_insn_objdump(bfd_vma pc, disassemble_info *info,
                               const char *prefix)
 {
     int i, n = info->buffer_length;
-    uint8_t *buf = g_malloc(n);
-
-    info->read_memory_func(pc, buf, n, info);
-
-    for (i = 0; i < n; ++i) {
-        if (i % 32 == 0) {
-            info->fprintf_func(info->stream, "\n%s: ", prefix);
+    g_autofree uint8_t *buf = g_malloc(n);
+
+    if (info->read_memory_func(pc, buf, n, info) == 0) {
+        for (i = 0; i < n; ++i) {
+            if (i % 32 == 0) {
+                info->fprintf_func(info->stream, "\n%s: ", prefix);
+            }
+            info->fprintf_func(info->stream, "%02x", buf[i]);
         }
-        info->fprintf_func(info->stream, "%02x", buf[i]);
+    } else {
+        info->fprintf_func(info->stream, "unable to read memory");
     }
-
-    g_free(buf);
     return n;
 }
 
diff --git a/disas/capstone.c b/disas/capstone.c
index 20bc8f9669..fe3efb0d3c 100644
--- a/disas/capstone.c
+++ b/disas/capstone.c
@@ -191,37 +191,43 @@ bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size)
         size_t tsize = MIN(sizeof(cap_buf) - csize, size);
         const uint8_t *cbuf = cap_buf;
 
-        info->read_memory_func(pc + csize, cap_buf + csize, tsize, info);
-        csize += tsize;
-        size -= tsize;
+        if (info->read_memory_func(pc + csize, cap_buf + csize, tsize, info) == 0) {
+            csize += tsize;
+            size -= tsize;
 
-        while (cs_disasm_iter(handle, &cbuf, &csize, &pc, insn)) {
-            cap_dump_insn(info, insn);
-        }
+            while (cs_disasm_iter(handle, &cbuf, &csize, &pc, insn)) {
+                cap_dump_insn(info, insn);
+            }
+
+            /* If the target memory is not consumed, go back for more... */
+            if (size != 0) {
+                /*
+                 * ... taking care to move any remaining fractional insn
+                 * to the beginning of the buffer.
+                 */
+                if (csize != 0) {
+                    memmove(cap_buf, cbuf, csize);
+                }
+                continue;
+            }
 
-        /* If the target memory is not consumed, go back for more... */
-        if (size != 0) {
             /*
-             * ... taking care to move any remaining fractional insn
-             * to the beginning of the buffer.
+             * Since the target memory is consumed, we should not have
+             * a remaining fractional insn.
              */
             if (csize != 0) {
-                memmove(cap_buf, cbuf, csize);
+                info->fprintf_func(info->stream,
+                                   "Disassembler disagrees with translator "
+                                   "over instruction decoding\n"
+                                   "Please report this to qemu-devel@nongnu.org\n");
             }
-            continue;
-        }
+            break;
 
-        /*
-         * Since the target memory is consumed, we should not have
-         * a remaining fractional insn.
-         */
-        if (csize != 0) {
+        } else {
             info->fprintf_func(info->stream,
-                "Disassembler disagrees with translator "
-                "over instruction decoding\n"
-                "Please report this to qemu-devel@nongnu.org\n");
+                               "0x%08" PRIx64 ": unable to read memory\n", pc);
+            break;
         }
-        break;
     }
 
     cs_close(&handle);
@@ -286,16 +292,23 @@ bool cap_disas_monitor(disassemble_info *info, uint64_t pc, int count)
 
         /* Make certain that we can make progress.  */
         assert(tsize != 0);
-        info->read_memory_func(pc + csize, cap_buf + csize, tsize, info);
-        csize += tsize;
-
-        if (cs_disasm_iter(handle, &cbuf, &csize, &pc, insn)) {
-            cap_dump_insn(info, insn);
-            if (--count <= 0) {
-                break;
+        if (info->read_memory_func(pc + csize, cap_buf + csize,
+                                   tsize, info) == 0)
+        {
+            csize += tsize;
+
+            if (cs_disasm_iter(handle, &cbuf, &csize, &pc, insn)) {
+                cap_dump_insn(info, insn);
+                if (--count <= 0) {
+                    break;
+                }
             }
+            memmove(cap_buf, cbuf, csize);
+        } else {
+            info->fprintf_func(info->stream,
+                               "0x%08" PRIx64 ": unable to read memory\n", pc);
+            break;
         }
-        memmove(cap_buf, cbuf, csize);
     }
 
     cs_close(&handle);
-- 
2.30.2


