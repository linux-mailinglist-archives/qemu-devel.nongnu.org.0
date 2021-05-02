Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD22370FD7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:30:54 +0200 (CEST)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLY5-0006wE-HQ
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMi-0008Mu-J7
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:10 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMe-0002yN-LZ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:08 -0400
Received: by mail-pj1-x1036.google.com with SMTP id g24so1267078pji.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rkNhDFMpzVMqKVs5NC0YHsxzFdT5b1jVWnnYqeqC2n0=;
 b=B4CvX3zNFbMW2uvHf3jmOJ7/6REpFl1rwAx9MrwKWrqCImJQIcntcqPZIA6cILLDNh
 5644J/TKEFYkR3Pqo+NwQgM+dIrvw0y96BHGsZwk+OSqLfQySqm857gvPbUtNSjfEi0q
 p2GnWsBfkuvZgIv2Az6Wv4OXczmMuptOP6byoabLnTwH8dOj829gBE9hqswou9YuTkTc
 Tw8ZVIsDaMTtXHHoOnO/B94p+09Vkls7JoNRF7KMYRB+1PbuYrpBtWJka+BQYLnI+nOC
 /uhTno5+HKieWiHmocaIxwNLl7MYTKvETk5lEP/UMcqcImYbV6aLelk1oyc9WxIjyLlz
 33uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkNhDFMpzVMqKVs5NC0YHsxzFdT5b1jVWnnYqeqC2n0=;
 b=FD3z3zHo4PeDk5cAxFusUKVQH3uY6CFOWOEYXIyVeugrXUeckH9I+Bf4dvILZO1URq
 JbRWsACTIXoO7+IO0ijuaY21MI2+fg4tOXYvTcGUDN4j7mKVnhY/hIe9JtdhTL5yMfp2
 uxDRMnEAjkmtCv1vwgILrLVbVXrEF0anivXZVtwff2dQnLYDw7sIebindSfuIvoCoL+O
 4aupnkpBVri8mOJkAgM/wM/OIEWHLR1qq8FJfn2LKFyVfMWBbLws84uGuCwFnjknYcuX
 27VrO6cAC1rSqSGskExK5dvnK8V7dob81PhOOh07jOZMmwgVBMwHYADzXeYIqNQdCwjw
 AzWA==
X-Gm-Message-State: AOAM530oVrS7cHU2xlhWTLwGwB7mxcAaHXTpviXU0XxZXkTRROspLKOz
 WARUYb9BKOEgleLMNXOqiRogD231kZq29g==
X-Google-Smtp-Source: ABdhPJxjdj4rC4a29W3+rpdsrmsbBU6fkSMYONxdEAKyoqxBRYmFmaJHjm7oL7ZTEdQw3fE/MAVhdw==
X-Received: by 2002:a17:90b:e95:: with SMTP id
 fv21mr17884837pjb.107.1619997542545; 
 Sun, 02 May 2021 16:19:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.19.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:19:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/28] tcg: Return the map protection from
 alloc_code_gen_buffer
Date: Sun,  2 May 2021 16:18:38 -0700
Message-Id: <20210502231844.1977630-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index d6499f7d98..23fe113750 100644
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
@@ -843,11 +846,11 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     size_t page_size;
     size_t region_size;
     size_t i;
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


