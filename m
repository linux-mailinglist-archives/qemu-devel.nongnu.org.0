Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7E412BC4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:32:33 +0200 (CEST)
Received: from localhost ([::1]:51020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVaC-00024n-T6
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTe-0005cZ-1r
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:46 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTZ-0006G2-7i
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:44 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w11so2822851plz.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 19:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sx9OxIFdY4NzqELX94oh/fd9umRX24uKGyg1w/4NOWY=;
 b=W4ia7N9/nMd8n4QGsBSHGjXueGIRm0W5pnzrPSfMO/yHUj0POKixXtJXZbR4cbjcWQ
 /+9loy7Zyvy5Gj5lsNHNbyM8OiAaiYa3Tu5ji1TGKZ0UcaWXhRsbycJUsTLjK4YmUjZW
 9UngvPYih68cEBVxwZQi7uOwmVGvIkLe8qhz3utew7HjJAt+mmSlffzhOVBUu/bb/sid
 IxYfdg2ucXwDfMzUetgOx+swEZ7NsiSZFpOxqEYy5EryPKV1CB+6axXSvBHxvkeH4Gnn
 /LrXRGfY1jGTYFbEKxz85jqxGYSo+otQOYO99jWZfektYj2b1SupCGTzmHhfjSHGezLa
 eZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sx9OxIFdY4NzqELX94oh/fd9umRX24uKGyg1w/4NOWY=;
 b=6UgaqSr8Lh19NLC+WlCdHJc1nlgO9iaUTkQkDLjxMGHjfwf7gEmXY5VaSJbPG3kQcT
 cWKQ2rvAoqBeMAlrOFVo31c2jvVnysJSyw8IO0xXoIFfjGF+Ha52pblnJ6DvPwRCGryt
 KqN68IVM+QSU6uwtYNFntzRZJ7l49U+xNA0/x3wERbI63aQoVPRVsuOasNHdcXsVQCQz
 F/aeVoEWRYEmH6Paek59r5PAnSChoAPgmuIvV+fsikjxKlMs2gtk5GNJzUipQ6+GJMNb
 X0OO4N00DfNAejNbn6V8wMPhp3faT11g5KDR4tmNPnw8CP8VGDE/9eCMgFKFFzDg7bGJ
 IKcQ==
X-Gm-Message-State: AOAM530nWkBZ3atMzkYeuuZKx7DyYOquemoMdx6OOatHlD0AgQCc9sb9
 BDYY+rXDz7I8IAYc06GI/4bHyRI9U0CuCA==
X-Google-Smtp-Source: ABdhPJxXO1Mx8W2VUgXfNoZNfW/UWhitqoFnFYNn9/pTI6RRPkufZLn/hy2l39tEFy0KMf2vAHnTpA==
X-Received: by 2002:a17:90a:e547:: with SMTP id
 ei7mr2500575pjb.177.1632191139951; 
 Mon, 20 Sep 2021 19:25:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n9sm15297621pff.37.2021.09.20.19.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 19:25:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] tcg/mips: Unset TCG_TARGET_HAS_direct_jump
Date: Mon, 20 Sep 2021 19:25:29 -0700
Message-Id: <20210921022534.365291-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921022534.365291-1-richard.henderson@linaro.org>
References: <20210921022534.365291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only use indirect jumps.  Finish weaning away from the
unique alignment requirements for code_gen_buffer.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     | 12 +++++-------
 tcg/mips/tcg-target.c.inc | 23 +++++------------------
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 3a62055f04..c366fdf74b 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -39,11 +39,7 @@
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
 #define TCG_TARGET_NB_REGS 32
 
-/*
- * We have a 256MB branch region, but leave room to make sure the
- * main executable is also within that region.
- */
-#define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
+#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 typedef enum {
     TCG_REG_ZERO = 0,
@@ -136,7 +132,7 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
 #define TCG_TARGET_HAS_bswap32_i32      1
-#define TCG_TARGET_HAS_direct_jump      1
+#define TCG_TARGET_HAS_direct_jump      0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_add2_i32         0
@@ -207,7 +203,9 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
+/* not defined -- call should be eliminated at compile time */
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t)
+    QEMU_ERROR("code path is reachable");
 
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 3a40af8799..41ffa28394 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1654,17 +1654,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* direct jump method */
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-            /* Avoid clobbering the address during retranslation.  */
-            tcg_out32(s, OPC_J | (*(uint32_t *)s->code_ptr & 0x3ffffff));
-        } else {
-            /* indirect jump method */
-            tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
-                       (uintptr_t)(s->tb_jmp_target_addr + a0));
-            tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
-        }
+        /* indirect jump method */
+        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
+                   (uintptr_t)(s->tb_jmp_target_addr + a0));
+        tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
         tcg_out_nop(s);
         set_jmp_reset_offset(s, a0);
         break;
@@ -2538,13 +2532,6 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_GP);   /* global pointer */
 }
 
-void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
-                              uintptr_t jmp_rw, uintptr_t addr)
-{
-    qatomic_set((uint32_t *)jmp_rw, deposit32(OPC_J, 0, 26, addr >> 2));
-    flush_idcache_range(jmp_rx, jmp_rw, 4);
-}
-
 typedef struct {
     DebugFrameHeader h;
     uint8_t fde_def_cfa[4];
-- 
2.25.1


