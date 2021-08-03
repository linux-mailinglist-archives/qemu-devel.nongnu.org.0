Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B8C3DE560
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:31:28 +0200 (CEST)
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm5P-0006QX-I4
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpn-0003lm-Qk
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:21 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpl-0002NH-H3
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:19 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so1748183pjn.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I/IbL08sf+NIXm6AXw/3XfDwYbRLUWTUI/cMLAtkFlk=;
 b=zCvEcWN+13NOOjpRuVfyxvEPLd07V0XoAIsdjsS/XLiBva4hR9Jz3wj2/PJxvMckKw
 wzgIwqkfjqkIDt57+3PELb4LVbk/ziNyTu03hxMAxhUA+eB2G/CbxF/ehZx/Ja/+V+tx
 J9xpAtCEdKPt8J/bEw1Z1HpRUOxDagZjnELRKHqAiNUbT98ncTYCbq6lnmQoQyYStWWW
 8ps7Dh31U4+Me2iTKLyt7iGYVen4ic/KL7VMVDQ5Hr+quXp0MCg1bzLSeCG25cj+HOpw
 gsdNH5duWKRlL7wPdIkDhWVRaMte5cF7I4/sk6EZrQ2lZvUHyDjoJpmgvOzVVMKD8Umx
 2DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I/IbL08sf+NIXm6AXw/3XfDwYbRLUWTUI/cMLAtkFlk=;
 b=ZykgKXldLYnSfoZiH7gwWrox4HcLODndZenXF7fKQjbbA33MXmMlfsikKRoyUgllg7
 X5dMVdcEtNB5ehqCNyD43aT4jX1/pR6dHA0pYYC4JNGHmgulOY3UfZ34puOEGNM9ZObb
 YZ4XQpR3g6BWHPSR3Tfm+ivJCTks/oBabDackcVwXxFNM9iVyfYvCxhFsX7+W+i8Z3zI
 du6hT0fFSC2182dWlY+KuzjBq4yXnnlvllDanvKOAFBykUNVtgJ0yRLHa2xsI5k2fuGl
 AHhEb28efaFPMQfkg+nCsGTfVRPdlmWN13MYI65LDGcLa3McYq+Pc9DIDl3ydxvGnqMp
 Yuog==
X-Gm-Message-State: AOAM530Nk5PHX+yGUerk54PSSpQ1l7e+wK+HA1RjCV7Q45Ws268l+zBr
 A9Kzu4qG5+jCPLSCX7qowcF0azahc92lVw==
X-Google-Smtp-Source: ABdhPJzXpvE/5oh8qhZDUpDQg2pg8pQ4u16N3jGhuJaKpm48b19I3oNp4b5LkSo+ZIxZWi2njFTseQ==
X-Received: by 2002:a63:1041:: with SMTP id 1mr1234912pgq.274.1627964116288;
 Mon, 02 Aug 2021 21:15:16 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/55] accel/tcg: Pass MemOpIdx to atomic_trace_*_post
Date: Mon,  2 Aug 2021 18:14:14 -1000
Message-Id: <20210803041443.55452-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


