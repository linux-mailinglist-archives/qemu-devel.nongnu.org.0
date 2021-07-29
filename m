Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA33D9AD4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:10:34 +0200 (CEST)
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uZF-0002Ce-37
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uD0-000591-8p
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCv-0002nr-VJ
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:34 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so6851086pjd.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m9nng0NkyA0wrZcKEJeVVBlszsIuNKWJJFhHzfgWZos=;
 b=s/VoOtorX5nuJMg+wVOXqGJjHZWqBZaXU2VWrO4sYxSZz9BN3THUIeVoqZWSyUDiyZ
 y6lkmUlNpxzj4chs3InvQRwJQCMa/JPbd86XsV8QOzcH2xoS+Ff6qvjUlXd9qSmTyS6d
 vIb8SYluPTsSovMjBZE2/C1ZYbhP1cIVLd+0kP4Djwl2kEnhFys4vUCze+twd5hhZM+7
 Zy4MPTG7xt3Lwp+RmM9cQUfXVdN6qc+rIt3Rs/H2fVcJkctGol8k7fUKkUNy5lnptfOn
 ehVuX/lgWSmsc1lrwiMslhcoEvuzAMtRa2CDm4mrlghks4Cr4UfoP1gkX6HFDavP+Xb8
 6TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m9nng0NkyA0wrZcKEJeVVBlszsIuNKWJJFhHzfgWZos=;
 b=GzmeLzpK38qlhK5NrCxHG+izB5pDkXWYLl8M1Ch78iBkhKVm8XHpOzB8/VzD1vcnCm
 SHZAtADomb94gGXQNN2LElQ6Gobw9ai1jqb51LoM9OKHT0o9LJVBrJPhw+Cd6aTAZmJh
 i46wH1IkSgEtWM25Bbs+KMxpv7Grr+kgnr4PhwQLQyuEYrTaVr157boEQ5dq2dsfuM7j
 wTSf0Y4J7b9ieckhAfB7Jf2r75ESlSLM5gdD0a92pEMsnanOyo7boK+LQ2NOfmQ1PcPP
 HZYnrMKhdZS2UlrtvK5ot7fY6Bgc8sEz49AzcfGS2tcEL4yHMkPGSPJQpBqnydHHpygj
 3p9g==
X-Gm-Message-State: AOAM530R5Ewq+1atZJMOJFAaK5ohF0KaUOc/Znt5d3pI/StS5DZbBXW5
 1gsNnzd6X9wdHws73F2NG5g9vseFkAf9SQ==
X-Google-Smtp-Source: ABdhPJyYyZfkctdxZSH21g7T0B2aNiV1C3Oa5T/B36TKWcqY/fAVGT1X2ywxkUz3N/bdbujOlvdhBA==
X-Received: by 2002:a17:902:d217:b029:105:e265:65c7 with SMTP id
 t23-20020a170902d217b0290105e26565c7mr2295878ply.16.1627519648338; 
 Wed, 28 Jul 2021 17:47:28 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 32/43] accel/tcg: Add cpu_{ld,st}*_mmu interfaces
Date: Wed, 28 Jul 2021 14:46:36 -1000
Message-Id: <20210729004647.282017-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

These functions are much closer to the softmmu helper
functions, in that they take the complete MemOpIdx,
and from that they may enforce required alignment.

The previous cpu_ldst.h functions did not have alignment info,
and so did not enforce it.  Retain this by adding MO_UNALN to
the MemOp that we create in calling the new functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h     | 245 ++++++++--------------
 accel/tcg/cputlb.c          | 392 ++++++++++++------------------------
 accel/tcg/user-exec.c       | 390 +++++++++++++++--------------------
 accel/tcg/ldst_common.c.inc | 307 ++++++++++++++++++++++++++++
 4 files changed, 679 insertions(+), 655 deletions(-)
 create mode 100644 accel/tcg/ldst_common.c.inc

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ce6ce82618..a4dad0772f 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -28,10 +28,12 @@
  * load:  cpu_ld{sign}{size}{end}_{mmusuffix}(env, ptr)
  *        cpu_ld{sign}{size}{end}_{mmusuffix}_ra(env, ptr, retaddr)
  *        cpu_ld{sign}{size}{end}_mmuidx_ra(env, ptr, mmu_idx, retaddr)
+ *        cpu_ld{sign}{size}{end}_mmu(env, ptr, oi, retaddr)
  *
  * store: cpu_st{size}{end}_{mmusuffix}(env, ptr, val)
  *        cpu_st{size}{end}_{mmusuffix}_ra(env, ptr, val, retaddr)
  *        cpu_st{size}{end}_mmuidx_ra(env, ptr, val, mmu_idx, retaddr)
+ *        cpu_st{size}{end}_mmu(env, ptr, val, oi, retaddr)
  *
  * sign is:
  * (empty): for 32 and 64 bit sizes
@@ -53,10 +55,15 @@
  * The "mmuidx" suffix carries an extra mmu_idx argument that specifies
  * the index to use; the "data" and "code" suffixes take the index from
  * cpu_mmu_index().
+ *
+ * The "mmu" suffix carries the full MemOpIdx, with both mmu_idx and the
+ * MemOp including alignment requirements.  The alignment will be enforced.
  */
 #ifndef CPU_LDST_H
 #define CPU_LDST_H
 
