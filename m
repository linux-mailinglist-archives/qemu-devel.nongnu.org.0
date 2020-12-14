Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201F2D9992
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:17:23 +0100 (CET)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koofB-0000YB-TV
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS8-0001kk-0U
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:52 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS4-0003wu-JM
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:51 -0500
Received: by mail-oi1-x242.google.com with SMTP id s2so19254654oij.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8YnkrBigavL+C33hr6dUiCjy8qumFXs3cayqbgFA/m8=;
 b=CT+yeYsnvginptyE3WVoVo0SHwqFa5whSBzHw86hEMbC6c02hUKxrQVR6942Rkv+F8
 mkOCEf+zWLQjE+wOmCV+s4qLZrnKC/y+JTdD8j2RHTE2JnxT1RGWFeWmDdKzW/kX3zj9
 OaDRbIpMa7YWLorgkRAOg/0B171aSuuXDkeARKHTU6Iqt7pbXn9zrhbJGq/rlb7P4S+Z
 II2msth3+unFt5XXu4YDhBPe6hfp5TaeNgVosK+BeXA/MX6HzFeuqxZSy2OzCZ9lDyxA
 yWu2hHmAG2Ah/3dE2YIhsj8mrZJBd+AJsx7l3ApVJlEeGGbC+eHVSitgO9/K6vw7MYx2
 FNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8YnkrBigavL+C33hr6dUiCjy8qumFXs3cayqbgFA/m8=;
 b=OV47ODbKfBQdmM/vaOf5fNR/hvrvNZqTa2+ZT1SfD00mWSo6a+xl7bdHZRpR2GXd26
 kt1Tz2Ed2T6cEuQ2sCk62J8V0B4Qm553XENWdTL26eY2wnrTySTNPx6722SoKlch0Mg7
 GOQGUqOw+j87uvGHJLS00Wk0lZMjlhoJhqJvRWlRxfG7vNMjBxZHCxTduKg+JeW+txCw
 MeUAOYXgJvkWGGhoCwul1/4epjrY8DO+leKfZP/kuvp+Ec4BbXQhS2mXKNMkM5L1pH0R
 Ej/EkUjk0eHpTUWEKTXOI8xEgl82RtM1h1eE4TIp8FYEhyy30/aqxBWECh7T2PbrRf5F
 R7aQ==
X-Gm-Message-State: AOAM531qsdHoQhNL04SpAYq9OMeperU3R1Pks3I8EMwpZ4GpL9C8NQ7X
 lFGSBitx+BOPSWp2wysL+G0BmxQasUvAma3i
X-Google-Smtp-Source: ABdhPJzH3M5GIdyviBLiLZTlCXiOvMLH2YHG/KqI6Y0EZ4rcelR06OOcCT5MRZaeL5+EJON5KzAIMg==
X-Received: by 2002:aca:4fd6:: with SMTP id d205mr17790207oib.34.1607954625529; 
 Mon, 14 Dec 2020 06:03:45 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/43] tcg: Use Error with alloc_code_gen_buffer
Date: Mon, 14 Dec 2020 08:02:47 -0600
Message-Id: <20201214140314.18544-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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

Report better error messages than just "could not allocate".
Let alloc_code_gen_buffer set ctx->code_gen_buffer_size
and ctx->code_gen_buffer, and simply return bool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 60 ++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 7b85ddacd2..2824b3e387 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -59,6 +59,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/tcg.h"
+#include "qapi/error.h"
 
 /* #define DEBUG_TB_INVALIDATE */
 /* #define DEBUG_TB_FLUSH */
@@ -963,7 +964,7 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
   (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
    ? DEFAULT_CODE_GEN_BUFFER_SIZE_1 : MAX_CODE_GEN_BUFFER_SIZE)
 
