Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BDA33767F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:06:52 +0100 (CET)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMtn-00076U-1n
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVX-0004QX-Cq
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:48 -0500
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVT-00070W-1K
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:47 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id t5so2640825qvs.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ao4OKRpDcfbemUwRIlrAeEvX8kliF+Y+aAzUNEwCXa8=;
 b=mdbRQBwY96147loXb1jY9MBnnn9ld4wQpyFKGxG7tKoMbrwyPK+vx5eDqWM2lew64E
 UV6qJ/Pfd293JBTCuD4BmlimPV7HPvyJQd9SHrDNSv58cCrZ9dJmNoFkDDB4ytaesKUD
 15wsKtcZXnLIzHL3N564r7fPk0k5x0s3LVLqed1rINipxseVrJ//bwhJF1DwkoCQWBFu
 mgUuxCFjb7xhxHMim2XE3POEK0Fha+ogYk4cxRP5PzE3yjrwWK4Jtav3GJQ4ZYTPDbPc
 INgVezaUQ6hKs40IQqO9ysHXIUn+9dJafFZgbsuEPliFNPgiwMduTlWRU/K6Q+afc1Z+
 6PXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ao4OKRpDcfbemUwRIlrAeEvX8kliF+Y+aAzUNEwCXa8=;
 b=B7MzWqWPWUKv2UEv+hIEn2Q2+8oB1WklOytTRHqp+qGLMTjCb4L1YM3a49dZYCuYNy
 HnIhi3NVo9oYVKsn2TWfuGEfYAwhkmLGYTuo8uezKIjOXh2wdV58eHb7Jn8aYDFytpaR
 2UdKKuI/dASblLZX6bILPgwO8wYg5NKDU5Ttu1KSSRYK6cUm0YtLvr4luflpwQX8DYr8
 /pKiXdMYWKFE6VfkqVSdO8Hk911E8hXYCHG6W5+WXoy20qjnYqx+8urjFAX67hHsvBoP
 YGCqB4xNnkDaDBP8yCZfhxUVLcn69EsrLS7A9Pk+YrCMDX7mQkbEFRRgXCH/k0OQL/fN
 Snhw==
X-Gm-Message-State: AOAM532PnZkpavUsfOcunMgyGBG+T7ZjtRqeEUs+TPyxIiOS/XsjMtVv
 xN2tk5Nm4OcfVqob5MZjMrSjILqnc8+5i3NF
X-Google-Smtp-Source: ABdhPJy+g6wJRxVzk4+9KM11t+RJ7PZubFqzFbQAxQ40GSJsCJySxwrGxspGO/DGuk+BvfhH+XmXyw==
X-Received: by 2002:a05:6214:1c47:: with SMTP id
 if7mr7932154qvb.50.1615473702094; 
 Thu, 11 Mar 2021 06:41:42 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 54/57] tcg/tci: Split out tci_qemu_ld, tci_qemu_st
Date: Thu, 11 Mar 2021 08:39:55 -0600
Message-Id: <20210311143958.562625-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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


