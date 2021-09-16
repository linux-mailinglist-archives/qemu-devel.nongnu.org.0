Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5AF40DEB4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:52:33 +0200 (CEST)
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtgd-0006Cn-SP
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLp-0001qh-5Z
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:31:01 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLh-0002gA-AB
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:31:00 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 me5-20020a17090b17c500b0019af76b7bb4so7131443pjb.2
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sx9OxIFdY4NzqELX94oh/fd9umRX24uKGyg1w/4NOWY=;
 b=Chb+4yuw/cV/lINWg6Sl4dc0FB6+1UBfYkzhS8JQP+pwvygJY+lyZOsPClNuDIH1tx
 +0hNGBMv9DCpqAQ1fV4McEOflYjNBL1Knrnt1qPOzPnI/PAfU25zPsmalmKduLNMY+K3
 LendHxwOPJzc80QpxF+9spGYNJ+8EjO9BUkufu8l0PeyjZ9dDVnqL7RBFrOT4k87/G8B
 1DGUPW9Z+XXqZOo1u9jX21aQGLIM5fnv3nIJ2hpSdEJ9XFkZNEq0G7Xqt5TSROrWkZ/h
 kKhb/2Dfm1/xTLlAkw9Lo3A5znuXW4nPanuonEuCWzcVEiMc+NMU2B+p+N2QNKQvBtdE
 9E1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sx9OxIFdY4NzqELX94oh/fd9umRX24uKGyg1w/4NOWY=;
 b=NkQ/dGEviQh7lJcKwTeNEmoe5S5rbBYyP03XFj+zDeLCm2XSMcJWI2aaPdc/1VFIDB
 vD11xzYU2yMV4sK0rnUdhPNvOvHXyf4p8mR1JZwfaAP4KR5MrAr6Rt63FCyY1AleeEYS
 3oxonXL0ulbinqcokyNxgXDaWbfXjuVrNoAY08rjRD/JeBO3Ya8ijsczxL46jPgo8bu9
 hMkHjawsPMc7nLkCysJ01k9eoz9lJ7fHLmo8TIZbRYObcbEyIjLeMVZamR6Kl7Ie5Wal
 VrutFSShlfLNosvqeMfMycwDzsVB+7RnW+Kj12O9V64Czd6+iKDPVM4a93oznTW0Cvme
 rxBg==
X-Gm-Message-State: AOAM5327+TL7d889gXZ/+1IBlXfuuHTkdYhuYfMtHeMD4c4o4NRDM/Xu
 +0FSqj269hCqCr15hvW1tzjNfHt0Udcj9w==
X-Google-Smtp-Source: ABdhPJxMU9Sl8YaryB3bc9SocGSr7sr1CGTu61RdnZkqQmDQYuWgCa6X1gKKc2/4FgkF9MzVSSFFow==
X-Received: by 2002:a17:902:ceca:b0:13c:8366:deac with SMTP id
 d10-20020a170902ceca00b0013c8366deacmr5210440plg.68.1631806249862; 
 Thu, 16 Sep 2021 08:30:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/35] tcg/mips: Unset TCG_TARGET_HAS_direct_jump
Date: Thu, 16 Sep 2021 08:30:24 -0700
Message-Id: <20210916153025.1944763-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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


