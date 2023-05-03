Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B46F513F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:24:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6p7-0007An-NK; Wed, 03 May 2023 03:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oz-0006qY-A5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ov-0007H9-8p
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:40 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f37a36b713so7183555e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098555; x=1685690555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z8sjCuLtJ7QtevNycg+bE9LkfywEsd1zAt00dn10Z1Q=;
 b=i1TjvEcuSH2oBVpZrBEXvMW98jPx5mcvRWAuGJUdKuGerDROvxrVDtmFQI3iGbSQcc
 3WWKN0XoTVqNxWwP/9yq/Uh1A9iXuCSiPvTxU4yRz6IHsqcHcsYRD813g2Ib2IJgPBBm
 hWQv3DaKPFahPq5JmGUW848IS34FjF/LuDPRyul9Civ63ufP6RrE4v1th9Pn1aoY/Yk1
 roVQG69vk/0Ij3qO2PiPXtOGDVyv0+dIIz+Bm0kOvAtoI5Ak719Gd8Sc1hppoEQwlyTH
 bzBK8KMOEqUHuXJAu8YqHM6eaJ6rtZSq8tu5iqhEEOk0A8UjkxRUh5ZY60K/+/OBe4M8
 tMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098555; x=1685690555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8sjCuLtJ7QtevNycg+bE9LkfywEsd1zAt00dn10Z1Q=;
 b=JvMtdDWPvSy3ZXdDCrNxedygBbSQU2AH0JByY1Qwp+IWaaa/tX1q6kJ/ssMQEQPjq/
 hEadJw+CWZrGjsnKqAATY+DVPzHtnPH1S2It9YmHwDm/BMHslTN4ZDByYGt7RKIlsuGH
 jxOTVPaEzj/cSmq9J1YuhyU92xaIVrJBpFbvQrMMjoIf1TDtSZNJkazZwRoAKD0L4sT3
 w+aErwM22JmwRCFZy4UcRLyIVWNEAw74T1Jh0WuKteZ45eN5C0sAMoDumYo5I9P9xXRj
 ELI0tom3sD5DMcXqqqEkrsxTuskIY/yEHi8rz4uhLS1CmvQl3E3PMe5xozKYZc+VHXb4
 BZUw==
X-Gm-Message-State: AC+VfDxjfZJzUimWn07qGUmmUM0P5kEogsbBMYsYbyPGcwnjxvqmwSGp
 4RVBgA7CzYXCmjQy++yWKpk73bj0xMkqVsdaRo43nw==
X-Google-Smtp-Source: ACHHUZ45RG5SS7GukrKvBL2KC81XXGLiqvGkaEt70L+2JTpo94YBhVlH0G27P0pympy3Z/R7I6c58g==
X-Received: by 2002:a7b:cbcb:0:b0:3ee:19b4:a2e6 with SMTP id
 n11-20020a7bcbcb000000b003ee19b4a2e6mr14557114wmi.19.1683098555442; 
 Wed, 03 May 2023 00:22:35 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 09/84] tcg: Reduce copies for plugin_gen_mem_callbacks
Date: Wed,  3 May 2023 08:21:03 +0100
Message-Id: <20230503072221.1746802-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

We only need to make copies for loads, when the destination
overlaps the address.  For now, only eliminate the copy for
stores and 128-bit loads.

Rename plugin_prep_mem_callbacks to plugin_maybe_preserve_addr,
returning NULL if no copy is made.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-ldst.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index 17fe35b93c..cbd85f793c 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -114,7 +114,8 @@ static void tcg_gen_req_mo(TCGBar type)
     }
 }
 
-static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
+/* Only required for loads, where value might overlap addr. */
+static TCGv plugin_maybe_preserve_addr(TCGv vaddr)
 {
 #ifdef CONFIG_PLUGIN
     if (tcg_ctx->plugin_insn != NULL) {
@@ -124,17 +125,20 @@ static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
         return temp;
     }
 #endif
-    return vaddr;
+    return NULL;
 }
 
