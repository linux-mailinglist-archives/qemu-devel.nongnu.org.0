Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A42165937F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:03:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rn-0003Cl-De; Thu, 29 Dec 2022 19:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rX-00039K-1I
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rR-0002kL-UM
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:01 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 gv5-20020a17090b11c500b00223f01c73c3so19378291pjb.0
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BaPB+/r7pdsWWo3pTR8xHeofU+nBHm3R3MHr1eWnccc=;
 b=R38RVJ9UgTcmn/qq/X4AKLsi/n6rvgDL1ugBcYrh3zjrise7UAkOICi8h45fnm2JG6
 /BM7GFAJuPuWi8Hluo5wiqVjFAnFC79fg5ekPk+V6Gn9+Uk9YPcL9Bv1S+JdDXSQW6mo
 /3gKeKhomBNvp/AM2NsqSpJizmsrZVXfrHEjbx/cpzQTzxtKh3UlUUVwZFKHcHUrnSD+
 QCPE/D1qu4Ey7jOK2g+9ZOZ0l/le1OIwofCF8Kn4AmiwGogyHA/Wfw0EQH+morLtI9fp
 ebknmHP+GYBhPiG8D2b+uy2PPvM5AMDGD4wSgJDiu6OqPvE7DCpRzVAVhlwMVBxOkpCR
 T0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaPB+/r7pdsWWo3pTR8xHeofU+nBHm3R3MHr1eWnccc=;
 b=FxGnYVp/3zaZMOk2/NvAkrs1I1p2phDnzjxcYsdkg+3jspP9qDvHRQgJTAhaiECDjq
 COcSYoz9XfhDZcQhzYPnGwZWfbhgFfc9Dc96PvGPXjsUWgegqHEFzLixNi8jjnzk+udP
 Vxht1uOkopebp/w3rUl2WsdPxRXtxntALY9UGABG6Vygqfqqj+Bxdpe6sTmah0q8xiLd
 NfIbQlqkfP1JXUZLud9D17MKTi3Nkb+vgOP9VBRtoISFCCngXteF5i7RIbI3zWksMkB5
 4EFBPcJ8ZpCq2PMoTZ8t6lWW29YULFQDl5ANhWeG2J4p3sf70RDD+3oZSTl6Piuk8Jl/
 0ZoA==
X-Gm-Message-State: AFqh2krWEzJDa17JEVqAdpV48qe3z7PNCqD/nb/TeQI34264ANQeV+mE
 7skHJ4wmw0WMi9fWMiIMRuVzCyZJ1iAhwO3V
X-Google-Smtp-Source: AMrXdXvInw5+8eBX8FiRUMTK0GrybmSFuJSjtGo5iPHBWNu0debMCDiQtPGO/dUssVx6nmbo1RHIXA==
X-Received: by 2002:a17:903:442:b0:191:2c85:1371 with SMTP id
 iw2-20020a170903044200b001912c851371mr26598748plb.18.1672358576078; 
 Thu, 29 Dec 2022 16:02:56 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 36/47] tcg: Vary the allocation size for TCGOp
Date: Thu, 29 Dec 2022 16:02:10 -0800
Message-Id: <20221230000221.2764875-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

We have been allocating a worst case number of arguments
to support calls.  Instead, allow the size to vary.
By default leave space for 4 args, to maximize reuse,
but allow calls to increase the number of args to 32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Split patch in two]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221218211832.73312-3-philmd@linaro.org>
---
 include/exec/helper-head.h |  2 --
 include/tcg/tcg.h          | 46 +++++++++++++-------------------------
 accel/tcg/plugin-gen.c     | 10 ++++-----
 tcg/tcg.c                  | 35 +++++++++++++++++++++--------
 4 files changed, 47 insertions(+), 46 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index e242fed46e..8bdf0f6ea2 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -133,6 +133,4 @@
 #define DEF_HELPER_7(name, ret, t1, t2, t3, t4, t5, t6, t7) \
     DEF_HELPER_FLAGS_7(name, 0, ret, t1, t2, t3, t4, t5, t6, t7)
 
-/* MAX_OPC_PARAM_IARGS must be set to n if last entry is DEF_HELPER_FLAGS_n. */
-
 #endif /* EXEC_HELPER_HEAD_H */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index c55fa21a89..d430ea10c8 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -38,20 +38,6 @@
 /* XXX: make safe guess about sizes */
 #define MAX_OP_PER_INSTR 266
 
-#if HOST_LONG_BITS == 32
-#define MAX_OPC_PARAM_PER_ARG 2
-#else
-#define MAX_OPC_PARAM_PER_ARG 1
-#endif
-#define MAX_OPC_PARAM_IARGS 7
-#define MAX_OPC_PARAM_OARGS 1
-#define MAX_OPC_PARAM_ARGS (MAX_OPC_PARAM_IARGS + MAX_OPC_PARAM_OARGS)
-
-/* A Call op needs up to 4 + 2N parameters on 32-bit archs,
- * and up to 4 + N parameters on 64-bit archs
- * (N = number of input arguments + output arguments).  */
-#define MAX_OPC_PARAM (4 + (MAX_OPC_PARAM_PER_ARG * MAX_OPC_PARAM_ARGS))
-
 #define CPU_TEMP_BUF_NLONGS 128
 #define TCG_STATIC_FRAME_SIZE  (CPU_TEMP_BUF_NLONGS * sizeof(long))
 
