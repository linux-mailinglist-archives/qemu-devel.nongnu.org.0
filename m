Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF06EC57B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:52:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqozb-0001zA-FA; Mon, 24 Apr 2023 01:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxr-00060z-VM
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:33 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox3-0004RM-UZ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so24609375e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314883; x=1684906883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qowvb+qOV3aQYrEqXjQNCyaJCRa0p6aZo6j5FULejHU=;
 b=VbJtWDhyEQHmyLdGSnT9W6ug0wZpBBDt1liJs4mokpXE1lsGhe3bm/zxZiwUJoAyS3
 rHSjAP1IBBxb5YyvwcJz3vXnF6Yezgx7UJXP3aPCgU15V/Muhk92TGVPIm3cGYQZeYeI
 9Em/CDAKZ2b3SnqJA74GPqhCVo7Glu4GvgwqYwCuA5haOrAAhdJTrnRYS7rrpWhPYgPD
 tnYBf9dc1pxJBXuD5B8VstLdU4hw8uOiuNrrXKLOHf5MIXPp9AUUhNvILSAMAH4DsCgT
 qwRpciYTfptb5Gv/xQBxg8ry5C7zUgir2v0J1RWbrbOG8UUOS0Cf8hWe3YiBfJpL7Ds3
 KaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314883; x=1684906883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qowvb+qOV3aQYrEqXjQNCyaJCRa0p6aZo6j5FULejHU=;
 b=LBWSgnyqJh1+ivkXHNdPVr/chbQNVteF0vojNMCUnMVVQ7yQa1voS/3D50l6WokzW0
 t6jRWX6ouSQ8H/bR/T90j68hzx6Hq8fAA/ONJTdXGw6UKrMEcSWPe/AO3EBo8z8y+vai
 f2Zt+9I2YVVLIh2LH5Wtq3v7X3NxvErgejVxiNVz/35rghEAYz6oujtKbKWFNJZt8D0/
 XY8xTQ2FUM8/Pnag5f+Ji5aeIQ2h8EbLglln9m6hEFTVl69yh5JuYmpoQQXp/1fYSuRn
 0Ax1Uo+CQKItqII8ms7dESR5fFxQmPEBqIhyoJSJ1F2EsFbNxzzB8DDsEAS4iSrLH3kb
 +JzQ==
X-Gm-Message-State: AAQBX9fHvqyaf0sZrQXEWxb8N5ptLtC753T1Z+KfJ186R2VUAWKHOdc9
 faF4If8zR7eNGLPtMzdx/zsj602eZi4u/WTzTCU2ZA==
X-Google-Smtp-Source: AKy350YifikSpYlBZZrNJM2bH4JvTLtX6zv2JnO2LxmWrSS/OdTJl+ypVzpFOL2gTLCBHHDWuSz3Ig==
X-Received: by 2002:a5d:4e41:0:b0:2f2:783f:ae4a with SMTP id
 r1-20020a5d4e41000000b002f2783fae4amr9481138wrt.32.1682314883562; 
 Sun, 23 Apr 2023 22:41:23 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 30/57] tcg/s390x: Introduce HostAddress
Date: Mon, 24 Apr 2023 06:40:38 +0100
Message-Id: <20230424054105.1579315-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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

