Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77963C1EFE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:38:14 +0200 (CEST)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jDJ-0000Gn-MT
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iti-00018C-3Z; Fri, 09 Jul 2021 01:17:58 -0400
Received: from ozlabs.org ([203.11.71.1]:55519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itf-0001yh-F7; Fri, 09 Jul 2021 01:17:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd5f4Fz9svs; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=hPtLEx8NTO2XmDISUnsJ9dDKsbJkzDbCv2e7woM/dQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aOHeITflUyRCK2vf8jFFnluAqb0LEVzM94cieab9QbR6bPDY7gyTvx1bIv38d+03U
 OEq4zzVkoq7gcEnrwXEX1jE7S0nSV2e+vCy7YuxNsal1s6IokQCZcWKWfySwtYoadq
 H7PN2cE8GVobiX+I6PO+pmGadusywaw7mq4Bvun4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 14/33] target/ppc: Fix compilation with FLUSH_ALL_TLBS debug
 option
Date: Fri,  9 Jul 2021 15:17:09 +1000
Message-Id: <20210709051728.170203-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: aik@ozlabs.ru, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

../target/ppc/mmu_helper.c: In function 'helper_store_ibatu':
../target/ppc/mmu_helper.c:1802:17: error: unused variable 'cpu' [-Werror=unused-variable]
 1802 |     PowerPCCPU *cpu = env_archcpu(env);
      |                 ^~~
../target/ppc/mmu_helper.c: In function 'helper_store_dbatu':
../target/ppc/mmu_helper.c:1838:17: error: unused variable 'cpu' [-Werror=unused-variable]
 1838 |     PowerPCCPU *cpu = env_archcpu(env);
      |                 ^~~
../target/ppc/mmu_helper.c: In function 'helper_store_601_batu':
../target/ppc/mmu_helper.c:1874:17: error: unused variable 'cpu' [-Werror=unused-variable]
 1874 |     PowerPCCPU *cpu = env_archcpu(env);
      |                 ^~~
../target/ppc/mmu_helper.c: In function 'helper_store_601_batl':
../target/ppc/mmu_helper.c:1919:17: error: unused variable 'cpu' [-Werror=unused-variable]
 1919 |     PowerPCCPU *cpu = env_archcpu(env);

Fixes: db70b31144 ("target/ppc: Use env_cpu, env_archcpu")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210702215235.1941771-3-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 4c534b534b..945ac41d42 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1755,9 +1755,6 @@ static inline void dump_store_bat(CPUPPCState *env, char ID, int ul, int nr,
 void helper_store_ibatu(CPUPPCState *env, uint32_t nr, target_ulong value)
 {
     target_ulong mask;
-#if defined(FLUSH_ALL_TLBS)
-    PowerPCCPU *cpu = env_archcpu(env);
-#endif
 
     dump_store_bat(env, 'I', 0, nr, value);
     if (env->IBAT[0][nr] != value) {
@@ -1791,9 +1788,6 @@ void helper_store_ibatl(CPUPPCState *env, uint32_t nr, target_ulong value)
 void helper_store_dbatu(CPUPPCState *env, uint32_t nr, target_ulong value)
 {
     target_ulong mask;
-#if defined(FLUSH_ALL_TLBS)
-    PowerPCCPU *cpu = env_archcpu(env);
-#endif
 
     dump_store_bat(env, 'D', 0, nr, value);
     if (env->DBAT[0][nr] != value) {
@@ -1828,7 +1822,6 @@ void helper_store_601_batu(CPUPPCState *env, uint32_t nr, target_ulong value)
 {
     target_ulong mask;
 #if defined(FLUSH_ALL_TLBS)
-    PowerPCCPU *cpu = env_archcpu(env);
     int do_inval;
 #endif
 
@@ -1873,7 +1866,6 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
 #if !defined(FLUSH_ALL_TLBS)
     target_ulong mask;
 #else
-    PowerPCCPU *cpu = env_archcpu(env);
     int do_inval;
 #endif
 
-- 
2.31.1


