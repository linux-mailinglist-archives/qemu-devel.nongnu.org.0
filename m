Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2637B371003
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:10:20 +0200 (CEST)
Received: from localhost ([::1]:59764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldMAF-0005Q5-7i
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLyD-0007qC-3V
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:53 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy9-0000hk-EB
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:52 -0400
Received: by mail-pg1-x536.google.com with SMTP id y30so2490537pgl.7
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lSflzjXxu18WlZgp6Om9jMvmH3J2Us5FPefwwVIRx8Q=;
 b=AClReHBFYoCpJgbmVAn7IZ2+WGQ5J86F+0TGERZiFGjmY/HBx2xde4PJNGyUrX8kBj
 eAmrKyQMKLYL8XnTR58OfV+JCR9CyodoIND18U/3SRyi6216Tslxh/pqHpsPE8eJqCV5
 MpZn1zUaQh2PqYuLXants69lQSYyhKoQsh2YMo2FW2Oyj+5pvzKNVdqbISypo/PeKSE5
 pxGdBbxcXflF3exrT/m9cvxK3hsWpZE0jf/+kaUapnZ3bHCc2fDaVn56aveL5Ue9qDpT
 NuivbGBDD7NULXMZojnPk5BKzvUm52P2dZUf/p/fqMh8/7igYr3fEx9BKrvkZ7kSVUdd
 Jz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lSflzjXxu18WlZgp6Om9jMvmH3J2Us5FPefwwVIRx8Q=;
 b=SDuyeRxEG3OsotKCpBtVt7NMSPHi47WSLHVG4zHNlH9oFLBLYBqxo53RxrE3gpcEDf
 /pXbvmF+Y1vrNXJr06dKOSrssvieqHzt8YOrjC7hHtVOhAlafIK7R56ozrrjA7H5sLw8
 i4oZX1R7PC5tWsLDjAq+OvKZVkMOtTDWCgYZ+RlSDDD+pXCZbk72MMMMlKjrsFW373f7
 TcrzI5BzLppOupvDpdRLxegHc5xyRxOZmgEII+znTweyU6bpC1liWcnrQTxH4+bnevXS
 mtkqjFAd8FzMVOEPDn4g6QOUd3nWlImqqBC+oNCavLXiYjLcjncFY4+VXjHoqKPyUIM5
 +Yow==
X-Gm-Message-State: AOAM530e8iSg4Ot/XzwRuDvW+s3ojX0kMq2dytLYLK6boEod4DIoZ9x2
 WiHDFB+eVlgeUoagBLCJbWOzBISWJRtgiQ==
X-Google-Smtp-Source: ABdhPJxjNbMcqMbcfVmctnyTbXj9YVV9qF0kQSf0P1ZYpK3c7TJUtHGc29oFEoarwJsxOKTxV7Tgbw==
X-Received: by 2002:a63:f90d:: with SMTP id h13mr15829917pgi.18.1619999867752; 
 Sun, 02 May 2021 16:57:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 23/26] tcg/tci: Split out tci_qemu_ld, tci_qemu_st
Date: Sun,  2 May 2021 16:57:24 -0700
Message-Id: <20210502235727.1979457-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expand the single-use macros into the new functions.
Use cpu_ldsb_mmuidx_ra and cpu_ldsw_le_mmuidx_ra so
that the trace event receives the correct sign flag.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 215 +++++++++++++++++++-----------------------------------
 1 file changed, 75 insertions(+), 140 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index ff096e1e32..a23f813305 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -286,34 +286,77 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
     return result;
 }
 
