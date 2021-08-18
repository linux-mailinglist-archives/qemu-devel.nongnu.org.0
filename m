Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7C3F0BDE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:35:41 +0200 (CEST)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRLg-0007OX-PR
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6Q-0000ly-0G
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:54 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6O-0000BG-BI
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:53 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 17so3298559pgp.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/O4FSLSdKM7O2eyneH+m4/fnuUnJtcbpf/wN+KzJWic=;
 b=G6masbPykoO//qiRo0Ym1AQi4Z7m/PjInnGBAVZka5g6qWQ+pkG05SfEYHur/llF/2
 Y5V2MaO7FTxEosAja0Kxpm+TQg2pnXHGdR0seJYgU1ZPIp/nw6XDgLDjcip6T7aX9mdO
 BP/atwY3Xu9uFQDBcVH05EJmC/gsMjtELMtA8r5WeBRkQRILgYFSCUC5xxYFsI00MMEm
 dfs8UdXDBYYkMpkeeg5xzpjrvw9YbGW0QPpGtvQrA/AO0H+a78ekam5Vt9RbSKSBBkTd
 UbNeuoLGgstTFmgngZ0zQ76rrfW8ckTUN+nTfnRHKFCT1FLq5gkEdX4SXxVSOlvSTXIo
 8YSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/O4FSLSdKM7O2eyneH+m4/fnuUnJtcbpf/wN+KzJWic=;
 b=AMbxwnIp4ALRaejXKgICfwA5U8F0kqZsAIpnEWxRmNojYxyj9rZ1G4ij9m/ecNifLX
 LyMNXPJg0AYFgEsSe60WLU+qmxuFZT4tyPEPgExdc8vkaCCJIrbhs2eEgzoCIFNs7aQn
 1/mKTC9kWwAsY4gj7bbVtLsOYnV/oGft193Li4P2VtQEfq4Kl0MuwpVVmeLubKywBTxH
 /8evjdP5+WMkvMTlgyl/l4sE3PJWgT4A97K94fexV0lCRwHrpo4A7BsRkTsBuy/C6bJL
 uZp9V9tu9XSUR9bJ/t08XXctNAgW1jO7GySCHKSH/2LmdHs7WtyP0YlwBRH5EPzZ2ZBS
 HVzw==
X-Gm-Message-State: AOAM532vFEmA0aVeO6doT0Zj8L4qo+lsUo9nnoaswKZq4R3VsnHQtRvl
 k17mWJDQ7Cbh7n+zzuP3dw+drvFag5XPlA==
X-Google-Smtp-Source: ABdhPJwXooKbFzN5tOG66GXTCWPAUqUgj7OWjl/zoh/TFpMXtLAXz1Oue05mq4yQpmeyy5CZ8PwsRg==
X-Received: by 2002:aa7:9056:0:b0:3e3:332:c8b7 with SMTP id
 n22-20020aa79056000000b003e30332c8b7mr2851165pfo.69.1629314389789; 
 Wed, 18 Aug 2021 12:19:49 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/66] accel/tcg: Drop signness in tracing in cputlb.c
Date: Wed, 18 Aug 2021 09:18:36 -1000
Message-Id: <20210818191920.390759-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
index 116b289907..acdd20b1bc 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2110,7 +2110,6 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
     meminfo = trace_mem_get_info(op, mmu_idx, false);
     trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
 
-    op &= ~MO_SIGN;
     oi = make_memop_idx(op, mmu_idx);
     ret = full_load(env, addr, oi, retaddr);
 
@@ -2128,8 +2127,7 @@ uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                        int mmu_idx, uintptr_t ra)
 {
-    return (int8_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_SB,
-                                   full_ldub_mmu);
+    return (int8_t)cpu_ldub_mmuidx_ra(env, addr, mmu_idx, ra);
 }
 
 uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
@@ -2141,8 +2139,7 @@ uint32_t cpu_lduw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 int cpu_ldsw_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                           int mmu_idx, uintptr_t ra)
 {
-    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_BESW,
-                                    full_be_lduw_mmu);
+    return (int16_t)cpu_lduw_be_mmuidx_ra(env, addr, mmu_idx, ra);
 }
 
 uint32_t cpu_ldl_be_mmuidx_ra(CPUArchState *env, abi_ptr addr,
@@ -2166,8 +2163,7 @@ uint32_t cpu_lduw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 int cpu_ldsw_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                           int mmu_idx, uintptr_t ra)
 {
-    return (int16_t)cpu_load_helper(env, addr, mmu_idx, ra, MO_LESW,
-                                    full_le_lduw_mmu);
+    return (int16_t)cpu_lduw_le_mmuidx_ra(env, addr, mmu_idx, ra);
 }
 
 uint32_t cpu_ldl_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 5ad808a25a..e687b9652e 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -866,13 +866,7 @@ uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
 
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
@@ -888,13 +882,7 @@ uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
 
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
@@ -932,13 +920,7 @@ uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
 
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
@@ -975,12 +957,7 @@ uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
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
@@ -995,12 +972,7 @@ uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
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
@@ -1035,12 +1007,7 @@ uint32_t cpu_lduw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
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


