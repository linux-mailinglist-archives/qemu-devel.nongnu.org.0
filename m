Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C0C3D9AC5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:04:00 +0200 (CEST)
Received: from localhost ([::1]:43726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uSt-0006iH-Md
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCo-0004Xo-Ca
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCm-0002gs-9f
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:22 -0400
Received: by mail-pj1-x1031.google.com with SMTP id b6so7748227pji.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HdX91ddSefw9WOR3T+XUSTk5v0QSAR+uv2V28a3n4Cs=;
 b=kti7gqXFl1hG4Tsd49u6pvSJwmUoh1a2olmxIIun6SvBJcaquYewNSHWH/qjYoHHYK
 SNX6jpvD/delh2R3f5qgQeUe4SJLXSo7NIZXB0v4EEqPEsrn9tDFevmn0up3vpzGr9jE
 mW6q+HcUGBkYu+qC+jzYwtnEbe8pFEDg5zmOwSwSTNfpxNd/GH+aMxS6KbLj/xW3npl2
 2LCUe/7nZ22uk3CBEBzK47Rzve9lkRxbEsm9b+ht8w/3ZkEbJ2aUSKLGtSeCkfXc6suf
 vhZ+tcEWJ3fkSzXA2x2mqduhPUKFeAEv1HRbOKM404QGV71ha0tflJNsmImO3aMhxogp
 UCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdX91ddSefw9WOR3T+XUSTk5v0QSAR+uv2V28a3n4Cs=;
 b=jAT7mjKuWY4UFchetgMcDxzxNf4ss+LOH/mBvVQq1gsroZecli+1k2OfZnc6Z7Z3PF
 Mi3g5pzWqxwx3Y82ObP2UCpe4Y90uZ3XnpN1bnCtg58EOJHyItnx8kuxgWu7oejmdqN3
 ymoANfpXLYfthpSNXumXu7hSYrrsuC2588vXiJ15tnFyHoXdqQY2WqV8rHrmWbeSuKE2
 b5NHOT9FcMmJNDB1ZWMg2ioWcy594zGiPRz1lBJP0TIc99Cg9Gz3LmTHAIRt2BHRw4JG
 IB8g1sngymW9pOg6QmkbeFYsPAyje1+5PmBqguI+mqq9ejZl7kOVg8j53muLil4zpXQD
 jbNA==
X-Gm-Message-State: AOAM531ooTDGFtyYIbc0suexRfEpt9f/TlsId4/VDE8Xfs2/PnVpPp5+
 D5A8cuby7fOjCubzV/yM0Jx9yDr/N4SVqg==
X-Google-Smtp-Source: ABdhPJzjrrLSGvYNMi8KqCAHWW79ONnUongquB+sYtFLgU/+AEGsM+s0IgYvtgyPR+XvipGiXdNnuA==
X-Received: by 2002:a17:90a:1b2e:: with SMTP id
 q43mr2529452pjq.230.1627519638840; 
 Wed, 28 Jul 2021 17:47:18 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 24/43] accel/tcg: Pass MemOpIdx to atomic_trace_*_post
Date: Wed, 28 Jul 2021 14:46:28 -1000
Message-Id: <20210729004647.282017-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

We will shortly use the MemOpIdx directly, but in the meantime
re-compute the trace meminfo.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h   | 48 +++++++++++++++++------------------
 accel/tcg/atomic_common.c.inc | 30 +++++++++++-----------
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index 4230ff2957..c08d859a8a 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -77,15 +77,15 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
-    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);
 
+    atomic_trace_rmw_pre(env, addr, oi);
 #if DATA_SIZE == 16
     ret = atomic16_cmpxchg(haddr, cmpv, newv);
 #else
     ret = qatomic_cmpxchg__nocheck(haddr, cmpv, newv);
 #endif
     ATOMIC_MMU_CLEANUP;
-    atomic_trace_rmw_post(env, addr, info);
+    atomic_trace_rmw_post(env, addr, oi);
     return ret;
 }
 
@@ -97,11 +97,11 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ, retaddr);
     DATA_TYPE val;
