Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D253F3D040C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:46:18 +0200 (CEST)
Received: from localhost ([::1]:42000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xZB-00044E-U9
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQt-0006Ic-OV
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:43 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQr-0000Is-MQ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:43 -0400
Received: by mail-pg1-x532.google.com with SMTP id 70so20387841pgh.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lpkYejps8WW7OyPV4Frr6HZRCmemCrR97xZ2v/S9G4=;
 b=TBe3CXtcdBlEUBC36dErb9F1HuNYwsUewAmfDsy+YgmoFqkeIUlZJYcXyf/SlHNjpJ
 MFYPNYd6yYT6HaknkfY985lFVNczElcAY+tyikfpB7kOyhIV3MYb7r1K/Fj04R0F35LY
 pavskahkZySpCaAKnnNvEEGk4OIJXUmLrIQPTdyR9q9z9o4LHW11EQ6bJFMlRDPGH5wY
 UhJsfmOneGS343JHdeYfABWluZvVCxbjqDnFsvLp7p9qeMVXnZuuOpTwELCBT0938AFA
 S9vXrJbg3FACCP/PBcy87Dc0t4lmYbjUnXUmYNLDMreScTRwj7LMaJCbYRut8EusYTBe
 piOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lpkYejps8WW7OyPV4Frr6HZRCmemCrR97xZ2v/S9G4=;
 b=hbGN/Vb/8rjxGqA1wYiVS+L1xez4qwecKm4jlGNORhrgwTb58n4nHwpndLChjjHUGd
 J732RNH2txKKXpTQKnhpfVW0TDWcAq3D2p1HW596oBMoVDNzW5SbHBN8WBim5J4KyuO5
 H+0vW7OvQsF7paVmknJmDhX8aK6GYYreXkINKwNNG8x2qintRorqUaaMKJ9hgpeoMp8q
 NU2PU3BhsNu/huHfnX3hLfGUQZYnF15OrZMdegLg4kpolK3FiAohWTxX9NA+/x49Zkbn
 a2zKWvG6JEFao/fKGpUsuc57GIr/lyXyUaJpNnUUbzSDs89+eh8X3DI3z3kB8IWrP3rV
 DEXw==
X-Gm-Message-State: AOAM533l0ZZGEAKkvhWTRI+sQ0nDBGn/rZPtmxOhqTMj6sZZK9YUWiCa
 RkDfhtKB+KhYzjBOIVjXiSIiumKXyD5Tyw==
X-Google-Smtp-Source: ABdhPJyXsEzZGbnNaen1Uxpc26R+pCXGF2Er+YrN2E5b9/ZPz6D+AKjwaTIJmjgFpJbuERtCgIEOuw==
X-Received: by 2002:a62:ee0f:0:b029:335:a681:34f6 with SMTP id
 e15-20020a62ee0f0000b0290335a68134f6mr25767415pfi.55.1626817060533; 
 Tue, 20 Jul 2021 14:37:40 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm24376813pff.7.2021.07.20.14.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:37:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/10] accel/tcg: Push trace info building into
 atomic_common.c.inc
Date: Tue, 20 Jul 2021 11:37:23 -1000
Message-Id: <20210720213723.630552-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720213723.630552-1-richard.henderson@linaro.org>
References: <20210720213723.630552-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use trace_mem_get_info instead of trace_mem_build_info,
using the TCGMemOpIdx that we already have.  Do this in
the atomic_trace_*_pre function as common subroutines.

Tested-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h   | 48 +++++++++--------------------------
 accel/tcg/atomic_common.c.inc | 37 ++++++++++++++++++---------
 2 files changed, 37 insertions(+), 48 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index 6ee0158c5f..d89af4cc1e 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -77,10 +77,8 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
-    uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
-                                         ATOMIC_MMU_IDX);
+    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);
 
-    atomic_trace_rmw_pre(env, addr, info);
 #if DATA_SIZE == 16
     ret = atomic16_cmpxchg(haddr, cmpv, newv);
 #else
@@ -99,10 +97,8 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ, retaddr);
     DATA_TYPE val;
-    uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
-                                         ATOMIC_MMU_IDX);
+    uint16_t info = atomic_trace_ld_pre(env, addr, oi);
 
-    atomic_trace_ld_pre(env, addr, info);
     val = atomic16_read(haddr);
     ATOMIC_MMU_CLEANUP;
     atomic_trace_ld_post(env, addr, info);
@@ -114,10 +110,8 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_WRITE, retaddr);
-    uint16_t info = trace_mem_build_info(SHIFT, false, 0, true,
-                                         ATOMIC_MMU_IDX);
+    uint16_t info = atomic_trace_st_pre(env, addr, oi);
 
-    atomic_trace_st_pre(env, addr, info);
     atomic16_set(haddr, val);
     ATOMIC_MMU_CLEANUP;
     atomic_trace_st_post(env, addr, info);
@@ -130,10 +124,8 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
-    uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
-                                         ATOMIC_MMU_IDX);
+    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);
 
-    atomic_trace_rmw_pre(env, addr, info);
     ret = qatomic_xchg__nocheck(haddr, val);
     ATOMIC_MMU_CLEANUP;
     atomic_trace_rmw_post(env, addr, info);
@@ -147,9 +139,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,  \
                                          PAGE_READ | PAGE_WRITE, retaddr); \
     DATA_TYPE ret;                                                  \
