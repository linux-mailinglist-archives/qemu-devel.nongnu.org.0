Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F58E2EB1A0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:42:37 +0100 (CET)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqLs-0005WZ-6Z
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0C-0002HJ-4m
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:12 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq08-0006RS-Mb
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:11 -0500
Received: by mail-pj1-x1033.google.com with SMTP id hk16so14008pjb.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mbF8LIbJA/srkkxrRGCDeXCnJ4tQUbtm6VJdqasFFJw=;
 b=WVxRkvkEGvR0qY76Ju005kH4wDsMZ9OQ2Vx2WXLLv9cEnERuyRKwUff5sJYaDfAv53
 eYxe8KUUgYuGYRhKkYumPAqLqHDGgldWkBc10xA0uFE1RaYvgjdS6dFwKoIAHBguJ6aX
 tPw1Dy0W2/c711y6l9aJ7Xc0+O41JhgI4YndsHx7RF1M+zCSHe1QkJFfrFPuIfb/N1QN
 NHrEL6l+cr8jA6tXpuYAZmIvIrMh3JOhJJsIqr3ZyMFkjFXR6b4MMXIuzrKyxd9CZkkF
 ibdE2gH7bpB4i/bIzCLws0RgfO/BXfWmX0y+LrrBjpiayi9igZWghXygjfnlatnM9fUM
 TSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mbF8LIbJA/srkkxrRGCDeXCnJ4tQUbtm6VJdqasFFJw=;
 b=O7DOJAnJxyIzFLOMRTIALmjsgrYG+xQQFqVWhigjEw4ftXDJ406heoC2GW8syQVbiN
 3nG3QDhT1zlBI7SQrQJEYA4HPjTsrwLjddDiVxdmMfdwmtiLNIzidzD1ShDwy+G3JnUe
 FndEt076XIRnSKR1UY0JFB2vV9iNGrYqYN4d+otuYEVZjlEQgE9QvaZnGJg5z4k24AZr
 3gYsE6nnGdGppX98gVMQBwH8s6suhPYU6t4gu8VapIed8s/ftgpCiytOYMfd6aJlEQU5
 UAEeYrs5wF5t1hBd1bgk2gEacRgf/pOozmUI32vV4V0qRau8Ea/wJjx3Q6h1v2jSjkWP
 pwvA==
X-Gm-Message-State: AOAM532eF/Vs9KB8TbQkhaWeYMaHMTaSeE9ZphJPbXN6Y/owQEyvkEdp
 9R5L0sUpjGbgyQTNeo4ZD4x6WOz66WCDsg==
X-Google-Smtp-Source: ABdhPJwWAJdWJHfa+wgUTxA+acTco8GojTOB5sjtlWyZkRrC87vsGiJ9lIWUifbFyS+6XT8YqVuuWw==
X-Received: by 2002:a17:90b:346:: with SMTP id
 fh6mr214455pjb.225.1609867206392; 
 Tue, 05 Jan 2021 09:20:06 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/43] tcg: Move tcg prologue pointer out of TCGContext
Date: Tue,  5 Jan 2021 07:19:12 -1000
Message-Id: <20210105171950.415486-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is constant across all thread-local copies of TCGContext,
so we might as well move it out of thread-local storage.

Use the correct function pointer type, and name the variable
tcg_qemu_tb_exec, which means that we are able to remove the
macro that does the casting.

Replace HAVE_TCG_QEMU_TB_EXEC with CONFIG_TCG_INTERPRETER,
as this is somewhat clearer in intent.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 9 ++++-----
 tcg/tcg.c         | 9 ++++++++-
 tcg/tci.c         | 3 ++-
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8ff9dad4ef..9cc412f90c 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -621,7 +621,6 @@ struct TCGContext {
        here, because there's too much arithmetic throughout that relies
        on addition and subtraction working on bytes.  Rely on the GCC
        extension that allows arithmetic on void*.  */
-    void *code_gen_prologue;
     void *code_gen_epilogue;
     void *code_gen_buffer;
     size_t code_gen_buffer_size;
@@ -1222,11 +1221,11 @@ static inline unsigned get_mmuidx(TCGMemOpIdx oi)
 #define TB_EXIT_IDXMAX    1
 #define TB_EXIT_REQUESTED 3
 
-#ifdef HAVE_TCG_QEMU_TB_EXEC
-uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr);
+#ifdef CONFIG_TCG_INTERPRETER
+uintptr_t tcg_qemu_tb_exec(CPUArchState *env, void *tb_ptr);
 #else
-# define tcg_qemu_tb_exec(env, tb_ptr) \
-    ((uintptr_t (*)(void *, void *))tcg_ctx->code_gen_prologue)(env, tb_ptr)
+typedef uintptr_t tcg_prologue_fn(CPUArchState *env, void *tb_ptr);
+extern tcg_prologue_fn *tcg_qemu_tb_exec;
 #endif
 
 void tcg_register_jit(void *buf, size_t buf_size);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 759a41d848..b686cc9ba8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -162,6 +162,10 @@ static TCGContext **tcg_ctxs;
 static unsigned int n_tcg_ctxs;
 TCGv_env cpu_env = 0;
 
+#ifndef CONFIG_TCG_INTERPRETER
+tcg_prologue_fn *tcg_qemu_tb_exec;
+#endif
+
 struct tcg_region_tree {
     QemuMutex lock;
     GTree *tree;
@@ -1055,7 +1059,10 @@ void tcg_prologue_init(TCGContext *s)
     s->code_ptr = buf0;
     s->code_buf = buf0;
     s->data_gen_ptr = NULL;
-    s->code_gen_prologue = buf0;
+
+#ifndef CONFIG_TCG_INTERPRETER
+    tcg_qemu_tb_exec = (tcg_prologue_fn *)buf0;
+#endif
 
     /* Compute a high-water mark, at which we voluntarily flush the buffer
        and start over.  The size here is arbitrary, significantly larger
diff --git a/tcg/tci.c b/tcg/tci.c
index 82039fd163..d996eb7cf8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -475,8 +475,9 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 #endif
 
 /* Interpret pseudo code in tb. */
-uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
+uintptr_t tcg_qemu_tb_exec(CPUArchState *env, void *v_tb_ptr)
 {
+    uint8_t *tb_ptr = v_tb_ptr;
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     long tcg_temps[CPU_TEMP_BUF_NLONGS];
     uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
-- 
2.25.1


