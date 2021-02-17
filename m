Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E131E15C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:31:07 +0100 (CET)
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUPa-0007Iq-15
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTN6-0002AQ-RI
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:28 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTN4-0007nu-OX
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:28 -0500
Received: by mail-pl1-x630.google.com with SMTP id b8so8025050plh.12
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ao4OKRpDcfbemUwRIlrAeEvX8kliF+Y+aAzUNEwCXa8=;
 b=eyMui52Z2F1gzx2Hv36MkxyPyM2WsKbQ0ALQoEIITJ280Bw4V27wwuDom0Bl6frh+5
 ZSEMPLRVR24qFQGyKxYtcyP/iZVxhWkOMw8ZzjjvWMLaXODD35un0trJecEf+A9JNlZ3
 AC/QP1SjQUqsxTTTlj2qUthQZVtYtyuz9PnxusBXipFfVcUZD9SWQJxPYNPV7fsbKQWB
 bWpL967Jyoi0Vebd5u61zKvph2GGRwEtX7ykxqaKCc+nzqbZD6R3hH1MXAZKBCtO3CHP
 CnqPlaQCn/AzsFATGrjCHyk75dlLSgXrrMz3J+qHFSJftWFY5ev1R8p2RqLyWaXZoeMd
 RRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ao4OKRpDcfbemUwRIlrAeEvX8kliF+Y+aAzUNEwCXa8=;
 b=feGR4bUHqu69/MFOfe4eHLiBAvETLSaRiSn+jzXEq53CEwrE8uLzqEJly4O5pEfnMy
 x3oZ5gBpan8hIqKSZisZbKVV/DgvMx6E29rt1bgH9S1LMFHJd03yyqai3FG7Mde2lQ61
 BeHMnEYPNVYwIF18OkhjZQEgROMfqgw2vFuhP81xyNqyshGm2/jf6gstU8Mz3LLbRE2x
 4SEGnM4YhWawkg+zkwML6xeVx2fiXLt9pfHp1MQAQHhf+ObGxdChlvWzoKPSoucNHAj1
 Glx6vuTZe6WWpE/Fzc3usXwfa+IQYf9GLC+nUWjX2D/8RDcHrCW1tMP0EYdtryNQ6fPq
 286w==
X-Gm-Message-State: AOAM533Q8zqPA2nXFgkM431xRBXVgvLBcjojELgvCgNovp7TPPkOfcFZ
 XKrhbtEqD3re6GnMLbvFYsTvPx/2Y9ivgA==
X-Google-Smtp-Source: ABdhPJy5EcKvFwg4eLeU9pNXoNQB96yTRg5u9xjvSOUnLQEqgoySuHTyTxo4/ju8Tr4XAOdNPnDvPA==
X-Received: by 2002:a17:90b:4b02:: with SMTP id
 lx2mr561479pjb.178.1613593465361; 
 Wed, 17 Feb 2021 12:24:25 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 69/71] tcg/tci: Split out tci_qemu_ld, tci_qemu_st
Date: Wed, 17 Feb 2021 12:20:34 -0800
Message-Id: <20210217202036.1724901-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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
index 0240d850cf..84bef41af3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -284,34 +284,77 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
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
@@ -908,34 +951,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -951,46 +967,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1007,25 +984,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1044,31 +1003,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