-static inline size_t size_code_gen_buffer(size_t tb_size)
+static size_t size_code_gen_buffer(size_t tb_size)
 {
     /* Size the buffer.  */
     if (tb_size == 0) {
@@ -1014,7 +1015,7 @@ static inline void *split_cross_256mb(void *buf1, size_t size1)
 static uint8_t static_code_gen_buffer[DEFAULT_CODE_GEN_BUFFER_SIZE]
     __attribute__((aligned(CODE_GEN_ALIGN)));
 
-static inline void *alloc_code_gen_buffer(void)
+static bool alloc_code_gen_buffer(size_t tb_size, Error **errp)
 {
     void *buf = static_code_gen_buffer;
     void *end = static_code_gen_buffer + sizeof(static_code_gen_buffer);
@@ -1027,9 +1028,8 @@ static inline void *alloc_code_gen_buffer(void)
     size = end - buf;
 
     /* Honor a command-line option limiting the size of the buffer.  */
-    if (size > tcg_ctx->code_gen_buffer_size) {
-        size = QEMU_ALIGN_DOWN(tcg_ctx->code_gen_buffer_size,
-                               qemu_real_host_page_size);
+    if (size > tb_size) {
+        size = QEMU_ALIGN_DOWN(tb_size, qemu_real_host_page_size);
     }
     tcg_ctx->code_gen_buffer_size = size;
 
@@ -1041,31 +1041,43 @@ static inline void *alloc_code_gen_buffer(void)
 #endif
 
     if (qemu_mprotect_rwx(buf, size)) {
-        abort();
+        error_setg_errno(errp, errno, "mprotect of jit buffer");
+        return false;
     }
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
-    return buf;
+    tcg_ctx->code_gen_buffer = buf;
+    return true;
 }
 #elif defined(_WIN32)
-static inline void *alloc_code_gen_buffer(void)
+static bool alloc_code_gen_buffer(size_t size, Error **errp)
 {
-    size_t size = tcg_ctx->code_gen_buffer_size;
-    return VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
-                        PAGE_EXECUTE_READWRITE);
+    void *buf = VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
+                             PAGE_EXECUTE_READWRITE);
+    if (buf == NULL) {
+        error_setg_win32(errp, GetLastError(),
+                         "allocate %zu bytes for jit buffer", size);
+        return false;
+    }
+
+    tcg_ctx->code_gen_buffer = buf;
+    tcg_ctx->code_gen_buffer_size = size;
+    return true;
 }
 #else
-static inline void *alloc_code_gen_buffer(void)
+static bool alloc_code_gen_buffer(size_t size, Error **errp)
 {
     int prot = PROT_WRITE | PROT_READ | PROT_EXEC;
     int flags = MAP_PRIVATE | MAP_ANONYMOUS;
-    size_t size = tcg_ctx->code_gen_buffer_size;
     void *buf;
 
     buf = mmap(NULL, size, prot, flags, -1, 0);
     if (buf == MAP_FAILED) {
-        return NULL;
+        error_setg_errno(errp, errno,
+                         "allocate %zu bytes for jit buffer", size);
+        return false;
     }
+    tcg_ctx->code_gen_buffer_size = size;
 
 #ifdef __mips__
     if (cross_256mb(buf, size)) {
@@ -1104,20 +1116,11 @@ static inline void *alloc_code_gen_buffer(void)
     /* Request large pages for the buffer.  */
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
-    return buf;
+    tcg_ctx->code_gen_buffer = buf;
+    return true;
 }
 #endif /* USE_STATIC_CODE_GEN_BUFFER, WIN32, POSIX */
 
-static inline void code_gen_alloc(size_t tb_size)
-{
-    tcg_ctx->code_gen_buffer_size = size_code_gen_buffer(tb_size);
-    tcg_ctx->code_gen_buffer = alloc_code_gen_buffer();
-    if (tcg_ctx->code_gen_buffer == NULL) {
-        fprintf(stderr, "Could not allocate dynamic translator buffer\n");
-        exit(1);
-    }
-}
-
 static bool tb_cmp(const void *ap, const void *bp)
 {
     const TranslationBlock *a = ap;
@@ -1144,11 +1147,16 @@ static void tb_htable_init(void)
    size. */
 void tcg_exec_init(unsigned long tb_size)
 {
+    bool ok;
+
     tcg_allowed = true;
     cpu_gen_init();
     page_init();
     tb_htable_init();
-    code_gen_alloc(tb_size);
+
+    ok = alloc_code_gen_buffer(size_code_gen_buffer(tb_size), &error_fatal);
+    assert(ok);
+
 #if defined(CONFIG_SOFTMMU)
     /* There's no guest base to take into account, so go ahead and
        initialize the prologue now.  */
-- 
2.25.1


