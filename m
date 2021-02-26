Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFECF325C21
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:48:52 +0100 (CET)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFU7X-0003p4-Pe
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTin-0001L1-LV
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:20 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTij-00025o-OF
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:16 -0500
Received: by mail-pf1-x432.google.com with SMTP id q20so5312017pfu.8
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VlkAAJ1j5WmFWndiLH5xuDrnWtgYalvcYw/+Hn68wnw=;
 b=iIpEkpaDO/VXMXyA8ZMjJNy7NcjukeKTHIpD7NJ3xoM+Kr6vAxiUuVBffCEf3kMmQ+
 TW5HE2rskN06ORG9jbdYF1/pYLs3oyyUD0UioD9ZK89demVV8cWCjSADK+8U1QxVE7Ij
 jWKyTlJLJ6+ILJq7DHljnOkOrTUdhBCLYvCTml8EUT6m1QwWWVjRYN0QzH0KMa6NPCDU
 kRxWz21W1LQiZ+suTt6k99QZ4PrGDZshWYKy2OA8bwkc9spoZFUQ+U4u/bsRat7dMHcf
 cERMnby+HEpXwpGtkgHykzrOUErGpZdfymWaHTIrGQgILt8GQy7xbdtMiaxwyDLDvs5u
 wP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VlkAAJ1j5WmFWndiLH5xuDrnWtgYalvcYw/+Hn68wnw=;
 b=f0NBzsSWCCKbfCnY2kuxIsK3ni7WIPeATytsZzgs1nB2kUenbSV/rngX6f1cwuhK9P
 UkERIvKcpolt3nzcVM9TVLdERubGwqv0SomYuyw2mIQkwcpliABjmOxKkLXrKZoEi955
 QKiS/oV8rdPrFGHkaXBSOnoOvBs+ftP51plfZHxGvKgWma3EyV0e6y2oOYU6Z//jmvcy
 xIvAZ6aoawkR+HjLW2Ac0XfRoARaseq66waraVNZ1wIdGzdVjbekz6PcsWWuXJ3RZKOY
 qjauw7EM6FeRbz4ZSL0C7/XQ+Gkzr9R/SQNu/q81LY1GktItOsyB1bhIdtBy0ZNavwh3
 2dkg==
X-Gm-Message-State: AOAM531noKqTFgY2YGaSXIHeypnzGrHLJJApkHA3TbzZs724NhIZ4Sa3
 3bTZITRlX4wsArxatrZ6I08jnD76SweD5g==
X-Google-Smtp-Source: ABdhPJynCAnRHuicMuj67u1lE9UXaCSDhbwjY1zYi/7cKndV2Xa+gd+rd8HvGWcpdw59j6WyfnlLnQ==
X-Received: by 2002:a63:4f57:: with SMTP id p23mr999224pgl.281.1614309790905; 
 Thu, 25 Feb 2021 19:23:10 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:10 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 42/75] target/riscv: rvv-1.0: integer
 add-with-carry/subtract-with-borrow
Date: Fri, 26 Feb 2021 11:18:26 +0800
Message-Id: <20210226031902.23656-43-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Only do carry-in or borrow-in if is masked (vm=0).
* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              | 20 ++++++++++----------
 target/riscv/insn_trans/trans_rvv.c.inc |  2 +-
 target/riscv/vector_helper.c            | 20 ++++++--------------
 3 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1e2508adfb8..2806334a31c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -353,16 +353,16 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
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
index 91936ec464a..7711f86230c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1774,7 +1774,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.3)
+ * destination vector register is v0 and LMUL > 1. (Section 12.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c37d0404113..8e122ba41d0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1153,7 +1153,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     for (i = 0; i < vl; i++) {                                \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        uint8_t carry = vext_elem_mask(v0, i);                \
+        ETYPE carry = vext_elem_mask(v0, i);                  \
                                                               \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, s1, carry);         \
     }                                                         \
@@ -1178,7 +1178,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
                                                                          \
     for (i = 0; i < vl; i++) {                                           \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                               \
-        uint8_t carry = vext_elem_mask(v0, i);                           \
+        ETYPE carry = vext_elem_mask(v0, i);                             \
                                                                          \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
     }                                                                    \
@@ -1203,19 +1203,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
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
@@ -1233,19 +1229,15 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
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
2.17.1


