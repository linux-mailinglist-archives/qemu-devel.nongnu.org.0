Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D63F0C11
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:48:46 +0200 (CEST)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRYL-0002s2-4W
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6g-00017K-AL
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:10 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6e-0000N9-AA
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:10 -0400
Received: by mail-pf1-x431.google.com with SMTP id w68so3175749pfd.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hHMHfkcyDT1Bi7m+6pCfEQ+mFQ6ocVl3PgXEGC7QWHU=;
 b=UnpqJ7Vw+hYC6y9lpmiO5MWAUSuWGoqF+TVgsz4szGnn/X4aMSEuWTqPnHZr98Pjyx
 a+7bVTjVZjhqn8UvJyJanGO20/V4Dt0+180CcZcRi3p5StVBbjRKIJwuK5duVg/j5ug0
 tznffXMWutcoLyENb+pb0cD1OioiOSL9J2t6+O4D3rKOaT1QN1rAUSs1D8gPzGl93B4V
 DHbSI784p7EWER641PB8lyt8A2Y5cv1I3DebSYggIPQ6co+QkCUyZf6bMuyQ0tt1SqZB
 +l1NkxVJ2cA35F8aFOtRL681Zc7XmpM6XGbEgDd7yJFaVYEiI41YSCvvKKuGK3ISOPDB
 7CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hHMHfkcyDT1Bi7m+6pCfEQ+mFQ6ocVl3PgXEGC7QWHU=;
 b=mA7X61CzxPVId6/2WGxpGVh9T8r4RqKjbY9LPrAKjNXERWPySAHO/PIQhBpJS56Kc0
 xk3yj60byoBe7dbZrcjYPvy79t60VQCx9iepZBSd3OvXM+x/mpPg/m+hDnse0tvZ7SF4
 9j65TBehTwmk61ocNVEdz4j7WhkOd9KMEanWeFn5Xs9MW+QXPwQSC45mwvaVEsC0tDjH
 jm9jkDCCmEe4YNxwWYzMzHURTqgfyoCP1yR80zAQ0hipbJSH0OsOWb70IA8gMA7mEXtB
 j5abNJz/gF3Yew5eMB4IKycldTm37paVHBo8vsNwJXh52llX2vMONO8bvzs5wwS6cY1C
 N+kw==
X-Gm-Message-State: AOAM533voe4ZEc1dyJfkTcMtjtra3jFmt0Y9viCYyFaFjB7Mg6kJqoJH
 gYOWW2uPxIH4FuwYdXqflF+YiQAlpF6KWg==
X-Google-Smtp-Source: ABdhPJy8wbY68AMos0r2UFvjKH5nfmxaBBIv8tGS+8ZpTrjH73C4qaJRy0cl5dMT0w0q87uURa3tJA==
X-Received: by 2002:a63:d14c:: with SMTP id c12mr10249373pgj.412.1629314407064; 
 Wed, 18 Aug 2021 12:20:07 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:20:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 36/66] accel/tcg: Move cpu_atomic decls to exec/cpu_ldst.h
Date: Wed, 18 Aug 2021 09:18:50 -1000
Message-Id: <20210818191920.390759-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

The previous placement in tcg/tcg.h was not logical.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h       | 87 +++++++++++++++++++++++++++++++++++
 include/tcg/tcg.h             | 87 -----------------------------------
 target/arm/helper-a64.c       |  1 -
 target/m68k/op_helper.c       |  1 -
 target/ppc/mem_helper.c       |  1 -
 target/s390x/tcg/mem_helper.c |  1 -
 6 files changed, 87 insertions(+), 91 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index a4dad0772f..a878fd0105 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -63,6 +63,7 @@
 #define CPU_LDST_H
 
 #include "exec/memopidx.h"
