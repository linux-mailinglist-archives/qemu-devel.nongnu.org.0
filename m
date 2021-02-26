Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A213F325C2F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:55:11 +0100 (CET)
Received: from localhost ([::1]:56176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUDe-0004HY-Lj
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTk9-0002ht-AL
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:24:42 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTk5-0002ev-Q3
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:24:40 -0500
Received: by mail-pl1-x62d.google.com with SMTP id g20so4569850plo.2
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+KA4+ewdFZ3b2AL2Ptyq+JJl2LWRu7NSTTd3bhaGg8E=;
 b=TmsjIYuXPSgZ8VocLaQNk7rcW67b9XPyNuwmpsOcQeSSF96SKShZ+DJLUzeu4RGPSD
 eIi08z5wAf1d57IeaPXOx5ohmgyB8GHwNGW+W0GpSvg9GDjnzxcwja6Djdv5aVtVw6ut
 5h4rqGC8n2fSUtrkBlGZrM2XLSCmbygbSGy/KoASWyj1Ki4SD+ZRQja6qr1t4caUPuYm
 sT6eNpyXoZXgOz56trgmBeqh+sBJjGKx4pCPadZKlRo8f1B3wpHDtphQBVhYzj7TASfe
 hv6HMx31ENyGZkOFE3Wq8aBmQVtUGi3dyC1JDI2w2rzj1aTEZE7i2gs3A7bomlcMtdRk
 MHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+KA4+ewdFZ3b2AL2Ptyq+JJl2LWRu7NSTTd3bhaGg8E=;
 b=j6G/vRbPWRDxHVpI02g3RS2UEpzxbkd22XAI9SmMdCn/7f0lHzvkTGNF//+782nX51
 jdBaiMiJx6CHNWpq00ASFbT0Y7jKt/WenZYQX/k3i5SFhJM8lr0F0z2O5jMWL/p/6J/J
 4L3P6zEBrSficMS1LgeglPeN7PzS9pJv3KvRwOxcvGzAH8aYpaHP+4C7hl1GiwXuErN8
 +H2Wul9enHGPpJhTFOtI01MF/dok+sCKWzm333DrSRZMPBFJMAkVIyTK4PCV4gSQO0Z5
 xtwopTNDf1j2MoeaHn59FXGFl9BU3VI0W/b10Y/56yAdC0EM3aO1RF24vPpJVE5CDN5R
 Vm7w==
X-Gm-Message-State: AOAM531AQY3HLSJjwUgZZWHgJa1ygJzI1nhguzc8EP6Swtsaet7iyJI1
 MoTRd0pELbsivp7KyKegNVZ7evoN3zfBbw==
X-Google-Smtp-Source: ABdhPJw8NnV/xS0uWM1fBDbx87omTdm3NVW4x/LvtUDpHOz/LFMut/cjYWiJQP0bzBOuia9Ohw92DA==
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr1236102pjb.56.1614309876389; 
 Thu, 25 Feb 2021 19:24:36 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:24:36 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 57/75] target/riscv: rvv-1.0: remove integer extract
 instruction
Date: Fri, 26 Feb 2021 11:18:41 +0800
Message-Id: <20210226031902.23656-58-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2d96c53d066..0d29ac2b2a1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -607,7 +607,6 @@ viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index c3ec88e238c..de7152dc323 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3071,8 +3071,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -3174,27 +3172,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
     load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
-static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-{
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGv dest = tcg_temp_new();
-
-    if (a->rs1 == 0) {
-        /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0, false);
-    } else {
-        /* This instruction ignores LMUL and vector register groups */
-        int vlmax = s->vlen >> (3 + s->sew);
-        vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
-    }
-    tcg_gen_trunc_i64_tl(dest, tmp);
-    gen_set_gpr(a->rd, dest);
-
-    tcg_temp_free(dest);
-    tcg_temp_free_i64(tmp);
-    return true;
-}
-
 /* Integer Scalar Move Instruction */
 
 static void store_element(TCGv_i64 val, TCGv_ptr base,
-- 
2.17.1


