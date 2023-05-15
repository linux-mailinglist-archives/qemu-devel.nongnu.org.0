Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE87703029
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:40:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZLK-0007rC-Vk; Mon, 15 May 2023 10:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJq-0004s1-F2
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:01 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJk-0005yz-Ar
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:36:58 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1ab032d9266so118797235ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161411; x=1686753411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qqlVmOWLkkD4N0TUKCkau5U1AXPhMOrCn0VUAaOFSs=;
 b=aQ3PGwvPinfAAEnEb70YaxCNuLX3No6jB2q4yQYcsxAuXAJptV5lgMnabsGnL49rVh
 xXNov3k+t+pDSLSq9mFfmxCjOfHm2R09EfozwuysjcqblJZPB9v9Sx5D27l3XbltFnNs
 mjG8AGQ4qS+u0Yd2KK3xKIpCyWG2q8ntccfBFeTn3Q1uF8VtvkcKZRWugWLRMLRfMB/u
 HMKSJo4cdget0PImaa5PM6WVvMJPJX5IdpRKzP7pJRAMEm2XfizMjRmu7S76dmtdgxx/
 tELbAupCH6+gzvPJgiYKa64Mtglf8ttg0mFSe3HFqQwdDXiafXBmARvo73D8bvHngvry
 oHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161411; x=1686753411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1qqlVmOWLkkD4N0TUKCkau5U1AXPhMOrCn0VUAaOFSs=;
 b=YgYLHESQb3bdv5kV/7gIMD0mtXLYfyT/dLzKfaLCUwu8Fe9hhk0xsK5jXYqEbJrHh7
 y/zr+afIadKLf5PpIC7UmhjMl8l0UaGXtxKwNWf0YagyPn6OgYjl6UBcOyO0po0Rdim/
 oOmDBAr6ANi/ZCebwHoB076tBeK428aWSiZhwOAgXc3/XckgI+CyOK04HZPtwepf8JOq
 FyPa8hsBApuaE4r7piqDjCmMbQjRx6/DBN+VdRG899DdNI4Cog9SPYozhnNzd0v9ewxU
 t7tZiguPMrFZwdxyhFS1lLqsZuL980rN428bPNXZsantrduYqsL9KeDQy5l1axUEb7Ll
 kN4w==
X-Gm-Message-State: AC+VfDybP56BAitGHiNB8E8rTIeVdlQJ6bgRFkDOOMUSx9PUyPNpl54T
 iplq3qTGGrO89cR8AH/RIjU65Z9TPMPFxVt701w=
X-Google-Smtp-Source: ACHHUZ4Vj+IVVnqWUal3BXySdCAhmkr4i+wmR+kABlBWuuEn9f2I5Qo9Q72mrMpZjh7MfZX5QrrwDg==
X-Received: by 2002:a17:902:da84:b0:1ac:5b6b:df4c with SMTP id
 j4-20020a170902da8400b001ac5b6bdf4cmr39458614plx.69.1684161410916; 
 Mon, 15 May 2023 07:36:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 42/54] tcg/arm: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:01 -0700
Message-Id: <20230515143313.734053-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

No change to the ultimate load/store routines yet, so some atomicity
conditions not yet honored, but plumbs the change to alignment through
the relevant functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index e5aed03247..add8cc1fd5 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1323,6 +1323,7 @@ typedef struct {
     TCGReg base;
     int index;
     bool index_scratch;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1379,8 +1380,26 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1 << a_bits) - 1;
+    unsigned a_mask;
+
+#ifdef CONFIG_SOFTMMU
+    *h = (HostAddress){
+        .cond = COND_AL,
+        .base = addrlo,
+        .index = TCG_REG_R1,
+        .index_scratch = true,
+    };
+#else
+    *h = (HostAddress){
+        .cond = COND_AL,
+        .base = addrlo,
+        .index = guest_base ? TCG_REG_GUEST_BASE : -1,
+        .index_scratch = false,
+    };
+#endif
+
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
@@ -1469,13 +1488,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     if (TARGET_LONG_BITS == 64) {
         tcg_out_dat_reg(s, COND_EQ, ARITH_CMP, 0, TCG_REG_R3, addrhi, 0);
     }
-
-    *h = (HostAddress){
-        .cond = COND_AL,
-        .base = addrlo,
-        .index = TCG_REG_R1,
-        .index_scratch = true,
-    };
 #else
     if (a_mask) {
         ldst = new_ldst_label(s);
@@ -1484,18 +1496,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->addrlo_reg = addrlo;
         ldst->addrhi_reg = addrhi;
 
-        /* We are expecting a_bits to max out at 7 */
+        /* We are expecting alignment to max out at 7 */
         tcg_debug_assert(a_mask <= 0xff);
         /* tst addr, #mask */
         tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
     }
-
-    *h = (HostAddress){
-        .cond = COND_AL,
-        .base = addrlo,
-        .index = guest_base ? TCG_REG_GUEST_BASE : -1,
-        .index_scratch = false,
-    };
 #endif
 
     return ldst;
-- 
2.34.1


