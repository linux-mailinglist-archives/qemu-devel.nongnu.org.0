Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD952461D6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 11:05:02 +0200 (CEST)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7b4f-0007nv-Eg
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 05:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqz-00072A-AK
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 04:50:53 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqu-0004wn-Be
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 04:50:52 -0400
Received: by mail-pj1-x1036.google.com with SMTP id f9so7365083pju.4
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 01:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rH1lgDG9owY6WF8wOXNmBcUhX5Vd6WdsltgCw8xoLPY=;
 b=YFlRaPOxl0QAR0Z5JWEmcDzRbOyp0btkZ6jguecu/HGJD/IEDSTcDFyZf+1ccgwwbj
 ygC+za8n/RZS0U1tudumh5eWaLMpz9OWneEC2g2cxF1kPMHgZWMDUuWtXj94L5Gg08LT
 tMAS72Bm9r7PWKGdLo1fOYn6ILRF5B15saAFKmCePojlRnpeY3M5SV+mPS+Zb/Kep6e2
 la/3OlGG+NGxZXNYBQpAJcGeArvlodpJnnyeXsACQxhSomrWSxJTZ8SOPz1fZpnr83O5
 NmGxglrRvBAkhx5MuZuuMeHATwM84VdheRoQKSjrISGg+LcLN1klSp6mpgOnFJBTekzA
 Y+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rH1lgDG9owY6WF8wOXNmBcUhX5Vd6WdsltgCw8xoLPY=;
 b=fyFh7UGU9ZmryskqqviVzGn7ci2b/WxXufaSwJpska2iTguVef5OdoVFKlGisAznZc
 wBCX7oQOsTRCJUGpo5ZwWPefy1FkT5T7mGyf+0qBftu79LMGy7+W5+auVl45Y5gsWDdj
 fvbL2rM82iUCcLjtTWzFwdDIl07mbOGywD8p9cZk/e7k7X0PF0s2KvXVjNtp2aVi6hM5
 D6sYkdYIjcyNeH8IF185SZS6hoPWSPxWXQG13ejXeOpaozxQXdMNKMw7ZIEbhh1rIZKG
 4Zet1x+kqpndSdg2Aw2uVFsRcdZU8U1hI77CxwFlmrKJDiH1e3yrM/Pu8m3MPofCr2i3
 jrCQ==
X-Gm-Message-State: AOAM53034WFtvIN1S880AlzJ+YRibG3n+i6fg7eN81NXpPDMCTZJCTto
 PgGE11xb2Zu/c2CrxxRL5c5v8Xri/Hqetg==
X-Google-Smtp-Source: ABdhPJxJJ+r4eXak+pwaWlLbuSpbHo+T7JOpOGvxeVKaBw7qMpw4f0s/1XdL0RhwIq+3S6jkd64IFg==
X-Received: by 2002:a17:902:c40d:: with SMTP id
 k13mr10546275plk.220.1597654245940; 
 Mon, 17 Aug 2020 01:50:45 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:50:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v4 14/70] target/riscv: rvv-1.0: update check functions
Date: Mon, 17 Aug 2020 16:48:59 +0800
Message-Id: <20200817084955.28793-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Update check functions with RVV 1.0 rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 708 ++++++++++++++++--------
 1 file changed, 476 insertions(+), 232 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index b529474403e..4ab556f784d 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -19,11 +19,79 @@
 #include "tcg/tcg-gvec-desc.h"
 #include "internals.h"
 
