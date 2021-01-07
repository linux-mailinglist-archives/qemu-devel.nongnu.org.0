Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC8F2EE6C9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:26:16 +0100 (CET)
Received: from localhost ([::1]:48020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbrM-0004ta-1m
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbge-0000ye-PB
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:12 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgc-0001T8-Es
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:12 -0500
Received: by mail-pj1-x102c.google.com with SMTP id u4so2765720pjn.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cwIe7ehFV7zcthsYPXS8JZ/YxLeGaqAzHfZida8viS0=;
 b=BB4dVPFlsC8jiyq2dUGboLfeL+get6+FqSXYbV8Vp981IzDYotCf04i3gMKDuCCKg0
 OSZoQyY0Gk5Drfbo4sAW40I/rDwOY1xSu5R3tYX+rawbfPsBcloIHkrHAe+eMl+5qTWf
 cAz4PIed9GXExURqY+Gw2CMg0FX6EARJkxR74rtdPJsYoFhTC+0Yls+pLW2MMzAHibdb
 NUT0JuaDeaEhQ8KnvwoT6Jve6HE1FXPAeJMb0szxbvmjo0U4L2TlaRwvejMSyEdcALpu
 VfiZkYovLVgZGp6hzIcCS3e91QLTHINEu1JILprfTeinTSgCv5G3WavXMZaTXaFc9R/0
 Zv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cwIe7ehFV7zcthsYPXS8JZ/YxLeGaqAzHfZida8viS0=;
 b=XwI8MWAZfOWR6fvM4Wv/l0zSZsHsXtz4ZUdTqpx0Om+k2AOKJASeF+bqUtqlzwLk9I
 RGTGGG3KyaSZAAduWFQSpw76v2FbzYdjeHaqNPBfw1HxI0L+UbNveC55kxKBlUvFDytc
 zgnzMVUyQ3RGLPOg4WbYNvsIuX8jN0UZ0Kt3zOz/ZJ/zsp1npiIWCwOQugJlmYlUWziX
 Dquf7izhu5xpXBE6w3O7OxcdGMHWP8vUHxmJLViCCAQcwsdxYpwJ4zZRnH3hDsZtBJlm
 LBGmnGVnuEHm49lhu93l8jfmtTNCiwKho1IcKEsL6uDaQA3qMPmFozyJvH9mc4tsgpsM
 ufMg==
X-Gm-Message-State: AOAM5313g6sdy3EgWwDVUJOpGeeFZZMTyA6WQahMx2OMaIR3wN7Pt0iy
 wDUGhaVZnI/UwoIdRn/VjJTu2J1twDHOLw==
X-Google-Smtp-Source: ABdhPJyLPSz5Q9Hg64pB5QFqaruCep+bNTGI4h9sg9dKb9ogzbQV0EX7utuGEx+Ie5nOgcFPVV7H7g==
X-Received: by 2002:a17:902:6b02:b029:da:c6c0:d650 with SMTP id
 o2-20020a1709026b02b02900dac6c0d650mr490444plk.74.1610050508781; 
 Thu, 07 Jan 2021 12:15:08 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/47] tcg: Move tcg prologue pointer out of TCGContext
Date: Thu,  7 Jan 2021 10:14:10 -1000
Message-Id: <20210107201448.1152301-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
 tcg/tci.c         | 4 ++--
 3 files changed, 14 insertions(+), 8 deletions(-)

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
index 5d97b7c71c..cf0440445d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -481,9 +481,9 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
  * One possible operation in the pseudo code is a call to binary code.
  * Therefore, disable CFI checks in the interpreter function
  */
-QEMU_DISABLE_CFI
-uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
+uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env, void *v_tb_ptr)
 {
+    uint8_t *tb_ptr = v_tb_ptr;
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     long tcg_temps[CPU_TEMP_BUF_NLONGS];
     uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
-- 
2.25.1


