Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9EA399CE3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:42:43 +0200 (CEST)
Received: from localhost ([::1]:60570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiw6-0006Qo-95
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidP-0007EP-KM; Thu, 03 Jun 2021 04:23:23 -0400
Received: from ozlabs.org ([203.11.71.1]:43379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidN-00007a-Tf; Thu, 03 Jun 2021 04:23:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5m64F8z9t0T; Thu,  3 Jun 2021 18:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708556;
 bh=TGxB2/SNSQI/w9xsrRzt5fR1jbniS6RCQhYL+mH5Hv8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gul3ZNGh/DzdDdOVo+F5fDFEafAjb8gHBqU8xb5sJVBA5WiK0ljJ7UlorRNsJnGHG
 4YExS6/N41ULE9ykiuOUeZxRB44m23zy/Xu23Id5PRqeMt8JY9K7WlYzYce6626Clz
 adAyvhIhUEAMRcN4SV/sjCoS8GoYNIr4omLlqGpU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 19/42] ppc/pef.c: initialize cgs->ready in kvmppc_svm_init()
Date: Thu,  3 Jun 2021 18:22:08 +1000
Message-Id: <20210603082231.601214-20-david@gibson.dropbear.id.au>
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
Cc: Ram Pai <linuxram@us.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

QEMU is failing to launch a CGS pSeries guest in a host that has PEF
support:

qemu-system-ppc64: ../softmmu/vl.c:2585: qemu_machine_creation_done: Assertion `machine->cgs->ready' failed.
Aborted

This is happening because we're not setting the cgs->ready flag that is
asserted in qemu_machine_creation_done() during machine start.

cgs->ready is set in s390_pv_kvm_init() and sev_kvm_init(). Let's set it
in kvmppc_svm_init() as well.

Reported-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210528201619.52363-1-danielhb413@gmail.com>
Acked-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pef.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
index 573be3ed79..cc44d5e339 100644
--- a/hw/ppc/pef.c
+++ b/hw/ppc/pef.c
@@ -41,7 +41,7 @@ struct PefGuest {
     ConfidentialGuestSupport parent_obj;
 };
 
-static int kvmppc_svm_init(Error **errp)
+static int kvmppc_svm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
 #ifdef CONFIG_KVM
     static Error *pef_mig_blocker;
@@ -65,6 +65,8 @@ static int kvmppc_svm_init(Error **errp)
     /* NB: This can fail if --only-migratable is used */
     migrate_add_blocker(pef_mig_blocker, &error_fatal);
 
+    cgs->ready = true;
+
     return 0;
 #else
     g_assert_not_reached();
@@ -102,7 +104,7 @@ int pef_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
         return -1;
     }
 
-    return kvmppc_svm_init(errp);
+    return kvmppc_svm_init(cgs, errp);
 }
 
 int pef_kvm_reset(ConfidentialGuestSupport *cgs, Error **errp)
-- 
2.31.1


