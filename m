Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABEF133A0F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 05:17:08 +0100 (CET)
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip2mJ-0004se-PG
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 23:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50285)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2JZ-0005bt-CV
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 22:47:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2JX-0004HD-A0
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 22:47:25 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40674)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ip2JX-0004FM-1d
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 22:47:23 -0500
Received: by mail-pg1-x52e.google.com with SMTP id k25so866800pgt.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 19:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t2thyoGvsbaFk+uMDj/uOOcbmAbs4TE41aB8Qd+9rug=;
 b=qaECD4XoI/yNtkmW4CUXnW0cHCxkDUYb6/A+jxzS827gHrD1cG5aA8s1To/F/qoNqm
 ZLMIKhmxDo3vp1B1sZf6zJreKnfbqOdCfa04au/hFQaiJl2dnuDulyq3WIVh2AeILHJR
 SeRWO53UVADNF4s+5/dXbkTKR1A0ylGPKgF+XmQOPJ5woTmGmoJk5cMNWwHo9SJRJOuq
 EpWkFKmzoUx3yqf8jS8DpN8N/ZHaZrgpIXSHdATSU1zb27ddWfzfPUlb9ZVfMp2ka6V9
 mEMeIAEeIoSqSEQrO3XMlES52+n+XSAQOwPffENROPHPnA/7qdzDMvvke0w60gRmMiVz
 xIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t2thyoGvsbaFk+uMDj/uOOcbmAbs4TE41aB8Qd+9rug=;
 b=SGzeyRWG6r4jNr8F2pM6q8YV26VaWnpetlsnIRLCDRRyqPKB8NOoqdJSbtf4mMuOLG
 9uQySni0Q4bj7yGR8KCaPay0GFC70Raj7fsEVIZDRBTTKpj3Z4wuLCJFCtgV33OvAtkK
 jz3EtBVBsbqd3HaZwGg0fnEHhVzsAUdC6e0Uq6QlRB4plRZVuxHW29ROurOwvR8eYeAc
 FV5Xym/C4Eq6BdOWg22wAetSzeYv4MS0pL1ihKUWHT/M2VIFLEVDsq54AD9iurbNIt5T
 7em47VlyC0gY1najnLFsNFx0BGX+eplksQb0SdvJAw/zgNcAxhnLiGhyCc+4Lh/CapHR
 1+fQ==
X-Gm-Message-State: APjAAAUPFRsNwIu+J+n63YLSh/EnzNiq6zS3CIe7XBfQftYd123ALIS+
 b07CHScYlem1pTIbQCrMo8yGR/bqbnD7cQ==
X-Google-Smtp-Source: APXvYqztH5o7VYn3bxDf4rit103ymO9ldZr5nYP8E4qqDBnolxx4y05+mLDkb/QGpwd7YUYsUobBcg==
X-Received: by 2002:a63:358a:: with SMTP id c132mr3190698pga.286.1578455241650; 
 Tue, 07 Jan 2020 19:47:21 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id f23sm1198433pgj.76.2020.01.07.19.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 19:47:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/41] cputlb: Expand cpu_ldst_template.h in cputlb.c
Date: Wed,  8 Jan 2020 14:45:18 +1100
Message-Id: <20200108034523.17349-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108034523.17349-1-richard.henderson@linaro.org>
References: <20200108034523.17349-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52e
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reduce the amount of preprocessor obfuscation by expanding
the text of each of the functions generated.  The result is
only slightly smaller than the original.

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h          |  67 +++++++-----------
 include/exec/cpu_ldst_template.h | 117 -------------------------------
 accel/tcg/cputlb.c               | 107 +++++++++++++++++++++++++++-
 3 files changed, 130 insertions(+), 161 deletions(-)
 delete mode 100644 include/exec/cpu_ldst_template.h

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index cf4652bf48..62f38d5a22 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -94,32 +94,6 @@ typedef target_ulong abi_ptr;
 #define TARGET_ABI_FMT_ptr TARGET_ABI_FMT_lx
 #endif
 
-#if defined(CONFIG_USER_ONLY)
-
-extern __thread uintptr_t helper_retaddr;
-
-static inline void set_helper_retaddr(uintptr_t ra)
-{
-    helper_retaddr = ra;
-    /*
-     * Ensure that this write is visible to the SIGSEGV handler that
-     * may be invoked due to a subsequent invalid memory operation.
-     */
-    signal_barrier();
-}
-
-static inline void clear_helper_retaddr(void)
-{
-    /*
-     * Ensure that previous memory operations have succeeded before
-     * removing the data visible to the signal handler.
-     */
-    signal_barrier();
-    helper_retaddr = 0;
-}
-
-/* In user-only mode we provide only the _code and _data accessors. */
-
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);
 uint32_t cpu_lduw_data(CPUArchState *env, abi_ptr ptr);
 uint32_t cpu_ldl_data(CPUArchState *env, abi_ptr ptr);
