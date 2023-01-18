Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C978E670FA6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 02:12:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwzS-0002BP-GJ; Tue, 17 Jan 2023 20:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzQ-0002Au-H2
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:44 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzO-0002Fv-OK
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:44 -0500
Received: by mail-pl1-x631.google.com with SMTP id d9so35315880pll.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 17:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytAJL1IPjLRLHB3vJNA4P2zaPkmMQ8wgfVfWBQ9Mma4=;
 b=KOb1kpEm2GplxDBXYq6B8uP0gY1w0nXw/C6X3A9FUahCjK0YPyRuq7C997NyJJGOxi
 xMKOmWfsOCdSWAW8uxCD16zHsCG1AlGEPHW1nV3H5EBAE8f0ZQlGLfEiVcBJTvknPzPp
 wT4oOXlHY+H8JiJtGbio9nAZA45/IGJizrSCQz5cSHMmy+os+WYptacIii7IdQ2PEbpR
 VkaitHwz6pJhj1IahiHjyKBQAL45ZPCpKk0/xAcD3TbZU1smDFBbXsNxQaIAtTp7sIm1
 JivnqvvkN9+dU7/tpygJIIowZUXiy7dWX7N/87k/w+D/n9BrBMk8kpt4BYE1B0MKS90O
 A34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytAJL1IPjLRLHB3vJNA4P2zaPkmMQ8wgfVfWBQ9Mma4=;
 b=WKErP0sH/p7pZzWtzlx1I98XUny0rbKbFwtqowWpGbqQ90dXySBEgBLqAzrw01ichb
 PlyKcmo/a6vaAij7tgjomBXhg63n6GFtIwEJC1rUSxBYaIkP57T/zVy8jQZcmC+StZlz
 UWCUeQJ8TZmUPaQ5HNvXFtOM3kd56eK0WzaTn6/Y/bMgZ25TpaQ3/gRRbUty3VLXkL/N
 Zk4fRH+w3Ran+cgqSq/z/xLA4OWZ33FIO13eCdqnWmj05qmfMYu15891pde5itPSFnTl
 Fbl36og+wree40Yio2Gwd1BxsSamCs4/5Gx4PxnxgQdB49NL6whbxAYPcxozpQzEAb92
 CDXQ==
X-Gm-Message-State: AFqh2krCO+vZ+lrWFvfLbhHflhJ9+fKjN+7wTcJpud7aPpFjd37syAax
 fUCIAhhdi3AXox1s+lhNmNbvvAkWHW39aVhq
X-Google-Smtp-Source: AMrXdXvTrxyU+8UT+7Pl2km3nD4CKRW1BXXrAXDSYjhiZMtRqkrg+toYqYWlP6yfJGPi4fz3sdYsHw==
X-Received: by 2002:a17:902:c409:b0:194:a854:6274 with SMTP id
 k9-20020a170902c40900b00194a8546274mr5761898plk.60.1674004301194; 
 Tue, 17 Jan 2023 17:11:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0017ec1b1bf9fsm21660259plp.217.2023.01.17.17.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:11:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name
Subject: [PATCH v2 10/10] tcg/loongarch64: Reorg goto_tb implementation
Date: Tue, 17 Jan 2023 15:11:23 -1000
Message-Id: <20230118011123.392823-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118011123.392823-1-richard.henderson@linaro.org>
References: <20230118011123.392823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

The old implementation replaces two insns, swapping between

        b       <dest>
        nop
and
        pcaddu18i tmp, <dest>
        jirl      zero, tmp, <dest> & 0xffff

There is a race condition in which a thread could be stopped at
the jirl, i.e. with the top of the address loaded, and when
restarted we have re-linked to a different TB, so that the top
half no longer matches the bottom half.

Note that while we never directly re-link to a different TB, we
can link, unlink, and link again all while the stopped thread
remains stopped.

The new implementation replaces only one insn, swapping between

        b       <dest>
and
        pcadd   tmp, <jmp_addr>

