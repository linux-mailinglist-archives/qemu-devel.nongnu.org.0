Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB26F5160
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:27:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6p7-0007DF-Qt; Wed, 03 May 2023 03:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ov-0006pW-HX
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:40 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ok-0007H3-UC
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso29602715e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098544; x=1685690544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IIUDyNpFEtAcRsGwdLhIs4NILshU/dnOeolXsp9s4DA=;
 b=Zp82S/HkaV5VcDe/xtiaSwxIxZ/V1HGqxFJEwL1OUvbCF9VvCB/knF0okIl7wq3pmD
 3iHMU52R2nXodSxZdnIOaURpOuoGVYsWECjeNWXmyeBi2Mb4ixKov8OS2l2Drp6aX5Uw
 N28hJTXw5gNwhQxvWL9d1cGK2OdxUpO16T8p6jG2T4+zq7phnaWDFJ9t0Uig0o7gH5tO
 qzb9OvqK0ZnlzqG5dNZdG3RiR1pk9t9zGF3Zx+0U+Ygql9iO9TlrGq7eUG6UhLqdY4AQ
 AvDZJqHmRTDTQzIBc7lDFbQM9RJNuMxYloYy5821r3xGf3KY+l/M/jGuXfkk8VeDxtH8
 sc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098544; x=1685690544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IIUDyNpFEtAcRsGwdLhIs4NILshU/dnOeolXsp9s4DA=;
 b=IsK9DC+bG3jzKNoX49nbfZwN41U1kdiQBsc5i+DgZIyouTTjUP90QNwAo3BmgkBtVt
 F8UFrj4UfQh7Y6u1+NphWrDvpXr+LP+e9Zwc7aka4VHKrm0K8J+v9fLT2uALu8fNmkAF
 apawVxWS1Ftbt378Gd3iHl6tQVXa9JgZZV4hmWdGqWU8Z7FQgEHG8xmTfburEa3tKg6K
 64VrDdSmQdxQihN4kxhuTnXldxyBIqMw/GMLpaJANdJcJYthAb3u64aR/w/v8/YEoUlQ
 vdmABbIr6ESqXaF6UOaPSAKtDUDn1xlpPYDp3K2I0pe3GjtIpOOEPSiYrz6BkSKkKjQm
 pbAw==
X-Gm-Message-State: AC+VfDyvU04A2ViS5CU0jzNFJhTfBuvKU9FLFKu+NBrg9cN3N47j3oEB
 /9napYswe/K1UGzn8ib8m38Y/ATZfP6iFIfzD9eZOA==
X-Google-Smtp-Source: ACHHUZ5cUWmPuzTz4UVL0eCc5n1NptG+ljlKs7UrYvZeOZlYxXffzWcVzamjpjfrUQvAQDmiFQVmZw==
X-Received: by 2002:a05:600c:299:b0:3f1:8c37:fa79 with SMTP id
 25-20020a05600c029900b003f18c37fa79mr14089574wmk.31.1683098543862; 
 Wed, 03 May 2023 00:22:23 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 01/84] tcg: Split out memory ops to tcg-op-ldst.c
Date: Wed,  3 May 2023 08:20:47 +0100
Message-Id: <20230503072221.1746802-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-ldst.c | 1017 +++++++++++++++++++++++++++++++++++++++++++++
 tcg/tcg-op.c      |  985 -------------------------------------------
 tcg/meson.build   |    1 +
 3 files changed, 1018 insertions(+), 985 deletions(-)
 create mode 100644 tcg/tcg-op-ldst.c

diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
new file mode 100644
index 0000000000..a3beede2f4
--- /dev/null
+++ b/tcg/tcg-op-ldst.c
@@ -0,0 +1,1017 @@
+/*
+ * Tiny Code Generator for QEMU
+ *
+ * Copyright (c) 2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/exec-all.h"
+#include "tcg/tcg.h"
+#include "tcg/tcg-temp-internal.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-mo.h"
+#include "exec/plugin-gen.h"
+#include "tcg-internal.h"
+
+
+static inline MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
+{
+    /* Trigger the asserts within as early as possible.  */
+    unsigned a_bits = get_alignment_bits(op);
+
+    /* Prefer MO_ALIGN+MO_XX over MO_ALIGN_XX+MO_XX */
+    if (a_bits == (op & MO_SIZE)) {
+        op = (op & ~MO_AMASK) | MO_ALIGN;
+    }
+
+    switch (op & MO_SIZE) {
+    case MO_8:
+        op &= ~MO_BSWAP;
+        break;
+    case MO_16:
+        break;
+    case MO_32:
+        if (!is64) {
+            op &= ~MO_SIGN;
+        }
+        break;
+    case MO_64:
+        if (is64) {
+            op &= ~MO_SIGN;
+            break;
+        }
+        /* fall through */
+    default:
+        g_assert_not_reached();
+    }
+    if (st) {
+        op &= ~MO_SIGN;
+    }
+    return op;
+}
+
+static void gen_ldst_i32(TCGOpcode opc, TCGv_i32 val, TCGv addr,
+                         MemOp memop, TCGArg idx)
+{
+    MemOpIdx oi = make_memop_idx(memop, idx);
+#if TARGET_LONG_BITS == 32
+    tcg_gen_op3i_i32(opc, val, addr, oi);
+#else
+    if (TCG_TARGET_REG_BITS == 32) {
+        tcg_gen_op4i_i32(opc, val, TCGV_LOW(addr), TCGV_HIGH(addr), oi);
+    } else {
+        tcg_gen_op3(opc, tcgv_i32_arg(val), tcgv_i64_arg(addr), oi);
+    }
+#endif
+}
+
+static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
+                         MemOp memop, TCGArg idx)
+{
+    MemOpIdx oi = make_memop_idx(memop, idx);
+#if TARGET_LONG_BITS == 32
+    if (TCG_TARGET_REG_BITS == 32) {
+        tcg_gen_op4i_i32(opc, TCGV_LOW(val), TCGV_HIGH(val), addr, oi);
+    } else {
+        tcg_gen_op3(opc, tcgv_i64_arg(val), tcgv_i32_arg(addr), oi);
+    }
+#else
+    if (TCG_TARGET_REG_BITS == 32) {
+        tcg_gen_op5i_i32(opc, TCGV_LOW(val), TCGV_HIGH(val),
+                         TCGV_LOW(addr), TCGV_HIGH(addr), oi);
+    } else {
+        tcg_gen_op3i_i64(opc, val, addr, oi);
+    }
+#endif
+}
+
+static void tcg_gen_req_mo(TCGBar type)
+{
+#ifdef TCG_GUEST_DEFAULT_MO
+    type &= TCG_GUEST_DEFAULT_MO;
+#endif
+    type &= ~TCG_TARGET_DEFAULT_MO;
+    if (type) {
+        tcg_gen_mb(type | TCG_BAR_SC);
+    }
+}
+
+static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
+{
+#ifdef CONFIG_PLUGIN
+    if (tcg_ctx->plugin_insn != NULL) {
+        /* Save a copy of the vaddr for use after a load.  */
+        TCGv temp = tcg_temp_new();
+        tcg_gen_mov_tl(temp, vaddr);
+        return temp;
+    }
+#endif
+    return vaddr;
+}
+
+static void plugin_gen_mem_callbacks(TCGv vaddr, MemOpIdx oi,
+                                     enum qemu_plugin_mem_rw rw)
+{
+#ifdef CONFIG_PLUGIN
+    if (tcg_ctx->plugin_insn != NULL) {
+        qemu_plugin_meminfo_t info = make_plugin_meminfo(oi, rw);
+        plugin_gen_empty_mem_callback(vaddr, info);
+        tcg_temp_free(vaddr);
+    }
+#endif
+}
+
+void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
+{
+    MemOp orig_memop;
+    MemOpIdx oi;
+
+    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
+    memop = tcg_canonicalize_memop(memop, 0, 0);
+    oi = make_memop_idx(memop, idx);
+
+    orig_memop = memop;
+    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
+        memop &= ~MO_BSWAP;
+        /* The bswap primitive benefits from zero-extended input.  */
+        if ((memop & MO_SSIZE) == MO_SW) {
+            memop &= ~MO_SIGN;
+        }
+    }
+
+    addr = plugin_prep_mem_callbacks(addr);
+    gen_ldst_i32(INDEX_op_qemu_ld_i32, val, addr, memop, idx);
+    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
+
+    if ((orig_memop ^ memop) & MO_BSWAP) {
+        switch (orig_memop & MO_SIZE) {
+        case MO_16:
+            tcg_gen_bswap16_i32(val, val, (orig_memop & MO_SIGN
+                                           ? TCG_BSWAP_IZ | TCG_BSWAP_OS
+                                           : TCG_BSWAP_IZ | TCG_BSWAP_OZ));
+            break;
+        case MO_32:
+            tcg_gen_bswap32_i32(val, val);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
+void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
+{
+    TCGv_i32 swap = NULL;
+    MemOpIdx oi;
+
+    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
+    memop = tcg_canonicalize_memop(memop, 0, 1);
+    oi = make_memop_idx(memop, idx);
+
+    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
+        swap = tcg_temp_ebb_new_i32();
+        switch (memop & MO_SIZE) {
+        case MO_16:
+            tcg_gen_bswap16_i32(swap, val, 0);
+            break;
+        case MO_32:
+            tcg_gen_bswap32_i32(swap, val);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        val = swap;
+        memop &= ~MO_BSWAP;
+    }
+
+    addr = plugin_prep_mem_callbacks(addr);
+    if (TCG_TARGET_HAS_qemu_st8_i32 && (memop & MO_SIZE) == MO_8) {
+        gen_ldst_i32(INDEX_op_qemu_st8_i32, val, addr, memop, idx);
+    } else {
+        gen_ldst_i32(INDEX_op_qemu_st_i32, val, addr, memop, idx);
+    }
+    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
+
+    if (swap) {
+        tcg_temp_free_i32(swap);
+    }
+}
+
+void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
+{
+    MemOp orig_memop;
+    MemOpIdx oi;
+
+    if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
+        tcg_gen_qemu_ld_i32(TCGV_LOW(val), addr, idx, memop);
+        if (memop & MO_SIGN) {
+            tcg_gen_sari_i32(TCGV_HIGH(val), TCGV_LOW(val), 31);
+        } else {
+            tcg_gen_movi_i32(TCGV_HIGH(val), 0);
+        }
+        return;
+    }
+
+    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
+    memop = tcg_canonicalize_memop(memop, 1, 0);
+    oi = make_memop_idx(memop, idx);
+
+    orig_memop = memop;
+    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
+        memop &= ~MO_BSWAP;
+        /* The bswap primitive benefits from zero-extended input.  */
+        if ((memop & MO_SIGN) && (memop & MO_SIZE) < MO_64) {
+            memop &= ~MO_SIGN;
+        }
+    }
+
+    addr = plugin_prep_mem_callbacks(addr);
+    gen_ldst_i64(INDEX_op_qemu_ld_i64, val, addr, memop, idx);
+    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
+
+    if ((orig_memop ^ memop) & MO_BSWAP) {
+        int flags = (orig_memop & MO_SIGN
+                     ? TCG_BSWAP_IZ | TCG_BSWAP_OS
+                     : TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+        switch (orig_memop & MO_SIZE) {
+        case MO_16:
+            tcg_gen_bswap16_i64(val, val, flags);
+            break;
+        case MO_32:
+            tcg_gen_bswap32_i64(val, val, flags);
+            break;
+        case MO_64:
+            tcg_gen_bswap64_i64(val, val);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
+void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
+{
+    TCGv_i64 swap = NULL;
+    MemOpIdx oi;
+
+    if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
+        tcg_gen_qemu_st_i32(TCGV_LOW(val), addr, idx, memop);
+        return;
+    }
+
+    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
+    memop = tcg_canonicalize_memop(memop, 1, 1);
+    oi = make_memop_idx(memop, idx);
+
+    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
+        swap = tcg_temp_ebb_new_i64();
+        switch (memop & MO_SIZE) {
+        case MO_16:
+            tcg_gen_bswap16_i64(swap, val, 0);
+            break;
+        case MO_32:
+            tcg_gen_bswap32_i64(swap, val, 0);
+            break;
+        case MO_64:
+            tcg_gen_bswap64_i64(swap, val);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        val = swap;
+        memop &= ~MO_BSWAP;
+    }
+
+    addr = plugin_prep_mem_callbacks(addr);
+    gen_ldst_i64(INDEX_op_qemu_st_i64, val, addr, memop, idx);
+    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
+
+    if (swap) {
+        tcg_temp_free_i64(swap);
+    }
+}
+
+/*
+ * Return true if @mop, without knowledge of the pointer alignment,
+ * does not require 16-byte atomicity, and it would be adventagous
+ * to avoid a call to a helper function.
+ */
+static bool use_two_i64_for_i128(MemOp mop)
+{
+#ifdef CONFIG_SOFTMMU
+    /* Two softmmu tlb lookups is larger than one function call. */
+    return false;
+#else
+    /*
+     * For user-only, two 64-bit operations may well be smaller than a call.
+     * Determine if that would be legal for the requested atomicity.
+     */
+    MemOp atom = mop & MO_ATOM_MASK;
+    MemOp atmax = mop & MO_ATMAX_MASK;
+
+    /* In a serialized context, no atomicity is required. */
+    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
+        return true;
+    }
+
+    if (atmax == MO_ATMAX_SIZE) {
+        atmax = mop & MO_SIZE;
+    } else {
+        atmax >>= MO_ATMAX_SHIFT;
+    }
+    switch (atom) {
+    case MO_ATOM_NONE:
+        return true;
+    case MO_ATOM_IFALIGN:
+    case MO_ATOM_SUBALIGN:
+        return atmax < MO_128;
+    case MO_ATOM_WITHIN16:
+        return atmax == MO_8;
+    default:
+        g_assert_not_reached();
+    }
+#endif
+}
+
+static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
+{
+    MemOp mop_1 = orig, mop_2;
+
+    tcg_debug_assert((orig & MO_SIZE) == MO_128);
+    tcg_debug_assert((orig & MO_SIGN) == 0);
+
+    /* Reduce the size to 64-bit. */
+    mop_1 = (mop_1 & ~MO_SIZE) | MO_64;
+
+    /* Retain the alignment constraints of the original. */
+    switch (orig & MO_AMASK) {
+    case MO_UNALN:
+    case MO_ALIGN_2:
+    case MO_ALIGN_4:
+        mop_2 = mop_1;
+        break;
+    case MO_ALIGN_8:
+        /* Prefer MO_ALIGN+MO_64 to MO_ALIGN_8+MO_64. */
+        mop_1 = (mop_1 & ~MO_AMASK) | MO_ALIGN;
+        mop_2 = mop_1;
+        break;
+    case MO_ALIGN:
+        /* Second has 8-byte alignment; first has 16-byte alignment. */
+        mop_2 = mop_1;
+        mop_1 = (mop_1 & ~MO_AMASK) | MO_ALIGN_16;
+        break;
+    case MO_ALIGN_16:
+    case MO_ALIGN_32:
+    case MO_ALIGN_64:
+        /* Second has 8-byte alignment; first retains original. */
+        mop_2 = (mop_1 & ~MO_AMASK) | MO_ALIGN;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    /* Use a memory ordering implemented by the host. */
+    if ((orig & MO_BSWAP) && !tcg_target_has_memory_bswap(mop_1)) {
+        mop_1 &= ~MO_BSWAP;
+        mop_2 &= ~MO_BSWAP;
+    }
+
+    ret[0] = mop_1;
+    ret[1] = mop_2;
+}
+
+#if TARGET_LONG_BITS == 64
+#define tcg_temp_ebb_new  tcg_temp_ebb_new_i64
+#else
+#define tcg_temp_ebb_new  tcg_temp_ebb_new_i32
+#endif
+
+void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
+{
+    const MemOpIdx oi = make_memop_idx(memop, idx);
+
+    tcg_debug_assert((memop & MO_SIZE) == MO_128);
+    tcg_debug_assert((memop & MO_SIGN) == 0);
+
+    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
+    addr = plugin_prep_mem_callbacks(addr);
+
+    /* TODO: For now, force 32-bit hosts to use the helper. */
+    if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
+        TCGv_i64 lo, hi;
+        TCGArg addr_arg;
+        MemOpIdx adj_oi;
+        bool need_bswap = false;
+
+        if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
+            lo = TCGV128_HIGH(val);
+            hi = TCGV128_LOW(val);
+            adj_oi = make_memop_idx(memop & ~MO_BSWAP, idx);
+            need_bswap = true;
+        } else {
+            lo = TCGV128_LOW(val);
+            hi = TCGV128_HIGH(val);
+            adj_oi = oi;
+        }
+
+#if TARGET_LONG_BITS == 32
+        addr_arg = tcgv_i32_arg(addr);
+#else
+        addr_arg = tcgv_i64_arg(addr);
+#endif
+        tcg_gen_op4ii_i64(INDEX_op_qemu_ld_i128, lo, hi, addr_arg, adj_oi);
+
+        if (need_bswap) {
+            tcg_gen_bswap64_i64(lo, lo);
+            tcg_gen_bswap64_i64(hi, hi);
+        }
+    } else if (use_two_i64_for_i128(memop)) {
+        MemOp mop[2];
+        TCGv addr_p8;
+        TCGv_i64 x, y;
+
+        canonicalize_memop_i128_as_i64(mop, memop);
+
+        /*
+         * Since there are no global TCGv_i128, there is no visible state
+         * changed if the second load faults.  Load directly into the two
+         * subwords.
+         */
+        if ((memop & MO_BSWAP) == MO_LE) {
+            x = TCGV128_LOW(val);
+            y = TCGV128_HIGH(val);
+        } else {
+            x = TCGV128_HIGH(val);
+            y = TCGV128_LOW(val);
+        }
+
+        gen_ldst_i64(INDEX_op_qemu_ld_i64, x, addr, mop[0], idx);
+
+        if ((mop[0] ^ memop) & MO_BSWAP) {
+            tcg_gen_bswap64_i64(x, x);
+        }
+
+        addr_p8 = tcg_temp_ebb_new();
+        tcg_gen_addi_tl(addr_p8, addr, 8);
+        gen_ldst_i64(INDEX_op_qemu_ld_i64, y, addr_p8, mop[1], idx);
+        tcg_temp_free(addr_p8);
+
+        if ((mop[0] ^ memop) & MO_BSWAP) {
+            tcg_gen_bswap64_i64(y, y);
+        }
+    } else {
+        gen_helper_ld_i128(val, cpu_env, addr, tcg_constant_i32(oi));
+    }
+
+    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
+}
+
+void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
+{
+    const MemOpIdx oi = make_memop_idx(memop, idx);
+
+    tcg_debug_assert((memop & MO_SIZE) == MO_128);
+    tcg_debug_assert((memop & MO_SIGN) == 0);
+
+    tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
+    addr = plugin_prep_mem_callbacks(addr);
+
+    /* TODO: For now, force 32-bit hosts to use the helper. */
+
+    if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
+        TCGv_i64 lo, hi;
+        TCGArg addr_arg;
+        MemOpIdx adj_oi;
+        bool need_bswap = false;
+
+        if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
+            lo = tcg_temp_new_i64();
+            hi = tcg_temp_new_i64();
+            tcg_gen_bswap64_i64(lo, TCGV128_HIGH(val));
+            tcg_gen_bswap64_i64(hi, TCGV128_LOW(val));
+            adj_oi = make_memop_idx(memop & ~MO_BSWAP, idx);
+            need_bswap = true;
+        } else {
+            lo = TCGV128_LOW(val);
+            hi = TCGV128_HIGH(val);
+            adj_oi = oi;
+        }
+
+#if TARGET_LONG_BITS == 32
+        addr_arg = tcgv_i32_arg(addr);
+#else
+        addr_arg = tcgv_i64_arg(addr);
+#endif
+        tcg_gen_op4ii_i64(INDEX_op_qemu_st_i128, lo, hi, addr_arg, adj_oi);
+
+        if (need_bswap) {
+            tcg_temp_free_i64(lo);
+            tcg_temp_free_i64(hi);
+        }
+    } else if (use_two_i64_for_i128(memop)) {
+        MemOp mop[2];
+        TCGv addr_p8;
+        TCGv_i64 x, y;
+
+        canonicalize_memop_i128_as_i64(mop, memop);
+
+        if ((memop & MO_BSWAP) == MO_LE) {
+            x = TCGV128_LOW(val);
+            y = TCGV128_HIGH(val);
+        } else {
+            x = TCGV128_HIGH(val);
+            y = TCGV128_LOW(val);
+        }
+
+        addr_p8 = tcg_temp_ebb_new();
+        if ((mop[0] ^ memop) & MO_BSWAP) {
+            TCGv_i64 t = tcg_temp_ebb_new_i64();
+
+            tcg_gen_bswap64_i64(t, x);
+            gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr, mop[0], idx);
+            tcg_gen_bswap64_i64(t, y);
+            tcg_gen_addi_tl(addr_p8, addr, 8);
+            gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr_p8, mop[1], idx);
+            tcg_temp_free_i64(t);
+        } else {
+            gen_ldst_i64(INDEX_op_qemu_st_i64, x, addr, mop[0], idx);
+            tcg_gen_addi_tl(addr_p8, addr, 8);
+            gen_ldst_i64(INDEX_op_qemu_st_i64, y, addr_p8, mop[1], idx);
+        }
+        tcg_temp_free(addr_p8);
+    } else {
+        gen_helper_st_i128(cpu_env, addr, val, tcg_constant_i32(oi));
+    }
+
+    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, MemOp opc)
+{
+    switch (opc & MO_SSIZE) {
+    case MO_SB:
+        tcg_gen_ext8s_i32(ret, val);
+        break;
+    case MO_UB:
+        tcg_gen_ext8u_i32(ret, val);
+        break;
+    case MO_SW:
+        tcg_gen_ext16s_i32(ret, val);
+        break;
+    case MO_UW:
+        tcg_gen_ext16u_i32(ret, val);
+        break;
+    default:
+        tcg_gen_mov_i32(ret, val);
+        break;
+    }
+}
+
+static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, MemOp opc)
+{
+    switch (opc & MO_SSIZE) {
+    case MO_SB:
+        tcg_gen_ext8s_i64(ret, val);
+        break;
+    case MO_UB:
+        tcg_gen_ext8u_i64(ret, val);
+        break;
+    case MO_SW:
+        tcg_gen_ext16s_i64(ret, val);
+        break;
+    case MO_UW:
+        tcg_gen_ext16u_i64(ret, val);
+        break;
+    case MO_SL:
+        tcg_gen_ext32s_i64(ret, val);
+        break;
+    case MO_UL:
+        tcg_gen_ext32u_i64(ret, val);
+        break;
+    default:
+        tcg_gen_mov_i64(ret, val);
+        break;
+    }
+}
+
+typedef void (*gen_atomic_cx_i32)(TCGv_i32, TCGv_env, TCGv,
+                                  TCGv_i32, TCGv_i32, TCGv_i32);
+typedef void (*gen_atomic_cx_i64)(TCGv_i64, TCGv_env, TCGv,
+                                  TCGv_i64, TCGv_i64, TCGv_i32);
+typedef void (*gen_atomic_cx_i128)(TCGv_i128, TCGv_env, TCGv,
+                                   TCGv_i128, TCGv_i128, TCGv_i32);
+typedef void (*gen_atomic_op_i32)(TCGv_i32, TCGv_env, TCGv,
+                                  TCGv_i32, TCGv_i32);
+typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
+                                  TCGv_i64, TCGv_i32);
+
+#ifdef CONFIG_ATOMIC64
+# define WITH_ATOMIC64(X) X,
+#else
+# define WITH_ATOMIC64(X)
+#endif
+#ifdef CONFIG_CMPXCHG128
+# define WITH_ATOMIC128(X) X,
+#else
+# define WITH_ATOMIC128(X)
+#endif
+
+static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
+    [MO_8] = gen_helper_atomic_cmpxchgb,
+    [MO_16 | MO_LE] = gen_helper_atomic_cmpxchgw_le,
+    [MO_16 | MO_BE] = gen_helper_atomic_cmpxchgw_be,
+    [MO_32 | MO_LE] = gen_helper_atomic_cmpxchgl_le,
+    [MO_32 | MO_BE] = gen_helper_atomic_cmpxchgl_be,
+    WITH_ATOMIC64([MO_64 | MO_LE] = gen_helper_atomic_cmpxchgq_le)
+    WITH_ATOMIC64([MO_64 | MO_BE] = gen_helper_atomic_cmpxchgq_be)
+    WITH_ATOMIC128([MO_128 | MO_LE] = gen_helper_atomic_cmpxchgo_le)
+    WITH_ATOMIC128([MO_128 | MO_BE] = gen_helper_atomic_cmpxchgo_be)
+};
+
+void tcg_gen_nonatomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
+                                   TCGv_i32 newv, TCGArg idx, MemOp memop)
+{
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
+
+    tcg_gen_ext_i32(t2, cmpv, memop & MO_SIZE);
+
+    tcg_gen_qemu_ld_i32(t1, addr, idx, memop & ~MO_SIGN);
+    tcg_gen_movcond_i32(TCG_COND_EQ, t2, t1, t2, newv, t1);
+    tcg_gen_qemu_st_i32(t2, addr, idx, memop);
+    tcg_temp_free_i32(t2);
+
+    if (memop & MO_SIGN) {
+        tcg_gen_ext_i32(retv, t1, memop);
+    } else {
+        tcg_gen_mov_i32(retv, t1);
+    }
+    tcg_temp_free_i32(t1);
+}
+
+void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
+                                TCGv_i32 newv, TCGArg idx, MemOp memop)
+{
+    gen_atomic_cx_i32 gen;
+    MemOpIdx oi;
+
+    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
+        tcg_gen_nonatomic_cmpxchg_i32(retv, addr, cmpv, newv, idx, memop);
+        return;
+    }
+
+    memop = tcg_canonicalize_memop(memop, 0, 0);
+    gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
+    tcg_debug_assert(gen != NULL);
+
+    oi = make_memop_idx(memop & ~MO_SIGN, idx);
+    gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+
+    if (memop & MO_SIGN) {
+        tcg_gen_ext_i32(retv, retv, memop);
+    }
+}
+
+void tcg_gen_nonatomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
+                                   TCGv_i64 newv, TCGArg idx, MemOp memop)
+{
+    TCGv_i64 t1, t2;
+
+    if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
+        tcg_gen_nonatomic_cmpxchg_i32(TCGV_LOW(retv), addr, TCGV_LOW(cmpv),
+                                      TCGV_LOW(newv), idx, memop);
+        if (memop & MO_SIGN) {
+            tcg_gen_sari_i32(TCGV_HIGH(retv), TCGV_LOW(retv), 31);
+        } else {
+            tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
+        }
+        return;
+    }
+
+    t1 = tcg_temp_ebb_new_i64();
+    t2 = tcg_temp_ebb_new_i64();
+
+    tcg_gen_ext_i64(t2, cmpv, memop & MO_SIZE);
+
+    tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
+    tcg_gen_movcond_i64(TCG_COND_EQ, t2, t1, t2, newv, t1);
+    tcg_gen_qemu_st_i64(t2, addr, idx, memop);
+    tcg_temp_free_i64(t2);
+
+    if (memop & MO_SIGN) {
+        tcg_gen_ext_i64(retv, t1, memop);
+    } else {
+        tcg_gen_mov_i64(retv, t1);
+    }
+    tcg_temp_free_i64(t1);
+}
+
+void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
+                                TCGv_i64 newv, TCGArg idx, MemOp memop)
+{
+    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
+        tcg_gen_nonatomic_cmpxchg_i64(retv, addr, cmpv, newv, idx, memop);
+        return;
+    }
+
+    if ((memop & MO_SIZE) == MO_64) {
+        gen_atomic_cx_i64 gen;
+
+        memop = tcg_canonicalize_memop(memop, 1, 0);
+        gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
+        if (gen) {
+            MemOpIdx oi = make_memop_idx(memop, idx);
+            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+            return;
+        }
+
+        gen_helper_exit_atomic(cpu_env);
+
+        /*
+         * Produce a result for a well-formed opcode stream.  This satisfies
+         * liveness for set before used, which happens before this dead code
+         * is removed.
+         */
+        tcg_gen_movi_i64(retv, 0);
+        return;
+    }
+
+    if (TCG_TARGET_REG_BITS == 32) {
+        tcg_gen_atomic_cmpxchg_i32(TCGV_LOW(retv), addr, TCGV_LOW(cmpv),
+                                   TCGV_LOW(newv), idx, memop);
+        if (memop & MO_SIGN) {
+            tcg_gen_sari_i32(TCGV_HIGH(retv), TCGV_LOW(retv), 31);
+        } else {
+            tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
+        }
+    } else {
+        TCGv_i32 c32 = tcg_temp_ebb_new_i32();
+        TCGv_i32 n32 = tcg_temp_ebb_new_i32();
+        TCGv_i32 r32 = tcg_temp_ebb_new_i32();
+
+        tcg_gen_extrl_i64_i32(c32, cmpv);
+        tcg_gen_extrl_i64_i32(n32, newv);
+        tcg_gen_atomic_cmpxchg_i32(r32, addr, c32, n32, idx, memop & ~MO_SIGN);
+        tcg_temp_free_i32(c32);
+        tcg_temp_free_i32(n32);
+
+        tcg_gen_extu_i32_i64(retv, r32);
+        tcg_temp_free_i32(r32);
+
+        if (memop & MO_SIGN) {
+            tcg_gen_ext_i64(retv, retv, memop);
+        }
+    }
+}
+
+void tcg_gen_nonatomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
+                                    TCGv_i128 newv, TCGArg idx, MemOp memop)
+{
+    if (TCG_TARGET_REG_BITS == 32) {
+        /* Inline expansion below is simply too large for 32-bit hosts. */
+        gen_atomic_cx_i128 gen = ((memop & MO_BSWAP) == MO_LE
+                                  ? gen_helper_nonatomic_cmpxchgo_le
+                                  : gen_helper_nonatomic_cmpxchgo_be);
+        MemOpIdx oi = make_memop_idx(memop, idx);
+
+        tcg_debug_assert((memop & MO_SIZE) == MO_128);
+        tcg_debug_assert((memop & MO_SIGN) == 0);
+
+        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+    } else {
+        TCGv_i128 oldv = tcg_temp_ebb_new_i128();
+        TCGv_i128 tmpv = tcg_temp_ebb_new_i128();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+        TCGv_i64 z = tcg_constant_i64(0);
+
+        tcg_gen_qemu_ld_i128(oldv, addr, idx, memop);
+
+        /* Compare i128 */
+        tcg_gen_xor_i64(t0, TCGV128_LOW(oldv), TCGV128_LOW(cmpv));
+        tcg_gen_xor_i64(t1, TCGV128_HIGH(oldv), TCGV128_HIGH(cmpv));
+        tcg_gen_or_i64(t0, t0, t1);
+
+        /* tmpv = equal ? newv : oldv */
+        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_LOW(tmpv), t0, z,
+                            TCGV128_LOW(newv), TCGV128_LOW(oldv));
+        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_HIGH(tmpv), t0, z,
+                            TCGV128_HIGH(newv), TCGV128_HIGH(oldv));
+
+        /* Unconditional writeback. */
+        tcg_gen_qemu_st_i128(tmpv, addr, idx, memop);
+        tcg_gen_mov_i128(retv, oldv);
+
+        tcg_temp_free_i64(t0);
+        tcg_temp_free_i64(t1);
+        tcg_temp_free_i128(tmpv);
+        tcg_temp_free_i128(oldv);
+    }
+}
+
+void tcg_gen_atomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
+                                 TCGv_i128 newv, TCGArg idx, MemOp memop)
+{
+    gen_atomic_cx_i128 gen;
+
+    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
+        tcg_gen_nonatomic_cmpxchg_i128(retv, addr, cmpv, newv, idx, memop);
+        return;
+    }
+
+    tcg_debug_assert((memop & MO_SIZE) == MO_128);
+    tcg_debug_assert((memop & MO_SIGN) == 0);
+    gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
+
+    if (gen) {
+        MemOpIdx oi = make_memop_idx(memop, idx);
+        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+        return;
+    }
+
+    gen_helper_exit_atomic(cpu_env);
+
+    /*
+     * Produce a result for a well-formed opcode stream.  This satisfies
+     * liveness for set before used, which happens before this dead code
+     * is removed.
+     */
+    tcg_gen_movi_i64(TCGV128_LOW(retv), 0);
+    tcg_gen_movi_i64(TCGV128_HIGH(retv), 0);
+}
+
+static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
+                                TCGArg idx, MemOp memop, bool new_val,
+                                void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
+
+    memop = tcg_canonicalize_memop(memop, 0, 0);
+
+    tcg_gen_qemu_ld_i32(t1, addr, idx, memop);
+    tcg_gen_ext_i32(t2, val, memop);
+    gen(t2, t1, t2);
+    tcg_gen_qemu_st_i32(t2, addr, idx, memop);
+
+    tcg_gen_ext_i32(ret, (new_val ? t2 : t1), memop);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
+static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
+                             TCGArg idx, MemOp memop, void * const table[])
+{
+    gen_atomic_op_i32 gen;
+    MemOpIdx oi;
+
+    memop = tcg_canonicalize_memop(memop, 0, 0);
+
+    gen = table[memop & (MO_SIZE | MO_BSWAP)];
+    tcg_debug_assert(gen != NULL);
+
+    oi = make_memop_idx(memop & ~MO_SIGN, idx);
+    gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
+
+    if (memop & MO_SIGN) {
+        tcg_gen_ext_i32(ret, ret, memop);
+    }
+}
+
+static void do_nonatomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
+                                TCGArg idx, MemOp memop, bool new_val,
+                                void (*gen)(TCGv_i64, TCGv_i64, TCGv_i64))
+{
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
+
+    memop = tcg_canonicalize_memop(memop, 1, 0);
+
+    tcg_gen_qemu_ld_i64(t1, addr, idx, memop);
+    tcg_gen_ext_i64(t2, val, memop);
+    gen(t2, t1, t2);
+    tcg_gen_qemu_st_i64(t2, addr, idx, memop);
+
+    tcg_gen_ext_i64(ret, (new_val ? t2 : t1), memop);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+}
+
+static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
+                             TCGArg idx, MemOp memop, void * const table[])
+{
+    memop = tcg_canonicalize_memop(memop, 1, 0);
+
+    if ((memop & MO_SIZE) == MO_64) {
+#ifdef CONFIG_ATOMIC64
+        gen_atomic_op_i64 gen;
+        MemOpIdx oi;
+
+        gen = table[memop & (MO_SIZE | MO_BSWAP)];
+        tcg_debug_assert(gen != NULL);
+
+        oi = make_memop_idx(memop & ~MO_SIGN, idx);
+        gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
+#else
+        gen_helper_exit_atomic(cpu_env);
+        /* Produce a result, so that we have a well-formed opcode stream
+           with respect to uses of the result in the (dead) code following.  */
+        tcg_gen_movi_i64(ret, 0);
+#endif /* CONFIG_ATOMIC64 */
+    } else {
+        TCGv_i32 v32 = tcg_temp_ebb_new_i32();
+        TCGv_i32 r32 = tcg_temp_ebb_new_i32();
+
+        tcg_gen_extrl_i64_i32(v32, val);
+        do_atomic_op_i32(r32, addr, v32, idx, memop & ~MO_SIGN, table);
+        tcg_temp_free_i32(v32);
+
+        tcg_gen_extu_i32_i64(ret, r32);
+        tcg_temp_free_i32(r32);
+
+        if (memop & MO_SIGN) {
+            tcg_gen_ext_i64(ret, ret, memop);
+        }
+    }
+}
+
+#define GEN_ATOMIC_HELPER(NAME, OP, NEW)                                \
+static void * const table_##NAME[(MO_SIZE | MO_BSWAP) + 1] = {          \
+    [MO_8] = gen_helper_atomic_##NAME##b,                               \
+    [MO_16 | MO_LE] = gen_helper_atomic_##NAME##w_le,                   \
+    [MO_16 | MO_BE] = gen_helper_atomic_##NAME##w_be,                   \
+    [MO_32 | MO_LE] = gen_helper_atomic_##NAME##l_le,                   \
+    [MO_32 | MO_BE] = gen_helper_atomic_##NAME##l_be,                   \
+    WITH_ATOMIC64([MO_64 | MO_LE] = gen_helper_atomic_##NAME##q_le)     \
+    WITH_ATOMIC64([MO_64 | MO_BE] = gen_helper_atomic_##NAME##q_be)     \
+};                                                                      \
+void tcg_gen_atomic_##NAME##_i32                                        \
+    (TCGv_i32 ret, TCGv addr, TCGv_i32 val, TCGArg idx, MemOp memop)    \
+{                                                                       \
+    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {                        \
+        do_atomic_op_i32(ret, addr, val, idx, memop, table_##NAME);     \
+    } else {                                                            \
+        do_nonatomic_op_i32(ret, addr, val, idx, memop, NEW,            \
+                            tcg_gen_##OP##_i32);                        \
+    }                                                                   \
+}                                                                       \
+void tcg_gen_atomic_##NAME##_i64                                        \
+    (TCGv_i64 ret, TCGv addr, TCGv_i64 val, TCGArg idx, MemOp memop)    \
+{                                                                       \
+    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {                        \
+        do_atomic_op_i64(ret, addr, val, idx, memop, table_##NAME);     \
+    } else {                                                            \
+        do_nonatomic_op_i64(ret, addr, val, idx, memop, NEW,            \
+                            tcg_gen_##OP##_i64);                        \
+    }                                                                   \
+}
+
+GEN_ATOMIC_HELPER(fetch_add, add, 0)
+GEN_ATOMIC_HELPER(fetch_and, and, 0)
+GEN_ATOMIC_HELPER(fetch_or, or, 0)
+GEN_ATOMIC_HELPER(fetch_xor, xor, 0)
+GEN_ATOMIC_HELPER(fetch_smin, smin, 0)
+GEN_ATOMIC_HELPER(fetch_umin, umin, 0)
+GEN_ATOMIC_HELPER(fetch_smax, smax, 0)
+GEN_ATOMIC_HELPER(fetch_umax, umax, 0)
+
+GEN_ATOMIC_HELPER(add_fetch, add, 1)
+GEN_ATOMIC_HELPER(and_fetch, and, 1)
+GEN_ATOMIC_HELPER(or_fetch, or, 1)
+GEN_ATOMIC_HELPER(xor_fetch, xor, 1)
+GEN_ATOMIC_HELPER(smin_fetch, smin, 1)
+GEN_ATOMIC_HELPER(umin_fetch, umin, 1)
+GEN_ATOMIC_HELPER(smax_fetch, smax, 1)
+GEN_ATOMIC_HELPER(umax_fetch, umax, 1)
+
+static void tcg_gen_mov2_i32(TCGv_i32 r, TCGv_i32 a, TCGv_i32 b)
+{
+    tcg_gen_mov_i32(r, b);
+}
+
+static void tcg_gen_mov2_i64(TCGv_i64 r, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_mov_i64(r, b);
+}
+
+GEN_ATOMIC_HELPER(xchg, mov2, 0)
+
+#undef GEN_ATOMIC_HELPER
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 06d3181fd0..edbd1c61d7 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -27,7 +27,6 @@
 #include "tcg/tcg.h"
 #include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op.h"
-#include "tcg/tcg-mo.h"
 #include "exec/plugin-gen.h"
 #include "tcg-internal.h"
 
@@ -2841,987 +2840,3 @@ void tcg_gen_lookup_and_goto_ptr(void)
     tcg_gen_op1i(INDEX_op_goto_ptr, tcgv_ptr_arg(ptr));
     tcg_temp_free_ptr(ptr);
 }
-
-static inline MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
-{
-    /* Trigger the asserts within as early as possible.  */
-    unsigned a_bits = get_alignment_bits(op);
-
-    /* Prefer MO_ALIGN+MO_XX over MO_ALIGN_XX+MO_XX */
-    if (a_bits == (op & MO_SIZE)) {
-        op = (op & ~MO_AMASK) | MO_ALIGN;
-    }
-
-    switch (op & MO_SIZE) {
-    case MO_8:
-        op &= ~MO_BSWAP;
-        break;
-    case MO_16:
-        break;
-    case MO_32:
-        if (!is64) {
-            op &= ~MO_SIGN;
-        }
-        break;
-    case MO_64:
-        if (is64) {
-            op &= ~MO_SIGN;
-            break;
-        }
-        /* fall through */
-    default:
-        g_assert_not_reached();
-    }
-    if (st) {
-        op &= ~MO_SIGN;
-    }
-    return op;
-}
-
-static void gen_ldst_i32(TCGOpcode opc, TCGv_i32 val, TCGv addr,
-                         MemOp memop, TCGArg idx)
-{
-    MemOpIdx oi = make_memop_idx(memop, idx);
-#if TARGET_LONG_BITS == 32
-    tcg_gen_op3i_i32(opc, val, addr, oi);
-#else
-    if (TCG_TARGET_REG_BITS == 32) {
-        tcg_gen_op4i_i32(opc, val, TCGV_LOW(addr), TCGV_HIGH(addr), oi);
-    } else {
-        tcg_gen_op3(opc, tcgv_i32_arg(val), tcgv_i64_arg(addr), oi);
-    }
-#endif
-}
-
-static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
-                         MemOp memop, TCGArg idx)
-{
-    MemOpIdx oi = make_memop_idx(memop, idx);
-#if TARGET_LONG_BITS == 32
-    if (TCG_TARGET_REG_BITS == 32) {
-        tcg_gen_op4i_i32(opc, TCGV_LOW(val), TCGV_HIGH(val), addr, oi);
-    } else {
-        tcg_gen_op3(opc, tcgv_i64_arg(val), tcgv_i32_arg(addr), oi);
-    }
-#else
-    if (TCG_TARGET_REG_BITS == 32) {
-        tcg_gen_op5i_i32(opc, TCGV_LOW(val), TCGV_HIGH(val),
-                         TCGV_LOW(addr), TCGV_HIGH(addr), oi);
-    } else {
-        tcg_gen_op3i_i64(opc, val, addr, oi);
-    }
-#endif
-}
-
-static void tcg_gen_req_mo(TCGBar type)
-{
-#ifdef TCG_GUEST_DEFAULT_MO
-    type &= TCG_GUEST_DEFAULT_MO;
-#endif
-    type &= ~TCG_TARGET_DEFAULT_MO;
-    if (type) {
-        tcg_gen_mb(type | TCG_BAR_SC);
-    }
-}
-
-static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
-{
-#ifdef CONFIG_PLUGIN
-    if (tcg_ctx->plugin_insn != NULL) {
-        /* Save a copy of the vaddr for use after a load.  */
-        TCGv temp = tcg_temp_new();
-        tcg_gen_mov_tl(temp, vaddr);
-        return temp;
-    }
-#endif
-    return vaddr;
-}
-
-static void plugin_gen_mem_callbacks(TCGv vaddr, MemOpIdx oi,
-                                     enum qemu_plugin_mem_rw rw)
-{
-#ifdef CONFIG_PLUGIN
-    if (tcg_ctx->plugin_insn != NULL) {
-        qemu_plugin_meminfo_t info = make_plugin_meminfo(oi, rw);
-        plugin_gen_empty_mem_callback(vaddr, info);
-        tcg_temp_free(vaddr);
-    }
-#endif
-}
-
-void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
-{
-    MemOp orig_memop;
-    MemOpIdx oi;
-
-    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
-    memop = tcg_canonicalize_memop(memop, 0, 0);
-    oi = make_memop_idx(memop, idx);
-
-    orig_memop = memop;
-    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
-        memop &= ~MO_BSWAP;
-        /* The bswap primitive benefits from zero-extended input.  */
-        if ((memop & MO_SSIZE) == MO_SW) {
-            memop &= ~MO_SIGN;
-        }
-    }
-
-    addr = plugin_prep_mem_callbacks(addr);
-    gen_ldst_i32(INDEX_op_qemu_ld_i32, val, addr, memop, idx);
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
-
-    if ((orig_memop ^ memop) & MO_BSWAP) {
-        switch (orig_memop & MO_SIZE) {
-        case MO_16:
-            tcg_gen_bswap16_i32(val, val, (orig_memop & MO_SIGN
-                                           ? TCG_BSWAP_IZ | TCG_BSWAP_OS
-                                           : TCG_BSWAP_IZ | TCG_BSWAP_OZ));
-            break;
-        case MO_32:
-            tcg_gen_bswap32_i32(val, val);
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    }
-}
-
-void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
-{
-    TCGv_i32 swap = NULL;
-    MemOpIdx oi;
-
-    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
-    memop = tcg_canonicalize_memop(memop, 0, 1);
-    oi = make_memop_idx(memop, idx);
-
-    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
-        swap = tcg_temp_ebb_new_i32();
-        switch (memop & MO_SIZE) {
-        case MO_16:
-            tcg_gen_bswap16_i32(swap, val, 0);
-            break;
-        case MO_32:
-            tcg_gen_bswap32_i32(swap, val);
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        val = swap;
-        memop &= ~MO_BSWAP;
-    }
-
-    addr = plugin_prep_mem_callbacks(addr);
-    if (TCG_TARGET_HAS_qemu_st8_i32 && (memop & MO_SIZE) == MO_8) {
-        gen_ldst_i32(INDEX_op_qemu_st8_i32, val, addr, memop, idx);
-    } else {
-        gen_ldst_i32(INDEX_op_qemu_st_i32, val, addr, memop, idx);
-    }
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
-
-    if (swap) {
-        tcg_temp_free_i32(swap);
-    }
-}
-
-void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
-{
-    MemOp orig_memop;
-    MemOpIdx oi;
-
-    if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
-        tcg_gen_qemu_ld_i32(TCGV_LOW(val), addr, idx, memop);
-        if (memop & MO_SIGN) {
-            tcg_gen_sari_i32(TCGV_HIGH(val), TCGV_LOW(val), 31);
-        } else {
-            tcg_gen_movi_i32(TCGV_HIGH(val), 0);
-        }
-        return;
-    }
-
-    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
-    memop = tcg_canonicalize_memop(memop, 1, 0);
-    oi = make_memop_idx(memop, idx);
-
-    orig_memop = memop;
-    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
-        memop &= ~MO_BSWAP;
-        /* The bswap primitive benefits from zero-extended input.  */
-        if ((memop & MO_SIGN) && (memop & MO_SIZE) < MO_64) {
-            memop &= ~MO_SIGN;
-        }
-    }
-
-    addr = plugin_prep_mem_callbacks(addr);
-    gen_ldst_i64(INDEX_op_qemu_ld_i64, val, addr, memop, idx);
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
-
-    if ((orig_memop ^ memop) & MO_BSWAP) {
-        int flags = (orig_memop & MO_SIGN
-                     ? TCG_BSWAP_IZ | TCG_BSWAP_OS
-                     : TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        switch (orig_memop & MO_SIZE) {
-        case MO_16:
-            tcg_gen_bswap16_i64(val, val, flags);
-            break;
-        case MO_32:
-            tcg_gen_bswap32_i64(val, val, flags);
-            break;
-        case MO_64:
-            tcg_gen_bswap64_i64(val, val);
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    }
-}
-
-void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
-{
-    TCGv_i64 swap = NULL;
-    MemOpIdx oi;
-
-    if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
-        tcg_gen_qemu_st_i32(TCGV_LOW(val), addr, idx, memop);
-        return;
-    }
-
-    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
-    memop = tcg_canonicalize_memop(memop, 1, 1);
-    oi = make_memop_idx(memop, idx);
-
-    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
-        swap = tcg_temp_ebb_new_i64();
-        switch (memop & MO_SIZE) {
-        case MO_16:
-            tcg_gen_bswap16_i64(swap, val, 0);
-            break;
-        case MO_32:
-            tcg_gen_bswap32_i64(swap, val, 0);
-            break;
-        case MO_64:
-            tcg_gen_bswap64_i64(swap, val);
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        val = swap;
-        memop &= ~MO_BSWAP;
-    }
-
-    addr = plugin_prep_mem_callbacks(addr);
-    gen_ldst_i64(INDEX_op_qemu_st_i64, val, addr, memop, idx);
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
-
-    if (swap) {
-        tcg_temp_free_i64(swap);
-    }
-}
-
-/*
- * Return true if @mop, without knowledge of the pointer alignment,
- * does not require 16-byte atomicity, and it would be adventagous
- * to avoid a call to a helper function.
- */
-static bool use_two_i64_for_i128(MemOp mop)
-{
-#ifdef CONFIG_SOFTMMU
-    /* Two softmmu tlb lookups is larger than one function call. */
-    return false;
-#else
-    /*
-     * For user-only, two 64-bit operations may well be smaller than a call.
-     * Determine if that would be legal for the requested atomicity.
-     */
-    MemOp atom = mop & MO_ATOM_MASK;
-    MemOp atmax = mop & MO_ATMAX_MASK;
-
-    /* In a serialized context, no atomicity is required. */
-    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
-        return true;
-    }
-
-    if (atmax == MO_ATMAX_SIZE) {
-        atmax = mop & MO_SIZE;
-    } else {
-        atmax >>= MO_ATMAX_SHIFT;
-    }
-    switch (atom) {
-    case MO_ATOM_NONE:
-        return true;
-    case MO_ATOM_IFALIGN:
-    case MO_ATOM_SUBALIGN:
-        return atmax < MO_128;
-    case MO_ATOM_WITHIN16:
-        return atmax == MO_8;
-    default:
-        g_assert_not_reached();
-    }
-#endif
-}
-
-static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
-{
-    MemOp mop_1 = orig, mop_2;
-
-    tcg_debug_assert((orig & MO_SIZE) == MO_128);
-    tcg_debug_assert((orig & MO_SIGN) == 0);
-
-    /* Reduce the size to 64-bit. */
-    mop_1 = (mop_1 & ~MO_SIZE) | MO_64;
-
-    /* Retain the alignment constraints of the original. */
-    switch (orig & MO_AMASK) {
-    case MO_UNALN:
-    case MO_ALIGN_2:
-    case MO_ALIGN_4:
-        mop_2 = mop_1;
-        break;
-    case MO_ALIGN_8:
-        /* Prefer MO_ALIGN+MO_64 to MO_ALIGN_8+MO_64. */
-        mop_1 = (mop_1 & ~MO_AMASK) | MO_ALIGN;
-        mop_2 = mop_1;
-        break;
-    case MO_ALIGN:
-        /* Second has 8-byte alignment; first has 16-byte alignment. */
-        mop_2 = mop_1;
-        mop_1 = (mop_1 & ~MO_AMASK) | MO_ALIGN_16;
-        break;
-    case MO_ALIGN_16:
-    case MO_ALIGN_32:
-    case MO_ALIGN_64:
-        /* Second has 8-byte alignment; first retains original. */
-        mop_2 = (mop_1 & ~MO_AMASK) | MO_ALIGN;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    /* Use a memory ordering implemented by the host. */
-    if ((orig & MO_BSWAP) && !tcg_target_has_memory_bswap(mop_1)) {
-        mop_1 &= ~MO_BSWAP;
-        mop_2 &= ~MO_BSWAP;
-    }
-
-    ret[0] = mop_1;
-    ret[1] = mop_2;
-}
-
-#if TARGET_LONG_BITS == 64
-#define tcg_temp_ebb_new  tcg_temp_ebb_new_i64
-#else
-#define tcg_temp_ebb_new  tcg_temp_ebb_new_i32
-#endif
-
-void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
-{
-    const MemOpIdx oi = make_memop_idx(memop, idx);
-
-    tcg_debug_assert((memop & MO_SIZE) == MO_128);
-    tcg_debug_assert((memop & MO_SIGN) == 0);
-
-    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
-    addr = plugin_prep_mem_callbacks(addr);
-
-    /* TODO: For now, force 32-bit hosts to use the helper. */
-    if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
-        TCGv_i64 lo, hi;
-        TCGArg addr_arg;
-        MemOpIdx adj_oi;
-        bool need_bswap = false;
-
-        if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
-            lo = TCGV128_HIGH(val);
-            hi = TCGV128_LOW(val);
-            adj_oi = make_memop_idx(memop & ~MO_BSWAP, idx);
-            need_bswap = true;
-        } else {
-            lo = TCGV128_LOW(val);
-            hi = TCGV128_HIGH(val);
-            adj_oi = oi;
-        }
-
-#if TARGET_LONG_BITS == 32
-        addr_arg = tcgv_i32_arg(addr);
-#else
-        addr_arg = tcgv_i64_arg(addr);
-#endif
-        tcg_gen_op4ii_i64(INDEX_op_qemu_ld_i128, lo, hi, addr_arg, adj_oi);
-
-        if (need_bswap) {
-            tcg_gen_bswap64_i64(lo, lo);
-            tcg_gen_bswap64_i64(hi, hi);
-        }
-    } else if (use_two_i64_for_i128(memop)) {
-        MemOp mop[2];
-        TCGv addr_p8;
-        TCGv_i64 x, y;
-
-        canonicalize_memop_i128_as_i64(mop, memop);
-
-        /*
-         * Since there are no global TCGv_i128, there is no visible state
-         * changed if the second load faults.  Load directly into the two
-         * subwords.
-         */
-        if ((memop & MO_BSWAP) == MO_LE) {
-            x = TCGV128_LOW(val);
-            y = TCGV128_HIGH(val);
-        } else {
-            x = TCGV128_HIGH(val);
-            y = TCGV128_LOW(val);
-        }
-
-        gen_ldst_i64(INDEX_op_qemu_ld_i64, x, addr, mop[0], idx);
-
-        if ((mop[0] ^ memop) & MO_BSWAP) {
-            tcg_gen_bswap64_i64(x, x);
-        }
-
-        addr_p8 = tcg_temp_ebb_new();
-        tcg_gen_addi_tl(addr_p8, addr, 8);
-        gen_ldst_i64(INDEX_op_qemu_ld_i64, y, addr_p8, mop[1], idx);
-        tcg_temp_free(addr_p8);
-
-        if ((mop[0] ^ memop) & MO_BSWAP) {
-            tcg_gen_bswap64_i64(y, y);
-        }
-    } else {
-        gen_helper_ld_i128(val, cpu_env, addr, tcg_constant_i32(oi));
-    }
-
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
-}
-
-void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
-{
-    const MemOpIdx oi = make_memop_idx(memop, idx);
-
-    tcg_debug_assert((memop & MO_SIZE) == MO_128);
-    tcg_debug_assert((memop & MO_SIGN) == 0);
-
-    tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
-    addr = plugin_prep_mem_callbacks(addr);
-
-    /* TODO: For now, force 32-bit hosts to use the helper. */
-
-    if (TCG_TARGET_HAS_qemu_ldst_i128 && TCG_TARGET_REG_BITS == 64) {
-        TCGv_i64 lo, hi;
-        TCGArg addr_arg;
-        MemOpIdx adj_oi;
-        bool need_bswap = false;
-
-        if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
-            lo = tcg_temp_new_i64();
-            hi = tcg_temp_new_i64();
-            tcg_gen_bswap64_i64(lo, TCGV128_HIGH(val));
-            tcg_gen_bswap64_i64(hi, TCGV128_LOW(val));
-            adj_oi = make_memop_idx(memop & ~MO_BSWAP, idx);
-            need_bswap = true;
-        } else {
-            lo = TCGV128_LOW(val);
-            hi = TCGV128_HIGH(val);
-            adj_oi = oi;
-        }
-
-#if TARGET_LONG_BITS == 32
-        addr_arg = tcgv_i32_arg(addr);
-#else
-        addr_arg = tcgv_i64_arg(addr);
-#endif
-        tcg_gen_op4ii_i64(INDEX_op_qemu_st_i128, lo, hi, addr_arg, adj_oi);
-
-        if (need_bswap) {
-            tcg_temp_free_i64(lo);
-            tcg_temp_free_i64(hi);
-        }
-    } else if (use_two_i64_for_i128(memop)) {
-        MemOp mop[2];
-        TCGv addr_p8;
-        TCGv_i64 x, y;
-
-        canonicalize_memop_i128_as_i64(mop, memop);
-
-        if ((memop & MO_BSWAP) == MO_LE) {
-            x = TCGV128_LOW(val);
-            y = TCGV128_HIGH(val);
-        } else {
-            x = TCGV128_HIGH(val);
-            y = TCGV128_LOW(val);
-        }
-
-        addr_p8 = tcg_temp_ebb_new();
-        if ((mop[0] ^ memop) & MO_BSWAP) {
-            TCGv_i64 t = tcg_temp_ebb_new_i64();
-
-            tcg_gen_bswap64_i64(t, x);
-            gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr, mop[0], idx);
-            tcg_gen_bswap64_i64(t, y);
-            tcg_gen_addi_tl(addr_p8, addr, 8);
-            gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr_p8, mop[1], idx);
-            tcg_temp_free_i64(t);
-        } else {
-            gen_ldst_i64(INDEX_op_qemu_st_i64, x, addr, mop[0], idx);
-            tcg_gen_addi_tl(addr_p8, addr, 8);
-            gen_ldst_i64(INDEX_op_qemu_st_i64, y, addr_p8, mop[1], idx);
-        }
-        tcg_temp_free(addr_p8);
-    } else {
-        gen_helper_st_i128(cpu_env, addr, val, tcg_constant_i32(oi));
-    }
-
-    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, MemOp opc)
-{
-    switch (opc & MO_SSIZE) {
-    case MO_SB:
-        tcg_gen_ext8s_i32(ret, val);
-        break;
-    case MO_UB:
-        tcg_gen_ext8u_i32(ret, val);
-        break;
-    case MO_SW:
-        tcg_gen_ext16s_i32(ret, val);
-        break;
-    case MO_UW:
-        tcg_gen_ext16u_i32(ret, val);
-        break;
-    default:
-        tcg_gen_mov_i32(ret, val);
-        break;
-    }
-}
-
-static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, MemOp opc)
-{
-    switch (opc & MO_SSIZE) {
-    case MO_SB:
-        tcg_gen_ext8s_i64(ret, val);
-        break;
-    case MO_UB:
-        tcg_gen_ext8u_i64(ret, val);
-        break;
-    case MO_SW:
-        tcg_gen_ext16s_i64(ret, val);
-        break;
-    case MO_UW:
-        tcg_gen_ext16u_i64(ret, val);
-        break;
-    case MO_SL:
-        tcg_gen_ext32s_i64(ret, val);
-        break;
-    case MO_UL:
-        tcg_gen_ext32u_i64(ret, val);
-        break;
-    default:
-        tcg_gen_mov_i64(ret, val);
-        break;
-    }
-}
-
-typedef void (*gen_atomic_cx_i32)(TCGv_i32, TCGv_env, TCGv,
-                                  TCGv_i32, TCGv_i32, TCGv_i32);
-typedef void (*gen_atomic_cx_i64)(TCGv_i64, TCGv_env, TCGv,
-                                  TCGv_i64, TCGv_i64, TCGv_i32);
-typedef void (*gen_atomic_cx_i128)(TCGv_i128, TCGv_env, TCGv,
-                                   TCGv_i128, TCGv_i128, TCGv_i32);
-typedef void (*gen_atomic_op_i32)(TCGv_i32, TCGv_env, TCGv,
-                                  TCGv_i32, TCGv_i32);
-typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
-                                  TCGv_i64, TCGv_i32);
-
-#ifdef CONFIG_ATOMIC64
-# define WITH_ATOMIC64(X) X,
-#else
-# define WITH_ATOMIC64(X)
-#endif
-#ifdef CONFIG_CMPXCHG128
-# define WITH_ATOMIC128(X) X,
-#else
-# define WITH_ATOMIC128(X)
-#endif
-
-static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_8] = gen_helper_atomic_cmpxchgb,
-    [MO_16 | MO_LE] = gen_helper_atomic_cmpxchgw_le,
-    [MO_16 | MO_BE] = gen_helper_atomic_cmpxchgw_be,
-    [MO_32 | MO_LE] = gen_helper_atomic_cmpxchgl_le,
-    [MO_32 | MO_BE] = gen_helper_atomic_cmpxchgl_be,
-    WITH_ATOMIC64([MO_64 | MO_LE] = gen_helper_atomic_cmpxchgq_le)
-    WITH_ATOMIC64([MO_64 | MO_BE] = gen_helper_atomic_cmpxchgq_be)
-    WITH_ATOMIC128([MO_128 | MO_LE] = gen_helper_atomic_cmpxchgo_le)
-    WITH_ATOMIC128([MO_128 | MO_BE] = gen_helper_atomic_cmpxchgo_be)
-};
-
-void tcg_gen_nonatomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
-                                   TCGv_i32 newv, TCGArg idx, MemOp memop)
-{
-    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
-    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
-
-    tcg_gen_ext_i32(t2, cmpv, memop & MO_SIZE);
-
-    tcg_gen_qemu_ld_i32(t1, addr, idx, memop & ~MO_SIGN);
-    tcg_gen_movcond_i32(TCG_COND_EQ, t2, t1, t2, newv, t1);
-    tcg_gen_qemu_st_i32(t2, addr, idx, memop);
-    tcg_temp_free_i32(t2);
-
-    if (memop & MO_SIGN) {
-        tcg_gen_ext_i32(retv, t1, memop);
-    } else {
-        tcg_gen_mov_i32(retv, t1);
-    }
-    tcg_temp_free_i32(t1);
-}
-
-void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
-                                TCGv_i32 newv, TCGArg idx, MemOp memop)
-{
-    gen_atomic_cx_i32 gen;
-    MemOpIdx oi;
-
-    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
-        tcg_gen_nonatomic_cmpxchg_i32(retv, addr, cmpv, newv, idx, memop);
-        return;
-    }
-
-    memop = tcg_canonicalize_memop(memop, 0, 0);
-    gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
-    tcg_debug_assert(gen != NULL);
-
-    oi = make_memop_idx(memop & ~MO_SIGN, idx);
-    gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
-
-    if (memop & MO_SIGN) {
-        tcg_gen_ext_i32(retv, retv, memop);
-    }
-}
-
-void tcg_gen_nonatomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
-                                   TCGv_i64 newv, TCGArg idx, MemOp memop)
-{
-    TCGv_i64 t1, t2;
-
-    if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
-        tcg_gen_nonatomic_cmpxchg_i32(TCGV_LOW(retv), addr, TCGV_LOW(cmpv),
-                                      TCGV_LOW(newv), idx, memop);
-        if (memop & MO_SIGN) {
-            tcg_gen_sari_i32(TCGV_HIGH(retv), TCGV_LOW(retv), 31);
-        } else {
-            tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
-        }
-        return;
-    }
-
-    t1 = tcg_temp_ebb_new_i64();
-    t2 = tcg_temp_ebb_new_i64();
-
-    tcg_gen_ext_i64(t2, cmpv, memop & MO_SIZE);
-
-    tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
-    tcg_gen_movcond_i64(TCG_COND_EQ, t2, t1, t2, newv, t1);
-    tcg_gen_qemu_st_i64(t2, addr, idx, memop);
-    tcg_temp_free_i64(t2);
-
-    if (memop & MO_SIGN) {
-        tcg_gen_ext_i64(retv, t1, memop);
-    } else {
-        tcg_gen_mov_i64(retv, t1);
-    }
-    tcg_temp_free_i64(t1);
-}
-
-void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
-                                TCGv_i64 newv, TCGArg idx, MemOp memop)
-{
-    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
-        tcg_gen_nonatomic_cmpxchg_i64(retv, addr, cmpv, newv, idx, memop);
-        return;
-    }
-
-    if ((memop & MO_SIZE) == MO_64) {
-        gen_atomic_cx_i64 gen;
-
-        memop = tcg_canonicalize_memop(memop, 1, 0);
-        gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
-        if (gen) {
-            MemOpIdx oi = make_memop_idx(memop, idx);
-            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
-            return;
-        }
-
-        gen_helper_exit_atomic(cpu_env);
-
-        /*
-         * Produce a result for a well-formed opcode stream.  This satisfies
-         * liveness for set before used, which happens before this dead code
-         * is removed.
-         */
-        tcg_gen_movi_i64(retv, 0);
-        return;
-    }
-
-    if (TCG_TARGET_REG_BITS == 32) {
-        tcg_gen_atomic_cmpxchg_i32(TCGV_LOW(retv), addr, TCGV_LOW(cmpv),
-                                   TCGV_LOW(newv), idx, memop);
-        if (memop & MO_SIGN) {
-            tcg_gen_sari_i32(TCGV_HIGH(retv), TCGV_LOW(retv), 31);
-        } else {
-            tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
-        }
-    } else {
-        TCGv_i32 c32 = tcg_temp_ebb_new_i32();
-        TCGv_i32 n32 = tcg_temp_ebb_new_i32();
-        TCGv_i32 r32 = tcg_temp_ebb_new_i32();
-
-        tcg_gen_extrl_i64_i32(c32, cmpv);
-        tcg_gen_extrl_i64_i32(n32, newv);
-        tcg_gen_atomic_cmpxchg_i32(r32, addr, c32, n32, idx, memop & ~MO_SIGN);
-        tcg_temp_free_i32(c32);
-        tcg_temp_free_i32(n32);
-
-        tcg_gen_extu_i32_i64(retv, r32);
-        tcg_temp_free_i32(r32);
-
-        if (memop & MO_SIGN) {
-            tcg_gen_ext_i64(retv, retv, memop);
-        }
-    }
-}
-
-void tcg_gen_nonatomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
-                                    TCGv_i128 newv, TCGArg idx, MemOp memop)
-{
-    if (TCG_TARGET_REG_BITS == 32) {
-        /* Inline expansion below is simply too large for 32-bit hosts. */
-        gen_atomic_cx_i128 gen = ((memop & MO_BSWAP) == MO_LE
-                                  ? gen_helper_nonatomic_cmpxchgo_le 
-                                  : gen_helper_nonatomic_cmpxchgo_be);
-        MemOpIdx oi = make_memop_idx(memop, idx);
-
-        tcg_debug_assert((memop & MO_SIZE) == MO_128);
-        tcg_debug_assert((memop & MO_SIGN) == 0);
-
-        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
-    } else {
-        TCGv_i128 oldv = tcg_temp_ebb_new_i128();
-        TCGv_i128 tmpv = tcg_temp_ebb_new_i128();
-        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
-        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
-        TCGv_i64 z = tcg_constant_i64(0);
-
-        tcg_gen_qemu_ld_i128(oldv, addr, idx, memop);
-
-        /* Compare i128 */
-        tcg_gen_xor_i64(t0, TCGV128_LOW(oldv), TCGV128_LOW(cmpv));
-        tcg_gen_xor_i64(t1, TCGV128_HIGH(oldv), TCGV128_HIGH(cmpv));
-        tcg_gen_or_i64(t0, t0, t1);
-
-        /* tmpv = equal ? newv : oldv */
-        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_LOW(tmpv), t0, z,
-                            TCGV128_LOW(newv), TCGV128_LOW(oldv));
-        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_HIGH(tmpv), t0, z,
-                            TCGV128_HIGH(newv), TCGV128_HIGH(oldv));
-
-        /* Unconditional writeback. */
-        tcg_gen_qemu_st_i128(tmpv, addr, idx, memop);
-        tcg_gen_mov_i128(retv, oldv);
-
-        tcg_temp_free_i64(t0);
-        tcg_temp_free_i64(t1);
-        tcg_temp_free_i128(tmpv);
-        tcg_temp_free_i128(oldv);
-    }
-}
-
-void tcg_gen_atomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
-                                 TCGv_i128 newv, TCGArg idx, MemOp memop)
-{
-    gen_atomic_cx_i128 gen;
-
-    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
-        tcg_gen_nonatomic_cmpxchg_i128(retv, addr, cmpv, newv, idx, memop);
-        return;
-    }
-
-    tcg_debug_assert((memop & MO_SIZE) == MO_128);
-    tcg_debug_assert((memop & MO_SIGN) == 0);
-    gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
-
-    if (gen) {
-        MemOpIdx oi = make_memop_idx(memop, idx);
-        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
-        return;
-    }
-
-    gen_helper_exit_atomic(cpu_env);
-
-    /*
-     * Produce a result for a well-formed opcode stream.  This satisfies
-     * liveness for set before used, which happens before this dead code
-     * is removed.
-     */
-    tcg_gen_movi_i64(TCGV128_LOW(retv), 0);
-    tcg_gen_movi_i64(TCGV128_HIGH(retv), 0);
-}
-
-static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
-                                TCGArg idx, MemOp memop, bool new_val,
-                                void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32))
-{
-    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
-    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
-
-    memop = tcg_canonicalize_memop(memop, 0, 0);
-
-    tcg_gen_qemu_ld_i32(t1, addr, idx, memop);
-    tcg_gen_ext_i32(t2, val, memop);
-    gen(t2, t1, t2);
-    tcg_gen_qemu_st_i32(t2, addr, idx, memop);
-
-    tcg_gen_ext_i32(ret, (new_val ? t2 : t1), memop);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-}
-
-static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
-                             TCGArg idx, MemOp memop, void * const table[])
-{
-    gen_atomic_op_i32 gen;
-    MemOpIdx oi;
-
-    memop = tcg_canonicalize_memop(memop, 0, 0);
-
-    gen = table[memop & (MO_SIZE | MO_BSWAP)];
-    tcg_debug_assert(gen != NULL);
-
-    oi = make_memop_idx(memop & ~MO_SIGN, idx);
-    gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
-
-    if (memop & MO_SIGN) {
-        tcg_gen_ext_i32(ret, ret, memop);
-    }
-}
-
-static void do_nonatomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
-                                TCGArg idx, MemOp memop, bool new_val,
-                                void (*gen)(TCGv_i64, TCGv_i64, TCGv_i64))
-{
-    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
-    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
-
-    memop = tcg_canonicalize_memop(memop, 1, 0);
-
-    tcg_gen_qemu_ld_i64(t1, addr, idx, memop);
-    tcg_gen_ext_i64(t2, val, memop);
-    gen(t2, t1, t2);
-    tcg_gen_qemu_st_i64(t2, addr, idx, memop);
-
-    tcg_gen_ext_i64(ret, (new_val ? t2 : t1), memop);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-}
-
-static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
-                             TCGArg idx, MemOp memop, void * const table[])
-{
-    memop = tcg_canonicalize_memop(memop, 1, 0);
-
-    if ((memop & MO_SIZE) == MO_64) {
-#ifdef CONFIG_ATOMIC64
-        gen_atomic_op_i64 gen;
-        MemOpIdx oi;
-
-        gen = table[memop & (MO_SIZE | MO_BSWAP)];
-        tcg_debug_assert(gen != NULL);
-
-        oi = make_memop_idx(memop & ~MO_SIGN, idx);
-        gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
-#else
-        gen_helper_exit_atomic(cpu_env);
-        /* Produce a result, so that we have a well-formed opcode stream
-           with respect to uses of the result in the (dead) code following.  */
-        tcg_gen_movi_i64(ret, 0);
-#endif /* CONFIG_ATOMIC64 */
-    } else {
-        TCGv_i32 v32 = tcg_temp_ebb_new_i32();
-        TCGv_i32 r32 = tcg_temp_ebb_new_i32();
-
-        tcg_gen_extrl_i64_i32(v32, val);
-        do_atomic_op_i32(r32, addr, v32, idx, memop & ~MO_SIGN, table);
-        tcg_temp_free_i32(v32);
-
-        tcg_gen_extu_i32_i64(ret, r32);
-        tcg_temp_free_i32(r32);
-
-        if (memop & MO_SIGN) {
-            tcg_gen_ext_i64(ret, ret, memop);
-        }
-    }
-}
-
-#define GEN_ATOMIC_HELPER(NAME, OP, NEW)                                \
-static void * const table_##NAME[(MO_SIZE | MO_BSWAP) + 1] = {          \
-    [MO_8] = gen_helper_atomic_##NAME##b,                               \
-    [MO_16 | MO_LE] = gen_helper_atomic_##NAME##w_le,                   \
-    [MO_16 | MO_BE] = gen_helper_atomic_##NAME##w_be,                   \
-    [MO_32 | MO_LE] = gen_helper_atomic_##NAME##l_le,                   \
-    [MO_32 | MO_BE] = gen_helper_atomic_##NAME##l_be,                   \
-    WITH_ATOMIC64([MO_64 | MO_LE] = gen_helper_atomic_##NAME##q_le)     \
-    WITH_ATOMIC64([MO_64 | MO_BE] = gen_helper_atomic_##NAME##q_be)     \
-};                                                                      \
-void tcg_gen_atomic_##NAME##_i32                                        \
-    (TCGv_i32 ret, TCGv addr, TCGv_i32 val, TCGArg idx, MemOp memop)    \
-{                                                                       \
-    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {                        \
-        do_atomic_op_i32(ret, addr, val, idx, memop, table_##NAME);     \
-    } else {                                                            \
-        do_nonatomic_op_i32(ret, addr, val, idx, memop, NEW,            \
-                            tcg_gen_##OP##_i32);                        \
-    }                                                                   \
-}                                                                       \
-void tcg_gen_atomic_##NAME##_i64                                        \
-    (TCGv_i64 ret, TCGv addr, TCGv_i64 val, TCGArg idx, MemOp memop)    \
-{                                                                       \
-    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {                        \
-        do_atomic_op_i64(ret, addr, val, idx, memop, table_##NAME);     \
-    } else {                                                            \
-        do_nonatomic_op_i64(ret, addr, val, idx, memop, NEW,            \
-                            tcg_gen_##OP##_i64);                        \
-    }                                                                   \
-}
-
-GEN_ATOMIC_HELPER(fetch_add, add, 0)
-GEN_ATOMIC_HELPER(fetch_and, and, 0)
-GEN_ATOMIC_HELPER(fetch_or, or, 0)
-GEN_ATOMIC_HELPER(fetch_xor, xor, 0)
-GEN_ATOMIC_HELPER(fetch_smin, smin, 0)
-GEN_ATOMIC_HELPER(fetch_umin, umin, 0)
-GEN_ATOMIC_HELPER(fetch_smax, smax, 0)
-GEN_ATOMIC_HELPER(fetch_umax, umax, 0)
-
-GEN_ATOMIC_HELPER(add_fetch, add, 1)
-GEN_ATOMIC_HELPER(and_fetch, and, 1)
-GEN_ATOMIC_HELPER(or_fetch, or, 1)
-GEN_ATOMIC_HELPER(xor_fetch, xor, 1)
-GEN_ATOMIC_HELPER(smin_fetch, smin, 1)
-GEN_ATOMIC_HELPER(umin_fetch, umin, 1)
-GEN_ATOMIC_HELPER(smax_fetch, smax, 1)
-GEN_ATOMIC_HELPER(umax_fetch, umax, 1)
-
-static void tcg_gen_mov2_i32(TCGv_i32 r, TCGv_i32 a, TCGv_i32 b)
-{
-    tcg_gen_mov_i32(r, b);
-}
-
-static void tcg_gen_mov2_i64(TCGv_i64 r, TCGv_i64 a, TCGv_i64 b)
-{
-    tcg_gen_mov_i64(r, b);
-}
-
-GEN_ATOMIC_HELPER(xchg, mov2, 0)
-
-#undef GEN_ATOMIC_HELPER
diff --git a/tcg/meson.build b/tcg/meson.build
index c4c63b19d4..f56c465f4d 100644
--- a/tcg/meson.build
+++ b/tcg/meson.build
@@ -6,6 +6,7 @@ tcg_ss.add(files(
   'tcg.c',
   'tcg-common.c',
   'tcg-op.c',
+  'tcg-op-ldst.c',
   'tcg-op-gvec.c',
   'tcg-op-vec.c',
 ))
-- 
2.34.1


