Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE0B397688
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:25:39 +0200 (CEST)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6Gw-00045S-Kz
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5u4-0002gF-DG
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:02:00 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:42690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tk-0002iN-Rv
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:58 -0400
Received: by mail-il1-x12b.google.com with SMTP id h11so13193210ili.9
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tyqSPXpf2noLnwKm3Tkyr44F0DVJfJNxGZScdAWD6DA=;
 b=pr3/6r7yRl/pM0FTNCXxVRVehVtbSCJrcA/ppVDRTIIj3+lS8DGUtAhhB7zM3cMN2H
 lfVi+TBw1xVc94BmxG0rGfO8+xBLr2poVCWtEVlzrZ/tX+CIw8GqOd2vOlB5e/XaMFFd
 9yh6cgyOLcUvelSUw6bMUHcJtrAZgWy1MGvHFWCuvwnRa1bqwyzapTkkGPBbMLoF56IB
 Tc7HOnpJIs71/sB08/FOM2ZycWWu32F8JnceYDySAOasg38Ei+LD/N/gyWmpBr5DUThX
 q7KQgpcIZoOXFpfvTs2xv96ywFgrW1vyHLxjiRu43D4LATBUC9HgzCDbDDnzRjwmNTEW
 eGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyqSPXpf2noLnwKm3Tkyr44F0DVJfJNxGZScdAWD6DA=;
 b=rSL46FNYSfq4FSFVZfzKX71n6BoHSZpr/WYMmyImu7r3fmF3060qNJaa9A2A+Javb3
 xcGWaDwsi/tTu+8uwXHDyMNxB76iDDdX57UwjlRRlXjVlre5qjx+MD0iw0LQERywjkaV
 Wqp4P5BaPIRxiRja4J2KD3k8fQ/+ddkQcUpwxGJiTAm9S1CfyhrIQP/uqR4c4hG1AAh/
 7y+zXeqEFHeFzOLabM3sQK8Wlg1RO1AIjO7pMZl0dyyjRmd9FShp2VlcopSEz50vrAPE
 Sgf8waiyqtw/gARV5LNdEU8oQ2zvwAzALNl9sExunt74YaJUa/HWGwK/+UwahJ2N/5eg
 p1fQ==
X-Gm-Message-State: AOAM532twLqnViznEA8hF1+F8s/xo2hB3EGqeW36x2i4crc8bPOumJsl
 zWg3TW7nLXwgetS9MtqCacnAe1XKZg0X8k3F
X-Google-Smtp-Source: ABdhPJxz2WM6hqwpppUyKuz92EQVU3iUyy5gZ9UaydX/jX9k5G3zpXg5eX/EksIefgUhUqrRidBuIA==
X-Received: by 2002:a05:6e02:1546:: with SMTP id
 j6mr22755666ilu.125.1622559698567; 
 Tue, 01 Jun 2021 08:01:38 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 22/27] tcg/tci: Implement add2, sub2
Date: Tue,  1 Jun 2021 08:01:01 -0700
Message-Id: <20210601150106.12761-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We already had the 32-bit versions for a 32-bit host; expand this
to 64-bit hosts as well.  The 64-bit opcodes are new.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  8 ++++----
 tcg/tci.c                | 40 ++++++++++++++++++++++++++--------------
 tcg/tci/tcg-target.c.inc | 15 ++++++++-------
 3 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 71a44bbfb0..515b3c7a56 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -121,11 +121,11 @@
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_muls2_i64        1
-#define TCG_TARGET_HAS_add2_i32         0
-#define TCG_TARGET_HAS_sub2_i32         0
+#define TCG_TARGET_HAS_add2_i32         1
+#define TCG_TARGET_HAS_sub2_i32         1
 #define TCG_TARGET_HAS_mulu2_i32        1
-#define TCG_TARGET_HAS_add2_i64         0
-#define TCG_TARGET_HAS_sub2_i64         0
+#define TCG_TARGET_HAS_add2_i64         1
+#define TCG_TARGET_HAS_sub2_i64         1
 #define TCG_TARGET_HAS_mulu2_i64        1
 #define TCG_TARGET_HAS_muluh_i64        0
 #define TCG_TARGET_HAS_mulsh_i64        0
diff --git a/tcg/tci.c b/tcg/tci.c
index 811af1e618..eb9b1ab463 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -191,7 +191,6 @@ static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *c5 = extract32(insn, 28, 4);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
 {
@@ -202,7 +201,6 @@ static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *r4 = extract32(insn, 24, 4);
     *r5 = extract32(insn, 28, 4);
 }
