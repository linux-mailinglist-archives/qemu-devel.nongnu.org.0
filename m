Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE14336915
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:44:09 +0100 (CET)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9Qt-0002cU-Ue
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK961-00055r-0A
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:33 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95t-0001Pq-Qn
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:32 -0500
Received: by mail-ot1-x335.google.com with SMTP id t16so18306884ott.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1BgfY/6jI/TKptyf0FBvMEYPAxqK10dormoAkYPkBio=;
 b=b1F62nDdDGlbYclkdkVVFlSDiOliR98I7eGarI0on69ZRXsLxpQPZKaUYije5Yb/RU
 ncGs1ugLrjF32CPA9DyM8AiuXKsEwHH43JKBIGfJgrwFaCXJM5LV0iEI+EVPnBLZBF/n
 4gQWQEIwQze/QOpEhFVDEPtvai+L6tW7w7eFrtnGEP4O2nzJUjzxWspBb4AtrVQLiG/G
 IJLR22ILVdveSGq6gjx5OFgzMUB2UlpsJKyGlCgrDlLI7AfWygXEa9qodDNM2DqZz+kL
 P+rY4dBH3/0EcIxQ7bDE1qW4v1LyANw0V+uRCkNCMYcxFv4rT3Qm5Y3HmY0QveYu4pQa
 3kBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1BgfY/6jI/TKptyf0FBvMEYPAxqK10dormoAkYPkBio=;
 b=bvE1n9gQ9qMCxAiV5DiwMqZNvNVy5WTMHh0LX/lmiZZarIpLnLkfe+EAmtGzJjw3eh
 VGleL+GKrGHvxLyTwA6ckzy2uoj6sg96KAVpKEz3F8EPs23+ctT4wMGvmoBYItNhsHju
 GZvFDrfWAlzZ7ZDupBWSzoZbLTKcx1vkEGUd3NKBoZrQgg8ixCg3tOgm/RLflrw4/i0/
 AULZ6MdUSIueHkM5q9auuu4IDakAv9PrjtdpKXVRX/3Uref+sJTYTj1rBKMOezPrwnf4
 NGt+ADFCyNTpXjvbkYnntI4F5jFfwn8Q/VRyLpDhwE5SjYOMTpPXspRuEnSxUxGzh7NA
 7lcg==
X-Gm-Message-State: AOAM530xZg1eVVvM3L0EBbRjhv/hcgvkh6wtbgl62Z4CYs11rquoLRle
 7TU54TyGYgCtajQuUSg1eSmawtXgdnS2yh0S
X-Google-Smtp-Source: ABdhPJxd8Axh0dS2TBLTiNUdxxthy82losRvATRXYFPUyx4q7zuJ3rGw2jtPHsUp9FRHvtgeMw+4lQ==
X-Received: by 2002:a9d:129:: with SMTP id 38mr4699857otu.50.1615422144630;
 Wed, 10 Mar 2021 16:22:24 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/26] tcg: Return the map protection from
 alloc_code_gen_buffer
Date: Wed, 10 Mar 2021 18:21:51 -0600
Message-Id: <20210311002156.253711-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
index d7ad1be1f9..f25ec1ecad 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -485,14 +485,14 @@ static inline void split_cross_256mb(void **obuf, size_t *osize,
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
@@ -522,16 +522,17 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
 
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
@@ -544,11 +545,12 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 
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
 
@@ -556,7 +558,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
     if (buf == MAP_FAILED) {
         error_setg_errno(errp, errno,
                          "allocate %zu bytes for jit buffer", size);
-        return false;
+        return -1;
     }
 
 #ifdef __mips__
@@ -597,7 +599,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
 
     region.start_aligned = buf;
     region.total_size = size;
-    return true;
+    return prot;
 }
 
 #ifndef CONFIG_TCG_INTERPRETER
@@ -611,9 +613,9 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
 
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
@@ -647,7 +649,7 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     /* Request large pages for the buffer and the splitwx.  */
     qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
     qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
-    return true;
+    return PROT_READ | PROT_WRITE;
 
  fail_rx:
     error_setg_errno(errp, errno, "failed to map shared memory for execute");
@@ -661,7 +663,7 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     if (fd >= 0) {
         close(fd);
     }
-    return false;
+    return -1;
 }
 #endif /* CONFIG_POSIX */
 
@@ -680,7 +682,7 @@ extern kern_return_t mach_vm_remap(vm_map_t target_task,
                                    vm_prot_t *max_protection,
                                    vm_inherit_t inheritance);
 
-static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
+static int alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
 {
     kern_return_t ret;
     mach_vm_address_t buf_rw, buf_rx;
@@ -689,7 +691,7 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
     /* Map the read-write portion via normal anon memory. */
     if (!alloc_code_gen_buffer_anon(size, PROT_READ | PROT_WRITE,
                                     MAP_PRIVATE | MAP_ANONYMOUS, errp)) {
-        return false;
+        return -1;
     }
 
     buf_rw = region.start_aligned;
@@ -709,23 +711,23 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
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
@@ -736,24 +738,25 @@ static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
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
@@ -808,11 +811,11 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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


