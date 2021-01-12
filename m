Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF62F2C64
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:15:42 +0100 (CET)
Received: from localhost ([::1]:42404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGiD-0006yg-NA
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBk-0004Xx-QM
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:08 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBi-0007kG-9j
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:08 -0500
Received: by mail-pj1-x1031.google.com with SMTP id lj6so1263402pjb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=spudy6A2kz/IuNKk8c6Qdt4r6xC5abqAUDZa6d/gXhc=;
 b=IkL8WG2srfCa9Hc0EUZUJo+1vD/V82uREJyyPa2vOYJvBde8CGBzR45rQA/7KD2oWR
 nrTr+HEuh68dfP9SiiAElqOomrvanLNBXNmfnoV5fq0tn2nR84G5T9rk44fdm0RZE42K
 ZzsafjvUuBlfVx4oWm/7FeoAWG8/g2a3DkXQxdfHLGC8wE70EtsD+ZTYXdHa1DDm6JWA
 7lohUufK+B4ptKJJa58UsJNEDGrmZuYoIpI4giu5b51HatMkeRKjhiH8ZeaEFX5eHsAO
 aDjmBrWPptrcG5ckp97vQSUacGjaDlzOWBO/h7DVfN3EXUaFMMQxfayqxKdf49IHVXT8
 Gf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=spudy6A2kz/IuNKk8c6Qdt4r6xC5abqAUDZa6d/gXhc=;
 b=Jj475Fd+KCBn5xiHVhBsUtjU76+xI5DvWo8GW6yVee8bE3hV+o8swV9ltDwJAKZ6Kg
 /1ST7YGrAb1bJAC0Vhxs4LMm1f6kmWTJ0A0D93g08pew3D/KvJncjwadjWH/qFSeeOJV
 AypJ+GArKfEY4vFwuLAWofw0m4MflJqnFntA8LslJRzAt+6Evg5IH9AoQbMafiqgPfTP
 PwYmj33h1/CQJkRrIJlXE1C8XkEr7qLhAHS6IMGBWlwEQsCQzx7hErmR24ySkyJGFRcP
 2rp/WFfnp7+BnRIDkbQa5WsmAn7fM+Qsg/Ei42cN65ZMpuyffVydn3eaNN6wJXbleFjQ
 X5ww==
X-Gm-Message-State: AOAM5316c5XGmaoxoxn1sNVyIbVXEfKk9PBCKNwds2p8IG+4xKR6Gi4P
 mpdKbENlgVyzUv1xj9PTvbIJGcVdALV4FnYL
X-Google-Smtp-Source: ABdhPJwVxC/0n6q0WvJnug4S1rVcHqT5kod3xvy2uTVi0Dz2yaSZRBksswGZS2Ncen8Udn5402kkSg==
X-Received: by 2002:a17:90a:8d84:: with SMTP id
 d4mr3756518pjo.56.1610444524709; 
 Tue, 12 Jan 2021 01:42:04 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:04 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 30/72] target/riscv: rvv-1.0: set-X-first mask bit
 instructions
Date: Tue, 12 Jan 2021 17:39:04 +0800
Message-Id: <20210112093950.17530-31-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
 target/riscv/insn32.decode              | 6 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 ++++-
 target/riscv/vector_helper.c            | 4 ----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0b53ce432c1..6b3caef1721 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -604,9 +604,9 @@ vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
-vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
-vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
-vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
+vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
+vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
+vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 97ad16f2b21..5b229d55307 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2964,7 +2964,10 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 #define GEN_M_TRANS(NAME)                                          \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s) &&                                   \
+        require_vm(a->vm, a->rd) &&                                \
+        (a->rd != a->rs2)) {                                       \
         uint32_t data = 0;                                         \
         gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ecc9be77335..8ccf538141c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4466,7 +4466,6 @@ enum set_mask_type {
 static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
                    uint32_t desc, enum set_mask_type type)
 {
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     int i;
@@ -4496,9 +4495,6 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
             }
         }
     }
-    for (; i < vlmax; i++) {
-        vext_set_elem_mask(vd, i, 0);
-    }
 }
 
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
-- 
2.17.1


