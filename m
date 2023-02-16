Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A833698ACC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:00:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTF-0003St-J7; Wed, 15 Feb 2023 21:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUT8-0003Qu-02
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:57:58 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUT5-0005is-VO
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:57:57 -0500
Received: by mail-pg1-x529.google.com with SMTP id e1so406524pgg.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MR4ZriWzmZ1HUjpLLVCmcaaRm+e7n16eAnVU5EaLyGs=;
 b=vjLW7xMVIIStrixEDu2cec7V8m+bs1g8M5Wk7+ZGSqb0l4jLn5AxvIal4df+fu0oJp
 1pe58Yye7yWNlTWEZ2iVOpKwq7SmbT3dcy+ROgcT7PjUyEEaavkZH9cB7ux+vxG2Mud+
 248mRxI52M+rD5nx+B/68KpKvjR/yHvmnD8MBr1cypG3wXhqIa+QZVJTq/Ye1N0DqOZx
 dGO8crFy/lNFDlIynWsMD6ucMZxjO7QKmzGMWdYoe5WUT4igG43w4JSP4EqmHNxLs4+a
 EJFAgcokscwt6PAOPuLspwDKXhzsQCVt0Nhbzeky4Wu2LDdYHhJnr+h9hHGGLA53MGVF
 AkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MR4ZriWzmZ1HUjpLLVCmcaaRm+e7n16eAnVU5EaLyGs=;
 b=KkMf4S9k/UD4sT7jsI2rUcvXiKDmF3woN3EGD33qbORIUwtzzwksR8zGldRJolcQHG
 Z2elHN82u7pfJpXwr/Dxo3h3emZLEkdfRo7zi1kkrV+++m+rNTJOb4b3KxjVjMaqid/c
 zPvJQ5cdyq0lSS3+PfwonvuaJQd2QIOL30sQfv6BtgJky6z6WSz2oEsRTi54Y+rSsIsU
 /fXtTHwJz4fVopq3+ZTQ2RICj/24ECLczI+Of/m20rApmgQgapEleQVkK4rDXGL2lNg3
 IrHih9pq7CHrt+LGgUxFw7w6NLxDinWf14jFfmlv8rmMTbQI220AkKxGEJiNKkmFhz1U
 uSig==
X-Gm-Message-State: AO0yUKX7NdhyzoFgCAC2MB9akTGkBcG3jV10sAB782AelEJXkwPannYL
 t4FOBDcOgEEk6XU8SkhJByupw1Pq8he7ggZd8Po=
X-Google-Smtp-Source: AK7set8wZZawq8d0LcG2y3dKM5qmt0x2S2oLSk7SeLPsgJz89qmT2njUND3u8Xs2qqUkmko+aiG/Sw==
X-Received: by 2002:a62:1cd3:0:b0:5a8:d737:991d with SMTP id
 c202-20020a621cd3000000b005a8d737991dmr3308548pfc.16.1676516274604; 
 Wed, 15 Feb 2023 18:57:54 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:57:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/30] tcg/tci: Use cpu_{ld,st}_mmu
