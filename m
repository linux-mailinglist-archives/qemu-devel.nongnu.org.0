Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD546EC4F8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:43:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqoyh-0006mN-H5; Mon, 24 Apr 2023 01:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxI-0005TZ-VG
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:42 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowv-0004IT-3x
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:40 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so2409725f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314873; x=1684906873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJ7URx7VME6Yut58cQvnYokrETz9WcC+DTaD3rOQAjQ=;
 b=i1N8/OvPcyq7vmN+JQHWWpVwE1Mhc6tOQFl6DTx/y5ZwxVu2lKGXOdXLUcfzQ9nBoO
 /+F+fY/aVlXr6OYDQE7bb26zQONJwaOOj78KupozA0zo1vUxHnqth6D/VrMRVrnCyhBF
 l9JkD9LrYKHBY2NXKVpVYLO9e94AdUr0YF4D5LoDosmzpWBge49mW4tIQJXh5Iva1HrK
 vjPHPJ30OF5NhdzjVxVjnhMMAe6v5TpLX0JCmbrpr38dtAQpYnjl0WN71dIk2Z9uSsoC
 0Y/G3RsJ5b3ZWYMcTmvutKMqaqecJLxwlw13oJw2ex5mCzQrM/HDIJKzKpbUTcYyY9y5
 TwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314873; x=1684906873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJ7URx7VME6Yut58cQvnYokrETz9WcC+DTaD3rOQAjQ=;
 b=Kq1D1WGoYdMNDbxy+XwiGggIsY++r1f1/E8vYYwG7lyS0u0gcUWoFCnbAKQuf26zrC
 lu3ykrkVPJQuSKMtIcy4EO9xRYLKmSslZ0t2NS2Iqqtz+UcgbVsjBYnVrFu5SrXZ/c8w
 quchKLkjAwg3nwK5eeOIEoT9fyiW/jJlso6UJ5x6WaPOqXRliV3N6kRSn3OiZB18kLlb
 PwlcmCEYsuLNZIcGOjPo1mMUqF9sCUADEsUETmRS7c7CjFEzA0M/l1r5esL3M/cHkuSd
 EUXDOQbweKiFgV1KdGbWz/akQEMVkQwN3cfCHL7wHZa8hJSoJTAnLd8PSlVN0BiWCN8H
 G1Ig==
X-Gm-Message-State: AAQBX9dbQJavomrvT1AYvoRPJqIkZ9ZEMVU/89k4P3MhZGsVjn9fBMOm
 Hk4f7RANDXKZgjKs24jtXJh271JYtJYlRgPshYiSsA==
X-Google-Smtp-Source: AKy350ZPYLYfYJyoFTnI2yNVZHNPv/Ir3D6AOQVIAkS/Nn4XMvjcgHljmhVpy8u/tTg8ZEvYGVwHFA==
X-Received: by 2002:adf:dece:0:b0:2d8:47c7:7b52 with SMTP id
 i14-20020adfdece000000b002d847c77b52mr9052263wrn.9.1682314873801; 
 Sun, 23 Apr 2023 22:41:13 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 13/57] tcg/aarch64: Introduce HostAddress
Date: Mon, 24 Apr 2023 06:40:21 +0100
Message-Id: <20230424054105.1579315-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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

Collect the 3 potential parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 86 +++++++++++++++++++++++++-----------
 1 file changed, 59 insertions(+), 27 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ecbf6564fc..d8d464e4a0 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1587,6 +1587,12 @@ static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
     tcg_out_insn(s, 3406, ADR, rd, offset);
 }
 
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+    TCGType index_ext;
+} HostAddress;
+
 #ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
@@ -1796,32 +1802,31 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
-                                   TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   TCGReg data_r, HostAddress h)
 {
     switch (memop & MO_SSIZE) {
     case MO_UB:
-        tcg_out_ldst_r(s, I3312_LDRB, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRB, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_SB:
         tcg_out_ldst_r(s, ext ? I3312_LDRSBX : I3312_LDRSBW,
-                       data_r, addr_r, otype, off_r);
+                       data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UW:
-        tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRH, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_SW:
         tcg_out_ldst_r(s, (ext ? I3312_LDRSHX : I3312_LDRSHW),
-                       data_r, addr_r, otype, off_r);
+                       data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UL:
-        tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRW, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_SL:
-        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UQ:
-        tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRX, data_r, h.base, h.index_ext, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1829,21 +1834,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
-                                   TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   TCGReg data_r, HostAddress h)
 {
     switch (memop & MO_SIZE) {
     case MO_8:
-        tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRB, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_16:
-        tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRH, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_32:
-        tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRW, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_64:
-        tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRX, data_r, h.base, h.index_ext, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1855,6 +1859,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 {
     MemOp memop = get_memop(oi);
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    HostAddress h;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
@@ -1863,8 +1868,14 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     tcg_insn_unit *label_ptr;
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 1);
-    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
-                           TCG_REG_X1, addr_type, addr_reg);
+
+    h = (HostAddress){
+        .base = TCG_REG_X1,
+        .index = addr_reg,
+        .index_ext = addr_type
+    };
+    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg, h);
+
     add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
@@ -1873,12 +1884,19 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
-                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
+        h = (HostAddress){
+            .base = TCG_REG_GUEST_BASE,
+            .index = addr_reg,
+            .index_ext = addr_type
+        };
     } else {
-        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
-                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
+        h = (HostAddress){
+            .base = addr_reg,
+            .index = TCG_REG_XZR,
+            .index_ext = TCG_TYPE_I64
+        };
     }
+    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg, h);
 #endif /* CONFIG_SOFTMMU */
 }
 
@@ -1887,6 +1905,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 {
     MemOp memop = get_memop(oi);
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    HostAddress h;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
@@ -1895,8 +1914,14 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     tcg_insn_unit *label_ptr;
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 0);
-    tcg_out_qemu_st_direct(s, memop, data_reg,
-                           TCG_REG_X1, addr_type, addr_reg);
+
+    h = (HostAddress){
+        .base = TCG_REG_X1,
+        .index = addr_reg,
+        .index_ext = addr_type
+    };
+    tcg_out_qemu_st_direct(s, memop, data_reg, h);
+
     add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
@@ -1905,12 +1930,19 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_st_direct(s, memop, data_reg,
-                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
+        h = (HostAddress){
+            .base = TCG_REG_GUEST_BASE,
+            .index = addr_reg,
+            .index_ext = addr_type
+        };
     } else {
-        tcg_out_qemu_st_direct(s, memop, data_reg,
-                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
+        h = (HostAddress){
+            .base = addr_reg,
+            .index = TCG_REG_XZR,
+            .index_ext = TCG_TYPE_I64
+        };
     }
+    tcg_out_qemu_st_direct(s, memop, data_reg, h);
 #endif /* CONFIG_SOFTMMU */
 }
 
-- 
2.34.1


