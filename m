Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B16399CFA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:46:02 +0200 (CEST)
Received: from localhost ([::1]:43060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loizJ-000595-KS
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidb-0007gh-Ii; Thu, 03 Jun 2021 04:23:36 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43681 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidV-0000Ed-H1; Thu, 03 Jun 2021 04:23:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5p1ZfVz9t18; Thu,  3 Jun 2021 18:22:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708558;
 bh=U8ptKq4R/vSM+KbfyKdCmuyb5Mf+3aN2n9WZQJLU7wE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AbebrUNmDehsN4UOQsvIkSJlTB7bNC5JFDue6IFelaLtmrs3Ch/+fwP+q7YjAllC1
 9xAh6hzd9L6rdaCURIKdrL1nUUky2iuHW+ZgG+TQbY6SMcG6HcuYvPMbqSUv+lzlc6
 /yF0gvOBX6XOoGi9i2/0Df2NJmhzlfffpYY/6B/4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 26/42] target/ppc: powerpc_excp: Remove dump_syscall_vectored
Date: Thu,  3 Jun 2021 18:22:15 +1000
Message-Id: <20210603082231.601214-27-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

This function is identical to dump_syscall, so use the latter for
system call vectored as well.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210601214649.785647-3-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 5ea8503b46..9e3aae1c96 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -70,18 +70,6 @@ static inline void dump_syscall(CPUPPCState *env)
                   ppc_dump_gpr(env, 8), env->nip);
 }
 
-static inline void dump_syscall_vectored(CPUPPCState *env)
-{
-    qemu_log_mask(CPU_LOG_INT, "syscall r0=%016" PRIx64
-                  " r3=%016" PRIx64 " r4=%016" PRIx64 " r5=%016" PRIx64
-                  " r6=%016" PRIx64 " r7=%016" PRIx64 " r8=%016" PRIx64
-                  " nip=" TARGET_FMT_lx "\n",
-                  ppc_dump_gpr(env, 0), ppc_dump_gpr(env, 3),
-                  ppc_dump_gpr(env, 4), ppc_dump_gpr(env, 5),
-                  ppc_dump_gpr(env, 6), ppc_dump_gpr(env, 7),
-                  ppc_dump_gpr(env, 8), env->nip);
-}
-
 static inline void dump_hcall(CPUPPCState *env)
 {
     qemu_log_mask(CPU_LOG_INT, "hypercall r3=%016" PRIx64
@@ -564,7 +552,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         break;
     case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
         lev = env->error_code;
-        dump_syscall_vectored(env);
+        dump_syscall(env);
         env->nip += 4;
         new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
         new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-- 
2.31.1


