Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56C3CC5E2
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:29:47 +0200 (CEST)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4q0Q-0000M7-AM
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvK-00044X-Pr
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:31 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvI-0002lq-1Y
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:30 -0400
Received: by mail-pf1-x433.google.com with SMTP id j199so12261124pfd.7
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GIUv1WQj8xxHoGOvU1A8YTu2ejWXCPxTA9/RfhMMQd4=;
 b=FlBzbAPKWTgrcTiV+8XZvehGW0ywhrWrXwpy+dOC51rpTp3u9bva2PVa54nCE4SN8V
 h088tRFXfxwiEt9E1SpMcQZLfUKJLB/JPdcSzMymoWfb4RPWIGRlhvbpwDoOgW8KAe67
 ogH9VH081HSjYBhZTWH31jgHHDTj32Viv8MfA0NBd95NBcvVA+9wsEOzmfydjcTwhfBH
 r4Vd36Kzcd/i79FCyvAloKwWJRkb7xXbOSRz2i9EC7P5eMgoCs7He8RfEXPmury+BZyZ
 3cWPwLf0DeJgfqe+mz4YAxbCBJHvKK5z+4NnRVqUWQSWRW4nRVBbaeSZyZWUEwAB6rsH
 Pbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GIUv1WQj8xxHoGOvU1A8YTu2ejWXCPxTA9/RfhMMQd4=;
 b=MTdBeq73i+jk/FY+7rJI4lLRwik9FOsY8TrlQLHQbL5yFRmrIRnVvu84qLM4w1DbeW
 XKMvj6ygZKvdti+jdB7lReUmtd1vDCgNqUYvRKSXjv/jj5JqUUqO6z5Bzf6pVpbq8yfL
 0uyuJzsJkxpI75CUTeO4w1y0CvudlGdzgn8TIeXeuOUfbmEMS4Nv1wbV0mG5Vu9H1Z5q
 6tnZ+vy6oEizZXMMWbrQc7GuPKlTgWAN1OKdGwONvwm/gFnTEqUkyqGmjH7nxBMEh/MW
 GL6+1t2DFRPvKZnpfW67pXgWFPE6FtezS22eLlprAZIHeplbHuis6t9PjoI/92O/ztVQ
 vofA==
X-Gm-Message-State: AOAM533n0kYJ1nEGeOfWDRvR5p5QZrN6dPa4mePpaQw34Afj2/eiIdyr
 ciF1TINKNs6RmnY8f9+iGIaonb0JHHMW1A==
X-Google-Smtp-Source: ABdhPJytziOq3YEJG3fjjBgn3WpTY+QOAj5uNYHQ+L30zWLaJGHa/GajNYYzB/NfSE2YanBJ3ifQoA==
X-Received: by 2002:aa7:824a:0:b029:2ec:89ee:e798 with SMTP id
 e10-20020aa7824a0000b02902ec89eee798mr16771904pfn.12.1626549866736; 
 Sat, 17 Jul 2021 12:24:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y82sm14547527pfb.121.2021.07.17.12.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 12:24:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/10] accel/tcg: Push trace info building into
 atomic_common.c.inc
Date: Sat, 17 Jul 2021 12:24:19 -0700
Message-Id: <20210717192419.2066778-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717192419.2066778-1-richard.henderson@linaro.org>
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use trace_mem_get_info instead of trace_mem_build_info,
using the TCGMemOpIdx that we already have.  Do this in
the atomic_trace_*_pre function as common subroutines.

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


