Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AFC2886C9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 12:22:42 +0200 (CEST)
Received: from localhost ([::1]:46838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQpXt-00070u-Lg
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 06:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVQ-0005AH-2f
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:08 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kQpVM-0001m2-Oq
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:20:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C73wW4Qxrz9sTr; Fri,  9 Oct 2020 21:19:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1602238795;
 bh=t2a0wVw8BUpc8Oi6sR1W1FEskafg0a3eFZnFnRt8yNI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y4DG8FQx90iWMr4j+FS+4wF2SIaQy76d1eboBQzQybht6gmhrfYDbSQq5gtNN/zjW
 H80wIAMIcAXDrT1m+Uk65UkQPReIini1FfAysaYeur8Go8MO+kjtQkxiufRECsSxg6
 CpCTHo2EdnMU9Zxfy83/9cMMhDgc7kGSKaC9my+0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/20] ppc: Add a return value to ppc_set_compat() and
 ppc_set_compat_all()
Date: Fri,  9 Oct 2020 21:19:34 +1100
Message-Id: <20201009101951.1569252-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
References: <20201009101951.1569252-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
 qemu-ppc@nonngu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

As recommended in "qapi/error.h", indicate success / failure with a
return value. Since ppc_set_compat() is called from a VMState handler,
let's make it an int so that it propagates any negative errno returned
by kvmppc_set_compat(). Do the same for ppc_set_compat_all() for
consistency, even if it isn't called in a context where a negative errno
is required on failure.

This will allow to simplify error handling in the callers.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20200914123505.612812-3-groug@kaod.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/compat.c | 26 +++++++++++++++-----------
 target/ppc/cpu.h    |  4 ++--
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/ppc/compat.c b/target/ppc/compat.c
index 08aede88dc..e9bec5ffed 100644
--- a/target/ppc/compat.c
+++ b/target/ppc/compat.c
@@ -158,7 +158,7 @@ bool ppc_type_check_compat(const char *cputype, uint32_t compat_pvr,
     return pcc_compat(pcc, compat_pvr, min_compat_pvr, max_compat_pvr);
 }
 
-void ppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr, Error **errp)
+int ppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr, Error **errp)
 {
     const CompatInfo *compat = compat_by_pvr(compat_pvr);
     CPUPPCState *env = &cpu->env;
@@ -169,11 +169,11 @@ void ppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr, Error **errp)
         pcr = 0;
     } else if (!compat) {
         error_setg(errp, "Unknown compatibility PVR 0x%08"PRIx32, compat_pvr);
-        return;
+        return -EINVAL;
     } else if (!ppc_check_compat(cpu, compat_pvr, 0, 0)) {
         error_setg(errp, "Compatibility PVR 0x%08"PRIx32" not valid for CPU",
                    compat_pvr);
-        return;
+        return -EINVAL;
     } else {
         pcr = compat->pcr;
     }
@@ -185,17 +185,19 @@ void ppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr, Error **errp)
         if (ret < 0) {
             error_setg_errno(errp, -ret,
                              "Unable to set CPU compatibility mode in KVM");
-            return;
+            return ret;
         }
     }
 
     cpu->compat_pvr = compat_pvr;
     env->spr[SPR_PCR] = pcr & pcc->pcr_mask;
+    return 0;
 }
 
 typedef struct {
     uint32_t compat_pvr;
-    Error *err;
+    Error **errp;
+    int ret;
 } SetCompatState;
 
 static void do_set_compat(CPUState *cs, run_on_cpu_data arg)
@@ -203,26 +205,28 @@ static void do_set_compat(CPUState *cs, run_on_cpu_data arg)
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     SetCompatState *s = arg.host_ptr;
 
-    ppc_set_compat(cpu, s->compat_pvr, &s->err);
+    s->ret = ppc_set_compat(cpu, s->compat_pvr, s->errp);
 }
 
-void ppc_set_compat_all(uint32_t compat_pvr, Error **errp)
+int ppc_set_compat_all(uint32_t compat_pvr, Error **errp)
 {
     CPUState *cs;
 
     CPU_FOREACH(cs) {
         SetCompatState s = {
             .compat_pvr = compat_pvr,
-            .err = NULL,
+            .errp = errp,
+            .ret = 0,
         };
 
         run_on_cpu(cs, do_set_compat, RUN_ON_CPU_HOST_PTR(&s));
 
-        if (s.err) {
-            error_propagate(errp, s.err);
-            return;
+        if (s.ret < 0) {
+            return s.ret;
         }
     }
+
+    return 0;
 }
 
 int ppc_compat_max_vthreads(PowerPCCPU *cpu)
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 766e9c5c26..e8aa185d4f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1352,10 +1352,10 @@ bool ppc_check_compat(PowerPCCPU *cpu, uint32_t compat_pvr,
 bool ppc_type_check_compat(const char *cputype, uint32_t compat_pvr,
                            uint32_t min_compat_pvr, uint32_t max_compat_pvr);
 
-void ppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr, Error **errp);
+int ppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr, Error **errp);
 
 #if !defined(CONFIG_USER_ONLY)
-void ppc_set_compat_all(uint32_t compat_pvr, Error **errp);
+int ppc_set_compat_all(uint32_t compat_pvr, Error **errp);
 #endif
 int ppc_compat_max_vthreads(PowerPCCPU *cpu);
 void ppc_compat_add_property(Object *obj, const char *name,
-- 
2.26.2


