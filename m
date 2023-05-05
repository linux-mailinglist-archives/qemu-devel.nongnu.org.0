Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3333A6F84A8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:16:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwCc-0004x3-Lh; Fri, 05 May 2023 10:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1puwCV-0004uO-I9
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:14:23 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1puwCP-0000zB-NC
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kQHg5N0/5UTmajh8F0ihHp+8v29KXkEdNsfTf8dLZNA=; b=V0JLsemtPNDVFl4dHqDsbzuy+N
 dv/4ePkZ16jfwKcMk+cpMRMspQfDLfvcjqmuPqos31myJQE0fGl679Rep68tlnkkJcxdyCZJkijjQ
 37+Nf+04uHon3Zuj+UgOnKmmVw8y0QDoFsQ3z1XazPT8V0WL7yyrIwCDemtwzyde3g8Q=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com
Subject: [PATCH v2 09/12] accel/tcg: Replace target_ulong with vaddr in
 *_mmu_lookup()
Date: Fri,  5 May 2023 16:14:00 +0200
Message-Id: <20230505141403.25735-10-anjo@rev.ng>
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

Update atomic_mmu_lookup() and cpu_mmu_lookup() to take the guest
virtual address as a vaddr instead of a target_ulong.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c    | 4 ++--
 accel/tcg/user-exec.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 138ce7e697..fb97786dac 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1899,7 +1899,7 @@ static bool mmu_lookup(CPUArchState *env, vaddr addr, MemOpIdx oi,
  *
  * @prot may be PAGE_READ, PAGE_WRITE, or PAGE_READ|PAGE_WRITE.
  */
-static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
+static void *atomic_mmu_lookup(CPUArchState *env, vaddr addr,
                                MemOpIdx oi, int size, int prot,
                                uintptr_t retaddr)
 {
@@ -1908,7 +1908,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     int a_bits = get_alignment_bits(mop);
     uintptr_t index;
     CPUTLBEntry *tlbe;
-    target_ulong tlb_addr;
+    vaddr tlb_addr;
     void *hostaddr;
     CPUTLBEntryFull *full;
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 3b92432df9..929f1a4f43 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -889,7 +889,7 @@ void page_reset_target_data(target_ulong start, target_ulong last) { }
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-static void *cpu_mmu_lookup(CPUArchState *env, abi_ptr addr,
+static void *cpu_mmu_lookup(CPUArchState *env, vaddr addr,
                             MemOp mop, uintptr_t ra, MMUAccessType type)
 {
     int a_bits = get_alignment_bits(mop);
@@ -1478,7 +1478,7 @@ uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
  *
  * @prot may be PAGE_READ, PAGE_WRITE, or PAGE_READ|PAGE_WRITE.
  */
-static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
+static void *atomic_mmu_lookup(CPUArchState *env, vaddr addr,
                                MemOpIdx oi, int size, int prot,
                                uintptr_t retaddr)
 {
-- 
2.39.1


