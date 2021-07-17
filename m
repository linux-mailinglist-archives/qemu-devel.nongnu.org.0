Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F54A3CC5DA
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:26:19 +0200 (CEST)
Received: from localhost ([::1]:58098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4px4-0006ne-NL
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvJ-0003yx-3W
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:29 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvF-0002kz-F7
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:28 -0400
Received: by mail-pj1-x102e.google.com with SMTP id cu14so8778894pjb.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f4KajLa9oVBk7sLwP1ibCkxLdu0XaiC2IaFiGZiZZXg=;
 b=T7JGnPLjVHopbT93FPGylRPlvrr/1S5ZjsQb4rV4DpoZjgEqqhM/PQPtwxVMHmNSbJ
 PvMoLsKsd8sKo+m74YySO/1YGW2C0vedq5wLBAS2SImAgotP4hEXIl8zFHflA19hPcJT
 KoU422jsAF1lyhQGfizjf+nRU5/iYJbgZBCjrLEZPruK8enlOnR39mciE1ycSdaJkc0O
 +B2KvYKm+Y1N1FNcZ1EbeG00nNTeYQMXuulz17sIYG8T5MHgMXsrycRzPp8x5s4YbGg2
 YFgoYNZOqRRQZkbL8E3EAUxYmzHFEnTlRQSjSVySj11dY0LHB3LEos6hevGiFxiXNS/K
 qanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f4KajLa9oVBk7sLwP1ibCkxLdu0XaiC2IaFiGZiZZXg=;
 b=kMwqTuwfHWH8sgDn/QzVGck16CXSw58lOwiamjDNO3JNwm5ruke8+as6fB2VfsHeW5
 cBs+2NstKXILSjvfGwFV6N2nWl094nInJaUsXSSig+IoFnf467IosM2hEhA1bKRaWJCT
 epIgIi9VzK0SU7ptkoeH4MRUuz5+yGq+wDjfqLHd7GGXHhfsHb48KOVOr37uxwZBqbrD
 +XYM6Jnr/BsSVCDhV4siW65eYnYa8j9n1FKDp3+cBuaOKzxSJ8HvJwIwcczo7bcMrg4/
 UXALnwjXz3N5v3LkTybTxODro15VAy7yYU/ZeQxXF6EIC9stCZkeJ5/twWmeHWJw/xau
 W7Ag==
X-Gm-Message-State: AOAM5330z9PG3ih3dhRPpQNGF974yGM5veOckaTETtBJtLpSTqUPdBrm
 Yk+5MaTZlWnUcmaCoCnvR9ryopyJ8IXLkQ==
X-Google-Smtp-Source: ABdhPJzPLTH/+5f/btStYmzZuwqT73SK4pt/9IzivGx5qIeyHgswPx0eaLV+LGDbkNiLHpto5xpGhQ==
X-Received: by 2002:a17:90a:f40a:: with SMTP id
 ch10mr11015323pjb.149.1626549864234; 
 Sat, 17 Jul 2021 12:24:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y82sm14547527pfb.121.2021.07.17.12.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 12:24:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/10] accel/tcg: Fold EXTRA_ARGS into atomic_template.h
Date: Sat, 17 Jul 2021 12:24:15 -0700
Message-Id: <20210717192419.2066778-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717192419.2066778-1-richard.henderson@linaro.org>
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All instances of EXTRA_ARGS are now identical.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 842cf4b572..cc0e673222 100644
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


