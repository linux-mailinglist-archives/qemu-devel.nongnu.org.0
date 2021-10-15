Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9142EBFB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:23:11 +0200 (CEST)
Received: from localhost ([::1]:40382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIUg-000226-CI
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxu-00010j-EO
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:18 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxl-0003qg-OT
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:18 -0400
Received: by mail-pj1-x102e.google.com with SMTP id kk10so6676498pjb.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vveCAHhRvzkaJ734nZh2WZbf1uFJlX98LAsZrTZc6yk=;
 b=FArYqGra1LRTMj43U7Tyx12eKyBAdSU/KFhHH8EvhI2evyT5gPQy3BuKeVhwwWoCiN
 sfwbCcbXdCubI6cr9emo8NiuVhUiT17w8o5CAEgxlvAB80WLsURQ/iVuZBCXodZH+wWQ
 rZot/tRnUNjSj/cdT0wdcuSxc4ZInE40USlxl3x4Ck/lC34t1Nch7IDqe9HwE8aB/5r0
 WdM3115MnApvy6oVD8+rnD7sC/oixJGDZ+/VybIPN4TYlEsnWTHXnyz+Dz6kowQi/ofK
 rL5frLVdNYDAt5IPaAz3sPcPBm4wVtRDbs5gPtVSTdGd/WBA/AQRTFXdhqI3a7rYznv8
 Itew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vveCAHhRvzkaJ734nZh2WZbf1uFJlX98LAsZrTZc6yk=;
 b=xCvmEtDRL+wXXy0O0rYwL9Y7ggoql6WlIr3ND3UI9M/P+gbrW6NhC7BbKNi/enondr
 drjYV0CfeUUVNvkhVqutlKKK7gyFuqPYiSDRaZa8g5U9g+vLwefGg/aqbI+ewOKkUI5G
 hpHuLU0nPhFH6RHbOrz48gurBSMueKmFP2n2RtipvPc53CKEwhmff74wyFnPldHrrbGQ
 A2s5sOfA92vowx2Oo95+KHtqWXCd1sHYenJM9sakBMHjbXBz7H7EZvWmlU3gIODlWrbz
 teij1JDTuwro9PmfX0yuuyBSQAue4IV9w8iwQ+q3BY4GbQZh3O+2EPGrI2iEmao91trE
 zQPw==
X-Gm-Message-State: AOAM530Cg1p38vQgAX9pARg5T9zjxxUrsuOTNd1/kvgkv7Eh2DSL/a2r
 MVoTfHKfk7/zgZCFTA5zd/NViONIBuBVLBgF
X-Google-Smtp-Source: ABdhPJwXxowWtc46c2FVYC/GzckDf8JI/z10BQeXLQO3SG2xfM/Nt+2OqJsfP2XWTJHyQP0RxJQkdw==
X-Received: by 2002:a17:903:2306:b0:13d:a304:1b55 with SMTP id
 d6-20020a170903230600b0013da3041b55mr9732723plh.51.1634284147319; 
 Fri, 15 Oct 2021 00:49:07 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 37/78] target/riscv: rvv-1.0: floating-point move
 instruction
Date: Fri, 15 Oct 2021 15:45:45 +0800
Message-Id: <20211015074627.3957162-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
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
index 42a9f2764d5..1340ce56806 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2460,9 +2460,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
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
@@ -2476,15 +2482,21 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
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


