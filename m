Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE04643C24
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:18:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POi-0003OL-KR; Mon, 05 Dec 2022 23:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POg-0003NN-GH
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:34 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POc-0006xq-FO
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:33 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-14449b7814bso11125143fac.3
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qv/niVBYTSEARbjCDCIjmv13QGx0DTp8Ej8mDXhbbE4=;
 b=HsnAbjeBqvCTA9gTU5VEC1dboIRrMTUQZ73I7SvBRaWNmzV0tSSQZZt7OIyuWDHt9Y
 V3QbMhgLqi5CYRuHaFhiuJ1RI71evvq8tqnBTfJABFE7WWpx6REYUcsKFuM6sKvNqW+Z
 I3IKYKtuo9Gm+0xes/fdEOMh1eunZTNFinMPPstq+s+rbzgpSzEd5hPc0LkofHi7UlOv
 pkJ8+XzkbnbVQtwhy7q7lsSXMTFuK9gwTUWAaHVnZbWGCK8uh0ZgttnloH2q0wNdSgfs
 3UNQ01D6LxJazGp45J3LuVodV01/UnDLm0GNlxiyKdDy4BSdTAu8EoRQQ4cPm3FUL+r3
 dkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qv/niVBYTSEARbjCDCIjmv13QGx0DTp8Ej8mDXhbbE4=;
 b=sRzMo+Gmw+lLuP0oUow8dFFsKxMoNxs1JLIFtl909uQ3O0AlrglvqvOSMHqOQRpwWV
 Be3scYm5+KmbstDaKBIKY5kh1LyKIOlkHBB2HWFSHQxZbqTFo9zQlKm6hLUFzZmQ0k4y
 bMcF6Ai3XFAq6GZG//jb/SpJKq+e9boBKUF52nnD1fkqXBYRteSL/G/WzS711xy7z3th
 A6KAoJzCkgv8hOlPQyf94/Mir4/SirO3HyjO3ONwT+OnHkHzYoRfvu7fi6T7nueDgXb/
 MQSrrfk0t7+4qW1bva9Pf5dn3dZov2IdxgaoW09mkS6B/+pHbBYszVb/85jcEAQ+kA2g
 edrw==
X-Gm-Message-State: ANoB5pniCaegpaxLN6QDjWgcR1FXqcm4HQXO5ZcsZmQWRSi1uf+tIhMi
 rUIyhGJZyIgHK7r02wbJrSYYgXYkN9dAgTMWi+M=
X-Google-Smtp-Source: AA0mqf7es0z03Y45amMFyQqerDJFvmn/brNoCxbQ0lTx0aqZeK0XhzoojXTQwGvdGz84iGzUTI4TRA==
X-Received: by 2002:a05:6870:2404:b0:13b:a68d:6185 with SMTP id
 n4-20020a056870240400b0013ba68d6185mr48408569oap.177.1670300248853; 
 Mon, 05 Dec 2022 20:17:28 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 08/22] tcg: Split out tcg_out_goto_tb
Date: Mon,  5 Dec 2022 22:17:01 -0600
Message-Id: <20221206041715.314209-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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

The INDEX_op_goto_tb opcode needs no register allocation.
Split out a dedicated helper function for it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  4 ++
 tcg/aarch64/tcg-target.c.inc     | 40 +++++++++---------
 tcg/arm/tcg-target.c.inc         | 49 +++++++++++-----------
 tcg/i386/tcg-target.c.inc        | 33 +++++++--------
 tcg/loongarch64/tcg-target.c.inc | 38 +++++++++--------
 tcg/mips/tcg-target.c.inc        | 21 ++++++----
 tcg/ppc/tcg-target.c.inc         | 52 ++++++++++++------------
 tcg/riscv/tcg-target.c.inc       | 20 +++++----
 tcg/s390x/tcg-target.c.inc       | 70 ++++++++++++++++----------------
 tcg/sparc64/tcg-target.c.inc     | 68 ++++++++++++++++---------------
 tcg/tci/tcg-target.c.inc         | 16 ++++----
 11 files changed, 219 insertions(+), 192 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8bde8eb0d4..d334f95375 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -108,6 +108,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
