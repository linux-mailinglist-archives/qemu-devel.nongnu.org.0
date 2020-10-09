Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE8E288700
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 12:33:51 +0200 (CEST)
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQpig-0002FN-Mo
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 06:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVV-0005FR-AY
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:13 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60461 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVS-0001n4-K3
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C73wX51cbz9sVt; Fri,  9 Oct 2020 21:19:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1602238796;
 bh=VuZfHxzIg/t8/P9r/M/fZpoUcibMl+KYSkxH7yNVaeQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o/MW85m6Z3a4y5/BuqC7JDxY+8Rqs4u5sum6n5TpMTXt4sMnW0rhksMtNYRLidvtC
 nf24vAgjG/wWJcIYp4BI1E2mwftWd/LXXtxfuewAEEdmOBfU+EEYFDaoRQYcv/hsB9
 iees8qmajmMsltbkKyZc4aVSYJZNe0Gtz/c8SO3k=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 11/20] spapr: Add a return value to spapr_set_vcpu_id()
Date: Fri,  9 Oct 2020 21:19:42 +1100
Message-Id: <20201009101951.1569252-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
References: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
 dbarboza@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nonngu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

As recommended in "qapi/error.h", return true on success and false on
failure. This allows to reduce error propagation overhead in the callers.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20200914123505.612812-11-groug@kaod.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c          | 5 +++--
 hw/ppc/spapr_cpu_core.c | 5 +----
 include/hw/ppc/spapr.h  | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 26b3432fe4..c6af456cfc 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4286,7 +4286,7 @@ int spapr_get_vcpu_id(PowerPCCPU *cpu)
     return cpu->vcpu_id;
 }
 
-void spapr_set_vcpu_id(PowerPCCPU *cpu, int cpu_index, Error **errp)
+bool spapr_set_vcpu_id(PowerPCCPU *cpu, int cpu_index, Error **errp)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
     MachineState *ms = MACHINE(spapr);
@@ -4299,10 +4299,11 @@ void spapr_set_vcpu_id(PowerPCCPU *cpu, int cpu_index, Error **errp)
         error_append_hint(errp, "Adjust the number of cpus to %d "
                           "or try to raise the number of threads per core\n",
                           vcpu_id * ms->smp.threads / spapr->vsmt);
-        return;
+        return false;
     }
 
     cpu->vcpu_id = vcpu_id;
+    return true;
 }
 
 PowerPCCPU *spapr_find_cpu(int vcpu_id)
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 3e4f402b2e..0c879d4da2 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -262,7 +262,6 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
     char *id;
     CPUState *cs;
     PowerPCCPU *cpu;
-    Error *local_err = NULL;
 
     obj = object_new(scc->cpu_type);
 
@@ -274,8 +273,7 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
      */
     cs->start_powered_off = true;
     cs->cpu_index = cc->core_id + i;
-    spapr_set_vcpu_id(cpu, cs->cpu_index, &local_err);
-    if (local_err) {
+    if (!spapr_set_vcpu_id(cpu, cs->cpu_index, errp)) {
         goto err;
     }
 
@@ -292,7 +290,6 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
 
 err:
     object_unref(obj);
-    error_propagate(errp, local_err);
     return NULL;
 }
 
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 194f3b9d07..02f3c29838 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -902,7 +902,7 @@ void spapr_do_system_reset_on_cpu(CPUState *cs, run_on_cpu_data arg);
 #define HTAB_SIZE(spapr)        (1ULL << ((spapr)->htab_shift))
 
 int spapr_get_vcpu_id(PowerPCCPU *cpu);
-void spapr_set_vcpu_id(PowerPCCPU *cpu, int cpu_index, Error **errp);
+bool spapr_set_vcpu_id(PowerPCCPU *cpu, int cpu_index, Error **errp);
 PowerPCCPU *spapr_find_cpu(int vcpu_id);
 
 int spapr_caps_pre_load(void *opaque);
-- 
2.26.2