+#include "qemu/int128.h"
 
 #if defined(CONFIG_USER_ONLY)
 /* sparc32plus has 64bit long but 32bit space address
@@ -233,6 +234,92 @@ void cpu_stl_le_mmu(CPUArchState *env, abi_ptr ptr, uint32_t val,
 void cpu_stq_le_mmu(CPUArchState *env, abi_ptr ptr, uint64_t val,
                     MemOpIdx oi, uintptr_t ra);
 
+uint32_t cpu_atomic_cmpxchgb_mmu(CPUArchState *env, target_ulong addr,
+                                 uint32_t cmpv, uint32_t newv,
+                                 MemOpIdx oi, uintptr_t retaddr);
+uint32_t cpu_atomic_cmpxchgw_le_mmu(CPUArchState *env, target_ulong addr,
+                                    uint32_t cmpv, uint32_t newv,
+                                    MemOpIdx oi, uintptr_t retaddr);
+uint32_t cpu_atomic_cmpxchgl_le_mmu(CPUArchState *env, target_ulong addr,
+                                    uint32_t cmpv, uint32_t newv,
+                                    MemOpIdx oi, uintptr_t retaddr);
+uint64_t cpu_atomic_cmpxchgq_le_mmu(CPUArchState *env, target_ulong addr,
+                                    uint64_t cmpv, uint64_t newv,
+                                    MemOpIdx oi, uintptr_t retaddr);
+uint32_t cpu_atomic_cmpxchgw_be_mmu(CPUArchState *env, target_ulong addr,
+                                    uint32_t cmpv, uint32_t newv,
+                                    MemOpIdx oi, uintptr_t retaddr);
+uint32_t cpu_atomic_cmpxchgl_be_mmu(CPUArchState *env, target_ulong addr,
+                                    uint32_t cmpv, uint32_t newv,
+                                    MemOpIdx oi, uintptr_t retaddr);
+uint64_t cpu_atomic_cmpxchgq_be_mmu(CPUArchState *env, target_ulong addr,
+                                    uint64_t cmpv, uint64_t newv,
+                                    MemOpIdx oi, uintptr_t retaddr);
+
+#define GEN_ATOMIC_HELPER(NAME, TYPE, SUFFIX)         \
+TYPE cpu_atomic_ ## NAME ## SUFFIX ## _mmu            \
+    (CPUArchState *env, target_ulong addr, TYPE val,  \
+     MemOpIdx oi, uintptr_t retaddr);
+
+#ifdef CONFIG_ATOMIC64
+#define GEN_ATOMIC_HELPER_ALL(NAME)          \
+    GEN_ATOMIC_HELPER(NAME, uint32_t, b)     \
+    GEN_ATOMIC_HELPER(NAME, uint32_t, w_le)  \
+    GEN_ATOMIC_HELPER(NAME, uint32_t, w_be)  \
+    GEN_ATOMIC_HELPER(NAME, uint32_t, l_le)  \
+    GEN_ATOMIC_HELPER(NAME, uint32_t, l_be)  \
+    GEN_ATOMIC_HELPER(NAME, uint64_t, q_le)  \
+    GEN_ATOMIC_HELPER(NAME, uint64_t, q_be)
+#else
+#define GEN_ATOMIC_HELPER_ALL(NAME)          \
+    GEN_ATOMIC_HELPER(NAME, uint32_t, b)     \
+    GEN_ATOMIC_HELPER(NAME, uint32_t, w_le)  \
+    GEN_ATOMIC_HELPER(NAME, uint32_t, w_be)  \
+    GEN_ATOMIC_HELPER(NAME, uint32_t, l_le)  \
+    GEN_ATOMIC_HELPER(NAME, uint32_t, l_be)
+#endif
+
+GEN_ATOMIC_HELPER_ALL(fetch_add)
+GEN_ATOMIC_HELPER_ALL(fetch_sub)
+GEN_ATOMIC_HELPER_ALL(fetch_and)
+GEN_ATOMIC_HELPER_ALL(fetch_or)
+GEN_ATOMIC_HELPER_ALL(fetch_xor)
+GEN_ATOMIC_HELPER_ALL(fetch_smin)
+GEN_ATOMIC_HELPER_ALL(fetch_umin)
+GEN_ATOMIC_HELPER_ALL(fetch_smax)
+GEN_ATOMIC_HELPER_ALL(fetch_umax)
+
+GEN_ATOMIC_HELPER_ALL(add_fetch)
+GEN_ATOMIC_HELPER_ALL(sub_fetch)
+GEN_ATOMIC_HELPER_ALL(and_fetch)
+GEN_ATOMIC_HELPER_ALL(or_fetch)
+GEN_ATOMIC_HELPER_ALL(xor_fetch)
+GEN_ATOMIC_HELPER_ALL(smin_fetch)
+GEN_ATOMIC_HELPER_ALL(umin_fetch)
+GEN_ATOMIC_HELPER_ALL(smax_fetch)
+GEN_ATOMIC_HELPER_ALL(umax_fetch)
+
+GEN_ATOMIC_HELPER_ALL(xchg)
+
+#undef GEN_ATOMIC_HELPER_ALL
+#undef GEN_ATOMIC_HELPER
+
+Int128 cpu_atomic_cmpxchgo_le_mmu(CPUArchState *env, target_ulong addr,
+                                  Int128 cmpv, Int128 newv,
+                                  MemOpIdx oi, uintptr_t retaddr);
+Int128 cpu_atomic_cmpxchgo_be_mmu(CPUArchState *env, target_ulong addr,
+                                  Int128 cmpv, Int128 newv,
+                                  MemOpIdx oi, uintptr_t retaddr);
+
+Int128 cpu_atomic_ldo_le_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr);
+Int128 cpu_atomic_ldo_be_mmu(CPUArchState *env, target_ulong addr,
+                             MemOpIdx oi, uintptr_t retaddr);
+void cpu_atomic_sto_le_mmu(CPUArchState *env, target_ulong addr, Int128 val,
+                           MemOpIdx oi, uintptr_t retaddr);
+void cpu_atomic_sto_be_mmu(CPUArchState *env, target_ulong addr, Int128 val,
+                           MemOpIdx oi, uintptr_t retaddr);
+
 #if defined(CONFIG_USER_ONLY)
 
 extern __thread uintptr_t helper_retaddr;
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index e67ef34694..114ad66b25 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -33,7 +33,6 @@
 #include "qemu/queue.h"
 #include "tcg/tcg-mo.h"
 #include "tcg-target.h"
-#include "qemu/int128.h"
 #include "tcg/tcg-cond.h"
 
 /* XXX: make safe guess about sizes */
