Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA1D4241E5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:54:42 +0200 (CEST)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9Fh-0000Ks-8M
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8in-0002S4-GD
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:41 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iS-0007d7-0s
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:32 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g2so2654034pfc.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Vng/DC/+XlWmqKHqL4mm5hlOnhfbQPPiclHE0IjIcQ=;
 b=NBWfOc4ri7/Dprpf05gsR8q5tlJyxBbmb8BHPF9PUKArjDaAabqrTKd6nRZ/ate03I
 /2qpHN55ZXND8I6iFHA5JRHNnkiCXTx3PxBNofJRvzf6FEdSdpKdx9pRO/J32xgFPEmq
 HM099Gg+Vl4UNmkUcxTHAHTIziFHOCdT1fBOGypd+e6ZO6jraz/ShH6qyph8v8MJ0Q8E
 +why1gFk6dBn4SHpjCLf9J6vMRaS/9r7qVaHHppA3sV2xzpnfvX05QB37d6EVtKtPFLc
 8XmJym9Ku3j+hUGzuqYRRuVWRq1tFulSnsTYppQvDvQ4eZG0C1io9rNlOhM1ElxOprv5
 xP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Vng/DC/+XlWmqKHqL4mm5hlOnhfbQPPiclHE0IjIcQ=;
 b=1P5PWkXjBRgO12OK4l9Z+RxJRPH3PFxUfyVcL/wn2JiGysmOyktdMgYnmlWvoXoIYu
 VvgO8/n8wWUCUws1jeXCtOHSSMf1qhs0wTucnXfLSK71H/f6b6VhKR/ZhhOZ3z6FCF4m
 J/FU7LZ+A6C7XF/ON8TcwgVpwwkKFryH5zos7PinT3Ov7oq+Kgye9sdadQy7su57Uvzu
 eV6GQBzJbMgBunmeVXa7sjcb5oJ+sWNLw9Qtd/1MGBqsyOOHTmOx4xIMF0cWhotOn6qW
 e1hUF57hJxWA9ima30RhztjyLe/m48v3bcLJLQWAcp+yrjgq2e3hfFnLgvbFOto1lqDf
 E7pQ==
X-Gm-Message-State: AOAM531Q2iGA35Sfsrg7uuF0EpGgi2C4GbEkucwJVg1nfmhKX/Re/jFR
 yaCOeF9O6pwIVPN5VYvdW6+I4LyxhVmojg==
X-Google-Smtp-Source: ABdhPJxpsrBz2awXE4ZeJJOktPcclNm5pyzGpAFdNP6NPiwcM5MhDSYYwenbcQqlBdpOCSa2n/doTA==
X-Received: by 2002:a62:5bc1:0:b0:44c:7905:777e with SMTP id
 p184-20020a625bc1000000b0044c7905777emr11257200pfb.0.1633533617881; 
 Wed, 06 Oct 2021 08:20:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/28] accel/tcg: Drop signness in tracing in cputlb.c
Date: Wed,  6 Oct 2021 08:19:50 -0700
Message-Id: <20211006152014.741026-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We are already inconsistent about whether or not
MO_SIGN is set in trace_mem_get_info.  Dropping it
entirely allows some simplification.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 8fed542622..8f2644f26e 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -899,13 +899,7 @@ uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
 
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
@@ -921,13 +915,7 @@ uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
 
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
@@ -965,13 +953,7 @@ uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
 
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
@@ -1008,12 +990,7 @@ uint32_t cpu_ldub_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
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
@@ -1028,12 +1005,7 @@ uint32_t cpu_lduw_be_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
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
@@ -1068,12 +1040,7 @@ uint32_t cpu_lduw_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
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


