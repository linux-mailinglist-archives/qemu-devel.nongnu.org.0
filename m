Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6163131B9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 13:04:36 +0100 (CET)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l95HP-0002X6-3D
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 07:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8ziE-0002Q2-TH; Mon, 08 Feb 2021 01:07:54 -0500
Received: from ozlabs.org ([203.11.71.1]:58403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8ziD-0006ua-2L; Mon, 08 Feb 2021 01:07:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYwY66Qzfz9sWQ; Mon,  8 Feb 2021 17:07:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612764458;
 bh=N7aZkZMAZjZ1mtft7AjfybYlaQ339ZQW3otqxHe66KU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T/xZ1AWrJiuJ+XRpBkyW5pV9Wh2b9D1R96S700Qxvu410XpnmPQ9LX2P+bfFzcdps
 2+m0bBx2+WGFcoKwI2R8pugBIcEzRJCYzmZ+1LEyHYMd9yaJ5StYDe7Z/jof0PmfeT
 a+xjPCTzkVB51nRwYlx9DCu6WKKKEdQg3/Qw75dg=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 dgilbert@redhat.com, brijesh.singh@amd.com, pasic@linux.ibm.com
Subject: [PULL v9 11/13] spapr: PEF: prevent migration
Date: Mon,  8 Feb 2021 17:07:33 +1100
Message-Id: <20210208060735.39838-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208060735.39838-1-david@gibson.dropbear.id.au>
References: <20210208060735.39838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, cohuck@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 david@redhat.com, jun.nakajima@intel.com, mtosatti@redhat.com,
 richard.henderson@linaro.org, mdroth@linux.vnet.ibm.com,
 Greg Kurz <groug@kaod.org>, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com, mst@redhat.com, pragyansri.pathi@intel.com,
 andi.kleen@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
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


