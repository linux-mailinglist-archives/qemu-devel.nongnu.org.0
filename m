Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755B6F51F4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:40:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pJ-0007nu-D5; Wed, 03 May 2023 03:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6p2-00070U-Fl
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:44 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ow-0007Jd-Hb
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso29121615e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098556; x=1685690556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSSpmlU2LiVOgkbWJa9j5Kx5zJcUjev16PSDnx4CyVs=;
 b=dtNIGqPUEIRCEOHbHeTvIOPuGHC/ENM5bCtwxeYWIMhkPeXzxZWuDAoxuOX5D3TQ/W
 M5ri1su/ITigRRUXtPujJGcf3Fy6ACxjYOdyo/5uHSyo4/gkOoOl5wEfPHiMgfV17tpS
 jDxlV5FLksgrWKNP2asVT0Tn6a2cXgktM+EZrtyB0VvTuF/YEy+rktH9Y+fRxdqglLmR
 tdSyZymR6LWCliSdtgPrrVFrNMI3TJs3mQPnNM53ugaIA+Yi9vzY7Q0CH3kSJczkat4G
 EJ/KfHWstvi1Qp1T6WfVDuOAldZAmnSIL9Pu/EYZwuX/2nl+QIDEbaaMCMn3rZfMCOW2
 EvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098556; x=1685690556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSSpmlU2LiVOgkbWJa9j5Kx5zJcUjev16PSDnx4CyVs=;
 b=eBJLz/KwxfI3ORhNBOkrqUek9kTkj0LvnToiiwMJxPAU5rHv/e1r8NHPzB+uGjbZ22
 kZvjyeKPE6WO3cG2LnDW5E6/I753ZevyamK4zj65p0MpgpgA4DVSLcMiSfAyzZBK2+qy
 d5Yid+sMO+LmuQ25JNQs5BKyY/34nQSr0UnfDN76FjJka1s69NiX+59n+DF8Kv6MubQC
 Ptbi0E6Oup+reCPmrYsNFHalfC8OOZpWo3TJflqanFciyInNpAjoWHxfNDDUzK8QNU4I
 z+Y2ZEiOwc8nxac9NcDHWkFWi/F0P4cz44sM287/hMo/V0IgTarVGyquFR3lrBdhVCJY
 OD5w==
X-Gm-Message-State: AC+VfDyHjMrhmJDcuiHpDzbZX0wwtFyFl3TshTQe3hOzmgwNz9vHrrV0
 k0ntm5uAHGECdD+/2xPEf9i/rXeaAalHBEpxhykKUg==
X-Google-Smtp-Source: ACHHUZ7UG+45IyazXs7cquC1H5krpULNyKaqkvQwx33oIyE7BVG42BEzFQJ4KtHjdrRaf5ZO7PL65w==
X-Received: by 2002:a1c:7317:0:b0:3f1:812d:1da3 with SMTP id
 d23-20020a1c7317000000b003f1812d1da3mr13803158wmb.0.1683098556206; 
 Wed, 03 May 2023 00:22:36 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 10/84] accel/tcg: Widen plugin_gen_empty_mem_callback to i64
Date: Wed,  3 May 2023 08:21:04 +0100
Message-Id: <20230503072221.1746802-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Since we do this inside gen_empty_mem_cb anyway, let's
do this earlier inside tcg expansion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/plugin-gen.h |  4 ++--
 accel/tcg/plugin-gen.c    |  9 +++------
 tcg/tcg-op-ldst.c         | 28 ++++++++++++++++++++--------
 3 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index 5f5506f1cc..3af0168e65 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -27,7 +27,7 @@ void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db);
 void plugin_gen_insn_end(void);
 
 void plugin_gen_disable_mem_helpers(void);
-void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info);
+void plugin_gen_empty_mem_callback(TCGv_i64 addr, uint32_t info);
 
 static inline void plugin_insn_append(abi_ptr pc, const void *from, size_t size)
 {
@@ -69,7 +69,7 @@ static inline void plugin_gen_tb_end(CPUState *cpu)
 static inline void plugin_gen_disable_mem_helpers(void)
 { }
 
-static inline void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info)
+static inline void plugin_gen_empty_mem_callback(TCGv_i64 addr, uint32_t info)
 { }
 
 static inline void plugin_insn_append(abi_ptr pc, const void *from, size_t size)
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 55e892b684..34be1b940c 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -124,23 +124,20 @@ static void gen_empty_inline_cb(void)
     tcg_temp_free_i64(val);
 }
 
