Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E7D612FE2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:42:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNX4-0001al-BT; Mon, 31 Oct 2022 01:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNX1-0001ab-G7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:19 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNWz-0003kQ-LE
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:19 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 k59-20020a9d19c1000000b0066c45cdfca5so1807823otk.10
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JOI9wCa8HkP733gcye6yWCLDNfK9DpfpzUVfiO5LUvs=;
 b=J1V7LwUUNunw/Ooh+m4iYZnBuQ+PHGFi/VA/2+ieFR/uwf8oTSJd8hs50BG/OVn1Bz
 9QWXElDnANIh7Tjqsd1eLw6Q+cMm/rsyFo4dfpkvVAJYaZxOzHiRNL6eZ/uOKcstxo4S
 mjt63p7g9ASztjjeqy9CX26uv7L/2MZJZnQ2PeFPU9mEVUqQOetYOSUgU1Gbob6CYzvW
 SH0Knltv+74k+Bf3QOZ1wq+nJY/7QAOkwNuhl05LKeil3lU8HywUttFD+lqp7Acj0tet
 pPoTJvmt1g53cO3ogoYBL7kdhZNAiekk1PPQStvUPI/esKF9+ntaGrQDqebYcnTh6bg6
 Y9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JOI9wCa8HkP733gcye6yWCLDNfK9DpfpzUVfiO5LUvs=;
 b=YG0Czqc6zJmELqkU6f7zTBQ3r4PVm+7v+zrZLgi4zSCuREE1jmTxdvlCzJaZu7eYui
 Qjyz0I2iWniOxJ2bLxgz2viGhGgq8SBTUEAYYs6s+AIzJm7OZ40fZcP7l7WWAkGKKB2W
 McDxB9eONZ+OjONeAynJx1I18UaE20xRwHTzNLiKLBXHLtUsfr6fGD/gb5YRakU5YHPT
 /dLKAlaR1P4QkKMnvaXvn4X918er+G+w6f0jFCugZCS3jYVBr2r4HhxXH6NdC9mh8WrH
 iCnQYY/Gf2UJJ7/n+SNahoEipmK/FO0r1tuPpBEmciq2aLXbI0hwjkg6doQ0S9I+iK2N
 YHQQ==
X-Gm-Message-State: ACrzQf30K0RCfJixKzbrHNgfTuLh0B1LcxJed2++q68U7exDd8Dn00F6
 /9jVeqHuZQ1l5cq5fAP82/O10EMR3qYThA==
X-Google-Smtp-Source: AMsMyM4ieS8HjECCNzS7otZR99wt+zHgGm8HDkEscqy6yY8cpc0sajAic3TVXlfTUG8C8lPUhGNDcQ==
X-Received: by 2002:a9d:2909:0:b0:661:9cae:6f08 with SMTP id
 d9-20020a9d2909000000b006619cae6f08mr5816307otb.277.1667194816310; 
 Sun, 30 Oct 2022 22:40:16 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:40:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/11] tcg/sparc64: Remove sparc32plus constraints
Date: Mon, 31 Oct 2022 16:39:40 +1100
Message-Id: <20221031053948.3408-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
References: <20221031053948.3408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With sparc64 we need not distinguish between registers that
can hold 32-bit values and those that can hold 64-bit values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target-con-set.h |  16 +----
 tcg/sparc64/tcg-target-con-str.h |   3 -
 tcg/sparc64/tcg-target.c.inc     | 109 ++++++++++++-------------------
 3 files changed, 44 insertions(+), 84 deletions(-)

diff --git a/tcg/sparc64/tcg-target-con-set.h b/tcg/sparc64/tcg-target-con-set.h
index 3b751dc3fb..31e6fea1fc 100644
--- a/tcg/sparc64/tcg-target-con-set.h
+++ b/tcg/sparc64/tcg-target-con-set.h
@@ -11,22 +11,12 @@
  */
 C_O0_I1(r)
 C_O0_I2(rZ, r)
