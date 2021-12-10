Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C4746FE0F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:43:25 +0100 (CET)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvcR2-0007Ih-2L
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:43:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapx-0000wn-Vg
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:01:01 -0500
Received: from [2607:f8b0:4864:20::435] (port=44547
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapr-0000Dq-Ly
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:01:01 -0500
Received: by mail-pf1-x435.google.com with SMTP id k64so7745777pfd.11
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 00:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t+rlcdjHTCUoEg1NgcOS/4EEDSbhEugtWaSG4/haGE4=;
 b=SSG0A7cmsKtxza0W133s43iJ8VuqX+SlT+4p4H+eBC5XtqvE7HtxFRmQWouqyNFuIG
 rqVLOrcexNvJ5QFdQ9Qulj/FgDvNk3AQDUMUcrS5r7jkNqJRT0BD2nmThTQa1Qo7raLp
 qBWrecTN6UzY6oz/RqG2iG60jhcjKyRwY5v1dZGsRYN6urJ/ZyxJ4qNZhUJEXxKfFn3W
 wKbriKnnX91KFdvZQ0sftxrkiC86CoBR3YNXT3AttYf6yPft9cAPPJVTsMsdNe0DXZaF
 vrRUerxplcAeayB7JtfGi3oXTVFh+QoowOeOgXxEoNpcWDyDzg3748YaHyMrvZPT7DcO
 HbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t+rlcdjHTCUoEg1NgcOS/4EEDSbhEugtWaSG4/haGE4=;
 b=s/VCH13Q9Y4/Jc1jnPXdQqREoONNlcjO5F0GpXWHIM7+7B8G7a1OwdFDLP7pYzs965
 5sUeRDcdMhczH3auu7aj3cEZncp18WJsWpc1K7bElZAdfhnptI6AJl8k9gcXEE5hh4eK
 J2+lDsHHfU5d1S/PzRVOoIrwNiDTIMQiKJpXb5oz2Q80oKXTPLhVFpYhW62mwpvGZFIq
 lA/t2nLOGpv2rAbs1J/4Jt1SRAM2gnsduW2nIldA2K7ADfT6VNW7tHD2gM340B1GocLL
 xDoI/E0QV6Sc4SX1L4Dn/Qv6goRak3jeu/o2/IXV81tTA1c2pCYjxP6F/3HlU1hemNfY
 tZqA==
X-Gm-Message-State: AOAM530xJbWHC9vmK0WhoL8h2e8Yl1L14bMODpNw66AUZ1UwyFSAaIkA
 +ksHo8GkFBc2teLFnVK9Bc/QvmM86n9GkK9o
X-Google-Smtp-Source: ABdhPJy3cIMVQb4s4jwtnq/+gsoIbG1ICxmjZAYWsr61dcAmffd4avsjOqbqlx0MFoL+RouN4YCnkw==
X-Received: by 2002:a63:154e:: with SMTP id 14mr2248044pgv.302.1639123253473; 
 Fri, 10 Dec 2021 00:00:53 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:53 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 77/77] target/riscv: rvv-1.0: Add ELEN checks for widening
 and narrowing instructions
Date: Fri, 10 Dec 2021 15:57:03 +0800
Message-Id: <20211210075704.23951-78-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
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

SEW has the limitation which cannot exceed ELEN.

Widening instructions have a destination group with EEW = 2*SEW
and narrowing instructions have a source operand with EEW = 2*SEW.
Both of the instructions have the limitation of: 2*SEW <= ELEN.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++++++++------
 target/riscv/translate.c                |  2 ++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 47eb3119cb..5e3f7fdb77 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -386,9 +386,10 @@ static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2)
  *      can not be greater than 8 vector registers (Section 5.2):
  *      => LMUL < 8.
  *      => SEW < 64.
- *   2. Destination vector register number is multiples of 2 * LMUL.
+ *   2. Double-width SEW cannot greater than ELEN.
+ *   3. Destination vector register number is multiples of 2 * LMUL.
  *      (Section 3.4.2)
- *   3. Destination vector register group for a masked vector
+ *   4. Destination vector register group for a masked vector
  *      instruction cannot overlap the source mask register (v0).
  *      (Section 5.3)
  */
@@ -396,6 +397,7 @@ static bool vext_wide_check_common(DisasContext *s, int vd, int vm)
 {
     return (s->lmul <= 2) &&
            (s->sew < MO_64) &&
+           ((s->sew + 1) <= (s->elen >> 4)) &&
            require_align(vd, s->lmul + 1) &&
            require_vm(vm, vd);
 }
@@ -409,11 +411,12 @@ static bool vext_wide_check_common(DisasContext *s, int vd, int vm)
  *      can not be greater than 8 vector registers (Section 5.2):
  *      => LMUL < 8.
  *      => SEW < 64.
- *   2. Source vector register number is multiples of 2 * LMUL.
+ *   2. Double-width SEW cannot greater than ELEN.
+ *   3. Source vector register number is multiples of 2 * LMUL.
  *      (Section 3.4.2)
- *   3. Destination vector register number is multiples of LMUL.
+ *   4. Destination vector register number is multiples of LMUL.
  *      (Section 3.4.2)
- *   4. Destination vector register group for a masked vector
+ *   5. Destination vector register group for a masked vector
  *      instruction cannot overlap the source mask register (v0).
  *      (Section 5.3)
  */
@@ -422,6 +425,7 @@ static bool vext_narrow_check_common(DisasContext *s, int vd, int vs2,
 {
     return (s->lmul <= 2) &&
            (s->sew < MO_64) &&
+           ((s->sew + 1) <= (s->elen >> 4)) &&
            require_align(vs2, s->lmul + 1) &&
            require_align(vd, s->lmul) &&
            require_vm(vm, vd);
@@ -2806,7 +2810,8 @@ GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
 /* Vector Widening Integer Reduction Instructions */
 static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return reduction_check(s, a) && (s->sew < MO_64);
+    return reduction_check(s, a) && (s->sew < MO_64) &&
+           ((s->sew + 1) <= (s->elen >> 4));
 }
 
 GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 68edaaf6ac..5df6c0d800 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -96,6 +96,7 @@ typedef struct DisasContext {
     int8_t lmul;
     uint8_t sew;
     uint16_t vlen;
+    uint16_t elen;
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
@@ -705,6 +706,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
     ctx->vlen = cpu->cfg.vlen;
+    ctx->elen = cpu->cfg.elen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->mstatus_hs_vs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
-- 
2.31.1


