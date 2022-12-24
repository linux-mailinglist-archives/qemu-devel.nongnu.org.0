Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E78655BFE
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:15:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9ESA-0007U2-H4; Sat, 24 Dec 2022 19:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9ERz-0007Nh-1m
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 19:01:12 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9ERu-0000j0-T3
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 19:01:10 -0500
Received: by mail-pj1-x1035.google.com with SMTP id fy4so8011785pjb.0
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 16:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t90UzdI6bBWuX61bW3oSKKHPeT/DJfZGV++tUHFjEmI=;
 b=DbIVMZbRV64SXxlhBXIdPyCLl9C/H49g7ldc0AsYy/lIBXAF8zaBmccBqxuMyTQJkh
 IH502y3deR2vZSgqHm5l+JiAtW78a1paESYIvqnCJQEsFfJxgVvci3+11bhP9I9aDWQm
 6iA3cI+7R5xOdi+ugmxGktqwFuqFS6jGPCM7FkW3t3JZjtDk1IhXR24pq12TNb1hbssS
 sKAg0QxHlQE5iJBeGaIcJu4oyXm0ww8t1+MQA6J+XE6jMkFKy6LQRKI1E5K+uXhSn4ef
 JFZeIDyGbrbfry8eOUKEEtQyCOW+BhR7zursUIvsSEpNzO1HZmJeu6frGs8kJRUUaSyr
 LBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t90UzdI6bBWuX61bW3oSKKHPeT/DJfZGV++tUHFjEmI=;
 b=row+plMaD5nRjVo/1IgSIrkmujyk55igUFk4ETbM131Ffj4KjJ51ZnpG9/kLFzjyl1
 6WV9DhewFdNm1TvFisgROyi5EVjNPSGdbHzCEsPPWl2evanVmI+0qOF9tBI0pXY717pB
 QqKVYBPssJdvHsBPJKUK9mQ2AkbKMqpyygUFO2iD/YUTzIOY7kWq6dXDanfe1SIHib3w
 gdIwpmPggzZ2wttYNkMZ2lLV9Yvy2oJWcloSqiRXBhbXTp02DzO30d6mVg/bPV+BdYZc
 e16AsgCQSKgEy5Hy9tvRPdlZ1jhffdyHCNsaay7S+mOdT+vevpYmwm6PkgW6NiQNcal9
 1OMw==
X-Gm-Message-State: AFqh2kqLw0NjDvaE7XU2PiqCfP90t28bqn2b1leC9MI9ql3btpS0FzGt
 +vN5p3qM6nD9t3K7vhTRjEDIeyH8hHJALYuu
X-Google-Smtp-Source: AMrXdXtR+r3c8/FgR8upfDab0G1IZ9t1uLwGxaDNQ8DIR+BPQhjhkXGuAucTDJJCNmClK72l6CZ1Zg==
X-Received: by 2002:a05:6a20:94c3:b0:a3:6f97:e658 with SMTP id
 ht3-20020a056a2094c300b000a36f97e658mr17943434pzb.58.1671926463609; 
 Sat, 24 Dec 2022 16:01:03 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 e32-20020a630f20000000b00478fd9bb6c7sm4161280pgl.75.2022.12.24.16.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 16:01:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 43/43] tcg: Add TCGHelperInfo argument to tcg_out_call
Date: Sat, 24 Dec 2022 15:57:20 -0800
Message-Id: <20221224235720.842093-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This eliminates an ifdef for TCI, and will be required for
expanding the call for TCGv_i128.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 12 ++----------
 tcg/aarch64/tcg-target.c.inc     | 12 +++++++++---
 tcg/arm/tcg-target.c.inc         | 10 ++++++++--
 tcg/i386/tcg-target.c.inc        |  5 +++--
 tcg/loongarch64/tcg-target.c.inc |  7 ++++---
 tcg/mips/tcg-target.c.inc        |  3 ++-
 tcg/ppc/tcg-target.c.inc         |  7 ++++---
 tcg/riscv/tcg-target.c.inc       |  7 ++++---
 tcg/s390x/tcg-target.c.inc       | 12 +++++++++---
 tcg/sparc64/tcg-target.c.inc     |  3 ++-
 tcg/tci/tcg-target.c.inc         |  3 ++-
 11 files changed, 49 insertions(+), 32 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 9092473cf0..acd73d09bf 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -145,12 +145,8 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
-#ifdef CONFIG_TCG_INTERPRETER
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
-                         ffi_cif *cif);
-#else
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target);
-#endif
+                         const TCGHelperInfo *info);
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
 static int tcg_out_ldst_finalize(TCGContext *s);
@@ -4387,11 +4383,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         save_globals(s, allocated_regs);
     }
 
-#ifdef CONFIG_TCG_INTERPRETER
-    tcg_out_call(s, tcg_call_func(op), info->cif);
-#else
-    tcg_out_call(s, tcg_call_func(op));
-#endif
+    tcg_out_call(s, tcg_call_func(op), info);
 
     /* Assign output registers and emit moves if needed.  */
     switch (info->out_kind) {
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1af879e6f5..ad1816e32d 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1336,7 +1336,7 @@ static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *target)
 {
     ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
     if (offset == sextract64(offset, 0, 26)) {
@@ -1347,6 +1347,12 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
     }
 }
 
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
+                         const TCGHelperInfo *info)
+{
+    tcg_out_call_int(s, target);
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                               uintptr_t jmp_rw, uintptr_t addr)
 {
@@ -1594,7 +1600,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X2, oi);
     tcg_out_adr(s, TCG_REG_X3, lb->raddr);
