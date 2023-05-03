Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF146F51E7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:39:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pD-0007VK-Vy; Wed, 03 May 2023 03:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ow-0006pc-Qr
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:40 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oq-0007Ho-Kc
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f3331f928cso29309595e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098548; x=1685690548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v864RASdJk2+TV6BcRdJw1gHj5yuuHp35GCtp67gBJY=;
 b=ZaQMttBQfCk37A48HiPlmmDiJolbFbydtIfHrE0KtJxCEjgDezXhG4ouMXMqzUCiNB
 LimzWqLDlqQDMIOFgROX+HOrjT4FNmPAm1/hx5GsmY1DssXzZEYU/AIifrrMgQXK66wp
 mCEAiZ+z5tjb/JwDDgVfhFLmPEyoVWXmOkoLj5NRK5EaDAW9yadHSG0MGhacoWhzgTfw
 S+APY96DRwsExPM1HtVoKgR2DTJpOzlnNO7eVOEs2xhSnoDHTkl47QOCVwA5KTWeWgA4
 XJVWR3qQyd5vfGizoeMC/dUZUVzREYMxfYU9dek4+qYWx8YdYe20ve7x9f/YTBr9pnzr
 axDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098548; x=1685690548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v864RASdJk2+TV6BcRdJw1gHj5yuuHp35GCtp67gBJY=;
 b=SNZYO+P/BogT6qOAMICpatkAr7jhHzOKriZ5dL8r/yinC4wP4dbw4Cu/3YH++4IcTh
 EOrwTMFMDh4B5JEP9uKy0cOdYnGZ67nvRCB1w3SG2rafdkjchWWDP09aXkBsdk20tEkA
 TIM67fM4n8z40KkKbezRTOjVAyujZS/oxY91QTvNoRSGM5tS4k0tFHclDiLpd4BaUFB9
 +J/cIjOOZ4AA1m0Lfwk2AZ+JRMKZ80sIMdh6JMHNJsKCAg2vkMDl2Y5Nqsoy0TnHBpuA
 ZJIFCtRPmLpony7jqjxfdk2wNVscLIntrqi8lICNNExvxNpyYV4Uy8TJzaG+ufgyUX7C
 bIgw==
X-Gm-Message-State: AC+VfDxUTE0WSc6lXxk+xD1cRVsW75R/FHRFgn/+oGbWEjoNfVP27Pnb
 BOjLFFvHsCTpC7cgHcwplujPe/sAM1PKdIiUpRutng==
X-Google-Smtp-Source: ACHHUZ4b011uyJsyK9UrTdEr+IBpWpYkuqNJMZQVYOjCfBseHr0BvnRcQmUVgMadcG1Dj0xT/QnH8g==
X-Received: by 2002:a05:600c:22c9:b0:3f1:745c:7de2 with SMTP id
 9-20020a05600c22c900b003f1745c7de2mr13965236wmg.5.1683098548263; 
 Wed, 03 May 2023 00:22:28 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 04/84] tcg: Widen helper_{ld,st}_i128 addresses to uint64_t
Date: Wed,  3 May 2023 08:20:53 +0100
Message-Id: <20230503072221.1746802-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Always pass the target address as uint64_t.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h |  4 ++--
 accel/tcg/cputlb.c      |  5 ++---
 accel/tcg/user-exec.c   |  5 ++---
 tcg/tcg-op-ldst.c       | 26 ++++++++++++++++++++++++--
 4 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index d9adc646c1..0e6c5f55fd 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -39,8 +39,8 @@ DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_FLAGS_3(memset, TCG_CALL_NO_RWG, ptr, ptr, int, ptr)
 #endif /* IN_HELPER_PROTO */
 
