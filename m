Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8749230D197
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:33:01 +0100 (CET)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77yW-00024D-JQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iV-0007yf-MD
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:27 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iT-00015i-M7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:27 -0500
Received: by mail-pg1-x534.google.com with SMTP id t25so16252014pga.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dgFs0kRvG3YRS9ydc6sjoVZGH6LkBq65P9PIXpXmt7w=;
 b=P34b+cJu0JGgF/uYikZHnbq11ZYvLFsAipc8Sya8/l4KGmdJUn4e9iT63LHyyjAUjw
 hn7qoDSLytPWinVox5k6sUdex6yzwlpacHp8YGkzSqOKJNtiCW90FWAiZO5cbU4dojDN
 KN8lGcxiCXWm6jAyqJpwcCubC8VeOWsqMG0XALv9WxVBIM+bmga17/e/D0l2I1jSxnia
 j01H+l8A/TC95TwoXv8tDLwPlZ09HjOb3vYslGeTFZsAiRyJiI1OE4u4QsUCkWPV+0qM
 GeEHFYgdlv7nWmWqII8nzHeV5tbujNADJGk6d4xFsvOOlmwqbs5yRhTgFA1C6JkpWCgp
 cu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dgFs0kRvG3YRS9ydc6sjoVZGH6LkBq65P9PIXpXmt7w=;
 b=DZqxf0+IAQgombo9fo/RUyhUHQwAQUL5qd1ZhV9B13MHT1Fft+O3JVPz6a6uM9iOXh
 gDjMMeW3jR6kirqpeyDVZXkn7FMtke6CUnHXZKQ5vZpGEMIYg08sqPuiaTs5vkXPA/tl
 4OaJtUgtJmub5sivF2+QaIdtbEMKKZuJnqQmTfVjJkzMaNIm1jUNs7KrFZTzkBUiVSmR
 x44bt8m16VUYMmTUZEQ3+Kcn+uh8WExeeeXKAHxiSSdv6UrpokRn/kPE9bzAAh2YOq1h
 1A+TypJpkbEIQMgYNJ50hAHZyiCW6XHPMTsJczT59hWPoMmCwhTnwtXTdtsmoeLJZmos
 rbOg==
X-Gm-Message-State: AOAM531fy6pLBrPLKRA40Ffws/mntp8sannNikno9REKoV34D1Bq0zyO
 hg1rRuIAxsoHttqxeK71R1ZC0a3bsQ7mVsnx
X-Google-Smtp-Source: ABdhPJw4NEXdyjFg9QMeWFofPdCE78sQCDdXDhTNRxm7ESDbRorGwQpWHloMqQWdAwC78vd2InRT1Q==
X-Received: by 2002:a05:6a00:8d0:b029:1b6:3581:4f41 with SMTP id
 s16-20020a056a0008d0b02901b635814f41mr895329pfu.56.1612318584336; 
 Tue, 02 Feb 2021 18:16:24 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/24] tcg/riscv: Split out constraint sets to
 tcg-target-con-set.h