Collect the 3 potential parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 109 ++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 49 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index e931f0cde4..da7ee5b085 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1606,58 +1606,64 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
     tcg_out_call_int(s, dest);
 }
 
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+    int disp;
+} HostAddress;
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
-                                   TCGReg base, TCGReg index, int disp)
+                                   HostAddress h)
 {
     switch (opc & (MO_SSIZE | MO_BSWAP)) {
     case MO_UB:
-        tcg_out_insn(s, RXY, LLGC, data, base, index, disp);
+        tcg_out_insn(s, RXY, LLGC, data, h.base, h.index, h.disp);
         break;
     case MO_SB:
-        tcg_out_insn(s, RXY, LGB, data, base, index, disp);
+        tcg_out_insn(s, RXY, LGB, data, h.base, h.index, h.disp);
         break;
 
     case MO_UW | MO_BSWAP:
         /* swapped unsigned halfword load with upper bits zeroed */
-        tcg_out_insn(s, RXY, LRVH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRVH, data, h.base, h.index, h.disp);
         tcg_out_ext16u(s, data, data);
         break;
     case MO_UW:
-        tcg_out_insn(s, RXY, LLGH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LLGH, data, h.base, h.index, h.disp);
         break;
 
     case MO_SW | MO_BSWAP:
         /* swapped sign-extended halfword load */
-        tcg_out_insn(s, RXY, LRVH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRVH, data, h.base, h.index, h.disp);
         tcg_out_ext16s(s, TCG_TYPE_REG, data, data);
         break;
     case MO_SW:
-        tcg_out_insn(s, RXY, LGH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LGH, data, h.base, h.index, h.disp);
         break;
 
     case MO_UL | MO_BSWAP:
         /* swapped unsigned int load with upper bits zeroed */
-        tcg_out_insn(s, RXY, LRV, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRV, data, h.base, h.index, h.disp);
         tcg_out_ext32u(s, data, data);
         break;
     case MO_UL:
-        tcg_out_insn(s, RXY, LLGF, data, base, index, disp);
+        tcg_out_insn(s, RXY, LLGF, data, h.base, h.index, h.disp);
         break;
 
     case MO_SL | MO_BSWAP:
         /* swapped sign-extended int load */
-        tcg_out_insn(s, RXY, LRV, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRV, data, h.base, h.index, h.disp);
         tcg_out_ext32s(s, data, data);
         break;
     case MO_SL:
-        tcg_out_insn(s, RXY, LGF, data, base, index, disp);
+        tcg_out_insn(s, RXY, LGF, data, h.base, h.index, h.disp);
         break;
 
     case MO_UQ | MO_BSWAP:
-        tcg_out_insn(s, RXY, LRVG, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRVG, data, h.base, h.index, h.disp);
         break;
     case MO_UQ:
-        tcg_out_insn(s, RXY, LG, data, base, index, disp);
+        tcg_out_insn(s, RXY, LG, data, h.base, h.index, h.disp);
         break;
 
     default:
@@ -1666,44 +1672,44 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
-                                   TCGReg base, TCGReg index, int disp)
+                                   HostAddress h)
 {
     switch (opc & (MO_SIZE | MO_BSWAP)) {
     case MO_UB:
-        if (disp >= 0 && disp < 0x1000) {
-            tcg_out_insn(s, RX, STC, data, base, index, disp);
+        if (h.disp >= 0 && h.disp < 0x1000) {
+            tcg_out_insn(s, RX, STC, data, h.base, h.index, h.disp);
         } else {
-            tcg_out_insn(s, RXY, STCY, data, base, index, disp);
+            tcg_out_insn(s, RXY, STCY, data, h.base, h.index, h.disp);
         }
         break;
 
     case MO_UW | MO_BSWAP:
-        tcg_out_insn(s, RXY, STRVH, data, base, index, disp);
+        tcg_out_insn(s, RXY, STRVH, data, h.base, h.index, h.disp);
         break;
     case MO_UW:
-        if (disp >= 0 && disp < 0x1000) {
-            tcg_out_insn(s, RX, STH, data, base, index, disp);
+        if (h.disp >= 0 && h.disp < 0x1000) {
+            tcg_out_insn(s, RX, STH, data, h.base, h.index, h.disp);
         } else {
-            tcg_out_insn(s, RXY, STHY, data, base, index, disp);
+            tcg_out_insn(s, RXY, STHY, data, h.base, h.index, h.disp);
         }
         break;
 
     case MO_UL | MO_BSWAP:
-        tcg_out_insn(s, RXY, STRV, data, base, index, disp);
+        tcg_out_insn(s, RXY, STRV, data, h.base, h.index, h.disp);
         break;
     case MO_UL:
-        if (disp >= 0 && disp < 0x1000) {
-            tcg_out_insn(s, RX, ST, data, base, index, disp);
+        if (h.disp >= 0 && h.disp < 0x1000) {
+            tcg_out_insn(s, RX, ST, data, h.base, h.index, h.disp);
         } else {
-            tcg_out_insn(s, RXY, STY, data, base, index, disp);
+            tcg_out_insn(s, RXY, STY, data, h.base, h.index, h.disp);
         }
         break;
 
     case MO_UQ | MO_BSWAP:
-        tcg_out_insn(s, RXY, STRVG, data, base, index, disp);
+        tcg_out_insn(s, RXY, STRVG, data, h.base, h.index, h.disp);
         break;
     case MO_UQ:
-        tcg_out_insn(s, RXY, STG, data, base, index, disp);
+        tcg_out_insn(s, RXY, STG, data, h.base, h.index, h.disp);
         break;
 
     default:
@@ -1883,20 +1889,23 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return tcg_out_fail_alignment(s, l);
 }
 
-static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
-                                  TCGReg *index_reg, tcg_target_long *disp)
+static HostAddress tcg_prepare_user_ldst(TCGContext *s, TCGReg addr_reg)
 {
+    TCGReg index;
+    int disp;
+
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_TMP0, *addr_reg);
-        *addr_reg = TCG_TMP0;
+        tcg_out_ext32u(s, TCG_TMP0, addr_reg);
+        addr_reg = TCG_TMP0;
     }
     if (guest_base < 0x80000) {
-        *index_reg = TCG_REG_NONE;
-        *disp = guest_base;
+        index = TCG_REG_NONE;
+        disp = guest_base;
     } else {
-        *index_reg = TCG_GUEST_BASE_REG;
-        *disp = 0;
+        index = TCG_GUEST_BASE_REG;
+        disp = 0;
     }
+    return (HostAddress){ .base = addr_reg, .index = index, .disp = disp };
 }
 #endif /* CONFIG_SOFTMMU */
 
@@ -1904,31 +1913,32 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
+    h.base = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
+    h.index = TCG_REG_R2;
+    h.disp = 0;
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
+    tcg_out_qemu_ld_direct(s, opc, data_reg, h);
 
     add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
-    TCGReg index_reg;
-    tcg_target_long disp;
     unsigned a_bits = get_alignment_bits(opc);
 
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
-    tcg_prepare_user_ldst(s, &addr_reg, &index_reg, &disp);
-    tcg_out_qemu_ld_direct(s, opc, data_reg, addr_reg, index_reg, disp);
+    h = tcg_prepare_user_ldst(s, addr_reg);
+    tcg_out_qemu_ld_direct(s, opc, data_reg, h);
 #endif
 }
 
@@ -1936,31 +1946,32 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
+    h.base = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
+    h.index = TCG_REG_R2;
+    h.disp = 0;
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
+    tcg_out_qemu_st_direct(s, opc, data_reg, h);
 
     add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
-    TCGReg index_reg;
-    tcg_target_long disp;
     unsigned a_bits = get_alignment_bits(opc);
 
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
-    tcg_prepare_user_ldst(s, &addr_reg, &index_reg, &disp);
-    tcg_out_qemu_st_direct(s, opc, data_reg, addr_reg, index_reg, disp);
+    h = tcg_prepare_user_ldst(s, addr_reg);
+    tcg_out_qemu_st_direct(s, opc, data_reg, h);
 #endif
 }
 
-- 
2.34.1


