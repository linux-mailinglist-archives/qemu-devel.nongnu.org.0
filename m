Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8F2F2C74
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:18:33 +0100 (CET)
Received: from localhost ([::1]:50308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGkt-00028R-28
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCC-0004rm-38
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:37 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGC7-0007s0-1p
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:35 -0500
Received: by mail-pj1-x1036.google.com with SMTP id b5so1309695pjk.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7L01++zmmcUk/oPUb7F7cFyJH0k+kL6rdsnh491Ajgg=;
 b=elTW5SdvzA1E8l247tCogeNxrSLDlDw4je6RGITJ/O2eZXyRt8NJENtBe1PUQjVPk+
 6rEqbDm5uOuv+FCEE17y14vq2VAKEPjIWh7FEM926SYj83CTfAYUYZraEjcG6q3fEowq
 GjRDcLB/Ab90qBM5QvpBimVHMREnnxfXdiofGACo2Y/tvIYS45GeQ3OOvciSur3I52De
 SdegCjuD5LYlMXqH8h2ibgmjUYkHrY6nlkR226dvWjE6gro67xnxWjqn/4SEqhSTbt9u
 W0r3lp63xGeVPuv7ks8v4ZfQ1sVdWCmXhgDDey876qsHMIeqf79/DOLecqBIWgpoqi0r
 vw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7L01++zmmcUk/oPUb7F7cFyJH0k+kL6rdsnh491Ajgg=;
 b=tcNzIBLb6HvFMQrLzI28Kvb1PAumLKqLPeG+jiKt7a6lqgmC/qh8AAxz2W2VvbAGG8
 /X9kK105TvSBhbv77bWghywSVs8l5B6MUkte8z2Zkgptsn+DUTXy8h/6GrKJ87wSYPwO
 VrZ4hPv6/RvNAEtRda0bBhPqhm8Yh2nFv2skJIwLjdYNLR98Pxyjg0nfhFyhrIwMy8td
 9Cws7wCemeEUI/DTm7OwVIW+pXdxN/BD/qxIoJ+XnX/IRWTUBeuIcT3QRkq7+8gLmp1y
 Qp1jDfRDjW7U7W+pT/t54sTGS8tMMFtoxQDTxPOvGQf9Fz+a4ZbTTDQU0smwRAs22sXH
 Sp7Q==
X-Gm-Message-State: AOAM5318Vz/Q11ADdmtWvA4fNudFz26Auy+CLi/QriB9mCBFEZu2rpCz
 cuQlN1Uxizt7kO6Jqfn9sIPADI0HzzVUijh/
X-Google-Smtp-Source: ABdhPJzH/txpKbDlcefac88kMzONDSzTdUMemD8HjBVZPRTIi8eoXAXFpwGFnZ+rKDOVL3Mde8OGjQ==
X-Received: by 2002:a17:90a:7844:: with SMTP id
 y4mr3759562pjl.68.1610444549449; 
 Tue, 12 Jan 2021 01:42:29 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:29 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 36/72] target/riscv: rvv-1.0: floating-point move
 instruction
Date: Tue, 12 Jan 2021 17:39:10 +0800
Message-Id: <20210112093950.17530-37-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 1839fc0a56b..7ac7d6a2b92 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2691,9 +2691,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul)) {
+        TCGv_i64 t1;
+
         if (s->vl_eq_vlmax) {
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
-                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+                                 MAXSZ(s), MAXSZ(s), t1);
             mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
@@ -2707,16 +2713,22 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             TCGLabel *over = gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             dest = tcg_temp_new_ptr();
             desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+            fns[s->sew - 1](dest, t1, cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
             tcg_temp_free_i32(desc);
             mark_vs_dirty(s);
             gen_set_label(over);
         }
+        tcg_temp_free_i64(t1);
         return true;
     }
     return false;
-- 
2.17.1


