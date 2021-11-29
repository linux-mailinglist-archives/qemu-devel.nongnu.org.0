Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D57460D42
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:27:14 +0100 (CET)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXJx-0003jn-Vm
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:27:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX07-0006LY-0f
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:06:43 -0500
Received: from [2607:f8b0:4864:20::42b] (port=35421
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX05-0000Yj-1I
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:06:42 -0500
Received: by mail-pf1-x42b.google.com with SMTP id p13so7632125pfw.2
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1milFWRlxmjHs2wPWKUhveKm7jJqNElG1gH3QnTU80=;
 b=Z7dQeEHUNGsUIO+8fViE35iR4NNedmrdNU7mrTM8Cr5WursC2764DP3VYx0qd0kdhX
 3pWJc8BKC0qorEa/LdjsmCN1G1n4+eV8Yz0p00VWi6S5wZCZl9BRJsnSVzdAnTXNEiER
 /XdHUdn3sGrApWWN1ZpnclkgRoFf5r75GVC1rune4ZP1RqUXFm7ios6qoGkmzTpwYrnV
 SNWvXuethWPMLYI7Skf9NeG214PRTjpm8eVq8TGSz3BPXUKAOKYfLMdsCKWihxEBEeGr
 OXvs1Hywd0xp5rigbTQHtJDfXRiHd/AmV8K4GctyRpqCGoxfKAE8Q3BXF+U0fbdnemjz
 +gnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1milFWRlxmjHs2wPWKUhveKm7jJqNElG1gH3QnTU80=;
 b=ZbxL1fo/lzAsf3RxXiGLjzeetynW7QXEqNsihl4aIFwxLFrm0svgkDefzVeF938FJU
 rvB9BgBZDpJb0GrfeoLOr8vUr4ggiLo+7hfqCC2yLh2s765PGzcoGThzY+cMIPA7RqJu
 a5cTctzYCB6uBuQzslitc2Y/hCXaQ+2EP7b0ea6VGT6TEuNizxQjFJhJo7Dh7Dzhdxcj
 HKzN9itVSCxWSAEyjvnz8k9aFermM/735K02O37WJQzRDZr3bsjRvID2HsSQ+pkF1vVH
 SzdUwv4Q3hiYzXiC5U/LOy5jZ8VImZ7Yc8yBfb5a5j7Ra40p1uhRM+tbbUKJtb3vDh7H
 aJQQ==
X-Gm-Message-State: AOAM532hV7EF19zRO5+6NqJr1AD3Ems6PIF6g7ybmolP19WvR+tGxbtg
 jEwbeI4+Da/v9KOK1bF565tcERNDuuh7Apkf
X-Google-Smtp-Source: ABdhPJwMcehGjVY1qz8UNJaWqMvlVQWO9OjLLSFLS80cP/xEmbn646fNjArO6fCco+slJgeGQW0N0A==
X-Received: by 2002:aa7:98dd:0:b0:49f:bab8:3b67 with SMTP id
 e29-20020aa798dd000000b0049fbab83b67mr36646021pfm.86.1638155199687; 
 Sun, 28 Nov 2021 19:06:39 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:06:39 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 37/77] target/riscv: rvv-1.0: floating-point move
 instruction
Date: Mon, 29 Nov 2021 11:02:57 +0800
Message-Id: <20211129030340.429689-38-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