-DEF_HELPER_FLAGS_3(ld_i128, TCG_CALL_NO_WG, i128, env, tl, i32)
-DEF_HELPER_FLAGS_4(st_i128, TCG_CALL_NO_WG, void, env, tl, i128, i32)
+DEF_HELPER_FLAGS_3(ld_i128, TCG_CALL_NO_WG, i128, env, i64, i32)
+DEF_HELPER_FLAGS_4(st_i128, TCG_CALL_NO_WG, void, env, i64, i128, i32)
 
 DEF_HELPER_FLAGS_5(atomic_cmpxchgb, TCG_CALL_NO_WG,
                    i32, env, tl, i32, i32, i32)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b594401267..e494404a0d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2541,7 +2541,7 @@ Int128 helper_ld16_mmu(CPUArchState *env, uint64_t addr,
     return do_ld16_mmu(env, addr, oi, retaddr);
 }
 
-Int128 helper_ld_i128(CPUArchState *env, target_ulong addr, uint32_t oi)
+Int128 helper_ld_i128(CPUArchState *env, uint64_t addr, uint32_t oi)
 {
     return helper_ld16_mmu(env, addr, oi, GETPC());
 }
@@ -3006,8 +3006,7 @@ void helper_st16_mmu(CPUArchState *env, uint64_t addr, Int128 val,
     do_st16_mmu(env, addr, val, oi, retaddr);
 }
 
-void helper_st_i128(CPUArchState *env, target_ulong addr, Int128 val,
-                    MemOpIdx oi)
+void helper_st_i128(CPUArchState *env, uint64_t addr, Int128 val, MemOpIdx oi)
 {
     helper_st16_mmu(env, addr, val, oi, GETPC());
 }
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 9a7afb6f78..36ad8284a5 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1136,7 +1136,7 @@ Int128 helper_ld16_mmu(CPUArchState *env, uint64_t addr,
     return ret;
 }
 
-Int128 helper_ld_i128(CPUArchState *env, target_ulong addr, MemOpIdx oi)
+Int128 helper_ld_i128(CPUArchState *env, uint64_t addr, MemOpIdx oi)
 {
     return helper_ld16_mmu(env, addr, oi, GETPC());
 }
@@ -1343,8 +1343,7 @@ void helper_st16_mmu(CPUArchState *env, uint64_t addr, Int128 val,
     do_st16_he_mmu(env, addr, val, mop, ra);
 }
 
-void helper_st_i128(CPUArchState *env, target_ulong addr,
-                    Int128 val, MemOpIdx oi)
+void helper_st_i128(CPUArchState *env, uint64_t addr, Int128 val, MemOpIdx oi)
 {
     helper_st16_mmu(env, addr, val, oi, GETPC());
 }
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index a3beede2f4..0010afb1a1 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -404,6 +404,24 @@ static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
 #define tcg_temp_ebb_new  tcg_temp_ebb_new_i32
 #endif
 
+static TCGv_i64 maybe_extend_addr64(TCGv addr)
+{
+#if TARGET_LONG_BITS == 32
+    TCGv_i64 a64 = tcg_temp_ebb_new_i64();
+    tcg_gen_extu_i32_i64(a64, addr);
+    return a64;
+#else
+    return addr;
+#endif
+}
+
+static void maybe_free_addr64(TCGv_i64 a64)
+{
+#if TARGET_LONG_BITS == 32
+    tcg_temp_free_i64(a64);
+#endif
+}
+
 void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     const MemOpIdx oi = make_memop_idx(memop, idx);
@@ -478,7 +496,9 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
             tcg_gen_bswap64_i64(y, y);
         }
     } else {
-        gen_helper_ld_i128(val, cpu_env, addr, tcg_constant_i32(oi));
+        TCGv_i64 a64 = maybe_extend_addr64(addr);
+        gen_helper_ld_i128(val, cpu_env, a64, tcg_constant_i32(oi));
+        maybe_free_addr64(a64);
     }
 
     plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
@@ -558,7 +578,9 @@ void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
         }
         tcg_temp_free(addr_p8);
     } else {
-        gen_helper_st_i128(cpu_env, addr, val, tcg_constant_i32(oi));
+        TCGv_i64 a64 = maybe_extend_addr64(addr);
+        gen_helper_st_i128(cpu_env, a64, val, tcg_constant_i32(oi));
+        maybe_free_addr64(a64);
     }
 
     plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
-- 
2.34.1


