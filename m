Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609462F1C8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:48:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxyw-0007Pj-53; Fri, 18 Nov 2022 04:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyu-0007Ox-3x
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:20 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxys-000219-8p
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:19 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 w3-20020a17090a460300b00218524e8877so6671145pjg.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qpFA3aCL2lo2xwTYO+Bt7nlm4UpkrZxrUtHrYnNErW4=;
 b=GpxVmGnjqxG1DWCTiv3Z2+S7Lq78jS/aeCejjrELFeecUL+nxY7M/ogPPqTWIpLk9b
 DIsZZN8+5S3FfzwWR1iT2uegQoPNQ+m5Q32ZiiJM8VAviP5r4XjuDmfn/IiZUYg4wGQh
 oOu/9yx9J7tTe5EQslnJCh9T/+ecw8yp+7mJiEH/0hNnLrwf/9j1eZ7kq8xIW6GwMosy
 7248IM/m5TKzOgSn9Z7frN3qzNiZwqnOm9x7MHQ2OsLlKJODOq6+wENzAf/mp5sHdMHu
 VbrLrs+eEVIz3WLamuC3UGcs5vbuw72R2YfWc8ExECZ1zfb2F//oMhyfOm52VNysIlOb
 F6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qpFA3aCL2lo2xwTYO+Bt7nlm4UpkrZxrUtHrYnNErW4=;
 b=5GlKpx/yG/dCD7d8RFSdTO+NBtnyhc3toS0/XPqCVPoBZAveaZTv/NLHHrCxYhGe6V
 SBHOxlr/4H+hUHdXyM0j4/EUzWbjt7syc6dRZBDsP2YRTtvKR1vD4guWz5Ozx9W1yRCe
 G2xl5l4lv9ezHQL1/NVVFPPUrd7USGdt0SVtAlNcPMknLVBtmZVfEH9aeADZMBm7ut1N
 Eq6SlsRvgqXeFc97AnCYf7Aq58IqVauiPZWE0zB8lIZVxb7rXASqmQk1/1T0J2TFJgkw
 vEeklAEltTa1QMItVmvNOS/ytfTT9/gDeR+XOkl235hSdmCRgpZRfqqOAkvM8qK5I6Hm
 v+pA==
X-Gm-Message-State: ANoB5pkC321W4PVZ86/xx9dATaX/vSAGkPrIe0//G2W1W7Cb7COKE+0A
 ZkCvfuVF0kHMAutdCAfp4cGtmPKpkroUqA==
X-Google-Smtp-Source: AA0mqf6eZMUXL5qrt9vVy41L1ZYF1L7T5g9EFMQoUPQxq6V0sN4ZCbleOF71qcMfFUpgl1pCoDFeiQ==
X-Received: by 2002:a17:902:7e48:b0:187:3c62:582c with SMTP id
 a8-20020a1709027e4800b001873c62582cmr6753642pln.114.1668764896771; 
 Fri, 18 Nov 2022 01:48:16 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 09/29] tcg/tci: Use cpu_{ld,st}_mmu
Date: Fri, 18 Nov 2022 01:47:34 -0800
Message-Id: <20221118094754.242910-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c |   9 +++-
 tcg/tci.c    | 127 ++++++++-------------------------------------------
 2 files changed, 26 insertions(+), 110 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index e7e4951a3c..1f81c3dbb3 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2914,7 +2914,12 @@ static void tcg_gen_req_mo(TCGBar type)
 
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
@@ -2928,7 +2933,7 @@ static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
 static void plugin_gen_mem_callbacks(TCGv vaddr, MemOpIdx oi,
                                      enum qemu_plugin_mem_rw rw)
 {
-#ifdef CONFIG_PLUGIN
+#if defined(CONFIG_PLUGIN) && !defined(CONFIG_TCG_INTERPRETER)
     if (tcg_ctx->plugin_insn != NULL) {
         qemu_plugin_meminfo_t info = make_plugin_meminfo(oi, rw);
         plugin_gen_empty_mem_callback(vaddr, info);
diff --git a/tcg/tci.c b/tcg/tci.c
index 022fe9d0f8..52fdd3f5ec 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -293,87 +293,34 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
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
@@ -382,67 +329,31 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
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


