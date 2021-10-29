Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9661B43FA31
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:46:48 +0200 (CEST)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOTH-0006Gr-Mf
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNls-0006G7-SI
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:58 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:47090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlq-00067F-Em
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:56 -0400
Received: by mail-pl1-x62b.google.com with SMTP id p18so3109837plf.13
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1milFWRlxmjHs2wPWKUhveKm7jJqNElG1gH3QnTU80=;
 b=VJz+zVmxxtCeZ8hfJlhiGkWmgT4lpXFoErIGpr90d3YpV+0VcjlzpwOi5fMBSCqs7s
 5XxempI0IaOdP7TGKpqZz7qPiBWkGxR8ay+8JkRsqGHMifvo++l3dA3OZrh6QcUFiJcG
 vyeey8TJMcsTiDyzlOPpeQl1SaB17UckItaGjtouUnFbimCNcfUzaMRivtQBme1F13+M
 r1O2hQOnpSjP2l4SQM38pv2vr6SDxSp2mYBf7f1/bIpzlVGKhPxmZDxUVuukIEpSdvAd
 aKujD0zEiV92e3GBDNOjP3ZjJQCkAn4hxCqwnorXDR877sSw4fUVY71ZAW16S08ZZH6j
 1O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1milFWRlxmjHs2wPWKUhveKm7jJqNElG1gH3QnTU80=;
 b=j+GnpbDHidkIXEIUZsayRDq1vELeQVNQUWsZslSLDxi2s5tfeNTt+bfgskaAYYUtSG
 zslvSCsbRJm3sp5Zm0NWufjSK7TUzeftWPH4T5fYPNMaAVNoMeHxMah9eoc0ovMTOPiy
 UOqTj/HyIwrmnMuvtQ4N4PjbSmad63YuhFKxINo/lfKwOO6ph+Aqx7Dga0tnZp08S87F
 abr9556yQ/oIbk3KuK07lG4nzlz3Oko8nrYkOKi+GSsleysVEijjfHwSi4OiPtRi78aO
 w9mkiG5zpdeL63BG6DMZFnlX9NQu3TzM0LdTknG0p2vfC0NlGPIRTsapsLX0/xn6Phv7
 xRJQ==
X-Gm-Message-State: AOAM531j2iCa58D3tHNoGLAHPYm5H6p4IqI/IObD1VU50my448NRhfGl
 S/ac2fsu7saE7GKOY1iylZtLfYpQwvvtBtof
X-Google-Smtp-Source: ABdhPJzrwiKfO7CgKq/Vi4Tcxl+cvJivycKZVMzX2m/iK7B9e6OzWTn/5FrSFEE8t8OAQ2HfcxnDJg==
X-Received: by 2002:a17:90b:1c09:: with SMTP id
 oc9mr18257736pjb.33.1635498113161; 
 Fri, 29 Oct 2021 02:01:53 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 37/76] target/riscv: rvv-1.0: floating-point move
 instruction
Date: Fri, 29 Oct 2021 16:58:42 +0800
Message-Id: <20211029085922.255197-38-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index c250943dde8..2c8002af543 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2461,9 +2461,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
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
@@ -2477,15 +2483,21 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             TCGLabel *over = gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             dest = tcg_temp_new_ptr();
             desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+            fns[s->sew - 1](dest, t1, cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
             mark_vs_dirty(s);
             gen_set_label(over);
         }
+        tcg_temp_free_i64(t1);
         return true;
     }
     return false;
-- 
2.25.1