-C_O0_I2(RZ, r)
 C_O0_I2(rZ, rJ)
-C_O0_I2(RZ, RJ)
-C_O0_I2(sZ, A)
-C_O0_I2(SZ, A)
-C_O1_I1(r, A)
-C_O1_I1(R, A)
+C_O0_I2(sZ, s)
+C_O1_I1(r, s)
 C_O1_I1(r, r)
-C_O1_I1(r, R)
-C_O1_I1(R, r)
-C_O1_I1(R, R)
-C_O1_I2(R, R, R)
+C_O1_I2(r, r, r)
 C_O1_I2(r, rZ, rJ)
-C_O1_I2(R, RZ, RJ)
 C_O1_I4(r, rZ, rJ, rI, 0)
-C_O1_I4(R, RZ, RJ, RI, 0)
 C_O2_I2(r, r, rZ, rJ)
-C_O2_I4(R, R, RZ, RZ, RJ, RI)
 C_O2_I4(r, r, rZ, rZ, rJ, rJ)
diff --git a/tcg/sparc64/tcg-target-con-str.h b/tcg/sparc64/tcg-target-con-str.h
index fdb25d9313..8f5c7aef97 100644
--- a/tcg/sparc64/tcg-target-con-str.h
+++ b/tcg/sparc64/tcg-target-con-str.h
@@ -9,10 +9,7 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('R', ALL_GENERAL_REGS64)
 REGS('s', ALL_QLDST_REGS)
-REGS('S', ALL_QLDST_REGS64)
-REGS('A', TARGET_LONG_BITS == 64 ? ALL_QLDST_REGS64 : ALL_QLDST_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 097bcfcd12..cb9453efdd 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -80,19 +80,8 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #else
 #define SOFTMMU_RESERVE_REGS 0
 #endif
-
-/*
- * Note that sparcv8plus can only hold 64 bit quantities in %g and %o
- * registers.  These are saved manually by the kernel in full 64-bit
- * slots.  The %i and %l registers are saved by the register window
- * mechanism, which only allocates space for 32 bits.  Given that this
- * window spill/fill can happen on any signal, we must consider the
- * high bits of the %i and %l registers garbage at all times.
- */
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
-# define ALL_GENERAL_REGS64  ALL_GENERAL_REGS
 #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
-#define ALL_QLDST_REGS64     (ALL_GENERAL_REGS64 & ~SOFTMMU_RESERVE_REGS)
 
 /* Define some temporary registers.  T2 is used for constant generation.  */
 #define TCG_REG_T1  TCG_REG_G1
@@ -1738,107 +1727,91 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8u_i64:
     case INDEX_op_ld8s_i32:
+    case INDEX_op_ld8s_i64:
     case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16u_i64:
     case INDEX_op_ld16s_i32:
+    case INDEX_op_ld16s_i64:
     case INDEX_op_ld_i32:
+    case INDEX_op_ld32u_i64:
+    case INDEX_op_ld32s_i64:
+    case INDEX_op_ld_i64:
     case INDEX_op_neg_i32:
+    case INDEX_op_neg_i64:
     case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
+    case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
+    case INDEX_op_extrh_i64_i32:
         return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
+    case INDEX_op_st8_i64:
     case INDEX_op_st16_i32:
+    case INDEX_op_st16_i64:
     case INDEX_op_st_i32:
+    case INDEX_op_st32_i64:
+    case INDEX_op_st_i64:
         return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
+    case INDEX_op_add_i64:
     case INDEX_op_mul_i32:
+    case INDEX_op_mul_i64:
     case INDEX_op_div_i32:
+    case INDEX_op_div_i64:
     case INDEX_op_divu_i32:
+    case INDEX_op_divu_i64:
     case INDEX_op_sub_i32:
+    case INDEX_op_sub_i64:
     case INDEX_op_and_i32:
+    case INDEX_op_and_i64:
     case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
     case INDEX_op_or_i32:
+    case INDEX_op_or_i64:
     case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
     case INDEX_op_xor_i32:
+    case INDEX_op_xor_i64:
     case INDEX_op_shl_i32:
+    case INDEX_op_shl_i64:
     case INDEX_op_shr_i32:
+    case INDEX_op_shr_i64:
     case INDEX_op_sar_i32:
+    case INDEX_op_sar_i64:
     case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
         return C_O1_I2(r, rZ, rJ);
 
     case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rJ);
     case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
         return C_O1_I4(r, rZ, rJ, rI, 0);
     case INDEX_op_add2_i32:
+    case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
+    case INDEX_op_sub2_i64:
         return C_O2_I4(r, r, rZ, rZ, rJ, rJ);
     case INDEX_op_mulu2_i32:
     case INDEX_op_muls2_i32:
         return C_O2_I2(r, r, rZ, rJ);
-
-    case INDEX_op_ld8u_i64:
-    case INDEX_op_ld8s_i64:
-    case INDEX_op_ld16u_i64:
-    case INDEX_op_ld16s_i64:
-    case INDEX_op_ld32u_i64:
-    case INDEX_op_ld32s_i64:
-    case INDEX_op_ld_i64:
-    case INDEX_op_ext_i32_i64:
-    case INDEX_op_extu_i32_i64:
-        return C_O1_I1(R, r);
-
-    case INDEX_op_st8_i64:
-    case INDEX_op_st16_i64:
-    case INDEX_op_st32_i64:
-    case INDEX_op_st_i64:
-        return C_O0_I2(RZ, r);
-
-    case INDEX_op_add_i64:
-    case INDEX_op_mul_i64:
-    case INDEX_op_div_i64:
-    case INDEX_op_divu_i64:
-    case INDEX_op_sub_i64:
-    case INDEX_op_and_i64:
-    case INDEX_op_andc_i64:
-    case INDEX_op_or_i64:
-    case INDEX_op_orc_i64:
-    case INDEX_op_xor_i64:
-    case INDEX_op_shl_i64:
-    case INDEX_op_shr_i64:
-    case INDEX_op_sar_i64:
-    case INDEX_op_setcond_i64:
-        return C_O1_I2(R, RZ, RJ);
-
-    case INDEX_op_neg_i64:
-    case INDEX_op_not_i64:
-    case INDEX_op_ext32s_i64:
-    case INDEX_op_ext32u_i64:
-        return C_O1_I1(R, R);
-
-    case INDEX_op_extrl_i64_i32:
-    case INDEX_op_extrh_i64_i32:
-        return C_O1_I1(r, R);
-
-    case INDEX_op_brcond_i64:
-        return C_O0_I2(RZ, RJ);
-    case INDEX_op_movcond_i64:
-        return C_O1_I4(R, RZ, RJ, RI, 0);
-    case INDEX_op_add2_i64:
-    case INDEX_op_sub2_i64:
-        return C_O2_I4(R, R, RZ, RZ, RJ, RI);
     case INDEX_op_muluh_i64:
-        return C_O1_I2(R, R, R);
+        return C_O1_I2(r, r, r);
 
     case INDEX_op_qemu_ld_i32:
-        return C_O1_I1(r, A);
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(R, A);
+        return C_O1_I1(r, s);
     case INDEX_op_qemu_st_i32:
-        return C_O0_I2(sZ, A);
     case INDEX_op_qemu_st_i64:
-        return C_O0_I2(SZ, A);
+        return C_O0_I2(sZ, s);
 
     default:
         g_assert_not_reached();
@@ -1859,7 +1832,7 @@ static void tcg_target_init(TCGContext *s)
 #endif
 
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
-    tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS64;
+    tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
 
     tcg_target_call_clobber_regs = 0;
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_G1);
-- 
2.34.1