+static void tcg_out_goto_tb(TCGContext *s, int which);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS]);
@@ -4325,6 +4326,9 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
         case INDEX_op_exit_tb:
             tcg_out_exit_tb(s, op->args[0]);
             break;
+        case INDEX_op_goto_tb:
+            tcg_out_goto_tb(s, op->args[0]);
+            break;
         case INDEX_op_dup2_vec:
             if (tcg_reg_alloc_dup2(s, op)) {
                 break;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3aa89d6060..072d32f355 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1897,6 +1897,26 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     }
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /*
+     * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
+     * write can be used to patch the target address.
+     */
+    if ((uintptr_t)s->code_ptr & 7) {
+        tcg_out32(s, NOP);
+    }
+    set_jmp_insn_offset(s, which);
+    /*
+     * actual branch destination will be patched by
+     * tb_target_set_jmp_target later
+     */
+    tcg_out_insn(s, 3406, ADRP, TCG_REG_TMP, 0);
+    tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_TMP, TCG_REG_TMP, 0);
+    tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1916,25 +1936,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 #define REG0(I)  (const_args[I] ? TCG_REG_XZR : (TCGReg)args[I])
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        /*
-         * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
-         * write can be used to patch the target address.
-         */
-        if ((uintptr_t)s->code_ptr & 7) {
-            tcg_out32(s, NOP);
-        }
-        set_jmp_insn_offset(s, a0);
-        /*
-         * actual branch destination will be patched by
-         * tb_target_set_jmp_target later
-         */
-        tcg_out_insn(s, 3406, ADRP, TCG_REG_TMP, 0);
-        tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_TMP, TCG_REG_TMP, 0);
-        tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
-        set_jmp_reset_offset(s, a0);
-        break;
-
     case INDEX_op_goto_ptr:
         tcg_out_insn(s, 3207, BR, a0);
         break;
@@ -2305,6 +2306,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 3a545f3707..0afc286c8e 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1933,6 +1933,31 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
     tcg_out_epilogue(s);
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /* Indirect jump method */
+    intptr_t ptr, dif, dil;
+    TCGReg base = TCG_REG_PC;
+
+    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
+    ptr = get_jmp_target_addr(s, which);
+    dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
+    dil = sextract32(dif, 0, 12);
+    if (dif != dil) {
+        /*
+         * The TB is close, but outside the 12 bits addressable by
+         * the load.  We can extend this to 20 bits with a sub of a
+         * shifted immediate from pc.  In the vastly unlikely event
+         * the code requires more than 1MB, we'll use 2 insns and
+         * be no worse off.
+         */
+        base = TCG_REG_R0;
+        tcg_out_movi32(s, COND_AL, base, ptr - dil);
+    }
+    tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, base, dil);
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1941,29 +1966,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c;
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        {
-            /* Indirect jump method */
-            intptr_t ptr, dif, dil;
-            TCGReg base = TCG_REG_PC;
-
-            qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
-            ptr = get_jmp_target_addr(s, args[0]);
-            dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
-            dil = sextract32(dif, 0, 12);
-            if (dif != dil) {
-                /* The TB is close, but outside the 12 bits addressable by
-                   the load.  We can extend this to 20 bits with a sub of a
-                   shifted immediate from pc.  In the vastly unlikely event
-                   the code requires more than 1MB, we'll use 2 insns and
-                   be no worse off.  */
-                base = TCG_REG_R0;
-                tcg_out_movi32(s, COND_AL, base, ptr - dil);
-            }
-            tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, base, dil);
-            set_jmp_reset_offset(s, args[0]);
-        }
-        break;
     case INDEX_op_goto_ptr:
         tcg_out_b_reg(s, COND_AL, args[0]);
         break;
