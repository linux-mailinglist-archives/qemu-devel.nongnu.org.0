Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F958247D9C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:38:25 +0200 (CEST)
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tOC-0007rj-Ia
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t7U-00010C-Qt; Tue, 18 Aug 2020 00:21:08 -0400
Received: from ozlabs.org ([203.11.71.1]:48747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t7T-0006Rf-0r; Tue, 18 Aug 2020 00:21:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNh1bhwz9sW3; Tue, 18 Aug 2020 14:19:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724372;
 bh=/tKjcLtS76XXLQ/pn0TEycoIQ/uHeOAgdmkWU4oTH6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XWe1UumWCfLxtN6cKNqDez3m20Q5wVSR0eihIJhXod2sGvR0anQJzrnILsOxaHG2Z
 Jsd8YuqWuGJdm+c/xW0l/JAXVzHmxWrB4CA8YKgqUbfyZbYQmswXpyTqMZA6YI2lQk
 q30qRVDbcfC82s/ncoaHfcn1xq2xZTTOWhUPjtrA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 33/40] spapr/kvm: Fix error handling in kvmppc_xive_pre_save()
Date: Tue, 18 Aug 2020 14:19:15 +1000
Message-Id: <20200818041922.251708-34-david@gibson.dropbear.id.au>
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

Now that kvmppc_xive_get_queues() returns a negative errno on failure, check
with that because it is preferred to local_err. And most of all, propagate
it because vmstate expects negative errnos.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159707849455.1489912.6034461176847728064.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index f2dda69218..1686b036eb 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -604,16 +604,17 @@ void kvmppc_xive_synchronize_state(SpaprXive *xive, Error **errp)
 int kvmppc_xive_pre_save(SpaprXive *xive)
 {
     Error *local_err = NULL;
+    int ret;
 
     assert(xive->fd != -1);
 
     /* EAT: there is no extra state to query from KVM */
 
     /* ENDT */
-    kvmppc_xive_get_queues(xive, &local_err);
-    if (local_err) {
+    ret = kvmppc_xive_get_queues(xive, &local_err);
+    if (ret < 0) {
         error_report_err(local_err);
-        return -1;
+        return ret;
     }
 
     return 0;
-- 
2.26.2


