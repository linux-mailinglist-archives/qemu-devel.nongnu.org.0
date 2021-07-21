Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F33D1786
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:08:55 +0200 (CEST)
Received: from localhost ([::1]:45388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IWU-0002QM-9R
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IO6-0002oX-Jz
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:14 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IO4-0005jF-6b
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:14 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u3so1643230plf.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lpkYejps8WW7OyPV4Frr6HZRCmemCrR97xZ2v/S9G4=;
 b=PYxgg2UPZFdy/frwaVRYUo8Yw7x3XZx3QATn2I9nvDCB/41dxFXVPndOId6WJlZm6P
 vy4w37Pz1E/ycEEL6wwb9pIFoS6L27WQN26pF3AVb5gEA/FAX1+wrVINavlFLL9pSauf
 YRG9SVTiqL25+kLw2ZZ/qO5FpN7a2KxUBFHX1T66Gz4X58RDEIeNIfZYv5hmfJB9LOK5
 YnGYs4tlfskfIL2wHArjVSvMuu+rpFldpmhNQsntVZAXrSGIENBF+mBU+jP2WfpYMPXO
 VnT1if3UI6OmBwMXOmNs61GktbDvECWldx49W6aY0yQgbrW5HsgwH+Si4jLF/HaH+F+f
 m4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lpkYejps8WW7OyPV4Frr6HZRCmemCrR97xZ2v/S9G4=;
 b=TicEQykB+MUn6tLmeFY5eUO0U/VLaETtkanV6y91w5yayuq3ygb13iDYOgeM37QtOl
 AAWR3g1gCto2sRuESS7Plfr72/JDcvEhk6AybyiP6Iria/iLMr5ZFGEXo/CJHiHVmHMp
 0L9X8AwEyBFy5HTwMsKNUtk8GfHxqVGLCseI1/jUxP852Pw99Qnbrs1bIMEC+qXlfJQ3
 o1U2/lgFz3JFEvU6mXH56ssAuht7Iqxk06JDfHrBA2FxPPCozGepOsjfdIf63fpZzxy8
 fuagUtYhP9o994ngpfStJ9lfNO5DtcQOKMXnPhsbSH/Q/JfUw3VzrSGYXvYDslyooS6q
 y0Pw==
X-Gm-Message-State: AOAM533G8VPXC4Zx3c2bOUVdVEWgzBnfQ0n9nGl1vyy6rx2+ld/pjOhP
 cVopEDlK4NoIRa2GPfELa+HaIx9BfYonqw==
X-Google-Smtp-Source: ABdhPJz7CTeZHp1zGKvDc0ZbueLd2pDvmA1IPE7NmJHTqr1WiImyFaOtJsv0eGuJzYyGFuAXNagGag==
X-Received: by 2002:a63:1551:: with SMTP id 17mr27908982pgv.76.1626897610954; 
 Wed, 21 Jul 2021 13:00:10 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/27] accel/tcg: Push trace info building into
 atomic_common.c.inc
Date: Wed, 21 Jul 2021 09:59:37 -1000
Message-Id: <20210721195954.879535-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: peter.maydell@linaro.org, Cole Robinson <crobinso@redhat.com>
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