-#endif
 
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
@@ -353,17 +351,14 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
     for (;;) {
         uint32_t insn;
         TCGOpcode opc;
-        TCGReg r0, r1, r2, r3, r4;
+        TCGReg r0, r1, r2, r3, r4, r5;
         tcg_target_ulong t1;
         TCGCond condition;
         target_ulong taddr;
         uint8_t pos, len;
         uint32_t tmp32;
         uint64_t tmp64;
-#if TCG_TARGET_REG_BITS == 32
-        TCGReg r5;
         uint64_t T1, T2;
-#endif
         TCGMemOpIdx oi;
         int32_t ofs;
         void *ptr;
@@ -654,20 +649,22 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 tb_ptr = ptr;
             }
             break;
-#if TCG_TARGET_REG_BITS == 32
+#if TCG_TARGET_REG_BITS == 32 || TCG_TARGET_HAS_add2_i32
         case INDEX_op_add2_i32:
             tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
             T1 = tci_uint64(regs[r3], regs[r2]);
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 + T2);
             break;
+#endif
+#if TCG_TARGET_REG_BITS == 32 || TCG_TARGET_HAS_sub2_i32
         case INDEX_op_sub2_i32:
             tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
             T1 = tci_uint64(regs[r3], regs[r2]);
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
-#endif /* TCG_TARGET_REG_BITS == 32 */
+#endif
 #if TCG_TARGET_HAS_mulu2_i32
         case INDEX_op_mulu2_i32:
             tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
@@ -797,6 +794,24 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             muls64(&regs[r0], &regs[r1], regs[r2], regs[r3]);
             break;
 #endif
+#if TCG_TARGET_HAS_add2_i64
+        case INDEX_op_add2_i64:
+            tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = regs[r2] + regs[r4];
+            T2 = regs[r3] + regs[r5] + (T1 < regs[r2]);
+            regs[r0] = T1;
+            regs[r1] = T2;
+            break;
+#endif
+#if TCG_TARGET_HAS_add2_i64
+        case INDEX_op_sub2_i64:
+            tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = regs[r2] - regs[r4];
+            T2 = regs[r3] - regs[r5] - (regs[r2] < regs[r4]);
+            regs[r0] = T1;
+            regs[r1] = T2;
+            break;
+#endif
 
             /* Shift/rotate operations (64 bit). */
 
@@ -1113,10 +1128,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     const char *op_name;
     uint32_t insn;
     TCGOpcode op;
-    TCGReg r0, r1, r2, r3, r4;
-#if TCG_TARGET_REG_BITS == 32
-    TCGReg r5;
-#endif
+    TCGReg r0, r1, r2, r3, r4, r5;
     tcg_target_ulong i1;
     int32_t s2;
     TCGCond c;
@@ -1314,15 +1326,15 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r2), str_r(r3));
         break;
 
-#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
+    case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
+    case INDEX_op_sub2_i64:
         tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s, %s, %s",
                            op_name, str_r(r0), str_r(r1), str_r(r2),
                            str_r(r3), str_r(r4), str_r(r5));
         break;
-#endif
 
     case INDEX_op_qemu_ld_i64:
     case INDEX_op_qemu_st_i64:
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e617c46366..bb04c326e8 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -134,11 +134,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_brcond_i64:
         return C_O0_I2(r, r);
 
-#if TCG_TARGET_REG_BITS == 32
-    /* TODO: Support R, R, R, R, RI, RI? Will it be faster? */
     case INDEX_op_add2_i32:
+    case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
+    case INDEX_op_sub2_i64:
         return C_O2_I4(r, r, r, r, r, r);
+
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_brcond2_i32:
         return C_O0_I4(r, r, r, r);
 #endif
@@ -467,7 +469,6 @@ static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
     tcg_out32(s, insn);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGReg r5)
@@ -483,7 +484,6 @@ static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
     insn = deposit32(insn, 28, 4, r5);
     tcg_out32(s, insn);
 }
-#endif
 
 static void tcg_out_ldst(TCGContext *s, TCGOpcode op, TCGReg val,
                          TCGReg base, intptr_t offset)
@@ -717,12 +717,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
-#if TCG_TARGET_REG_BITS == 32
-    case INDEX_op_add2_i32:
-    case INDEX_op_sub2_i32:
+    CASE_32_64(add2)
+    CASE_32_64(sub2)
         tcg_out_op_rrrrrr(s, opc, args[0], args[1], args[2],
                           args[3], args[4], args[5]);
         break;
+
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_brcond2_i32:
         tcg_out_op_rrrrrc(s, INDEX_op_setcond2_i32, TCG_REG_TMP,
                           args[0], args[1], args[2], args[3], args[4]);
-- 
2.25.1


