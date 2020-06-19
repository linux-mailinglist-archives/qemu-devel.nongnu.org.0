Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3CC200014
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 04:09:33 +0200 (CEST)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jm6TE-0000HC-HD
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 22:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jm6QB-0003AA-Ch; Thu, 18 Jun 2020 22:06:23 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:46513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jm6Q8-0000p2-P8; Thu, 18 Jun 2020 22:06:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49p2GT40bYz9sT6; Fri, 19 Jun 2020 12:06:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1592532369;
 bh=oUlu8u5TiukpYL5YY0i+HjSckV5d3NnHfXBN6cEFoNM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IpLRJFPR1N23oZq2OQi5denxnJtl2OxBqOQnPDm3P9o+q4fZ5ysUcRMcPMD/rZTIM
 fgcPuCtC/xXL8TCuT3gP/WfwbsXGC9F3HeTX65JwHjfjT0DjaXNmyUmIY3q4H3J9uC
 BoMmZaz7l+Y+Dx4agziwde1pIyeDwdHvLvAaWS4k=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org, brijesh.singh@amd.com, pair@us.ibm.com,
 pbonzini@redhat.com, dgilbert@redhat.com, frankja@linux.ibm.com
Subject: [PATCH v3 8/9] spapr: PEF: block migration
Date: Fri, 19 Jun 2020 12:06:01 +1000
Message-Id: <20200619020602.118306-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619020602.118306-1-david@gibson.dropbear.id.au>
References: <20200619020602.118306-1-david@gibson.dropbear.id.au>
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
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org, mst@redhat.com,
 cohuck@redhat.com, david@redhat.com, mdroth@linux.vnet.ibm.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We haven't yet implemented the fairly involved handshaking that will be
needed to migrate PEF protected guests.  For now, just use a migration
blocker so we get a meaningful error if someone attempts this (this is the
same approach used by AMD SEV).

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/pef.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/ppc/pef.c b/target/ppc/pef.c
index 53a6af0347..6a50efd580 100644
--- a/target/ppc/pef.c
+++ b/target/ppc/pef.c
@@ -36,6 +36,8 @@ struct PefGuestState {
     Object parent_obj;
 };
 
+static Error *pef_mig_blocker;
+
 static int pef_kvm_init(HostTrustLimitation *gmpo, Error **errp)
 {
     if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURE_GUEST)) {
@@ -52,6 +54,10 @@ static int pef_kvm_init(HostTrustLimitation *gmpo, Error **errp)
         }
     }
 
+    /* add migration blocker */
+    error_setg(&pef_mig_blocker, "PEF: Migration is not implemented");
+    migrate_add_blocker(pef_mig_blocker, &error_abort);
+
     return 0;
 }
 
-- 
2.26.2