-    uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
-                                         ATOMIC_MMU_IDX);           \
-    atomic_trace_rmw_pre(env, addr, info);                          \
+    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);            \
     ret = qatomic_##X(haddr, val);                                  \
     ATOMIC_MMU_CLEANUP;                                             \
     atomic_trace_rmw_post(env, addr, info);                         \
@@ -182,9 +172,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     XDATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE, \
                                           PAGE_READ | PAGE_WRITE, retaddr); \
     XDATA_TYPE cmp, old, new, val = xval;                           \
-    uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
-                                         ATOMIC_MMU_IDX);           \
-    atomic_trace_rmw_pre(env, addr, info);                          \
+    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);            \
     smp_mb();                                                       \
     cmp = qatomic_read__nocheck(haddr);                             \
     do {                                                            \
@@ -228,10 +216,8 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
-    uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
-                                         ATOMIC_MMU_IDX);
+    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);
 
-    atomic_trace_rmw_pre(env, addr, info);
 #if DATA_SIZE == 16
     ret = atomic16_cmpxchg(haddr, BSWAP(cmpv), BSWAP(newv));
 #else
@@ -250,10 +236,8 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ, retaddr);
     DATA_TYPE val;
-    uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
-                                         ATOMIC_MMU_IDX);
+    uint16_t info = atomic_trace_ld_pre(env, addr, oi);
 
-    atomic_trace_ld_pre(env, addr, info);
     val = atomic16_read(haddr);
     ATOMIC_MMU_CLEANUP;
     atomic_trace_ld_post(env, addr, info);
@@ -265,11 +249,9 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_WRITE, retaddr);
-    uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, true,
-                                         ATOMIC_MMU_IDX);
+    uint16_t info = atomic_trace_st_pre(env, addr, oi);
 
     val = BSWAP(val);
-    atomic_trace_st_pre(env, addr, info);
     val = BSWAP(val);
     atomic16_set(haddr, val);
     ATOMIC_MMU_CLEANUP;
@@ -283,10 +265,8 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     ABI_TYPE ret;
-    uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
-                                         ATOMIC_MMU_IDX);
+    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);
 
-    atomic_trace_rmw_pre(env, addr, info);
     ret = qatomic_xchg__nocheck(haddr, BSWAP(val));
     ATOMIC_MMU_CLEANUP;
     atomic_trace_rmw_post(env, addr, info);
@@ -300,9 +280,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,  \
                                          PAGE_READ | PAGE_WRITE, retaddr); \
     DATA_TYPE ret;                                                  \
-    uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
-                                         false, ATOMIC_MMU_IDX);    \
-    atomic_trace_rmw_pre(env, addr, info);                          \
+    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);            \
     ret = qatomic_##X(haddr, BSWAP(val));                           \
     ATOMIC_MMU_CLEANUP;                                             \
     atomic_trace_rmw_post(env, addr, info);                         \
@@ -332,9 +310,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     XDATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE, \
                                           PAGE_READ | PAGE_WRITE, retaddr); \
     XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
-    uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
-                                         false, ATOMIC_MMU_IDX);    \
-    atomic_trace_rmw_pre(env, addr, info);                          \
+    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);            \
     smp_mb();                                                       \
     ldn = qatomic_read__nocheck(haddr);                             \
     do {                                                            \
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index a668cf0d6f..6c0339f610 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -13,45 +13,58 @@
  * See the COPYING file in the top-level directory.
  */
 
-static inline
-void atomic_trace_rmw_pre(CPUArchState *env, target_ulong addr, uint16_t info)
+static uint16_t atomic_trace_rmw_pre(CPUArchState *env, target_ulong addr,
+                                     TCGMemOpIdx oi)
 {
     CPUState *cpu = env_cpu(env);
+    uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), false);
 
     trace_guest_mem_before_exec(cpu, addr, info);
     trace_guest_mem_before_exec(cpu, addr, info | TRACE_MEM_ST);
+
+    return info;
 }
 
-static inline void
-atomic_trace_rmw_post(CPUArchState *env, target_ulong addr, uint16_t info)
+static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
+                                  uint16_t info)
 {
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info | TRACE_MEM_ST);
 }
 
-static inline
-void atomic_trace_ld_pre(CPUArchState *env, target_ulong addr, uint16_t info)
+#if HAVE_ATOMIC128
+static uint16_t atomic_trace_ld_pre(CPUArchState *env, target_ulong addr,
+                                    TCGMemOpIdx oi)
 {
+    uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), false);
+
     trace_guest_mem_before_exec(env_cpu(env), addr, info);
+
+    return info;
 }
 
-static inline
-void atomic_trace_ld_post(CPUArchState *env, target_ulong addr, uint16_t info)
+static void atomic_trace_ld_post(CPUArchState *env, target_ulong addr,
+                                 uint16_t info)
 {
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info);
 }
 
-static inline
-void atomic_trace_st_pre(CPUArchState *env, target_ulong addr, uint16_t info)
+static uint16_t atomic_trace_st_pre(CPUArchState *env, target_ulong addr,
+                                    TCGMemOpIdx oi)
 {
+    uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), true);
+
     trace_guest_mem_before_exec(env_cpu(env), addr, info);
+
+    return info;
 }
 
-static inline
-void atomic_trace_st_post(CPUArchState *env, target_ulong addr, uint16_t info)
+static void atomic_trace_st_post(CPUArchState *env, target_ulong addr,
+                                 uint16_t info)
 {
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info);
 }
+#endif
 
 /*
  * Atomic helpers callable from TCG.
-- 
2.25.1