-    uint16_t info = atomic_trace_ld_pre(env, addr, oi);
 
+    atomic_trace_ld_pre(env, addr, oi);
     val = atomic16_read(haddr);
     ATOMIC_MMU_CLEANUP;
-    atomic_trace_ld_post(env, addr, info);
+    atomic_trace_ld_post(env, addr, oi);
     return val;
 }
 
@@ -110,11 +110,11 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_WRITE, retaddr);
-    uint16_t info = atomic_trace_st_pre(env, addr, oi);
 
+    atomic_trace_st_pre(env, addr, oi);
     atomic16_set(haddr, val);
     ATOMIC_MMU_CLEANUP;
-    atomic_trace_st_post(env, addr, info);
+    atomic_trace_st_post(env, addr, oi);
 }
 #endif
 #else
@@ -124,11 +124,11 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
-    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);
 
+    atomic_trace_rmw_pre(env, addr, oi);
     ret = qatomic_xchg__nocheck(haddr, val);
     ATOMIC_MMU_CLEANUP;
-    atomic_trace_rmw_post(env, addr, info);
+    atomic_trace_rmw_post(env, addr, oi);
     return ret;
 }
 
@@ -139,10 +139,10 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,  \
                                          PAGE_READ | PAGE_WRITE, retaddr); \
     DATA_TYPE ret;                                                  \
-    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);            \
+    atomic_trace_rmw_pre(env, addr, oi);                            \
     ret = qatomic_##X(haddr, val);                                  \
     ATOMIC_MMU_CLEANUP;                                             \
-    atomic_trace_rmw_post(env, addr, info);                         \
+    atomic_trace_rmw_post(env, addr, oi);                           \
     return ret;                                                     \
 }
 
@@ -172,7 +172,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     XDATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE, \
                                           PAGE_READ | PAGE_WRITE, retaddr); \
     XDATA_TYPE cmp, old, new, val = xval;                           \
-    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);            \
+    atomic_trace_rmw_pre(env, addr, oi);                            \
     smp_mb();                                                       \
     cmp = qatomic_read__nocheck(haddr);                             \
     do {                                                            \
@@ -180,7 +180,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
         cmp = qatomic_cmpxchg__nocheck(haddr, old, new);            \
     } while (cmp != old);                                           \
     ATOMIC_MMU_CLEANUP;                                             \
-    atomic_trace_rmw_post(env, addr, info);                         \
+    atomic_trace_rmw_post(env, addr, oi);                           \
     return RET;                                                     \
 }
 
@@ -216,15 +216,15 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     DATA_TYPE ret;
-    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);
 
+    atomic_trace_rmw_pre(env, addr, oi);
 #if DATA_SIZE == 16
     ret = atomic16_cmpxchg(haddr, BSWAP(cmpv), BSWAP(newv));
 #else
     ret = qatomic_cmpxchg__nocheck(haddr, BSWAP(cmpv), BSWAP(newv));
 #endif
     ATOMIC_MMU_CLEANUP;
-    atomic_trace_rmw_post(env, addr, info);
+    atomic_trace_rmw_post(env, addr, oi);
     return BSWAP(ret);
 }
 
@@ -236,11 +236,11 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ, retaddr);
     DATA_TYPE val;
-    uint16_t info = atomic_trace_ld_pre(env, addr, oi);
 
+    atomic_trace_ld_pre(env, addr, oi);
     val = atomic16_read(haddr);
     ATOMIC_MMU_CLEANUP;
-    atomic_trace_ld_post(env, addr, info);
+    atomic_trace_ld_post(env, addr, oi);
     return BSWAP(val);
 }
 
@@ -249,12 +249,12 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 {
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_WRITE, retaddr);
-    uint16_t info = atomic_trace_st_pre(env, addr, oi);
 
+    atomic_trace_st_pre(env, addr, oi);
     val = BSWAP(val);
     atomic16_set(haddr, val);
     ATOMIC_MMU_CLEANUP;
-    atomic_trace_st_post(env, addr, info);
+    atomic_trace_st_post(env, addr, oi);
 }
 #endif
 #else
