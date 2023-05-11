Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F476FED8E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:07:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1It-00071r-8i; Thu, 11 May 2023 04:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1In-0006hl-Dt
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:30 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IZ-00012r-2l
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50b9ef67f35so14689890a12.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792313; x=1686384313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UPlI92zXqreIEPb7PmskMpI4JW+xZWPxZMuY9l3rRHw=;
 b=D8XgrftACu3svwWQyItFhNhBWXtHNuGVKhdsPe2jktZ4zS8sgwCuyhOIEbH5rigPgn
 zPexQ65kQKS75c9anlKTYzVqbAZY0kMLAJ1XEOk3v1pJ7lKDLWXNKjHmhrMRbSrnIDtk
 jzmLobgJRYWO9c+MQkSac2AneVaDrBBCwiEraBGnej/KOJCH5OS6XqzcSCwXHW0y9OqQ
 s9Pl298vYePo0KtRLxOOELUjr0psCPCymZck5qiEHC1Weq65dqGw3AJ/YlOGqZUkfD/U
 WDsZyRunTcegJ3N54sdBY/r+qMZ5BVs+WJCjVF7QX8zrvQ/s9PuAmga6N/Yfv21Dyl92
 QtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792313; x=1686384313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UPlI92zXqreIEPb7PmskMpI4JW+xZWPxZMuY9l3rRHw=;
 b=fEZ5Jryq/kYiZIN8ASL87YVq0+TFr24SHG5+PmcQd3u6xqQQ9Xorr0uXo6RHb87p7T
 OCPqAXudA3CILXl9TulcDvy+ECgSem2YFTgvBivl9D6eVaxE1NWatVkkXDPnAL8UOwDX
 78s3iA7KxadgHEiX13RPEhCfdS72R/thK9TIbGfgGozQQa6dYTRERQC1KUYX2RfGZ+H4
 eRflOxCuXKipdpR3TM7bD9SCiXEmNn4GeZR+a5AldpclJEE42+4knW4+aWhi9JieoObL
 vkyiVlSlzY1RHqdfIbfupfouaLPvISoYeSOrIzIZvubUMnKk3yqy3U91f7BMboGR1G2F
 hqxQ==
X-Gm-Message-State: AC+VfDzKF2b853PWwFmYsGC0tz8eGCHbMwLvrk0XBa7JeJFUd49fD23w
 35B+rhM+xVfpaeksTRMzmKfUyjNdinc1z78xFDvA+w==
X-Google-Smtp-Source: ACHHUZ4Xi+3KZaGHpTLvhwmfdNOCyExxeOOTVK0fYbGA2xE1jg9M+ClpkQLkVwZq0qY/qYkJR3l3wA==
X-Received: by 2002:aa7:c517:0:b0:504:b0d2:76c with SMTP id
 o23-20020aa7c517000000b00504b0d2076cmr17727039edq.32.1683792313491; 
 Thu, 11 May 2023 01:05:13 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 34/53] tcg/ppc: Reorg tcg_out_tlb_read
Date: Thu, 11 May 2023 09:04:31 +0100
Message-Id: <20230511080450.860923-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Allocate TCG_REG_TMP2.  Use R0, TMP1, TMP2 instead of any of
the normally allocated registers for the tlb load.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 78 ++++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 31 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 4c479fdece..dbba304e42 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -68,6 +68,7 @@
 #else
 # define TCG_REG_TMP1   TCG_REG_R12
 #endif
+#define TCG_REG_TMP2    TCG_REG_R11
 
 #define TCG_VEC_TMP1    TCG_REG_V0
 #define TCG_VEC_TMP2    TCG_REG_V1
@@ -2015,13 +2016,11 @@ static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 /*
  * For the purposes of ppc32 sorting 4 input registers into 4 argument
  * registers, there is an outside chance we would require 3 temps.
- * Because of constraints, no inputs are in r3, and env will not be
- * placed into r3 until after the sorting is done, and is thus free.
  */
 static const TCGLdstHelperParam ldst_helper_param = {
     .ra_gen = ldst_ra_gen,
     .ntmp = 3,
-    .tmp = { TCG_REG_TMP1, TCG_REG_R0, TCG_REG_R3 }
+    .tmp = { TCG_REG_TMP1, TCG_REG_TMP2, TCG_REG_R0 }
 };
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
@@ -2135,31 +2134,31 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R3, TCG_AREG0, mask_off);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R4, TCG_AREG0, table_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, mask_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_AREG0, table_off);
 
     /* Extract the page index, shifted into place for tlb index.  */
     if (TCG_TARGET_REG_BITS == 32) {
-        tcg_out_shri32(s, TCG_REG_TMP1, addrlo,
+        tcg_out_shri32(s, TCG_REG_R0, addrlo,
                        TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
     } else {
-        tcg_out_shri64(s, TCG_REG_TMP1, addrlo,
+        tcg_out_shri64(s, TCG_REG_R0, addrlo,
                        TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
     }
-    tcg_out32(s, AND | SAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_TMP1));
+    tcg_out32(s, AND | SAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_R0));
 
-    /* Load the TLB comparator.  */
+    /* Load the (low part) TLB comparator into TMP2.  */
     if (cmp_off == 0 && TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
         uint32_t lxu = (TCG_TARGET_REG_BITS == 32 || TARGET_LONG_BITS == 32
                         ? LWZUX : LDUX);
-        tcg_out32(s, lxu | TAB(TCG_REG_TMP1, TCG_REG_R3, TCG_REG_R4));
+        tcg_out32(s, lxu | TAB(TCG_REG_TMP2, TCG_REG_TMP1, TCG_REG_TMP2));
     } else {
-        tcg_out32(s, ADD | TAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_R4));
+        tcg_out32(s, ADD | TAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_TMP2));
         if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP1, TCG_REG_R3, cmp_off + 4);