Date: Tue,  2 Feb 2021 16:15:46 -1000
Message-Id: <20210203021550.375058-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h | 30 ++++++++++++
 tcg/riscv/tcg-target.h         |  1 +
 tcg/riscv/tcg-target.c.inc     | 83 ++++++++++------------------------
 3 files changed, 54 insertions(+), 60 deletions(-)
 create mode 100644 tcg/riscv/tcg-target-con-set.h

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
new file mode 100644
index 0000000000..cf0ac4d751
--- /dev/null
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define RISC-V target-specific constraint sets.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * C_On_Im(...) defines a constraint set with <n> outputs and <m> inputs.
+ * Each operand should be a sequence of constraint letters as defined by
+ * tcg-target-con-str.h; the constraint combination is inclusive or.
+ */
+C_O0_I1(r)
+C_O0_I2(LZ, L)
+C_O0_I2(rZ, r)
+C_O0_I2(rZ, rZ)
+C_O0_I3(LZ, L, L)
+C_O0_I3(LZ, LZ, L)
+C_O0_I4(LZ, LZ, L, L)
+C_O0_I4(rZ, rZ, rZ, rZ)
+C_O1_I1(r, L)
+C_O1_I1(r, r)
+C_O1_I2(r, L, L)
+C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
+C_O1_I2(r, rZ, rN)
+C_O1_I2(r, rZ, rZ)
+C_O1_I4(r, rZ, rZ, rZ, rZ)
+C_O2_I1(r, r, L)
+C_O2_I2(r, r, L, L)
+C_O2_I4(r, r, rZ, rZ, rM, rM)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 727c8df418..a998b951e4 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -171,5 +171,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
+#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 20d5b5ef01..e700c52067 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1543,50 +1543,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r
-        = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef r_r
-        = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef rZ_r
-        = { .args_ct_str = { "rZ", "r" } };
-    static const TCGTargetOpDef rZ_rZ
-        = { .args_ct_str = { "rZ", "rZ" } };
-    static const TCGTargetOpDef rZ_rZ_rZ_rZ
-        = { .args_ct_str = { "rZ", "rZ", "rZ", "rZ" } };
-    static const TCGTargetOpDef r_r_ri
-        = { .args_ct_str = { "r", "r", "ri" } };
-    static const TCGTargetOpDef r_r_rI
-        = { .args_ct_str = { "r", "r", "rI" } };
-    static const TCGTargetOpDef r_rZ_rN
-        = { .args_ct_str = { "r", "rZ", "rN" } };
-    static const TCGTargetOpDef r_rZ_rZ
-        = { .args_ct_str = { "r", "rZ", "rZ" } };
-    static const TCGTargetOpDef r_rZ_rZ_rZ_rZ
-        = { .args_ct_str = { "r", "rZ", "rZ", "rZ", "rZ" } };
-    static const TCGTargetOpDef r_L
-        = { .args_ct_str = { "r", "L" } };
-    static const TCGTargetOpDef r_r_L
-        = { .args_ct_str = { "r", "r", "L" } };
-    static const TCGTargetOpDef r_L_L
-        = { .args_ct_str = { "r", "L", "L" } };
-    static const TCGTargetOpDef r_r_L_L
-        = { .args_ct_str = { "r", "r", "L", "L" } };
-    static const TCGTargetOpDef LZ_L
-        = { .args_ct_str = { "LZ", "L" } };
-    static const TCGTargetOpDef LZ_L_L
-        = { .args_ct_str = { "LZ", "L", "L" } };
-    static const TCGTargetOpDef LZ_LZ_L
-        = { .args_ct_str = { "LZ", "LZ", "L" } };
-    static const TCGTargetOpDef LZ_LZ_L_L
-        = { .args_ct_str = { "LZ", "LZ", "L", "L" } };
-    static const TCGTargetOpDef r_r_rZ_rZ_rM_rM
-        = { .args_ct_str = { "r", "r", "rZ", "rZ", "rM", "rM" } };
-
     switch (op) {
     case INDEX_op_goto_ptr:
-        return &r;
+        return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
@@ -1618,7 +1579,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
     case INDEX_op_ext_i32_i64:
-        return &r_r;
+        return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
     case INDEX_op_st16_i32:
@@ -1627,7 +1588,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
-        return &rZ_r;
+        return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_and_i32:
@@ -1637,11 +1598,11 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_and_i64:
     case INDEX_op_or_i64:
     case INDEX_op_xor_i64:
-        return &r_r_rI;
+        return C_O1_I2(r, r, rI);
 
     case INDEX_op_sub_i32:
     case INDEX_op_sub_i64:
-        return &r_rZ_rN;
+        return C_O1_I2(r, rZ, rN);
 
     case INDEX_op_mul_i32:
     case INDEX_op_mulsh_i32:
@@ -1659,7 +1620,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rem_i64:
     case INDEX_op_remu_i64:
     case INDEX_op_setcond_i64:
-        return &r_rZ_rZ;
+        return C_O1_I2(r, rZ, rZ);
 
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
@@ -1667,39 +1628,41 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shl_i64:
     case INDEX_op_shr_i64:
     case INDEX_op_sar_i64:
-        return &r_r_ri;
+        return C_O1_I2(r, r, ri);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        return &rZ_rZ;
+        return C_O0_I2(rZ, rZ);
 
     case INDEX_op_add2_i32:
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
     case INDEX_op_sub2_i64:
-        return &r_r_rZ_rZ_rM_rM;
+        return C_O2_I4(r, r, rZ, rZ, rM, rM);
 
     case INDEX_op_brcond2_i32:
-        return &rZ_rZ_rZ_rZ;
+        return C_O0_I4(rZ, rZ, rZ, rZ);
 
     case INDEX_op_setcond2_i32:
-        return &r_rZ_rZ_rZ_rZ;
+        return C_O1_I4(r, rZ, rZ, rZ, rZ);
 
     case INDEX_op_qemu_ld_i32:
-        return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &r_L : &r_L_L;
+        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
+                ? C_O1_I1(r, L) : C_O1_I2(r, L, L));
     case INDEX_op_qemu_st_i32:
-        return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &LZ_L : &LZ_L_L;
+        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
+                ? C_O0_I2(LZ, L) : C_O0_I3(LZ, L, L));
     case INDEX_op_qemu_ld_i64:
-        return TCG_TARGET_REG_BITS == 64 ? &r_L
-               : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &r_r_L
-               : &r_r_L_L;
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
+               : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O2_I1(r, r, L)
+               : C_O2_I2(r, r, L, L));
     case INDEX_op_qemu_st_i64:
-        return TCG_TARGET_REG_BITS == 64 ? &LZ_L
-               : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &LZ_LZ_L
-               : &LZ_LZ_L_L;
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(LZ, L)
+               : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O0_I3(LZ, LZ, L)
+               : C_O0_I4(LZ, LZ, L, L));
 
     default:
-        return NULL;
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


