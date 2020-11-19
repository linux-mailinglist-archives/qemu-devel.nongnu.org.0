Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541E22B900D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:25:08 +0100 (CET)
Received: from localhost ([::1]:46102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfh7j-0002Yf-Ak
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfh6J-0001FL-HI
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:23:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfh6H-0004GI-Pc
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605781417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zuVWm2w10Zr6XqrL9ypcZsqyy3otSI98W6NTCepA+4s=;
 b=IK255Rd2tMZqCBfRZUgtk6f+FHmOcodblH3JZcdh3oFwrE+XD9xUQdA1wX15edE9D5AOTQ
 kLpgyDgA2GSQVfWRj0ehg4BQ3uV4V9DuIah3ay+Fay8vkPoj5wmtn+euOSRN1jH6qF+rPP
 NFiiwfRnhEtnMTfW8WFNM2kNlOe3gT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-mbI9BjUSMAe4z4rPWLiA0A-1; Thu, 19 Nov 2020 05:23:34 -0500
X-MC-Unique: mbI9BjUSMAe4z4rPWLiA0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 298F218B613D;
 Thu, 19 Nov 2020 10:23:33 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-214.ams2.redhat.com
 [10.36.113.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 747AB5D9C0;
 Thu, 19 Nov 2020 10:23:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-5.2 2/3] s390x/pci: Unregister listeners before destroying
 IOMMU address space
Date: Thu, 19 Nov 2020 11:23:24 +0100
Message-Id: <20201119102325.1314765-3-cohuck@redhat.com>
In-Reply-To: <20201119102325.1314765-1-cohuck@redhat.com>
References: <20201119102325.1314765-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

Hot-unplugging a vfio-pci device on s390x causes a QEMU crash:

qemu-system-s390x: ../softmmu/memory.c:2772:
 do_address_space_destroy: Assertion `QTAILQ_EMPTY(&as->listeners)' failed.

In s390, the IOMMU address space is freed during device unplug but the
associated vfio-pci device may not yet be finalized and therefore may
still have a listener registered to the IOMMU address space.

Commit a2166410ad74 ("spapr_pci: Unregister listeners before destroying
the IOMMU address space") previously resolved this issue for spapr_pci.
We are now seeing this in s390x; it would seem the possibility for this
issue was already present but based on a bisect commit 2d24a6466154
("device-core: use RCU for list of children of a bus") has now changed
the timing such that it is now readily reproducible.

Add logic to ensure listeners are removed before destroying the address
space.

Reported-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <1605562955-21152-1-git-send-email-mjrosato@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-pci-bus.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 48a3be802f8e..e0dc20ce4a56 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -732,6 +732,13 @@ static void s390_pci_iommu_free(S390pciState *s, PCIBus *bus, int32_t devfn)
 
     table->iommu[PCI_SLOT(devfn)] = NULL;
     g_hash_table_destroy(iommu->iotlb);
+    /*
+     * An attached PCI device may have memory listeners, eg. VFIO PCI.
+     * The associated subregion will already have been unmapped in
+     * s390_pci_iommu_disable in response to the guest deconfigure request.
+     * Remove the listeners now before destroying the address space.
+     */
+    address_space_remove_listeners(&iommu->as);
     address_space_destroy(&iommu->as);
     object_unparent(OBJECT(&iommu->mr));
     object_unparent(OBJECT(iommu));
-- 
2.26.2


