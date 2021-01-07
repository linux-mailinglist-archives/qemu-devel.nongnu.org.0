Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E32EE6C4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:24:51 +0100 (CET)
Received: from localhost ([::1]:42686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbpy-0002jg-A9
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh4-0001KI-LW
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:38 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgz-0001bS-Lp
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:38 -0500
Received: by mail-pl1-x636.google.com with SMTP id t6so4170219plq.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=auqKLTOetMiwuISH+Sbvjoz4fFA/rmImExKpLxb7FCc=;
 b=eyd1B8QHv9BROyCIBnmHeHwuS5bMspQYRDiYxRzFjJOZ0PrF5uL4QDK8qR+WQKhIY/
 NQPVCy56wa/U3t/y1NWf8uVmFny87zi5ov/sOQ01PjrATxZqezJhD9UvLOSikDDUrPmm
 spDkVY0Ozraca7zMAeG9tTFrRO10PfjSvR+MXpSqNmYrukePU6lOSN1qs7I9DFgHH4lX
 5cBcf4aQoqa6fLvKJHUofIINGQLItIf/SBkP0aSo3QfnBGOd9mKUdC5D8Lme7K8Ulm/i
 oDuWJ0H54Ij/Qj9us1h6GjXNynFjnnF1x+1e+hyZrmh0ovMRD2FX4WDH0ChF03hfYU0P
 balg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=auqKLTOetMiwuISH+Sbvjoz4fFA/rmImExKpLxb7FCc=;
 b=tLFa6V8PM5XtDC53OCJHCk67khk4IkSygcc4pTUDH9qoOFNn58y2ApXTdil9TMc8P7
 YvEhfWox1JO8VChogJNCqDIADWIzMQIp/YobiIW4dfLn/1gMN3cqVIEMgL0nIVMA10BY
 YuJTmIPeBBKoXyTcY85nlD/TrNwHsr+8Qv37pDplaQ1uShV30GxSy+Vh7xuOrAV//BpK
 5YPGfFMPMwtyDBFcD4cz7FibPYF+KOHwLxrZodwrJNCahTgy5oMbK/bZGuE0MkBCX6z6
 05ZvFskPLZU7K9OLPRAFhaCuLYF+PrB6Bmd61loLIharXqaKLKTMlOddAyqNRjdvZO2l
 kEgQ==
X-Gm-Message-State: AOAM5328JGLfop41zv/SnpNGxm0M+DOAgoqKjoYnFxoABqFkJCu3mNG2
 4MRTQljZLvhA+6vuVe11amGIXU13x/DRYA==
X-Google-Smtp-Source: ABdhPJxJHr76QiPl7SKpc1T7UjD9y3AAs27QxvRF3ApJBjeP5RYdqbPUOPR8/RC7FHk6VjU82a2eHQ==
X-Received: by 2002:a17:902:b493:b029:dc:3e1d:4dda with SMTP id
 y19-20020a170902b493b02900dc3e1d4ddamr505176plr.48.1610050528011; 
 Thu, 07 Jan 2021 12:15:28 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/47] tcg: Use Error with alloc_code_gen_buffer
Date: Thu,  7 Jan 2021 10:14:21 -1000
Message-Id: <20210107201448.1152301-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Report better error messages than just "could not allocate".
Let alloc_code_gen_buffer set ctx->code_gen_buffer_size
and ctx->code_gen_buffer, and simply return bool.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 60 ++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index c0a3c60e1e..ae87b2342a 100644
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


