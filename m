Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D75B43F9C0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:24:53 +0200 (CEST)
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgO84-0000Ro-3P
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNka-0005Ru-Dn
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:37 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkY-0005Hk-Jj
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:35 -0400
Received: by mail-pg1-x532.google.com with SMTP id b4so2249606pgh.10
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UuHNpuuvenRB0lpb7qiWwBNdMSBwJhbiU5uEpMv2qBU=;
 b=YAZy6Ef3wvDdVFlA2szmyKruoUVUoeAhWEzACLuNfXuhBzj4jD62q4XWbV3+poeOj5
 77/P8O1DjpY/do3PHYgl/EzEtvrFuf0fx2voFVvYZizlGMtAI2kcdSdiqHitGibmH8BW
 ck8XzLBIFTa0IgmfCA46PEwGRQ7aL/EoG+y8UY9J/009xUwkbVh3RIomhh9u1jDMzi3D
 llbtip17VGwd/HZodMmj2OrBFpe8tUt9tDKuwCUtyKIuxpLWcDBotPDCJIEBtA5oFzR7
 jHBnr9+4sLjFDwbvhgS4u9xCJUK84qXNAzeVBPS+AAfgRw7oym+rEaESGNWNmq+jmEDI
 0VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UuHNpuuvenRB0lpb7qiWwBNdMSBwJhbiU5uEpMv2qBU=;
 b=BeOOOmwHjU1qJ3UXoRXraFuUJVgJ4FT9TepYKQvrtztXqKivcMeSilQGNSm9uy1lFH
 jAOpmR6HX9kiDyWybRBihX/DzBE/aYpWOD4OojPbXrbnPRSvn9etHiugwEMNCM/5rACF
 Bsb2YUdQI8KMR3/LDBHSuqzMgGzJgNNUVAvrOxBYytB2/GM+zP6RKMZtu9iOnWihHFFT
 zMKL+Zp73SxJhjbSDNXPBQaTId4GR+dMl2MQXY3BL4SBRTlkvh51U63uywcEmB4/Hg2m
 XJOTTSF5AD6XygjgwS65KmsTYpTiUP4uX/77P4uqmuri/jB92ajIhgBQDP6djZD/tzAR
 uorg==
X-Gm-Message-State: AOAM533Ktr4blZ8Cp59UvSmRPajFEt6+6chm9sgZWAjlhwkXRtqIjPtC
 +tGeeRPH0tx0M/DIhyW6JbmEtTXIRPO5EOh5
X-Google-Smtp-Source: ABdhPJxjz8jqwwKwU6kT16A8Yl0/TWminfq2dOUazPPa6gHiwYsu6jdMObLol2zw0+lgj1dKHvhc/A==
X-Received: by 2002:a62:2c82:0:b0:44d:71c3:8a3 with SMTP id
 s124-20020a622c82000000b0044d71c308a3mr9646245pfs.84.1635498033127; 
 Fri, 29 Oct 2021 02:00:33 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:00:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 17/76] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Fri, 29 Oct 2021 16:58:22 +0800
Message-Id: <20211029085922.255197-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x532.google.com
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

* Add fp16 nan-box check generator function, if a 16-bit input is not
  properly nanboxed, then the input is replaced with the default qnan.
* Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
  generate the NaN-boxed floating-point values based on SEW setting.
* Apply nanbox helper in opfvf_trans().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 35 ++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 66273afb537..f9ace6ae412 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2098,6 +2098,33 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
 /*
  *** Vector Float Point Arithmetic Instructions
  */
+
+/*
+ * As RVF-only cpus always have values NaN-boxed to 64-bits,
+ * RVF and RVD can be treated equally.
+ * We don't have to deal with the cases of: SEW > FLEN.
+ *
+ * If SEW < FLEN, check whether input fp register is a valid
+ * NaN-boxed value, in which case the least-significant SEW bits
+ * of the f regsiter are used, else the canonical NaN value is used.
+ */
+static void do_nanbox(DisasContext *s, TCGv_i64 out, TCGv_i64 in)
+{
+    switch (s->sew) {
+    case 1:
+        gen_check_nanbox_h(out, in);
+        break;
+    case 2:
+        gen_check_nanbox_s(out, in);
+        break;
+    case 3:
+        tcg_gen_mov_i64(out, in);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Vector Single-Width Floating-Point Add/Subtract Instructions */
 
 /*
@@ -2151,6 +2178,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
 {
     TCGv_ptr dest, src2, mask;
     TCGv_i32 desc;
+    TCGv_i64 t1;
 
     TCGLabel *over = gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2164,11 +2192,16 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-    fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
+    /* NaN-box f[rs1] */
+    t1 = tcg_temp_new_i64();
+    do_nanbox(s, t1, cpu_fpr[rs1]);
+
+    fn(dest, mask, t1, src2, cpu_env, desc);
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
+    tcg_temp_free_i64(t1);
     mark_vs_dirty(s);
     gen_set_label(over);
     return true;
-- 
2.25.1


