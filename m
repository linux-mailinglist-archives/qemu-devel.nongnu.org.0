Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E70247DA4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:41:41 +0200 (CEST)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tRM-0004Ty-Fp
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t7W-000145-6h; Tue, 18 Aug 2020 00:21:10 -0400
Received: from ozlabs.org ([203.11.71.1]:59697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t7T-0006Rv-2k; Tue, 18 Aug 2020 00:21:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNj1rtDz9sW6; Tue, 18 Aug 2020 14:19:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724373;
 bh=nYzC9Ou1s4gDVV7OEYd0gfWrCZnk8V/7nue7+qfnWO4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P+l21GYdvp2fOc/6ZLO5zndFSBgdN1/u+LVO5STJ+d6PmF7/sWro/NUdbVW1iTQ5z
 j4o23cxJfeLx8G+NrUv9tXbmzS8hTPojlWEV7dM3fac3ttdlVrXcgUXiS1cMAG5O02
 jMA0QEpQniMB6o2MWw66/lklShn4Kv5A0DTAzmc8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 36/40] spapr/xive: Simplify error handling in
 kvmppc_xive_connect()
Date: Tue, 18 Aug 2020 14:19:18 +1000
Message-Id: <20200818041922.251708-37-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 00:19:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Now that all these functions return a negative errno on failure, check
that and get rid of the local_err boilerplate.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159707851537.1489912.1030839306195472651.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 005729ebff..e9a36115be 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -723,12 +723,12 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
 {
     SpaprXive *xive = SPAPR_XIVE(intc);
     XiveSource *xsrc = &xive->source;
-    Error *local_err = NULL;
     size_t esb_len = xive_source_esb_len(xsrc);
     size_t tima_len = 4ull << TM_SHIFT;
     CPUState *cs;
     int fd;
     void *addr;
+    int ret;
 
     /*
      * The KVM XIVE device already in use. This is the case when
@@ -754,9 +754,10 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     /* Tell KVM about the # of VCPUs we may have */
     if (kvm_device_check_attr(xive->fd, KVM_DEV_XIVE_GRP_CTRL,
                               KVM_DEV_XIVE_NR_SERVERS)) {
-        if (kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_CTRL,
-                              KVM_DEV_XIVE_NR_SERVERS, &nr_servers, true,
-                              &local_err)) {
+        ret = kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_CTRL,
+                                KVM_DEV_XIVE_NR_SERVERS, &nr_servers, true,
+                                errp);
+        if (ret < 0) {
             goto fail;
         }
     }
@@ -764,8 +765,7 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     /*
      * 1. Source ESB pages - KVM mapping
      */
-    addr = kvmppc_xive_mmap(xive, KVM_XIVE_ESB_PAGE_OFFSET, esb_len,
-                            &local_err);
+    addr = kvmppc_xive_mmap(xive, KVM_XIVE_ESB_PAGE_OFFSET, esb_len, errp);
     if (addr == MAP_FAILED) {
         goto fail;
     }
@@ -783,8 +783,7 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     /*
      * 3. TIMA pages - KVM mapping
      */
-    addr = kvmppc_xive_mmap(xive, KVM_XIVE_TIMA_PAGE_OFFSET, tima_len,
-                            &local_err);
+    addr = kvmppc_xive_mmap(xive, KVM_XIVE_TIMA_PAGE_OFFSET, tima_len, errp);
     if (addr == MAP_FAILED) {
         goto fail;
     }
@@ -802,15 +801,15 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     CPU_FOREACH(cs) {
         PowerPCCPU *cpu = POWERPC_CPU(cs);
 
-        kvmppc_xive_cpu_connect(spapr_cpu_state(cpu)->tctx, &local_err);
-        if (local_err) {
+        ret = kvmppc_xive_cpu_connect(spapr_cpu_state(cpu)->tctx, errp);
+        if (ret < 0) {
             goto fail;
         }
     }
 
     /* Update the KVM sources */
-    kvmppc_xive_source_reset(xsrc, &local_err);
-    if (local_err) {
+    ret = kvmppc_xive_source_reset(xsrc, errp);
+    if (ret < 0) {
         goto fail;
     }
 
@@ -820,7 +819,6 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     return 0;
 
 fail:
-    error_propagate(errp, local_err);
     kvmppc_xive_disconnect(intc);
     return -1;
 }
-- 
2.26.2


