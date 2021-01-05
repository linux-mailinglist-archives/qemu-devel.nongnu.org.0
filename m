Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C62EB1C7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:49:38 +0100 (CET)
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqSf-0007fR-3Q
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0Q-0002LO-17
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:26 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0J-0006TE-S6
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:25 -0500
Received: by mail-pl1-x62f.google.com with SMTP id be12so65137plb.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=72zHjmApxurokrOqBQhkIhZjtudzzH1TIj1EwkLb0WU=;
 b=EtHBH68ObpytjPTb5G3H7TQ2mbYwhZCrWunD4Q3C2O4YwKJ5mnnsTf4wLR5ON61cUF
 lu24MrQQlQUlXfayPaTDXXRmVqujveCHLN0TGyvXWPb+qfN1bfg+VpOMpLbT+/cYX9/U
 M81mshM5f5ae0xkvyaVJnpuQPu9xGnQft8pAxMA4BgEzVPuaYXah/RTslazI37VtSOzE
 nqw7lhO6aJ5CWZNPyMhW1Mo1jjgB/ibgnP27+L8SntI1BgcCsfnq1SAXA0wmAKPXpdap
 k8RyEfQkUafDwAlOfTzFZgen6iJ8cxFQ0nLjLzmxw4ff2k6WsrNimSLTWXNfb6VbjQdN
 jfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=72zHjmApxurokrOqBQhkIhZjtudzzH1TIj1EwkLb0WU=;
 b=TGa0F2PgiJ8/tHEV5JQ/Q63S4Vo+3inRkJ6CmBMZMNSl7ot6e43Oq/dJ1Z107JXqnq
 upL4Q4xTAfoJzGtimAHB0CJoPL87YYWDmjI1uG8CA0BuCWeZLjDeM5aNUKBgD4+AMPgP
 31BfDzMz7uNcgTgSDUw4//IFna+JhkG/kUqUN4/QBM/tlYSoYQAdg54o6rcLl6vCPfVM
 Dz7QUOr5Rqz4lZRCpq1sYSdO0j1gipqtxt+X4YruyQXI9s3KIvERE/3aS6TUHBnvkYxs
 mkx5xeJApqPkXaPi/+DAklkwcjV1RnbsdNoVLS/CLVYNmcpVxpe7Sje0S+gPiCl2u2Ku
 c6Kg==
X-Gm-Message-State: AOAM533KJUDJvGJcfD/I+Ud7bSW52KF/phgzLNPhmnJ5cubTPuljvIYj
 yOGtnjc2LtvDoiUQbnN+r2tL8F619wpNUQ==
X-Google-Smtp-Source: ABdhPJx/Wkr1WA84PM0o9aok/+LyN1Z6DSKB/FqJ/67SarNZuud28sgtpaZS+IcgPqsnlmvpzWgjoA==
X-Received: by 2002:a17:90a:7085:: with SMTP id
 g5mr275209pjk.132.1609867214721; 
 Tue, 05 Jan 2021 09:20:14 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/43] tcg: Adjust tcg_out_call for const
Date: Tue,  5 Jan 2021 07:19:17 -1000
Message-Id: <20210105171950.415486-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must change all targets at once, since all must match
the declaration in tcg.c.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                    | 2 +-
 tcg/aarch64/tcg-target.c.inc | 2 +-
 tcg/arm/tcg-target.c.inc     | 2 +-
 tcg/i386/tcg-target.c.inc    | 4 ++--
 tcg/mips/tcg-target.c.inc    | 6 +++---
 tcg/ppc/tcg-target.c.inc     | 8 ++++----
 tcg/riscv/tcg-target.c.inc   | 6 +++---
 tcg/s390/tcg-target.c.inc    | 2 +-
 tcg/sparc/tcg-target.c.inc   | 4 ++--
 tcg/tci/tcg-target.c.inc     | 2 +-
 10 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 325e439cb7..a34d2e5bb7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -149,7 +149,7 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
-static void tcg_out_call(TCGContext *s, tcg_insn_unit *target);
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target);
 static int tcg_target_const_match(tcg_target_long val, TCGType type,
                                   const TCGArgConstraint *arg_ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 96dc9f4d0b..6d8152c468 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1329,7 +1329,7 @@ static inline void tcg_out_callr(TCGContext *s, TCGReg reg)
     tcg_out_insn(s, 3207, BLR, reg);
 }
 