+#define NVPR    32
+
+static inline bool is_aligned(const uint8_t val, const uint8_t pos)
+{
+    return pos ? (val & (pos - 1)) == 0 : true;
+}
+
+static inline bool is_overlapped(const uint8_t astart, uint8_t asize,
+                                 const uint8_t bstart, uint8_t bsize)
+{
+    asize = asize == 0 ? 1 : asize;
+    bsize = bsize == 0 ? 1 : bsize;
+
+    const int aend = astart + asize;
+    const int bend = bstart + bsize;
+
+    return MAX(aend, bend) - MIN(astart, bstart) < asize + bsize;
+}
+
+static inline bool is_overlapped_widen(const uint8_t astart, uint8_t asize,
+                                       const uint8_t bstart, uint8_t bsize)
+{
+    asize = asize == 0 ? 1 : asize;
+    bsize = bsize == 0 ? 1 : bsize;
+
+    const int aend = astart + asize;
+    const int bend = bstart + bsize;
+
+    if (astart < bstart &&
+        is_overlapped(astart, asize, bstart, bsize) &&
+        !is_overlapped(astart, asize, bstart + bsize, bsize)) {
+        return false;
+    } else  {
+        return MAX(aend, bend) - MIN(astart, bstart) < asize + bsize;
+    }
+}
+
+static bool require_rvv(DisasContext *s)
+{
+    if (s->mstatus_vs == 0) {
+        return false;
+    }
+    return true;
+}
+
+/* Destination vector register group cannot overlap source mask register. */
+static bool require_vm(int vm, int rd)
+{
+    return (vm != 0 || rd != 0);
+}
+
+static bool require_align(const uint8_t val, const uint8_t pos)
+{
+    return is_aligned(val, pos);
+}
+
+static bool require_noover(const uint8_t astart, const uint8_t asize,
+                           const uint8_t bstart, const uint8_t bsize)
+{
+    return !is_overlapped(astart, asize, bstart, bsize);
+}
+
+static bool require_noover_widen(const uint8_t astart, const uint8_t asize,
+                                 const uint8_t bstart, const uint8_t bsize)
+{
+    return !is_overlapped_widen(astart, asize, bstart, bsize);
+}
+
 static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
 {
     TCGv s1, s2, dst;
 
-    if (!has_ext(ctx, RVV)) {
+    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
         return false;
     }
 
@@ -56,7 +124,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
 {
     TCGv s1, s2, dst;
 
-    if (!has_ext(ctx, RVV)) {
+    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
         return false;
     }
 
@@ -101,53 +169,266 @@ static bool vext_check_isa_ill(DisasContext *s)
 }
 
 /*
- * There are two rules check here.
+ * Check function for vector instruction with format:
+ * single-width result and single-width sources (SEW = SEW op SEW)
  *
- * 1. Vector register numbers are multiples of LMUL. (Section 3.2)
+ * is_vs1: indicates whether insn[19:15] is a vs1 field or not.
  *
- * 2. For all widening instructions, the destination LMUL value must also be
- *    a supported LMUL value. (Section 11.2)
+ * Rules to be checked here:
+ *   1. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ *   2. Destination vector register number is multiples of LMUL.
+ *      (Section 3.3.2)
+ *   3. Source (vs2, vs1) vector register number are multiples of LMUL.
+ *      (Section 3.3.2)
  */
-static bool vext_check_reg(DisasContext *s, uint32_t reg, bool widen)
+static bool vext_check_sss(DisasContext *s, int vd, int vs1,
+                           int vs2, int vm, bool is_vs1)
+{
+    bool ret = require_vm(vm, vd);
+    if (s->lmul > 0) {
+        ret &= require_align(vd, 1 << s->lmul) &&
+               require_align(vs2, 1 << s->lmul);
+        if (is_vs1) {
+            ret &= require_align(vs1, 1 << s->lmul);
+        }
+    }
+    return ret;
+}
+
+/*
+ * Check function for maskable vector instruction with format:
+ * single-width result and single-width sources (SEW = SEW op SEW)
+ *
+ * is_vs1: indicates whether insn[19:15] is a vs1 field or not.
+ *
+ * Rules to be checked here:
+ *   1. Source (vs2, vs1) vector register number are multiples of LMUL.
+ *      (Section 3.3.2)
+ *   2. Destination vector register cannot overlap a source vector
+ *      register (vs2, vs1) group.
+ *      (Section 5.2)
+ */
+static bool vext_check_mss(DisasContext *s, int vd, int vs1,
+                           int vs2, bool is_vs1)
 {
-    /*
-     * The destination vector register group results are arranged as if both
-     * SEW and LMUL were at twice their current settings. (Section 11.2).
-     */
-    int legal = widen ? 2 << s->lmul : 1 << s->lmul;
+    bool ret = require_align(vs2, 1 << s->lmul);
+    if (vd != vs2) {
+        ret &= require_noover(vd, 1, vs2, 1 << s->lmul);
+    }
+    if (is_vs1) {
+        if (vd != vs1) {
+            ret &= require_noover(vd, 1, vs1, 1 << s->lmul);
+        }
+        ret &= require_align(vs1, 1 << s->lmul);
+    }
+    return ret;
+}
 
-    return !((s->lmul == 0x3 && widen) || (reg % legal));
+/*
+ * Common check function for vector widening instructions
+ * of double-width result (2*SEW).
+ *
+ * Rules to be checked here:
+ *   1. The largest vector register group used by an instruction
+ *      can not be greater than 8 vector registers (Section 5.2):
+ *      => LMUL < 8.
+ *      => SEW < 64.
+ *   2. Destination vector register number is multiples of 2 * LMUL.
+ *      (Section 3.3.2, 11.2)
+ *   3. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ */
+static bool vext_wide_check_common(DisasContext *s, int vd, int vm)
+{
+    return (s->lmul <= 2) &&
+           (s->sew < 3) &&
+           require_align(vd, 1 << (s->lmul + 1)) &&
+           require_vm(vm, vd);
 }
 
 /*
- * There are two rules check here.
+ * Common check function for vector narrowing instructions
+ * of single-width result (SEW) and double-width source (2*SEW).
+ *
+ * Rules to be checked here:
+ *   1. The largest vector register group used by an instruction
+ *      can not be greater than 8 vector registers (Section 5.2):
+ *      => LMUL < 8.
+ *      => SEW < 64.
+ *   2. Source vector register number is multiples of 2 * LMUL.
+ *      (Section 3.3.2, 11.3)
+ *   3. Destination vector register number is multiples of LMUL.
+ *      (Section 3.3.2, 11.3)
+ *   4. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ */
+static bool vext_narrow_check_common(DisasContext *s, int vd, int vs2,
+                                     int vm)
+{
+    return (s->lmul <= 2) &&
+           (s->sew < 3) &&
+           require_align(vs2, 1 << (s->lmul + 1)) &&
+           require_align(vd, 1 << s->lmul) &&
+           require_vm(vm, vd);
+}
+
+/*
+ * Check function for vector instruction with format:
+ * double-width result and single-width sources (2*SEW = SEW op SEW)
  *
- * 1. The destination vector register group for a masked vector instruction can
- *    only overlap the source mask register (v0) when LMUL=1. (Section 5.3)
+ * is_vs1: indicates whether insn[19:15] is a vs1 field or not.
  *
- * 2. In widen instructions and some other insturctions, like vslideup.vx,
- *    there is no need to check whether LMUL=1.
+ * Rules to be checked here:
+ *   1. All rules in defined in widen common rules are applied.
+ *   2. Source (vs2, vs1) vector register number are multiples of LMUL.
+ *      (Section 3.3.2)
+ *   3. Destination vector register cannot overlap a source vector
+ *      register (vs2, vs1) group.
+ *      (Section 5.2)
  */
-static bool vext_check_overlap_mask(DisasContext *s, uint32_t vd, bool vm,
-    bool force)
+static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2,
+                           int vm, bool is_vs1)
 {
-    return (vm != 0 || vd != 0) || (!force && (s->lmul == 0));
+    bool ret = (vext_wide_check_common(s, vd, vm) &&
+                require_align(vs2, 1 << s->lmul));
+    if (s->lmul < 0) {
+        ret &= require_noover(vd, 1 << (s->lmul + 1), vs2, 1 << s->lmul);
+    } else {
+        ret &= require_noover_widen(vd, 1 << (s->lmul + 1), vs2, 1 << s->lmul);
+    }
+    if (is_vs1) {
+        ret &= require_align(vs1, 1 << s->lmul);
+        if (s->lmul < 0) {
+            ret &= require_noover(vd, 1 << (s->lmul + 1), vs1, 1 << s->lmul);
+        } else {
+            ret &= require_noover_widen(vd, 1 << (s->lmul + 1),
+                                        vs1, 1 << s->lmul);
+        }
+    }
+    return ret;
 }
 
