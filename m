Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90DA39765F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:17:34 +0200 (CEST)
Received: from localhost ([::1]:53346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo697-0000Gy-Nq
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5u6-0002iO-QX
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:02:02 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tj-0002hX-57
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:02:02 -0400
Received: by mail-il1-x134.google.com with SMTP id i17so188008ilj.11
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V1jPITJdZ1ppIPMA3BbKEA1WyQ42rcPkfSWNMAxrubI=;
 b=EP8c+nDvrEJCrLHzaA3pZLamKZjz9umyxNfm+6JIKTtiWS65yxxFM6LgI+1PJstiOH
 /SPcwXx31YCP1kkKs/U2bB+N62DIApB7m2ddwBAEL+IG7fTdGSrr3PQ3U1b98r/ZjMF2
 2YOZqi5fkkL6L6fhPaS4JNuoDL+roIqP2i3kRGKjFU02DUE8W/kiomPV1XX4oSqTHahv
 j4dnHUAAfUS+8K6tuxB6Y2eQi+ckFi1dI9qz8LdHq+v4PuasCBgO6bRNx2YUDjS/XMl9
 bzIYbPLiUdnqwIy2szqflrCgurRNhJJ16FwGIzxL1r4LYaELw0E4VMLiUSNKwMzrZsgt
 nNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V1jPITJdZ1ppIPMA3BbKEA1WyQ42rcPkfSWNMAxrubI=;
 b=NbM/kUb2QeIoigj7n8yyzXRG2MxKfmTGlQz1rBKx9dlCXDV/mNL74yapB8NtmJoN1D
 FtxZbTFtDmqqkZ9/jUfSwqi7UkUadUMjT4HV/XMWGzHzjBY7oXKnfuOeVoXDNvfHJBwu
 WXiLjCr6dHoVBxna57pIGdrJXW5el24Heroka1beMaGLKuZNbKzJ1cugd9y/A0qqtAjx
 euhWCywl6ZMdwB4i33YHHrVgf4wpEMaKXLlHvsTA1hx2a0TWX1LnTk/x3GGsHLae69KC
 wgKrTNXttSY+CWQRq+uJrzvAFxfyuRkAx3SmhPYNsHm1IU8eS+KkQ3faFZz2f2WQPm/z
 eRbg==
X-Gm-Message-State: AOAM530GXYpofHniwQBx3AEqvgwwVtVyMdh442El4xDJc1Q2Y9P9PBtv
 0mqAyRe9CxS2AVujRp4xirBUEBJxQTYE+UJI
X-Google-Smtp-Source: ABdhPJyL46uWzbaECF4mOgSSw5t5V3nl19/cSpsJwDBwRwkBtkzirbVFF0nByKPRDsu9nAeLKsnWnA==
X-Received: by 2002:a92:c148:: with SMTP id b8mr13952872ilh.227.1622559697506; 
 Tue, 01 Jun 2021 08:01:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/27] tcg/tci: Implement mulu2, muls2
Date: Tue,  1 Jun 2021 08:01:00 -0700
Message-Id: <20210601150106.12761-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x134.google.com
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

We already had mulu2_i32 for a 32-bit host; expand this to 64-bit
hosts as well.  The muls2_i32 and the 64-bit opcodes are new.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  8 ++++----
 tcg/tci.c                | 35 +++++++++++++++++++++++++++++------
 tcg/tci/tcg-target.c.inc | 16 ++++++++++------
 3 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 59859bd8a6..71a44bbfb0 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -83,7 +83,7 @@
 #define TCG_TARGET_HAS_orc_i32          1
 #define TCG_TARGET_HAS_rot_i32          1
 #define TCG_TARGET_HAS_movcond_i32      1
-#define TCG_TARGET_HAS_muls2_i32        0
+#define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_goto_ptr         1
@@ -120,13 +120,13 @@
 #define TCG_TARGET_HAS_orc_i64          1
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_movcond_i64      1
-#define TCG_TARGET_HAS_muls2_i64        0
+#define TCG_TARGET_HAS_muls2_i64        1
 #define TCG_TARGET_HAS_add2_i32         0
 #define TCG_TARGET_HAS_sub2_i32         0
-#define TCG_TARGET_HAS_mulu2_i32        0
+#define TCG_TARGET_HAS_mulu2_i32        1
 #define TCG_TARGET_HAS_add2_i64         0
 #define TCG_TARGET_HAS_sub2_i64         0
