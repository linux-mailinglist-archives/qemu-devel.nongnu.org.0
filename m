Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F9E247D9A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:37:27 +0200 (CEST)
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tNG-0006Do-7D
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t7K-0000Yb-6K; Tue, 18 Aug 2020 00:20:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45515 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6w-0006RB-KU; Tue, 18 Aug 2020 00:20:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNg6pSVz9sW0; Tue, 18 Aug 2020 14:19:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724371;
 bh=DbwC+sECnYhm8wnwfJMYaLz7+bbwY+b1px5widsSuz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bM8QcPXwPvGNSBVGycV+xJjabiV9dD6eVuJouNL4dzra26j/e/pYcghSRaNveCLN0
 mVWfyWB+OrFsz/uIn6BItmPutFg7cBariLoYE0yvTOwWu6l1kR5xAq3dkRjJGkHogl
 Qs6XnPIYmz5la9oEXAAa4/NBJlj4SifTqBPh0sIY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 31/40] spapr/xive: Rework error handling in
 kvmppc_xive_get_queues()
Date: Tue, 18 Aug 2020 14:19:13 +1000
Message-Id: <20200818041922.251708-32-david@gibson.dropbear.id.au>
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

Since kvmppc_xive_get_queue_config() has a return value, convert
kvmppc_xive_get_queues() to use it for error checking. This allows
to get rid of the local_err boiler plate.

Propagate the return value so that callers may use it as well to check
failures.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159707848069.1489912.14879208798696134531.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 696623f717..4142aaffff 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -467,23 +467,24 @@ void kvmppc_xive_reset(SpaprXive *xive, Error **errp)
                       NULL, true, errp);
 }
 
-static void kvmppc_xive_get_queues(SpaprXive *xive, Error **errp)
+static int kvmppc_xive_get_queues(SpaprXive *xive, Error **errp)
 {
-    Error *local_err = NULL;
     int i;
+    int ret;
 
     for (i = 0; i < xive->nr_ends; i++) {
         if (!xive_end_is_valid(&xive->endt[i])) {
             continue;
         }
 
-        kvmppc_xive_get_queue_config(xive, SPAPR_XIVE_BLOCK_ID, i,
-                                     &xive->endt[i], &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
+        ret = kvmppc_xive_get_queue_config(xive, SPAPR_XIVE_BLOCK_ID, i,
+                                           &xive->endt[i], errp);
+        if (ret < 0) {
+            return ret;
         }
     }
+
+    return 0;
 }
 
 /*
-- 
2.26.2


