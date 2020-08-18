Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84644247D94
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:36:05 +0200 (CEST)
Received: from localhost ([::1]:37330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tLw-0002Ja-Fz
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6d-00005g-Mz; Tue, 18 Aug 2020 00:20:15 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44891 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6b-0006P4-Ub; Tue, 18 Aug 2020 00:20:15 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNg1tCZz9sVs; Tue, 18 Aug 2020 14:19:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724371;
 bh=mzYaBhcj7sVVdZGDz5/VrsQHJfRajhepE23JXYXmoLY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ht+Chm5508kAIwgGjaSS8/cwvMDPqI505vxTzMjSVQeibEjb2Od+vV6zrByXt+rWr
 1R0LnQrpGcJqeV7545rBeDGGlKGCCrvt7/UAjvGHyrsko67gAkU64HatcWBRIMZD98
 8BkdLQbfw+iTymBO7WGq4ORrhQgPPgTc1sM//rx8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 28/40] spapr/xive: Rework error handling of kvmppc_xive_mmap()
Date: Tue, 18 Aug 2020 14:19:10 +1000
Message-Id: <20200818041922.251708-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Callers currently check failures of kvmppc_xive_mmap() through the
@errp argument, which isn't a recommanded practice. It is preferred
to use a return value when possible.

Since NULL isn't an invalid address in theory, it seems better to
return MAP_FAILED and to teach callers to handle it.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159707845972.1489912.719896767746375765.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index d801bf5cd1..b2a36fd59d 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -698,6 +698,7 @@ int kvmppc_xive_post_load(SpaprXive *xive, int version_id)
     return 0;
 }
 
+/* Returns MAP_FAILED on error and sets errno */
 static void *kvmppc_xive_mmap(SpaprXive *xive, int pgoff, size_t len,
                               Error **errp)
 {
@@ -708,7 +709,6 @@ static void *kvmppc_xive_mmap(SpaprXive *xive, int pgoff, size_t len,
                 pgoff << page_shift);
     if (addr == MAP_FAILED) {
         error_setg_errno(errp, errno, "XIVE: unable to set memory mapping");
-        return NULL;
     }
 
     return addr;
@@ -728,6 +728,7 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     size_t tima_len = 4ull << TM_SHIFT;
     CPUState *cs;
     int fd;
+    void *addr;
 
     /*
      * The KVM XIVE device already in use. This is the case when
@@ -763,11 +764,12 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     /*
      * 1. Source ESB pages - KVM mapping
      */
-    xsrc->esb_mmap = kvmppc_xive_mmap(xive, KVM_XIVE_ESB_PAGE_OFFSET, esb_len,
-                                      &local_err);
-    if (local_err) {
+    addr = kvmppc_xive_mmap(xive, KVM_XIVE_ESB_PAGE_OFFSET, esb_len,
+                            &local_err);
+    if (addr == MAP_FAILED) {
         goto fail;
     }
+    xsrc->esb_mmap = addr;
 
     memory_region_init_ram_device_ptr(&xsrc->esb_mmio_kvm, OBJECT(xsrc),
                                       "xive.esb-kvm", esb_len, xsrc->esb_mmap);
@@ -781,11 +783,13 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     /*
      * 3. TIMA pages - KVM mapping
      */
-    xive->tm_mmap = kvmppc_xive_mmap(xive, KVM_XIVE_TIMA_PAGE_OFFSET, tima_len,
-                                     &local_err);
-    if (local_err) {
+    addr = kvmppc_xive_mmap(xive, KVM_XIVE_TIMA_PAGE_OFFSET, tima_len,
+                            &local_err);
+    if (addr == MAP_FAILED) {
         goto fail;
     }
+    xive->tm_mmap = addr;
+
     memory_region_init_ram_device_ptr(&xive->tm_mmio_kvm, OBJECT(xive),
                                       "xive.tima", tima_len, xive->tm_mmap);
     memory_region_add_subregion_overlap(&xive->tm_mmio, 0,
-- 
2.26.2


