Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37FF397645
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:14:52 +0200 (CEST)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo66V-0002dG-Qg
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tz-0002c3-5h
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:55 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5to-0002lY-4g
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:54 -0400
Received: by mail-io1-xd2c.google.com with SMTP id z24so15644868ioi.3
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J1PsZMgvQPlBhcV6FUO9WCVEsqHN4MBCPOhm8c2+xug=;
 b=sPcZQeuhGha5BBHRQbj+zQ4UcSWpihqQI8QV/gf3z8FSR8k4uPK8e+NtdQ7lzoX8W8
 MHzTw+WUuO9nSUfyz94ef4y5aI6jU9HuEiZSAn1Ii2jBuEr3Cq2gQ77Z+xJM8as+gbzK
 YOqIdkL5KJ/Ta6lkQVKp4VVQjwcTodwrgvbztC3BWW686SLkQbZ4ZyufKzS+DgRRQQyz
 Ag5JVBFXi000e0tMhnMdOPek8zY2x/EnjeQ2Ex2QYN8sf6MK9hTAQvw2aH53dbeWM6GC
 6SFjC6ne5LNgFjAqqfEBTCVi+61TVlM2LpNrIVdemTrLvqCNCMyw7i5BU6z0LbW6g4KA
 TdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J1PsZMgvQPlBhcV6FUO9WCVEsqHN4MBCPOhm8c2+xug=;
 b=C2RmJpa+GgZ+FXauLch1zhQNbTGOAvO1YLQv4uBk5MlYUsGKGDqIWIlpnOTWW3k4lf
 e2/EZU8v3P2Ixkp46mZNRscmimV4+oY+QJ87eu38nyJITIzTcvJK9xnTXwy2dD98E4OO
 Vtq4RhmAMtPexWbTtH7GovHqWkeSzauSbNpnlyn9x3IGArgUFwVblOwgX3K6oUOYUq0B
 49y+fIHiNCBUL/fKUIlBTdtHJqmKt2RsDPGHlM1lB43hLWhEWee/4ejX493u/8buF/bL
 VirwBIy8w0wlX5spviiTO+Me9e+14oNIBeClsgCwKfiHP6crEl+xprmymYnqPBiem1rP
 WBug==
X-Gm-Message-State: AOAM532am36VRtviZl+MPckT4NLMx8sjDhU6kjuvsRVmhtvWGdYy/alM
 n+DVs3mJUsyITO9YRoeYWu5nxeo1ksQqwOrs
X-Google-Smtp-Source: ABdhPJxUMo2PgOtgRIqykD3ocFTVixe+3TNAyMEtuGHdK8bl9s6CGyBYW4dbhfuvw7oLXMXccwkHMQ==
X-Received: by 2002:a02:5b45:: with SMTP id g66mr11127484jab.62.1622559701994; 
 Tue, 01 Jun 2021 08:01:41 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 25/27] tcg/tci: Remove the qemu_ld/st_type macros
Date: Tue,  1 Jun 2021 08:01:04 -0700
Message-Id: <20210601150106.12761-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
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

These macros are only used in one place.  By expanding,
we get to apply some common-subexpression elimination
and create some local variables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 165 +++++++++++++++++++++++++++++++++---------------------
 1 file changed, 100 insertions(+), 65 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 8b17b244bf..11219fec18 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -286,85 +286,88 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
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
@@ -372,31 +375,63 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
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