+#include "exec/memopidx.h"
+
 #if defined(CONFIG_USER_ONLY)
 /* sparc32plus has 64bit long but 32bit space address
  * this can make bad result with g2h() and h2g()
@@ -118,12 +125,10 @@ typedef target_ulong abi_ptr;
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);
 int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr);
-
 uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr);
 int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr);
 uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr);
 uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr);
-
 uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr);
 int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr);
 uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr);
@@ -131,37 +136,31 @@ uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr ptr);
 
 uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
 int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
-
 uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
 int cpu_ldsw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
 uint32_t cpu_ldl_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
 uint64_t cpu_ldq_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
-
 uint32_t cpu_lduw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
 int cpu_ldsw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
 uint32_t cpu_ldl_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
 uint64_t cpu_ldq_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
 
 void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
-
 void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
 void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
 void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val);
-
 void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
 void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
 void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val);
 
 void cpu_stb_data_ra(CPUArchState *env, abi_ptr ptr,
                      uint32_t val, uintptr_t ra);
-
 void cpu_stw_be_data_ra(CPUArchState *env, abi_ptr ptr,
                         uint32_t val, uintptr_t ra);
 void cpu_stl_be_data_ra(CPUArchState *env, abi_ptr ptr,
                         uint32_t val, uintptr_t ra);
 void cpu_stq_be_data_ra(CPUArchState *env, abi_ptr ptr,
                         uint64_t val, uintptr_t ra);
-
 void cpu_stw_le_data_ra(CPUArchState *env, abi_ptr ptr,
                         uint32_t val, uintptr_t ra);
 void cpu_stl_le_data_ra(CPUArchState *env, abi_ptr ptr,
@@ -169,6 +168,71 @@ void cpu_stl_le_data_ra(CPUArchState *env, abi_ptr ptr,
 void cpu_stq_le_data_ra(CPUArchState *env, abi_ptr ptr,
                         uint64_t val, uintptr_t ra);
 
+uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr ptr,
+                            int mmu_idx, uintptr_t ra);
+int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr ptr,
+                       int mmu_idx, uintptr_t ra);
+uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr ptr,
+                               int mmu_idx, uintptr_t ra);
+int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr ptr,
+                          int mmu_idx, uintptr_t ra);
+uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr ptr,
+                              int mmu_idx, uintptr_t ra);
+uint64_t cpu_ldq_be_mmuidx_ra(CPUArchState *env, abi_ptr ptr,
+                              int mmu_idx, uintptr_t ra);
+uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr ptr,
+                               int mmu_idx, uintptr_t ra);
+int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr ptr,
+                          int mmu_idx, uintptr_t ra);
+uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr ptr,
+                              int mmu_idx, uintptr_t ra);
+uint64_t cpu_ldq_le_mmuidx_ra(CPUArchState *env, abi_ptr ptr,
+                              int mmu_idx, uintptr_t ra);
+
+void cpu_stb_mmuidx_ra(CPUArchState *env, abi_ptr ptr, uint32_t val,
+                       int mmu_idx, uintptr_t ra);
+void cpu_stw_be_mmuidx_ra(CPUArchState *env, abi_ptr ptr, uint32_t val,
+                          int mmu_idx, uintptr_t ra);
+void cpu_stl_be_mmuidx_ra(CPUArchState *env, abi_ptr ptr, uint32_t val,
+                          int mmu_idx, uintptr_t ra);
+void cpu_stq_be_mmuidx_ra(CPUArchState *env, abi_ptr ptr, uint64_t val,
+                          int mmu_idx, uintptr_t ra);
+void cpu_stw_le_mmuidx_ra(CPUArchState *env, abi_ptr ptr, uint32_t val,
+                          int mmu_idx, uintptr_t ra);
+void cpu_stl_le_mmuidx_ra(CPUArchState *env, abi_ptr ptr, uint32_t val,
+                          int mmu_idx, uintptr_t ra);
+void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr ptr, uint64_t val,
+                          int mmu_idx, uintptr_t ra);
+
+uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr ptr, MemOpIdx oi, uintptr_t ra);
+uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr ptr,
+                        MemOpIdx oi, uintptr_t ra);
+uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr ptr,
+                        MemOpIdx oi, uintptr_t ra);
+uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr ptr,
+                        MemOpIdx oi, uintptr_t ra);
+uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr ptr,
+                        MemOpIdx oi, uintptr_t ra);
+uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr ptr,
+                        MemOpIdx oi, uintptr_t ra);
+uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr ptr,
+                        MemOpIdx oi, uintptr_t ra);
+
+void cpu_stb_mmu(CPUArchState *env, abi_ptr ptr, uint8_t val,
+                 MemOpIdx oi, uintptr_t ra);
+void cpu_stw_be_mmu(CPUArchState *env, abi_ptr ptr, uint16_t val,
+                    MemOpIdx oi, uintptr_t ra);
+void cpu_stl_be_mmu(CPUArchState *env, abi_ptr ptr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra);
+void cpu_stq_be_mmu(CPUArchState *env, abi_ptr ptr, uint64_t val,
+                    MemOpIdx oi, uintptr_t ra);
+void cpu_stw_le_mmu(CPUArchState *env, abi_ptr ptr, uint16_t val,
+                    MemOpIdx oi, uintptr_t ra);
+void cpu_stl_le_mmu(CPUArchState *env, abi_ptr ptr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra);
+void cpu_stq_le_mmu(CPUArchState *env, abi_ptr ptr, uint64_t val,
+                    MemOpIdx oi, uintptr_t ra);
+
 #if defined(CONFIG_USER_ONLY)
 
 extern __thread uintptr_t helper_retaddr;
@@ -193,119 +257,6 @@ static inline void clear_helper_retaddr(void)
     helper_retaddr = 0;
 }
 
-/*
- * Provide the same *_mmuidx_ra interface as for softmmu.
- * The mmu_idx argument is ignored.
- */
-
-static inline uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                          int mmu_idx, uintptr_t ra)
-{
-    return cpu_ldub_data_ra(env, addr, ra);
-}
-
-static inline int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                     int mmu_idx, uintptr_t ra)
-{
-    return cpu_ldsb_data_ra(env, addr, ra);
-}
-
-static inline uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                             int mmu_idx, uintptr_t ra)
-{
-    return cpu_lduw_be_data_ra(env, addr, ra);
-}
-
-static inline int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                        int mmu_idx, uintptr_t ra)
-{
-    return cpu_ldsw_be_data_ra(env, addr, ra);
-}
-
-static inline uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                            int mmu_idx, uintptr_t ra)
-{
-    return cpu_ldl_be_data_ra(env, addr, ra);
-}
-
-static inline uint64_t cpu_ldq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                            int mmu_idx, uintptr_t ra)
-{
-    return cpu_ldq_be_data_ra(env, addr, ra);
-}
-
-static inline uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                             int mmu_idx, uintptr_t ra)
-{
-    return cpu_lduw_le_data_ra(env, addr, ra);
-}
-
-static inline int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                        int mmu_idx, uintptr_t ra)
-{
-    return cpu_ldsw_le_data_ra(env, addr, ra);
-}
-
-static inline uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                            int mmu_idx, uintptr_t ra)
-{
-    return cpu_ldl_le_data_ra(env, addr, ra);
-}
-
-static inline uint64_t cpu_ldq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                            int mmu_idx, uintptr_t ra)
-{
-    return cpu_ldq_le_data_ra(env, addr, ra);
-}
-
-static inline void cpu_stb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                     uint32_t val, int mmu_idx, uintptr_t ra)
-{
-    cpu_stb_data_ra(env, addr, val, ra);
-}
-
-static inline void cpu_stw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                        uint32_t val, int mmu_idx,
-                                        uintptr_t ra)
-{
-    cpu_stw_be_data_ra(env, addr, val, ra);
-}
-
-static inline void cpu_stl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                        uint32_t val, int mmu_idx,
-                                        uintptr_t ra)
-{
-    cpu_stl_be_data_ra(env, addr, val, ra);
-}
-
-static inline void cpu_stq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                        uint64_t val, int mmu_idx,
-                                        uintptr_t ra)
-{
-    cpu_stq_be_data_ra(env, addr, val, ra);
-}
-
-static inline void cpu_stw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                        uint32_t val, int mmu_idx,
-                                        uintptr_t ra)
-{
-    cpu_stw_le_data_ra(env, addr, val, ra);
-}
-
-static inline void cpu_stl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                        uint32_t val, int mmu_idx,
-                                        uintptr_t ra)
-{
-    cpu_stl_le_data_ra(env, addr, val, ra);
-}
-
-static inline void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                        uint64_t val, int mmu_idx,
-                                        uintptr_t ra)
-{
-    cpu_stq_le_data_ra(env, addr, val, ra);
-}
-
 #else
 
 /* Needed for TCG_OVERSIZED_GUEST */
