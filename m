Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD9A3C355D
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:53:23 +0200 (CEST)
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FIA-0000PV-Ux
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2F0d-0007wf-6j
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:35:15 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2F0b-0004ET-6G
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:35:14 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so7668766pju.4
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86TtjrEbriXGpZEXnuTm5RRc+rJIXXR9ggO6OBw5ugM=;
 b=Qwj4aO2IhKWIyIisKHcIG8j953sZ0G+ruToLUDQmBIRi5nCwt4Pwwg6IzgGTmU66hf
 4quYCRfN1p1EkxSxUGhe6PH9KA7Ady6VFzQxOUAlMnftarvtO/1m1peez1BiuL3+w44m
 W4F21O2TIOaLGUovp1BH7SOz1/YLR+ZX4Tv9Aqg15kgCoTo1kfpnGZm1SMqx+XtdhwyW
 0meGOQnge0JtXu4flYp3kozoW4ROgvG7T4s5v5mygN111yE0oFIoV2BRKIgiavP5U9QL
 TAuOPom9TdU0MuWC4rDNewY9NMOCabkOm47QVh4aqpqtQQEhMtnZYjjf+BLW4Twnv4pw
 aPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86TtjrEbriXGpZEXnuTm5RRc+rJIXXR9ggO6OBw5ugM=;
 b=BU+XUCjkmyQB/oUF2PBNE/47gTUQRlZGRuq9NkSF2lObsxj0PQxfBHLNXk79KbJJay
 m+GCN2iGjltO8fX+1targgSpR7MWQDrf5ANKfUb2IuwHFPlIVC5cJQ2l/30v5/Xn4rhW
 Bb4GUoicA0iTsK4wfMPxd4JfjPo1ZK/N0ydaD7zwxaElj1If+p8yA6cKcBQBhFeBi3zg
 Mp2sIBTzDFtRelQGwSKkPY904dSTTdEZRB3lv/FKE9vOYjRFPN5CKnGjWk5JG0vu+a2n
 1Xs76w1j+T1cn5bUhHkCROqnut622XO9bc+n5j048866EXEZqy1CNiKOroRuHYmirBvH
 hmZA==
X-Gm-Message-State: AOAM531bb0vZf5uduXBw46kl4w9NqHuQoHO/F4KThCPpDCD3lMnDoFrt
 8Aa9gtTfj7iIpeDjdVYeQBtrWWVgNYfLXg==
X-Google-Smtp-Source: ABdhPJwpjlswvXCtkfk+ZzDYpGNSizdvNLHkCD0/rtcszw6YWNPxv7WTEfPW+XSFzQRbxFZEuvt/7w==
X-Received: by 2002:a17:902:b113:b029:128:cec4:e01e with SMTP id
 q19-20020a170902b113b0290128cec4e01emr35895227plr.78.1625931311826; 
 Sat, 10 Jul 2021 08:35:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id cx4sm7966136pjb.53.2021.07.10.08.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:35:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 40/41] tcg: Remove TCG_TARGET_HAS_goto_ptr
Date: Sat, 10 Jul 2021 08:31:42 -0700
Message-Id: <20210710153143.1320521-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 6eea04347eb6, all tcg backends support goto_ptr.
Remove the conditional, making support mandatory.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h    | 3 +--
 tcg/aarch64/tcg-target.h | 1 -
 tcg/arm/tcg-target.h     | 1 -
 tcg/i386/tcg-target.h    | 1 -
 tcg/mips/tcg-target.h    | 1 -
 tcg/ppc/tcg-target.h     | 1 -
 tcg/riscv/tcg-target.h   | 1 -
 tcg/s390/tcg-target.h    | 1 -
 tcg/sparc/tcg-target.h   | 1 -
 tcg/tci/tcg-target.h     | 1 -
 tcg/tcg-op.c             | 2 +-
 tcg/tcg.c                | 8 ++------
 12 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index 993992373e..675873e200 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -194,8 +194,7 @@ DEF(insn_start, 0, 0, TLADDR_ARGS * TARGET_INSN_START_WORDS,
     TCG_OPF_NOT_PRESENT)
 DEF(exit_tb, 0, 0, 1, TCG_OPF_BB_EXIT | TCG_OPF_BB_END)
 DEF(goto_tb, 0, 0, 1, TCG_OPF_BB_EXIT | TCG_OPF_BB_END)
