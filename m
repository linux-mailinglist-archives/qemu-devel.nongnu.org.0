Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092C253F28E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:31:16 +0200 (CEST)
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMBn-00038V-4O
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwR-0001k4-UG
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:27 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwN-0003xA-Qt
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:23 -0400
Received: by mail-pf1-x42a.google.com with SMTP id u2so13942608pfc.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=omlqCXIBeWldPF1seQmFfxj9kZYc5pGyxPDvC/bHbAc=;
 b=YOEzCiPH1XeXB08pk+aAalUSkoN6aoxWcr+xeHgchujKTZC5jfLqtpV5TU+PvCABVV
 FmntuMkeHzWaH5CysGGPrqK4IrIGi6jy1tnhZKrJsEIxpy/gcfT4/842yzh2xePX4VnL
 SeqlCBWAs/EPOdxGcW5hEBPlyED7XsWDMyr3qHRgsof9KmEdWUBHKkcrduw6wv7jqMJi
 cBpDgWL5NPOICdEDd37lNx4yfgOZlk9cCIT048O3ToPhgkE6qaY7gblPxd6D/9ZIjR3k
 8VvAQUagF6ehpOg9j65Odw5laOU0nNgZOJVb7bTAladPqAFTP7w26cGj6gHWJGSBY5mq
 ggGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omlqCXIBeWldPF1seQmFfxj9kZYc5pGyxPDvC/bHbAc=;
 b=B96o9B+tVTJ5lHMnYSDtvSLgLsOaorLTVKfFZizm2ebj5Z/iueMtmHB27RoK9lgyt1
 xkZskOOgXxjTBxTyQdOIuZrW07g/BWrkxJ1bHANDGlTU1qz4xEVXxKurS1QnG2mUB8WY
 /DyrCNWx3VKPJO8VYW8AQOjgTQQNQrDLVYeds8p5rt9bRoW2UX3Uh44abBLZY+yIxp6O
 rSAYCAj4r/dLJ0jfJWDA6jxtzFkhgs/3ix93k06kQgEin7zumtcYV6u/2SIJfab520cA
 IZvNskHdCdSud4WezyeecSjyVZHKWUpou6L3ew7lbUtXzChfBg4wylDtHLbYzC7P8kr1
 nHXg==
X-Gm-Message-State: AOAM530IQM16VYKe0TFREnsCJrL8HYOkTuN6JcgYhyXZ2KTGO7Kp5Ouv
 vrnI4KTi2VtU/htO9+5qcJpX7W4Pa4ysdA==
X-Google-Smtp-Source: ABdhPJxD9aVcDA81ADQaMvM78Y2NLM02KJRkF0DilLBPQdmOQVBAYNfYM4ZeT6kWXK5683WE/lg9sQ==
X-Received: by 2002:a63:1708:0:b0:3fd:8a03:dcd2 with SMTP id
 x8-20020a631708000000b003fd8a03dcd2mr9793140pgl.556.1654557316941; 
 Mon, 06 Jun 2022 16:15:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 27/43] target/loongarch: Add TLB instruction support
Date: Mon,  6 Jun 2022 16:14:34 -0700
Message-Id: <20220606231450.448443-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

This includes:
- TLBSRCH
- TLBRD
- TLBWR
- TLBFILL
- TLBCLR
- TLBFLUSH
- INVTLB

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-28-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h                     |  13 +
 target/loongarch/insns.decode                 |  11 +
 target/loongarch/disas.c                      |  18 +
 target/loongarch/tlb_helper.c                 | 355 ++++++++++++++++++
 .../insn_trans/trans_privileged.c.inc         | 102 +++++
 5 files changed, 499 insertions(+)

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 4664a02dcf..b092ca75fe 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -108,3 +108,16 @@ DEF_HELPER_3(iocsrwr_b, void, env, tl, tl)
 DEF_HELPER_3(iocsrwr_h, void, env, tl, tl)
 DEF_HELPER_3(iocsrwr_w, void, env, tl, tl)
 DEF_HELPER_3(iocsrwr_d, void, env, tl, tl)