@@ -336,46 +287,6 @@ static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
     return &env_tlb(env)->f[mmu_idx].table[tlb_index(env, mmu_idx, addr)];
 }
 
-uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                            int mmu_idx, uintptr_t ra);
-int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                       int mmu_idx, uintptr_t ra);
-
-uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                               int mmu_idx, uintptr_t ra);
-int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                          int mmu_idx, uintptr_t ra);
-uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                              int mmu_idx, uintptr_t ra);
-uint64_t cpu_ldq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                              int mmu_idx, uintptr_t ra);
-
-uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                               int mmu_idx, uintptr_t ra);
-int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                          int mmu_idx, uintptr_t ra);
-uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                              int mmu_idx, uintptr_t ra);
-uint64_t cpu_ldq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                              int mmu_idx, uintptr_t ra);
-
-void cpu_stb_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
-                       int mmu_idx, uintptr_t retaddr);
-
-void cpu_stw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
-                          int mmu_idx, uintptr_t retaddr);
-void cpu_stl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
-                          int mmu_idx, uintptr_t retaddr);
-void cpu_stq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
-                          int mmu_idx, uintptr_t retaddr);
-
-void cpu_stw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
-                          int mmu_idx, uintptr_t retaddr);
-void cpu_stl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
-                          int mmu_idx, uintptr_t retaddr);
-void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
-                          int mmu_idx, uintptr_t retaddr);
-
 #endif /* defined(CONFIG_USER_ONLY) */
 
 #ifdef TARGET_WORDS_BIGENDIAN
@@ -391,6 +302,9 @@ void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
 # define cpu_ldsw_mmuidx_ra   cpu_ldsw_be_mmuidx_ra
 # define cpu_ldl_mmuidx_ra    cpu_ldl_be_mmuidx_ra
 # define cpu_ldq_mmuidx_ra    cpu_ldq_be_mmuidx_ra
+# define cpu_ldw_mmu          cpu_ldw_be_mmu
+# define cpu_ldl_mmu          cpu_ldl_be_mmu
+# define cpu_ldq_mmu          cpu_ldq_be_mmu
 # define cpu_stw_data         cpu_stw_be_data
 # define cpu_stl_data         cpu_stl_be_data
 # define cpu_stq_data         cpu_stq_be_data
@@ -400,6 +314,9 @@ void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
 # define cpu_stw_mmuidx_ra    cpu_stw_be_mmuidx_ra
 # define cpu_stl_mmuidx_ra    cpu_stl_be_mmuidx_ra
 # define cpu_stq_mmuidx_ra    cpu_stq_be_mmuidx_ra
+# define cpu_stw_mmu          cpu_stw_be_mmu
+# define cpu_stl_mmu          cpu_stl_be_mmu
+# define cpu_stq_mmu          cpu_stq_be_mmu
 #else
 # define cpu_lduw_data        cpu_lduw_le_data
 # define cpu_ldsw_data        cpu_ldsw_le_data
@@ -413,6 +330,9 @@ void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
 # define cpu_ldsw_mmuidx_ra   cpu_ldsw_le_mmuidx_ra
 # define cpu_ldl_mmuidx_ra    cpu_ldl_le_mmuidx_ra
 # define cpu_ldq_mmuidx_ra    cpu_ldq_le_mmuidx_ra
+# define cpu_ldw_mmu          cpu_ldw_le_mmu
+# define cpu_ldl_mmu          cpu_ldl_le_mmu
+# define cpu_ldq_mmu          cpu_ldq_le_mmu
 # define cpu_stw_data         cpu_stw_le_data
 # define cpu_stl_data         cpu_stl_le_data
 # define cpu_stq_data         cpu_stq_le_data
@@ -422,6 +342,9 @@ void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
 # define cpu_stw_mmuidx_ra    cpu_stw_le_mmuidx_ra
 # define cpu_stl_mmuidx_ra    cpu_stl_le_mmuidx_ra
 # define cpu_stq_mmuidx_ra    cpu_stq_le_mmuidx_ra
+# define cpu_stw_mmu          cpu_stw_le_mmu
+# define cpu_stl_mmu          cpu_stl_le_mmu
+# define cpu_stq_mmu          cpu_stq_le_mmu
 #endif
 
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 46140ccff3..b350cafa3d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1839,6 +1839,25 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     cpu_loop_exit_atomic(env_cpu(env), retaddr);
 }
 
+/*
+ * Verify that we have passed the correct MemOp to the correct function.
+ *
+ * In the case of the helper_*_mmu functions, we will have done this by
+ * using the MemOp to look up the helper during code generation.
+ *
+ * In the case of the cpu_*_mmu functions, this is up to the caller.
+ * We could present one function to target code, and dispatch based on
+ * the MemOp, but so far we have worked hard to avoid an indirect function
+ * call along the memory path.
+ */
+static void validate_memop(MemOpIdx oi, MemOp expected)
+{
+#ifdef CONFIG_DEBUG_TCG
+    MemOp have = get_memop(oi) & (MO_SIZE | MO_BSWAP);
+    assert(have == expected);
+#endif
+}
+
 /*
  * Load Helpers
  *
@@ -1992,6 +2011,7 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
 static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_UB);
     return load_helper(env, addr, oi, retaddr, MO_UB, false, full_ldub_mmu);
 }
 
@@ -2004,6 +2024,7 @@ tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_LEUW);
     return load_helper(env, addr, oi, retaddr, MO_LEUW, false,
                        full_le_lduw_mmu);
 }
@@ -2017,6 +2038,7 @@ tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_BEUW);
     return load_helper(env, addr, oi, retaddr, MO_BEUW, false,
                        full_be_lduw_mmu);
 }
@@ -2030,6 +2052,7 @@ tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_LEUL);
     return load_helper(env, addr, oi, retaddr, MO_LEUL, false,
                        full_le_ldul_mmu);
 }
@@ -2043,6 +2066,7 @@ tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_BEUL);
     return load_helper(env, addr, oi, retaddr, MO_BEUL, false,
                        full_be_ldul_mmu);
 }
@@ -2056,6 +2080,7 @@ tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
 uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_LEQ);
     return load_helper(env, addr, oi, retaddr, MO_LEQ, false,
                        helper_le_ldq_mmu);
 }
@@ -2063,6 +2088,7 @@ uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
 uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_BEQ);
     return load_helper(env, addr, oi, retaddr, MO_BEQ, false,
                        helper_be_ldq_mmu);
 }
@@ -2108,186 +2134,56 @@ tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
  */
 
 static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
