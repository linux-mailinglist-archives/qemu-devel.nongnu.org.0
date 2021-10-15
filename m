Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127E42ED65
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:17:51 +0200 (CEST)
Received: from localhost ([::1]:39654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJLa-0003SQ-AA
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzx-0005j6-Bl
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:51:25 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzv-0005oH-95
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:51:25 -0400
Received: by mail-pg1-x52e.google.com with SMTP id g184so7861351pgc.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fRoxxYhBIbo51RxezVbACHQhzTILPz/LMCO7YOwjTaY=;
 b=F25LkwJTmlOGaS5wuQTr3Yt6ahnZxP5+6nAMEp1mdBzfAE6C4rRfvRw0RB4PhvCc0h
 MIf01K0AjbnMCqb5jn9db/WHH5lgdwbjWJ+oWjT3Uc4616vKEq+ckF/eSn9osm/ASe5x
 jhsJGkKY+Q8SMfsDUL9GJHVc3Basb9T4xpkuv4N7UFHuWEqCZ4ZYxvcJbZmipKdqRsSv
 lsY3HVJqlzJgs6HKPu2HYmdZgl4eR0kWDDi3nTbmy1WaxaYpkdf593iaToTwWmeBxWue
 mFcC7ewQ/U7A3BOL2i2pDuWybKD1a4yv8MAQzw0FR1QkbsbbTBsVjlMPzpTWwrF0Xw+a
 99Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fRoxxYhBIbo51RxezVbACHQhzTILPz/LMCO7YOwjTaY=;
 b=V8FtIdpvAxOz3aREYURmKIrFpZd2WS0t9ioUR4VtYqgSSP2fjwP3B4ILhViHT+m0e6
 3/P1CnBIFQQMqvDgypsZWSNrXkZyQGrHGw882wKAXTqTB0RthB+MKclEVsfamverc6Uq
 baxtCumcYO5VFyoa4qsuCuCqCLkaBfgzwt7ATiGuXl906B2H1Qm6Du/tXGR6T2spSqIr
 WdWs5IDMZED0ma9cly2OfI5dpgelQZIeiAtgB7HQwH4jlD31K0zvr/09/Fa/dYKfYeWn
 q3i37ndiUJXfnv3++eYct1d6Z0LFzR453BfC1CZtpiVJlIfB7bv3sIpR7clj6LE4FUyo
 jleg==
X-Gm-Message-State: AOAM531mJA8V8M1QtyGGj5oWHd8eZQDkWWeY7zpBpcBwBIwbHjlXNbx/
 62aXqZZ1k4H/1cMtQEqA1D2aRG/0pcCtcBT7
X-Google-Smtp-Source: ABdhPJwacRnToz3rYmZCGKkzvihSlYfBrz/VdvaiRDErc2Zhv4ES6k9sUlceyxnrbI2HR5oI062psw==
X-Received: by 2002:a05:6a00:1a46:b0:44d:7a3f:2043 with SMTP id
 h6-20020a056a001a4600b0044d7a3f2043mr8342242pfv.56.1634284281807; 
 Fri, 15 Oct 2021 00:51:21 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:51:21 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 76/78] target/riscv: rvv-1.0: add vector unit-stride mask
 load/store insns
Date: Fri, 15 Oct 2021 15:46:24 +0800
Message-Id: <20211015074627.3957162-84-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvv.c.inc | 40 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 21 +++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ab283d12b79..6e58343af35 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -129,6 +129,8 @@ DEF_HELPER_5(vse8_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse16_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse32_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse64_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vlm_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vsm_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_6(vlse8_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlse16_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlse32_v, void, ptr, ptr, tl, tl, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3b6524bad91..1a4a2871464 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -305,6 +305,10 @@ vse16_v    ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
 vse32_v    ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
 vse64_v    ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
 
+# Vector unit-stride mask load/store insns.
+vlm_v      000 000 1 01011 ..... 000 ..... 0000111 @r2
+vsm_v      000 000 1 01011 ..... 000 ..... 0100111 @r2
+
 # Vector strided insns.
 vlse8_v     ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
 vlse16_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9dedcdf4779..6eebcffb29e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -697,6 +697,46 @@ GEN_VEXT_TRANS(vse16_v, MO_16, r2nfvm, st_us_op, st_us_check)
 GEN_VEXT_TRANS(vse32_v, MO_32, r2nfvm, st_us_op, st_us_check)
 GEN_VEXT_TRANS(vse64_v, MO_64, r2nfvm, st_us_op, st_us_check)
 
+/*
+ *** unit stride mask load and store
+ */
+static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
+{
+    uint32_t data = 0;
+    gen_helper_ldst_us *fn = gen_helper_vlm_v;
+
+    /* EMUL = 1, NFIELDS = 1 */
+    data = FIELD_DP32(data, VDATA, LMUL, 0);
+    data = FIELD_DP32(data, VDATA, NF, 1);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
+}
+
+static bool ld_us_mask_check(DisasContext *s, arg_vlm_v *a, uint8_t eew)
+{
+    /* EMUL = 1, NFIELDS = 1 */
+    return require_rvv(s) && vext_check_isa_ill(s);
+}
+
+static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
+{
+    uint32_t data = 0;
+    gen_helper_ldst_us *fn = gen_helper_vsm_v;
+
+    /* EMUL = 1, NFIELDS = 1 */
+    data = FIELD_DP32(data, VDATA, LMUL, 0);
+    data = FIELD_DP32(data, VDATA, NF, 1);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
+}
+
+static bool st_us_mask_check(DisasContext *s, arg_vsm_v *a, uint8_t eew)
+{
+    /* EMUL = 1, NFIELDS = 1 */
+    return require_rvv(s) && vext_check_isa_ill(s);
+}
+
+GEN_VEXT_TRANS(vlm_v, MO_8, vlm_v, ld_us_mask_op, ld_us_mask_check)
+GEN_VEXT_TRANS(vsm_v, MO_8, vsm_v, st_us_mask_op, st_us_mask_check)
+
 /*
  *** stride load and store
  */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 6c349af590e..276a2c1aab6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -345,6 +345,27 @@ GEN_VEXT_ST_US(vse16_v, int16_t, ste_h)
 GEN_VEXT_ST_US(vse32_v, int32_t, ste_w)
 GEN_VEXT_ST_US(vse64_v, int64_t, ste_d)
 
+/*
+ *** unit stride mask load and store, EEW = 1
+ */
+void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
+                    CPURISCVState *env, uint32_t desc)
+{
+    /* evl = ceil(vl/8) */
+    uint8_t evl = (env->vl + 7) >> 3;
+    vext_ldst_us(vd, base, env, desc, lde_b,
+                 0, evl, GETPC(), MMU_DATA_LOAD);
+}
+
+void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
+                    CPURISCVState *env, uint32_t desc)
+{
+    /* evl = ceil(vl/8) */
+    uint8_t evl = (env->vl + 7) >> 3;
+    vext_ldst_us(vd, base, env, desc, ste_b,
+                 0, evl, GETPC(), MMU_DATA_STORE);
+}
+
 /*
  *** index: access vector element from indexed memory
  */
-- 
2.25.1