@@ -493,34 +479,34 @@ typedef struct TCGTempSet {
     unsigned long l[BITS_TO_LONGS(TCG_MAX_TEMPS)];
 } TCGTempSet;
 
-/* While we limit helpers to 6 arguments, for 32-bit hosts, with padding,
-   this imples a max of 6*2 (64-bit in) + 2 (64-bit out) = 14 operands.
-   There are never more than 2 outputs, which means that we can store all
-   dead + sync data within 16 bits.  */
-#define DEAD_ARG  4
-#define SYNC_ARG  1
-typedef uint16_t TCGLifeData;
+/*
+ * With 1 128-bit output, a 32-bit host requires 4 output parameters,
+ * which leaves a maximum of 28 other slots.  Which is enough for 7
+ * 128-bit operands.
+ */
+#define DEAD_ARG  (1 << 4)
+#define SYNC_ARG  (1 << 0)
+typedef uint32_t TCGLifeData;
 
-/* The layout here is designed to avoid a bitfield crossing of
-   a 32-bit boundary, which would cause GCC to add extra padding.  */
 typedef struct TCGOp {
-    TCGOpcode opc   : 8;        /*  8 */
+    TCGOpcode opc   : 8;
+    unsigned nargs  : 8;
 
     /* Parameters for this opcode.  See below.  */
-    unsigned param1 : 4;        /* 12 */
-    unsigned param2 : 4;        /* 16 */
+    unsigned param1 : 8;
+    unsigned param2 : 8;
 
     /* Lifetime data of the operands.  */
-    unsigned life   : 16;       /* 32 */
+    TCGLifeData life;
 
     /* Next and previous opcodes.  */
     QTAILQ_ENTRY(TCGOp) link;
 
-    /* Arguments for the opcode.  */
-    TCGArg args[MAX_OPC_PARAM];
-
     /* Register preferences for the output(s).  */
     TCGRegSet output_pref[2];
+
+    /* Arguments for the opcode.  */
+    TCGArg args[];
 } TCGOp;
 
 #define TCGOP_CALLI(X)    (X)->param1
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 62e775d34d..c7d6514840 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -258,12 +258,12 @@ static TCGOp *rm_ops(TCGOp *op)
 
 static TCGOp *copy_op_nocheck(TCGOp **begin_op, TCGOp *op)
 {
-    unsigned nargs = ARRAY_SIZE(op->args);
+    TCGOp *old_op = QTAILQ_NEXT(*begin_op, link);
+    unsigned nargs = old_op->nargs;
 
-    *begin_op = QTAILQ_NEXT(*begin_op, link);
-    tcg_debug_assert(*begin_op);
-    op = tcg_op_insert_after(tcg_ctx, op, (*begin_op)->opc, nargs);
-    memcpy(op->args, (*begin_op)->args, sizeof(op->args));
+    *begin_op = old_op;
+    op = tcg_op_insert_after(tcg_ctx, op, old_op->opc, nargs);
+    memcpy(op->args, old_op->args, sizeof(op->args[0]) * nargs);
 
     return op;
 }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 25c131fd77..0fd41d5951 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1513,7 +1513,12 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         }
     }
 
-    max_args = ARRAY_SIZE(op->args);
+    /*
+     * A Call op needs up to 4 + 2N parameters on 32-bit archs,
+     * and up to 4 + N parameters on 64-bit archs
+     * (N = number of input arguments + output arguments).
+     */
+    max_args = (64 / TCG_TARGET_REG_BITS) * nargs + 4;
     op = tcg_emit_op(INDEX_op_call, max_args);
 
     pi = 0;
@@ -2298,19 +2303,31 @@ void tcg_remove_ops_after(TCGOp *op)
 static TCGOp *tcg_op_alloc(TCGOpcode opc, unsigned nargs)
 {
     TCGContext *s = tcg_ctx;
-    TCGOp *op;
+    TCGOp *op = NULL;
 
-    assert(nargs < ARRAY_SIZE(op->args));
-    if (likely(QTAILQ_EMPTY(&s->free_ops))) {
-        op = tcg_malloc(sizeof(TCGOp));
-    } else {
-        op = QTAILQ_FIRST(&s->free_ops);
-        QTAILQ_REMOVE(&s->free_ops, op, link);
+    if (unlikely(!QTAILQ_EMPTY(&s->free_ops))) {
+        QTAILQ_FOREACH(op, &s->free_ops, link) {
+            if (nargs <= op->nargs) {
+                QTAILQ_REMOVE(&s->free_ops, op, link);
+                nargs = op->nargs;
+                goto found;
+            }
+        }
     }
+
+    /* Most opcodes have 3 or 4 operands: reduce fragmentation. */
+    nargs = MAX(4, nargs);
+    op = tcg_malloc(sizeof(TCGOp) + sizeof(TCGArg) * nargs);
+
+ found:
     memset(op, 0, offsetof(TCGOp, link));
     op->opc = opc;
-    s->nb_ops++;
+    op->nargs = nargs;
 
+    /* Check for bitfield overflow. */
+    tcg_debug_assert(op->nargs == nargs);
+
+    s->nb_ops++;
     return op;
 }
 
-- 
2.34.1