-                                       int mmu_idx, uintptr_t retaddr,
-                                       MemOp op, FullLoadHelper *full_load)
+                                       MemOpIdx oi, uintptr_t retaddr,
+                                       FullLoadHelper *full_load)
 {
-    MemOpIdx oi = make_memop_idx(op, mmu_idx);
     uint64_t ret;
 
     trace_guest_ld_before_exec(env_cpu(env), addr, oi);
-
     ret = full_load(env, addr, oi, retaddr);
-
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-
     return ret;
 }
 
-uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                            int mmu_idx, uintptr_t ra)
+uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr, MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, mmu_idx, ra, MO_UB, full_ldub_mmu);
+    return cpu_load_helper(env, addr, oi, ra, full_ldub_mmu);
 }
 
-int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                       int mmu_idx, uintptr_t ra)
+uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
 {
-    return (int8_t)cpu_ldub_mmuidx_ra(env, addr, mmu_idx, ra);
+    return cpu_load_helper(env, addr, oi, ra, full_be_lduw_mmu);
 }
 
-uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                               int mmu_idx, uintptr_t ra)
+uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, mmu_idx, ra, MO_BEUW, full_be_lduw_mmu);
+    return cpu_load_helper(env, addr, oi, ra, full_be_ldul_mmu);
 }
 
-int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                          int mmu_idx, uintptr_t ra)
+uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
 {
-    return (int16_t)cpu_lduw_be_mmuidx_ra(env, addr, mmu_idx, ra);
+    return cpu_load_helper(env, addr, oi, MO_BEQ, helper_be_ldq_mmu);
 }
 
-uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                              int mmu_idx, uintptr_t ra)
+uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, mmu_idx, ra, MO_BEUL, full_be_ldul_mmu);
+    return cpu_load_helper(env, addr, oi, ra, full_le_lduw_mmu);
 }
 
-uint64_t cpu_ldq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                              int mmu_idx, uintptr_t ra)
+uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, mmu_idx, ra, MO_BEQ, helper_be_ldq_mmu);
+    return cpu_load_helper(env, addr, oi, ra, full_le_ldul_mmu);
 }
 
-uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                               int mmu_idx, uintptr_t ra)
+uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, mmu_idx, ra, MO_LEUW, full_le_lduw_mmu);
-}
-
-int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                          int mmu_idx, uintptr_t ra)
-{
-    return (int16_t)cpu_lduw_le_mmuidx_ra(env, addr, mmu_idx, ra);
-}
-
-uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                              int mmu_idx, uintptr_t ra)
-{
-    return cpu_load_helper(env, addr, mmu_idx, ra, MO_LEUL, full_le_ldul_mmu);
-}
-
-uint64_t cpu_ldq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                              int mmu_idx, uintptr_t ra)
-{
-    return cpu_load_helper(env, addr, mmu_idx, ra, MO_LEQ, helper_le_ldq_mmu);
-}
-
-uint32_t cpu_ldub_data_ra(CPUArchState *env, target_ulong ptr,
-                          uintptr_t retaddr)
-{
-    return cpu_ldub_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
-}
-
-int cpu_ldsb_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
-{
-    return cpu_ldsb_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
-}
-
-uint32_t cpu_lduw_be_data_ra(CPUArchState *env, target_ulong ptr,
-                             uintptr_t retaddr)
-{
-    return cpu_lduw_be_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
-}
-
-int cpu_ldsw_be_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
-{
-    return cpu_ldsw_be_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
-}
-
-uint32_t cpu_ldl_be_data_ra(CPUArchState *env, target_ulong ptr,
-                            uintptr_t retaddr)
-{
-    return cpu_ldl_be_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
-}
-
-uint64_t cpu_ldq_be_data_ra(CPUArchState *env, target_ulong ptr,
-                            uintptr_t retaddr)
-{
-    return cpu_ldq_be_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
-}
-
-uint32_t cpu_lduw_le_data_ra(CPUArchState *env, target_ulong ptr,
-                             uintptr_t retaddr)
-{
-    return cpu_lduw_le_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
-}
-
-int cpu_ldsw_le_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
-{
-    return cpu_ldsw_le_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
-}
-
-uint32_t cpu_ldl_le_data_ra(CPUArchState *env, target_ulong ptr,
-                            uintptr_t retaddr)
-{
-    return cpu_ldl_le_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
-}
-
-uint64_t cpu_ldq_le_data_ra(CPUArchState *env, target_ulong ptr,
-                            uintptr_t retaddr)
-{
-    return cpu_ldq_le_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
-}
-
-uint32_t cpu_ldub_data(CPUArchState *env, target_ulong ptr)
-{
-    return cpu_ldub_data_ra(env, ptr, 0);
-}
-
-int cpu_ldsb_data(CPUArchState *env, target_ulong ptr)
-{
-    return cpu_ldsb_data_ra(env, ptr, 0);
-}
-
-uint32_t cpu_lduw_be_data(CPUArchState *env, target_ulong ptr)
-{
-    return cpu_lduw_be_data_ra(env, ptr, 0);
-}
-
-int cpu_ldsw_be_data(CPUArchState *env, target_ulong ptr)
-{
-    return cpu_ldsw_be_data_ra(env, ptr, 0);
-}
-
-uint32_t cpu_ldl_be_data(CPUArchState *env, target_ulong ptr)
-{
-    return cpu_ldl_be_data_ra(env, ptr, 0);
-}
-
-uint64_t cpu_ldq_be_data(CPUArchState *env, target_ulong ptr)
-{
-    return cpu_ldq_be_data_ra(env, ptr, 0);
-}
-
-uint32_t cpu_lduw_le_data(CPUArchState *env, target_ulong ptr)
-{
-    return cpu_lduw_le_data_ra(env, ptr, 0);
-}
-
-int cpu_ldsw_le_data(CPUArchState *env, target_ulong ptr)
-{
-    return cpu_ldsw_le_data_ra(env, ptr, 0);
-}
-
-uint32_t cpu_ldl_le_data(CPUArchState *env, target_ulong ptr)
-{
-    return cpu_ldl_le_data_ra(env, ptr, 0);
-}
-
-uint64_t cpu_ldq_le_data(CPUArchState *env, target_ulong ptr)
-{
-    return cpu_ldq_le_data_ra(env, ptr, 0);
+    return cpu_load_helper(env, addr, oi, ra, helper_le_ldq_mmu);
 }
 
 /*
@@ -2324,6 +2220,9 @@ store_memop(void *haddr, uint64_t val, MemOp op)
     }
 }
 
+static void full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                         MemOpIdx oi, uintptr_t retaddr);
+
 static void __attribute__((noinline))
 store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
                        uintptr_t retaddr, size_t size, uintptr_t mmu_idx,
@@ -2387,13 +2286,13 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
         for (i = 0; i < size; ++i) {
             /* Big-endian extract.  */
             uint8_t val8 = val >> (((size - 1) * 8) - (i * 8));
-            helper_ret_stb_mmu(env, addr + i, val8, oi, retaddr);
+            full_stb_mmu(env, addr + i, val8, oi, retaddr);
         }
     } else {
         for (i = 0; i < size; ++i) {
             /* Little-endian extract.  */
             uint8_t val8 = val >> (i * 8);
-            helper_ret_stb_mmu(env, addr + i, val8, oi, retaddr);
+            full_stb_mmu(env, addr + i, val8, oi, retaddr);
         }
     }
 }
