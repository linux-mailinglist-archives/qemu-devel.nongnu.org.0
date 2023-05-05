Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A36F84A6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:16:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwCb-0004wn-3q; Fri, 05 May 2023 10:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1puwCU-0004tl-Jz
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:14:22 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1puwCO-0000yG-AC
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jl+9uIHBuoQ94iJWD2OfDbohcMB+30msieRSc5sJsZI=; b=eH+9gxp5NH5fF+TWY62KKnzW2K
 3ADhXzrqCeib10GEhNRd+latk+Cm0L6+k2MlU/fk3DTcncDgV/J+ONt/CenwITtVa9jV7NvdaRoGJ
 Wl67dLW2dy0HmCSwmbPAVWacFBiTMHIxByA2mr3nJxoxu4lVbF0Ylh7cAdciWwuQNbIc=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com
Subject: [PATCH v2 05/12] accel/tcg/cputlb.c: Widen addr in MMULookupPageData
Date: Fri,  5 May 2023 16:13:56 +0200
Message-Id: <20230505141403.25735-6-anjo@rev.ng>
In-Reply-To: <20230505141403.25735-1-anjo@rev.ng>
References: <20230505141403.25735-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Functions accessing MMULookupPageData are also updated.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 accel/tcg/cputlb.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 38c2edb19a..d6f8bed9f0 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1729,7 +1729,7 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, int mmu_idx,
 typedef struct MMULookupPageData {
     CPUTLBEntryFull *full;
     void *haddr;
-    target_ulong addr;
+    vaddr addr;
     int flags;
     int size;
 } MMULookupPageData;
