Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926B33ADB64
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:38:19 +0200 (CEST)
Received: from localhost ([::1]:46118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufrG-0007wb-K1
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUz-0000x0-6k
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:19 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUq-0002MO-Jj
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:16 -0400
Received: by mail-pg1-x536.google.com with SMTP id g22so10605449pgk.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lDQh3RHIBvFFZ/5eKksAkO3SIZPBgL6PLHQwDZAQ6is=;
 b=uQplcpC/l1nzKRaEP/u/BzTQnEptuxX+qEP4qq8QTb0ZZ/fjPRUDbrZOZHvtHjdR4u
 VVrc35A6n2r3lPBe06rHj1kMYGP/vIZf7ydw3XqipHFbO8/FPOcC6Ry9ldgl83w0oCog
 OXdIiymm2k/oI4QAqlxwit8+pZzmWipwoqRnk4rMuH2kI9/nToP/Xs92310gmR5Py+Wf
 kBnHqoZ92ZjBCwKE0mRd+yo7dPM3lnFN1XoyY0CtE5w7CCc4J8RlWO2uxZ5Oa3HoLekT
 N8T357C8uS9o/1td34SNfiiI/7MGoaznCD7ImBCETzeRePQ3KDvQI6/ENWFa1wFKepoP
 i2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lDQh3RHIBvFFZ/5eKksAkO3SIZPBgL6PLHQwDZAQ6is=;
 b=Oqp4UZWbjGvf6IS6Riz9vBPb18tENgkJuGTWdFmFluLtLbPbVbvdEjxR62tLwpOAoo
 jKCfHMIFc2WyuJzhOfOEprvFXd6guMJVaGpwqwm0GEAa/UJiseSSOIWzISgnLDq5sRBA
 4rnA4jDa+3ANXmfbjiIGKT+TldBFfGgWLiCLeeOZGD7q3GdMzGJUnDNb/gnxVW4sf99h
 jwc+RCDAnW9SxFp+5OLEv9jsyxbYv2H4IZ1AL2CtG6NWy2SnOZc1gVrodDjEKhPYPE7d
 vB0sO8uZdExDASTToBG9O52Szzkk4BS1mfn3ssvTJZYsfiF/GAFtDGnQBsmMMh4YhCyR
 pLiA==
X-Gm-Message-State: AOAM532aBKcBa56PKyX716cWBROF1bQXJ3Asg02RvnM2Ri3qOHGjQOdw
 EoOl3h32GNAPTD6nKuezNL8xH+Yyk19/PQ==
X-Google-Smtp-Source: ABdhPJxcS77zmp3gHiFK3y9lj1iO1gkkuwGoKhO102e/3JomNDOB68gcEggpCOfgszlv6mAs2aOu+Q==
X-Received: by 2002:aa7:82cb:0:b029:2e6:f397:d248 with SMTP id
 f11-20020aa782cb0000b02902e6f397d248mr11575950pfn.52.1624126507338; 
 Sat, 19 Jun 2021 11:15:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/33] tcg/tci: Remove the qemu_ld/st_type macros
Date: Sat, 19 Jun 2021 11:14:44 -0700
Message-Id: <20210619181452.877683-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These macros are only used in one place.  By expanding,
we get to apply some common-subexpression elimination
and create some local variables.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 165 +++++++++++++++++++++++++++++++++---------------------
 1 file changed, 100 insertions(+), 65 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index cbe1afa289..a5670f2109 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -288,85 +288,88 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
     return result;
 }
 