@@ -1306,92 +1305,6 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 #endif
 #endif /* CONFIG_SOFTMMU */
 
-uint32_t cpu_atomic_cmpxchgb_mmu(CPUArchState *env, target_ulong addr,
-                                 uint32_t cmpv, uint32_t newv,
-                                 MemOpIdx oi, uintptr_t retaddr);
-uint32_t cpu_atomic_cmpxchgw_le_mmu(CPUArchState *env, target_ulong addr,
-                                    uint32_t cmpv, uint32_t newv,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint32_t cpu_atomic_cmpxchgl_le_mmu(CPUArchState *env, target_ulong addr,
-                                    uint32_t cmpv, uint32_t newv,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint64_t cpu_atomic_cmpxchgq_le_mmu(CPUArchState *env, target_ulong addr,
-                                    uint64_t cmpv, uint64_t newv,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint32_t cpu_atomic_cmpxchgw_be_mmu(CPUArchState *env, target_ulong addr,
-                                    uint32_t cmpv, uint32_t newv,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint32_t cpu_atomic_cmpxchgl_be_mmu(CPUArchState *env, target_ulong addr,
-                                    uint32_t cmpv, uint32_t newv,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint64_t cpu_atomic_cmpxchgq_be_mmu(CPUArchState *env, target_ulong addr,
-                                    uint64_t cmpv, uint64_t newv,
-                                    MemOpIdx oi, uintptr_t retaddr);
-
-#define GEN_ATOMIC_HELPER(NAME, TYPE, SUFFIX)         \
-TYPE cpu_atomic_ ## NAME ## SUFFIX ## _mmu            \
-    (CPUArchState *env, target_ulong addr, TYPE val,  \
-     MemOpIdx oi, uintptr_t retaddr);
-
-#ifdef CONFIG_ATOMIC64
-#define GEN_ATOMIC_HELPER_ALL(NAME)          \
-    GEN_ATOMIC_HELPER(NAME, uint32_t, b)     \
-    GEN_ATOMIC_HELPER(NAME, uint32_t, w_le)  \
-    GEN_ATOMIC_HELPER(NAME, uint32_t, w_be)  \
-    GEN_ATOMIC_HELPER(NAME, uint32_t, l_le)  \
-    GEN_ATOMIC_HELPER(NAME, uint32_t, l_be)  \
-    GEN_ATOMIC_HELPER(NAME, uint64_t, q_le)  \
-    GEN_ATOMIC_HELPER(NAME, uint64_t, q_be)
-#else
-#define GEN_ATOMIC_HELPER_ALL(NAME)          \
-    GEN_ATOMIC_HELPER(NAME, uint32_t, b)     \
-    GEN_ATOMIC_HELPER(NAME, uint32_t, w_le)  \
-    GEN_ATOMIC_HELPER(NAME, uint32_t, w_be)  \
-    GEN_ATOMIC_HELPER(NAME, uint32_t, l_le)  \
-    GEN_ATOMIC_HELPER(NAME, uint32_t, l_be)
-#endif
-
-GEN_ATOMIC_HELPER_ALL(fetch_add)
-GEN_ATOMIC_HELPER_ALL(fetch_sub)
-GEN_ATOMIC_HELPER_ALL(fetch_and)
-GEN_ATOMIC_HELPER_ALL(fetch_or)
-GEN_ATOMIC_HELPER_ALL(fetch_xor)
-GEN_ATOMIC_HELPER_ALL(fetch_smin)
-GEN_ATOMIC_HELPER_ALL(fetch_umin)
-GEN_ATOMIC_HELPER_ALL(fetch_smax)
-GEN_ATOMIC_HELPER_ALL(fetch_umax)
-
-GEN_ATOMIC_HELPER_ALL(add_fetch)
-GEN_ATOMIC_HELPER_ALL(sub_fetch)
-GEN_ATOMIC_HELPER_ALL(and_fetch)
-GEN_ATOMIC_HELPER_ALL(or_fetch)
-GEN_ATOMIC_HELPER_ALL(xor_fetch)
-GEN_ATOMIC_HELPER_ALL(smin_fetch)
-GEN_ATOMIC_HELPER_ALL(umin_fetch)
-GEN_ATOMIC_HELPER_ALL(smax_fetch)
-GEN_ATOMIC_HELPER_ALL(umax_fetch)
-
-GEN_ATOMIC_HELPER_ALL(xchg)
-
-#undef GEN_ATOMIC_HELPER_ALL
-#undef GEN_ATOMIC_HELPER
-
-Int128 cpu_atomic_cmpxchgo_le_mmu(CPUArchState *env, target_ulong addr,
-                                  Int128 cmpv, Int128 newv,
-                                  MemOpIdx oi, uintptr_t retaddr);
-Int128 cpu_atomic_cmpxchgo_be_mmu(CPUArchState *env, target_ulong addr,
-                                  Int128 cmpv, Int128 newv,
-                                  MemOpIdx oi, uintptr_t retaddr);
-
-Int128 cpu_atomic_ldo_le_mmu(CPUArchState *env, target_ulong addr,
-                             MemOpIdx oi, uintptr_t retaddr);
-Int128 cpu_atomic_ldo_be_mmu(CPUArchState *env, target_ulong addr,
-                             MemOpIdx oi, uintptr_t retaddr);
-void cpu_atomic_sto_le_mmu(CPUArchState *env, target_ulong addr, Int128 val,
-                           MemOpIdx oi, uintptr_t retaddr);
-void cpu_atomic_sto_be_mmu(CPUArchState *env, target_ulong addr, Int128 val,
-                           MemOpIdx oi, uintptr_t retaddr);
-
 #ifdef CONFIG_DEBUG_TCG
 void tcg_assert_listed_vecop(TCGOpcode);
 #else
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index f06399f351..f1a4089a4f 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -32,7 +32,6 @@
 #include "exec/cpu_ldst.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
-#include "tcg/tcg.h"
 #include "fpu/softfloat.h"
 #include <zlib.h> /* For crc32 */
 
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 5918a29516..d2065fa992 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -22,7 +22,6 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "semihosting/semihost.h"
-#include "tcg/tcg.h"
 
 #if defined(CONFIG_USER_ONLY)
 
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index e2282baa8d..39945d9ea5 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -25,7 +25,6 @@
 #include "exec/helper-proto.h"
 #include "helper_regs.h"
 #include "exec/cpu_ldst.h"
-#include "tcg/tcg.h"
 #include "internal.h"
 #include "qemu/atomic128.h"
 
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 3782c1c098..b20a82a914 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -27,7 +27,6 @@
 #include "exec/cpu_ldst.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
-#include "tcg/tcg.h"
 
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/s390x/storage-keys.h"
-- 
2.25.1


