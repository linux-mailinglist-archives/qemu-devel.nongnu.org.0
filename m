Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DE33130A6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 12:23:31 +0100 (CET)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l94de-0006AP-KH
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 06:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zgW-0007vu-P9; Mon, 08 Feb 2021 01:06:08 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:35011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zgU-00063A-2X; Mon, 08 Feb 2021 01:06:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYwVt3vFWz9sWS; Mon,  8 Feb 2021 17:05:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612764342;
 bh=N7aZkZMAZjZ1mtft7AjfybYlaQ339ZQW3otqxHe66KU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cnnXAy+jknbLBjIcGZP9I7awVZdkh8WzFru4SAFtSPHo4EVXTPF67GcSSQwjjBVJh
 2a+8XbX0t0oTwxo/SvnNs8bf6lsorr6/5AK4Gofq+MGwy6wKsIzZ/nQGUgwDSHXXmm
 +6ZYHTklvtLAzO+MegAWjVUKxJ+mBTKwHLOJ5NNY=
From: David Gibson <david@gibson.dropbear.id.au>
To: pasic@linux.ibm.com, dgilbert@redhat.com, pair@us.ibm.com,
 qemu-devel@nongnu.org, brijesh.singh@amd.com
Subject: [PULL v9 11/13] spapr: PEF: prevent migration
Date: Mon,  8 Feb 2021 17:05:36 +1100
Message-Id: <20210208060538.39276-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208060538.39276-1-david@gibson.dropbear.id.au>
References: <20210208060538.39276-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>, cohuck@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 ehabkost@redhat.com, kvm@vger.kernel.org, mst@redhat.com, mtosatti@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, mdroth@linux.vnet.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, pragyansri.pathi@intel.com, jun.nakajima@intel.com,
 andi.kleen@intel.com, pbonzini@redhat.com,
 David Hildenbrand <david@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, frankja@linux.ibm.com
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