@@ -2253,6 +2255,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 3d4cf71552..d3cef242ef 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2357,6 +2357,22 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     }
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /*
+     * Jump displacement must be aligned for atomic patching;
+     * see if we need to add extra nops before jump
+     */
+    int gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
+    if (gap != 1) {
+        tcg_out_nopn(s, gap - 1);
+    }
+    tcg_out8(s, OPC_JMP_long); /* jmp im */
+    set_jmp_insn_offset(s, which);
+    tcg_out32(s, 0);
+    set_jmp_reset_offset(s, which);
+}
+
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                               const TCGArg args[TCG_MAX_OP_ARGS],
                               const int const_args[TCG_MAX_OP_ARGS])
@@ -2381,22 +2397,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     const_a2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        {
-            /*
-             * Jump displacement must be aligned for atomic patching;
-             * see if we need to add extra nops before jump
-             */
-            int gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
-            if (gap != 1) {
-                tcg_out_nopn(s, gap - 1);
-            }
-            tcg_out8(s, OPC_JMP_long); /* jmp im */
-            set_jmp_insn_offset(s, a0);
-            tcg_out32(s, 0);
-        }
-        set_jmp_reset_offset(s, a0);
-        break;
     case INDEX_op_goto_ptr:
         /* jmp to the given host address (could be epilogue) */
         tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, a0);
@@ -2791,6 +2791,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index dd4934d6d5..dbe64b7d8b 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1078,6 +1078,25 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     }
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /*
+     * Ensure that patch area is 8-byte aligned so that an
+     * atomic write can be used to patch the target address.
+     */
+    if ((uintptr_t)s->code_ptr & 7) {
+        tcg_out_nop(s);
+    }
+    set_jmp_insn_offset(s, which);
+    /*
+     * actual branch destination will be patched by
+     * tb_target_set_jmp_target later
+     */
+    tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
+    tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1088,24 +1107,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        /*
-         * Ensure that patch area is 8-byte aligned so that an
-         * atomic write can be used to patch the target address.
-         */
-        if ((uintptr_t)s->code_ptr & 7) {
-            tcg_out_nop(s);
-        }
-        set_jmp_insn_offset(s, a0);
-        /*
-         * actual branch destination will be patched by
-         * tb_target_set_jmp_target later
-         */
-        tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
-        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
-        set_jmp_reset_offset(s, a0);
-        break;
-
     case INDEX_op_mb:
         tcg_out_mb(s, a0);
         break;
@@ -1500,6 +1501,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 6b9c070f6b..605aa7714a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1965,6 +1965,17 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     tcg_out_opc_imm(s, OPC_ORI, TCG_REG_V0, b0, a0 & 0xffff);
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /* indirect jump method */
+    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
+               get_jmp_target_addr(s, which));
+    tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
+    tcg_out_nop(s);
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1984,15 +1995,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        /* indirect jump method */
-        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
-                   get_jmp_target_addr(s, a0));
-        tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
-        tcg_out_nop(s);
-        set_jmp_reset_offset(s, a0);
-        break;
     case INDEX_op_goto_ptr:
         /* jmp to the given host address (could be epilogue) */
         tcg_out_opc_reg(s, OPC_JR, 0, a0, 0);
