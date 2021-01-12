Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693A92F2C1A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:02:26 +0100 (CET)
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGVN-0007Lm-Cz
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBW-0003vP-LJ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:54 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBF-0007bv-UM
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:54 -0500
Received: by mail-pj1-x1029.google.com with SMTP id b5so1315056pjl.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=re9R4nf1nqQxyJCgalyRU9GjbKZ3hiTYovBn9a0qvH4=;
 b=FF2rRyP31GFDlzOu5mgqRD7z+l+JUfV9GJ2dwa7G4wy7k/Bs1hypkXLNvCQHHBh6SX
 3U2IZ29ywBrUpEQdYxel56UlQT35Sn6cYgSsqADcGzOdJJmXOyUNP5/2rgNH+pvRK/at
 sH3rccHciSxd95Y3pVBLK4JYoMSVPlZiruQHZXmWxgT19PE9qE3tzXNjxDXmBYW8l19g
 o91Svot/aYDvNJZqAcs5SZF6vc61XvkXNKs78tw55ds15NVEKkOS2nCX1yDFOEM5KApY
 98VwOHkn7v9AnjtAhvYnbkDYbOuOhEJDY8TfjtkESEVN4PE95VOJcqWBdKCnfCBSx2G3
 3zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=re9R4nf1nqQxyJCgalyRU9GjbKZ3hiTYovBn9a0qvH4=;
 b=acpyBstl/cEfgMIo1RtJoZKG49QhM4+BW2JTdyQKn+MTe7RTTjBdSw0ZfhxO2pPUGw
 nMdi3AkMV3m47invd/NpWN06245c1RgfodkM+xDHcJ1IREgQvF3qbelIQBMksieupOWv
 LVix1iIFsqylSSn/fTbe+DkAKBubYznIGXWwsz1vCLWHbfW2uL36BT1CH28MIYZFIlVa
 OBAaYzmMCXyO4bPAVqar/3HVHzlGUsmJ2HBqe+7V4JP6kmmMm9uOUGX/dzsMkCdKlCIC
 IP1RJ+Qkd8EbmYD7U4QcUT37dDNgbVmiBMiyzvPq6af2jlDyta5149uLcjhgfYaxaUDx
 6ZFg==
X-Gm-Message-State: AOAM533Mr8Zg2alKf4iuVgTacXn9Zsj513EgsFO0cA5mUBHkkIIkBCbb
 ELzcRYKkIhYSR/7v5MCGluc7C1jBJ8+aQfvc
X-Google-Smtp-Source: ABdhPJwhpFDHHBXzKShTTLYWADxwp5ljaUIjdE/L9ytJoPK/Sp5mZZzytRVj/45CuxcccGO2q3tJ1Q==
X-Received: by 2002:a17:902:ab97:b029:de:30a:5234 with SMTP id
 f23-20020a170902ab97b02900de030a5234mr3913099plr.55.1610444496513; 
 Tue, 12 Jan 2021 01:41:36 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:35 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 23/72] target/riscv: rvv-1.0: load/store whole register
 instructions
Date: Tue, 12 Jan 2021 17:38:57 +0800
Message-Id: <20210112093950.17530-24-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
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

Add the following instructions:

* vl<nf>re<eew>.v
* vs<nf>r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 21 ++++++++
 target/riscv/insn32.decode              | 22 ++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 69 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 65 +++++++++++++++++++++++
 4 files changed, 177 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b3fa28d4354..5ec364caecc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -140,6 +140,27 @@ DEF_HELPER_5(vle16ff_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle32ff_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle64ff_v, void, ptr, ptr, tl, env, i32)
 
