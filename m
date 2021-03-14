Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846333A844
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:38:15 +0100 (CET)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYRC-0001WR-7C
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHF-0006IO-Dk
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:57 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:40077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH9-0008I2-Up
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:57 -0400
Received: by mail-qk1-x729.google.com with SMTP id l132so29919835qke.7
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YV8ZNMURZZ3L0f8Vp87koNwJMeD7v42xnjMnrSbn74s=;
 b=G/GKf+jyTtrCb5jZ/WK4pjpQvUY2h+fSYS8bgspdsQ4WTmcyBPk5un0d26TiKoevlr
 pUo+2uhOMxy652NJ3qV7SBu9G5NQBSrDormieg71n6+L1n/mFdwzbwdjX7kFVjuB5dg/
 L1edFEZIdcTo2F2dvG1Z+li6g44Ce8YyM4Xu13mAwZlhuA0XXxD8eaKlIxm8Sw0RfsGC
 sJK8rJ3g2GYR6QFrjk8OSEMjo6fbXrVQ9fDvkbI2HKaXrFVuA+1ivZXycc2cZOayLJLE
 r3cgVTt8weZOjGLUSItsCKc5n9JYVQEBglLHYYv0uovMF3qhT3lJh3PN0j0lKJ8DdFOR
 I9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YV8ZNMURZZ3L0f8Vp87koNwJMeD7v42xnjMnrSbn74s=;
 b=Rt3l3ZEAGr0ZrEJPstWYbcU9MmbLNbFT6fgO1BVEciqWuBXO75TCP3UVzyA2lOMEBb
 pVFsBBl+hJCfWOLZRzq2z1tD8t/f3K9BX033pnWDaENdKHjgmfQdTUCVw4JTTCCXE6TU
 wh4Cu9OsJ4Q0XyzWyiF4M5VBDPhzwZYv7q6ED8mKEikdNJ7cnM6YQ+i76Cjbd2iP/aGS
 ohe18tZMtmjbe+Ljdmyr9xsWUlLfN734ytButPLxVFB2N9yAiC5rEAxlYSiKperrFJvf
 3ts/0cZlMhxCwG+QzHR/O9N1/lyYoT+CbJHGZ126v3xQEmk4/TvfY9WbOpKrN6S8STU4
 GBIg==
X-Gm-Message-State: AOAM530HgSX0ERkBeYrsXlmhUDm77IL88eI3NkOgBdWBMI2jWrLxqOv/
 wVkXmS81o9GJsR5Pn0FN1jkRWOp+aY1Qhlyy
X-Google-Smtp-Source: ABdhPJyzEdSlF7dxnX6MWk2lgAIzR0CeEuJ0gVSjOqjdPmjqBrbE5zpIeZ0bxBUH2JvR7ioPi5xYFg==
X-Received: by 2002:a05:620a:9c6:: with SMTP id
 y6mr22722924qky.39.1615757270982; 
 Sun, 14 Mar 2021 14:27:50 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/29] tcg: Return the map protection from
 alloc_code_gen_buffer
