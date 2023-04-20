Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD9A6E9DEE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:33:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbqA-0007Dy-C0; Thu, 20 Apr 2023 17:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbq6-0007DX-O8
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:14 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbq0-0005Xj-Aq
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1Ofbhae5USYz7JDbREDTGl+I+j+25oEILY4L1i7Z5B0=; b=DczVUFxvmXcbNxoOFV40BIWzbP
 zICuo1WLenFMBIg4JmCPvzZRWAIDOmAkVG2R+DonVZZcQI4td2JdMnCkl3XPV9qgHh8mq3EaC1HKf
 U430Fk9ZeCdEoEJ9KJ29cU1Y/MJ37powRmYCwFlvZdvrfq9HN+BKOw5WhHnBRU5UE8JI=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com
Subject: [PATCH 3/8] accel/tcg: Replace target_ulong with vaddr in
 *_mmu_lookup()
Date: Thu, 20 Apr 2023 23:28:45 +0200
Message-Id: <20230420212850.20400-4-anjo@rev.ng>
In-Reply-To: <20230420212850.20400-1-anjo@rev.ng>
References: <20230420212850.20400-1-anjo@rev.ng>
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
---
 accel/tcg/cputlb.c    | 4 ++--
 accel/tcg/user-exec.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f35da2fc3b..bf4858c116 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1753,7 +1753,7 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, int mmu_idx,
  *
  * @prot may be PAGE_READ, PAGE_WRITE, or PAGE_READ|PAGE_WRITE.
  */
-static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
+static void *atomic_mmu_lookup(CPUArchState *env, vaddr addr,
                                MemOpIdx oi, int size, int prot,
                                uintptr_t retaddr)
 {
@@ -1762,7 +1762,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     int a_bits = get_alignment_bits(mop);
     uintptr_t index;
     CPUTLBEntry *tlbe;
-    target_ulong tlb_addr;
+    vaddr tlb_addr;
     void *hostaddr;
     CPUTLBEntryFull *full;
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 9d49fe95e4..7ec49933fb 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -914,7 +914,7 @@ void helper_unaligned_st(CPUArchState *env, target_ulong addr)
     cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
 }
 
-static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
+static void *cpu_mmu_lookup(CPUArchState *env, vaddr addr,
                             MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
     MemOp mop = get_memop(oi);
@@ -1226,7 +1226,7 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
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