-/* The LMUL setting must be such that LMUL * NFIELDS <= 8. (Section 7.8) */
-static bool vext_check_nf(DisasContext *s, uint32_t nf)
+/*
+ * Check function for vector instruction with format:
+ * double-width result and double-width source1 and single-width
+ * source2 (2*SEW = 2*SEW op SEW)
+ *
+ * is_vs1: indicates whether insn[19:15] is a vs1 field or not.
+ *
+ * Rules to be checked here:
+ *   1. All rules in defined in widen common rules are applied.
+ *   2. Source 1 (vs2) vector register number is multiples of 2 * LMUL.
+ *      (Section 3.3.2)
+ *   3. Source 2 (vs1) vector register number is multiples of LMUL.
+ *      (Section 3.3.2)
+ *   4. Destination vector register cannot overlap a source vector
+ *      register (vs1) group.
+ *      (Section 5.2)
+ */
+static bool vext_check_dds(DisasContext *s, int vd, int vs1, int vs2,
+                           int vm, bool is_vs1)
+{
+    bool ret = (vext_wide_check_common(s, vd, vm) &&
+                require_align(vs2, 1 << (s->lmul + 1)));
+    if (is_vs1) {
+        ret &= require_align(vs1, 1 << s->lmul);
+        if (s->lmul < 0) {
+            ret &= require_noover(vd, 1 << (s->lmul + 1), vs1, 1 << s->lmul);
+        } else {
+            ret &= require_noover_widen(vd, 1 << (s->lmul + 1),
+                                        vs1, 1 << s->lmul);
+        }
+    }
+    return ret;
+}
+
+/*
+ * Check function for vector instruction with format:
+ * single-width result and double-width source 1 and single-width
+ * source 2 (SEW = 2*SEW op SEW)
+ *
+ * is_vs1: indicates whether insn[19:15] is a vs1 field or not.
+ *
+ * Rules to be checked here:
+ *   1. All rules in defined in narrow common rules are applied.
+ *   2. Destination vector register cannot overlap a source vector
+ *      register (vs2) group.
+ *      (Section 5.2)
+ *   3. Source 2 (vs1) vector register number is multiples of LMUL.
+ *      (Section 3.3.2)
+ */
+static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2,
+                           int vm, bool is_vs1)
 {
-    return (1 << s->lmul) * nf <= 8;
+    bool ret = vext_narrow_check_common(s, vd, vs2, vm);
+    if (vd != vs2) {
+        ret &= require_noover(vd, 1 << s->lmul, vs2, 1 << (s->lmul + 1));
+    }
+    if (is_vs1) {
+        ret &= require_align(vs1, 1 << s->lmul);
+    }
+    return ret;
 }
 
 /*
- * The destination vector register group cannot overlap a source vector register
- * group of a different element width. (Section 11.2)
+ * Check function for vector reduction instructions.
+ *
+ * Rules to be checked here:
+ *   1. Source 1 (vs2) vector register number is multiples of LMUL.
+ *      (Section 3.3.2)
+ *   2. For widening reduction instructions, SEW < 64.
+ *
+ * TODO: Check vstart == 0
  */