@@ -2401,6 +2403,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 86684e1c84..ec13ea3171 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2622,6 +2622,32 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
     tcg_out_b(s, 0, tcg_code_gen_epilogue);
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /* Direct jump. */
+    if (TCG_TARGET_REG_BITS == 64) {
+        /* Ensure the next insns are 8 or 16-byte aligned. */
+        while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
+            tcg_out32(s, NOP);
+        }
+        set_jmp_insn_offset(s, which);
+        tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
+        tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
+        tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
+        tcg_out32(s, BCCTR | BO_ALWAYS);
+        set_jmp_reset_offset(s, which);
+        if (USE_REG_TB) {
+            /* For the unlinked case, need to reset TCG_REG_TB.  */
+            tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
+                             -tcg_current_code_size(s));
+        }
+    } else {
+        set_jmp_insn_offset(s, which);
+        tcg_out32(s, B);
+        set_jmp_reset_offset(s, which);
+    }
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -2629,31 +2655,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGArg a0, a1, a2;
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        /* Direct jump. */
-        if (TCG_TARGET_REG_BITS == 64) {
-            /* Ensure the next insns are 8 or 16-byte aligned. */
-            while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
-                tcg_out32(s, NOP);
-            }
-            set_jmp_insn_offset(s, args[0]);
-            tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-            tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-        } else {
-            set_jmp_insn_offset(s, args[0]);
-            tcg_out32(s, B);
-            set_jmp_reset_offset(s, args[0]);
-            break;
-        }
-        tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
-        tcg_out32(s, BCCTR | BO_ALWAYS);
-        set_jmp_reset_offset(s, args[0]);
-        if (USE_REG_TB) {
-            /* For the unlinked case, need to reset TCG_REG_TB.  */
-            tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
-                             -tcg_current_code_size(s));
-        }
-        break;
     case INDEX_op_goto_ptr:
         tcg_out32(s, MTSPR | RS(args[0]) | CTR);
         if (USE_REG_TB) {
@@ -3181,6 +3182,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:      /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:   /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:   /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 091c44d071..e73dfb4cbb 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1275,6 +1275,16 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     }
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
+    /* indirect jump method */
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
+               get_jmp_target_addr(s, which));
+    tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1285,15 +1295,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
-        /* indirect jump method */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
-                   get_jmp_target_addr(s, a0));
-        tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
-        set_jmp_reset_offset(s, a0);
-        break;
-
     case INDEX_op_goto_ptr:
         tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, a0, 0);
         break;
@@ -1594,6 +1595,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dba02db6ee..a60edc18cf 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2081,6 +2081,41 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     }
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    if (TCG_TARGET_HAS_direct_jump) {
+        /*
+         * Branch displacement must be aligned for atomic patching;
+         * see if we need to add extra nop before branch
+         */
+        if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
+            tcg_out16(s, NOP);
+        }
+        tcg_debug_assert(!USE_REG_TB);
+        tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
+        set_jmp_insn_offset(s, which);
+        s->code_ptr += 2;
+    } else {
+        /* Load address stored in the TB. */
+        tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_REG_TB,
+                       (const void *)get_jmp_target_addr(s, which));
+        /* and go there */
+        tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, TCG_REG_TB);
+    }
+    set_jmp_reset_offset(s, which);
+
+    /*
+     * For the unlinked path of goto_tb, we need to reset TCG_REG_TB
+     * to the beginning of this TB.
+     */
+    if (USE_REG_TB) {
+        int ofs = -tcg_current_code_size(s);
+        /* All TB are restricted to 64KiB by unwind info. */
+        tcg_debug_assert(ofs == sextract64(ofs, 0, 20));
+        tcg_out_insn(s, RXY, LAY, TCG_REG_TB, TCG_REG_TB, TCG_REG_NONE, ofs);
+    }
+}
+
 # define OP_32_64(x) \
         case glue(glue(INDEX_op_,x),_i32): \
         case glue(glue(INDEX_op_,x),_i64)