-static void gen_empty_mem_cb(TCGv vaddr, uint32_t info)
+static void gen_empty_mem_cb(TCGv_i64 addr, uint32_t info)
 {
     TCGv_i32 cpu_index = tcg_temp_ebb_new_i32();
     TCGv_i32 meminfo = tcg_temp_ebb_new_i32();
-    TCGv_i64 vaddr64 = tcg_temp_ebb_new_i64();
     TCGv_ptr udata = tcg_temp_ebb_new_ptr();
 
     tcg_gen_movi_i32(meminfo, info);
     tcg_gen_movi_ptr(udata, 0);
     tcg_gen_ld_i32(cpu_index, cpu_env,
                    -offsetof(ArchCPU, env) + offsetof(CPUState, cpu_index));
-    tcg_gen_extu_tl_i64(vaddr64, vaddr);
 
-    gen_helper_plugin_vcpu_mem_cb(cpu_index, meminfo, vaddr64, udata);
+    gen_helper_plugin_vcpu_mem_cb(cpu_index, meminfo, addr, udata);
 
     tcg_temp_free_ptr(udata);
-    tcg_temp_free_i64(vaddr64);
     tcg_temp_free_i32(meminfo);
     tcg_temp_free_i32(cpu_index);
 }
@@ -197,7 +194,7 @@ static void plugin_gen_empty_callback(enum plugin_gen_from from)
     }
 }
 
-void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info)
+void plugin_gen_empty_mem_callback(TCGv_i64 addr, uint32_t info)
 {
     enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
 
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index cbd85f793c..0530dcf00a 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -115,13 +115,13 @@ static void tcg_gen_req_mo(TCGBar type)
 }
 
 /* Only required for loads, where value might overlap addr. */
-static TCGv plugin_maybe_preserve_addr(TCGv vaddr)
+static TCGv_i64 plugin_maybe_preserve_addr(TCGv vaddr)
 {
 #ifdef CONFIG_PLUGIN
     if (tcg_ctx->plugin_insn != NULL) {
         /* Save a copy of the vaddr for use after a load.  */
-        TCGv temp = tcg_temp_new();
-        tcg_gen_mov_tl(temp, vaddr);
+        TCGv_i64 temp = tcg_temp_ebb_new_i64();
+        tcg_gen_extu_tl_i64(temp, vaddr);
         return temp;
     }
 #endif
@@ -129,16 +129,28 @@ static TCGv plugin_maybe_preserve_addr(TCGv vaddr)
 }
 
 static void
-plugin_gen_mem_callbacks(TCGv copy_addr, TCGv orig_addr, MemOpIdx oi,
+plugin_gen_mem_callbacks(TCGv_i64 copy_addr, TCGv orig_addr, MemOpIdx oi,
                          enum qemu_plugin_mem_rw rw)
 {
 #ifdef CONFIG_PLUGIN
     if (tcg_ctx->plugin_insn != NULL) {
         qemu_plugin_meminfo_t info = make_plugin_meminfo(oi, rw);
-        plugin_gen_empty_mem_callback(copy_addr ? : orig_addr, info);
+
+#if TARGET_LONG_BITS == 64
         if (copy_addr) {
-            tcg_temp_free(copy_addr);
+            plugin_gen_empty_mem_callback(copy_addr, info);
+            tcg_temp_free_i64(copy_addr);
+        } else {
+            plugin_gen_empty_mem_callback(orig_addr, info);
         }
+#else
+        if (!copy_addr) {
+            copy_addr = tcg_temp_ebb_new_i64();
+            tcg_gen_extu_tl_i64(copy_addr, orig_addr);
+        }
+        plugin_gen_empty_mem_callback(copy_addr, info);
+        tcg_temp_free_i64(copy_addr);
+#endif
     }
 #endif
 }
@@ -147,7 +159,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
     MemOpIdx oi;
-    TCGv copy_addr;
+    TCGv_i64 copy_addr;
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 0, 0);
@@ -223,7 +235,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
     MemOpIdx oi;
-    TCGv copy_addr;
+    TCGv_i64 copy_addr;
 
     if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
         tcg_gen_qemu_ld_i32(TCGV_LOW(val), addr, idx, memop);
-- 
2.34.1