@@ -148,6 +122,30 @@ void cpu_stl_data_ra(CPUArchState *env, abi_ptr ptr,
 void cpu_stq_data_ra(CPUArchState *env, abi_ptr ptr,
                      uint64_t val, uintptr_t retaddr);
 
+#if defined(CONFIG_USER_ONLY)
+
+extern __thread uintptr_t helper_retaddr;
+
+static inline void set_helper_retaddr(uintptr_t ra)
+{
+    helper_retaddr = ra;
+    /*
+     * Ensure that this write is visible to the SIGSEGV handler that
+     * may be invoked due to a subsequent invalid memory operation.
+     */
+    signal_barrier();
+}
+
+static inline void clear_helper_retaddr(void)
+{
+    /*
+     * Ensure that previous memory operations have succeeded before
+     * removing the data visible to the signal handler.
+     */
+    signal_barrier();
+    helper_retaddr = 0;
+}
+
 /*
  * Provide the same *_mmuidx_ra interface as for softmmu.
  * The mmu_idx argument is ignored.
@@ -271,23 +269,6 @@ void cpu_stl_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
 void cpu_stq_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
                        int mmu_idx, uintptr_t retaddr);
 
-/* these access are slower, they must be as rare as possible */
-#define CPU_MMU_INDEX (cpu_mmu_index(env, false))
-#define MEMSUFFIX _data
-#define DATA_SIZE 1
-#include "exec/cpu_ldst_template.h"
-
-#define DATA_SIZE 2
-#include "exec/cpu_ldst_template.h"
-
-#define DATA_SIZE 4
-#include "exec/cpu_ldst_template.h"
-
-#define DATA_SIZE 8
-#include "exec/cpu_ldst_template.h"
-#undef CPU_MMU_INDEX
-#undef MEMSUFFIX
-
 #endif /* defined(CONFIG_USER_ONLY) */
 
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr);
diff --git a/include/exec/cpu_ldst_template.h b/include/exec/cpu_ldst_template.h
deleted file mode 100644
index e400979f23..0000000000
--- a/include/exec/cpu_ldst_template.h
+++ /dev/null
@@ -1,117 +0,0 @@
-/*
- *  Software MMU support
- *
- * Generate inline load/store functions for one MMU mode and data
- * size.
- *
- * Generate a store function as well as signed and unsigned loads.
- *
- * Not used directly but included from cpu_ldst.h.
- *
- *  Copyright (c) 2003 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#if DATA_SIZE == 8
-#define SUFFIX q
-#define USUFFIX q
-#define DATA_TYPE uint64_t
-#define SHIFT 3
-#elif DATA_SIZE == 4
-#define SUFFIX l
-#define USUFFIX l
-#define DATA_TYPE uint32_t
-#define SHIFT 2
-#elif DATA_SIZE == 2
-#define SUFFIX w
-#define USUFFIX uw
-#define DATA_TYPE uint16_t
-#define DATA_STYPE int16_t
-#define SHIFT 1
-#elif DATA_SIZE == 1
-#define SUFFIX b
-#define USUFFIX ub
-#define DATA_TYPE uint8_t
-#define DATA_STYPE int8_t
-#define SHIFT 0
-#else
-#error unsupported data size
-#endif
-
-#if DATA_SIZE == 8
-#define RES_TYPE uint64_t
-#else
-#define RES_TYPE uint32_t
-#endif
-
-/* generic load/store macros */
-
-static inline RES_TYPE
-glue(glue(glue(cpu_ld, USUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
-                                                  target_ulong ptr,
-                                                  uintptr_t retaddr)
-{
-    return glue(glue(cpu_ld, USUFFIX), _mmuidx_ra)(env, ptr, CPU_MMU_INDEX,
-                                                   retaddr);
-}
-
-static inline RES_TYPE
-glue(glue(cpu_ld, USUFFIX), MEMSUFFIX)(CPUArchState *env, target_ulong ptr)
-{
-    return glue(glue(cpu_ld, USUFFIX), _mmuidx_ra)(env, ptr, CPU_MMU_INDEX, 0);
-}
-
-#if DATA_SIZE <= 2
-static inline int
-glue(glue(glue(cpu_lds, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
-                                                  target_ulong ptr,
-                                                  uintptr_t retaddr)
-{
-    return glue(glue(cpu_lds, SUFFIX), _mmuidx_ra)(env, ptr, CPU_MMU_INDEX,
-                                                   retaddr);
-}
-
-static inline int
-glue(glue(cpu_lds, SUFFIX), MEMSUFFIX)(CPUArchState *env, target_ulong ptr)
-{
-    return glue(glue(cpu_lds, SUFFIX), _mmuidx_ra)(env, ptr, CPU_MMU_INDEX, 0);
-}
-#endif
-
-/* generic store macro */
-
-static inline void
-glue(glue(glue(cpu_st, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
-                                                 target_ulong ptr,
-                                                 RES_TYPE v, uintptr_t retaddr)
-{
-    glue(glue(cpu_st, SUFFIX), _mmuidx_ra)(env, ptr, v, CPU_MMU_INDEX,
-                                           retaddr);
-}
-
-static inline void
-glue(glue(cpu_st, SUFFIX), MEMSUFFIX)(CPUArchState *env, target_ulong ptr,
-                                      RES_TYPE v)
-{
-    glue(glue(cpu_st, SUFFIX), _mmuidx_ra)(env, ptr, v, CPU_MMU_INDEX, 0);
-}
-
-#undef RES_TYPE
-#undef DATA_TYPE
-#undef DATA_STYPE
-#undef SUFFIX
-#undef USUFFIX
-#undef DATA_SIZE
-#undef SHIFT
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f0e4b0aee4..a991ea2964 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -35,7 +35,6 @@
 #include "qemu/atomic128.h"
 #include "translate-all.h"
 #include "trace-root.h"
-#include "qemu/plugin.h"
 #include "trace/mem.h"
 #ifdef CONFIG_PLUGIN
 #include "qemu/plugin-memory.h"
@@ -1697,6 +1696,68 @@ uint64_t cpu_ldq_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                            ? helper_le_ldq_mmu : helper_be_ldq_mmu);
 }
 
+uint32_t cpu_ldub_data_ra(CPUArchState *env, target_ulong ptr,
+                          uintptr_t retaddr)
+{
+    return cpu_ldub_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+}
+
+int cpu_ldsb_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
+{
+    return cpu_ldsb_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+}
+
+uint32_t cpu_lduw_data_ra(CPUArchState *env, target_ulong ptr,
+                          uintptr_t retaddr)
+{
+    return cpu_lduw_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+}
+
+int cpu_ldsw_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
+{
+    return cpu_ldsw_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+}
+
+uint32_t cpu_ldl_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
+{
+    return cpu_ldl_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+}
+
+uint64_t cpu_ldq_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
+{
+    return cpu_ldq_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+}
+
+uint32_t cpu_ldub_data(CPUArchState *env, target_ulong ptr)
+{
+    return cpu_ldub_data_ra(env, ptr, 0);
+}
+
+int cpu_ldsb_data(CPUArchState *env, target_ulong ptr)
+{
+    return cpu_ldsb_data_ra(env, ptr, 0);
+}
+
+uint32_t cpu_lduw_data(CPUArchState *env, target_ulong ptr)
+{
+    return cpu_lduw_data_ra(env, ptr, 0);
+}
+
+int cpu_ldsw_data(CPUArchState *env, target_ulong ptr)
+{
+    return cpu_ldsw_data_ra(env, ptr, 0);
+}
+
+uint32_t cpu_ldl_data(CPUArchState *env, target_ulong ptr)
+{
+    return cpu_ldl_data_ra(env, ptr, 0);
+}
+
+uint64_t cpu_ldq_data(CPUArchState *env, target_ulong ptr)
+{
+    return cpu_ldq_data_ra(env, ptr, 0);
+}
+
 /*
  * Store Helpers
  */
@@ -1970,6 +2031,50 @@ void cpu_stq_mmuidx_ra(CPUArchState *env, target_ulong addr, uint64_t val,
     cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_TEQ);
 }
 
+void cpu_stb_data_ra(CPUArchState *env, target_ulong ptr,
+                     uint32_t val, uintptr_t retaddr)
+{
+    cpu_stb_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
+}
+
+void cpu_stw_data_ra(CPUArchState *env, target_ulong ptr,
+                     uint32_t val, uintptr_t retaddr)
+{
+    cpu_stw_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
+}
+
+void cpu_stl_data_ra(CPUArchState *env, target_ulong ptr,
+                     uint32_t val, uintptr_t retaddr)
+{
+    cpu_stl_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
+}
+
+void cpu_stq_data_ra(CPUArchState *env, target_ulong ptr,
+                     uint64_t val, uintptr_t retaddr)
+{
+    cpu_stq_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
+}
+
+void cpu_stb_data(CPUArchState *env, target_ulong ptr, uint32_t val)
+{
+    cpu_stb_data_ra(env, ptr, val, 0);
+}
+
+void cpu_stw_data(CPUArchState *env, target_ulong ptr, uint32_t val)
+{
+    cpu_stw_data_ra(env, ptr, val, 0);
+}
+
+void cpu_stl_data(CPUArchState *env, target_ulong ptr, uint32_t val)
+{
+    cpu_stl_data_ra(env, ptr, val, 0);
+}
+
+void cpu_stq_data(CPUArchState *env, target_ulong ptr, uint64_t val)
+{
+    cpu_stq_data_ra(env, ptr, val, 0);
+}
+
 /* First set of helpers allows passing in of OI and RETADDR.  This makes
    them callable from other helpers.  */
 
-- 
2.20.1


