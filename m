Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB34A3D040D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:46:23 +0200 (CEST)
Received: from localhost ([::1]:42082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xZF-00047Y-RH
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQp-00066G-OT
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:39 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQm-0000Eg-GF
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:39 -0400
Received: by mail-pf1-x434.google.com with SMTP id u126so636409pfb.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJc0gflkXzJ2IW/hPKxX146OQW57gZ0MjkK6XwFBGFA=;
 b=Ug7Ztp9bA440Glc6sybjZ8YnNnAqPt2mr4u1eFZO8vdlcNCsjLbakpgh9NRP2U1z+p
 gIo2lc5Ne0uxoWQR6B6dcwT8hvSjTKT1r3Sz3Lc7PEITp9PJUiatjBMZL4qxscDR4YAu
 lnjiirlJBTgNPdinT29uDfolysKVe/lcwlZdzZ/pFRSgU6Hkss4tzJRVUf8U9KFFwena
 tA/2yzQIhwnALsrWJN9iV4VTLeYIT5KgfbypOudR7P7iMm47j6TNyzeZq1VkJbrH97KI
 GxJTmgd2bOJxcxO+OVHAoZ3dEbKnUjBjwXkCc66zVGffBM8dCK8Iep1ywU7U+cE1P3e+
 LtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJc0gflkXzJ2IW/hPKxX146OQW57gZ0MjkK6XwFBGFA=;
 b=XsexKv1vLO/ScKtFP7C4jm+1P+6sJXIjn+MlQ/7rl7huZRmDFU6cuIpq0E/2Rmal4X
 OVd/vA2Xo1ISEqZM09ROs1Kr42KSHRFm53mbfyFsojOe3/CVuKuu5Cxirg3S5FEhVfQB
 KSUzHQvN/5o4JxIinL5J6FUKjTa0q1F7dkEPXuJHVaLUqycGOPyJiLYK5YHT02zESOUO
 ozZhquKFj1dJim0twT7FQHC+gvT8sn1ca5W/q39n29CEPPhirdYVvqTa97gthbqdGldg
 w2tU6s0efg6RhNVVK+HqkQ2ozoAPSBi7wV1MXzM9LrCw2USGrbyx9AocEifYHJDIFlSY
 ayVg==
X-Gm-Message-State: AOAM533B45YFPwu9BhXlbuPvBjmyKxIhUYJTtEOMIMhYs+k1CYOroP38
 pdBV2gglorGmcEqiLUQX65TlhweMdcx38A==
X-Google-Smtp-Source: ABdhPJxaEjuodnQaJ4NJDk4scRiOARHmsb7SF6mlkdyYJB4bTfipL81N0Hs1D5uiUGaELs5eeSEKaw==
X-Received: by 2002:a63:ed0a:: with SMTP id d10mr32972277pgi.82.1626817055065; 
 Tue, 20 Jul 2021 14:37:35 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm24376813pff.7.2021.07.20.14.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:37:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/10] accel/tcg: Fold EXTRA_ARGS into atomic_template.h
Date: Tue, 20 Jul 2021 11:37:19 -1000
Message-Id: <20210720213723.630552-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720213723.630552-1-richard.henderson@linaro.org>
References: <20210720213723.630552-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All instances of EXTRA_ARGS are now identical.

Tested-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


