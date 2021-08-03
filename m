Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8093DE592
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:39:58 +0200 (CEST)
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmDd-0004lI-EZ
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlq0-0003sV-Nb
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:33 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpv-0002WY-Pq
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:32 -0400
Received: by mail-pl1-x629.google.com with SMTP id e5so22139516pld.6
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=axcERdMpt30gsB6tWomBQt+vX7B4iPI3nFNYze/zZ0U=;
 b=EW5AVHs++UqT8gdwg/ZuWoNYigtrGcIcfAmzuaA0Lqz6LDR47A3Iuo9y9ef+5KUvJF
 20WL88R2QnA/RwEZqfvoGZzigmfZtlUABD8Y2sy4EV7VlDuzSuvuNpZDzNBMqDtCX63w
 0e+r1u5znTrsfxOYQ+aXNbYNjduNw5lJCuMHrIr/FOvdoWTx6KsoiVJi+D/3PaGmWuRW
 WtPQE1m1mlWK+pm0YxLnyiIlLvULS35EimPxFmnuCH5g8Nf/eTdm3xM7AR5z7oZ8h3XC
 VWJt4dUzJiqfMl+kHxXtTg80bBUurU11Dz6JXXl96R5f4u+vTHz3xcl+ApyU+/d+lik8
 UqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axcERdMpt30gsB6tWomBQt+vX7B4iPI3nFNYze/zZ0U=;
 b=JikAcw6vVtqmbM9D/pMWob17Up/Hcpn0gf6tpz8LTN/iTnRu9J1owx/ZLqxxMxQzWX
 KmfEqwSoIzyFEbZB+EKnAAbioVFD2rOKkystLRPvDloz/67Yn5CpGTIk2Yj91xzxQe6C
 qQXfJ21MpHohZwVPzMLoRA2zIQ/RPscvV+PXpIWzAk8n5+8uCpSRJpXs9FS1pMUB99Zw
 SMjSBVvVTj8WWSdLmNBioUPh+yc2y7PryIrtKwbRk3CBY6DmQl4JhremGrmKnb5zf+U+
 ZKu/6AzkxbLz39dW+QuJA3kFwiZukDdkK7KBg34PubzI5LIYJLbWpMuAaLvjScxuje7L
 itlg==
X-Gm-Message-State: AOAM5333W3p/gWjLp3wlOqdLn9ooU5IgC/OXxTzSLfF/esJRmyUn9lcu
 OBG0gylpoBIjzr4ayvxONc6g06/faRSLoA==
X-Google-Smtp-Source: ABdhPJzdAB495Kk+sMdfJiXTptGVUQ2/A6NdM9BF3sslKVwuvYPbfTH1nIBVziVrq0w6Ps0gUtUsJw==
X-Received: by 2002:a17:90a:4fa5:: with SMTP id
 q34mr2351582pjh.28.1627964125928; 
 Mon, 02 Aug 2021 21:15:25 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/55] accel/tcg: Add cpu_{ld,st}*_mmu interfaces
Date: Mon,  2 Aug 2021 18:14:22 -1000
Message-Id: <20210803041443.55452-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 docs/devel/loads-stores.rst |  52 ++++-
 include/exec/cpu_ldst.h     | 245 ++++++++--------------
 accel/tcg/cputlb.c          | 392 ++++++++++++------------------------
 accel/tcg/user-exec.c       | 390 +++++++++++++++--------------------
 accel/tcg/ldst_common.c.inc | 307 ++++++++++++++++++++++++++++
 5 files changed, 722 insertions(+), 664 deletions(-)
 create mode 100644 accel/tcg/ldst_common.c.inc

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 568274baec..8f0035c821 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -68,15 +68,19 @@ Regexes for git grep
  - ``\<ldn_\([hbl]e\)?_p\>``
  - ``\<stn_\([hbl]e\)?_p\>``
 
-``cpu_{ld,st}*_mmuidx_ra``
-~~~~~~~~~~~~~~~~~~~~~~~~~~
+``cpu_{ld,st}*_mmu``
+~~~~~~~~~~~~~~~~~~~~
 
-These functions operate on a guest virtual address plus a context,
-known as a "mmu index" or ``mmuidx``, which controls how that virtual
-address is translated.  The meaning of the indexes are target specific,
-but specifying a particular index might be necessary if, for instance,
-the helper requires an "always as non-privileged" access rather that
-the default access for the current state of the guest CPU.
+These functions operate on a guest virtual address, plus a context
+known as a "mmu index" which controls how that virtual address is
+translated, plus a ``MemOp`` which contains alignment requirements
+among other things.  The ``MemOp`` and mmu index are combined into
+a single argument of type ``MemOpIdx``.
+
+The meaning of the indexes are target specific, but specifying a
+particular index might be necessary if, for instance, the helper
+requires a "always as non-privileged" access rather than the
+default access for the current state of the guest CPU.
 
 These functions may cause a guest CPU exception to be taken
 (e.g. for an alignment fault or MMU fault) which will result in
