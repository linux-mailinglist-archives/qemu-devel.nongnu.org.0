Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317C460DDE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:55:18 +0100 (CET)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXl7-000332-4J
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:55:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3y-0006wE-HE
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:10:42 -0500
Received: from [2607:f8b0:4864:20::430] (port=37683
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3l-00012d-RJ
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:10:33 -0500
Received: by mail-pf1-x430.google.com with SMTP id 8so15319219pfo.4
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tt+dFvcWwcylRZnWDDMNCBcheBLr+DJPXWiwCTZ/5lo=;
 b=XecA624mh7UukWzR+kRwmgKT8n89VV6sPAUwAeQFQgXonbwd+QO/R0bN+E1gS0dydO
 DJrTSd7+UlBmgG9uH5U3G7Y6rrmgK3+zSE6S72mVLDDAdySkxvTiVvHg3ivtVhFY/FVN
 xvfv/fUYXRd2BdBjIRQnJjX8tcYiuMJE8iSJMzg0TICHfKOm5Qf435OpEKTFwGHutlxQ
 AHrvHGoEo8qlwiEGvj6Tasa95v2c2ui3eGrlDP3+dWZBBlsl3ILSKVSVqHJLKdslAVHh
 3getdvmWexq37eTWozK1UTGvgpXf3DoiIfszfNZmQk7YXAQs2vgg22kR5S3YJTu36+nk
 5qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tt+dFvcWwcylRZnWDDMNCBcheBLr+DJPXWiwCTZ/5lo=;
 b=QEaQdy0C0HC+63JwnK0e4r3NddSHjT4KIVT4wHKonc5fam6c8vyqhTY2vOG1jjooeA
 WGDSxv/uw+1wlwB3X3TgvzL3jr4dELxrlm4QFvdjb6PnLTrHRBkeHsBgNmwNMVlu4Cu7
 5MrkPWiny3/ZTVkF6J5iZVZe4Hw3Lf7jPBwh/W0EmIQrBK37D8HfgYejFBDO0vXb0Fat
 rS72UcJ1q1/Dbiq/BJ8PKRgDAMKOmkFFjEm4CT98p07oaF3VFPAOahbkZUZrgyudafBN
 Vwg36+IWIjAba9I5FHuudnXNkTRN/Oybl39heCdW2Y4xoFHnCxY+KxCW7yk0Y53qfz9M
 IrlQ==
X-Gm-Message-State: AOAM533MskYtkDOkrwbb5MnCPWw3u0K6UuxpVqjsO1SUqiJhUe9nrP4H
 LZOHtPR3arIXc6F0qFAanNk2vkleGmxwJLvx
X-Google-Smtp-Source: ABdhPJz0YHDM6pDzC2hanEpzwMbDao//z/qaGi1HvkjBaLNksR9GO9BtM9rEwcAw3AdWZMmy73vUvg==
X-Received: by 2002:a62:8c55:0:b0:49f:df22:c4ca with SMTP id
 m82-20020a628c55000000b0049fdf22c4camr37024224pfd.11.1638155428487; 
 Sun, 28 Nov 2021 19:10:28 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:10:28 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 77/77] target/riscv: rvv-1.0: Add ELEN checks for widening
 and narrowing instructions
Date: Mon, 29 Nov 2021 11:03:37 +0800
Message-Id: <20211129030340.429689-78-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

SEW has the limitation which cannot exceed ELEN.

Widening instructions have a destination group with EEW = 2*SEW
and narrowing instructions have a source operand with EEW = 2*SEW.
Both of the instructions have the limitation of: 2*SEW <= ELEN.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++++++++------
 target/riscv/translate.c                |  2 ++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 47eb3119cbe..5e3f7fdb77c 100644
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
index 68edaaf6ac7..5df6c0d800b 100644
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
2.25.1