@@ -2496,46 +2395,83 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
     store_memop(haddr, val, op);
 }
 
-void __attribute__((noinline))
-helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
-                   MemOpIdx oi, uintptr_t retaddr)
+static void __attribute__((noinline))
+full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+             MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_UB);
     store_helper(env, addr, val, oi, retaddr, MO_UB);
 }
 
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+                        MemOpIdx oi, uintptr_t retaddr)
+{
+    full_stb_mmu(env, addr, val, oi, retaddr);
+}
+
+static void full_le_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                            MemOpIdx oi, uintptr_t retaddr)
+{
+    validate_memop(oi, MO_LEUW);
+    store_helper(env, addr, val, oi, retaddr, MO_LEUW);
+}
+
 void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_LEUW);
+    full_le_stw_mmu(env, addr, val, oi, retaddr);
+}
+
+static void full_be_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                            MemOpIdx oi, uintptr_t retaddr)
+{
+    validate_memop(oi, MO_BEUW);
+    store_helper(env, addr, val, oi, retaddr, MO_BEUW);
 }
 
 void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_BEUW);
+    full_be_stw_mmu(env, addr, val, oi, retaddr);
+}
+
+static void full_le_stl_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                            MemOpIdx oi, uintptr_t retaddr)
+{
+    validate_memop(oi, MO_LEUL);
+    store_helper(env, addr, val, oi, retaddr, MO_LEUL);
 }
 
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_LEUL);
+    full_le_stl_mmu(env, addr, val, oi, retaddr);
+}
+
+static void full_be_stl_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                            MemOpIdx oi, uintptr_t retaddr)
+{
+    validate_memop(oi, MO_BEUL);
+    store_helper(env, addr, val, oi, retaddr, MO_BEUL);
 }
 
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_BEUL);
+    full_be_stl_mmu(env, addr, val, oi, retaddr);
 }
 
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_LEQ);
     store_helper(env, addr, val, oi, retaddr, MO_LEQ);
 }
 
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_BEQ);
     store_helper(env, addr, val, oi, retaddr, MO_BEQ);
 }
 
@@ -2543,137 +2479,61 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
  * Store Helpers for cpu_ldst.h
  */
 
-static inline void QEMU_ALWAYS_INLINE
-cpu_store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
-                 int mmu_idx, uintptr_t retaddr, MemOp op)
+typedef void FullStoreHelper(CPUArchState *env, target_ulong addr,
+                             uint64_t val, MemOpIdx oi, uintptr_t retaddr);
+
+static inline void cpu_store_helper(CPUArchState *env, target_ulong addr,
+                                    uint64_t val, MemOpIdx oi, uintptr_t ra,
+                                    FullStoreHelper *full_store)
 {
-    MemOpIdx oi = make_memop_idx(op, mmu_idx);
-
     trace_guest_st_before_exec(env_cpu(env), addr, oi);
-
-    store_helper(env, addr, val, oi, retaddr, op);
-
+    full_store(env, addr, val, oi, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
-void cpu_stb_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
-                       int mmu_idx, uintptr_t retaddr)
+void cpu_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+                 MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_UB);
+    cpu_store_helper(env, addr, val, oi, retaddr, full_stb_mmu);
 }
 
-void cpu_stw_be_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
-                          int mmu_idx, uintptr_t retaddr)
+void cpu_stw_be_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_BEUW);
+    cpu_store_helper(env, addr, val, oi, retaddr, full_be_stw_mmu);
 }
 
-void cpu_stl_be_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
-                          int mmu_idx, uintptr_t retaddr)
+void cpu_stl_be_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_BEUL);
+    cpu_store_helper(env, addr, val, oi, retaddr, full_be_stl_mmu);
 }
 
-void cpu_stq_be_mmuidx_ra(CPUArchState *env, target_ulong addr, uint64_t val,
-                          int mmu_idx, uintptr_t retaddr)
+void cpu_stq_be_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_BEQ);
+    cpu_store_helper(env, addr, val, oi, retaddr, helper_be_stq_mmu);
 }
 
-void cpu_stw_le_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
-                          int mmu_idx, uintptr_t retaddr)
+void cpu_stw_le_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_LEUW);
+    cpu_store_helper(env, addr, val, oi, retaddr, full_le_stw_mmu);
 }
 
-void cpu_stl_le_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
-                          int mmu_idx, uintptr_t retaddr)
+void cpu_stl_le_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_LEUL);
+    cpu_store_helper(env, addr, val, oi, retaddr, full_le_stl_mmu);
 }
 
-void cpu_stq_le_mmuidx_ra(CPUArchState *env, target_ulong addr, uint64_t val,
-                          int mmu_idx, uintptr_t retaddr)
+void cpu_stq_le_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_LEQ);
+    cpu_store_helper(env, addr, val, oi, retaddr, helper_le_stq_mmu);
 }
 
-void cpu_stb_data_ra(CPUArchState *env, target_ulong ptr,
-                     uint32_t val, uintptr_t retaddr)
-{
-    cpu_stb_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
-}
-
-void cpu_stw_be_data_ra(CPUArchState *env, target_ulong ptr,
-                        uint32_t val, uintptr_t retaddr)
-{
-    cpu_stw_be_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
-}
-
-void cpu_stl_be_data_ra(CPUArchState *env, target_ulong ptr,
-                        uint32_t val, uintptr_t retaddr)
-{
-    cpu_stl_be_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
-}
-
-void cpu_stq_be_data_ra(CPUArchState *env, target_ulong ptr,
-                        uint64_t val, uintptr_t retaddr)
-{
-    cpu_stq_be_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
-}
-
-void cpu_stw_le_data_ra(CPUArchState *env, target_ulong ptr,
-                        uint32_t val, uintptr_t retaddr)
-{
-    cpu_stw_le_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
-}
-
-void cpu_stl_le_data_ra(CPUArchState *env, target_ulong ptr,
-                        uint32_t val, uintptr_t retaddr)
-{
-    cpu_stl_le_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
-}
-
-void cpu_stq_le_data_ra(CPUArchState *env, target_ulong ptr,
-                        uint64_t val, uintptr_t retaddr)
-{
-    cpu_stq_le_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
-}
-
-void cpu_stb_data(CPUArchState *env, target_ulong ptr, uint32_t val)
-{
-    cpu_stb_data_ra(env, ptr, val, 0);
-}
-
-void cpu_stw_be_data(CPUArchState *env, target_ulong ptr, uint32_t val)
-{
-    cpu_stw_be_data_ra(env, ptr, val, 0);
-}
-
-void cpu_stl_be_data(CPUArchState *env, target_ulong ptr, uint32_t val)
-{
-    cpu_stl_be_data_ra(env, ptr, val, 0);
-}
-
-void cpu_stq_be_data(CPUArchState *env, target_ulong ptr, uint64_t val)
-{
-    cpu_stq_be_data_ra(env, ptr, val, 0);
-}
-
-void cpu_stw_le_data(CPUArchState *env, target_ulong ptr, uint32_t val)
-{
-    cpu_stw_le_data_ra(env, ptr, val, 0);
-}
-
-void cpu_stl_le_data(CPUArchState *env, target_ulong ptr, uint32_t val)
-{
-    cpu_stl_le_data_ra(env, ptr, val, 0);
-}
-
-void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
-{
-    cpu_stq_le_data_ra(env, ptr, val, 0);
-}
+#include "ldst_common.c.inc"
 
 /*
  * First set of functions passes in OI and RETADDR.
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index eda577013f..e8a82dd43f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -851,6 +851,21 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
+/*
+ * Verify that we have passed the correct MemOp to the correct function.
+ *
+ * We could present one function to target code, and dispatch based on
+ * the MemOp, but so far we have worked hard to avoid an indirect function
+ * call along the memory path.
+ */
+static void validate_memop(MemOpIdx oi, MemOp expected)
+{
+#ifdef CONFIG_DEBUG_TCG
+    MemOp have = get_memop(oi) & (MO_SIZE | MO_BSWAP);
+    assert(have == expected);
+#endif
+}
+
 static void cpu_unaligned_access(CPUState *cpu, vaddr addr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t ra)