Date: Wed, 15 Feb 2023 16:57:18 -1000
Message-Id: <20230216025739.1211680-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Unify the softmmu and the user-only paths by using the
official memory interface.  Avoid double logging of memory
operations to plugins by relying on the ones within the
cpu_*_mmu functions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c |   9 +++-
 tcg/tci.c    | 127 ++++++++-------------------------------------------
 2 files changed, 26 insertions(+), 110 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index c581ae77c4..da312dcf7e 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2916,7 +2916,12 @@ static void tcg_gen_req_mo(TCGBar type)
 
 static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
 {
-#ifdef CONFIG_PLUGIN
+    /*
+     * With TCI, we get memory tracing via cpu_{ld,st}_mmu.
+     * No need to instrument memory operations inline, and
+     * we don't want to log the same memory operation twice.
+     */
+#if defined(CONFIG_PLUGIN) && !defined(CONFIG_TCG_INTERPRETER)
     if (tcg_ctx->plugin_insn != NULL) {
         /* Save a copy of the vaddr for use after a load.  */
         TCGv temp = tcg_temp_new();
@@ -2930,7 +2935,7 @@ static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
 static void plugin_gen_mem_callbacks(TCGv vaddr, MemOpIdx oi,
                                      enum qemu_plugin_mem_rw rw)
 {
-#ifdef CONFIG_PLUGIN
+#if defined(CONFIG_PLUGIN) && !defined(CONFIG_TCG_INTERPRETER)
     if (tcg_ctx->plugin_insn != NULL) {
         qemu_plugin_meminfo_t info = make_plugin_meminfo(oi, rw);
         plugin_gen_empty_mem_callback(vaddr, info);
diff --git a/tcg/tci.c b/tcg/tci.c
index fc67e7e767..170dcf1262 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -292,87 +292,34 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
-#ifdef CONFIG_SOFTMMU
     switch (mop & (MO_BSWAP | MO_SSIZE)) {
     case MO_UB:
-        return helper_ret_ldub_mmu(env, taddr, oi, ra);
+        return cpu_ldb_mmu(env, taddr, oi, ra);
     case MO_SB:
-        return helper_ret_ldsb_mmu(env, taddr, oi, ra);
+        return (int8_t)cpu_ldb_mmu(env, taddr, oi, ra);
     case MO_LEUW:
-        return helper_le_lduw_mmu(env, taddr, oi, ra);
+        return cpu_ldw_le_mmu(env, taddr, oi, ra);
     case MO_LESW:
-        return helper_le_ldsw_mmu(env, taddr, oi, ra);
+        return (int16_t)cpu_ldw_le_mmu(env, taddr, oi, ra);
     case MO_LEUL:
-        return helper_le_ldul_mmu(env, taddr, oi, ra);
+        return cpu_ldl_le_mmu(env, taddr, oi, ra);
     case MO_LESL:
-        return helper_le_ldsl_mmu(env, taddr, oi, ra);
+        return (int32_t)cpu_ldl_le_mmu(env, taddr, oi, ra);
     case MO_LEUQ:
-        return helper_le_ldq_mmu(env, taddr, oi, ra);
+        return cpu_ldq_le_mmu(env, taddr, oi, ra);
     case MO_BEUW:
-        return helper_be_lduw_mmu(env, taddr, oi, ra);
+        return cpu_ldw_be_mmu(env, taddr, oi, ra);
     case MO_BESW:
-        return helper_be_ldsw_mmu(env, taddr, oi, ra);
+        return (int16_t)cpu_ldw_be_mmu(env, taddr, oi, ra);
     case MO_BEUL:
-        return helper_be_ldul_mmu(env, taddr, oi, ra);
+        return cpu_ldl_be_mmu(env, taddr, oi, ra);
     case MO_BESL:
-        return helper_be_ldsl_mmu(env, taddr, oi, ra);
+        return (int32_t)cpu_ldl_be_mmu(env, taddr, oi, ra);
     case MO_BEUQ:
-        return helper_be_ldq_mmu(env, taddr, oi, ra);
+        return cpu_ldq_be_mmu(env, taddr, oi, ra);
     default:
         g_assert_not_reached();
     }
-#else
-    void *haddr = g2h(env_cpu(env), taddr);
-    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
-    uint64_t ret;
-
-    set_helper_retaddr(ra);
-    if (taddr & a_mask) {
-        helper_unaligned_ld(env, taddr);
-    }
-    switch (mop & (MO_BSWAP | MO_SSIZE)) {
-    case MO_UB:
-        ret = ldub_p(haddr);
-        break;
-    case MO_SB:
-        ret = ldsb_p(haddr);
-        break;
-    case MO_LEUW:
-        ret = lduw_le_p(haddr);
-        break;
-    case MO_LESW:
-        ret = ldsw_le_p(haddr);
-        break;
-    case MO_LEUL:
-        ret = (uint32_t)ldl_le_p(haddr);
-        break;
-    case MO_LESL:
-        ret = (int32_t)ldl_le_p(haddr);
-        break;
-    case MO_LEUQ:
-        ret = ldq_le_p(haddr);
-        break;
-    case MO_BEUW:
-        ret = lduw_be_p(haddr);
-        break;
-    case MO_BESW:
-        ret = ldsw_be_p(haddr);
-        break;
-    case MO_BEUL:
-        ret = (uint32_t)ldl_be_p(haddr);
-        break;
-    case MO_BESL:
-        ret = (int32_t)ldl_be_p(haddr);
-        break;
-    case MO_BEUQ:
-        ret = ldq_be_p(haddr);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    clear_helper_retaddr();
-    return ret;
-#endif
 }
 
 static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
@@ -381,67 +328,31 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
-#ifdef CONFIG_SOFTMMU
     switch (mop & (MO_BSWAP | MO_SIZE)) {
     case MO_UB:
-        helper_ret_stb_mmu(env, taddr, val, oi, ra);
+        cpu_stb_mmu(env, taddr, val, oi, ra);
         break;
     case MO_LEUW:
-        helper_le_stw_mmu(env, taddr, val, oi, ra);
+        cpu_stw_le_mmu(env, taddr, val, oi, ra);
         break;
     case MO_LEUL:
-        helper_le_stl_mmu(env, taddr, val, oi, ra);
+        cpu_stl_le_mmu(env, taddr, val, oi, ra);
         break;
     case MO_LEUQ:
-        helper_le_stq_mmu(env, taddr, val, oi, ra);
+        cpu_stq_le_mmu(env, taddr, val, oi, ra);
         break;
     case MO_BEUW:
-        helper_be_stw_mmu(env, taddr, val, oi, ra);
+        cpu_stw_be_mmu(env, taddr, val, oi, ra);
         break;
     case MO_BEUL:
-        helper_be_stl_mmu(env, taddr, val, oi, ra);
+        cpu_stl_be_mmu(env, taddr, val, oi, ra);
         break;
     case MO_BEUQ:
-        helper_be_stq_mmu(env, taddr, val, oi, ra);
+        cpu_stq_be_mmu(env, taddr, val, oi, ra);
         break;
     default:
         g_assert_not_reached();
     }
-#else
-    void *haddr = g2h(env_cpu(env), taddr);
-    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
-
-    set_helper_retaddr(ra);
-    if (taddr & a_mask) {
-        helper_unaligned_st(env, taddr);
-    }
-    switch (mop & (MO_BSWAP | MO_SIZE)) {
-    case MO_UB:
-        stb_p(haddr, val);
-        break;
-    case MO_LEUW:
-        stw_le_p(haddr, val);
-        break;
-    case MO_LEUL:
-        stl_le_p(haddr, val);
-        break;
-    case MO_LEUQ:
-        stq_le_p(haddr, val);
-        break;
-    case MO_BEUW:
-        stw_be_p(haddr, val);
-        break;
-    case MO_BEUL:
-        stl_be_p(haddr, val);
-        break;
-    case MO_BEUQ:
-        stq_be_p(haddr, val);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    clear_helper_retaddr();
-#endif
 }
 
 #if TCG_TARGET_REG_BITS == 64
-- 
2.34.1


