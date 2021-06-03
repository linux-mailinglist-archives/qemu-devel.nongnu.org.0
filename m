Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B18399C91
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:28:58 +0200 (CEST)
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiin-0004MH-W1
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicz-0006An-S8; Thu, 03 Jun 2021 04:22:57 -0400
Received: from ozlabs.org ([203.11.71.1]:47775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicx-0008Tl-OC; Thu, 03 Jun 2021 04:22:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l6yT2z9sfG; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=ocOgRPM3in48qWZnlawAo5g/f8fvj27brpP0cKJM8hA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XJziEISTFenYxLPNDIcagORJ5u+e6GJ6bk1AsUf/npAkBAy4kTRafA8Jg+Lu+JgFI
 RJ/nhVnZ2/zJZsyKiXBeJmpVWBrvIyHdsOEKPDNCiyinu09FYNH0IK9xqutcmYTG46
 KfONZAx6DQjaaZN8/bUJe4tNUWCyuYeZDsGO1Aw0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 11/42] spapr: Set LPCR to current AIL mode when starting a new
 CPU
Date: Thu,  3 Jun 2021 18:22:00 +1000
Message-Id: <20210603082231.601214-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

TCG does not keep track of AIL mode in a central place, it's based on
the current LPCR[AIL] bits. Synchronize the new CPU's LPCR to the
current LPCR in rtas_start_cpu(), similarly to the way the ILE bit is
synchronized.

Open-code the ILE setting as well now that the caller's LPCR is
available directly, there is no need for the indirection.

Without this, under both TCG and KVM, adding a POWER8/9/10 class CPU
with a new core ID after a modern Linux has booted results in the new
CPU's LPCR missing the LPCR[AIL]=0b11 setting that the other CPUs have.
This can cause crashes and unexpected behaviour.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20210526091626.3388262-3-npiggin@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_rtas.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 63d96955c0..b476382ae6 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -132,8 +132,8 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
     target_ulong id, start, r3;
     PowerPCCPU *newcpu;
     CPUPPCState *env;
-    PowerPCCPUClass *pcc;
     target_ulong lpcr;
+    target_ulong caller_lpcr;
 
     if (nargs != 3 || nret != 1) {
         rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
@@ -152,7 +152,6 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
     }
 
     env = &newcpu->env;
-    pcc = POWERPC_CPU_GET_CLASS(newcpu);
 
     if (!CPU(newcpu)->halted) {
         rtas_st(rets, 0, RTAS_OUT_HW_ERROR);
@@ -164,10 +163,15 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
     env->msr = (1ULL << MSR_SF) | (1ULL << MSR_ME);
     hreg_compute_hflags(env);
 
+    caller_lpcr = callcpu->env.spr[SPR_LPCR];
     lpcr = env->spr[SPR_LPCR];
-    if (!pcc->interrupts_big_endian(callcpu)) {
-        lpcr |= LPCR_ILE;
-    }
+
+    /* Set ILE the same way */
+    lpcr = (lpcr & ~LPCR_ILE) | (caller_lpcr & LPCR_ILE);
+
+    /* Set AIL the same way */
+    lpcr = (lpcr & ~LPCR_AIL) | (caller_lpcr & LPCR_AIL);
+
     if (env->mmu_model == POWERPC_MMU_3_00) {
         /*
          * New cpus are expected to start in the same radix/hash mode
-- 
2.31.1