-static inline void tcg_out_call(TCGContext *s, tcg_insn_unit *target)
+static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 {
     ptrdiff_t offset = target - s->code_ptr;
     if (offset == sextract64(offset, 0, 26)) {
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index f8f485d807..a197e6bc45 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1033,7 +1033,7 @@ static void tcg_out_goto(TCGContext *s, int cond, const tcg_insn_unit *addr)
 
 /* The call case is mostly used for helpers - so it's not unreasonable
  * for them to be beyond branch range */
-static void tcg_out_call(TCGContext *s, tcg_insn_unit *addr)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
 {
     intptr_t addri = (intptr_t)addr;
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index ee3a27069d..9e4053f4e7 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1600,7 +1600,7 @@ static void tcg_out_clz(TCGContext *s, int rexw, TCGReg dest, TCGReg arg1,
     }
 }
 
-static void tcg_out_branch(TCGContext *s, int call, tcg_insn_unit *dest)
+static void tcg_out_branch(TCGContext *s, int call, const tcg_insn_unit *dest)
 {
     intptr_t disp = tcg_pcrel_diff(s, dest) - 5;
 
@@ -1619,7 +1619,7 @@ static void tcg_out_branch(TCGContext *s, int call, tcg_insn_unit *dest)
     }
 }
 
-static inline void tcg_out_call(TCGContext *s, tcg_insn_unit *dest)
+static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
 {
     tcg_out_branch(s, 1, dest);
 }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index a3f838fa51..6d2c369a85 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -517,7 +517,7 @@ static void tcg_out_opc_sa64(TCGContext *s, MIPSInsn opc1, MIPSInsn opc2,
  * Type jump.
  * Returns true if the branch was in range and the insn was emitted.
  */
-static bool tcg_out_opc_jmp(TCGContext *s, MIPSInsn opc, void *target)
+static bool tcg_out_opc_jmp(TCGContext *s, MIPSInsn opc, const void *target)
 {
     uintptr_t dest = (uintptr_t)target;
     uintptr_t from = (uintptr_t)s->code_ptr + 4;
@@ -1080,7 +1080,7 @@ static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
     }
 }
 
-static void tcg_out_call_int(TCGContext *s, tcg_insn_unit *arg, bool tail)
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
 {
     /* Note that the ABI requires the called function's address to be
        loaded into T9, even if a direct branch is in range.  */
@@ -1098,7 +1098,7 @@ static void tcg_out_call_int(TCGContext *s, tcg_insn_unit *arg, bool tail)
     }
 }
 
-static void tcg_out_call(TCGContext *s, tcg_insn_unit *arg)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 {
     tcg_out_call_int(s, arg, false);
     tcg_out_nop(s);
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index d108f01fec..38dabe40c4 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1106,7 +1106,7 @@ static void tcg_out_xori32(TCGContext *s, TCGReg dst, TCGReg src, uint32_t c)
     tcg_out_zori32(s, dst, src, c, XORI, XORIS);
 }
 
-static void tcg_out_b(TCGContext *s, int mask, tcg_insn_unit *target)
+static void tcg_out_b(TCGContext *s, int mask, const tcg_insn_unit *target)
 {
     ptrdiff_t disp = tcg_pcrel_diff(s, target);
     if (in_range_b(disp)) {
@@ -1762,13 +1762,13 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
     }
 }
 
-static void tcg_out_call(TCGContext *s, tcg_insn_unit *target)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 {
 #ifdef _CALL_AIX
     /* Look through the descriptor.  If the branch is in range, and we
        don't have to spend too much effort on building the toc.  */
-    void *tgt = ((void **)target)[0];
-    uintptr_t toc = ((uintptr_t *)target)[1];
+    const void *tgt = ((const void * const *)target)[0];
+    uintptr_t toc = ((const uintptr_t *)target)[1];
     intptr_t diff = tcg_pcrel_diff(s, tgt);
 
     if (in_range_b(diff) && toc == (uint32_t)toc) {
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 25df85b33a..90588ca2a3 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -449,7 +449,7 @@ static bool reloc_jimm20(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
     return false;
 }
 
-static bool reloc_call(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+static bool reloc_call(tcg_insn_unit *code_ptr, const tcg_insn_unit *target)
 {
     intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
     int32_t lo = sextreg(offset, 0, 12);
@@ -861,7 +861,7 @@ static inline void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
 }
 
-static void tcg_out_call_int(TCGContext *s, tcg_insn_unit *arg, bool tail)
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
 {
     TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
     ptrdiff_t offset = tcg_pcrel_diff(s, arg);
@@ -888,7 +888,7 @@ static void tcg_out_call_int(TCGContext *s, tcg_insn_unit *arg, bool tail)
     }
 }
 
-static void tcg_out_call(TCGContext *s, tcg_insn_unit *arg)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 {
     tcg_out_call_int(s, arg, false);
 }
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 1b5c4f0ab0..37f4dc4cfd 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1415,7 +1415,7 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
     tgen_branch(s, cc, l);
 }
 
-static void tcg_out_call(TCGContext *s, tcg_insn_unit *dest)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
 {
     ptrdiff_t off = dest - s->code_ptr;
     if (off == (int32_t)off) {
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 5b3bc91b05..1a40911660 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -840,7 +840,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
     tcg_out_mov(s, TCG_TYPE_I64, rl, tmp);
 }
 
-static void tcg_out_call_nodelay(TCGContext *s, tcg_insn_unit *dest,
+static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
                                  bool in_prologue)
 {
     ptrdiff_t disp = tcg_pcrel_diff(s, dest);
@@ -855,7 +855,7 @@ static void tcg_out_call_nodelay(TCGContext *s, tcg_insn_unit *dest,
     }
 }
 
-static void tcg_out_call(TCGContext *s, tcg_insn_unit *dest)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
 {
     tcg_out_call_nodelay(s, dest, false);
     tcg_out_nop(s);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 231b9b1775..d5a4d9d37c 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -545,7 +545,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
-static inline void tcg_out_call(TCGContext *s, tcg_insn_unit *arg)
+static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 {
     uint8_t *old_code_ptr = s->code_ptr;
     tcg_out_op_t(s, INDEX_op_call);
-- 
2.25.1