-static void plugin_gen_mem_callbacks(TCGv vaddr, MemOpIdx oi,
-                                     enum qemu_plugin_mem_rw rw)
+static void
+plugin_gen_mem_callbacks(TCGv copy_addr, TCGv orig_addr, MemOpIdx oi,
+                         enum qemu_plugin_mem_rw rw)
 {
 #ifdef CONFIG_PLUGIN
     if (tcg_ctx->plugin_insn != NULL) {
         qemu_plugin_meminfo_t info = make_plugin_meminfo(oi, rw);
-        plugin_gen_empty_mem_callback(vaddr, info);
-        tcg_temp_free(vaddr);
+        plugin_gen_empty_mem_callback(copy_addr ? : orig_addr, info);
+        if (copy_addr) {
+            tcg_temp_free(copy_addr);
+        }
     }
 #endif
 }
@@ -143,6 +147,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
     MemOpIdx oi;
+    TCGv copy_addr;
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 0, 0);
@@ -157,9 +162,9 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
         }
     }
 
-    addr = plugin_prep_mem_callbacks(addr);
+    copy_addr = plugin_maybe_preserve_addr(addr);
     gen_ldst_i32(INDEX_op_qemu_ld_i32, val, addr, memop, idx);
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
+    plugin_gen_mem_callbacks(copy_addr, addr, oi, QEMU_PLUGIN_MEM_R);
 
     if ((orig_memop ^ memop) & MO_BSWAP) {
         switch (orig_memop & MO_SIZE) {
@@ -202,13 +207,12 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
         memop &= ~MO_BSWAP;
     }
 
-    addr = plugin_prep_mem_callbacks(addr);
     if (TCG_TARGET_HAS_qemu_st8_i32 && (memop & MO_SIZE) == MO_8) {
         gen_ldst_i32(INDEX_op_qemu_st8_i32, val, addr, memop, idx);
     } else {
         gen_ldst_i32(INDEX_op_qemu_st_i32, val, addr, memop, idx);
     }
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
+    plugin_gen_mem_callbacks(NULL, addr, oi, QEMU_PLUGIN_MEM_W);
 
     if (swap) {
         tcg_temp_free_i32(swap);
@@ -219,6 +223,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
     MemOpIdx oi;
+    TCGv copy_addr;
 
     if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
         tcg_gen_qemu_ld_i32(TCGV_LOW(val), addr, idx, memop);
@@ -243,9 +248,9 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
         }
     }
 
-    addr = plugin_prep_mem_callbacks(addr);
+    copy_addr = plugin_maybe_preserve_addr(addr);
     gen_ldst_i64(INDEX_op_qemu_ld_i64, val, addr, memop, idx);
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
+    plugin_gen_mem_callbacks(copy_addr, addr, oi, QEMU_PLUGIN_MEM_R);
 
     if ((orig_memop ^ memop) & MO_BSWAP) {
         int flags = (orig_memop & MO_SIGN
@@ -300,9 +305,8 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
         memop &= ~MO_BSWAP;
     }
 
-    addr = plugin_prep_mem_callbacks(addr);
     gen_ldst_i64(INDEX_op_qemu_st_i64, val, addr, memop, idx);
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
+    plugin_gen_mem_callbacks(NULL, addr, oi, QEMU_PLUGIN_MEM_W);
 
     if (swap) {
         tcg_temp_free_i64(swap);
@@ -430,7 +434,6 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_debug_assert((memop & MO_SIGN) == 0);
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
-    addr = plugin_prep_mem_callbacks(addr);
 
     /* TODO: For now, force 32-bit hosts to use the helper. */
     if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
@@ -501,7 +504,7 @@ void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
         maybe_free_addr64(a64);
     }
 
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
+    plugin_gen_mem_callbacks(NULL, addr, oi, QEMU_PLUGIN_MEM_R);
 }
 
 void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
@@ -512,7 +515,6 @@ void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_debug_assert((memop & MO_SIGN) == 0);
 
     tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
-    addr = plugin_prep_mem_callbacks(addr);
 
     /* TODO: For now, force 32-bit hosts to use the helper. */
 
@@ -583,7 +585,7 @@ void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
         maybe_free_addr64(a64);
     }
 
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
+    plugin_gen_mem_callbacks(NULL, addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, MemOp opc)
-- 
2.34.1