+
+/* TLB helper */
+DEF_HELPER_1(tlbwr, void, env)
+DEF_HELPER_1(tlbfill, void, env)
+DEF_HELPER_1(tlbsrch, void, env)
+DEF_HELPER_1(tlbrd, void, env)
+DEF_HELPER_1(tlbclr, void, env)
+DEF_HELPER_1(tlbflush, void, env)
+DEF_HELPER_1(invtlb_all, void, env)
+DEF_HELPER_2(invtlb_all_g, void, env, i32)
+DEF_HELPER_2(invtlb_all_asid, void, env, tl)
+DEF_HELPER_3(invtlb_page_asid, void, env, tl, tl)
+DEF_HELPER_3(invtlb_page_asid_or_g, void, env, tl, tl)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 2b436d3cd6..f8ed11d83e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -47,6 +47,8 @@
 &rr_offs      rj rd offs
 &r_csr        rd csr
 &rr_csr       rd rj csr
+&empty
+&i_rr         imm rj rk
 
 #
 # Formats
@@ -89,6 +91,8 @@
 @rr_offs16         .... .. ................ rj:5 rd:5    &rr_offs     offs=%offs16
 @r_csr                    .... .... csr:14 ..... rd:5    &r_csr
 @rr_csr                    .... .... csr:14 rj:5 rd:5    &rr_csr
+@empty          .... ........ ..... ..... ..... .....    &empty
+@i_rr             ...... ...... ..... rk:5 rj:5 imm:5    &i_rr
 
 #
 # Fixed point arithmetic operation instruction
@@ -459,3 +463,10 @@ iocsrwr_b        0000 01100100 10000 00100 ..... .....    @rr
 iocsrwr_h        0000 01100100 10000 00101 ..... .....    @rr
 iocsrwr_w        0000 01100100 10000 00110 ..... .....    @rr
 iocsrwr_d        0000 01100100 10000 00111 ..... .....    @rr
+tlbsrch          0000 01100100 10000 01010 00000 00000    @empty
+tlbrd            0000 01100100 10000 01011 00000 00000    @empty
+tlbwr            0000 01100100 10000 01100 00000 00000    @empty
+tlbfill          0000 01100100 10000 01101 00000 00000    @empty
+tlbclr           0000 01100100 10000 01000 00000 00000    @empty
+tlbflush         0000 01100100 10000 01001 00000 00000    @empty
+invtlb           0000 01100100 10011 ..... ..... .....    @i_rr
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index ea26aea728..6a56607302 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -303,6 +303,17 @@ static void output_rr_csr(DisasContext *ctx, arg_rr_csr *a,
            a->rd, a->rj, a->csr, get_csr_name(a->csr));
 }
 
+static void output_empty(DisasContext *ctx, arg_empty *a,
+                         const char *mnemonic)
+{
+    output(ctx, mnemonic, "");
+}
+
+static void output_i_rr(DisasContext *ctx, arg_i_rr *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "%d, r%d, r%d", a->imm, a->rj, a->rk);
+}
+
 #define INSN(insn, type)                                    \
 static bool trans_##insn(DisasContext *ctx, arg_##type * a) \
 {                                                           \
@@ -623,6 +634,13 @@ INSN(iocsrwr_b,    rr)
 INSN(iocsrwr_h,    rr)
 INSN(iocsrwr_w,    rr)
 INSN(iocsrwr_d,    rr)
+INSN(tlbsrch,      empty)
+INSN(tlbrd,        empty)
+INSN(tlbwr,        empty)
+INSN(tlbfill,      empty)
+INSN(tlbclr,       empty)
+INSN(tlbflush,     empty)
+INSN(invtlb,       i_rr)
 
 #define output_fcmp(C, PREFIX, SUFFIX)                                         \
 {                                                                              \
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index fad8bc7746..4f84ef3e4b 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -7,9 +7,11 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/guest-random.h"
 
 #include "cpu.h"
 #include "internals.h"
+#include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
@@ -280,6 +282,359 @@ static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
    }
 }
 
