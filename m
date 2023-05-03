Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAB16F508C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:02:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Qx-0007dI-R9; Wed, 03 May 2023 02:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qu-0007a3-GO
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:48 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qj-0001hc-Ox
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so30850395e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097056; x=1685689056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8x8nNgwxVzWwlXkH7TC04g8D23cjiNxwy3VmZPjq5To=;
 b=S73YGEU+WarZ/LaXA6i2mzKzqYQYse6a/ltYwryz9ffdXBEIVrdXrHGku59jYK9kPI
 BYCNdHujnJtHR94sVMz5SnS27sm5hKzWs+TyJvibZzwJqHDpu+HVVM2D9ZQxlFQWkCKa
 /J0hwu3Xq9kDvRQsndYHutwBjykQ630fVPXu+KV6+t1jLnLQ2avOM+Jp9CDsevezd01Q
 nV9eujOrauLRjHSLdXgIaugKsYj3ymajb+HJzM0gWjcJBR6Hu+dXZLMtZoDRr3J3pIqG
 5iXcwFn2DdjOLDdgtq363TLVE2uPQIKalFqrmI0PWqxeLspVMQlxQsAjK5wP3RC9kGPQ
 yWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097056; x=1685689056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8x8nNgwxVzWwlXkH7TC04g8D23cjiNxwy3VmZPjq5To=;
 b=BfIovNLLGHpcip8ZlyPDhUUFGeqU68M/7YddYclHqkiCJNB6ZwibvegJMhz5E2uCL0
 KuqagzhsGJfzTMpbWvlIwe4WWft64ZRMd0rDtcvTWSArzdf86GBZwB04l8maBXfO7vyt
 lzKWrKlkg4K41OlmuJLFMOEJ7+uFU5q1+23c64eqzeLYUniK4++7HntAikmLJ6k3Sxt0
 RTK3oZHqfYJJRHpF3MIFQ+C6TMa8PlfOr+UXJvad3kUqBrSBt+2B2G72Bq3CVrp2rlSG
 ZFdBSk2ukxi7YcNqwZR0cf5GMW+7Q8atkfdBS7uqXTw73Qweva2yLjIEuiJsvjcoYhcx
 tZ0w==
X-Gm-Message-State: AC+VfDzlnVO1xM0s6UQVkuGaJnxi3A+xKqq23scwpq/6eqIqlTbipeju
 olMSc0whgq9kBiPEm+YcqxPIA7Rgh4/pC04vf+51Tg==
X-Google-Smtp-Source: ACHHUZ7XLNzj1H35m714MLgKUPXUYRvNvMjlH0GkjjLiwncIMrw8rKwLC5CpH41GsGD6+SL/cthOpQ==
X-Received: by 2002:a7b:cc89:0:b0:3eb:39e2:915b with SMTP id
 p9-20020a7bcc89000000b003eb39e2915bmr13922064wma.31.1683097056140; 
 Tue, 02 May 2023 23:57:36 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 08/54] tcg/aarch64: Rationalize args to tcg_out_qemu_{ld,
 st}
Date: Wed,  3 May 2023 07:56:43 +0100
Message-Id: <20230503065729.1745843-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Rename the 'ext' parameter 'data_type' to make the use clearer;
pass it to tcg_out_qemu_st as well to even out the interfaces.
Rename the 'otype' local 'addr_type' to make the use clearer.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 4ec3cf3172..ecbf6564fc 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1851,22 +1851,21 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
 }
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi, TCGType ext)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
 
 #ifdef CONFIG_SOFTMMU
-    unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
 
-    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 1);
-    tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
-    add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
+    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 1);
+    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
+                           TCG_REG_X1, addr_type, addr_reg);
+    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(memop);
@@ -1874,33 +1873,32 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
+                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
     } else {
-        tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
+        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
                                addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
     }
 #endif /* CONFIG_SOFTMMU */
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
 
 #ifdef CONFIG_SOFTMMU
-    unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
 
-    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 0);
+    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 0);
     tcg_out_qemu_st_direct(s, memop, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
-    add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+                           TCG_REG_X1, addr_type, addr_reg);
+    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(memop);
     if (a_bits) {
@@ -1908,7 +1906,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     }
     if (USE_GUEST_BASE) {
         tcg_out_qemu_st_direct(s, memop, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
     } else {
         tcg_out_qemu_st_direct(s, memop, data_reg,
                                addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
@@ -2249,7 +2247,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, REG0(0), a1, a2);
+        tcg_out_qemu_st(s, REG0(0), a1, a2, ext);
         break;
 
     case INDEX_op_bswap64_i64:
-- 
2.34.1


