Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F187F1CDB70
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 15:39:21 +0200 (CEST)
Received: from localhost ([::1]:33260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY8eP-0003AI-0O
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 09:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY8Zg-00021v-7Q
 for qemu-devel@nongnu.org; Mon, 11 May 2020 09:34:28 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY8Zd-00073V-53
 for qemu-devel@nongnu.org; Mon, 11 May 2020 09:34:27 -0400
Received: by mail-wr1-x442.google.com with SMTP id v12so10954339wrp.12
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 06:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FGIKmLFTsCSzN5n3W7CRoIoEp+sSwNANUEX54ED2qOo=;
 b=dSuuyfHtzalPMkpgi4qqg3kBtRwi7rZeopj7sJf+UylUSALs+e+UEt3ZWtvMmit9e4
 ee5y4jMElk5J3kGWa6dYalIbVE8lzmfW/o0lqmMhf6G0i4iIKzMSWmEZfm49ZkeUBWS+
 ROso4BePJF4y8T9a3bMe9EmpX5mplXJB4wmmof/48NeLAIE2hPol3zDdobzhbNOimCXs
 qT29j8UtKrADonLlW59WRijbBk0sp5NAs7ad08zlK416C4FKwYuAoO+yVwAO0lyjM6ij
 OWnYFDV+1ufzPPICKPYc/cGCQv3EUhc4yQ+vBbCgfemQDNpImk5bdgC/IkXfoXXu966I
 vPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGIKmLFTsCSzN5n3W7CRoIoEp+sSwNANUEX54ED2qOo=;
 b=r8rvenjwK3F99XmFDv90hVntJzIQxOJt4u64lYbFrlOQRfpNCDko53q7UWwjMVesk1
 arvuNwBTZZUSQ/WtOU8nonXHTO1Hbbl6zeWZQT4U/UfDebc0oUp1P0HTA8LqAtc4EUIw
 O9KEUpuzvllvLthyg7uLqOmF6oRRk0DqbHAmPCrDNx2yEwPLaW+kl7ZdvZVERYQV1PXq
 Atrdbe4hwHpaPllRBZ4vY73TZBmS1DZKxitMRo86VG9TkEqLMMQF0DzfNfcqqJfaqnUg
 /N1FrWwjnnA6KDck3Ya01tzdYItsJB01DdZmVtXVmNGJ5urPpFJOlo5zb9mgxnDcpx6B
 oeOw==
X-Gm-Message-State: AGi0PuYaqs/GfeoT51TNRqfA6FII0ofWQvNToUyf78JpTfl++f1wRo9V
 0lUBknbPPKA0/7W8u90zybzl0Dica0/M/A==
X-Google-Smtp-Source: APiQypLi0aUHE25g509ZCpdBmpmJvjjep7KSIPlzXjCXRDuxQWe0dhTP1Bp/wCWE1R7g1Rm2hQWdFA==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr7909267wrp.427.1589204062619; 
 Mon, 11 May 2020 06:34:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m3sm2154818wrn.96.2020.05.11.06.34.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 06:34:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/34] accel/tcg: Add endian-specific cpu_{ld, st}* operations
Date: Mon, 11 May 2020 14:33:44 +0100
Message-Id: <20200511133405.5275-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511133405.5275-1-peter.maydell@linaro.org>
References: <20200511133405.5275-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

From: Richard Henderson <richard.henderson@linaro.org>

We currently have target-endian versions of these operations,
but no easy way to force a specific endianness.  This can be
helpful if the target has endian-specific operations, or a mode
that swaps endianness.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200508154359.7494-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/loads-stores.rst |  39 +++--
 include/exec/cpu_ldst.h     | 283 +++++++++++++++++++++++++++---------
 accel/tcg/cputlb.c          | 236 ++++++++++++++++++++++--------
 accel/tcg/user-exec.c       | 211 ++++++++++++++++++++++-----
 4 files changed, 587 insertions(+), 182 deletions(-)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 0d99eb24c1b..9a944ef1af6 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -97,9 +97,9 @@ function, which is a return address into the generated code.
 
 Function names follow the pattern:
 
-load: ``cpu_ld{sign}{size}_mmuidx_ra(env, ptr, mmuidx, retaddr)``
+load: ``cpu_ld{sign}{size}{end}_mmuidx_ra(env, ptr, mmuidx, retaddr)``
 
-store: ``cpu_st{size}_mmuidx_ra(env, ptr, val, mmuidx, retaddr)``
+store: ``cpu_st{size}{end}_mmuidx_ra(env, ptr, val, mmuidx, retaddr)``
 
 ``sign``
  - (empty) : for 32 or 64 bit sizes
@@ -112,9 +112,14 @@ store: ``cpu_st{size}_mmuidx_ra(env, ptr, val, mmuidx, retaddr)``
  - ``l`` : 32 bits
  - ``q`` : 64 bits
 
+``end``
+ - (empty) : for target endian, or 8 bit sizes
+ - ``_be`` : big endian
+ - ``_le`` : little endian
+
 Regexes for git grep:
