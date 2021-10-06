Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB0142414D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:27:02 +0200 (CEST)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8ov-0004Oq-8X
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ip-0002Ua-IS
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:44 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iZ-0007jg-Lz
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:43 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n11so1473625plf.4
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I/IbL08sf+NIXm6AXw/3XfDwYbRLUWTUI/cMLAtkFlk=;
 b=dJOf7/8sByRI56cRXNrk7bB5KpmrOI7jS5n1h1kOFCXSFyu3RwN1vluUUydfP0of5+
 8vPltCtJ9+0eS+2BFVfUu6RXVQnrFLFE6Ze9VEpj8AON33FTfQdxdQO6m6SkCcwGYIoc
 ffu86m9WQ9z76QxaHjQvzXB+2A/jefMF6DPKJfLTrJbA6/PkucsXfa6Rj8OfBzlEJBg7
 W0fkCyuit+CGkXhWhLmHApvYidz7QNgc1e/V8wAAuXa1pG4RfzCVpXeikFlZuWSdTDkF
 nnBVAq67hzahEMJ1Dn8ShlJaG8jN2IuYhEgeVaLxShi2/HP/gSQfC2ND2+ufh36gjKWs
 7CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I/IbL08sf+NIXm6AXw/3XfDwYbRLUWTUI/cMLAtkFlk=;
 b=0OCxm+X0sALMxlXys8iJSYZhMwKqvMPaYyh7pWPAnB+DXa6vwlS+1PGFww9IzZOK8I
 M6BFUX38bd62BUXrjtyS7PMk8IPxTrsIIMuCbIageHy1mEYbRztSYZgsMRkL1Yixc/qK
 UUeOio4nobl9GvOwwxUOMKA1vqrQz6FyyM7sY5cH2dDs4GQ/gHQoh9vPDWTHdiRuQcsz
 D3v568RaLNeudSzE6d6Z2bKpxTL0eVwsn35SsJee/OXxyimDmgJKF74x1e+EqNNpvxn+
 kwd7RHkY8R6LatDk+MjjFqu8kK9L+hRDeC3uQnP/IIz5UBdWSEJ5tCp9I8vPevFsc+R7
 Q2/g==
X-Gm-Message-State: AOAM530s5ds90cajEk7SeJWWMjrU16MzWE6l+vI4QhiO5ya7YPD1Z1JK
 yg3qTq+o4Ovy715xNuLO6JMX76O3N5o53Q==
X-Google-Smtp-Source: ABdhPJySIRFCzc7ktvVYt9/xCT8VVYTiJXFQCb8S2wzbY7ejLNvFAPkhThd+EBMfZrUlOQTGNZGV2A==
X-Received: by 2002:a17:902:e552:b0:13e:249d:1205 with SMTP id
 n18-20020a170902e55200b0013e249d1205mr11569841plf.27.1633533623211; 
 Wed, 06 Oct 2021 08:20:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/28] accel/tcg: Pass MemOpIdx to atomic_trace_*_post
Date: Wed,  6 Oct 2021 08:19:55 -0700
Message-Id: <20211006152014.741026-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly use the MemOpIdx directly, but in the meantime
re-compute the trace meminfo.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


