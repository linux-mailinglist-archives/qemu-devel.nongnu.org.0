Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B1733E127
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:09:37 +0100 (CET)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHse-0007hl-6b
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHqs-0005l1-ID
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:46 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:42394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHqq-0002dC-FV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:46 -0400
Received: by mail-qk1-x72a.google.com with SMTP id n24so6793217qkh.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MNghjrViS6cE79RQ44HsI/7snhIGTmTSZYfbhec9QPE=;
 b=Z64y44Hm0sBP41ACkPBnZCKdlSXkts6GgXwmOvkrXMqg2Y9JIUdTcJ40sZ7LVwREeI
 AaBMObq9qx8jbx0/j5OThwrxQMv077BPiWFuOjnbqIYipRfXz/x0dGyEwRJLF7jYWYuH
 8MX30EPz5whaMZRt+AmqZJkuqLUshnoT6o2h24FZM5ej5b5/zLJYFVh7N193U73qe+bv
 Z6QgqzV6ByuCsTYwBDdR0+65nkOTkdBLoeiAn1Q/utj3D/HX1SqCeorl/E4yHKe9QK13
 +60GUUSezmgwgOHuiLTnHJ/y07HhpUCRiFE7jfLf6Yb7d0YmdVSDApdPQGlOMfbwRIkB
 lrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MNghjrViS6cE79RQ44HsI/7snhIGTmTSZYfbhec9QPE=;
 b=magti66Fceggbl/7VJtAm4Kf3JjllTGJTJVRZgoictKu+4EprCVnllM0JTaufoT6xQ
 r501el5C3JRGuhSocKgQNVpM/UrDYGqn0R2vUvgcyifyIWtj3wlqSwByRdnH+Wjv+NiP
 SQ1BfTwZqWHA7GcoZCvaref61pumLW/J6RFtZ+9KbePX7gohMJrHya+sNhveUgoj+3T3
 Z5Tb1veCoBfsNIPB/AT1fcKe/myElUCiCsTOvnQVTYnAS2nso5X+Oqitm6TXc34MZRWi
 Wnlflcoc8lYJrrzXK+i/Eo/jtP1fCYHlSzqCFE8jRtJLGBXNdKYvWdDD3PDq3QJ8ECGC
 GIjw==
X-Gm-Message-State: AOAM530Ak73eazk9CKURUGGTnwXShvoxIEAYgnE/jvXQyWIrqi9kYDs8
 RDdRDmlFWvPnwkjloqqoh1kFDkgHfpgACDE+
X-Google-Smtp-Source: ABdhPJx3bbqnD/o48AlSAmoBEdZ2w9/Zhn5JHgI+e2u8LLKENecs/1ENLUeEhI7ra1CVtYNXCZP5Uw==
X-Received: by 2002:a37:5b84:: with SMTP id p126mr1398555qkb.142.1615932463341; 
 Tue, 16 Mar 2021 15:07:43 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n77sm16546918qkn.128.2021.03.16.15.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 15:07:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] tcg: Add host memory barriers to cpu_ldst.h interfaces
Date: Tue, 16 Mar 2021 16:07:35 -0600
Message-Id: <20210316220735.2048137-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316220735.2048137-1-richard.henderson@linaro.org>
References: <20210316220735.2048137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bring the majority of helpers into line with the rest of
tcg in respecting guest memory ordering.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h |  7 +++++++
 accel/tcg/cputlb.c      |  2 ++
 accel/tcg/user-exec.c   | 17 +++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ce6ce82618..f0ab79fe3c 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -169,6 +169,13 @@ void cpu_stl_le_data_ra(CPUArchState *env, abi_ptr ptr,
 void cpu_stq_le_data_ra(CPUArchState *env, abi_ptr ptr,
                         uint64_t val, uintptr_t ra);
 
+#define cpu_req_mo(type)          \
+    do {                          \
+        if (tcg_req_mo(type)) {   \
+            smp_mb();             \
+        }                         \
+    } while (0)
+
 #if defined(CONFIG_USER_ONLY)
 
 extern __thread uintptr_t helper_retaddr;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8a7b779270..a3503eaa71 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2100,6 +2100,7 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
     meminfo = trace_mem_get_info(op, mmu_idx, false);
     trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
 
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     op &= ~MO_SIGN;
     oi = make_memop_idx(op, mmu_idx);
     ret = full_load(env, addr, oi, retaddr);
@@ -2542,6 +2543,7 @@ cpu_store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
     meminfo = trace_mem_get_info(op, mmu_idx, true);
     trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
 
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     oi = make_memop_idx(op, mmu_idx);
     store_helper(env, addr, val, oi, retaddr, op);
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 0d8cc27b21..34f6dfcef4 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -843,6 +843,7 @@ uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_UB, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldub_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
@@ -854,6 +855,7 @@ int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_SB, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldsb_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
@@ -865,6 +867,7 @@ uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_BEUW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = lduw_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
@@ -876,6 +879,7 @@ int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_BESW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldsw_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
@@ -887,6 +891,7 @@ uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_BEUL, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldl_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
@@ -898,6 +903,7 @@ uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_BEQ, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldq_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
@@ -909,6 +915,7 @@ uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_LEUW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = lduw_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
@@ -920,6 +927,7 @@ int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_LESW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldsw_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
@@ -931,6 +939,7 @@ uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_LEUL, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldl_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
@@ -942,6 +951,7 @@ uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_LEQ, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldq_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
@@ -1052,6 +1062,7 @@ void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     uint16_t meminfo = trace_mem_get_info(MO_UB, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stb_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
@@ -1061,6 +1072,7 @@ void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     uint16_t meminfo = trace_mem_get_info(MO_BEUW, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stw_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
@@ -1070,6 +1082,7 @@ void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     uint16_t meminfo = trace_mem_get_info(MO_BEUL, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stl_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
@@ -1079,6 +1092,7 @@ void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
     uint16_t meminfo = trace_mem_get_info(MO_BEQ, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stq_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
@@ -1088,6 +1102,7 @@ void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     uint16_t meminfo = trace_mem_get_info(MO_LEUW, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stw_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
@@ -1097,6 +1112,7 @@ void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     uint16_t meminfo = trace_mem_get_info(MO_LEUL, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stl_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
@@ -1106,6 +1122,7 @@ void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
     uint16_t meminfo = trace_mem_get_info(MO_LEQ, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stq_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
-- 
2.25.1


