Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98A32F557B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 01:13:30 +0100 (CET)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzqGX-0005wY-3b
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 19:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzq28-0007J0-3T; Wed, 13 Jan 2021 18:58:36 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:50169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzq26-0006fO-03; Wed, 13 Jan 2021 18:58:35 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DGPXR3Gm0z9sj5; Thu, 14 Jan 2021 10:58:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610582295;
 bh=NmD42X0WsHRqDVYpVVbDz7PiUpDumAPsjTSKm/2tvCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eHnrJQZ9Z4likHKrb5Kig2JSXFW0K06BO15ZxTUk6xEr/KwURm9e9/XjyUT8EI6lB
 iY3L/J4gGwpnSp8p8o/6ndTeJ+yr82C+aujC7PsR2jVMwSVeh/t5Y3M4BvxM29ePok
 8hzRL5a/WrMh32T/jRpiEVR+JaU30Vjhv16FKmP4=
From: David Gibson <david@gibson.dropbear.id.au>
To: brijesh.singh@amd.com, pair@us.ibm.com, dgilbert@redhat.com,
 pasic@linux.ibm.com, qemu-devel@nongnu.org
Subject: [PATCH v7 11/13] spapr: PEF: prevent migration
Date: Thu, 14 Jan 2021 10:58:09 +1100
Message-Id: <20210113235811.1909610-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
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
Cc: qemu-ppc@nongnu.org, thuth@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, berrange@redhat.com,
 jun.nakajima@intel.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 mdroth@linux.vnet.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com, mst@redhat.com, pragyansri.pathi@intel.com,
 andi.kleen@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>
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
index 02b9b3b460..d7a49ef337 100644
--- a/hw/ppc/pef.c
+++ b/hw/ppc/pef.c
@@ -42,6 +42,8 @@ struct PefGuest {
 };
 
 #ifdef CONFIG_KVM
+static Error *pef_mig_blocker;
+
 static int kvmppc_svm_init(Error **errp)
 {
     if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURE_GUEST)) {
@@ -58,6 +60,11 @@ static int kvmppc_svm_init(Error **errp)
         }
     }
 
+    /* add migration blocker */
+    error_setg(&pef_mig_blocker, "PEF: Migration is not implemented");
+    /* NB: This can fail if --only-migratable is used */
+    migrate_add_blocker(pef_mig_blocker, &error_fatal);
+
     return 0;
 }
 
-- 
2.29.2