- - ``\<cpu_ld[us]\?[bwlq]_mmuidx_ra\>``
- - ``\<cpu_st[bwlq]_mmuidx_ra\>``
+ - ``\<cpu_ld[us]\?[bwlq](_[bl]e)\?_mmuidx_ra\>``
+ - ``\<cpu_st[bwlq](_[bl]e)\?_mmuidx_ra\>``
 
 ``cpu_{ld,st}*_data_ra``
 ~~~~~~~~~~~~~~~~~~~~~~~~
@@ -129,9 +134,9 @@ be performed with a context other than the default.
 
 Function names follow the pattern:
 
-load: ``cpu_ld{sign}{size}_data_ra(env, ptr, ra)``
+load: ``cpu_ld{sign}{size}{end}_data_ra(env, ptr, ra)``
 
-store: ``cpu_st{size}_data_ra(env, ptr, val, ra)``
+store: ``cpu_st{size}{end}_data_ra(env, ptr, val, ra)``
 
 ``sign``
  - (empty) : for 32 or 64 bit sizes
@@ -144,9 +149,14 @@ store: ``cpu_st{size}_data_ra(env, ptr, val, ra)``
  - ``l`` : 32 bits
  - ``q`` : 64 bits
 
+``end``
+ - (empty) : for target endian, or 8 bit sizes
+ - ``_be`` : big endian
+ - ``_le`` : little endian
+
 Regexes for git grep:
- - ``\<cpu_ld[us]\?[bwlq]_data_ra\>``
- - ``\<cpu_st[bwlq]_data_ra\>``
+ - ``\<cpu_ld[us]\?[bwlq](_[bl]e)\?_data_ra\>``
+ - ``\<cpu_st[bwlq](_[bl]e)\?_data_ra\>``
 
 ``cpu_{ld,st}*_data``
 ~~~~~~~~~~~~~~~~~~~~~
@@ -163,9 +173,9 @@ the CPU state anyway.
 
 Function names follow the pattern:
 
-load: ``cpu_ld{sign}{size}_data(env, ptr)``
+load: ``cpu_ld{sign}{size}{end}_data(env, ptr)``
 
-store: ``cpu_st{size}_data(env, ptr, val)``
+store: ``cpu_st{size}{end}_data(env, ptr, val)``
 
 ``sign``
  - (empty) : for 32 or 64 bit sizes
@@ -178,9 +188,14 @@ store: ``cpu_st{size}_data(env, ptr, val)``
  - ``l`` : 32 bits
  - ``q`` : 64 bits
 
+``end``
+ - (empty) : for target endian, or 8 bit sizes
+ - ``_be`` : big endian
+ - ``_le`` : little endian
+
 Regexes for git grep
- - ``\<cpu_ld[us]\?[bwlq]_data\>``
- - ``\<cpu_st[bwlq]_data\+\>``
+ - ``\<cpu_ld[us]\?[bwlq](_[bl]e)\?_data\>``
+ - ``\<cpu_st[bwlq](_[bl]e)\?_data\+\>``
 
 ``cpu_ld*_code``
 ~~~~~~~~~~~~~~~~
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 53de19753ab..c14a48f65e2 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -25,13 +25,13 @@
  *
  * The syntax for the accessors is:
  *
- * load:  cpu_ld{sign}{size}_{mmusuffix}(env, ptr)
- *        cpu_ld{sign}{size}_{mmusuffix}_ra(env, ptr, retaddr)
- *        cpu_ld{sign}{size}_mmuidx_ra(env, ptr, mmu_idx, retaddr)
+ * load:  cpu_ld{sign}{size}{end}_{mmusuffix}(env, ptr)
+ *        cpu_ld{sign}{size}{end}_{mmusuffix}_ra(env, ptr, retaddr)
+ *        cpu_ld{sign}{size}{end}_mmuidx_ra(env, ptr, mmu_idx, retaddr)
  *
- * store: cpu_st{size}_{mmusuffix}(env, ptr, val)
- *        cpu_st{size}_{mmusuffix}_ra(env, ptr, val, retaddr)
- *        cpu_st{size}_mmuidx_ra(env, ptr, val, mmu_idx, retaddr)
+ * store: cpu_st{size}{end}_{mmusuffix}(env, ptr, val)
+ *        cpu_st{size}{end}_{mmusuffix}_ra(env, ptr, val, retaddr)
+ *        cpu_st{size}{end}_mmuidx_ra(env, ptr, val, mmu_idx, retaddr)
  *
  * sign is:
  * (empty): for 32 and 64 bit sizes
@@ -44,6 +44,11 @@
  *   l: 32 bits
  *   q: 64 bits
  *
+ * end is:
+ * (empty): for target native endian, or for 8 bit access
+ *     _be: for forced big endian
+ *     _le: for forced little endian
+ *
  * mmusuffix is one of the generic suffixes "data" or "code", or "mmuidx".
  * The "mmuidx" suffix carries an extra mmu_idx argument that specifies
  * the index to use; the "data" and "code" suffixes take the index from
@@ -95,32 +100,57 @@ typedef target_ulong abi_ptr;
 #endif
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);
-uint32_t cpu_lduw_data(CPUArchState *env, abi_ptr ptr);
-uint32_t cpu_ldl_data(CPUArchState *env, abi_ptr ptr);
-uint64_t cpu_ldq_data(CPUArchState *env, abi_ptr ptr);
 int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr);
-int cpu_ldsw_data(CPUArchState *env, abi_ptr ptr);
 
-uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
-uint32_t cpu_lduw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
-uint32_t cpu_ldl_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
-uint64_t cpu_ldq_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
-int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
-int cpu_ldsw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr);
+uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr);
+int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr);
+uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr);
+uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr);
+
+uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr);
+int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr);
+uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr);
+uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr ptr);
+
+uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
+int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
+
+uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
+int cpu_ldsw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
+uint32_t cpu_ldl_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
+uint64_t cpu_ldq_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
+
+uint32_t cpu_lduw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
+int cpu_ldsw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
+uint32_t cpu_ldl_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
+uint64_t cpu_ldq_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t ra);
 
 void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
-void cpu_stw_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
-void cpu_stl_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
-void cpu_stq_data(CPUArchState *env, abi_ptr ptr, uint64_t val);
+
+void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
+void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
+void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val);
+
+void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
+void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val);
+void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val);
 
 void cpu_stb_data_ra(CPUArchState *env, abi_ptr ptr,
-                     uint32_t val, uintptr_t retaddr);
-void cpu_stw_data_ra(CPUArchState *env, abi_ptr ptr,
-                     uint32_t val, uintptr_t retaddr);
-void cpu_stl_data_ra(CPUArchState *env, abi_ptr ptr,
-                     uint32_t val, uintptr_t retaddr);
-void cpu_stq_data_ra(CPUArchState *env, abi_ptr ptr,
-                     uint64_t val, uintptr_t retaddr);
+                     uint32_t val, uintptr_t ra);
+
+void cpu_stw_be_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint32_t val, uintptr_t ra);
+void cpu_stl_be_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint32_t val, uintptr_t ra);
+void cpu_stq_be_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint64_t val, uintptr_t ra);
+
+void cpu_stw_le_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint32_t val, uintptr_t ra);
+void cpu_stl_le_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint32_t val, uintptr_t ra);
+void cpu_stq_le_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint64_t val, uintptr_t ra);
 
 #if defined(CONFIG_USER_ONLY)
 
@@ -157,34 +187,58 @@ static inline uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
     return cpu_ldub_data_ra(env, addr, ra);
 }
 
-static inline uint32_t cpu_lduw_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                          int mmu_idx, uintptr_t ra)
-{
-    return cpu_lduw_data_ra(env, addr, ra);
-}
-
-static inline uint32_t cpu_ldl_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                         int mmu_idx, uintptr_t ra)
-{
-    return cpu_ldl_data_ra(env, addr, ra);
-}
-
-static inline uint64_t cpu_ldq_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                         int mmu_idx, uintptr_t ra)
-{
-    return cpu_ldq_data_ra(env, addr, ra);
-}
-
 static inline int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                                      int mmu_idx, uintptr_t ra)
 {
     return cpu_ldsb_data_ra(env, addr, ra);
 }
 
-static inline int cpu_ldsw_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                     int mmu_idx, uintptr_t ra)
+static inline uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                             int mmu_idx, uintptr_t ra)
 {
-    return cpu_ldsw_data_ra(env, addr, ra);
+    return cpu_lduw_be_data_ra(env, addr, ra);
+}
+
+static inline int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                        int mmu_idx, uintptr_t ra)
+{
+    return cpu_ldsw_be_data_ra(env, addr, ra);
+}
+
+static inline uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                            int mmu_idx, uintptr_t ra)
+{
+    return cpu_ldl_be_data_ra(env, addr, ra);
+}
+
+static inline uint64_t cpu_ldq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                            int mmu_idx, uintptr_t ra)
+{
+    return cpu_ldq_be_data_ra(env, addr, ra);
+}
+
+static inline uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                             int mmu_idx, uintptr_t ra)
+{
+    return cpu_lduw_le_data_ra(env, addr, ra);
+}
+
+static inline int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                        int mmu_idx, uintptr_t ra)
+{
+    return cpu_ldsw_le_data_ra(env, addr, ra);
+}
+
+static inline uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                            int mmu_idx, uintptr_t ra)
+{
+    return cpu_ldl_le_data_ra(env, addr, ra);
+}
+
+static inline uint64_t cpu_ldq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                            int mmu_idx, uintptr_t ra)
+{
+    return cpu_ldq_le_data_ra(env, addr, ra);
 }
 
 static inline void cpu_stb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
@@ -193,22 +247,46 @@ static inline void cpu_stb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
     cpu_stb_data_ra(env, addr, val, ra);
 }
 
-static inline void cpu_stw_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                     uint32_t val, int mmu_idx, uintptr_t ra)
+static inline void cpu_stw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                        uint32_t val, int mmu_idx,
+                                        uintptr_t ra)
 {
-    cpu_stw_data_ra(env, addr, val, ra);
+    cpu_stw_be_data_ra(env, addr, val, ra);
 }
 
-static inline void cpu_stl_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                     uint32_t val, int mmu_idx, uintptr_t ra)
+static inline void cpu_stl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                        uint32_t val, int mmu_idx,
+                                        uintptr_t ra)
 {
-    cpu_stl_data_ra(env, addr, val, ra);
+    cpu_stl_be_data_ra(env, addr, val, ra);
 }
 