-DEF(goto_ptr, 0, 1, 0,
-    TCG_OPF_BB_EXIT | TCG_OPF_BB_END | IMPL(TCG_TARGET_HAS_goto_ptr))
+DEF(goto_ptr, 0, 1, 0, TCG_OPF_BB_EXIT | TCG_OPF_BB_END)
 
 DEF(plugin_cb_start, 0, 0, 3, TCG_OPF_NOT_PRESENT)
 DEF(plugin_cb_end, 0, 0, 0, TCG_OPF_NOT_PRESENT)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 551baf8da3..7a93ac8023 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -88,7 +88,6 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
-#define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_div_i64          1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 95fcef33bc..d113b7f8db 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -148,7 +148,6 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_div_i32          use_idiv_instructions
 #define TCG_TARGET_HAS_rem_i32          0
-#define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index ac10066c3e..b00a6da293 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -135,7 +135,6 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      1
 
 #if TCG_TARGET_REG_BITS == 64
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index e81e824cab..3a62055f04 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -136,7 +136,6 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
 #define TCG_TARGET_HAS_bswap32_i32      1
-#define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      1
 
 #if TCG_TARGET_REG_BITS == 64
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index c13ed5640a..0943192cde 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -108,7 +108,6 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
-#define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 87ea94666b..ef78b99e98 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -85,7 +85,6 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 
 /* optional instructions */
-#define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_movcond_i32      0
 #define TCG_TARGET_HAS_div_i32          1
 #define TCG_TARGET_HAS_rem_i32          1
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index b04b72b7eb..2e4ede2ea2 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -98,7 +98,6 @@ extern uint64_t s390_facilities;
 #define TCG_TARGET_HAS_mulsh_i32      0
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
-#define TCG_TARGET_HAS_goto_ptr       1
 #define TCG_TARGET_HAS_direct_jump    (s390_facilities & FACILITY_GEN_INST_EXT)
 #define TCG_TARGET_HAS_qemu_st8_i32   0
 
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 86bb9a2d39..c050763049 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -121,7 +121,6 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 7b6089f304..033e613f24 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -87,7 +87,6 @@
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 44d711c0fc..3d5db9a33c 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2754,7 +2754,7 @@ void tcg_gen_goto_tb(unsigned idx)
 
 void tcg_gen_lookup_and_goto_ptr(void)
 {
-    if (TCG_TARGET_HAS_goto_ptr && !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
+    if (!qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
         TCGv_ptr ptr;
 
         plugin_gen_disable_mem_helpers();
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ed86a70b79..4142d42d77 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -789,9 +789,7 @@ void tcg_prologue_init(TCGContext *s)
      * For tci, we use NULL as the signal to return from the interpreter,
      * so skip this check.
      */
-    if (TCG_TARGET_HAS_goto_ptr) {
-        tcg_debug_assert(tcg_code_gen_epilogue != NULL);
-    }
+    tcg_debug_assert(tcg_code_gen_epilogue != NULL);
 #endif
 
     tcg_region_prologue_set(s);
@@ -1176,6 +1174,7 @@ bool tcg_op_supported(TCGOpcode op)
     case INDEX_op_insn_start:
     case INDEX_op_exit_tb:
     case INDEX_op_goto_tb:
+    case INDEX_op_goto_ptr:
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_ld_i64:
@@ -1185,9 +1184,6 @@ bool tcg_op_supported(TCGOpcode op)
     case INDEX_op_qemu_st8_i32:
         return TCG_TARGET_HAS_qemu_st8_i32;
 
-    case INDEX_op_goto_ptr:
-        return TCG_TARGET_HAS_goto_ptr;
-
     case INDEX_op_mov_i32:
     case INDEX_op_setcond_i32:
     case INDEX_op_brcond_i32:
-- 
2.25.1