-static inline bool vext_check_overlap_group(int rd, int dlen, int rs, int slen)
+static bool vext_check_reduction(DisasContext *s, int vs2, bool is_wide)
 {
-    return ((rd >= rs + slen) || (rs >= rd + dlen));
+    bool ret = require_align(vs2, 1 << s->lmul);
+    if (is_wide) {
+        ret &= s->sew < 3;
+    }
+    return ret;
 }
+
+/*
+ * Check function for vector slide instructions.
+ *
+ * Rules to be checked here:
+ *   1. Source 1 (vs2) vector register number is multiples of LMUL.
+ *      (Section 3.3.2)
+ *   2. Destination vector register number is multiples of LMUL.
+ *      (Section 3.3.2)
+ *   3. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ *   4. The destination vector register group for vslideup, vslide1up,
+ *      vfslide1up, cannot overlap the source vector register (vs2) group.
+ *      (Section 5.2, 17.3.1, 17.3.3)
+ */
+static bool vext_check_slide(DisasContext *s, int vd, int vs2,
+                             int vm, bool is_over)
+{
+    bool ret = require_align(vs2, 1 << s->lmul) &&
+               require_align(vd, 1 << s->lmul) &&
+               require_vm(vm, vd);
+    if (is_over) {
+        ret &= (vd != vs2);
+    }
+    return ret;
+}
+
+/*
+ * In cpu_get_tb_cpu_state(), set VILL if RVV was not present.
+ * So RVV is also be checked in this function.
+ */
+static bool vext_check_isa_ill(DisasContext *s)
+{
+    return !s->vill;
+}
+
 /* common translation macro */
 #define GEN_VEXT_TRANS(NAME, SEQ, ARGTYPE, OP, CHECK)      \
 static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE *a)\