-static inline void cpu_stq_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                                     uint64_t val, int mmu_idx, uintptr_t ra)
+static inline void cpu_stq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                        uint64_t val, int mmu_idx,
+                                        uintptr_t ra)
 {
-    cpu_stq_data_ra(env, addr, val, ra);
+    cpu_stq_be_data_ra(env, addr, val, ra);
+}
+
+static inline void cpu_stw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                        uint32_t val, int mmu_idx,
+                                        uintptr_t ra)
+{
+    cpu_stw_le_data_ra(env, addr, val, ra);
+}
+
+static inline void cpu_stl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                        uint32_t val, int mmu_idx,
+                                        uintptr_t ra)
+{
+    cpu_stl_le_data_ra(env, addr, val, ra);
+}
+
+static inline void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                                        uint64_t val, int mmu_idx,
+                                        uintptr_t ra)
+{
+    cpu_stq_le_data_ra(env, addr, val, ra);
 }
 
 #else
@@ -243,29 +321,92 @@ static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
 
 uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                             int mmu_idx, uintptr_t ra);
-uint32_t cpu_lduw_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                            int mmu_idx, uintptr_t ra);
-uint32_t cpu_ldl_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                           int mmu_idx, uintptr_t ra);
-uint64_t cpu_ldq_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                           int mmu_idx, uintptr_t ra);
-
 int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                        int mmu_idx, uintptr_t ra);
-int cpu_ldsw_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                       int mmu_idx, uintptr_t ra);
+
+uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                               int mmu_idx, uintptr_t ra);
+int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                          int mmu_idx, uintptr_t ra);
+uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra);
+uint64_t cpu_ldq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra);
+
+uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                               int mmu_idx, uintptr_t ra);
+int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                          int mmu_idx, uintptr_t ra);
+uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra);
+uint64_t cpu_ldq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra);
 
 void cpu_stb_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
                        int mmu_idx, uintptr_t retaddr);
-void cpu_stw_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
-                       int mmu_idx, uintptr_t retaddr);
-void cpu_stl_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
-                       int mmu_idx, uintptr_t retaddr);
-void cpu_stq_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
-                       int mmu_idx, uintptr_t retaddr);
+
+void cpu_stw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          int mmu_idx, uintptr_t retaddr);
+void cpu_stl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          int mmu_idx, uintptr_t retaddr);
+void cpu_stq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
+                          int mmu_idx, uintptr_t retaddr);
+
+void cpu_stw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          int mmu_idx, uintptr_t retaddr);
+void cpu_stl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          int mmu_idx, uintptr_t retaddr);
+void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr, uint64_t val,
+                          int mmu_idx, uintptr_t retaddr);
 
 #endif /* defined(CONFIG_USER_ONLY) */
 
+#ifdef TARGET_WORDS_BIGENDIAN
+# define cpu_lduw_data        cpu_lduw_be_data
+# define cpu_ldsw_data        cpu_ldsw_be_data
+# define cpu_ldl_data         cpu_ldl_be_data
+# define cpu_ldq_data         cpu_ldq_be_data
+# define cpu_lduw_data_ra     cpu_lduw_be_data_ra
+# define cpu_ldsw_data_ra     cpu_ldsw_be_data_ra
+# define cpu_ldl_data_ra      cpu_ldl_be_data_ra
+# define cpu_ldq_data_ra      cpu_ldq_be_data_ra
+# define cpu_lduw_mmuidx_ra   cpu_lduw_be_mmuidx_ra
+# define cpu_ldsw_mmuidx_ra   cpu_ldsw_be_mmuidx_ra
+# define cpu_ldl_mmuidx_ra    cpu_ldl_be_mmuidx_ra
+# define cpu_ldq_mmuidx_ra    cpu_ldq_be_mmuidx_ra
+# define cpu_stw_data         cpu_stw_be_data
+# define cpu_stl_data         cpu_stl_be_data
+# define cpu_stq_data         cpu_stq_be_data
+# define cpu_stw_data_ra      cpu_stw_be_data_ra
+# define cpu_stl_data_ra      cpu_stl_be_data_ra
+# define cpu_stq_data_ra      cpu_stq_be_data_ra
+# define cpu_stw_mmuidx_ra    cpu_stw_be_mmuidx_ra
+# define cpu_stl_mmuidx_ra    cpu_stl_be_mmuidx_ra
+# define cpu_stq_mmuidx_ra    cpu_stq_be_mmuidx_ra
+#else
+# define cpu_lduw_data        cpu_lduw_le_data
+# define cpu_ldsw_data        cpu_ldsw_le_data
+# define cpu_ldl_data         cpu_ldl_le_data
+# define cpu_ldq_data         cpu_ldq_le_data
+# define cpu_lduw_data_ra     cpu_lduw_le_data_ra
+# define cpu_ldsw_data_ra     cpu_ldsw_le_data_ra
+# define cpu_ldl_data_ra      cpu_ldl_le_data_ra
+# define cpu_ldq_data_ra      cpu_ldq_le_data_ra
+# define cpu_lduw_mmuidx_ra   cpu_lduw_le_mmuidx_ra
+# define cpu_ldsw_mmuidx_ra   cpu_ldsw_le_mmuidx_ra
+# define cpu_ldl_mmuidx_ra    cpu_ldl_le_mmuidx_ra
+# define cpu_ldq_mmuidx_ra    cpu_ldq_le_mmuidx_ra
+# define cpu_stw_data         cpu_stw_le_data
+# define cpu_stl_data         cpu_stl_le_data
+# define cpu_stq_data         cpu_stq_le_data
+# define cpu_stw_data_ra      cpu_stw_le_data_ra
+# define cpu_stl_data_ra      cpu_stl_le_data_ra
+# define cpu_stq_data_ra      cpu_stq_le_data_ra
+# define cpu_stw_mmuidx_ra    cpu_stw_le_mmuidx_ra
+# define cpu_stl_mmuidx_ra    cpu_stl_le_mmuidx_ra
+# define cpu_stq_mmuidx_ra    cpu_stq_le_mmuidx_ra
+#endif
+
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index c708e9785f7..eb2cf9de5e6 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1772,36 +1772,54 @@ int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                                    full_ldub_mmu);
 }
 
