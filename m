Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D76F8FD8
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:24:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCGI-000506-8M; Sat, 06 May 2023 03:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGE-0004uc-QP
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:23:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFr-0004UU-Js
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:23:18 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30786c6082dso243131f8f.2
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357774; x=1685949774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8auTOlyLXqTfCckvUiWN7Zc35mefBco1qqtfpVHTz4=;
 b=x+yANA2bNIHsW5uCAzNLl6dZO+XABhxnF1ydGZETotZlZtDjoZCAh3oKLQbqG9JIv6
 6/hPGUMpcDCMo7/Gl3xk/mfhI0HTIQnQYA1WbIRsVCXVOH3OLuWiqJ8ORFrHbzqLwsyg
 oac2lkaSZGrksejngXcNjH/24V9F7m6kmjLxzgjqTRSqbrHlLofFWhLekAGFffLBXiUd
 NuDpy0Ypf7Osui1ZAo9PvlZlX0/HSDpKy0cJecOxFjOJLVCDojrArd0HqfIxAYuIyTdJ
 UtYwb+2Bmvm2Z3xH4aG8MajyknkpGWpGrmzzTht+DTxdFnhb4Qzy1Z0t+bMzdtAcAM2R
 oKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357774; x=1685949774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8auTOlyLXqTfCckvUiWN7Zc35mefBco1qqtfpVHTz4=;
 b=TYViDvNHozGq4L1RKfppdVd1je95vmL0lExqaCwcrt+xH+kwqa5/1RRYP8J3p+5Aw6
 OxQTdbV4oAQbqhNchPSpzwS3a2HVWmt8vkRnWG/cHYvF+pEWF9hxc9ZFh4o/0TsLyDa2
 jimgoFZ5i0BTfq6+cBc4yNOjHl4OB9BrZo5+XCJdK9Pv8H/7/1wBY9zICqa94y+WhZK1
 zd253s7hMU8C8DSuVS/qYZneVdJQzwb5KzokoY8PvwvW7rXVL/kVp12rv1h6mPQSlhVk
 oLrYA5Awll3zbAMmOgzMtZa78reEPYR2rZiVHdN4IOORuIglN+yJYuXaYDzvFk2tp92Z
 T1Dg==
X-Gm-Message-State: AC+VfDwagkclvinnbmh1VRj7cTN7k9v/fNOPxlc+4fcQa7v/AK+PDsx7
 IZlFteo5mLe2hzg8xwhTqbuSqatC068tpxkf8e2Iuw==
X-Google-Smtp-Source: ACHHUZ60T7Wrr3A3JmJY0cOff/9gWNAo7COtx71m6eAJAadaIaiGdQIMI0alJ7f0Ot/mObtFVVnGbA==
X-Received: by 2002:adf:fbc8:0:b0:306:2b40:1258 with SMTP id
 d8-20020adffbc8000000b003062b401258mr2575885wrs.21.1683357774246; 
 Sat, 06 May 2023 00:22:54 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 23/30] tcg/mips: Simplify constraints on qemu_ld/st
Date: Sat,  6 May 2023 08:22:28 +0100
Message-Id: <20230506072235.597467-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The softmmu tlb uses TCG_REG_TMP[0-3], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
and have eliminated use of A0, we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target-con-set.h | 13 +++++--------
 tcg/mips/tcg-target-con-str.h |  2 --
 tcg/mips/tcg-target.c.inc     | 30 ++++++++----------------------
 3 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/tcg/mips/tcg-target-con-set.h b/tcg/mips/tcg-target-con-set.h
index fe3e868a2f..864034f468 100644
--- a/tcg/mips/tcg-target-con-set.h
+++ b/tcg/mips/tcg-target-con-set.h
@@ -12,15 +12,13 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O0_I2(SZ, S)
-C_O0_I3(SZ, S, S)
-C_O0_I3(SZ, SZ, S)
+C_O0_I3(rZ, r, r)
+C_O0_I3(rZ, rZ, r)
 C_O0_I4(rZ, rZ, rZ, rZ)
-C_O0_I4(SZ, SZ, S, S)
-C_O1_I1(r, L)
+C_O0_I4(rZ, rZ, r, r)
 C_O1_I1(r, r)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, L, L)
+C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rIK)
@@ -30,7 +28,6 @@ C_O1_I2(r, rZ, rN)
 C_O1_I2(r, rZ, rZ)
 C_O1_I4(r, rZ, rZ, rZ, 0)
 C_O1_I4(r, rZ, rZ, rZ, rZ)
-C_O2_I1(r, r, L)
-C_O2_I2(r, r, L, L)
+C_O2_I1(r, r, r)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rZ, rZ, rN, rN)
diff --git a/tcg/mips/tcg-target-con-str.h b/tcg/mips/tcg-target-con-str.h
index e4b2965c72..413c280a7a 100644
--- a/tcg/mips/tcg-target-con-str.h
+++ b/tcg/mips/tcg-target-con-str.h
@@ -9,8 +9,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_QLOAD_REGS)
-REGS('S', ALL_QSTORE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 695c137023..5ad9867882 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -176,20 +176,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_WSZ  0x2000   /* word size */
 
 #define ALL_GENERAL_REGS  0xffffffffu
-#define NOA0_REGS         (ALL_GENERAL_REGS & ~(1 << TCG_REG_A0))
-
-#ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
-    (NOA0_REGS & ~((TCG_TARGET_REG_BITS < TARGET_LONG_BITS) << TCG_REG_A2))
-#define ALL_QSTORE_REGS \
-    (NOA0_REGS & ~(TCG_TARGET_REG_BITS < TARGET_LONG_BITS   \
-                   ? (1 << TCG_REG_A2) | (1 << TCG_REG_A3)  \
-                   : (1 << TCG_REG_A1)))
-#else
-#define ALL_QLOAD_REGS   NOA0_REGS
-#define ALL_QSTORE_REGS  NOA0_REGS
-#endif
-
 
 static bool is_p2m1(tcg_target_long val)
 {
@@ -2232,18 +2218,18 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, L) : C_O1_I2(r, L, L));
+                ? C_O1_I1(r, r) : C_O1_I2(r, r, r));
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(SZ, S) : C_O0_I3(SZ, S, S));
+                ? C_O0_I2(rZ, r) : C_O0_I3(rZ, r, r));
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, L)
-                : C_O2_I2(r, r, L, L));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
+                : C_O2_I2(r, r, r, r));
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(SZ, S)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(SZ, SZ, S)
-                : C_O0_I4(SZ, SZ, S, S));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(rZ, r)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(rZ, rZ, r)
+                : C_O0_I4(rZ, rZ, r, r));
 
     default:
         g_assert_not_reached();
-- 
2.34.1