@@ -803,11 +1084,9 @@ GEN_VEXT_TRANS(vamomaxud_v, 17, rwdvm, amo_op, amo_check)
 
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm, true);
 }
 
 typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
@@ -898,10 +1177,9 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
 
 static bool opivx_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm, false);
 }
 
 typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t, TCGv_i64,
@@ -1098,16 +1376,9 @@ GEN_OPIVI_GVEC_TRANS(vrsub_vi, 0, vrsub_vx, rsubi)
 /* OPIVV with WIDEN */
 static bool opivv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm, true);
 }
 
 static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
@@ -1152,13 +1423,9 @@ GEN_OPIVV_WIDEN_TRANS(vwsub_vv, opivv_widen_check)
 /* OPIVX with WIDEN */
 static bool opivx_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm, false);
 }
 
 static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
@@ -1189,14 +1456,9 @@ GEN_OPIVX_WIDEN_TRANS(vwsub_vx)
 /* WIDEN OPIVV with WIDEN */
 static bool opiwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm, true);
 }
 
 static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
@@ -1239,11 +1501,9 @@ GEN_OPIWV_WIDEN_TRANS(vwsub_wv)
 /* WIDEN OPIVX with WIDEN */
 static bool opiwx_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm, false);
 }
 
 static bool do_opiwx_widen(DisasContext *s, arg_rmrr *a,
@@ -1304,11 +1564,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            ((a->rd != 0) || (s->lmul == 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           (a->rd != 0) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm, true);
 }
 
 GEN_OPIVV_TRANS(vadc_vvm, opivv_vadc_check)
@@ -1320,11 +1579,9 @@ GEN_OPIVV_TRANS(vsbc_vvm, opivv_vadc_check)
  */
 static bool opivv_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &&
-            vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, true);
 }
 
 GEN_OPIVV_TRANS(vmadc_vvm, opivv_vmadc_check)
@@ -1332,10 +1589,10 @@ GEN_OPIVV_TRANS(vmsbc_vvm, opivv_vmadc_check)
 
 static bool opivx_vadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            ((a->rd != 0) || (s->lmul == 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           (a->rd != 0) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm, false);
 }
 
 /* OPIVX without GVEC IR */
@@ -1358,9 +1615,9 @@ GEN_OPIVX_TRANS(vsbc_vxm, opivx_vadc_check)
 
 static bool opivx_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, false);
 }
 
 GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
@@ -1451,14 +1708,9 @@ GEN_OPIVI_GVEC_TRANS(vsra_vi, 1, vsra_vx,  sari)
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
-                2 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sds(s, a->rd, a->rs1, a->rs2, a->vm, true);
 }
 
 /* OPIVV with NARROW */
@@ -1492,13 +1744,9 @@ GEN_OPIVV_NARROW_TRANS(vnsrl_vv)
 
 static bool opivx_narrow_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
-                2 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sds(s, a->rd, a->rs1, a->rs2, a->vm, false);
 }
 
 /* OPIVX with NARROW */
@@ -1546,13 +1794,11 @@ GEN_OPIVI_NARROW_TRANS(vnsrl_vi, 1, vnsrl_vx)
  */
 static bool opivv_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            ((vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &&
-              vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul)) ||
-             (s->lmul == 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, true);
 }
+
 GEN_OPIVV_TRANS(vmseq_vv, opivv_cmp_check)
 GEN_OPIVV_TRANS(vmsne_vv, opivv_cmp_check)
 GEN_OPIVV_TRANS(vmsltu_vv, opivv_cmp_check)
@@ -1562,10 +1808,9 @@ GEN_OPIVV_TRANS(vmsle_vv, opivv_cmp_check)
 
 static bool opivx_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul) ||
-             (s->lmul == 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, false);
 }
 
 GEN_OPIVX_TRANS(vmseq_vx, opivx_cmp_check)