+static void invalidate_tlb_entry(CPULoongArchState *env, int index)
+{
+    target_ulong addr, mask, pagesize;
+    uint8_t tlb_ps;
+    LoongArchTLB *tlb = &env->tlb[index];
+
+    int mmu_idx = cpu_mmu_index(env, false);
+    uint8_t tlb_v0 = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, V);
+    uint8_t tlb_v1 = FIELD_EX64(tlb->tlb_entry1, TLBENTRY, V);
+    uint64_t tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+
+    if (index >= LOONGARCH_STLB) {
+        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+    } else {
+        tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+    }
+    pagesize = 1 << tlb_ps;
+    mask = MAKE_64BIT_MASK(0, tlb_ps + 1);
+
+    if (tlb_v0) {
+        addr = (tlb_vppn << R_TLB_MISC_VPPN_SHIFT) & ~mask;    /* even */
+        tlb_flush_range_by_mmuidx(env_cpu(env), addr, pagesize,
+                                  mmu_idx, TARGET_LONG_BITS);
+    }
+
+    if (tlb_v1) {
+        addr = (tlb_vppn << R_TLB_MISC_VPPN_SHIFT) & pagesize;    /* odd */
+        tlb_flush_range_by_mmuidx(env_cpu(env), addr, pagesize,
+                                  mmu_idx, TARGET_LONG_BITS);
+    }
+}
+
+static void invalidate_tlb(CPULoongArchState *env, int index)
+{
+    LoongArchTLB *tlb;
+    uint16_t csr_asid, tlb_asid, tlb_g;
+
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    tlb = &env->tlb[index];
+    tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+    tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+    if (tlb_g == 0 && tlb_asid != csr_asid) {
+        return;
+    }
+    invalidate_tlb_entry(env, index);
+}
+
+static void fill_tlb_entry(CPULoongArchState *env, int index)
+{
+    LoongArchTLB *tlb = &env->tlb[index];
+    uint64_t lo0, lo1, csr_vppn;
+    uint16_t csr_asid;
+    uint8_t csr_ps;
+
+    if (FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR)) {
+        csr_ps = FIELD_EX64(env->CSR_TLBREHI, CSR_TLBREHI, PS);
+        csr_vppn = FIELD_EX64(env->CSR_TLBREHI, CSR_TLBREHI, VPPN);
+        lo0 = env->CSR_TLBRELO0;
+        lo1 = env->CSR_TLBRELO1;
+    } else {
+        csr_ps = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, PS);
+        csr_vppn = FIELD_EX64(env->CSR_TLBEHI, CSR_TLBEHI, VPPN);
+        lo0 = env->CSR_TLBELO0;
+        lo1 = env->CSR_TLBELO1;
+    }
+
+    if (csr_ps == 0) {
+        qemu_log_mask(CPU_LOG_MMU, "page size is 0\n");
+    }
+
+    /* Only MTLB has the ps fields */
+    if (index >= LOONGARCH_STLB) {
+        tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, PS, csr_ps);
+    }
+
+    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, VPPN, csr_vppn);
+    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 1);
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, ASID, csr_asid);
+
+    tlb->tlb_entry0 = lo0;
+    tlb->tlb_entry1 = lo1;
+}
+
+/* Return an random value between low and high */
+static uint32_t get_random_tlb(uint32_t low, uint32_t high)
+{
+    uint32_t val;
+
+    qemu_guest_getrandom_nofail(&val, sizeof(val));
+    return val % (high - low + 1) + low;
+}
+
+void helper_tlbsrch(CPULoongArchState *env)
+{
+    int index, match;
+
+    if (FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR)) {
+        match = loongarch_tlb_search(env, env->CSR_TLBREHI, &index);
+    } else {
+        match = loongarch_tlb_search(env, env->CSR_TLBEHI, &index);
+    }
+
+    if (match) {
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX, index);
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 0);
+        return;
+    }
+
+    env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 1);
+}
+
+void helper_tlbrd(CPULoongArchState *env)
+{
+    LoongArchTLB *tlb;
+    int index;
+    uint8_t tlb_ps, tlb_e;
+
+    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+    tlb = &env->tlb[index];
+
+    if (index >= LOONGARCH_STLB) {
+        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+    } else {
+        tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+    }
+    tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
+
+    if (!tlb_e) {
+        /* Invalid TLB entry */
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 1);
+        env->CSR_ASID  = FIELD_DP64(env->CSR_ASID, CSR_ASID, ASID, 0);
+        env->CSR_TLBEHI = 0;
+        env->CSR_TLBELO0 = 0;
+        env->CSR_TLBELO1 = 0;
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, PS, 0);
+    } else {
+        /* Valid TLB entry */
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 0);
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
+                                     PS, (tlb_ps & 0x3f));
+        env->CSR_TLBEHI = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN) <<
+                                     R_TLB_MISC_VPPN_SHIFT;
+        env->CSR_TLBELO0 = tlb->tlb_entry0;
+        env->CSR_TLBELO1 = tlb->tlb_entry1;
+    }
+}
+
+void helper_tlbwr(CPULoongArchState *env)
+{
+    int index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+
+    invalidate_tlb(env, index);
+
+    if (FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, NE)) {
+        env->tlb[index].tlb_misc = FIELD_DP64(env->tlb[index].tlb_misc,
+                                              TLB_MISC, E, 0);
+        return;
+    }
+
+    fill_tlb_entry(env, index);
+}
+
+void helper_tlbfill(CPULoongArchState *env)
+{
+    uint64_t address, entryhi;
+    int index, set, stlb_idx;
+    uint16_t pagesize, stlb_ps;
+
+    if (FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR)) {
+        entryhi = env->CSR_TLBREHI;
+        pagesize = FIELD_EX64(env->CSR_TLBREHI, CSR_TLBREHI, PS);
+    } else {
+        entryhi = env->CSR_TLBEHI;
+        pagesize = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, PS);
+    }
+
+    stlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+
+    if (pagesize == stlb_ps) {
+        /* Only write into STLB bits [47:13] */
+        address = entryhi & ~MAKE_64BIT_MASK(0, R_CSR_TLBEHI_VPPN_SHIFT);
+
+        /* Choose one set ramdomly */
+        set = get_random_tlb(0, 7);
+
+        /* Index in one set */
+        stlb_idx = (address >> (stlb_ps + 1)) & 0xff; /* [0,255] */
+
+        index = set * 256 + stlb_idx;
+    } else {
+        /* Only write into MTLB */
+        index = get_random_tlb(LOONGARCH_STLB, LOONGARCH_TLB_MAX - 1);
+    }
+
+    invalidate_tlb(env, index);
+    fill_tlb_entry(env, index);
+}
+
+void helper_tlbclr(CPULoongArchState *env)
+{
+    LoongArchTLB *tlb;
+    int i, index;
+    uint16_t csr_asid, tlb_asid, tlb_g;
+
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+
+    if (index < LOONGARCH_STLB) {
+        /* STLB. One line per operation */
+        for (i = 0; i < 8; i++) {
+            tlb = &env->tlb[i * 256 + (index % 256)];
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+            if (!tlb_g && tlb_asid == csr_asid) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+    } else if (index < LOONGARCH_TLB_MAX) {
+        /* All MTLB entries */
+        for (i = LOONGARCH_STLB; i < LOONGARCH_TLB_MAX; i++) {
+            tlb = &env->tlb[i];
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+            if (!tlb_g && tlb_asid == csr_asid) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+    }
+
+    tlb_flush(env_cpu(env));
+}
+
+void helper_tlbflush(CPULoongArchState *env)
+{
+    int i, index;
+
+    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+
+    if (index < LOONGARCH_STLB) {
+        /* STLB. One line per operation */
+        for (i = 0; i < 8; i++) {
+            int s_idx = i * 256 + (index % 256);
+            env->tlb[s_idx].tlb_misc = FIELD_DP64(env->tlb[s_idx].tlb_misc,
+                                                  TLB_MISC, E, 0);
+        }
+    } else if (index < LOONGARCH_TLB_MAX) {
+        /* All MTLB entries */
+        for (i = LOONGARCH_STLB; i < LOONGARCH_TLB_MAX; i++) {
+            env->tlb[i].tlb_misc = FIELD_DP64(env->tlb[i].tlb_misc,
+                                              TLB_MISC, E, 0);
+        }
+    }
+
+    tlb_flush(env_cpu(env));
+}
+
+void helper_invtlb_all(CPULoongArchState *env)
+{
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        env->tlb[i].tlb_misc = FIELD_DP64(env->tlb[i].tlb_misc,
+                                          TLB_MISC, E, 0);
+    }
+    tlb_flush(env_cpu(env));
+}
+
+void helper_invtlb_all_g(CPULoongArchState *env, uint32_t g)
+{
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        LoongArchTLB *tlb = &env->tlb[i];
+        uint8_t tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+
+        if (tlb_g == g) {
+            tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+        }
+    }
+    tlb_flush(env_cpu(env));
+}
+
+void helper_invtlb_all_asid(CPULoongArchState *env, target_ulong info)
+{
+    uint16_t asid = info & R_CSR_ASID_ASID_MASK;
+
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        LoongArchTLB *tlb = &env->tlb[i];
+        uint8_t tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+        uint16_t tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+
+        if (!tlb_g && (tlb_asid == asid)) {
+            tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+        }
+    }
+    tlb_flush(env_cpu(env));
+}
+
+void helper_invtlb_page_asid(CPULoongArchState *env, target_ulong info,
+                             target_ulong addr)
+{
+    uint16_t asid = info & 0x3ff;
+
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        LoongArchTLB *tlb = &env->tlb[i];
+        uint8_t tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+        uint16_t tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+        uint64_t vpn, tlb_vppn;
+        uint8_t tlb_ps, compare_shift;
+
+        if (i >= LOONGARCH_STLB) {
+            tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+        } else {
+            tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+        }
+        tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+        vpn = (addr & TARGET_VIRT_MASK) >> (tlb_ps + 1);
+        compare_shift = tlb_ps + 1 - R_TLB_MISC_VPPN_SHIFT;
+
+        if (!tlb_g && (tlb_asid == asid) &&
+           (vpn == (tlb_vppn >> compare_shift))) {
+            tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+        }
+    }
+    tlb_flush(env_cpu(env));
+}
+
+void helper_invtlb_page_asid_or_g(CPULoongArchState *env,
+                                  target_ulong info, target_ulong addr)
+{
+    uint16_t asid = info & 0x3ff;
+
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        LoongArchTLB *tlb = &env->tlb[i];
+        uint8_t tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+        uint16_t tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+        uint64_t vpn, tlb_vppn;
+        uint8_t tlb_ps, compare_shift;
+
+        if (i >= LOONGARCH_STLB) {
+            tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+        } else {
+            tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+        }
+        tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+        vpn = (addr & TARGET_VIRT_MASK) >> (tlb_ps + 1);
+        compare_shift = tlb_ps + 1 - R_TLB_MISC_VPPN_SHIFT;
+
+        if ((tlb_g || (tlb_asid == asid)) &&
+            (vpn == (tlb_vppn >> compare_shift))) {
+            tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+        }
+    }
+    tlb_flush(env_cpu(env));
+}
+
 bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             MMUAccessType access_type, int mmu_idx,
                             bool probe, uintptr_t retaddr)
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 3e50cd3ac6..d47918785b 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -297,3 +297,105 @@ TRANS(iocsrwr_b, gen_iocsrwr, gen_helper_iocsrwr_b)
 TRANS(iocsrwr_h, gen_iocsrwr, gen_helper_iocsrwr_h)
 TRANS(iocsrwr_w, gen_iocsrwr, gen_helper_iocsrwr_w)
 TRANS(iocsrwr_d, gen_iocsrwr, gen_helper_iocsrwr_d)