-#ifdef CONFIG_SOFTMMU
-# define qemu_ld_ub \
-    helper_ret_ldub_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_leuw \
-    helper_le_lduw_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_leul \
-    helper_le_ldul_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_leq \
-    helper_le_ldq_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_beuw \
-    helper_be_lduw_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_beul \
-    helper_be_ldul_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_ld_beq \
-    helper_be_ldq_mmu(env, taddr, oi, (uintptr_t)tb_ptr)
-# define qemu_st_b(X) \
-    helper_ret_stb_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_lew(X) \
-    helper_le_stw_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_lel(X) \
-    helper_le_stl_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_leq(X) \
-    helper_le_stq_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_bew(X) \
-    helper_be_stw_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_bel(X) \
-    helper_be_stl_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-# define qemu_st_beq(X) \
-    helper_be_stq_mmu(env, taddr, X, oi, (uintptr_t)tb_ptr)
-#else
-# define qemu_ld_ub      ldub_p(g2h(env_cpu(env), taddr))
-# define qemu_ld_leuw    lduw_le_p(g2h(env_cpu(env), taddr))
-# define qemu_ld_leul    (uint32_t)ldl_le_p(g2h(env_cpu(env), taddr))
-# define qemu_ld_leq     ldq_le_p(g2h(env_cpu(env), taddr))
-# define qemu_ld_beuw    lduw_be_p(g2h(env_cpu(env), taddr))
-# define qemu_ld_beul    (uint32_t)ldl_be_p(g2h(env_cpu(env), taddr))
-# define qemu_ld_beq     ldq_be_p(g2h(env_cpu(env), taddr))
-# define qemu_st_b(X)    stb_p(g2h(env_cpu(env), taddr), X)
-# define qemu_st_lew(X)  stw_le_p(g2h(env_cpu(env), taddr), X)
-# define qemu_st_lel(X)  stl_le_p(g2h(env_cpu(env), taddr), X)
-# define qemu_st_leq(X)  stq_le_p(g2h(env_cpu(env), taddr), X)
-# define qemu_st_bew(X)  stw_be_p(g2h(env_cpu(env), taddr), X)
-# define qemu_st_bel(X)  stl_be_p(g2h(env_cpu(env), taddr), X)
-# define qemu_st_beq(X)  stq_be_p(g2h(env_cpu(env), taddr), X)
-#endif
-
 static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
                             TCGMemOpIdx oi, const void *tb_ptr)
 {
     MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
 
+#ifdef CONFIG_SOFTMMU
+    uintptr_t ra = (uintptr_t)tb_ptr;
+
     switch (mop) {
     case MO_UB:
-        return qemu_ld_ub;
+        return helper_ret_ldub_mmu(env, taddr, oi, ra);
     case MO_SB:
-        return (int8_t)qemu_ld_ub;
+        return helper_ret_ldsb_mmu(env, taddr, oi, ra);
     case MO_LEUW:
-        return qemu_ld_leuw;
+        return helper_le_lduw_mmu(env, taddr, oi, ra);
     case MO_LESW:
-        return (int16_t)qemu_ld_leuw;
+        return helper_le_ldsw_mmu(env, taddr, oi, ra);
     case MO_LEUL:
-        return qemu_ld_leul;
+        return helper_le_ldul_mmu(env, taddr, oi, ra);
     case MO_LESL:
-        return (int32_t)qemu_ld_leul;
+        return helper_le_ldsl_mmu(env, taddr, oi, ra);
     case MO_LEQ:
-        return qemu_ld_leq;
+        return helper_le_ldq_mmu(env, taddr, oi, ra);
     case MO_BEUW:
-        return qemu_ld_beuw;
+        return helper_be_lduw_mmu(env, taddr, oi, ra);
     case MO_BESW:
-        return (int16_t)qemu_ld_beuw;
+        return helper_be_ldsw_mmu(env, taddr, oi, ra);
     case MO_BEUL:
-        return qemu_ld_beul;
+        return helper_be_ldul_mmu(env, taddr, oi, ra);
     case MO_BESL:
-        return (int32_t)qemu_ld_beul;
+        return helper_be_ldsl_mmu(env, taddr, oi, ra);
     case MO_BEQ:
-        return qemu_ld_beq;
+        return helper_be_ldq_mmu(env, taddr, oi, ra);
     default:
         g_assert_not_reached();
     }
+#else
+    void *haddr = g2h(env_cpu(env), taddr);
+    uint64_t ret;
+
+    switch (mop) {
+    case MO_UB:
+        ret = ldub_p(haddr);
+        break;
+    case MO_SB:
+        ret = ldsb_p(haddr);
+        break;
+    case MO_LEUW:
+        ret = lduw_le_p(haddr);
+        break;
+    case MO_LESW:
+        ret = ldsw_le_p(haddr);
+        break;
+    case MO_LEUL:
+        ret = (uint32_t)ldl_le_p(haddr);
+        break;
+    case MO_LESL:
+        ret = (int32_t)ldl_le_p(haddr);
+        break;
+    case MO_LEQ:
+        ret = ldq_le_p(haddr);
+        break;
+    case MO_BEUW:
+        ret = lduw_be_p(haddr);
+        break;
+    case MO_BESW:
+        ret = ldsw_be_p(haddr);
+        break;
+    case MO_BEUL:
+        ret = (uint32_t)ldl_be_p(haddr);
+        break;
+    case MO_BESL:
+        ret = (int32_t)ldl_be_p(haddr);
+        break;
+    case MO_BEQ:
+        ret = ldq_be_p(haddr);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return ret;
+#endif
 }
 
 static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
@@ -374,31 +377,63 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
 {
     MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
 
+#ifdef CONFIG_SOFTMMU
+    uintptr_t ra = (uintptr_t)tb_ptr;
+
     switch (mop) {
     case MO_UB:
-        qemu_st_b(val);
+        helper_ret_stb_mmu(env, taddr, val, oi, ra);
         break;
     case MO_LEUW:
-        qemu_st_lew(val);
+        helper_le_stw_mmu(env, taddr, val, oi, ra);
         break;
     case MO_LEUL:
-        qemu_st_lel(val);
+        helper_le_stl_mmu(env, taddr, val, oi, ra);
         break;
     case MO_LEQ:
-        qemu_st_leq(val);
+        helper_le_stq_mmu(env, taddr, val, oi, ra);
         break;
     case MO_BEUW:
-        qemu_st_bew(val);
+        helper_be_stw_mmu(env, taddr, val, oi, ra);
         break;
     case MO_BEUL:
-        qemu_st_bel(val);
+        helper_be_stl_mmu(env, taddr, val, oi, ra);
         break;
     case MO_BEQ:
-        qemu_st_beq(val);
+        helper_be_stq_mmu(env, taddr, val, oi, ra);
         break;
     default:
         g_assert_not_reached();
     }
+#else
+    void *haddr = g2h(env_cpu(env), taddr);
+
+    switch (mop) {
+    case MO_UB:
+        stb_p(haddr, val);
+        break;
+    case MO_LEUW:
+        stw_le_p(haddr, val);
+        break;
+    case MO_LEUL:
+        stl_le_p(haddr, val);
+        break;
+    case MO_LEQ:
+        stq_le_p(haddr, val);
+        break;
+    case MO_BEUW:
+        stw_be_p(haddr, val);
+        break;
+    case MO_BEUL:
+        stl_be_p(haddr, val);
+        break;
+    case MO_BEQ:
+        stq_be_p(haddr, val);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+#endif
 }
 
 #if TCG_TARGET_REG_BITS == 64
-- 
2.25.1


