Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDCC6F5246
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:51:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qI-0002Hd-JI; Wed, 03 May 2023 03:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q3-0001OZ-Aj
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6pz-0001ej-N7
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30644c18072so100826f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098622; x=1685690622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z8sjCuLtJ7QtevNycg+bE9LkfywEsd1zAt00dn10Z1Q=;
 b=pU+qyl3hwfJoSMJUyiACV4cypUVHuFf0WvGG0KPuSKpj+d1CpBoJ3OmP+Jawtb1579
 t8duFnTvCS1vGVJ5BpiP8Oqyg8oLqiV5F/9X56JOMdah9zrHTZK5DyhlUSoKICFSMi0A
 XBNVhJw16XAeiEuL69zi34CPVVC5bcQnqlUYy0mG4buOsXMireK+tu8g5DWKsNZlyXac
 Rjj3R7oh3jmRwwHvDDNbMdL0o1D16gqkIUzwP9cSEASTBgXXy9/CpJ4fryUGR4dFelr3
 5EVdG0hDVlSw5euwxuSAhLYI/7vMg10EkOuXBPdxjd1QrPMzcL0Ihz+2HaRpmWl1GivI
 yakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098622; x=1685690622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8sjCuLtJ7QtevNycg+bE9LkfywEsd1zAt00dn10Z1Q=;
 b=ieYO+px2cvwu+8pHUhlhzvDUj6vKJKjIywgnfEKjKmNg2tpzLmBjtBn2FQ/FXuqpar
 NBwoQWBcS+mELNzaMHQ8j3O6UxLjB8u9wLFrvA7Jgvek8dBjCQpLbzlJ1kqi0hoKnuV0
 +E8iVpxkQBunlbdVJ5D8kQ44xmZ1RQEYE5nqcrmjKKuGCPR6NLvJF74YCGT9w5Zvxfly
 fOmW7ZvVTG6DyX3DRMy6jxxj1aHd5lZQTgC4Tvdi3RDLy2HOwHFJl7McBesvndrE8jFg
 i0GR7L4wIsJdsOI1Z/2D3TMjQm54QRGIpz4gEsGy2cD34GW9RNMPGstATDrdux9aaeIm
 WfsA==
X-Gm-Message-State: AC+VfDz5ox93muLMWYK/gzdEzfe9YGJR9E6eyl3jrDhnwWQZn9X5mxwy
 Oen0ogsTBFddFULtCbhXNvEJNirqylvBVQZELme6HA==
X-Google-Smtp-Source: ACHHUZ6O6uycMCXaodmI5bBL/qn6/4oolb0g4NFTAiIjwr2t/xk5aHq+dGjNFs47qB6wvcq0N9W5BA==
X-Received: by 2002:adf:e9cd:0:b0:306:2fd1:a91f with SMTP id
 l13-20020adfe9cd000000b003062fd1a91fmr5281505wrn.61.1683098622200; 
 Wed, 03 May 2023 00:23:42 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 09/84] tcg: Reduce copies for plugin_gen_mem_callbacks
Date: Wed,  3 May 2023 08:22:16 +0100
Message-Id: <20230503072331.1747057-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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