@@ -99,6 +103,35 @@ function, which is a return address into the generated code [#gpc]_.
 
 Function names follow the pattern:
 
+load: ``cpu_ld{size}{end}_mmu(env, ptr, oi, retaddr)``
+
+store: ``cpu_st{size}{end}_mmu(env, ptr, val, oi, retaddr)``
+
+``size``
+ - ``b`` : 8 bits
+ - ``w`` : 16 bits
+ - ``l`` : 32 bits
+ - ``q`` : 64 bits
+
+``end``
+ - (empty) : for target endian, or 8 bit sizes
+ - ``_be`` : big endian
+ - ``_le`` : little endian
+
+Regexes for git grep:
+ - ``\<cpu_ld[bwlq](_[bl]e)\?_mmu\>``
+ - ``\<cpu_st[bwlq](_[bl]e)\?_mmu\>``
+
+
+``cpu_{ld,st}*_mmuidx_ra``
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+These functions work like the ``cpu_{ld,st}_mmu`` functions except
+that the ``mmuidx`` parameter is not combined with a ``MemOp``,
+and therefore there is no required alignment supplied or enforced.
+
+Function names follow the pattern:
+
 load: ``cpu_ld{sign}{size}{end}_mmuidx_ra(env, ptr, mmuidx, retaddr)``
 
 store: ``cpu_st{size}{end}_mmuidx_ra(env, ptr, val, mmuidx, retaddr)``
@@ -132,7 +165,8 @@ of the guest CPU, as determined by ``cpu_mmu_index(env, false)``.
 
 These are generally the preferred way to do accesses by guest
 virtual address from helper functions, unless the access should
-be performed with a context other than the default.
+be performed with a context other than the default, or alignment
+should be enforced for the access.
 
 Function names follow the pattern:
 
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
index 3d8471810c..364d97636a 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1830,6 +1830,25 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
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
@@ -1983,6 +2002,7 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
 static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_UB);
     return load_helper(env, addr, oi, retaddr, MO_UB, false, full_ldub_mmu);
 }
 
@@ -1995,6 +2015,7 @@ tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_LEUW);
     return load_helper(env, addr, oi, retaddr, MO_LEUW, false,
                        full_le_lduw_mmu);
 }
@@ -2008,6 +2029,7 @@ tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_BEUW);
     return load_helper(env, addr, oi, retaddr, MO_BEUW, false,
                        full_be_lduw_mmu);
 }
@@ -2021,6 +2043,7 @@ tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_LEUL);
     return load_helper(env, addr, oi, retaddr, MO_LEUL, false,
                        full_le_ldul_mmu);
 }
@@ -2034,6 +2057,7 @@ tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
 static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_BEUL);
     return load_helper(env, addr, oi, retaddr, MO_BEUL, false,
                        full_be_ldul_mmu);
 }
@@ -2047,6 +2071,7 @@ tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
 uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_LEQ);
     return load_helper(env, addr, oi, retaddr, MO_LEQ, false,
                        helper_le_ldq_mmu);
 }
@@ -2054,6 +2079,7 @@ uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
 uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
+    validate_memop(oi, MO_BEQ);
     return load_helper(env, addr, oi, retaddr, MO_BEQ, false,
                        helper_be_ldq_mmu);
 }
@@ -2099,186 +2125,56 @@ tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
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
@@ -2315,6 +2211,9 @@ store_memop(void *haddr, uint64_t val, MemOp op)
     }
 }
 
+static void full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                         MemOpIdx oi, uintptr_t retaddr);
+
 static void __attribute__((noinline))
 store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
                        uintptr_t retaddr, size_t size, uintptr_t mmu_idx,
@@ -2378,13 +2277,13 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
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
@@ -2487,46 +2386,83 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
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
 
@@ -2534,137 +2470,61 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
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
index 246be4502d..46b74b5f70 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -852,300 +852,232 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
+/*
+ * Verify that we have passed the correct MemOp to the correct function.
+ *
+ * We could present one function to target code, and dispatch based on
+ * the MemOp, but so far we have worked hard to avoid an indirect function
+ * call along the memory path.
+ */
+static void validate_memop(MemOpIdx oi, MemOp expected)
 {
-    MemOpIdx oi = make_memop_idx(MO_UB, MMU_USER_IDX);
-    uint32_t ret;
+#ifdef CONFIG_DEBUG_TCG
+    MemOp have = get_memop(oi) & (MO_SIZE | MO_BSWAP);
+    assert(have == expected);
+#endif
+}
 
-    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
-    ret = ldub_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
+static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
+                            MemOpIdx oi, uintptr_t ra, MMUAccessType type)
+{
+    MemOp mop = get_memop(oi);
+    int a_bits = get_alignment_bits(mop);
+    void *ret;
+
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
@@ -1188,6 +1120,8 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
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


