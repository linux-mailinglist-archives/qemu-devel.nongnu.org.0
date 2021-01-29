Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C69308E54
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:22:38 +0100 (CET)
Received: from localhost ([::1]:35776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aHo-00016A-4n
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6l-0006ya-Si
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:07 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6j-0008Bd-Px
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:07 -0500
Received: by mail-pg1-x534.google.com with SMTP id r38so7387938pgk.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dgFs0kRvG3YRS9ydc6sjoVZGH6LkBq65P9PIXpXmt7w=;
 b=cNXI0V0Oi5eCMF5vCA+4sODl4eYEvcxDd6sAdeWEnAwhlSPpnL5dgDEh/16un4m3BC
 9eLRff/Vw8cXJaxbgQ1N1g/voq/zUYk0M2kjB6B948t6S6xd6/sd9EcpBWN261f0jyJm
 1FWTbJL6+2XIzzUH98FVB1DbgfqnmU4GeFAP0OSfbGjqzLhVnH0RPizPDqwiak61KsjH
 Cl/evRcjNvIpsGjx4FKhDnTY9I/FUK74VTH9Fnki/BY2NdW7ujNPrzK7r8jhzVI+Nooq
 GViPnUD3AdCSqt8M8BD39YfAw2bmVUTjQ1BzHikQnjoNP8HIWgBLACVYydxdMTX32Gah
 xpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dgFs0kRvG3YRS9ydc6sjoVZGH6LkBq65P9PIXpXmt7w=;
 b=lFqvl9V6KYbIRyz0ophkqEgg/PZqepx3oG/o8JWJgpQAewq5iTOvT2fi2NWmbpjEmQ
 qpnb/E0TOigoElul4BA5ju4+vdCSgXim1YPdgO2CNa2MYaTK4D8j+JdO/1dKIYL5cnyv
 SiHewCtiHANqVRNazkEbsEwNsEK4+b8g7jQo3EZOfHeYBz3WfNWEnO4V1aE2h54cP0xO
 TvfxBd7l2j8XXeC+li5cKotyIl44Qjety+ip9K2yzMC+JGu01nJ7N1PENmkLzCcUFJ+j
 TBzi7hXUPE8jmnIWnGhBYdblr97eWueDF8agMvNyWFIizlRhJxRIHl0D7fistyM8sTZB
 HHPw==
X-Gm-Message-State: AOAM5329lF77TklZdwP8yY9RD7Xig5R45lrK0J9jo+Eg5ENQmxYm1qWb
 9JkV8pjdqm3tBQfW8R3Ro6kvOcMzlbbwY+u+
X-Google-Smtp-Source: ABdhPJx06ladUb1yBp/qBPiA1Sy/ym6z3VgHgcKgOeO28QK88vsODd+UzU3OEzrwz68oMbAl9aoJnQ==
X-Received: by 2002:a05:6a00:a8f:b029:1bd:bb89:5911 with SMTP id
 b15-20020a056a000a8fb02901bdbb895911mr5738723pfl.42.1611951064412; 
 Fri, 29 Jan 2021 12:11:04 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:11:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/24] tcg/riscv: Split out constraint sets to
 tcg-target-con-set.h
Date: Fri, 29 Jan 2021 10:10:24 -1000
Message-Id: <20210129201028.787853-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
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


