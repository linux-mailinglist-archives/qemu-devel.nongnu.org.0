Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C854543FA40
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:51:02 +0200 (CEST)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOXN-0003rb-So
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmH-0006s2-63
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:21 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmE-0006A0-4x
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:20 -0400
Received: by mail-pf1-x42a.google.com with SMTP id l203so8681122pfd.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3de1QWSxsLbVEtrXoIF2Dgw1CuI6VK1mnDrbwoO2Ag4=;
 b=UH3O6t5vcSAEMzm+iRA3P5FVLWJ3filn0zvRrvpwUnq99rq09hUGMYNJhVO9p6BPI6
 VkAuFtcgILodFIeUr13WV3unsx8i9lg6GjhZbuka2HlkLjIfytUvrE2djb6SCZhfOvAJ
 2ivDomvALTQtjfTDCEHHzQSz1eDhz9BLF/Tgpe2kdQD1w9A/50cOfXRVTwy6SVh3QQgB
 tSu+YyLOVy6FaGkb/Xgtbri+x53fVB39cvvRKZuUUjYW4TbknZRHW5KdtGTBI0G92dxb
 sT2MhPxgRbBE9sQSBcWZDyCsWoIf3502wJGbiXR5lufuLRxXOZ4c5d3vnOAIhOt5Y/pj
 n30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3de1QWSxsLbVEtrXoIF2Dgw1CuI6VK1mnDrbwoO2Ag4=;
 b=Cf8f50UC+JbZRmIaLb48WPHl3K7ExtXeOUgD2l5YhBh0nzZfGhvOBMOgSk7s+QwyEf
 X6NrbmGWDMiyXypD8dxyEb+BxZAV0NZ2DsI/INomkQSlURzqim0Pi0yu9Y2NQ1xPMoie
 E8DusQ+O9/7oHcHEJAofs8xjmaR9Ez9Q4TM0dD/eWDwfomrU/iCJOuYtmbt6qScPFbYH
 HC70jMOBdOtG5sbbG7vUJubRgeWDTHecZsB+i56uyjG+FZTDpClOqKTUaI/jwK8U6q2N
 P/caT5/wKQcFow6rPEpSMdbIcrUuQJ7DhKxUksyGhYSDaavUVjKG2rzCcWbKgjc2X/wk
 nwBQ==
X-Gm-Message-State: AOAM531304nuP38FyOdKnwC0RD06ftqwIXlDk7iG5e08aENeU0At/X8Y
 R8Gt4Y69UhlZokAZ4BcrJ3j8Op60VLWDKpy1
X-Google-Smtp-Source: ABdhPJxOJrai0j4MIxDBqtvHTzJY4GLVEQ+KcQ/mMQYVMddZFnHzEBdHZtq8lMYWdhpNeezRRn3VNw==
X-Received: by 2002:a63:81c6:: with SMTP id t189mr4752002pgd.92.1635498136730; 
 Fri, 29 Oct 2021 02:02:16 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:16 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 43/76] target/riscv: rvv-1.0: integer
 add-with-carry/subtract-with-borrow
Date: Fri, 29 Oct 2021 16:58:48 +0800
Message-Id: <20211029085922.255197-44-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Only do carry-in or borrow-in if is masked (vm=0).
* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 20 ++++++++++----------
 target/riscv/insn_trans/trans_rvv.c.inc |  2 +-
 target/riscv/vector_helper.c            | 21 ++++++---------------
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f83c8daf24e..9c4089d7a7b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -378,16 +378,16 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
 vwsubu_wx       110110 . ..... ..... 110 ..... 1010111 @r_vm
 vwsub_wv        110111 . ..... ..... 010 ..... 1010111 @r_vm
 vwsub_wx        110111 . ..... ..... 110 ..... 1010111 @r_vm
-vadc_vvm        010000 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vadc_vxm        010000 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vadc_vim        010000 1 ..... ..... 011 ..... 1010111 @r_vm_1
-vmadc_vvm       010001 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vmadc_vxm       010001 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vmadc_vim       010001 1 ..... ..... 011 ..... 1010111 @r_vm_1
-vsbc_vvm        010010 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vsbc_vxm        010010 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vmsbc_vvm       010011 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vmsbc_vxm       010011 1 ..... ..... 100 ..... 1010111 @r_vm_1
+vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_1
+vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_1
+vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_1
+vmadc_vvm       010001 . ..... ..... 000 ..... 1010111 @r_vm
+vmadc_vxm       010001 . ..... ..... 100 ..... 1010111 @r_vm
+vmadc_vim       010001 . ..... ..... 011 ..... 1010111 @r_vm
+vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_1
+vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_1
+vmsbc_vvm       010011 . ..... ..... 000 ..... 1010111 @r_vm
+vmsbc_vxm       010011 . ..... ..... 100 ..... 1010111 @r_vm
 vand_vv         001001 . ..... ..... 000 ..... 1010111 @r_vm
 vand_vx         001001 . ..... ..... 100 ..... 1010111 @r_vm
 vand_vi         001001 . ..... ..... 011 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 48942129135..357615a11c3 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1547,7 +1547,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.3)
+ * destination vector register is v0 and LMUL > 1. (Section 12.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 6891f28116f..54405d898b9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -944,7 +944,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     for (i = 0; i < vl; i++) {                                \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        uint8_t carry = vext_elem_mask(v0, i);                \
+        ETYPE carry = vext_elem_mask(v0, i);                  \
                                                               \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, s1, carry);         \
     }                                                         \
@@ -969,7 +969,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
                                                                          \
     for (i = 0; i < vl; i++) {                                           \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                               \
-        uint8_t carry = vext_elem_mask(v0, i);                           \
+        ETYPE carry = vext_elem_mask(v0, i);                             \
                                                                          \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
     }                                                                    \
@@ -994,20 +994,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
+    uint32_t vm = vext_vm(desc);                              \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        uint8_t carry = vext_elem_mask(v0, i);                \
-                                                              \
+        ETYPE carry = !vm && vext_elem_mask(v0, i);           \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
@@ -1025,19 +1020,15 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     uint32_t vl = env->vl;                                      \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE))); \
+    uint32_t vm = vext_vm(desc);                                \
     uint32_t i;                                                 \
                                                                 \
     for (i = 0; i < vl; i++) {                                  \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
-        uint8_t carry = vext_elem_mask(v0, i);                  \
-                                                                \
+        ETYPE carry = !vm && vext_elem_mask(v0, i);             \
         vext_set_elem_mask(vd, i,                               \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
-    for (; i < vlmax; i++) {                                    \
-        vext_set_elem_mask(vd, i, 0);                           \
-    }                                                           \
 }
 
 GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
-- 
2.25.1


