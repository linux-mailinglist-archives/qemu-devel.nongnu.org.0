Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18DF6E9DE1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:30:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbqC-0007G7-TS; Thu, 20 Apr 2023 17:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbqA-0007Ed-88
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:18 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbq6-0005Xv-H6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z34Pc9cSIRXvCF/uwLXOV03jWCwfE7bGe3cx2DyMRFM=; b=AkMZcNxvbfBCm2SDTdgSVtBeMP
 XUdPOZGWdm4bJEXYbasPjouUtzTKSQ2fASfuRQLz8A4WFm0qipVoyc8rd7HqTP+K0EJN2yYIqUA4H
 7S/uW/iP3wS/2lJGbN5z93iK89rpoT13aI14ghUQHU5NWJA2nNJDBqcB5oj+XjGkLIa8=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com
Subject: [PATCH 4/8] accel/tcg: Replace target_ulong with vaddr in
 helper_unaligned_*()
Date: Thu, 20 Apr 2023 23:28:46 +0200
Message-Id: <20230420212850.20400-5-anjo@rev.ng>
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

Updates helper_unaligned_[ld|st] to take the store/load address as a
vaddr instead of a target_ulong.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 accel/tcg/user-exec.c  | 4 ++--
 include/tcg/tcg-ldst.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 7ec49933fb..d0673de771 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -904,12 +904,12 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
 #endif
 }
 
-void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
+void helper_unaligned_ld(CPUArchState *env, vaddr addr)
 {
     cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
 }
 
-void helper_unaligned_st(CPUArchState *env, target_ulong addr)
+void helper_unaligned_st(CPUArchState *env, vaddr addr)
 {
     cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
 }
diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 2ba22bd5fe..cad7782e2e 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -72,8 +72,8 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 
 #else
 
-G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);
-G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);
+G_NORETURN void helper_unaligned_ld(CPUArchState *env, vaddr addr);
+G_NORETURN void helper_unaligned_st(CPUArchState *env, vaddr addr);
 
 #endif /* CONFIG_SOFTMMU */
 #endif /* TCG_LDST_H */
-- 
2.39.1