@@ -264,11 +264,11 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,
                                          PAGE_READ | PAGE_WRITE, retaddr);
     ABI_TYPE ret;
-    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);
 
+    atomic_trace_rmw_pre(env, addr, oi);
     ret = qatomic_xchg__nocheck(haddr, BSWAP(val));
     ATOMIC_MMU_CLEANUP;
-    atomic_trace_rmw_post(env, addr, info);
+    atomic_trace_rmw_post(env, addr, oi);
     return BSWAP(ret);
 }
 
@@ -279,10 +279,10 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     DATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE,  \
                                          PAGE_READ | PAGE_WRITE, retaddr); \
     DATA_TYPE ret;                                                  \
-    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);            \
+    atomic_trace_rmw_pre(env, addr, oi);                            \
     ret = qatomic_##X(haddr, BSWAP(val));                           \
     ATOMIC_MMU_CLEANUP;                                             \
-    atomic_trace_rmw_post(env, addr, info);                         \
+    atomic_trace_rmw_post(env, addr, oi);                           \
     return BSWAP(ret);                                              \
 }
 
@@ -309,7 +309,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
     XDATA_TYPE *haddr = atomic_mmu_lookup(env, addr, oi, DATA_SIZE, \
                                           PAGE_READ | PAGE_WRITE, retaddr); \
     XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
-    uint16_t info = atomic_trace_rmw_pre(env, addr, oi);            \
+    atomic_trace_rmw_pre(env, addr, oi);                            \
     smp_mb();                                                       \
     ldn = qatomic_read__nocheck(haddr);                             \
     do {                                                            \
@@ -317,7 +317,7 @@ ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
         ldn = qatomic_cmpxchg__nocheck(haddr, ldo, BSWAP(new));     \
     } while (ldo != ldn);                                           \
     ATOMIC_MMU_CLEANUP;                                             \
-    atomic_trace_rmw_post(env, addr, info);                         \
+    atomic_trace_rmw_post(env, addr, oi);                           \
     return RET;                                                     \
 }
 
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index 6019a957b9..db81eb5e66 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -13,55 +13,55 @@
  * See the COPYING file in the top-level directory.
  */
 
-static uint16_t atomic_trace_rmw_pre(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi)
+static void atomic_trace_rmw_pre(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi)
 {
     CPUState *cpu = env_cpu(env);
     uint16_t info = trace_mem_get_info(oi, false);
 
     trace_guest_mem_before_exec(cpu, addr, info);
     trace_guest_mem_before_exec(cpu, addr, info | TRACE_MEM_ST);
-
-    return info;
 }
 
 static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
-                                  uint16_t info)
+                                  MemOpIdx oi)
 {
+    uint16_t info = trace_mem_get_info(oi, false);
+
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info | TRACE_MEM_ST);
 }
 
 #if HAVE_ATOMIC128
-static uint16_t atomic_trace_ld_pre(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi)
+static void atomic_trace_ld_pre(CPUArchState *env, target_ulong addr,
+                                MemOpIdx oi)
 {
     uint16_t info = trace_mem_get_info(oi, false);
 
     trace_guest_mem_before_exec(env_cpu(env), addr, info);
-
-    return info;
 }
 
 static void atomic_trace_ld_post(CPUArchState *env, target_ulong addr,
-                                 uint16_t info)
+                                 MemOpIdx oi)
 {
+    uint16_t info = trace_mem_get_info(oi, false);
+
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info);
 }
 
-static uint16_t atomic_trace_st_pre(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi)
+static void atomic_trace_st_pre(CPUArchState *env, target_ulong addr,
+                                MemOpIdx oi)
 {
     uint16_t info = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), addr, info);
-
-    return info;
 }
 
 static void atomic_trace_st_post(CPUArchState *env, target_ulong addr,
-                                 uint16_t info)
+                                 MemOpIdx oi)
 {
+    uint16_t info = trace_mem_get_info(oi, false);
+
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info);
 }
 #endif
-- 
2.25.1


