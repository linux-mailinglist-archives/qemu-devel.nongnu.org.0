Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8893CC09A
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 03:44:17 +0200 (CEST)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4ZNI-0008PI-Qb
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 21:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKd-0000yg-7M
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:31 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKb-00012L-8H
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:30 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so9856681pjb.3
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 18:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EmX38RTVDf4WMQXsWLcKWlD/A7WU936/JHI0y7Rxys4=;
 b=C9Hs0B0esQPOSabBDoYKvX02wk1vJptnfpHpfPYrxukikFQcmKXi54p3dAIYgr2saX
 /IqzK1mO6qVzrd0FJqJOj0rmoAKsha4+HwmK3JuGJabbR13/Ofn5IYnubQ6P0TvK9Px3
 3DK7u5kUc9DLQY1WPu0eQp2jr7ZdRsaVCL3kKaHPB2GhItGNrSMayBE/jgBktYxoloNw
 k8t+LzPMib+H0kYZ9ov4Sd9zY1xF4kZ+9ULbiU8aeQ1ZJGw8IMTqgTW5RKsTmSfqL/N+
 G8gGwQ78umdYPpfPqNiOjJVZSNgiLqBWvMA46f/BRpEOuSKwhTgoh6YsEzNMOJNqJmdm
 5TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EmX38RTVDf4WMQXsWLcKWlD/A7WU936/JHI0y7Rxys4=;
 b=Ppbtc0LrmI748qh4OkAOCuk2WG16YrvpurHGgfdsWypASr4YXnayCcP7ZnlP2knggl
 Ejusi3lrJRGRCK6px5SxAb5+eBJa/ciK7gDIyacdOPzfO20HhiOhkr2mzaHS9sotJLdw
 6bqrO/InpMhldGUGyN0Z4PazUx6HABkFjS63BERvy8hseF35Pqg1GFXqWEpfO6RydzX1
 xFsuV6hZ/04Yzqklgc/kIkDgk+7zCCLftc7RjnFzxGwFy/J1AMlBbiuUNlnAowCwh0t+
 21l87JM32Zps6Re+BvgRmCOZI07mig6vtu9mPG/3Z/RhzpCKZToqZvowYG/+ZY3A+pkU
 8U1A==
X-Gm-Message-State: AOAM531lqsTJbTP7/r0wbgbHjww4P2i4NMVxkdyRruivtug4vsEBe7a6
 rKFUi9fuHiXF2Wq67Q0lnLm/8W+X0Z/UTA==
X-Google-Smtp-Source: ABdhPJxFVO00+KrRX9yiw1gTHRyiCIZBH466o+CjBkgw0cf9+qT3i/Zj+ZdaOfnpG6wwpHoinwr9bA==
X-Received: by 2002:a17:90a:e611:: with SMTP id
 j17mr18191460pjy.48.1626486087932; 
 Fri, 16 Jul 2021 18:41:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm12812738pgj.8.2021.07.16.18.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 18:41:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/11] accel/tcg: Fold EXTRA_ARGS into atomic_template.h
Date: Fri, 16 Jul 2021 18:41:17 -0700
Message-Id: <20210717014121.1784956-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717014121.1784956-1-richard.henderson@linaro.org>
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All instances of EXTRA_ARGS are now identical.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h | 36 ++++++++++++++++++++----------------
 accel/tcg/cputlb.c          |  1 -
 accel/tcg/user-exec.c       |  1 -
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index d347462af5..52fb26a274 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -71,7 +71,8 @@
 #endif
 
 ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
-                              ABI_TYPE cmpv, ABI_TYPE newv EXTRA_ARGS)
+                              ABI_TYPE cmpv, ABI_TYPE newv,
+                              TCGMemOpIdx oi, uintptr_t retaddr)
 {
     ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
@@ -92,7 +93,8 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 
 #if DATA_SIZE >= 16
 #if HAVE_ATOMIC128
-ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr EXTRA_ARGS)
+ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
+                         TCGMemOpIdx oi, uintptr_t retaddr)
 {
     ATOMIC_MMU_DECLS;
     DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP_R;
@@ -106,8 +108,8 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr EXTRA_ARGS)
     return val;
 }
 
-void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr,
-                     ABI_TYPE val EXTRA_ARGS)
+void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
+                     TCGMemOpIdx oi, uintptr_t retaddr)
 {
     ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_W;
@@ -121,8 +123,8 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr,
 }
 #endif
 #else
-ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
-                           ABI_TYPE val EXTRA_ARGS)
+ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
+                           TCGMemOpIdx oi, uintptr_t retaddr)
 {
     ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
@@ -139,7 +141,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
 
 #define GEN_ATOMIC_HELPER(X)                                        \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                        ABI_TYPE val EXTRA_ARGS)                    \
+                        ABI_TYPE val, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                        \
@@ -173,7 +175,7 @@ GEN_ATOMIC_HELPER(xor_fetch)
  */
 #define GEN_ATOMIC_HELPER_FN(X, FN, XDATA_TYPE, RET)                \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                        ABI_TYPE xval EXTRA_ARGS)                   \
+                        ABI_TYPE xval, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
     XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                       \
@@ -218,7 +220,8 @@ GEN_ATOMIC_HELPER_FN(umax_fetch, MAX,  DATA_TYPE, new)
 #endif
 
 ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
-                              ABI_TYPE cmpv, ABI_TYPE newv EXTRA_ARGS)
+                              ABI_TYPE cmpv, ABI_TYPE newv,
+                              TCGMemOpIdx oi, uintptr_t retaddr)
 {
     ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
@@ -239,7 +242,8 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 
 #if DATA_SIZE >= 16
 #if HAVE_ATOMIC128
-ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr EXTRA_ARGS)
+ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
+                         TCGMemOpIdx oi, uintptr_t retaddr)
 {
     ATOMIC_MMU_DECLS;
     DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP_R;
@@ -253,8 +257,8 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr EXTRA_ARGS)
     return BSWAP(val);
 }
 
-void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr,
-                     ABI_TYPE val EXTRA_ARGS)
+void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
+                     TCGMemOpIdx oi, uintptr_t retaddr)
 {
     ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_W;
@@ -270,8 +274,8 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr,
 }
 #endif
 #else
-ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
-                           ABI_TYPE val EXTRA_ARGS)
+ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
+                           TCGMemOpIdx oi, uintptr_t retaddr)
 {
     ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
@@ -288,7 +292,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
 
 #define GEN_ATOMIC_HELPER(X)                                        \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                        ABI_TYPE val EXTRA_ARGS)                    \
+                        ABI_TYPE val, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                        \
@@ -320,7 +324,7 @@ GEN_ATOMIC_HELPER(xor_fetch)
  */
 #define GEN_ATOMIC_HELPER_FN(X, FN, XDATA_TYPE, RET)                \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                        ABI_TYPE xval EXTRA_ARGS)                   \
+                        ABI_TYPE xval, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
     XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                       \
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index ea6fd06834..69417b0630 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2691,7 +2691,6 @@ void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
  * This makes them callable from other helpers.
  */
 
-#define EXTRA_ARGS     , TCGMemOpIdx oi, uintptr_t retaddr
 #define ATOMIC_NAME(X) \
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
 #define ATOMIC_MMU_DECLS
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 7e92d6b875..f6f8ddeb60 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1241,7 +1241,6 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
  * This makes them callable from other helpers.
  */
 
-#define EXTRA_ARGS     , TCGMemOpIdx oi, uintptr_t retaddr
 #define ATOMIC_NAME(X) \
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
 #define ATOMIC_MMU_DECLS
-- 
2.25.1


