Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F89C5C03F4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:20:35 +0200 (CEST)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2Sf-0004vo-Ne
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gl-0003O6-5X
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:15 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gj-0000e3-Ed
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id bq9so10700834wrb.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=AqWJ7kyP/wVtcUkYapts2DpsBXihq1Vm9sATGZkmD9k=;
 b=prG89gNntB0BCQYooZY3fTpl6Lb5ZwuDlbjaHQbcLF8oef/rpFwfp723aI++JfSjXt
 sQVrygEW6/CCVrtMPTHLH2YmZ+L/toW0EiSmH20mpYfQNCoge9F0k/ZZSEUu5OkcddaC
 x/bY1jIKum2yHjch69cCMfPuWIgDZ0SnB3H0SoNZoh8rEtgNW3RFU7gOJnyM9TxR0FVK
 Oj162hIPUF3497VDa1dA+mt8UODFktJRdFAdTO5kA2uVqRCT6LDDOHhKrXzzJ6XvBpv/
 0OXbfZjZA4Ja38VxzbWLSulAncO3wHCkSW30FkxUxMsX+1ODYksKZlyw9qr4K1ShR34d
 NsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AqWJ7kyP/wVtcUkYapts2DpsBXihq1Vm9sATGZkmD9k=;
 b=ZfNsX1URGGj5JUmpM4sXvs4036YsgOSiUpjpn2abSPj5MwpXGK/9mFBSu7BKxLRbo8
 jXhL1JwhLDp69BaCFpop5zigD6jqWTeoH9engD6e99xa1q7iS3CICa4Xh/BSaUAMhxIs
 PC3a9NOe1dAuxNA3X51CVpDev7f/aVwdX7oKXfeUo+IlIfSiZPx8bxgYJd4ANXpgH8S8
 Qs7cUwbDsjtAJ4hqZA7qJLVADvzYXIQTb8VP5MxPvvOqkAe2no4CVI7RilJIsFMNwVAt
 EBbsSi5P4xH/cqZmXVSXMmW3VYia131rbpd4MsPnPPI2pXgR181yaBqtDdDgILYqJjkl
 07ew==
X-Gm-Message-State: ACrzQf1af6+SoolNDt8LYWOZRLDYcaYltT4OAgjPlK1PDivAK0LCJF+q
 yBEPEYpSZZizw2utyRLZk8yf4Q==
X-Google-Smtp-Source: AMsMyM41/V2WGeNTq4r6adjDZh9YvEvcN/JSX/CX7+lQ3esg8Mm+UShj0qT0DYj2IwB310x3YxVUCw==
X-Received: by 2002:a5d:6ace:0:b0:22a:f444:2ad3 with SMTP id
 u14-20020a5d6ace000000b0022af4442ad3mr12755536wrw.21.1663776491974; 
 Wed, 21 Sep 2022 09:08:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l30-20020a05600c1d1e00b003a601a1c2f7sm3779689wms.19.2022.09.21.09.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:08:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 707521FFBB;
 Wed, 21 Sep 2022 17:08:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v1 03/10] disas: use result of ->read_memory_func
Date: Wed, 21 Sep 2022 17:07:54 +0100
Message-Id: <20220921160801.1490125-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921160801.1490125-1-alex.bennee@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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