@@ -1756,7 +1756,7 @@ typedef struct MMULookupLocals {
 static bool mmu_lookup1(CPUArchState *env, MMULookupPageData *data,
                         int mmu_idx, MMUAccessType access_type, uintptr_t ra)
 {
-    target_ulong addr = data->addr;
+    vaddr addr = data->addr;
     uintptr_t index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
     uint64_t tlb_addr = tlb_read_idx(entry, access_type);
@@ -1796,7 +1796,7 @@ static void mmu_watch_or_dirty(CPUArchState *env, MMULookupPageData *data,
                                MMUAccessType access_type, uintptr_t ra)
 {
     CPUTLBEntryFull *full = data->full;
-    target_ulong addr = data->addr;
+    vaddr addr = data->addr;
     int flags = data->flags;
     int size = data->size;
 
@@ -1826,7 +1826,7 @@ static void mmu_watch_or_dirty(CPUArchState *env, MMULookupPageData *data,
  * Resolve the translation for the page(s) beginning at @addr, for MemOp.size
  * bytes.  Return true if the lookup crosses a page boundary.
  */
-static bool mmu_lookup(CPUArchState *env, target_ulong addr, MemOpIdx oi,
+static bool mmu_lookup(CPUArchState *env, vaddr addr, MemOpIdx oi,
                        uintptr_t ra, MMUAccessType type, MMULookupLocals *l)
 {
     unsigned a_bits;
@@ -2046,7 +2046,7 @@ static uint64_t do_ld_mmio_beN(CPUArchState *env, MMULookupPageData *p,
                                MMUAccessType type, uintptr_t ra)
 {
     CPUTLBEntryFull *full = p->full;
-    target_ulong addr = p->addr;
+    vaddr addr = p->addr;
     int i, size = p->size;
 
     QEMU_IOTHREAD_LOCK_GUARD();
@@ -2346,7 +2346,7 @@ static uint64_t do_ld_8(CPUArchState *env, MMULookupPageData *p, int mmu_idx,
     return ret;
 }
 
-static uint8_t do_ld1_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
+static uint8_t do_ld1_mmu(CPUArchState *env, vaddr addr, MemOpIdx oi,
                           uintptr_t ra, MMUAccessType access_type)
 {
     MMULookupLocals l;
@@ -2365,7 +2365,7 @@ tcg_target_ulong helper_ldub_mmu(CPUArchState *env, uint64_t addr,
     return do_ld1_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
-static uint16_t do_ld2_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
+static uint16_t do_ld2_mmu(CPUArchState *env, vaddr addr, MemOpIdx oi,
                            uintptr_t ra, MMUAccessType access_type)
 {
     MMULookupLocals l;
@@ -2396,7 +2396,7 @@ tcg_target_ulong helper_lduw_mmu(CPUArchState *env, uint64_t addr,
     return do_ld2_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
-static uint32_t do_ld4_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
+static uint32_t do_ld4_mmu(CPUArchState *env, vaddr addr, MemOpIdx oi,
                            uintptr_t ra, MMUAccessType access_type)
 {
     MMULookupLocals l;
@@ -2423,7 +2423,7 @@ tcg_target_ulong helper_ldul_mmu(CPUArchState *env, uint64_t addr,
     return do_ld4_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
-static uint64_t do_ld8_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
+static uint64_t do_ld8_mmu(CPUArchState *env, vaddr addr, MemOpIdx oi,
                            uintptr_t ra, MMUAccessType access_type)
 {
     MMULookupLocals l;
@@ -2473,7 +2473,7 @@ tcg_target_ulong helper_ldsl_mmu(CPUArchState *env, uint64_t addr,
     return (int32_t)helper_ldul_mmu(env, addr, oi, retaddr);
 }
 
-static Int128 do_ld16_mmu(CPUArchState *env, target_ulong addr,
+static Int128 do_ld16_mmu(CPUArchState *env, vaddr addr,
                           MemOpIdx oi, uintptr_t ra)
 {
     MMULookupLocals l;
@@ -2674,7 +2674,7 @@ static uint64_t do_st_mmio_leN(CPUArchState *env, MMULookupPageData *p,
                                uint64_t val_le, int mmu_idx, uintptr_t ra)
 {
     CPUTLBEntryFull *full = p->full;
-    target_ulong addr = p->addr;
+    vaddr addr = p->addr;
     int i, size = p->size;
 
     QEMU_IOTHREAD_LOCK_GUARD();
@@ -2856,7 +2856,7 @@ void helper_stb_mmu(CPUArchState *env, uint64_t addr, uint32_t val,
     do_st_1(env, &l.page[0], val, l.mmu_idx, ra);
 }
 
-static void do_st2_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+static void do_st2_mmu(CPUArchState *env, vaddr addr, uint16_t val,
                        MemOpIdx oi, uintptr_t ra)
 {
     MMULookupLocals l;
@@ -2885,7 +2885,7 @@ void helper_stw_mmu(CPUArchState *env, uint64_t addr, uint32_t val,
     do_st2_mmu(env, addr, val, oi, retaddr);
 }
 
-static void do_st4_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+static void do_st4_mmu(CPUArchState *env, vaddr addr, uint32_t val,
                        MemOpIdx oi, uintptr_t ra)
 {
     MMULookupLocals l;
@@ -2912,7 +2912,7 @@ void helper_stl_mmu(CPUArchState *env, uint64_t addr, uint32_t val,
     do_st4_mmu(env, addr, val, oi, retaddr);
 }
 
-static void do_st8_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+static void do_st8_mmu(CPUArchState *env, vaddr addr, uint64_t val,
                        MemOpIdx oi, uintptr_t ra)
 {
     MMULookupLocals l;
@@ -2939,7 +2939,7 @@ void helper_stq_mmu(CPUArchState *env, uint64_t addr, uint64_t val,
     do_st8_mmu(env, addr, val, oi, retaddr);
 }
 
-static void do_st16_mmu(CPUArchState *env, target_ulong addr, Int128 val,
+static void do_st16_mmu(CPUArchState *env, vaddr addr, Int128 val,
                         MemOpIdx oi, uintptr_t ra)
 {
     MMULookupLocals l;
-- 
2.39.1


