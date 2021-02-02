Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB33730B662
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 05:21:30 +0100 (CET)
Received: from localhost ([::1]:37438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6nBy-0007dO-0Q
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 23:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6n4T-00065U-Bx; Mon, 01 Feb 2021 23:13:45 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37321 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6n4R-0004zE-7H; Mon, 01 Feb 2021 23:13:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DVBJ01fbkz9tlC; Tue,  2 Feb 2021 15:13:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612239200;
 bh=N7aZkZMAZjZ1mtft7AjfybYlaQ339ZQW3otqxHe66KU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JP3/qk1qZq03RFyAcML9rtZhy+z27tS9QEFTNI17Ydw6LDcPZpHHBfteFsDdz1r+4
 4rz+/7cpDIjLJfGtVhe2WFrH025s4c/K81nCx9mA8an+fNVqeTASv49IBRCiQEit4C
 tZeTlTdBMzWTk+NfBi4DD9VtQHyhNePSZ8L07KvQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: dgilbert@redhat.com, pair@us.ibm.com, qemu-devel@nongnu.org,
 brijesh.singh@amd.com, pasic@linux.ibm.com
Subject: [PATCH v8 11/13] spapr: PEF: prevent migration
Date: Tue,  2 Feb 2021 15:13:13 +1100
Message-Id: <20210202041315.196530-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202041315.196530-1-david@gibson.dropbear.id.au>
References: <20210202041315.196530-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: thuth@redhat.com, Cornelia Huck <cohuck@redhat.com>, berrange@redhat.com,
 mst@redhat.com, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 jun.nakajima@intel.com, mtosatti@redhat.com, richard.henderson@linaro.org,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, pragyansri.pathi@intel.com, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com, qemu-ppc@nongnu.org, andi.kleen@intel.com,
 pbonzini@redhat.com, borntraeger@de.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We haven't yet implemented the fairly involved handshaking that will be
needed to migrate PEF protected guests.  For now, just use a migration
blocker so we get a meaningful error if someone attempts this (this is the
same approach used by AMD SEV).

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/pef.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
index f9fd1f2a71..573be3ed79 100644
--- a/hw/ppc/pef.c
+++ b/hw/ppc/pef.c
@@ -44,6 +44,8 @@ struct PefGuest {
 static int kvmppc_svm_init(Error **errp)
 {
 #ifdef CONFIG_KVM
+    static Error *pef_mig_blocker;
+
     if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURE_GUEST)) {
         error_setg(errp,
                    "KVM implementation does not support Secure VMs (is an ultravisor running?)");
@@ -58,6 +60,11 @@ static int kvmppc_svm_init(Error **errp)
         }
     }
 
+    /* add migration blocker */
+    error_setg(&pef_mig_blocker, "PEF: Migration is not implemented");
+    /* NB: This can fail if --only-migratable is used */
+    migrate_add_blocker(pef_mig_blocker, &error_fatal);
+
     return 0;
 #else
     g_assert_not_reached();
-- 
2.29.2