@@ -2093,40 +2128,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGArg a0, a1, a2;
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        a0 = args[0];
-        if (TCG_TARGET_HAS_direct_jump) {
-            /*
-             * branch displacement must be aligned for atomic patching;
-             * see if we need to add extra nop before branch
-             */
-            if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
-                tcg_out16(s, NOP);
-            }
-            tcg_debug_assert(!USE_REG_TB);
-            tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
-            set_jmp_insn_offset(s, a0);
-            s->code_ptr += 2;
-        } else {
-            /* load address stored at s->tb_jmp_target_addr + a0 */
-            tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_REG_TB,
-                           (const void *)get_jmp_target_addr(s, a0));
-            /* and go there */
-            tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, TCG_REG_TB);
-        }
-        set_jmp_reset_offset(s, a0);
-
-        /* For the unlinked path of goto_tb, we need to reset
-           TCG_REG_TB to the beginning of this TB.  */
-        if (USE_REG_TB) {
-            int ofs = -tcg_current_code_size(s);
-            /* All TB are restricted to 64KiB by unwind info. */
-            tcg_debug_assert(ofs == sextract64(ofs, 0, 20));
-            tcg_out_insn(s, RXY, LAY, TCG_REG_TB,
-                         TCG_REG_TB, TCG_REG_NONE, ofs);
-        }
-        break;
-
     case INDEX_op_goto_ptr:
         a0 = args[0];
         if (USE_REG_TB) {
@@ -2662,6 +2663,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index f0c6332ef1..ed8efa413c 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1436,6 +1436,41 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     tcg_out_arithi(s, TCG_REG_O0, TCG_REG_O0, a0 & 0x3ff, ARITH_OR);
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /* Direct jump. */
+    if (USE_REG_TB) {
+        /* make sure the patch is 8-byte aligned.  */
+        if ((intptr_t)s->code_ptr & 4) {
+            tcg_out_nop(s);
+        }
+        set_jmp_insn_offset(s, which);
+        tcg_out_sethi(s, TCG_REG_T1, 0);
+        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
+        tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
+        tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
+    } else {
+        set_jmp_insn_offset(s, which);
+        tcg_out32(s, CALL);
+        tcg_out_nop(s);
+    }
+    set_jmp_reset_offset(s, which);
+
+    /*
+     * For the unlinked path of goto_tb, we need to reset TCG_REG_TB
+     * to the beginning of this TB.
+     */
+    if (USE_REG_TB) {
+        int c = -tcg_current_code_size(s);
+        if (check_fit_i32(c, 13)) {
+            tcg_out_arithi(s, TCG_REG_TB, TCG_REG_TB, c, ARITH_ADD);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T1, c);
+            tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
+        }
+    }
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1450,38 +1485,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        /* Direct jump. */
-        if (USE_REG_TB) {
-            /* make sure the patch is 8-byte aligned.  */
-            if ((intptr_t)s->code_ptr & 4) {
-                tcg_out_nop(s);
-            }
-            set_jmp_insn_offset(s, a0);
-            tcg_out_sethi(s, TCG_REG_T1, 0);
-            tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
-            tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
-            tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
-        } else {
-            set_jmp_insn_offset(s, a0);
-            tcg_out32(s, CALL);
-            tcg_out_nop(s);
-        }
-        set_jmp_reset_offset(s, a0);
-
-        /* For the unlinked path of goto_tb, we need to reset
-           TCG_REG_TB to the beginning of this TB.  */
-        if (USE_REG_TB) {
-            c = -tcg_current_code_size(s);
-            if (check_fit_i32(c, 13)) {
-                tcg_out_arithi(s, TCG_REG_TB, TCG_REG_TB, c, ARITH_ADD);
-            } else {
-                tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T1, c);
-                tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB,
-                              TCG_REG_T1, ARITH_ADD);
-            }
-        }
-        break;
     case INDEX_op_goto_ptr:
         tcg_out_arithi(s, TCG_REG_G0, a0, 0, JMPL);
         if (USE_REG_TB) {
@@ -1700,6 +1703,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index baf3480c67..cf84ff3133 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -598,6 +598,14 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
     tcg_out_op_p(s, INDEX_op_exit_tb, (void *)arg);
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
+    /* indirect jump method. */
+    tcg_out_op_p(s, INDEX_op_goto_tb, (void *)get_jmp_target_addr(s, which));
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -605,13 +613,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGOpcode exts;
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
-        /* indirect jump method. */
-        tcg_out_op_p(s, opc, (void *)get_jmp_target_addr(s, args[0]));
-        set_jmp_reset_offset(s, args[0]);
-        break;
-
     case INDEX_op_goto_ptr:
         tcg_out_op_r(s, opc, args[0]);
         break;
@@ -784,6 +785,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
-- 
2.34.1


