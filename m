Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9023ADB62
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:36:25 +0200 (CEST)
Received: from localhost ([::1]:39774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufpQ-0003eo-8Q
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufV0-0000xI-KD
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:20 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:38646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUq-0002MC-2A
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:18 -0400
Received: by mail-pl1-x62c.google.com with SMTP id 69so6334753plc.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h010+aEkxbeE0HjnliG8rW250ADGcYL5RGoALR2ggFU=;
 b=fuvbQbNnjSXwVYCZ7ttPR8DdOw53MRSSrAwv/HnW4Wc3GFIakq/Jg+1Nqygf+z2sOK
 uFS0BC1QwgI7naO8hfLluGKkr1RdA4n7+MbU4D56PCrrchV+f6kE7mnSXq2aSZ01yAYB
 5F6IdAHQORZ8Gwkgs4WFMGLfDPN8K6tu0ikYNpoqEF2W2WeSgR6YUoKkF2f9X500XW68
 U/exNPwFU9KSSPM1K/R6rCSAN5bi5l5PFgAbpVQMPauC0jbJNXcUJFJLRemiHi9fWjEK
 ZP5r6STteA5WYQL1EqIyS7vNIbZIKcIZrj1+nyPXNGv2dxtp91fPiXT+JejQpoVQXJlr
 PN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h010+aEkxbeE0HjnliG8rW250ADGcYL5RGoALR2ggFU=;
 b=gAODPoIzWjvXa/o7ulDnk1jKJExM1Z2hJiPNpQ3QQLhkzDmUblj7rc1j8wH9zJavVj
 ZOOI/dwWmzl1QkJ/BDYaRgvPjvyAcIamLpEd8Nzpm7FpHTqEK+Gx0kjqMeIhDuvZxOkR
 GVf31Sr2wu0OrqlFTp/GNPiSEqzZ4IPTYgMT6DKd/oA/faoaWWbomnQHh0F1Wh02p38y
 B1qnNLCR0nzUKAO8Df+FyFrKceWAdQG4f221dhoFInIeB3VnH9z4ciAx9p1OIImZsckK
 RweiqJJoOW+nmtb8HMa3TzTvAJVE6r5ojG80VHoRHzCXnIvQbLyWx3Ir+sDl3fXm9rRe
 qQAQ==
X-Gm-Message-State: AOAM533m8HeYSoHLxVmz+p2P4LCM1uMP32VYFrDAsp08g9+0yKlLyl7E
 k7ois2c9WeMuzqpeGu38PLpEB1Jfo34ZWg==
X-Google-Smtp-Source: ABdhPJx6sEoLRrO8S0jicUq55Nm2EV7/0y+ilIWKFnx8cEyq4ISm+5VbrU8zptPxs2Jexc1JM5l9tw==
X-Received: by 2002:a17:902:be0d:b029:11d:6614:88cd with SMTP id
 r13-20020a170902be0db029011d661488cdmr10347541pls.40.1624126506366; 
 Sat, 19 Jun 2021 11:15:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/33] tcg/tci: Split out tci_qemu_ld, tci_qemu_st
Date: Sat, 19 Jun 2021 11:14:42 -0700
Message-Id: <20210619181452.877683-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can share this code between 32-bit and 64-bit loads and stores.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 183 +++++++++++++++++++++---------------------------------
 1 file changed, 71 insertions(+), 112 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 7103005889..5520537abe 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -317,6 +317,73 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 #define qemu_st_beq(X) \
     cpu_stq_be_mmuidx_ra(env, taddr, X, get_mmuidx(oi), (uintptr_t)tb_ptr)
 
+static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
+                            TCGMemOpIdx oi, const void *tb_ptr)
+{
+    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
+
+    switch (mop) {
+    case MO_UB:
+        return qemu_ld_ub;
+    case MO_SB:
+        return (int8_t)qemu_ld_ub;
+    case MO_LEUW:
+        return qemu_ld_leuw;
+    case MO_LESW:
+        return (int16_t)qemu_ld_leuw;
+    case MO_LEUL:
+        return qemu_ld_leul;
+    case MO_LESL:
+        return (int32_t)qemu_ld_leul;
+    case MO_LEQ:
+        return qemu_ld_leq;
+    case MO_BEUW:
+        return qemu_ld_beuw;
+    case MO_BESW:
+        return (int16_t)qemu_ld_beuw;
+    case MO_BEUL:
+        return qemu_ld_beul;
+    case MO_BESL:
+        return (int32_t)qemu_ld_beul;
+    case MO_BEQ:
+        return qemu_ld_beq;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
+                        TCGMemOpIdx oi, const void *tb_ptr)
+{
+    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
+
+    switch (mop) {
+    case MO_UB:
+        qemu_st_b(val);
+        break;
+    case MO_LEUW:
+        qemu_st_lew(val);
+        break;
+    case MO_LEUL:
+        qemu_st_lel(val);
+        break;
+    case MO_LEQ:
+        qemu_st_leq(val);
+        break;
+    case MO_BEUW:
+        qemu_st_bew(val);
+        break;
+    case MO_BEUL:
+        qemu_st_bel(val);
+        break;
+    case MO_BEQ:
+        qemu_st_beq(val);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 #if TCG_TARGET_REG_BITS == 64
 # define CASE_32_64(x) \
         case glue(glue(INDEX_op_, x), _i64): \
@@ -909,34 +976,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -952,46 +992,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1008,25 +1009,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1045,31 +1028,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


