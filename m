Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29142F2C65
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:16:05 +0100 (CET)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGia-0007F7-SF
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCx-0005xV-UH
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:23 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCt-00088f-IS
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:23 -0500
Received: by mail-pf1-x42d.google.com with SMTP id h186so1084295pfe.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Yt30Q32C4cuAIMO7vok+bB0yDg0NLnfe8ThfRKMB4z0=;
 b=NuyW72a+1INLL3yvjp7MgoaSBN6urlNt+kbeoij4ecBmSoa4aE+ke5mjfrljFp89CU
 aU19DytmAn6GEn2nWNkXHNiIpCRrPfbgYccXvRYP7NPVNvUk6idevxum/6xHs1Mr6tnN
 qXQVGn/IXAOpLE8zYAr1CuvK3xx0PG01HTKPG+olIvHxZp5jeYtKcM8MxXudQXktanUV
 e+c3zWXYAkhtYYLPFcOOplqj+gba2KDsPIlXTOk+hg5OG/Xjo4zZskeKLv/2Ckb0vUG9
 wjPzEJ2MaBBUg9Xxq3T4cHhMRy/aeIBekEuOv8tIOz0Bi8pKuQrTlo4D5hUjnd1PlTmB
 QflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Yt30Q32C4cuAIMO7vok+bB0yDg0NLnfe8ThfRKMB4z0=;
 b=HQUVtg/GL9QsQ0axv+dY7vdcdDUDePgcTNX8VDl+uYYC0vS3ykcnaZ+V8JhBkktVtp
 2sHs7ShbgXu8sauLmyL3E66ZBBPiBjFCJwlah9zdw8D3+ZnPfFnAOl1AKjtrxzXRkx7y
 0dgxVM8598NyvCZ/7Htkzo1YgcS1dqsuX06rpOBqWPdmDCJrtQRNMeW4VOjGYbxowc8x
 hSha+tZK2K8x1Q/gNctz8p3Vb7yX+b7uluuRt+KUcWjiEt0sLj5LbVKwpLAw/IJEbEF9
 pQ4JEExrVUgrK6LcoRhB5/lb3gCbxhJU3bzOyw/ma+iRqu19O5Oxtx4Hi9vINjbsHlpv
 SV1g==
X-Gm-Message-State: AOAM530pe/BCiCysPamMToMbW/V/kP2IdGDHhAnThJDrnvmo/y3fdYd3
 Hpq8Z+S5C9eblxLvmsWi0B3SXYnKB4ANeLTh
X-Google-Smtp-Source: ABdhPJy9l1INP2W+GESLkOKKx/yEUZLF9AdyKRQkM12Zi7SRSvhw/sItpsGyAKxID4FMw52L/vhFXg==
X-Received: by 2002:a63:e101:: with SMTP id z1mr4018424pgh.190.1610444597896; 
 Tue, 12 Jan 2021 01:43:17 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:17 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 48/72] target/riscv: rvv-1.0: mask-register logical
 instructions
Date: Tue, 12 Jan 2021 17:39:22 +0800
Message-Id: <20210112093950.17530-49-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 target/riscv/vector_helper.c            | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 523c6cf7f6d..8386f4f2aa8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2881,7 +2881,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
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
index 93ed6f54e99..a2ef6b708c8 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4440,7 +4440,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4450,9 +4449,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
-    }                                                     \
 }
 
 #define DO_NAND(N, M)  (!(N & M))
-- 
2.17.1