-            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R4, TCG_REG_R3, cmp_off);
+            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP2,
+                       TCG_REG_TMP1, cmp_off + 4 * HOST_BIG_ENDIAN);
         } else {
-            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP1, TCG_REG_R3, cmp_off);
+            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP2, TCG_REG_TMP1, cmp_off);
         }
     }
 
@@ -2167,11 +2166,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * Load the TLB addend for use on the fast path.
      * Do this asap to minimize any load use delay.
      */
-    h->base = TCG_REG_R3;
-    tcg_out_ld(s, TCG_TYPE_PTR, h->base, TCG_REG_R3,
-               offsetof(CPUTLBEntry, addend));
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
+                   offsetof(CPUTLBEntry, addend));
+    }
 
-    /* Clear the non-page, non-alignment bits from the address */
+    /* Clear the non-page, non-alignment bits from the address in R0. */
     if (TCG_TARGET_REG_BITS == 32) {
         /*
          * We don't support unaligned accesses on 32-bits.
@@ -2204,9 +2204,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         if (TARGET_LONG_BITS == 32) {
             tcg_out_rlw(s, RLWINM, TCG_REG_R0, t, 0,
                         (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
-            /* Zero-extend the address for use in the final address.  */
-            tcg_out_ext32u(s, TCG_REG_R4, addrlo);
-            addrlo = TCG_REG_R4;
         } else if (a_bits == 0) {
             tcg_out_rld(s, RLDICR, TCG_REG_R0, t, 0, 63 - TARGET_PAGE_BITS);
         } else {
@@ -2215,21 +2212,36 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
             tcg_out_rld(s, RLDICL, TCG_REG_R0, TCG_REG_R0, TARGET_PAGE_BITS, 0);
         }
     }
-    h->index = addrlo;
 
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
+        /* Low part comparison into cr7. */
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2,
                     0, 7, TCG_TYPE_I32);
-        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_R4, 0, 6, TCG_TYPE_I32);
+
+        /* Load the high part TLB comparator into TMP2.  */
+        tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP2, TCG_REG_TMP1,
+                   cmp_off + 4 * !HOST_BIG_ENDIAN);
+
+        /* Load addend, deferred for this case. */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
+                   offsetof(CPUTLBEntry, addend));
+
+        /* High part comparison into cr6. */
+        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_TMP2, 0, 6, TCG_TYPE_I32);
+
+        /* Combine comparisons into cr7. */
         tcg_out32(s, CRAND | BT(7, CR_EQ) | BA(6, CR_EQ) | BB(7, CR_EQ));
     } else {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
+        /* Full comparison into cr7. */
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2,
                     0, 7, TCG_TYPE_TL);
     }
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     ldst->label_ptr[0] = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
+
+    h->base = TCG_REG_TMP1;
 #else
     if (a_bits) {
         ldst = new_ldst_label(s);
@@ -2247,13 +2259,16 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     h->base = guest_base ? TCG_GUEST_BASE_REG : 0;
-    h->index = addrlo;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        h->index = TCG_REG_TMP1;
-    }
 #endif
 
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        /* Zero-extend the guest address for use in the host address. */
+        tcg_out_ext32u(s, TCG_REG_R0, addrlo);
+        h->index = TCG_REG_R0;
+    } else {
+        h->index = addrlo;
+    }
+
     return ldst;
 }
 
@@ -3905,7 +3920,8 @@ static void tcg_target_init(TCGContext *s)
 #if defined(_CALL_SYSV) || TCG_TARGET_REG_BITS == 64
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_R13); /* thread pointer */
 #endif
-    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1); /* mem temp */
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP2);
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP1);
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP2);
     if (USE_REG_TB) {
-- 
2.34.1