Date: Sun, 14 Mar 2021 15:27:17 -0600
Message-Id: <20210314212724.1917075-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the interface from a boolean error indication to a
negative error vs a non-negative protection.  For the moment
this is only interface change, not making use of the new data.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 63 +++++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 9a2b014838..3ca0d01fa4 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -521,14 +521,14 @@ static inline void split_cross_256mb(void **obuf, size_t *osize,
 static uint8_t static_code_gen_buffer[DEFAULT_CODE_GEN_BUFFER_SIZE]
     __attribute__((aligned(CODE_GEN_ALIGN)));
 
-static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
+static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
 {
     void *buf, *end;
     size_t size;
 
     if (splitwx > 0) {
         error_setg(errp, "jit split-wx not supported");
-        return false;
+        return -1;
     }
 
     /* page-align the beginning and end of the buffer */
@@ -558,16 +558,17 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
 
     region.start_aligned = buf;
     region.total_size = size;
-    return true;
+
+    return PROT_READ | PROT_WRITE;
 }
 #elif defined(_WIN32)
-static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
+static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 {
     void *buf;
 
     if (splitwx > 0) {
         error_setg(errp, "jit split-wx not supported");
-        return false;
+        return -1;
     }
 
     buf = VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
@@ -580,11 +581,12 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 
     region.start_aligned = buf;
     region.total_size = size;
-    return true;
+
+    return PAGE_READ | PAGE_WRITE | PAGE_EXEC;
 }
 #else
-static bool alloc_code_gen_buffer_anon(size_t size, int prot,
-                                       int flags, Error **errp)
+static int alloc_code_gen_buffer_anon(size_t size, int prot,
+                                      int flags, Error **errp)
 {
     void *buf;
 
@@ -592,7 +594,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
     if (buf == MAP_FAILED) {
         error_setg_errno(errp, errno,
                          "allocate %zu bytes for jit buffer", size);
-        return false;
+        return -1;
     }
 
 #ifdef __mips__
@@ -633,7 +635,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
 
     region.start_aligned = buf;
     region.total_size = size;
-    return true;
+    return prot;
 }
 
 #ifndef CONFIG_TCG_INTERPRETER
@@ -647,9 +649,9 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
 
 #ifdef __mips__
     /* Find space for the RX mapping, vs the 256MiB regions. */
-    if (!alloc_code_gen_buffer_anon(size, PROT_NONE,
-                                    MAP_PRIVATE | MAP_ANONYMOUS |
-                                    MAP_NORESERVE, errp)) {
+    if (alloc_code_gen_buffer_anon(size, PROT_NONE,
+                                   MAP_PRIVATE | MAP_ANONYMOUS |
+                                   MAP_NORESERVE, errp) < 0) {
         return false;
     }
     /* The size of the mapping may have been adjusted. */
@@ -683,7 +685,7 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     /* Request large pages for the buffer and the splitwx.  */
     qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
     qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
-    return true;
+    return PROT_READ | PROT_WRITE;
 
  fail_rx:
     error_setg_errno(errp, errno, "failed to map shared memory for execute");
@@ -697,7 +699,7 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     if (fd >= 0) {
         close(fd);
     }
-    return false;
+    return -1;
 }
 #endif /* CONFIG_POSIX */
 
@@ -716,7 +718,7 @@ extern kern_return_t mach_vm_remap(vm_map_t target_task,
                                    vm_prot_t *max_protection,
                                    vm_inherit_t inheritance);
 
-static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
+static int alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
 {
     kern_return_t ret;
     mach_vm_address_t buf_rw, buf_rx;
@@ -725,7 +727,7 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
     /* Map the read-write portion via normal anon memory. */
     if (!alloc_code_gen_buffer_anon(size, PROT_READ | PROT_WRITE,
                                     MAP_PRIVATE | MAP_ANONYMOUS, errp)) {
-        return false;
+        return -1;
     }
 
     buf_rw = region.start_aligned;
@@ -745,23 +747,23 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
         /* TODO: Convert "ret" to a human readable error message. */
         error_setg(errp, "vm_remap for jit splitwx failed");
         munmap((void *)buf_rw, size);
-        return false;
+        return -1;
     }
 
     if (mprotect((void *)buf_rx, size, PROT_READ | PROT_EXEC) != 0) {
         error_setg_errno(errp, errno, "mprotect for jit splitwx");
         munmap((void *)buf_rx, size);
         munmap((void *)buf_rw, size);
-        return false;
+        return -1;
     }
 
     tcg_splitwx_diff = buf_rx - buf_rw;
-    return true;
+    return PROT_READ | PROT_WRITE;
 }
 #endif /* CONFIG_DARWIN */
 #endif /* CONFIG_TCG_INTERPRETER */
 
-static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
+static int alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
 {
 #ifndef CONFIG_TCG_INTERPRETER
 # ifdef CONFIG_DARWIN
@@ -772,24 +774,25 @@ static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
 # endif
 #endif
     error_setg(errp, "jit split-wx not supported");
-    return false;
+    return -1;
 }
 
-static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
+static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 {
     ERRP_GUARD();
     int prot, flags;
 
     if (splitwx) {
-        if (alloc_code_gen_buffer_splitwx(size, errp)) {
-            return true;
+        prot = alloc_code_gen_buffer_splitwx(size, errp);
+        if (prot >= 0) {
+            return prot;
         }
         /*
          * If splitwx force-on (1), fail;
          * if splitwx default-on (-1), fall through to splitwx off.
          */
         if (splitwx > 0) {
-            return false;
+            return -1;
         }
         error_free_or_abort(errp);
     }
@@ -844,11 +847,11 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     size_t region_size;
     size_t i;
     uintptr_t splitwx_diff;
-    bool ok;
+    int have_prot;
 
-    ok = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
-                               splitwx, &error_fatal);
-    assert(ok);
+    have_prot = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
+                                      splitwx, &error_fatal);
+    assert(have_prot >= 0);
 
     /*
      * Make region_size a multiple of page_size, using aligned as the start.
-- 
2.25.1