@@ -1644,10 +1889,10 @@ GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
 /* Vector Integer Merge and Move Instructions */
 static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_reg(s, a->rs1, false)) {
-
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        /* vmv.v.v has rs2 = 0 and vm = 1 */
+        vext_check_sss(s, a->rd, a->rs1, 0, 1, true)) {
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
                              vreg_ofs(s, a->rs1),
@@ -1674,9 +1919,10 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
 typedef void gen_helper_vmv_vx(TCGv_ptr, TCGv_i64, TCGv_env, TCGv_i32);
 static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false)) {
-
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        /* vmv.v.x has rs2 = 0 and vm = 1 */
+        vext_check_sss(s, a->rd, a->rs1, 0, 1, false)) {
         TCGv s1;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -1717,9 +1963,10 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
 
 static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false)) {
-
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        /* vmv.v.i has rs2 = 0 and vm = 1 */
+        vext_check_sss(s, a->rd, a->rs1, 0, 1, false)) {
         int64_t simm = sextract64(a->rs1, 0, 5);
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
@@ -1821,12 +2068,10 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, 1, vnclip_vx)
  */
 static bool opfvv_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            (s->sew != 0));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm, true) &&
+           (s->sew != 0);
 }
 
 /* OPFVV without GVEC IR */
@@ -1891,17 +2136,17 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     return true;
 }
 
-static bool opfvf_check(DisasContext *s, arg_rmrr *a)
-{
 /*
  * If the current SEW does not correspond to a supported IEEE floating-point
  * type, an illegal instruction exception is raised
  */
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (s->sew != 0));
+static bool opfvf_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           has_ext(s, RVF) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm, false) &&
+           (s->sew != 0);
 }
 
 /* OPFVF without GVEC IR */
@@ -1931,16 +2176,10 @@ GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
 /* Vector Widening Floating-Point Add/Subtract Instructions */
 static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm, true) &&
+           (s->sew != 0);
 }
 
 /* OPFVV with WIDEN */
@@ -1974,13 +2213,10 @@ GEN_OPFVV_WIDEN_TRANS(vfwsub_vv, opfvv_widen_check)
 
 static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm, false) &&
+           (s->sew != 0);
 }
 
 /* OPFVF with WIDEN */
@@ -2006,14 +2242,10 @@ GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
 
 static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm, true) &&
+           (s->sew != 0);
 }
 
 /* WIDEN OPFVV with WIDEN */
@@ -2047,11 +2279,10 @@ GEN_OPFWV_WIDEN_TRANS(vfwsub_wv)
 
 static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm, false) &&
+           (s->sew != 0);
 }
 
 /* WIDEN OPFVF with WIDEN */
@@ -2122,11 +2353,11 @@ GEN_OPFVF_WIDEN_TRANS(vfwnmsac_vf)
  */
 static bool opfv_check(DisasContext *s, arg_rmr *a)
 {
-   return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (s->sew != 0));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           /* OPFV instructions ignore vs1 check */
+           vext_check_sss(s, a->rd, 0, a->rs2, a->vm, false) &&
+           (s->sew != 0);
 }
 
 #define GEN_OPFV_TRANS(NAME, CHECK)                                \
@@ -2174,13 +2405,10 @@ GEN_OPFVF_TRANS(vfsgnjx_vf, opfvf_check)
 /* Vector Floating-Point Compare Instructions */
 static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            (s->sew != 0) &&
-            ((vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &&
-              vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul)) ||
-             (s->lmul == 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, true) &&
+           (s->sew != 0);
 }
 
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2191,11 +2419,10 @@ GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
 
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (s->sew != 0) &&
-            (vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul) ||
-             (s->lmul == 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, false) &&
+           (s->sew != 0);
 }
 
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
@@ -2214,10 +2441,10 @@ GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
 
 static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        require_align(a->rd, 1 << s->lmul) &&
         (s->sew != 0)) {
-
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
@@ -2263,13 +2490,11 @@ GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
  */
 static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           /* OPFV widening instructions ignore vs1 check */
+           vext_check_dss(s, a->rd, 0, a->rs2, a->vm, false) &&
+           (s->sew != 0);
 }
 
 #define GEN_OPFV_WIDEN_TRANS(NAME)                                 \
