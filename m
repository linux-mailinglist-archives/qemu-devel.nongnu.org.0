Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7046FCC0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:30:03 +0100 (CET)
Received: from localhost ([::1]:39132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbI2-0006rK-KP
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanH-0004ux-Oa
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:16 -0500
Received: from [2607:f8b0:4864:20::52c] (port=44832
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanF-0006MO-Ry
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:15 -0500
Received: by mail-pg1-x52c.google.com with SMTP id m15so7358982pgu.11
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YrVbBCqWBUjBAP7B3Dmk1Z8BoSvkTj836SQMffKEAI8=;
 b=bXOfXKU0a4lAhHKDIqEqqoH7MC97x/PHVwUw2twsWCLEQI+j1nLxD4v/l3AAU9KPsW
 1mEB9hw5eXnNseCCdic+qGBgh7pAnyR9xo1BKaTktIUz2Urk8H/BZV1OkzsUAH6aBl2T
 3z71rdVa9UeAKaVZplewoeOOjbWRR9D6NPoJ+aTIW9tKnn7IiBW/8woi+PuPyVZra8EJ
 DyEgvYGH6l/Q4YeBmgKc/2NrZV4gpv/XVfTZ9VZ7DVs3GVd9shgRh723dKoqi7EDvceQ
 ES9liKZvFeKQO/GYg0o2euiDPJSNGUX1CPZvbB70pJL92qGV3oawdyTpp4EROkID3+ID
 0hmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YrVbBCqWBUjBAP7B3Dmk1Z8BoSvkTj836SQMffKEAI8=;
 b=YjHkfFNcZiIac7P8j2mTG20oYDw9Y7OtsxhXZJQt0XZWwM3Fe4c3SU5SJqdfJORnSE
 gsoLQM0ebUTeFl1yOj6mrl1n0RcOQnXytPwQy1syqbbZBc4Zg01NFn3m1y606e5QxBRF
 +VPbs3Ao0JqSIHGFoF92jxgtvkjcoBueI/GXnKynhfgEF48T1ED5XFGi5Js2fnC99j2r
 8aISQO/Cts1SnbPoiIw1ppA/4T1waXdNlPVeyKEVj1X5dKtMXipDziaakxGzToPTkiVA
 rjkCX3N/2xfsXvW+lFhLTleLNnkzD6K0WSsAj9xWrugV6mLmZwrmQW4xgxMwCQErumzj
 d4YA==
X-Gm-Message-State: AOAM531Tccclj/jFaHKc8mao4WdmlAmmNQVeRu3k7SZyTgBUyROtPM5k
 EG5zvIhjeiN52SfW1zg0HtdIGD9SV0pJlYw4
X-Google-Smtp-Source: ABdhPJwvSKY4oZrkcd4l6o2YgmIrXVQZnIQ1e0QwmEQsEbfS8Ehsj7sr/q49AqxSJVWeKkImSAW4Rw==
X-Received: by 2002:a63:1217:: with SMTP id h23mr38781190pgl.18.1639123092271; 
 Thu, 09 Dec 2021 23:58:12 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:12 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 17/77] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Fri, 10 Dec 2021 15:56:03 +0800
Message-Id: <20211210075704.23951-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 66273afb53..f9ace6ae41 100644
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
2.31.1