-uint32_t cpu_lduw_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                            int mmu_idx, uintptr_t ra)
+uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                               int mmu_idx, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, mmu_idx, ra, MO_TEUW,
-                           MO_TE == MO_LE
-                           ? full_le_lduw_mmu : full_be_lduw_mmu);
+    return cpu_load_helper(env, addr, mmu_idx, ra, MO_BEUW, full_be_lduw_mmu);
 }
 
-int cpu_ldsw_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                       int mmu_idx, uintptr_t ra)
+int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                          int mmu_idx, uintptr_t ra)
 {
-    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_TESW,
-                                    MO_TE == MO_LE
-                                    ? full_le_lduw_mmu : full_be_lduw_mmu);
+    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_BESW,
+                                    full_be_lduw_mmu);
 }
 
-uint32_t cpu_ldl_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                           int mmu_idx, uintptr_t ra)
+uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, mmu_idx, ra, MO_TEUL,
-                           MO_TE == MO_LE
-                           ? full_le_ldul_mmu : full_be_ldul_mmu);
+    return cpu_load_helper(env, addr, mmu_idx, ra, MO_BEUL, full_be_ldul_mmu);
 }
 
-uint64_t cpu_ldq_mmuidx_ra(CPUArchState *env, abi_ptr addr,
-                           int mmu_idx, uintptr_t ra)
+uint64_t cpu_ldq_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, mmu_idx, ra, MO_TEQ,
-                           MO_TE == MO_LE
-                           ? helper_le_ldq_mmu : helper_be_ldq_mmu);
+    return cpu_load_helper(env, addr, mmu_idx, ra, MO_BEQ, helper_be_ldq_mmu);
+}
+
+uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                               int mmu_idx, uintptr_t ra)
+{
+    return cpu_load_helper(env, addr, mmu_idx, ra, MO_LEUW, full_le_lduw_mmu);
+}
+
+int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                          int mmu_idx, uintptr_t ra)
+{
+    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_LESW,
+                                    full_le_lduw_mmu);
+}
+
+uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra)
+{
+    return cpu_load_helper(env, addr, mmu_idx, ra, MO_LEUL, full_le_ldul_mmu);
+}
+
+uint64_t cpu_ldq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
+                              int mmu_idx, uintptr_t ra)
+{
+    return cpu_load_helper(env, addr, mmu_idx, ra, MO_LEQ, helper_le_ldq_mmu);
 }
 
 uint32_t cpu_ldub_data_ra(CPUArchState *env, target_ulong ptr,
@@ -1815,25 +1833,50 @@ int cpu_ldsb_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
     return cpu_ldsb_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
 }
 
-uint32_t cpu_lduw_data_ra(CPUArchState *env, target_ulong ptr,
-                          uintptr_t retaddr)
+uint32_t cpu_lduw_be_data_ra(CPUArchState *env, target_ulong ptr,
+                             uintptr_t retaddr)
 {
-    return cpu_lduw_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+    return cpu_lduw_be_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
 }
 
-int cpu_ldsw_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
+int cpu_ldsw_be_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
 {
-    return cpu_ldsw_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+    return cpu_ldsw_be_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
 }
 
-uint32_t cpu_ldl_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
+uint32_t cpu_ldl_be_data_ra(CPUArchState *env, target_ulong ptr,
+                            uintptr_t retaddr)
 {
-    return cpu_ldl_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+    return cpu_ldl_be_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
 }
 
-uint64_t cpu_ldq_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
+uint64_t cpu_ldq_be_data_ra(CPUArchState *env, target_ulong ptr,
+                            uintptr_t retaddr)
 {
-    return cpu_ldq_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+    return cpu_ldq_be_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+}
+
+uint32_t cpu_lduw_le_data_ra(CPUArchState *env, target_ulong ptr,
+                             uintptr_t retaddr)
+{
+    return cpu_lduw_le_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+}
+
+int cpu_ldsw_le_data_ra(CPUArchState *env, target_ulong ptr, uintptr_t retaddr)
+{
+    return cpu_ldsw_le_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+}
+
+uint32_t cpu_ldl_le_data_ra(CPUArchState *env, target_ulong ptr,
+                            uintptr_t retaddr)
+{
+    return cpu_ldl_le_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
+}
+
+uint64_t cpu_ldq_le_data_ra(CPUArchState *env, target_ulong ptr,
+                            uintptr_t retaddr)
+{
+    return cpu_ldq_le_mmuidx_ra(env, ptr, cpu_mmu_index(env, false), retaddr);
 }
 
 uint32_t cpu_ldub_data(CPUArchState *env, target_ulong ptr)
