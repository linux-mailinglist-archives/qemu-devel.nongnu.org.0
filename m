Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CC043FA68
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:02:57 +0200 (CEST)
Received: from localhost ([::1]:51728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOiu-0006J1-LY
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnG-0008Ao-8w
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:03:22 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnC-0006eo-5H
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:03:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 x33-20020a17090a6c2400b001a63ef25836so502892pjj.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ftvjvCQfoklWOqLL2y7YTSZ6nmoxZ3vi2iOlXpfe2XA=;
 b=G0ZeAlLtw8j601DweL0bw7VEgLzBJaH8q55tBSZc7I8dep1Pp+NV2cKWb/Wbq7fiBx
 LLMMa0TGoX3DLgTmTJbjd6aO7JSMIYBVpGOzL7qwDR1oCAh8kyJ0bhUZJzF6SWUYjAVM
 PXSXmBvN7XD81HIMJUbxooidcl9xf7B9iRKjDDmRLiqSkU17xheRQpUI8ZaMoXAzRvoJ
 t0SrzgiZyn7rV+udn8BdcIPEDA1b87wp2EzVmdzXyINWD2xle6VlQ8mtBAsMMkuZ6PIz
 OjkUHatVE8Bi8Am28C4q6xWvOn50KdPOkpqRAZIf2xyjvy8kXv6ZZWOKGjibg9yKMD1U
 zlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ftvjvCQfoklWOqLL2y7YTSZ6nmoxZ3vi2iOlXpfe2XA=;
 b=dbNEUn7FxCAr+QRLU+ZyyuQEq700pgv/657atr5hdldKATy5ot959Wt5PNZpbhBgnq
 RMBD9DL8L4htjE5Frbur7CRiWfv4qeLt9x8Jy0U4Dgj1CJ9UcZPHLebdXeQM7u+lDJ8r
 AVF1BNdvEZDAbqnSgpentPFtumYIJkXlvYVdp5Z8kMA8vv6xfcNNXJ1h5hiLQJkZLKQp
 h3ts7QdZ9IjZ0wisRnNiUmwx0YbjVoWSuwSg3RAIIoOqMHKx9IODHfFx0g5tfe1xxgZR
 0uR0hbqXZBWs7vEkAEKYQU7FRrviId74EK2xOpqRXfGCS+IptRoEq20hM1IpStzHrhRt
 m3Ow==
X-Gm-Message-State: AOAM531DwiEA07VCf9rJWvFJBkqx9d1L2jrpca15HlZVt1LdoZvz3F75
 UU3QXQAHHB1QaYreSPHYmed8WT/BZlKO4/k+
X-Google-Smtp-Source: ABdhPJySvqk0QUH1u0Smx5SU0/2HAoUP8IA95Ocm5lRqYwnSzg/YMWOEhzqhdOHsS7tRI48dJxZNDA==
X-Received: by 2002:a17:90a:640a:: with SMTP id
 g10mr12136189pjj.198.1635498196820; 
 Fri, 29 Oct 2021 02:03:16 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:03:16 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 58/76] target/riscv: rvv-1.0: remove integer extract
 instruction
Date: Fri, 29 Oct 2021 16:59:03 +0800
Message-Id: <20211029085922.255197-59-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 82484fda751..20b3095f56c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,6 @@ viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4c5f813ccf9..1ce5a10b6a8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2840,8 +2840,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -2941,27 +2939,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
     load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
-static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-{
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGv dest = dest_gpr(s, a->rd);
-
-    if (a->rs1 == 0) {
-        /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0, false);
-    } else {
-        /* This instruction ignores LMUL and vector register groups */
-        int vlmax = s->vlen >> (3 + s->sew);
-        vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
-    }
-
-    tcg_gen_trunc_i64_tl(dest, tmp);
-    gen_set_gpr(s, a->rd, dest);
-
-    tcg_temp_free_i64(tmp);
-    return true;
-}
-
 /* Integer Scalar Move Instruction */
 
 static void store_element(TCGv_i64 val, TCGv_ptr base,
-- 
2.25.1


