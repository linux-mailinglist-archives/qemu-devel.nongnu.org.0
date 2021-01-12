Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F32F2C4C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:10:00 +0100 (CET)
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGch-0007bg-R8
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBb-00048B-5b
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:59 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBZ-0007gx-Ku
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:58 -0500
Received: by mail-pl1-x629.google.com with SMTP id b8so1129349plx.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V3mdpUjz4QW8R/1W9UXh+jt7XdFGKgdfL2J21b7EqN8=;
 b=e/21vdvr8dg7e7QOFvf6XV3G+mWdfXn32JI7w4UViqaCmpNpEs+SzbRCVwvdatWvw6
 D6vIZPGHIh4HMH1+xfj5vtrAV62gIFv+SEaUwv7lrAC3nE9P4MsYWAabjiaIJPiVWp6d
 2VdACByoTqW/zQcKNSU9nZA78BP5WvaIZI7xlNJYtOFhK4jShS3K/PAaRyPVnrVsfCm7
 ad0sY/yr4kNfiwrFEDVN+YFj0jLiSvG6iTdw4OqbAgtrzCadV8uNsTIkoQiG0o6tRqnH
 6XSvC18EVrYC6pHeklJ+zGZYPc4AMBh+BZ0IyS2ceuvodP0G00NeuGoSKOL2LPiwwNYE
 P+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V3mdpUjz4QW8R/1W9UXh+jt7XdFGKgdfL2J21b7EqN8=;
 b=fwVykn5BiCx7dKDQFjUV+pJkoE6uPF62nCgTwXy2kwVa+h/n2F4pUeK0R+lNnmcms2
 o87UPnv8eJWI6+iJygPeaopQA8ejwoOId/NbqY9qW1frfWQ8sQmDRQNNMYwhj2Mp8HQd
 I1l0dHjZ0kO8WoR0/pKEj7ZuOgRekhi2Q6x+tJYjyDvji9CBQ37aUTAM+RloJOuVOeSN
 iJKh9/LCVC04Rs7UCzcxP5CDp+/NxZrdMzPXVlXSxHTSpqCjTDfBHrYW8f+NjzViiF0y
 bAEcDKzah2dzAk9vRpFkb2VP3l2tPBMOvUUwc4T4BD+hfqv/iLGcMBeJdcQ5dlTtdieu
 uuGw==
X-Gm-Message-State: AOAM533MzUynl65THWx/+jloUW16wkcEygWEeMlXMLmNqQaJTkpVALQp
 dLzdAK+87vrLhJfPI6GMtXWlXEjjVLy6Jwrd
X-Google-Smtp-Source: ABdhPJwlY2FfxBmkIVt0xfPJt3uuxVosQ9Gks/atLp5oo7VCQHIvCbl0zG5D05U1qSb3gGg5Tl9jEg==
X-Received: by 2002:a17:90a:f0c5:: with SMTP id
 fa5mr3756143pjb.144.1610444516139; 
 Tue, 12 Jan 2021 01:41:56 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:55 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 28/72] target/riscv: rvv-1.0: mask population count
 instruction
Date: Tue, 12 Jan 2021 17:39:02 +0800
Message-Id: <20210112093950.17530-29-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 7 ++++---
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 5ec364caecc..9d1601510f7 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1061,7 +1061,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a0a47dbceb3..0f111c885c3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -602,7 +602,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
-vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
+vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 72d0bc109b0..f658f8566da 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2893,8 +2893,8 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector mask population count vpopc */
+static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2913,13 +2913,14 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vpopc_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(a->rd, dst);
 
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
         tcg_temp_free(dst);
         tcg_temp_free_i32(desc);
+
         return true;
     }
     return false;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8556ab3b0df..517e7344b96 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4420,9 +4420,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
 GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
 
-/* Vector mask population count vmpopc */
-target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
-                              uint32_t desc)
+/* Vector mask population count vpopc */
+target_ulong HELPER(vpopc_m)(void *v0, void *vs2, CPURISCVState *env,
+                             uint32_t desc)
 {
     target_ulong cnt = 0;
     uint32_t vm = vext_vm(desc);
-- 
2.17.1


