Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BC53071A6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:39:12 +0100 (CET)
Received: from localhost ([::1]:38532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52pa-0004Zq-TU
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:39:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ap-0005pu-1I
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:55 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52am-0005hS-Vm
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:54 -0500
Received: by mail-pj1-x102a.google.com with SMTP id g15so3846493pjd.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VEiOGE+EQqPF+LmAYn7wD0yHzNXjUMhvxTllqm7GNvc=;
 b=pxkU+Ise5uS9hgzG4A0gErR+GGdMs12g9w7fBS68cox4oDvjuqYvGqZs6KsWPyUd9z
 1XER7yYxVt7n1DtE77KeoVIvqnTmK4h4p94hX4T3huGOXRMxX8lwfyKDs/RW+NVHPnxb
 IXt9ZiJaE4YzKpF/L7B5i9K+Xn8IvTPZuRjJjR8fv2KgWgcYVRkl9Bx1NN++Dcbe4/jJ
 hUcGPSAv3eZU1Wxu0gxLmX+Gt5prVwGtIiOMcfO6/O02a5acLB+xse3RfUBga5q6Odki
 Lx4o8rEccfr+t12TQdnihKqQ3wKXJI55OyWh6OWJAdPCmFdTzj2HDfvpztwrOXPtKMsA
 vY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VEiOGE+EQqPF+LmAYn7wD0yHzNXjUMhvxTllqm7GNvc=;
 b=S52CgAlsOQWnN0AfmWxCNmbrGxrZKniLgLKYlmHFrA4E+ydEn+ZYtKaTCll25dxAGz
 eOIQqpe9iVC4/GC5pp3fB3+UCdXl/Ult4jVBa8l+O+26Qa87MyBovysqgGzY5mVz74iE
 iusAATFWjQTyUEpfg5sN4g4HupJvPjOIhXGIffXwHmelz/HklUpcaAuDLEoOsjnYSHpk
 v5CfcLTQxGn8xIlOUF98+hsQmi2vJUAxTGOKyiDKTd/NXhjiHXNQ7G/5eSpnConzrLj9
 awMLx2FBDcnlJ+NhWcXnvtEi587yD9pLvF2f4kRBmdOJgV0/weFus99keXo2HCtqm0Gk
 ScyA==
X-Gm-Message-State: AOAM530XyiaBMz/xrE+7UBgLk+k2wBNk8eKZeF8oWc3+QyJDXhA3WfuH
 AfRs4UVDRF7nSEjde05cCaKQnf7SA+o6znQA
X-Google-Smtp-Source: ABdhPJx1Wn7e5SMgQo5R6B20WNTRMo/JGNLqT5Y6VHixFY6n1SLsu4SgrJXsU2Nr6k7Vjb56ohBdOg==
X-Received: by 2002:a17:90b:4acd:: with SMTP id
 mh13mr10074103pjb.229.1611822231718; 
 Thu, 28 Jan 2021 00:23:51 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/23] tcg/tci: Inline tci_write_reg64 into 64-bit callers
Date: Wed, 27 Jan 2021 22:23:18 -1000
Message-Id: <20210128082331.196801-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that we had two functions of the same name: a 32-bit version
which took two register numbers and a 64-bit version which was a
no-op wrapper for tcg_write_reg.  After this, we are left with
only the 32-bit version.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 60 +++++++++++++++++++++++++------------------------------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index f75971dd5e..864771d91b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -122,12 +122,6 @@ static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
     tci_write_reg(regs, low_index, value);
     tci_write_reg(regs, high_index, value >> 32);
 }
-#elif TCG_TARGET_REG_BITS == 64
-static void
-tci_write_reg64(tcg_target_ulong *regs, TCGReg index, uint64_t value)
-{
-    tci_write_reg(regs, index, value);
-}
 #endif
 
 #if TCG_TARGET_REG_BITS == 32
@@ -560,7 +554,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
             condition = *tb_ptr++;
-            tci_write_reg64(regs, t0, tci_compare64(t1, t2, condition));
+            tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
 #endif
         case INDEX_op_mov_i32:
@@ -840,12 +834,12 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_mov_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_i64(&tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 
             /* Load/store operations (64 bit). */
@@ -887,7 +881,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg64(regs, t0, *(uint64_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
         case INDEX_op_st8_i64:
             t0 = tci_read_r8(regs, &tb_ptr);
@@ -921,19 +915,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 + t2);
+            tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 - t2);
+            tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 * t2);
+            tci_write_reg(regs, t0, t1 * t2);
             break;
 #if TCG_TARGET_HAS_div_i64
         case INDEX_op_div_i64:
@@ -952,19 +946,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 & t2);
+            tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 | t2);
+            tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 ^ t2);
+            tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
             /* Shift/rotate operations (64 bit). */
@@ -973,32 +967,32 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 << (t2 & 63));
+            tci_write_reg(regs, t0, t1 << (t2 & 63));
             break;
         case INDEX_op_shr_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 >> (t2 & 63));
+            tci_write_reg(regs, t0, t1 >> (t2 & 63));
             break;
         case INDEX_op_sar_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, ((int64_t)t1 >> (t2 & 63)));
+            tci_write_reg(regs, t0, ((int64_t)t1 >> (t2 & 63)));
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, rol64(t1, t2 & 63));
+            tci_write_reg(regs, t0, rol64(t1, t2 & 63));
             break;
         case INDEX_op_rotr_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, ror64(t1, t2 & 63));
+            tci_write_reg(regs, t0, ror64(t1, t2 & 63));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i64
@@ -1009,7 +1003,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp64 = (((1ULL << tmp8) - 1) << tmp16);
-            tci_write_reg64(regs, t0, (t1 & ~tmp64) | ((t2 << tmp16) & tmp64));
+            tci_write_reg(regs, t0, (t1 & ~tmp64) | ((t2 << tmp16) & tmp64));
             break;
 #endif
         case INDEX_op_brcond_i64:
@@ -1027,28 +1021,28 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_ext8u_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8s_i64
         case INDEX_op_ext8s_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r8s(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i64
         case INDEX_op_ext16s_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i64
         case INDEX_op_ext16u_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext32s_i64
@@ -1057,7 +1051,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_ext_i32_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r32s(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #if TCG_TARGET_HAS_ext32u_i64
         case INDEX_op_ext32u_i64:
@@ -1065,41 +1059,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_extu_i32_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #if TCG_TARGET_HAS_bswap16_i64
         case INDEX_op_bswap16_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, bswap16(t1));
+            tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_bswap32_i64
         case INDEX_op_bswap32_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, bswap32(t1));
+            tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, bswap64(t1));
+            tci_write_reg(regs, t0, bswap64(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_not_i64
         case INDEX_op_not_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, ~t1);
+            tci_write_reg(regs, t0, ~t1);
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i64
         case INDEX_op_neg_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, -t1);
+            tci_write_reg(regs, t0, -t1);
             break;
 #endif
 #endif /* TCG_TARGET_REG_BITS == 64 */
-- 
2.25.1