@@ -861,300 +876,217 @@ static void cpu_unaligned_access(CPUState *cpu, vaddr addr,
     g_assert_not_reached();
 }
 
-uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
+static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
+                            MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
-    MemOpIdx oi = make_memop_idx(MO_UB, MMU_USER_IDX);
-    uint32_t ret;
+    MemOp mop = get_memop(oi);
+    int a_bits = get_alignment_bits(mop);
+    void *ret;
 
-    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
-    ret = ldub_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
+    /* Enforce guest required alignment.  */
+    if (unlikely(addr & ((1 << a_bits) - 1))) {
+        cpu_unaligned_access(env_cpu(env), addr, type, get_mmuidx(oi), ra);
+    }
+
+    ret = g2h(env_cpu(env), addr);
+    set_helper_retaddr(ra);
     return ret;
 }
 
-int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
+uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
+                    MemOpIdx oi, uintptr_t ra)
 {
-    return (int8_t)cpu_ldub_data(env, ptr);
-}
+    void *haddr;
+    uint8_t ret;
 
-uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
-{
-    MemOpIdx oi = make_memop_idx(MO_BEUW, MMU_USER_IDX);
-    uint32_t ret;
-
-    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
-    ret = lduw_be_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
+    validate_memop(oi, MO_UB);
+    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    ret = ldub_p(haddr);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
-int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
+uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
 {
-    return (int16_t)cpu_lduw_be_data(env, ptr);
-}
+    void *haddr;
+    uint16_t ret;
 
-uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
-{
-    MemOpIdx oi = make_memop_idx(MO_BEUL, MMU_USER_IDX);
-    uint32_t ret;
-
-    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
-    ret = ldl_be_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
+    validate_memop(oi, MO_BEUW);
+    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    ret = lduw_be_p(haddr);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
-uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
+uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
 {
-    MemOpIdx oi = make_memop_idx(MO_BEQ, MMU_USER_IDX);
+    void *haddr;
+    uint32_t ret;
+
+    validate_memop(oi, MO_BEUL);
+    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    ret = ldl_be_p(haddr);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return ret;
+}
+
+uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
     uint64_t ret;
 
-    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
-    ret = ldq_be_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
+    validate_memop(oi, MO_BEQ);
+    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    ret = ldq_be_p(haddr);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
-uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
+uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
 {
-    MemOpIdx oi = make_memop_idx(MO_LEUW, MMU_USER_IDX);
+    void *haddr;
+    uint16_t ret;
+
+    validate_memop(oi, MO_LEUW);
+    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    ret = lduw_le_p(haddr);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return ret;
+}
+
+uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
     uint32_t ret;
 
-    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
-    ret = lduw_le_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
+    validate_memop(oi, MO_LEUL);
+    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    ret = ldl_le_p(haddr);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
-int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
+uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
 {
-    return (int16_t)cpu_lduw_le_data(env, ptr);
-}
-
-uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
-{
-    MemOpIdx oi = make_memop_idx(MO_LEUL, MMU_USER_IDX);
-    uint32_t ret;
-
-    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
-    ret = ldl_le_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
-    return ret;
-}
-
-uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr ptr)
-{
-    MemOpIdx oi = make_memop_idx(MO_LEQ, MMU_USER_IDX);
+    void *haddr;
     uint64_t ret;
 
-    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
-    ret = ldq_le_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
+    validate_memop(oi, MO_LEQ);
+    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    ret = ldq_le_p(haddr);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
-uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
+                 MemOpIdx oi, uintptr_t ra)
 {
-    uint32_t ret;
+    void *haddr;
 
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldub_data(env, ptr);
+    validate_memop(oi, MO_UB);
+    trace_guest_st_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    stb_p(haddr, val);
     clear_helper_retaddr();
-    return ret;
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
-int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+void cpu_stw_be_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
+                    MemOpIdx oi, uintptr_t ra)
 {
-    return (int8_t)cpu_ldub_data_ra(env, ptr, retaddr);
-}
+    void *haddr;
 
-uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
-{
-    uint32_t ret;
-
-    set_helper_retaddr(retaddr);
-    ret = cpu_lduw_be_data(env, ptr);
+    validate_memop(oi, MO_BEUW);
+    trace_guest_st_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    stw_be_p(haddr, val);
     clear_helper_retaddr();
-    return ret;
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
-int cpu_ldsw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
 {
-    return (int16_t)cpu_lduw_be_data_ra(env, ptr, retaddr);
-}
+    void *haddr;
 
-uint32_t cpu_ldl_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
-{
-    uint32_t ret;
-
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldl_be_data(env, ptr);
+    validate_memop(oi, MO_BEUL);
+    trace_guest_st_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    stl_be_p(haddr, val);
     clear_helper_retaddr();
-    return ret;
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
-uint64_t cpu_ldq_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t ra)
 {
-    uint64_t ret;
+    void *haddr;
 
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldq_be_data(env, ptr);
+    validate_memop(oi, MO_BEQ);
+    trace_guest_st_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    stq_be_p(haddr, val);
     clear_helper_retaddr();
-    return ret;
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
-uint32_t cpu_lduw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+void cpu_stw_le_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
+                    MemOpIdx oi, uintptr_t ra)
 {
-    uint32_t ret;
+    void *haddr;
 
-    set_helper_retaddr(retaddr);
-    ret = cpu_lduw_le_data(env, ptr);
+    validate_memop(oi, MO_LEUW);
+    trace_guest_st_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    stw_le_p(haddr, val);
     clear_helper_retaddr();
-    return ret;
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
-int cpu_ldsw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+void cpu_stl_le_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
 {
-    return (int16_t)cpu_lduw_le_data_ra(env, ptr, retaddr);
-}
+    void *haddr;
 
-uint32_t cpu_ldl_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
-{
-    uint32_t ret;
-
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldl_le_data(env, ptr);
+    validate_memop(oi, MO_LEUL);
+    trace_guest_st_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    stl_le_p(haddr, val);
     clear_helper_retaddr();
-    return ret;
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
-uint64_t cpu_ldq_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t ra)
 {
-    uint64_t ret;
+    void *haddr;
 
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldq_le_data(env, ptr);
-    clear_helper_retaddr();
-    return ret;
-}
-
-void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
-{
-    MemOpIdx oi = make_memop_idx(MO_UB, MMU_USER_IDX);
-
-    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
-    stb_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
-{
-    MemOpIdx oi = make_memop_idx(MO_BEUW, MMU_USER_IDX);
-
-    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
-    stw_be_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
-{
-    MemOpIdx oi = make_memop_idx(MO_BEUL, MMU_USER_IDX);
-
-    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
-    stl_be_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
-{
-    MemOpIdx oi = make_memop_idx(MO_BEQ, MMU_USER_IDX);
-
-    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
-    stq_be_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
-{
-    MemOpIdx oi = make_memop_idx(MO_LEUW, MMU_USER_IDX);
-
-    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
-    stw_le_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
-{
-    MemOpIdx oi = make_memop_idx(MO_LEUL, MMU_USER_IDX);
-
-    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
-    stl_le_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
-{
-    MemOpIdx oi = make_memop_idx(MO_LEQ, MMU_USER_IDX);
-
-    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
-    stq_le_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stb_data_ra(CPUArchState *env, abi_ptr ptr,
-                     uint32_t val, uintptr_t retaddr)
-{
-    set_helper_retaddr(retaddr);
-    cpu_stb_data(env, ptr, val);
-    clear_helper_retaddr();
-}
-
-void cpu_stw_be_data_ra(CPUArchState *env, abi_ptr ptr,
-                        uint32_t val, uintptr_t retaddr)
-{
-    set_helper_retaddr(retaddr);
-    cpu_stw_be_data(env, ptr, val);
-    clear_helper_retaddr();
-}
-
-void cpu_stl_be_data_ra(CPUArchState *env, abi_ptr ptr,
-                        uint32_t val, uintptr_t retaddr)
-{
-    set_helper_retaddr(retaddr);
-    cpu_stl_be_data(env, ptr, val);
-    clear_helper_retaddr();
-}
-
-void cpu_stq_be_data_ra(CPUArchState *env, abi_ptr ptr,
-                        uint64_t val, uintptr_t retaddr)
-{
-    set_helper_retaddr(retaddr);
-    cpu_stq_be_data(env, ptr, val);
-    clear_helper_retaddr();
-}
-
-void cpu_stw_le_data_ra(CPUArchState *env, abi_ptr ptr,
-                        uint32_t val, uintptr_t retaddr)
-{
-    set_helper_retaddr(retaddr);
-    cpu_stw_le_data(env, ptr, val);
-    clear_helper_retaddr();
-}
-
-void cpu_stl_le_data_ra(CPUArchState *env, abi_ptr ptr,
-                        uint32_t val, uintptr_t retaddr)
-{
-    set_helper_retaddr(retaddr);
-    cpu_stl_le_data(env, ptr, val);
-    clear_helper_retaddr();
-}
-
-void cpu_stq_le_data_ra(CPUArchState *env, abi_ptr ptr,
-                        uint64_t val, uintptr_t retaddr)
-{
-    set_helper_retaddr(retaddr);
-    cpu_stq_le_data(env, ptr, val);
+    validate_memop(oi, MO_LEQ);
+    trace_guest_st_before_exec(env_cpu(env), addr, oi);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    stq_le_p(haddr, val);
     clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr ptr)
@@ -1197,6 +1129,8 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
     return ret;
 }
 
+#include "ldst_common.c.inc"
+
 /*
  * Do not allow unaligned operations to proceed.  Return the host address.
  *
diff --git a/accel/tcg/ldst_common.c.inc b/accel/tcg/ldst_common.c.inc
new file mode 100644
index 0000000000..bfefb275e7
--- /dev/null
+++ b/accel/tcg/ldst_common.c.inc
@@ -0,0 +1,307 @@
+/*
+ * Routines common to user and system emulation of load/store.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                            int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+    return cpu_ldb_mmu(env, addr, oi, ra);
+}
+
+int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                       int mmu_idx, uintptr_t ra)
+{
+    return (int8_t)cpu_ldub_mmuidx_ra(env, addr, mmu_idx, ra);
+}
+
+uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                               int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_BEUW | MO_UNALN, mmu_idx);
+    return cpu_ldw_be_mmu(env, addr, oi, ra);
+}
+
+int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                          int mmu_idx, uintptr_t ra)
+{
+    return (int16_t)cpu_lduw_be_mmuidx_ra(env, addr, mmu_idx, ra);
+}
+
+uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_BEUL | MO_UNALN, mmu_idx);
+    return cpu_ldl_be_mmu(env, addr, oi, ra);
+}
+
+uint64_t cpu_ldq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_BEQ | MO_UNALN, mmu_idx);
+    return cpu_ldq_be_mmu(env, addr, oi, ra);
+}
+
+uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                               int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_LEUW | MO_UNALN, mmu_idx);
+    return cpu_ldw_le_mmu(env, addr, oi, ra);
+}
+
+int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                          int mmu_idx, uintptr_t ra)
+{
+    return (int16_t)cpu_lduw_le_mmuidx_ra(env, addr, mmu_idx, ra);
+}
+
+uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_LEUL | MO_UNALN, mmu_idx);
+    return cpu_ldl_le_mmu(env, addr, oi, ra);
+}
+
+uint64_t cpu_ldq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_LEQ | MO_UNALN, mmu_idx);
+    return cpu_ldq_le_mmu(env, addr, oi, ra);
+}
+
+void cpu_stb_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
+                       int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+    cpu_stb_mmu(env, addr, val, oi, ra);
+}
+
+void cpu_stw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_BEUW | MO_UNALN, mmu_idx);
+    cpu_stw_be_mmu(env, addr, val, oi, ra);
+}
+
+void cpu_stl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_BEUL | MO_UNALN, mmu_idx);
+    cpu_stl_be_mmu(env, addr, val, oi, ra);
+}
+
+void cpu_stq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
+                          int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_BEQ | MO_UNALN, mmu_idx);
+    cpu_stq_be_mmu(env, addr, val, oi, ra);
+}
+
+void cpu_stw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_LEUW | MO_UNALN, mmu_idx);
+    cpu_stw_le_mmu(env, addr, val, oi, ra);
+}
+
+void cpu_stl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_LEUL | MO_UNALN, mmu_idx);
+    cpu_stl_le_mmu(env, addr, val, oi, ra);
+}
+
+void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
+                          int mmu_idx, uintptr_t ra)
+{
+    MemOpIdx oi = make_memop_idx(MO_LEQ | MO_UNALN, mmu_idx);
+    cpu_stq_le_mmu(env, addr, val, oi, ra);
+}
+
+/*--------------------------*/
+
+uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr addr, uintptr_t ra)
+{
+    return cpu_ldub_mmuidx_ra(env, addr, cpu_mmu_index(env, false), ra);
+}
+
+int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr addr, uintptr_t ra)
+{
+    return (int8_t)cpu_ldub_data_ra(env, addr, ra);
+}
+
+uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr addr, uintptr_t ra)
+{
+    return cpu_lduw_be_mmuidx_ra(env, addr, cpu_mmu_index(env, false), ra);
+}
+
+int cpu_ldsw_be_data_ra(CPUArchState *env, abi_ptr addr, uintptr_t ra)
+{
+    return (int16_t)cpu_lduw_be_data_ra(env, addr, ra);
+}
+
+uint32_t cpu_ldl_be_data_ra(CPUArchState *env, abi_ptr addr, uintptr_t ra)
+{
+    return cpu_ldl_be_mmuidx_ra(env, addr, cpu_mmu_index(env, false), ra);
+}
+
+uint64_t cpu_ldq_be_data_ra(CPUArchState *env, abi_ptr addr, uintptr_t ra)
+{
+    return cpu_ldq_be_mmuidx_ra(env, addr, cpu_mmu_index(env, false), ra);
+}
+
+uint32_t cpu_lduw_le_data_ra(CPUArchState *env, abi_ptr addr, uintptr_t ra)
+{
+    return cpu_lduw_le_mmuidx_ra(env, addr, cpu_mmu_index(env, false), ra);
+}
+
+int cpu_ldsw_le_data_ra(CPUArchState *env, abi_ptr addr, uintptr_t ra)
+{
+    return (int16_t)cpu_lduw_le_data_ra(env, addr, ra);
+}
+
+uint32_t cpu_ldl_le_data_ra(CPUArchState *env, abi_ptr addr, uintptr_t ra)
+{
+    return cpu_ldl_le_mmuidx_ra(env, addr, cpu_mmu_index(env, false), ra);
+}
+
+uint64_t cpu_ldq_le_data_ra(CPUArchState *env, abi_ptr addr, uintptr_t ra)
+{
+    return cpu_ldq_le_mmuidx_ra(env, addr, cpu_mmu_index(env, false), ra);
+}
+
+void cpu_stb_data_ra(CPUArchState *env, abi_ptr addr,
+                     uint32_t val, uintptr_t ra)
+{
+    cpu_stb_mmuidx_ra(env, addr, val, cpu_mmu_index(env, false), ra);
+}
+
+void cpu_stw_be_data_ra(CPUArchState *env, abi_ptr addr,
+                        uint32_t val, uintptr_t ra)
+{
+    cpu_stw_be_mmuidx_ra(env, addr, val, cpu_mmu_index(env, false), ra);
+}
+
+void cpu_stl_be_data_ra(CPUArchState *env, abi_ptr addr,
+                        uint32_t val, uintptr_t ra)
+{
+    cpu_stl_be_mmuidx_ra(env, addr, val, cpu_mmu_index(env, false), ra);
+}
+
+void cpu_stq_be_data_ra(CPUArchState *env, abi_ptr addr,
+                        uint64_t val, uintptr_t ra)
+{
+    cpu_stq_be_mmuidx_ra(env, addr, val, cpu_mmu_index(env, false), ra);
+}
+
+void cpu_stw_le_data_ra(CPUArchState *env, abi_ptr addr,
+                        uint32_t val, uintptr_t ra)
+{
+    cpu_stw_le_mmuidx_ra(env, addr, val, cpu_mmu_index(env, false), ra);
+}
+
+void cpu_stl_le_data_ra(CPUArchState *env, abi_ptr addr,
+                        uint32_t val, uintptr_t ra)
+{
+    cpu_stl_le_mmuidx_ra(env, addr, val, cpu_mmu_index(env, false), ra);
+}
+
+void cpu_stq_le_data_ra(CPUArchState *env, abi_ptr addr,
+                        uint64_t val, uintptr_t ra)
+{
+    cpu_stq_le_mmuidx_ra(env, addr, val, cpu_mmu_index(env, false), ra);
+}
+
+/*--------------------------*/
+
+uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr addr)
+{
+    return cpu_ldub_data_ra(env, addr, 0);
+}
+
+int cpu_ldsb_data(CPUArchState *env, abi_ptr addr)
+{
+    return (int8_t)cpu_ldub_data(env, addr);
+}
+
+uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr addr)
+{
+    return cpu_lduw_be_data_ra(env, addr, 0);
+}
+
+int cpu_ldsw_be_data(CPUArchState *env, abi_ptr addr)
+{
+    return (int16_t)cpu_lduw_be_data(env, addr);
+}
+
+uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr addr)
+{
+    return cpu_ldl_be_data_ra(env, addr, 0);
+}
+
+uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr addr)
+{
+    return cpu_ldq_be_data_ra(env, addr, 0);
+}
+
+uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr addr)
+{
+    return cpu_lduw_le_data_ra(env, addr, 0);
+}
+
+int cpu_ldsw_le_data(CPUArchState *env, abi_ptr addr)
+{
+    return (int16_t)cpu_lduw_le_data(env, addr);
+}
+
+uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr addr)
+{
+    return cpu_ldl_le_data_ra(env, addr, 0);
+}
+
+uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr addr)
+{
+    return cpu_ldq_le_data_ra(env, addr, 0);
+}
+
+void cpu_stb_data(CPUArchState *env, abi_ptr addr, uint32_t val)
+{
+    cpu_stb_data_ra(env, addr, val, 0);
+}
+
+void cpu_stw_be_data(CPUArchState *env, abi_ptr addr, uint32_t val)
+{
+    cpu_stw_be_data_ra(env, addr, val, 0);
+}
+
+void cpu_stl_be_data(CPUArchState *env, abi_ptr addr, uint32_t val)
+{
+    cpu_stl_be_data_ra(env, addr, val, 0);
+}
+
+void cpu_stq_be_data(CPUArchState *env, abi_ptr addr, uint64_t val)
+{
+    cpu_stq_be_data_ra(env, addr, val, 0);
+}
+
+void cpu_stw_le_data(CPUArchState *env, abi_ptr addr, uint32_t val)
+{
+    cpu_stw_le_data_ra(env, addr, val, 0);
+}
+
+void cpu_stl_le_data(CPUArchState *env, abi_ptr addr, uint32_t val)
+{
+    cpu_stl_le_data_ra(env, addr, val, 0);
+}
+
+void cpu_stq_le_data(CPUArchState *env, abi_ptr addr, uint64_t val)
+{
+    cpu_stq_le_data_ra(env, addr, val, 0);
+}
-- 
2.25.1