+
+static void check_mmu_idx(DisasContext *ctx)
+{
+    if (ctx->mem_idx != MMU_DA_IDX) {
+        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+        ctx->base.is_jmp = DISAS_EXIT;
+    }
+}
+
+static bool trans_tlbsrch(DisasContext *ctx, arg_tlbsrch *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbsrch(cpu_env);
+    return true;
+}
+
+static bool trans_tlbrd(DisasContext *ctx, arg_tlbrd *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbrd(cpu_env);
+    return true;
+}
+
+static bool trans_tlbwr(DisasContext *ctx, arg_tlbwr *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbwr(cpu_env);
+    check_mmu_idx(ctx);
+    return true;
+}
+
+static bool trans_tlbfill(DisasContext *ctx, arg_tlbfill *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbfill(cpu_env);
+    check_mmu_idx(ctx);
+    return true;
+}
+
+static bool trans_tlbclr(DisasContext *ctx, arg_tlbclr *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbclr(cpu_env);
+    check_mmu_idx(ctx);
+    return true;
+}
+
+static bool trans_tlbflush(DisasContext *ctx, arg_tlbflush *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbflush(cpu_env);
+    check_mmu_idx(ctx);
+    return true;
+}
+
+static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
+{
+    TCGv rj = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv rk = gpr_src(ctx, a->rk, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+
+    switch (a->imm) {
+    case 0:
+    case 1:
+        gen_helper_invtlb_all(cpu_env);
+        break;
+    case 2:
+        gen_helper_invtlb_all_g(cpu_env, tcg_constant_i32(1));
+        break;
+    case 3:
+        gen_helper_invtlb_all_g(cpu_env, tcg_constant_i32(0));
+        break;
+    case 4:
+        gen_helper_invtlb_all_asid(cpu_env, rj);
+        break;
+    case 5:
+        gen_helper_invtlb_page_asid(cpu_env, rj, rk);
+        break;
+    case 6:
+        gen_helper_invtlb_page_asid_or_g(cpu_env, rj, rk);
+        break;
+    default:
+        return false;
+    }
+    ctx->base.is_jmp = DISAS_STOP;
+    return true;
+}
-- 
2.34.1


