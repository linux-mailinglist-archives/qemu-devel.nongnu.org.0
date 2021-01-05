Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFFF2EB1E0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:57:36 +0100 (CET)
Received: from localhost ([::1]:58438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqaN-0000zg-NE
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0W-0002Nd-1e
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:32 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0Q-0006ap-Bj
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:31 -0500
Received: by mail-pl1-x62a.google.com with SMTP id b8so77403plx.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GOc/QdYClClYlMp2dKbUVjQGtFUnV184hz1wUbaQM2s=;
 b=E8HzXHV0hUWHkYw2rZ10TU4XOaQQx1E0CtiGqek0mN4dRfx5Ncvv++NuFmiAsf5poQ
 rRPxqCErNAiqesQxr58Fri0+sFX6IdmEK/0hCV6LjCsLbQes31bYn+nB2iEsssWaGDzS
 4LAtOTDaoBp7yP+DxdA27cMIBppP19Opeibo1/t/eoft4zquMJ3jJBUmIXK3u0mKgKqo
 d3g2VwgyGDuDjphWGLqs5CChCSgLeUriSPbLU50H0AdCX8w+26ePU68YnhnT+pSvVmTw
 WN1TdyYl+iVqcQO7KDBV+HKLout8CXGN0XH0qW8UYvmdv1vsYCOGAoLgvyNy7l9pPMiw
 PfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GOc/QdYClClYlMp2dKbUVjQGtFUnV184hz1wUbaQM2s=;
 b=NsknMu7hrsa0cAsde/fP+f4gdBXHjakFPrkqeNmlpQsJmPiLhnGAT2Aynlp5bIJ3pW
 y/fkw6GDD956jqgwZX7KYL9nLxIhhPYhfIMdVPuh9FMRxLIwL/REF11zfu0SykUxn2vp
 rDDAJuPSG+E8OYvLNmQR6h4qbaXNCHMJ+Ic63hIgAW994drn/pz9D4yOExyGGbga9tlx
 HjnOivHX5ArTd7gg5E9TGY9GAhI0X0hvaRfTPDlk1l8VAmb+hiW0KCs9cDC5bj1QleEj
 oBWZmGhoPzpCmNf8bgzYROUSHQTj11ZYqpxM6T+llL6oPAtbO7ytPNrPSD6hYr1rvVGE
 N7wg==
X-Gm-Message-State: AOAM532Rjbc4nfLBK1txBgtoG192iKp6Cf06/7M2cFRcobartGYMIVpc
 rc/2jyOI+KmDQnUxi1y6PTP2OEq0kLf/6g==
X-Google-Smtp-Source: ABdhPJzlVLMnoZ0bi+N9XNwXjZhT+AbHAmMOASDFLXHKjxpxovXTqVzb4utlFqLo08446pGG9Hm5Cw==
X-Received: by 2002:a17:902:7242:b029:db:d1ae:46bb with SMTP id
 c2-20020a1709027242b02900dbd1ae46bbmr313961pll.77.1609867224667; 
 Tue, 05 Jan 2021 09:20:24 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/43] tcg: Use Error with alloc_code_gen_buffer
Date: Tue,  5 Jan 2021 07:19:23 -1000
Message-Id: <20210105171950.415486-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Report better error messages than just "could not allocate".
Let alloc_code_gen_buffer set ctx->code_gen_buffer_size
and ctx->code_gen_buffer, and simply return bool.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 60 ++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 224821943b..77444ddbbd 100644
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