-#define TCG_TARGET_HAS_mulu2_i64        0
+#define TCG_TARGET_HAS_mulu2_i64        1
 #define TCG_TARGET_HAS_muluh_i64        0
 #define TCG_TARGET_HAS_mulsh_i64        0
 #else
diff --git a/tcg/tci.c b/tcg/tci.c
index 1e2737e079..811af1e618 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -39,7 +39,7 @@ __thread uintptr_t tci_tb_ptr;
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
-    regs[low_index] = value;
+    regs[low_index] = (uint32_t)value;
     regs[high_index] = value >> 32;
 }
 
@@ -171,7 +171,6 @@ static void tci_args_rrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *r4 = extract32(insn, 24, 4);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrr(uint32_t insn,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
 {
@@ -180,7 +179,6 @@ static void tci_args_rrrr(uint32_t insn,
     *r2 = extract32(insn, 16, 4);
     *r3 = extract32(insn, 20, 4);
 }
-#endif
 
 static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
@@ -669,11 +667,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
+#endif /* TCG_TARGET_REG_BITS == 32 */
+#if TCG_TARGET_HAS_mulu2_i32
         case INDEX_op_mulu2_i32:
             tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
-            tci_write_reg64(regs, r1, r0, (uint64_t)regs[r2] * regs[r3]);
+            tmp64 = (uint64_t)(uint32_t)regs[r2] * (uint32_t)regs[r3];
+            tci_write_reg64(regs, r1, r0, tmp64);
             break;
-#endif /* TCG_TARGET_REG_BITS == 32 */
+#endif
+#if TCG_TARGET_HAS_muls2_i32
+        case INDEX_op_muls2_i32:
+            tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
+            tmp64 = (int64_t)(int32_t)regs[r2] * (int32_t)regs[r3];
+            tci_write_reg64(regs, r1, r0, tmp64);
+            break;
+#endif
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
         CASE_32_64(ext8s)
             tci_args_rr(insn, &r0, &r1);
@@ -777,6 +785,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = ctpop64(regs[r1]);
             break;
 #endif
+#if TCG_TARGET_HAS_mulu2_i64
+        case INDEX_op_mulu2_i64:
+            tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
+            mulu64(&regs[r0], &regs[r1], regs[r2], regs[r3]);
+            break;
+#endif
+#if TCG_TARGET_HAS_muls2_i64
+        case INDEX_op_muls2_i64:
+            tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
+            muls64(&regs[r0], &regs[r1], regs[r2], regs[r3]);
+            break;
+#endif
 
             /* Shift/rotate operations (64 bit). */
 
@@ -1284,14 +1304,17 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
-#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_mulu2_i32:
+    case INDEX_op_mulu2_i64:
+    case INDEX_op_muls2_i32:
+    case INDEX_op_muls2_i64:
         tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
                            op_name, str_r(r0), str_r(r1),
                            str_r(r2), str_r(r3));
         break;
 
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
         tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 748bc13d4e..e617c46366 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -141,10 +141,14 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O2_I4(r, r, r, r, r, r);
     case INDEX_op_brcond2_i32:
         return C_O0_I4(r, r, r, r);
-    case INDEX_op_mulu2_i32:
-        return C_O2_I2(r, r, r, r);
 #endif
 
+    case INDEX_op_mulu2_i32:
+    case INDEX_op_mulu2_i64:
+    case INDEX_op_muls2_i32:
+    case INDEX_op_muls2_i64:
+        return C_O2_I2(r, r, r, r);
+
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
@@ -434,7 +438,6 @@ static void tcg_out_op_rrrrr(TCGContext *s, TCGOpcode op, TCGReg r0,
     tcg_out32(s, insn);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
 {
@@ -447,7 +450,6 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
     insn = deposit32(insn, 20, 4, r3);
     tcg_out32(s, insn);
 }
-#endif
 
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
@@ -726,10 +728,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                           args[0], args[1], args[2], args[3], args[4]);
         tcg_out_op_rl(s, INDEX_op_brcond_i32, TCG_REG_TMP, arg_label(args[5]));
         break;
-    case INDEX_op_mulu2_i32:
+#endif
+
+    CASE_32_64(mulu2)
+    CASE_32_64(muls2)
         tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
         break;
-#endif
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_st_i32:
-- 
2.25.1


