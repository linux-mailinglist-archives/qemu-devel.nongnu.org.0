Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA46AB476
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 02:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ06N-0004CJ-9l; Sun, 05 Mar 2023 20:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06I-00048D-1h
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:21 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06G-0003Ii-5R
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:17 -0500
Received: by mail-pl1-x62b.google.com with SMTP id a2so8667484plm.4
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 17:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678067835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qW4Tcwf/FnMqp0denRrnXohqRV8qgaCk0t1OXd3WVbQ=;
 b=iYGWw6yXCufZfeCOBeYwd9kbcw2pZQRSn6PMw6lVQKXKjfiwDAeRJSW6U3PO7t9ymn
 dlJC5oq6bxXpA6HUFgeQbUfZdSoJPhbpO1G3RdRdLXsJKQDE2I0JQnoG7V6wtfQw7CVl
 CfybsVyWYq27JXpHeMidpjV+8Z9/m1RgCNWyYSdjqr2/H1iSjNynimHodIh/GAr2HTCz
 hrNW+Atb/KMvKcud1hlLnzcNxqfWzhnZWOX20tyUSeWyqZPNw780pXl1PS0uzDVN1lC/
 wQyfuL8/AyYFbkec2y96sjzRSwKT7nP6MEi/PvXfntS54eaGOkpdnHYDFxhcujT8DD87
 wGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678067835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qW4Tcwf/FnMqp0denRrnXohqRV8qgaCk0t1OXd3WVbQ=;
 b=TAPyvdXxZ/gqId8bTqwLr09a8XmDD2W9gwsBQIc7Gv4RbmO2PprmEhLFf9eOVKVOnd
 Lq2N99FK0DTvPqKWAQ2CGfcv9qvRhwMksnf5zbZbM9ff9lojBxEXJUYFSggeAJzru/sB
 /Qg5y5dF/rwBqXH7ZN3AqMmIl4a70lI4N26PFIazq2EtyyThV+KP2IR3Pu/Wt53Yi1GB
 CW8OdvGB8Y/uhyDw00piaLyrVkJv8mnXFcHn6SMFu+cI/bR4aIV1vKLZWVzxQZOUtL31
 2QSxOpSxJkia+JO+MSHC5bSJEhBo+29/k5n4LK6E84SwI2zlHHVd2xL+ewM55uK2j/Fh
 9FbQ==
X-Gm-Message-State: AO0yUKVg0WUfD5OtTDVrfFvlRJnHPwZl6/5j5fXwXmz/EUADSESVCp/7
 TOqV9h7PUVG91gyOW5Bp59oX5q+17W6gljSeCqnY1Q==
X-Google-Smtp-Source: AK7set/AKCGAnimzx2aaH9XI+hz/DvkVpjolgp4+OF9Wi7+bPt7MqHrGDgGRaiaPZOhfHBGfQMBjnQ==
X-Received: by 2002:a05:6a20:6909:b0:cc:ca9:4fde with SMTP id
 q9-20020a056a20690900b000cc0ca94fdemr16216531pzj.33.1678067834897; 
 Sun, 05 Mar 2023 17:57:14 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 g23-20020aa78197000000b0061949fe3beasm2921056pfi.22.2023.03.05.17.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 17:57:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 4/5] tcg: Add host memory barriers to cpu_ldst.h interfaces
Date: Sun,  5 Mar 2023 17:57:09 -0800
Message-Id: <20230306015710.1868853-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306015710.1868853-1-richard.henderson@linaro.org>
References: <20230306015710.1868853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Bring the majority of helpers into line with the rest of
tcg in respecting guest memory ordering.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h     | 14 ++++++++++++++
 accel/tcg/cputlb.c    |  2 ++
 accel/tcg/user-exec.c | 14 ++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index b76b597878..0edda5f89f 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1191,6 +1191,20 @@ static inline size_t tcg_current_code_size(TCGContext *s)
 # define tcg_req_mo(type) ((type) & ~TCG_TARGET_DEFAULT_MO)
 #endif
 
+/**
+ * tcg_req_mo:
+ * @type: TCGBar
+ *
+ * If tcg_req_mo indicates a barrier for @type is required for the
+ * guest memory model, issue a host memory barrier.
+ */
+#define cpu_req_mo(type)          \
+    do {                          \
+        if (tcg_req_mo(type)) {   \
+            smp_mb();             \
+        }                         \
+    } while (0)
+
 /**
  * tcg_qemu_tb_exec:
  * @env: pointer to CPUArchState for the CPU
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e984a98dc4..6a04514427 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2174,6 +2174,7 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
 {
     uint64_t ret;
 
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = full_load(env, addr, oi, retaddr);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
@@ -2586,6 +2587,7 @@ static inline void cpu_store_helper(CPUArchState *env, target_ulong addr,
                                     uint64_t val, MemOpIdx oi, uintptr_t ra,
                                     FullStoreHelper *full_store)
 {
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     full_store(env, addr, val, oi, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 7b37fd229e..489459ae17 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -942,6 +942,7 @@ uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_UB);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldub_p(haddr);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
@@ -956,6 +957,7 @@ uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_BEUW);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = lduw_be_p(haddr);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
@@ -970,6 +972,7 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_BEUL);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldl_be_p(haddr);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
@@ -984,6 +987,7 @@ uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_BEUQ);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldq_be_p(haddr);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
@@ -998,6 +1002,7 @@ uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_LEUW);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = lduw_le_p(haddr);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
@@ -1012,6 +1017,7 @@ uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_LEUL);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldl_le_p(haddr);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
@@ -1026,6 +1032,7 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_LEUQ);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    cpu_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     ret = ldq_le_p(haddr);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
@@ -1075,6 +1082,7 @@ void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
 
     validate_memop(oi, MO_UB);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stb_p(haddr, val);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
@@ -1087,6 +1095,7 @@ void cpu_stw_be_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
 
     validate_memop(oi, MO_BEUW);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stw_be_p(haddr, val);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
@@ -1099,6 +1108,7 @@ void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
 
     validate_memop(oi, MO_BEUL);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stl_be_p(haddr, val);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
@@ -1111,6 +1121,7 @@ void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
 
     validate_memop(oi, MO_BEUQ);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stq_be_p(haddr, val);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
@@ -1123,6 +1134,7 @@ void cpu_stw_le_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
 
     validate_memop(oi, MO_LEUW);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stw_le_p(haddr, val);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
@@ -1135,6 +1147,7 @@ void cpu_stl_le_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
 
     validate_memop(oi, MO_LEUL);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stl_le_p(haddr, val);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
@@ -1147,6 +1160,7 @@ void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
 
     validate_memop(oi, MO_LEUQ);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    cpu_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     stq_le_p(haddr, val);
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
-- 
2.34.1


