Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DCE2886DA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 12:25:46 +0200 (CEST)
Received: from localhost ([::1]:55294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQpar-00022H-7P
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 06:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVN-00059o-0J
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33201 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVK-0001m0-03
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C73wW37XGz9sTq; Fri,  9 Oct 2020 21:19:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1602238795;
 bh=5q6vMK0QcqvywwwDzfcaUZlet4OuaQreYsVD/rZXy/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VJAhHC/f976Y/0UASI/1s4ICNRKgQAesRY0HXlwWpfa3IkBHr6ZA71G1m72CMcmAh
 U1O3iaHOdF+1hMwSMvWA88yole8xPRXcefMGJLSOqN6ceMgxk5UNehcH2P+xxJEofM
 dknVwfPPRwJ/THs4BWw4Vi6Twd6HuKL66I7UX7Xs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 02/20] spapr: Fix error leak in spapr_realize_vcpu()
Date: Fri,  9 Oct 2020 21:19:33 +1100
Message-Id: <20201009101951.1569252-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
References: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 06:19:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 dbarboza@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, groug@kaod.org,
 qemu-ppc@nonngu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

If spapr_irq_cpu_intc_create() fails, local_err isn't propagated and
thus leaked.

Fixes: 992861fb1e4c ("error: Eliminate error_propagate() manually")
Cc: armbru@redhat.com
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20200914123505.612812-2-groug@kaod.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_cpu_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 2125fdac34..3e4f402b2e 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -232,7 +232,6 @@ static void spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
 {
     CPUPPCState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    Error *local_err = NULL;
 
     if (!qdev_realize(DEVICE(cpu), NULL, errp)) {
         return;
@@ -244,7 +243,7 @@ static void spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
     cpu_ppc_set_vhyp(cpu, PPC_VIRTUAL_HYPERVISOR(spapr));
     kvmppc_set_papr(cpu);
 
-    if (spapr_irq_cpu_intc_create(spapr, cpu, &local_err) < 0) {
+    if (spapr_irq_cpu_intc_create(spapr, cpu, errp) < 0) {
         cpu_remove_sync(CPU(cpu));
         return;
     }
-- 
2.26.2


