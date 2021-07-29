Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D83D9AB0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:58:13 +0200 (CEST)
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uNI-0003cl-Gu
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCh-0004N7-2c
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:15 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCf-0002bP-26
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:14 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so6691404pjh.3
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Seo0E+McmsgX4omSDUL/4JZPs0iNMZy60VqUUXL+dtQ=;
 b=FDV65JRA96nWqdE1asuXhwhjd+Q0Kj2+qzLUdG5iAu40gJoOzJg9MIkcAzgdRL6mzt
 G4RWx3U4LTEYY86YAbL4QAV9oLJC3hmDQEHCZne6KFUamJX0vnpXn0N/cJVgbuUSRe/i
 8LQJLFnWGE4LDXSlo7eC/yNt6wFvZ6z50ed7mOx7PeoCsX4X48/SWN2JPxj1ze6VfOsw
 yq70LDLGuOxnSS4jVGslXvlFoZs3mC1/oFAJcJodNRu0gfEuMHxoWI75PB3BpiCUAWb6
 lyMSEzAw3talCc/bmZ/UUEc+zNTEM99+H5U6Ii5yJ/tXwndr+CpUlZiPQ4KFDFGdf7qs
 YEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Seo0E+McmsgX4omSDUL/4JZPs0iNMZy60VqUUXL+dtQ=;
 b=TqEvYVa1h9Gn00qBVo7ASmio7jNWBI6FYmaYTNDp0OpWrXC/GgaBPkl3i1mqunU8P/
 74bJLzShbBXkDQvnjUyVbkbUzcNcEWz1W6ZuJGF+ehJg0ij0plU3D7iAXaBEmsUUKV3S
 suxzQv/o5tEOlTNKbQ6Z04dmRV6y0s+lGETNryih3X8FnKmPQMl9i+PF0nDhlVckJra3
 2TmiPBoh9npXm3feR0ovdqkApQlF/5wIJzHCzN0vSAilHXZoyCtTRypIrTtO1+abkNiv
 suH5l6YVmHB/1vJgdl9ia/9Z1OiHzTuwyWKM529rpml1TgJ+n3dQkWSeXyPSM4hE0ajX
 euZg==
X-Gm-Message-State: AOAM531K2B4Vc9KFmuVkB02h6RVkyzl6lqtWruvjthByhHcYXFUjD6ix
 5lcAHOhvVoUup9mw+DIpLjrhKgwOVCRijg==
X-Google-Smtp-Source: ABdhPJy1zUJlOY98Jk/rbKjcjMkycin2Jy5kfN/+nyogXSiNhZLYZP+fIsqv5d2KNNEGhIfql+TM/w==
X-Received: by 2002:a17:902:8d82:b029:120:4377:8e0e with SMTP id
 v2-20020a1709028d82b029012043778e0emr2291677plo.32.1627519631879; 
 Wed, 28 Jul 2021 17:47:11 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 18/43] accel/tcg: Drop signness in tracing in cputlb.c
Date: Wed, 28 Jul 2021 14:46:22 -1000
Message-Id: <20210729004647.282017-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

We are already inconsistent about whether or not
MO_SIGN is set in trace_mem_get_info.  Dropping it
entirely allows some simplification.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c    | 10 +++-------
 accel/tcg/user-exec.c | 45 ++++++-------------------------------------
 2 files changed, 9 insertions(+), 46 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b1e5471f94..0a1fdbefdd 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2119,7 +2119,6 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
     meminfo = trace_mem_get_info(op, mmu_idx, false);
     trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
 
-    op &= ~MO_SIGN;
     oi = make_memop_idx(op, mmu_idx);
     ret = full_load(env, addr, oi, retaddr);
 
@@ -2137,8 +2136,7 @@ uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                        int mmu_idx, uintptr_t ra)
 {
-    return (int8_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_SB,
-                                   full_ldub_mmu);
+    return (int8_t)cpu_ldub_mmuidx_ra(env, addr, mmu_idx, ra);
 }
 
 uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
@@ -2150,8 +2148,7 @@ uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                           int mmu_idx, uintptr_t ra)
 {
-    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_BESW,
-                                    full_be_lduw_mmu);
+    return (int16_t)cpu_lduw_be_mmuidx_ra(env, addr, mmu_idx, ra);
 }
 
 uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
@@ -2175,8 +2172,7 @@ uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                           int mmu_idx, uintptr_t ra)
 {
-    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_LESW,
-                                    full_le_lduw_mmu);
+    return (int16_t)cpu_lduw_le_mmuidx_ra(env, addr, mmu_idx, ra);
 }
 
 uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index dd77e90789..f17b75e0aa 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -875,13 +875,7 @@ uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
 
 int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
 {
-    int ret;
-    uint16_t meminfo = trace_mem_get_info(MO_SB, MMU_USER_IDX, false);
-
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldsb_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
-    return ret;
+    return (int8_t)cpu_ldub_data(env, ptr);
 }
 
 uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
@@ -897,13 +891,7 @@ uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
 
 int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
 {
-    int ret;
-    uint16_t meminfo = trace_mem_get_info(MO_BESW, MMU_USER_IDX, false);
-
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldsw_be_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
-    return ret;
+    return (int16_t)cpu_lduw_be_data(env, ptr);
 }
 
 uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
@@ -941,13 +929,7 @@ uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
 
 int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
 {
-    int ret;
-    uint16_t meminfo = trace_mem_get_info(MO_LESW, MMU_USER_IDX, false);
-
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldsw_le_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
-    return ret;
+    return (int16_t)cpu_lduw_le_data(env, ptr);
 }
 
 uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
@@ -984,12 +966,7 @@ uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
 int cpu_ldsb_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 {
-    int ret;
-
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldsb_data(env, ptr);
-    clear_helper_retaddr();
-    return ret;
+    return (int8_t)cpu_ldub_data_ra(env, ptr, retaddr);
 }
 
 uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
@@ -1004,12 +981,7 @@ uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
 int cpu_ldsw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 {
-    int ret;
-
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldsw_be_data(env, ptr);
-    clear_helper_retaddr();
-    return ret;
+    return (int16_t)cpu_lduw_be_data_ra(env, ptr, retaddr);
 }
 
 uint32_t cpu_ldl_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
@@ -1044,12 +1016,7 @@ uint32_t cpu_lduw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
 int cpu_ldsw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 {
-    int ret;
-
-    set_helper_retaddr(retaddr);
-    ret = cpu_ldsw_le_data(env, ptr);
-    clear_helper_retaddr();
-    return ret;
+    return (int16_t)cpu_lduw_le_data_ra(env, ptr, retaddr);
 }
 
 uint32_t cpu_ldl_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
-- 
2.25.1