@@ -2311,13 +2536,11 @@ GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v)
  */
 static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
-                                     2 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           /* OPFV narrowing instructions ignore vs1 check */
+           vext_check_sds(s, a->rd, 0, a->rs2, a->vm, false) &&
+           (s->sew != 0);
 }
 
 #define GEN_OPFV_NARROW_TRANS(NAME)                                \
@@ -2357,7 +2580,9 @@ GEN_OPFV_NARROW_TRANS(vfncvt_f_f_v)
 /* Vector Single-Width Integer Reduction Instructions */
 static bool reduction_check(DisasContext *s, arg_rmrr *a)
 {
-    return vext_check_isa_ill(s) && vext_check_reg(s, a->rs2, false);
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_reduction(s, a->rs2, false);
 }
 
 GEN_OPIVV_TRANS(vredsum_vs, reduction_check)
@@ -2370,8 +2595,15 @@ GEN_OPIVV_TRANS(vredor_vs, reduction_check)
 GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
 
 /* Vector Widening Integer Reduction Instructions */
-GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_check)
-GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_check)
+static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_reduction(s, a->rs2, true);
+}
+
+GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
 
 /* Vector Single-Width Floating-Point Reduction Instructions */
 GEN_OPFVV_TRANS(vfredsum_vs, reduction_check)
@@ -2419,7 +2651,8 @@ GEN_MM_TRANS(vmxnor_mm)
 /* Vector mask population count vmpopc */
 static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
 {
-    if (vext_check_isa_ill(s)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -2450,7 +2683,8 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
 /* vmfirst find-first-set mask bit */
 static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
 {
-    if (vext_check_isa_ill(s)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -2509,10 +2743,11 @@ GEN_M_TRANS(vmsof_m)
 /* Vector Iota Instruction */
 static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2, 1) &&
-        (a->vm != 0 || a->rd != 0)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        require_noover(a->rd, 1 << s->lmul, a->rs2, 1) &&
+        require_vm(a->vm, a->rd) &&
+        require_align(a->rd, 1 << s->lmul)) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2536,9 +2771,10 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 /* Vector Element Index Instruction */
 static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_overlap_mask(s, a->rd, a->vm, false)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        require_align(a->rd, 1 << s->lmul) &&
+        require_vm(a->vm, a->rd)) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2788,41 +3024,48 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 /* Vector Slide Instructions */
 static bool slideup_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (a->rd != a->rs2));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_slide(s, a->rd, a->rs2, a->vm, true);
 }
 
 GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
 GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
 GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
 
-GEN_OPIVX_TRANS(vslidedown_vx, opivx_check)
-GEN_OPIVX_TRANS(vslide1down_vx, opivx_check)
-GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, opivx_check)
+static bool slidedown_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_slide(s, a->rd, a->rs2, a->vm, false);
+}
+
+GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
+GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
+GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, slidedown_check)
 
 /* Vector Register Gather Instruction */
 static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (a->rd != a->rs2) && (a->rd != a->rs1));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, 1 << s->lmul) &&
+           require_align(a->rs1, 1 << s->lmul) &&
+           require_align(a->rs2, 1 << s->lmul) &&
+           (a->rd != a->rs2 && a->rd != a->rs1) &&
+           require_vm(a->vm, a->rd);
 }
 
 GEN_OPIVV_TRANS(vrgather_vv, vrgather_vv_check)
 
 static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (a->rd != a->rs2));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, 1 << s->lmul) &&
+           require_align(a->rs2, 1 << s->lmul) &&
+           (a->rd != a->rs2) &&
+           require_vm(a->vm, a->rd);
 }
 
 /* vrgather.vx vd, vs2, rs1, vm # vd[i] = (x[rs1] >= VLMAX) ? 0 : vs2[rs1] */
@@ -2886,11 +3129,12 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
 /* Vector Compress Instruction */
 static bool vcompress_vm_check(DisasContext *s, arg_r *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs1, 1) &&
-            (a->rd != a->rs2));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, 1 << s->lmul) &&
+           require_align(a->rs2, 1 << s->lmul) &&
+           (a->rd != a->rs2) &&
+           require_noover(a->rd, 1 << s->lmul, a->rs1, 1);
 }
 
 static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
-- 
2.17.1