-#define qemu_ld_ub \
-    cpu_ldub_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_leuw \
-    cpu_lduw_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_leul \
-    cpu_ldl_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_leq \
-    cpu_ldq_le_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_beuw \
-    cpu_lduw_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_beul \
-    cpu_ldl_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_ld_beq \
-    cpu_ldq_be_mmuidx_ra(env, taddr, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_b(X) \
-    cpu_stb_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_lew(X) \
-    cpu_stw_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_lel(X) \
-    cpu_stl_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_leq(X) \
-    cpu_stq_le_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_bew(X) \
-    cpu_stw_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_bel(X) \
-    cpu_stl_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
-#define qemu_st_beq(X) \
-    cpu_stq_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
+static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
+                            TCGMemOpIdx oi, const void *tb_ptr)
+{
+    uintptr_t ra = (uintptr_t)tb_ptr;
+    int mmu_idx = get_mmuidx(oi);
+    MemOp mop = get_memop(oi);
+
+    switch (mop & (MO_BSWAP | MO_SSIZE)) {
+    case MO_UB:
+        return cpu_ldub_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_SB:
+        return cpu_ldsb_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_LEUW:
+        return cpu_lduw_le_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_BEUW:
+        return cpu_lduw_be_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_LESW:
+        return cpu_ldsw_le_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_BESW:
+        return cpu_ldsw_be_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_LEUL:
+        return cpu_ldl_le_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_BEUL:
+        return cpu_ldl_be_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_LESL:
+        return (int32_t)cpu_ldl_le_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_BESL:
+        return (int32_t)cpu_ldl_be_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_LEQ:
+        return cpu_ldq_le_mmuidx_ra(env, taddr, mmu_idx, ra);
+    case MO_BEQ:
+        return cpu_ldq_be_mmuidx_ra(env, taddr, mmu_idx, ra);
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
+                        TCGMemOpIdx oi, const void *tb_ptr)
+{
+    uintptr_t ra = (uintptr_t)tb_ptr;
+    int mmu_idx = get_mmuidx(oi);
+    MemOp mop = get_memop(oi);
+
+    switch (mop & (MO_BSWAP | MO_SIZE)) {
+    case MO_UB:
+        cpu_stb_mmuidx_ra(env, taddr, val, mmu_idx, ra);
+        break;
+    case MO_LEUW:
+        cpu_stw_le_mmuidx_ra(env, taddr, val, mmu_idx, ra);
+        break;
+    case MO_BEUW:
+        cpu_stw_be_mmuidx_ra(env, taddr, val, mmu_idx, ra);
+        break;
+    case MO_LEUL:
+        cpu_stl_le_mmuidx_ra(env, taddr, val, mmu_idx, ra);
+        break;
+    case MO_BEUL:
+        cpu_stl_be_mmuidx_ra(env, taddr, val, mmu_idx, ra);
+        break;
+    case MO_LEQ:
+        cpu_stq_le_mmuidx_ra(env, taddr, val, mmu_idx, ra);
+        break;
+    case MO_BEQ:
+        cpu_stq_be_mmuidx_ra(env, taddr, val, mmu_idx, ra);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
 
 #if TCG_TARGET_REG_BITS == 64
 # define CASE_32_64(x) \
@@ -906,34 +949,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 tci_args_rrrm(insn, &r0, &r1, &r2, &oi);
                 taddr = tci_uint64(regs[r2], regs[r1]);
             }
-            switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
-            case MO_UB:
-                tmp32 = qemu_ld_ub;
-                break;
-            case MO_SB:
-                tmp32 = (int8_t)qemu_ld_ub;
-                break;
-            case MO_LEUW:
-                tmp32 = qemu_ld_leuw;
-                break;
-            case MO_LESW:
-                tmp32 = (int16_t)qemu_ld_leuw;
-                break;
-            case MO_LEUL:
-                tmp32 = qemu_ld_leul;
-                break;
-            case MO_BEUW:
-                tmp32 = qemu_ld_beuw;
-                break;
-            case MO_BESW:
-                tmp32 = (int16_t)qemu_ld_beuw;
-                break;
-            case MO_BEUL:
-                tmp32 = qemu_ld_beul;
-                break;
-            default:
-                g_assert_not_reached();
-            }
+            tmp32 = tci_qemu_ld(env, taddr, oi, tb_ptr);
             regs[r0] = tmp32;
             break;
 
@@ -949,46 +965,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 taddr = tci_uint64(regs[r3], regs[r2]);
                 oi = regs[r4];
             }
-            switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
-            case MO_UB:
-                tmp64 = qemu_ld_ub;
-                break;
-            case MO_SB:
-                tmp64 = (int8_t)qemu_ld_ub;
-                break;
-            case MO_LEUW:
-                tmp64 = qemu_ld_leuw;
-                break;
-            case MO_LESW:
-                tmp64 = (int16_t)qemu_ld_leuw;
-                break;
-            case MO_LEUL:
-                tmp64 = qemu_ld_leul;
-                break;
-            case MO_LESL:
-                tmp64 = (int32_t)qemu_ld_leul;
-                break;
-            case MO_LEQ:
-                tmp64 = qemu_ld_leq;
-                break;
-            case MO_BEUW:
-                tmp64 = qemu_ld_beuw;
-                break;
-            case MO_BESW:
-                tmp64 = (int16_t)qemu_ld_beuw;
-                break;
-            case MO_BEUL:
-                tmp64 = qemu_ld_beul;
-                break;
-            case MO_BESL:
-                tmp64 = (int32_t)qemu_ld_beul;
-                break;
-            case MO_BEQ:
-                tmp64 = qemu_ld_beq;
-                break;
-            default:
-                g_assert_not_reached();
-            }
+            tmp64 = tci_qemu_ld(env, taddr, oi, tb_ptr);
             if (TCG_TARGET_REG_BITS == 32) {
                 tci_write_reg64(regs, r1, r0, tmp64);
             } else {
@@ -1005,25 +982,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 taddr = tci_uint64(regs[r2], regs[r1]);
             }
             tmp32 = regs[r0];
-            switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
-            case MO_UB:
-                qemu_st_b(tmp32);
-                break;
-            case MO_LEUW:
-                qemu_st_lew(tmp32);
-                break;
-            case MO_LEUL:
-                qemu_st_lel(tmp32);
-                break;
-            case MO_BEUW:
-                qemu_st_bew(tmp32);
-                break;
-            case MO_BEUL:
-                qemu_st_bel(tmp32);
-                break;
-            default:
-                g_assert_not_reached();
-            }
+            tci_qemu_st(env, taddr, tmp32, oi, tb_ptr);
             break;
 
         case INDEX_op_qemu_st_i64:
@@ -1042,31 +1001,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 }
                 tmp64 = tci_uint64(regs[r1], regs[r0]);
             }
-            switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
-            case MO_UB:
-                qemu_st_b(tmp64);
-                break;
-            case MO_LEUW:
-                qemu_st_lew(tmp64);
-                break;
-            case MO_LEUL:
-                qemu_st_lel(tmp64);
-                break;
-            case MO_LEQ:
-                qemu_st_leq(tmp64);
-                break;
-            case MO_BEUW:
-                qemu_st_bew(tmp64);
-                break;
-            case MO_BEUL:
-                qemu_st_bel(tmp64);
-                break;
-            case MO_BEQ:
-                qemu_st_beq(tmp64);
-                break;
-            default:
-                g_assert_not_reached();
-            }
+            tci_qemu_st(env, taddr, tmp64, oi, tb_ptr);
             break;
 
         case INDEX_op_mb:
-- 
2.25.1