@@ -1846,24 +1889,44 @@ int cpu_ldsb_data(CPUArchState *env, target_ulong ptr)
     return cpu_ldsb_data_ra(env, ptr, 0);
 }
 
-uint32_t cpu_lduw_data(CPUArchState *env, target_ulong ptr)
+uint32_t cpu_lduw_be_data(CPUArchState *env, target_ulong ptr)
 {
-    return cpu_lduw_data_ra(env, ptr, 0);
+    return cpu_lduw_be_data_ra(env, ptr, 0);
 }
 
-int cpu_ldsw_data(CPUArchState *env, target_ulong ptr)
+int cpu_ldsw_be_data(CPUArchState *env, target_ulong ptr)
 {
-    return cpu_ldsw_data_ra(env, ptr, 0);
+    return cpu_ldsw_be_data_ra(env, ptr, 0);
 }
 
-uint32_t cpu_ldl_data(CPUArchState *env, target_ulong ptr)
+uint32_t cpu_ldl_be_data(CPUArchState *env, target_ulong ptr)
 {
-    return cpu_ldl_data_ra(env, ptr, 0);
+    return cpu_ldl_be_data_ra(env, ptr, 0);
 }
 
-uint64_t cpu_ldq_data(CPUArchState *env, target_ulong ptr)
+uint64_t cpu_ldq_be_data(CPUArchState *env, target_ulong ptr)
 {
-    return cpu_ldq_data_ra(env, ptr, 0);
+    return cpu_ldq_be_data_ra(env, ptr, 0);
+}
+
+uint32_t cpu_lduw_le_data(CPUArchState *env, target_ulong ptr)
+{
+    return cpu_lduw_le_data_ra(env, ptr, 0);
+}
+
+int cpu_ldsw_le_data(CPUArchState *env, target_ulong ptr)
+{
+    return cpu_ldsw_le_data_ra(env, ptr, 0);
+}
+
+uint32_t cpu_ldl_le_data(CPUArchState *env, target_ulong ptr)
+{
+    return cpu_ldl_le_data_ra(env, ptr, 0);
+}
+
+uint64_t cpu_ldq_le_data(CPUArchState *env, target_ulong ptr)
+{
+    return cpu_ldq_le_data_ra(env, ptr, 0);
 }
 
 /*
@@ -2121,22 +2184,40 @@ void cpu_stb_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
     cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_UB);
 }
 
-void cpu_stw_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
-                       int mmu_idx, uintptr_t retaddr)
+void cpu_stw_be_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
+                          int mmu_idx, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_TEUW);
+    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_BEUW);
 }
 
-void cpu_stl_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
-                       int mmu_idx, uintptr_t retaddr)
+void cpu_stl_be_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
+                          int mmu_idx, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_TEUL);
+    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_BEUL);
 }
 
-void cpu_stq_mmuidx_ra(CPUArchState *env, target_ulong addr, uint64_t val,
-                       int mmu_idx, uintptr_t retaddr)
+void cpu_stq_be_mmuidx_ra(CPUArchState *env, target_ulong addr, uint64_t val,
+                          int mmu_idx, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_TEQ);
+    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_BEQ);
+}
+
+void cpu_stw_le_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
+                          int mmu_idx, uintptr_t retaddr)
+{
+    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_LEUW);
+}
+
+void cpu_stl_le_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
+                          int mmu_idx, uintptr_t retaddr)
+{
+    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_LEUL);
+}
+
+void cpu_stq_le_mmuidx_ra(CPUArchState *env, target_ulong addr, uint64_t val,
+                          int mmu_idx, uintptr_t retaddr)
+{
+    cpu_store_helper(env, addr, val, mmu_idx, retaddr, MO_LEQ);
 }
 
 void cpu_stb_data_ra(CPUArchState *env, target_ulong ptr,
@@ -2145,22 +2226,40 @@ void cpu_stb_data_ra(CPUArchState *env, target_ulong ptr,
     cpu_stb_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
 }
 
-void cpu_stw_data_ra(CPUArchState *env, target_ulong ptr,
-                     uint32_t val, uintptr_t retaddr)
+void cpu_stw_be_data_ra(CPUArchState *env, target_ulong ptr,
+                        uint32_t val, uintptr_t retaddr)
 {
-    cpu_stw_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
+    cpu_stw_be_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
 }
 
-void cpu_stl_data_ra(CPUArchState *env, target_ulong ptr,
-                     uint32_t val, uintptr_t retaddr)
+void cpu_stl_be_data_ra(CPUArchState *env, target_ulong ptr,
+                        uint32_t val, uintptr_t retaddr)
 {
-    cpu_stl_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
+    cpu_stl_be_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
 }
 
-void cpu_stq_data_ra(CPUArchState *env, target_ulong ptr,
-                     uint64_t val, uintptr_t retaddr)
+void cpu_stq_be_data_ra(CPUArchState *env, target_ulong ptr,
+                        uint64_t val, uintptr_t retaddr)
 {
-    cpu_stq_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
+    cpu_stq_be_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
+}
+
+void cpu_stw_le_data_ra(CPUArchState *env, target_ulong ptr,
+                        uint32_t val, uintptr_t retaddr)
+{
+    cpu_stw_le_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
+}
+
+void cpu_stl_le_data_ra(CPUArchState *env, target_ulong ptr,
+                        uint32_t val, uintptr_t retaddr)
+{
+    cpu_stl_le_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
+}
+
+void cpu_stq_le_data_ra(CPUArchState *env, target_ulong ptr,
+                        uint64_t val, uintptr_t retaddr)
+{
+    cpu_stq_le_mmuidx_ra(env, ptr, val, cpu_mmu_index(env, false), retaddr);
 }
 
 void cpu_stb_data(CPUArchState *env, target_ulong ptr, uint32_t val)
@@ -2168,19 +2267,34 @@ void cpu_stb_data(CPUArchState *env, target_ulong ptr, uint32_t val)
     cpu_stb_data_ra(env, ptr, val, 0);
 }
 
-void cpu_stw_data(CPUArchState *env, target_ulong ptr, uint32_t val)
+void cpu_stw_be_data(CPUArchState *env, target_ulong ptr, uint32_t val)
 {
-    cpu_stw_data_ra(env, ptr, val, 0);
+    cpu_stw_be_data_ra(env, ptr, val, 0);
 }
 
-void cpu_stl_data(CPUArchState *env, target_ulong ptr, uint32_t val)
+void cpu_stl_be_data(CPUArchState *env, target_ulong ptr, uint32_t val)
 {
-    cpu_stl_data_ra(env, ptr, val, 0);
+    cpu_stl_be_data_ra(env, ptr, val, 0);
 }
 
-void cpu_stq_data(CPUArchState *env, target_ulong ptr, uint64_t val)
+void cpu_stq_be_data(CPUArchState *env, target_ulong ptr, uint64_t val)
 {
-    cpu_stq_data_ra(env, ptr, val, 0);
+    cpu_stq_be_data_ra(env, ptr, val, 0);
+}
+
+void cpu_stw_le_data(CPUArchState *env, target_ulong ptr, uint32_t val)
+{
+    cpu_stw_le_data_ra(env, ptr, val, 0);
+}
+
+void cpu_stl_le_data(CPUArchState *env, target_ulong ptr, uint32_t val)
+{
+    cpu_stl_le_data_ra(env, ptr, val, 0);
+}
+
+void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
+{
+    cpu_stq_le_data_ra(env, ptr, val, 0);
 }
 
 /* First set of helpers allows passing in of OI and RETADDR.  This makes
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 987342c50c9..52359949df5 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -783,46 +783,90 @@ int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
     return ret;
 }
 
-uint32_t cpu_lduw_data(CPUArchState *env, abi_ptr ptr)
+uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
 {
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_TEUW, MMU_USER_IDX, false);
+    uint16_t meminfo = trace_mem_get_info(MO_BEUW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = lduw_p(g2h(ptr));
+    ret = lduw_be_p(g2h(ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
 
-int cpu_ldsw_data(CPUArchState *env, abi_ptr ptr)
+int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
 {
     int ret;
-    uint16_t meminfo = trace_mem_get_info(MO_TESW, MMU_USER_IDX, false);
+    uint16_t meminfo = trace_mem_get_info(MO_BESW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldsw_p(g2h(ptr));
+    ret = ldsw_be_p(g2h(ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
 
-uint32_t cpu_ldl_data(CPUArchState *env, abi_ptr ptr)
+uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
 {
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_TEUL, MMU_USER_IDX, false);
+    uint16_t meminfo = trace_mem_get_info(MO_BEUL, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldl_p(g2h(ptr));
+    ret = ldl_be_p(g2h(ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
 
-uint64_t cpu_ldq_data(CPUArchState *env, abi_ptr ptr)
+uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
 {
     uint64_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_TEQ, MMU_USER_IDX, false);
+    uint16_t meminfo = trace_mem_get_info(MO_BEQ, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldq_p(g2h(ptr));
+    ret = ldq_be_p(g2h(ptr));
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    return ret;
+}
+
+uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
+{
+    uint32_t ret;
+    uint16_t meminfo = trace_mem_get_info(MO_LEUW, MMU_USER_IDX, false);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    ret = lduw_le_p(g2h(ptr));
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    return ret;
+}
+
+int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
+{
+    int ret;
+    uint16_t meminfo = trace_mem_get_info(MO_LESW, MMU_USER_IDX, false);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    ret = ldsw_le_p(g2h(ptr));
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    return ret;
+}
+
+uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
+{
+    uint32_t ret;
+    uint16_t meminfo = trace_mem_get_info(MO_LEUL, MMU_USER_IDX, false);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    ret = ldl_le_p(g2h(ptr));
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    return ret;
+}
+
+uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr ptr)
+{
+    uint64_t ret;
+    uint16_t meminfo = trace_mem_get_info(MO_LEQ, MMU_USER_IDX, false);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    ret = ldq_le_p(g2h(ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -847,42 +891,82 @@ int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
     return ret;
 }
 
-uint32_t cpu_lduw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 {
     uint32_t ret;
 
     set_helper_retaddr(retaddr);
-    ret = cpu_lduw_data(env, ptr);
+    ret = cpu_lduw_be_data(env, ptr);
     clear_helper_retaddr();
     return ret;
 }
 
-int cpu_ldsw_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+int cpu_ldsw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 {
     int ret;
 
     set_helper_retaddr(retaddr);
-    ret = cpu_ldsw_data(env, ptr);
+    ret = cpu_ldsw_be_data(env, ptr);
     clear_helper_retaddr();
     return ret;
 }
 
-uint32_t cpu_ldl_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+uint32_t cpu_ldl_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 {
     uint32_t ret;
 
     set_helper_retaddr(retaddr);
-    ret = cpu_ldl_data(env, ptr);
+    ret = cpu_ldl_be_data(env, ptr);
     clear_helper_retaddr();
     return ret;
 }
 
-uint64_t cpu_ldq_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+uint64_t cpu_ldq_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 {
     uint64_t ret;
 
     set_helper_retaddr(retaddr);
-    ret = cpu_ldq_data(env, ptr);
+    ret = cpu_ldq_be_data(env, ptr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint32_t cpu_lduw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+{
+    uint32_t ret;
+
+    set_helper_retaddr(retaddr);
+    ret = cpu_lduw_le_data(env, ptr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+int cpu_ldsw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+{
+    int ret;
+
+    set_helper_retaddr(retaddr);
+    ret = cpu_ldsw_le_data(env, ptr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint32_t cpu_ldl_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+{
+    uint32_t ret;
+
+    set_helper_retaddr(retaddr);
+    ret = cpu_ldl_le_data(env, ptr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint64_t cpu_ldq_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
+{
+    uint64_t ret;
+
+    set_helper_retaddr(retaddr);
+    ret = cpu_ldq_le_data(env, ptr);
     clear_helper_retaddr();
     return ret;
 }
@@ -896,30 +980,57 @@ void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
-void cpu_stw_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
+void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_TEUW, MMU_USER_IDX, true);
+    uint16_t meminfo = trace_mem_get_info(MO_BEUW, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    stw_p(g2h(ptr), val);
+    stw_be_p(g2h(ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
-void cpu_stl_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
+void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_TEUL, MMU_USER_IDX, true);
+    uint16_t meminfo = trace_mem_get_info(MO_BEUL, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    stl_p(g2h(ptr), val);
+    stl_be_p(g2h(ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
-void cpu_stq_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
+void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_TEQ, MMU_USER_IDX, true);
+    uint16_t meminfo = trace_mem_get_info(MO_BEQ, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    stq_p(g2h(ptr), val);
+    stq_be_p(g2h(ptr), val);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+}
+
+void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
+{
+    uint16_t meminfo = trace_mem_get_info(MO_LEUW, MMU_USER_IDX, true);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    stw_le_p(g2h(ptr), val);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+}
+
+void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
+{
+    uint16_t meminfo = trace_mem_get_info(MO_LEUL, MMU_USER_IDX, true);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    stl_le_p(g2h(ptr), val);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+}
+
+void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
+{
+    uint16_t meminfo = trace_mem_get_info(MO_LEQ, MMU_USER_IDX, true);
+
+    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    stq_le_p(g2h(ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
@@ -931,27 +1042,51 @@ void cpu_stb_data_ra(CPUArchState *env, abi_ptr ptr,
     clear_helper_retaddr();
 }
 
-void cpu_stw_data_ra(CPUArchState *env, abi_ptr ptr,
-                     uint32_t val, uintptr_t retaddr)
+void cpu_stw_be_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint32_t val, uintptr_t retaddr)
 {
     set_helper_retaddr(retaddr);
-    cpu_stw_data(env, ptr, val);
+    cpu_stw_be_data(env, ptr, val);
     clear_helper_retaddr();
 }
 
-void cpu_stl_data_ra(CPUArchState *env, abi_ptr ptr,
-                     uint32_t val, uintptr_t retaddr)
+void cpu_stl_be_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint32_t val, uintptr_t retaddr)
 {
     set_helper_retaddr(retaddr);
-    cpu_stl_data(env, ptr, val);
+    cpu_stl_be_data(env, ptr, val);
     clear_helper_retaddr();
 }
 
-void cpu_stq_data_ra(CPUArchState *env, abi_ptr ptr,
-                     uint64_t val, uintptr_t retaddr)
+void cpu_stq_be_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint64_t val, uintptr_t retaddr)
 {
     set_helper_retaddr(retaddr);
-    cpu_stq_data(env, ptr, val);
+    cpu_stq_be_data(env, ptr, val);
+    clear_helper_retaddr();
+}
+
+void cpu_stw_le_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint32_t val, uintptr_t retaddr)
+{
+    set_helper_retaddr(retaddr);
+    cpu_stw_le_data(env, ptr, val);
+    clear_helper_retaddr();
+}
+
+void cpu_stl_le_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint32_t val, uintptr_t retaddr)
+{
+    set_helper_retaddr(retaddr);
+    cpu_stl_le_data(env, ptr, val);
+    clear_helper_retaddr();
+}
+
+void cpu_stq_le_data_ra(CPUArchState *env, abi_ptr ptr,
+                        uint64_t val, uintptr_t retaddr)
+{
+    set_helper_retaddr(retaddr);
+    cpu_stq_le_data(env, ptr, val);
     clear_helper_retaddr();
 }
 
-- 
2.20.1


