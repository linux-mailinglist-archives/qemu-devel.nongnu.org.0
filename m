Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EC522953C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 11:44:50 +0200 (CEST)
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyBIv-0002bi-AS
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 05:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwV-0005uG-Pz
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 05:21:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:33164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwT-00065C-Os
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 05:21:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gc15so2631737pjb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OUSvqk8N0OEsedcBlB/CQ0Og2x6aYFwr+QYiYEPQ0xY=;
 b=iNXdyGlz//tjnG6CqKIt5OYuZmyZMR4FAgsN/xp+MJTxb8vgUaYv4Bz6vCQcD2Iaux
 GUTtidbA0Zl2I6QhPtwy3JnhtHaKqOF517u3VyGFOw4XS9bTkFMtr2+i+noxelvezroG
 oLnvArjXYHpU+ZHKg4+1KiOjsWRLnEKAXwREh1/xamUi5ZPv+WQ3dpYn9CpVM/oQRLL6
 SWHcBXoBBlqiAk7RuLfbaJ4/OyGyXZVvl2Ti1wuzks/jvvIb2skI3oee//ItVMheP/IG
 6skWr2arJAVmQM5CkG/qCN+JiqsvYfiJFF1H30dGAaP0TtTKvgfZIoYnjlCdGR7NCLMe
 La/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OUSvqk8N0OEsedcBlB/CQ0Og2x6aYFwr+QYiYEPQ0xY=;
 b=hZ7X37SUj2gtycFw/s0bdYB/Tb12TS8aEEly306j4dtNzvnW5oX8u0Ku3b4mtbPfoB
 5qWvbrPWGJWYbPvg6d8LuD22cWHfJp1wvSfyJtNe5gLHJ7F7KLi7vsirmQtF4QKZPV+c
 Ced3VmuZOxgEKgXmqkRDm+7LB3GU1Y67XVXJSpF7JxtzQRxyM4d/6AxoeZm2Ie95fAP8
 MhD1kS42wpp3OqXlUEO7OUOdVj95I238iqzpF/dOzbRJZ2pkjqTR7JzdJVeU8vdpTG8a
 +QgpgVAAQWf8wQgE4UCPpYInHXDIxlemgYdiDEFisWJV3zjTRuR9xpHEqqmLvxRdhMRz
 SUXg==
X-Gm-Message-State: AOAM531L17TsAJ7gL1N2iNzZIphRonHvYn/o84BXqNfMNFEZNT3X99D/
 vx/GefxEbACmhpMRSx9PgAeQ1u06oXc=
X-Google-Smtp-Source: ABdhPJwIb5FJZuXoMY5P89e0fIHXnLwz85EXzjZ91/EJD7v9KyOLGjsUY/Dl9ZXi7KVISKlXvHQE9g==
X-Received: by 2002:a17:90a:d583:: with SMTP id
 v3mr8545970pju.33.1595409696166; 
 Wed, 22 Jul 2020 02:21:36 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:35 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 57/76] target/riscv: rvv-0.9: mask-register logical
 instructions
Date: Wed, 22 Jul 2020 17:16:20 +0800
Message-Id: <20200722091641.8834-58-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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

Clear tail elements only if VTA is agnostic.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 3 ++-
 target/riscv/vector_helper.c            | 7 +++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 378af8344d..5004707b87 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3023,7 +3023,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
 #define GEN_MM_TRANS(NAME)                                         \
 static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s)) {                                   \
         uint32_t data = 0;                                         \
         gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index fa2459d941..bb426e224c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4738,6 +4738,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
+    uint32_t vta = vext_vta(desc);                        \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4747,8 +4748,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
+    if (vta == 1) {                                       \
+        for (; i < vlmax; i++) {                          \
+            vext_set_elem_mask(vd, i, 1);                 \
+        }                                                 \
     }                                                     \
 }
 
-- 
2.17.1


