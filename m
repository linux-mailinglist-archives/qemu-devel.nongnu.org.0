Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BA5325C66
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:12:13 +0100 (CET)
Received: from localhost ([::1]:52666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUU8-0000nR-K6
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlT-00044c-PZ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:26:04 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlL-0003It-Qf
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:26:02 -0500
Received: by mail-pg1-x52b.google.com with SMTP id l2so5423615pgb.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x/iS+/lS53b1UiHysoqvPdcSl58jtztWECmSJQMmZSE=;
 b=b54Wxjdmdurnyds0BqrDQF2vaQSMtdygdff1M04twEpktnYQDYEVEqhcsZ1n8TgzDD
 x/SIcd8zrmtVva8lujJKzCYaCC05m+QGkgq0qmBmy8EAb3+gVULYJ1B3BpMz/IUgrX+9
 RWQt+Lr/3NaZx6fIr8EPBzGTGy0/sKb+TGFjMyCSM+dfYLNDBVsbXV58dF0yA1cHchNq
 rkV4ooSzy5tAsycA+VOA/3UFHj5ZEI6Wj+y+eyHiH7qYu6YwlSeUINDqdiQAaC3KMjIY
 fuM5n4VTCXPK3VRppyympspqRRmcKi4nh+JybCIHeAmwsWjLjpR7IVXpI8+eoen06hCP
 Qhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x/iS+/lS53b1UiHysoqvPdcSl58jtztWECmSJQMmZSE=;
 b=c1w3fSmsZFFpdxVS25NDqO1gswb/km7R19JBJb6K+pp0Tj6oGwNswmRtnYOqY0UuXC
 wuph9vo5fWqj8QYq+Wt5SHkpDMwfVV0+9XPM9WW5npe6chEROappGxVoiYQHiqkB4+bB
 gQtxaheGrynLQ0s44ocC41vG1k5Myc5yxr257I9suXXmGc294mqidJzfa5iC4KFdKeQh
 F6wyiGJjwdDJ8JoNWRrrkQON7YuKE6UjZFhwwhNiKMI9L5uAsIYBUIJAh2Dn2TuLKtAV
 musIb+Kg7rHAhijqugpqwOLmp/G9CcOQzoEhpakqFx1KNqKHmNjN90PMehGlZIeUKBJS
 4fwg==
X-Gm-Message-State: AOAM533S6GhNwPRZmJgtF/6KehLAs82Q+aLVtalxjKZ+TWJgKyzZwTqd
 /QopHU+pmpDie74C1IgefNxRhbd8YCmRcw==
X-Google-Smtp-Source: ABdhPJyvbmu5Clr86q122FR3CIMPqxOpUK6i2zR4qt0bqELAXmXQz2c4LHzqUJoZ4J9FIpuG/oVz1A==
X-Received: by 2002:aa7:8759:0:b029:1ed:81d4:1b88 with SMTP id
 g25-20020aa787590000b02901ed81d41b88mr1114846pfo.6.1614309954449; 
 Thu, 25 Feb 2021 19:25:54 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 75/75] target/riscv: rvv-1.0: add vector unit-stride mask
 load/store insns
Date: Fri, 26 Feb 2021 11:18:59 +0800
Message-Id: <20210226031902.23656-76-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
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
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvv.c.inc | 40 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 21 +++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6dffd9be45d..f0cbddcd94f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -96,6 +96,8 @@ DEF_HELPER_5(vse8_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse16_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse32_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse64_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle1_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse1_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_6(vlse8_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlse16_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlse32_v, void, ptr, ptr, tl, tl, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 472626f1950..bb7b1d30f4f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -251,6 +251,10 @@ vse16_v    ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
 vse32_v    ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
 vse64_v    ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
 
+# Vector unit-stride mask load/store insns.
+vle1_v     000 000 1 01011 ..... 000 ..... 0000111 @r2
+vse1_v     000 000 1 01011 ..... 000 ..... 0100111 @r2
+
 # Vector strided insns.
 vlse8_v     ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
 vlse16_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 1e9f5148ccd..4dd1e29368c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -747,6 +747,46 @@ GEN_VEXT_TRANS(vse16_v, MO_16, r2nfvm, st_us_op, st_us_check)
 GEN_VEXT_TRANS(vse32_v, MO_32, r2nfvm, st_us_op, st_us_check)
 GEN_VEXT_TRANS(vse64_v, MO_64, r2nfvm, st_us_op, st_us_check)
 
+/*
+ *** unit stride mask load and store
+ */
+static bool ld_us_mask_op(DisasContext *s, arg_vle1_v *a, uint8_t eew)
+{
+    uint32_t data = 0;
+    gen_helper_ldst_us *fn = gen_helper_vle1_v;
+
+    /* EMUL = 1, NFIELDS = 1 */
+    data = FIELD_DP32(data, VDATA, LMUL, 0);
+    data = FIELD_DP32(data, VDATA, NF, 1);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
+}
+
+static bool ld_us_mask_check(DisasContext *s, arg_vle1_v *a, uint8_t eew)
+{
+    /* EMUL = 1, NFIELDS = 1 */
+    return require_rvv(s) && vext_check_isa_ill(s);
+}
+
+static bool st_us_mask_op(DisasContext *s, arg_vse1_v *a, uint8_t eew)
+{
+    uint32_t data = 0;
+    gen_helper_ldst_us *fn = gen_helper_vse1_v;
+
+    /* EMUL = 1, NFIELDS = 1 */
+    data = FIELD_DP32(data, VDATA, LMUL, 0);
+    data = FIELD_DP32(data, VDATA, NF, 1);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
+}
+
+static bool st_us_mask_check(DisasContext *s, arg_vse1_v *a, uint8_t eew)
+{
+    /* EMUL = 1, NFIELDS = 1 */
+    return require_rvv(s) && vext_check_isa_ill(s);
+}
+
+GEN_VEXT_TRANS(vle1_v, MO_8, vle1_v, ld_us_mask_op, ld_us_mask_check)
+GEN_VEXT_TRANS(vse1_v, MO_8, vse1_v, st_us_mask_op, st_us_mask_check)
+
 /*
  *** stride load and store
  */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 55560116ff6..e7a3084876d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -361,6 +361,27 @@ GEN_VEXT_ST_US(vse16_v, int16_t, ste_h)
 GEN_VEXT_ST_US(vse32_v, int32_t, ste_w)
 GEN_VEXT_ST_US(vse64_v, int64_t, ste_d)
 
+/*
+ *** unit stride mask load and store, EEW = 1
+ */
+void HELPER(vle1_v)(void *vd, void *v0, target_ulong base,
+                    CPURISCVState *env, uint32_t desc)
+{
+    /* evl = ceil(vl/8) */
+    uint8_t evl = (env->vl + 7) >> 3;
+    vext_ldst_us(vd, base, env, desc, lde_b,
+                 0, evl, GETPC(), MMU_DATA_LOAD);
+}
+
+void HELPER(vse1_v)(void *vd, void *v0, target_ulong base,
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
2.17.1