+DEF_HELPER_4(vl1re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl1re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl1re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl1re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs1r_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs2r_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs4r_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs8r_v, void, ptr, tl, env, i32)
+
 DEF_HELPER_6(vamoswapei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoswapei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoswapei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2047f23bd62..e11666f16df 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -278,6 +278,28 @@ vle16ff_v     ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
 vle32ff_v     ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
 vle64ff_v     ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
 
+# Vector whole register insns
+vl1re8_v      000 000 1 01000 ..... 000 ..... 0000111 @r2
+vl1re16_v     000 000 1 01000 ..... 101 ..... 0000111 @r2
+vl1re32_v     000 000 1 01000 ..... 110 ..... 0000111 @r2
+vl1re64_v     000 000 1 01000 ..... 111 ..... 0000111 @r2
+vl2re8_v      001 000 1 01000 ..... 000 ..... 0000111 @r2
+vl2re16_v     001 000 1 01000 ..... 101 ..... 0000111 @r2
+vl2re32_v     001 000 1 01000 ..... 110 ..... 0000111 @r2
+vl2re64_v     001 000 1 01000 ..... 111 ..... 0000111 @r2
+vl4re8_v      011 000 1 01000 ..... 000 ..... 0000111 @r2
+vl4re16_v     011 000 1 01000 ..... 101 ..... 0000111 @r2
+vl4re32_v     011 000 1 01000 ..... 110 ..... 0000111 @r2
+vl4re64_v     011 000 1 01000 ..... 111 ..... 0000111 @r2
+vl8re8_v      111 000 1 01000 ..... 000 ..... 0000111 @r2
+vl8re16_v     111 000 1 01000 ..... 101 ..... 0000111 @r2
+vl8re32_v     111 000 1 01000 ..... 110 ..... 0000111 @r2
+vl8re64_v     111 000 1 01000 ..... 111 ..... 0000111 @r2
+vs1r_v        000 000 1 01000 ..... 000 ..... 0100111 @r2
+vs2r_v        001 000 1 01000 ..... 000 ..... 0100111 @r2
+vs4r_v        011 000 1 01000 ..... 000 ..... 0100111 @r2
+vs8r_v        111 000 1 01000 ..... 000 ..... 0100111 @r2
+
 #*** Vector AMO operations are encoded under the standard AMO major opcode ***
 vamoswapei8_v   00001 . . ..... ..... 000 ..... 0101111 @r_wdvm
 vamoswapei16_v  00001 . . ..... ..... 101 ..... 0101111 @r_wdvm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4c93f8a5c8e..2b0e0590efc 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1014,6 +1014,75 @@ GEN_VEXT_TRANS(vle16ff_v, MO_16, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vle32ff_v, MO_32, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op, ld_us_check)
 
+/*
+ * load and store whole register instructions
+ */
+typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
+
+static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
+                             gen_helper_ldst_whole *fn, DisasContext *s,
+                             bool is_store)
+{
+    TCGv_ptr dest;
+    TCGv base;
+    TCGv_i32 desc;
+
+    uint32_t data = FIELD_DP32(0, VDATA, NF, nf);
+    dest = tcg_temp_new_ptr();
+    base = tcg_temp_new();
+    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+
+    gen_get_gpr(base, rs1);
+    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
+
+    fn(dest, base, cpu_env, desc);
+
+    tcg_temp_free_ptr(dest);
+    tcg_temp_free(base);
+    tcg_temp_free_i32(desc);
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+    return true;
+}
+
+/*
+ * load and store whole register instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 7.9)
+ */
+#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF, IS_STORE)                      \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)                 \
+{                                                                         \
+    if (require_rvv(s) &&                                                 \
+        QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                                 \
+        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, gen_helper_##NAME, \
+                                s, IS_STORE);                             \
+    }                                                                     \
+    return false;                                                         \
+}
+
+GEN_LDST_WHOLE_TRANS(vl1re8_v,  1, false)
+GEN_LDST_WHOLE_TRANS(vl1re16_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl1re32_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl1re64_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl2re8_v,  2, false)
+GEN_LDST_WHOLE_TRANS(vl2re16_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl2re32_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl2re64_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl4re8_v,  4, false)
+GEN_LDST_WHOLE_TRANS(vl4re16_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl4re32_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl4re64_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl8re8_v,  8, false)
+GEN_LDST_WHOLE_TRANS(vl8re16_v, 8, false)
+GEN_LDST_WHOLE_TRANS(vl8re32_v, 8, false)
+GEN_LDST_WHOLE_TRANS(vl8re64_v, 8, false)
+
+GEN_LDST_WHOLE_TRANS(vs1r_v, 1, true)
+GEN_LDST_WHOLE_TRANS(vs2r_v, 2, true)
+GEN_LDST_WHOLE_TRANS(vs4r_v, 4, true)
+GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
+
 /*
  *** vector atomic operation
  */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 743883449a4..57564c5c0c9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -534,6 +534,71 @@ GEN_VEXT_LDFF(vle16ff_v, int16_t, lde_h)
 GEN_VEXT_LDFF(vle32ff_v, int32_t, lde_w)
 GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
 
+/*
+ *** load and store whole register instructions
+ */
+static void
+vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
+                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra,
+                MMUAccessType access_type)
+{
+    uint32_t i, k;
+    uint32_t nf = vext_nf(desc);
+    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint32_t max_elems = vlenb >> esz;
+
+    /* probe every access */
+    probe_pages(env, base, vlenb * nf, ra, access_type);
+
+    /* load bytes from guest memory */
+    for (k = 0; k < nf; k++) {
+        for (i = 0; i < max_elems; i++) {
+            target_ulong addr = base + ((i + k * max_elems) << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+        }
+    }
+}
+
+#define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN)      \
+void HELPER(NAME)(void *vd, target_ulong base,       \
+                  CPURISCVState *env, uint32_t desc) \
+{                                                    \
+    vext_ldst_whole(vd, base, env, desc, LOAD_FN,    \
+                    ctzl(sizeof(ETYPE)), GETPC(),    \
+                    MMU_DATA_LOAD);                  \
+}
+
+GEN_VEXT_LD_WHOLE(vl1re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl1re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl1re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl1re64_v, int64_t, lde_d)
+GEN_VEXT_LD_WHOLE(vl2re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl2re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl2re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl2re64_v, int64_t, lde_d)
+GEN_VEXT_LD_WHOLE(vl4re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl4re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl4re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl4re64_v, int64_t, lde_d)
+GEN_VEXT_LD_WHOLE(vl8re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl8re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl8re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl8re64_v, int64_t, lde_d)
+
+#define GEN_VEXT_ST_WHOLE(NAME, ETYPE, STORE_FN)     \
+void HELPER(NAME)(void *vd, target_ulong base,       \
+                  CPURISCVState *env, uint32_t desc) \
+{                                                    \
+    vext_ldst_whole(vd, base, env, desc, STORE_FN,   \
+                    ctzl(sizeof(ETYPE)), GETPC(),    \
+                    MMU_DATA_STORE);                 \
+}
+
+GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs2r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs4r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b)
+
 /*
  *** Vector AMO Operations (Zvamo)
  */
-- 
2.17.1