falling through to load the address from tmp, and branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.h     |  7 +---
 tcg/loongarch64/tcg-target.c.inc | 72 ++++++++++++++------------------
 2 files changed, 33 insertions(+), 46 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 533a539ce9..8b151e7f6f 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -42,11 +42,8 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_NB_REGS 32
-/*
- * PCADDU18I + JIRL sequence can give 20 + 16 + 2 = 38 bits
- * signed offset, which is +/- 128 GiB.
- */
-#define MAX_CODE_GEN_BUFFER_SIZE  (128 * GiB)
+
+#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 typedef enum {
     TCG_REG_ZERO,
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d6926bdb83..ce4a153887 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1151,37 +1151,6 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
 #endif
 }
 
-/* LoongArch uses `andi zero, zero, 0` as NOP.  */
-#define NOP OPC_ANDI
-static void tcg_out_nop(TCGContext *s)
-{
-    tcg_out32(s, NOP);
-}
-
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t jmp_rx, uintptr_t jmp_rw)
-{
-    tcg_insn_unit i1, i2;
-    ptrdiff_t upper, lower;
-    uintptr_t addr = tb->jmp_target_addr[n];
-    ptrdiff_t offset = (ptrdiff_t)(addr - jmp_rx) >> 2;
-
-    if (offset == sextreg(offset, 0, 26)) {
-        i1 = encode_sd10k16_insn(OPC_B, offset);
-        i2 = NOP;
-    } else {
-        tcg_debug_assert(offset == sextreg(offset, 0, 36));
-        lower = (int16_t)offset;
-        upper = (offset - lower) >> 16;
-
-        i1 = encode_dsj20_insn(OPC_PCADDU18I, TCG_REG_TMP0, upper);
-        i2 = encode_djsk16_insn(OPC_JIRL, TCG_REG_ZERO, TCG_REG_TMP0, lower);
-    }
-    uint64_t pair = ((uint64_t)i2 << 32) | i1;
-    qatomic_set((uint64_t *)jmp_rw, pair);
-    flush_idcache_range(jmp_rx, jmp_rw, 8);
-}
-
 /*
  * Entry-points
  */
@@ -1202,22 +1171,43 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
     /*
-     * Ensure that patch area is 8-byte aligned so that an
-     * atomic write can be used to patch the target address.
+     * Direct branch, or load indirect address, to be patched
+     * by tb_target_set_jmp_target.  Check indirect load offset
+     * in range early, regardless of direct branch distance,
+     * via assert within tcg_out_opc_pcaddu2i.
      */
-    if ((uintptr_t)s->code_ptr & 7) {
-        tcg_out_nop(s);
-    }
+    uintptr_t i_addr = get_jmp_target_addr(s, which);
+    intptr_t i_disp = tcg_pcrel_diff(s, (void *)i_addr);
+
     set_jmp_insn_offset(s, which);
-    /*
-     * actual branch destination will be patched by
-     * tb_target_set_jmp_target later
-     */
-    tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
+    tcg_out_opc_pcaddu2i(s, TCG_REG_TMP0, i_disp >> 2);
+
+    /* Finish the load and indirect branch. */
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_TMP0, 0);
     tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    uintptr_t d_addr = tb->jmp_target_addr[n];
+    ptrdiff_t d_disp = (ptrdiff_t)(d_addr - jmp_rx) >> 2;
+    tcg_insn_unit insn;
+
+    /* Either directly branch, or load slot address for indirect branch. */
+    if (d_disp == sextreg(d_disp, 0, 26)) {
+        insn = encode_sd10k16_insn(OPC_B, d_disp);
+    } else {
+        uintptr_t i_addr = (uintptr_t)&tb->jmp_target_addr[n];
+        intptr_t i_disp = i_addr - jmp_rx;
+        insn = encode_dsj20_insn(OPC_PCADDU2I, TCG_REG_TMP0, i_disp >> 2);
+    }
+
+    qatomic_set((tcg_insn_unit *)jmp_rw, insn);
+    flush_idcache_range(jmp_rx, jmp_rw, 4);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
-- 
2.34.1