-    tcg_out_call(s, qemu_ld_helpers[opc & MO_SIZE]);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
     if (opc & MO_SIGN) {
         tcg_out_sxt(s, lb->type, size, lb->datalo_reg, TCG_REG_X0);
     } else {
@@ -1620,7 +1626,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_mov(s, size == MO_64, TCG_REG_X2, lb->datalo_reg);
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X3, oi);
     tcg_out_adr(s, TCG_REG_X4, lb->raddr);
-    tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE]);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE]);
     tcg_out_goto(s, lb->raddr);
     return true;
 }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2c6c353eea..9245ea86d0 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1131,7 +1131,7 @@ static void tcg_out_goto(TCGContext *s, ARMCond cond, const tcg_insn_unit *addr)
  * The call case is mostly used for helpers - so it's not unreasonable
  * for them to be beyond branch range.
  */
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *addr)
 {
     intptr_t addri = (intptr_t)addr;
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
@@ -1150,6 +1150,12 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
     tcg_out_blx_reg(s, COND_AL, TCG_REG_TMP);
 }
 
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr,
+                         const TCGHelperInfo *info)
+{
+    tcg_out_call_int(s, addr);
+}
+
 static void tcg_out_goto_label(TCGContext *s, ARMCond cond, TCGLabel *l)
 {
     if (l->has_value) {
@@ -1515,7 +1521,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
 
     /* Use the canonical unsigned helpers and minimize icache usage. */
-    tcg_out_call(s, qemu_ld_helpers[opc & MO_SIZE]);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
 
     datalo = lb->datalo_reg;
     datahi = lb->datahi_reg;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index cb04e4b3ad..58bd5873f5 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1661,7 +1661,8 @@ static void tcg_out_branch(TCGContext *s, int call, const tcg_insn_unit *dest)
     }
 }
 
-static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
+                         const TCGHelperInfo *info)
 {
     tcg_out_branch(s, 1, dest);
 }
@@ -1885,7 +1886,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
                      (uintptr_t)l->raddr);
     }
 
-    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     data_reg = l->datalo_reg;
     switch (opc & MO_SSIZE) {
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d326e28740..c9e99e8ec3 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -567,7 +567,8 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
+                         const TCGHelperInfo *info)
 {
     tcg_out_call_int(s, arg, false);
 }
@@ -760,7 +761,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A2, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (tcg_target_long)l->raddr);
 
-    tcg_out_call(s, qemu_ld_helpers[size]);
+    tcg_out_call_int(s, qemu_ld_helpers[size], false);
 
     switch (opc & MO_SSIZE) {
     case MO_SB:
@@ -821,7 +822,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
 
-    tcg_out_call(s, qemu_st_helpers[size]);
+    tcg_out_call_int(s, qemu_st_helpers[size], false);
 
     return tcg_out_goto(s, l->raddr);
 }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index bd76f0c97f..292e490b5c 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1020,7 +1020,8 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
+                         const TCGHelperInfo *info)
 {
     tcg_out_call_int(s, arg, false);
     tcg_out_nop(s);
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 38ee9974cd..e0621463f6 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2002,7 +2002,8 @@ static void tcg_out_call_int(TCGContext *s, int lk,
 #endif
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
+                         const TCGHelperInfo *info)
 {
     tcg_out_call_int(s, LK, target);
 }
@@ -2221,7 +2222,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
     tcg_out32(s, MFSPR | RT(arg) | LR);
 
-    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, LK, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     lo = lb->datalo_reg;
     hi = lb->datahi_reg;
@@ -2290,7 +2291,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
     tcg_out32(s, MFSPR | RT(arg) | LR);
 
-    tcg_out_call(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tcg_out_b(s, 0, lb->raddr);
     return true;
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 81a83e45b1..aa017d665a 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -819,7 +819,8 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
+                         const TCGHelperInfo *info)
 {
     tcg_out_call_int(s, arg, false);
 }
@@ -1002,7 +1003,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
 
-    tcg_out_call(s, qemu_ld_helpers[opc & MO_SSIZE]);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE], false);
     tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);
 
     tcg_out_goto(s, l->raddr);
@@ -1047,7 +1048,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
 
-    tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE]);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
 
     tcg_out_goto(s, l->raddr);
     return true;
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index f1d3907cd8..b9ba7b605e 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1691,7 +1691,7 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
     tgen_branch(s, cc, l);
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *dest)
 {
     ptrdiff_t off = tcg_pcrel_diff(s, dest) >> 1;
     if (off == (int32_t)off) {
@@ -1702,6 +1702,12 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
     }
 }
 
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
+                         const TCGHelperInfo *info)
+{
+    tcg_out_call_int(s, dest);
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
                                    TCGReg base, TCGReg index, int disp)
 {
@@ -1897,7 +1903,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R4, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R5, (uintptr_t)lb->raddr);
-    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
     tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_R2);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
@@ -1938,7 +1944,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R5, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R6, (uintptr_t)lb->raddr);
-    tcg_out_call(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index cb9453efdd..eb913f33c8 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -859,7 +859,8 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
+                         const TCGHelperInfo *info)
 {
     tcg_out_call_nodelay(s, dest, false);
     tcg_out_nop(s);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c1acaa943e..d36a7ebdd1 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -558,8 +558,9 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
 }
 
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
-                         ffi_cif *cif)
+                         const TCGHelperInfo *info)
 {
+    ffi_cif *cif = info->cif;
     tcg_insn_unit insn = 0;
     uint8_t which;
 
-- 
2.34.1


