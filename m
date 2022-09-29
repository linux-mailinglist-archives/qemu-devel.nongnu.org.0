Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197865EF6DB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:46:55 +0200 (CEST)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtsM-0004k3-39
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3J-0000NW-4G
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3B-0002O7-W9
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:03 -0400
Received: by mail-wm1-x32e.google.com with SMTP id iv17so779731wmb.4
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=kmq6bJycX8X3refmhkYjcu1V6tl8AxE9OoX3AJziXLM=;
 b=N0X24gGeaebVWL3VD/2w7B4QrxqePdOtMw4nhHQ65dbMkAJF+T3W1DnPP9+hICzvim
 hR0qIV2+68rMbQKlJPR/0PD1+Pr8BYrZJWVgWHliXoKJkhcSpRLxJTzHldcmA+2MK5Wd
 1MhbJNXtDa8od0rVpKnnoV0f245FliZF4hedBGvcL9yTZcykbKqY0lWd1HE3lpZYM0Rc
 cGW4m2xwn2tu4SVDamSIBrzDzCqqD84gutQPP1tl1Dao2l4KhBhOhAgNwKxJ6o1eDXwj
 cdNxxpb8MMgNrSyenwFxKvCXYH6pOVt0nBjlmVW9N262do0mZcOycfeFtThNxy7DUaN9
 3jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kmq6bJycX8X3refmhkYjcu1V6tl8AxE9OoX3AJziXLM=;
 b=Ci8ViUWYoK5+uGbOhBQXvLdhHG7ZySuqpZoOZnQIYMy/CJFwYOuTMeZINAp54NFRYF
 cs8KCmJHaE9SRlQsNDmrSK5Sw0L62213gCGLhHnsJ3vmvkY+ycm3BnEYDME1clBSukiw
 sX+anYs1Nd2VOsY2dlhgFYg7PXAug7NHJw+pDaD9V3h6reW/iHRZTpqSBOf3TOzN899V
 7/iMasevUeIZD3q4VT1gQ0D1BnAG9yTnqYHeV9+KaC3cCXEOLOSnYEoLmNT/R13fZi9J
 KxT6e55jSpRQ8TyTTaJwxD1moc0l0/PxbjthekdIPecaakqi+aTNzvmNNHd8wRaMF7jS
 Y2Ag==
X-Gm-Message-State: ACrzQf3DI1k7gzMKS2+VN5QurNcy+amy3yH1QGOXetUsTX4l8zul8VOc
 vNR6TafJ7Pwxcl9H9uttbx4F0w==
X-Google-Smtp-Source: AMsMyM50Z8xPii6RPDv8YWGLJBOmlHbwyyNOssYD9h9MYNAvp4ZhImkHTm6aCYVwrqLYwoRUsr48zg==
X-Received: by 2002:a7b:c84c:0:b0:3b3:3faa:10c3 with SMTP id
 c12-20020a7bc84c000000b003b33faa10c3mr10357289wml.94.1664452196292; 
 Thu, 29 Sep 2022 04:49:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c1d0300b003a62400724bsm4486938wms.0.2022.09.29.04.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 315271FFD5;
 Thu, 29 Sep 2022 12:42:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v1 34/51] disas: use result of ->read_memory_func
Date: Thu, 29 Sep 2022 12:42:14 +0100
Message-Id: <20220929114231.583801-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This gets especially confusing if you start plugging in host addresses
from a trace and you wonder why the output keeps changing. Report when
read_memory_func fails instead of blindly disassembling the buffer
contents.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220921160801.1490125-4-alex.bennee@linaro.org>
---
 disas.c          | 20 ++++++-------
 disas/capstone.c | 73 ++++++++++++++++++++++++++++--------------------
 2 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/disas.c b/disas.c
index f07b6e760b..94d3b45042 100644
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
2.34.1


