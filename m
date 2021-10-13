Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46BA42C8B3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:29:20 +0200 (CEST)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maj0B-0005CC-Vt
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu1-0003vu-K4
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:57 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitz-00035W-9E
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id t11so2396009plq.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G//NS2fkhVANUgvHOhkYtgTAT643zn3f67efI5cMAJg=;
 b=nfyS01RNiuErtQGL7GKfNx4Z/ZKmrbhY9AnX9wgogry28Dw/uayygfl5Cb0RnAb70y
 7cdfdT1RBIK2iEjqMqlE80NlHKzmo0DwmFkUSv73TfgNX34KINGb2U/NdLFqCXEs886D
 GCgCo2nF8xoaEmNHe910QCP0CCZA9JdzpsSQY9NACql8Uf1F4As11phzXlak3paFkn5T
 SvvCKhnK1Bbp1qPkC3fuGlonw5drYh9pmns/a3UIDcNPyWY8lBHiPFZK/MKb6v6iT5N7
 jQZ8jowhwBvyqjLbUO5nPvTU6Mt9e4mHF8h8/noN1a103JoOy2I0Bc8pg4MoFzlvGdjR
 W0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G//NS2fkhVANUgvHOhkYtgTAT643zn3f67efI5cMAJg=;
 b=0Z3lLGNO3FaLjBxCxwSL1QOh8GxOIiYRQFOsYMHK9jRcIca0Uz9eXPjNFTmAAyEvpG
 hEY6O/MIEm03PWNV7YRYUk7u1UivMbpyt6gZyURvjGDCBtqZ/7/gZV3IzWhaTvob4P14
 MEC+b15XXo2XxAebpcO8EvHyMNRrRRqJu8Vnp3kGjItPBBkxV9kHgypXMu989s7lERiB
 Umj9cNWKgzfjtY2W6S3Zp0le4TS6/NtSVc1zOnQnxHPE+9iNrDKyAcCMsFHxM1E1ke+1
 QX76D7EELvCmEuDeJ9aCLwL3vVTqCe4lPOoE6V58GUEYSZ0mV9sKgqkntMZxZsIiZCWB
 FTpw==
X-Gm-Message-State: AOAM532hTdIkeOiiMQEnDkkrW6RjmbD6MjnHQRMkRjGsR06V7fnHe6NA
 WvcXodIShzJ+5+SLBUPVhtgOFFytl0/CPg==
X-Google-Smtp-Source: ABdhPJxnzpabsgH+DyrygHvawD+Tyzx9Qwe3x4i+VZnPAjhh7ZCRd5oHDAzTzy22RH6HWplpvYmewA==
X-Received: by 2002:a17:90a:9d81:: with SMTP id
 k1mr15425813pjp.153.1634149371464; 
 Wed, 13 Oct 2021 11:22:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] accel/tcg: Move cpu_atomic decls to exec/cpu_ldst.h
Date: Wed, 13 Oct 2021 11:22:32 -0700
Message-Id: <20211013182239.991127-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
index 9f398b9afe..83e38487cf 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -33,7 +33,6 @@
 #include "qemu/queue.h"
 #include "tcg/tcg-mo.h"
 #include "tcg-target.h"
-#include "qemu/int128.h"
 #include "tcg/tcg-cond.h"
 
 /* XXX: make safe guess about sizes */
@@ -1312,92 +1311,6 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
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
index 4cafd3c11a..b110c57956 100644
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
index c1bf73b6f9..cfbc987ba6 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -22,7 +22,6 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "semihosting/semihost.h"
-#include "tcg/tcg.h"
 
 #if !defined(CONFIG_USER_ONLY)
 
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
index e64d1bc725..251d4acf55 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -27,7 +27,6 @@
 #include "exec/cpu_ldst.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
-#include "tcg/tcg.h"
 #include "trace.h"
 
 #if !defined(CONFIG_USER_ONLY)
-- 
2.25.1


