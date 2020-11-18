Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4AE2B79E1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:03:05 +0100 (CET)
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJMm-0003Ci-FA
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfJCI-0005bd-Uu
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:52:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfJCG-0007h7-3u
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605689530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6eqoZ2DNWW43NXlv8f4JsA8zZx1bd4Qverp5EXXD6EQ=;
 b=PvWZgGOn7vXGzpR9NfrbdqbhVhSL8SoCJXIBcdrAScGGEfmtXvp7ZwRln/24ZKrtYcA9so
 sCgkF0kXmwoSJILivuHMXQHcOb9b+nv1Q1Tkx6QcfhqJ+QfFdh2bGLyVVW2p6u+++O7LfD
 w2aj8Jaif++aYrxOWiE7ocxil0mKe6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-FcF9psj8N4qcHjnw0yCpNQ-1; Wed, 18 Nov 2020 03:52:07 -0500
X-MC-Unique: FcF9psj8N4qcHjnw0yCpNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FC0E85C732;
 Wed, 18 Nov 2020 08:52:05 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-132.ams2.redhat.com
 [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 079685D9D2;
 Wed, 18 Nov 2020 08:51:56 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH for-5.2] s390x/pci: fix endianness issues
Date: Wed, 18 Nov 2020 09:51:54 +0100
Message-Id: <20201118085154.1299507-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The zPCI group and function structures are big endian. However, we do
not consistently store them as big endian locally, and are missing some
conversions.

Let's just store the structures as host endian instead and convert to
big endian when actually handling the instructions retrieving the data.

Also fix the layout of ClpReqQueryPciGrp: g is actually only 8 bit. This
also fixes accesses on little endian hosts.

Fixes: 28dc86a07299 ("s390x/pci: use a PCI Group structure")
Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

Alternative approach to my patch from yesterday. The change is bigger,
but the end result is arguably nicer.

Again, works for me with virtio-pci devices on x86 and on s390x (tcg/kvm).

Testing with vfio-pci devices would be appreciated.

---
 hw/s390x/s390-pci-bus.c         | 10 +++++-----
 hw/s390x/s390-pci-inst.c        | 14 +++++++++++++-
 hw/s390x/s390-pci-vfio.c        | 12 ++++++------
 include/hw/s390x/s390-pci-clp.h |  8 ++++----
 4 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index e0dc20ce4a56..05f7460aec9b 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -777,11 +777,11 @@ static void s390_pci_init_default_group(void)
     group = s390_group_create(ZPCI_DEFAULT_FN_GRP);
     resgrp = &group->zpci_group;
     resgrp->fr = 1;
-    stq_p(&resgrp->dasm, 0);
-    stq_p(&resgrp->msia, ZPCI_MSI_ADDR);
-    stw_p(&resgrp->mui, DEFAULT_MUI);
-    stw_p(&resgrp->i, 128);
-    stw_p(&resgrp->maxstbl, 128);
+    resgrp->dasm = 0;
+    resgrp->msia = ZPCI_MSI_ADDR;
+    resgrp->mui = DEFAULT_MUI;
+    resgrp->i = 128;
+    resgrp->maxstbl = 128;
     resgrp->version = 0;
 }
 
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 58cd041d17fb..6c36201229f3 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -281,7 +281,12 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
             goto out;
         }
 
-        memcpy(resquery, &pbdev->zpci_fn, sizeof(*resquery));
+        stq_p(&resquery->sdma, pbdev->zpci_fn.sdma);
+        stq_p(&resquery->edma, pbdev->zpci_fn.edma);
+        stw_p(&resquery->pchid, pbdev->zpci_fn.pchid);
+        resquery->pfgid = pbdev->zpci_fn.pfgid;
+        stl_p(&resquery->fid, pbdev->zpci_fn.fid);
+        stl_p(&resquery->uid, pbdev->zpci_fn.uid);
 
         for (i = 0; i < PCI_BAR_COUNT; i++) {
             uint32_t data = pci_get_long(pbdev->pdev->config +
@@ -313,6 +318,13 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
             goto out;
         }
         memcpy(resgrp, &group->zpci_group, sizeof(ClpRspQueryPciGrp));
+        resgrp->fr = group->zpci_group.fr;
+        stq_p(&resgrp->dasm, group->zpci_group.dasm);
+        stq_p(&resgrp->msia, group->zpci_group.msia);
+        stw_p(&resgrp->mui, group->zpci_group.mui);
+        stw_p(&resgrp->i, group->zpci_group.i);
+        stw_p(&resgrp->maxstbl, group->zpci_group.maxstbl);
+        resgrp->version = group->zpci_group.version;
         stw_p(&resgrp->hdr.rsp, CLP_RC_OK);
         break;
     }
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index d5c78063b5bc..9296e1bb6efa 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -156,12 +156,12 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
         if (cap->flags & VFIO_DEVICE_INFO_ZPCI_FLAG_REFRESH) {
             resgrp->fr = 1;
         }
-        stq_p(&resgrp->dasm, cap->dasm);
-        stq_p(&resgrp->msia, cap->msi_addr);
-        stw_p(&resgrp->mui, cap->mui);
-        stw_p(&resgrp->i, cap->noi);
-        stw_p(&resgrp->maxstbl, cap->maxstbl);
-        stb_p(&resgrp->version, cap->version);
+        resgrp->dasm = cap->dasm;
+        resgrp->msia = cap->msi_addr;
+        resgrp->mui = cap->mui;
+        resgrp->i = cap->noi;
+        resgrp->maxstbl = cap->maxstbl;
+        resgrp->version = cap->version;
     }
 }
 
diff --git a/include/hw/s390x/s390-pci-clp.h b/include/hw/s390x/s390-pci-clp.h
index ea2b1378cd5a..96b8e3f1331b 100644
--- a/include/hw/s390x/s390-pci-clp.h
+++ b/include/hw/s390x/s390-pci-clp.h
@@ -144,10 +144,10 @@ typedef struct ClpReqQueryPciGrp {
     ClpReqHdr hdr;
     uint32_t fmt;
     uint64_t reserved1;
-#define CLP_REQ_QPCIG_MASK_PFGID 0xff
-    uint32_t g;
-    uint32_t reserved2;
-    uint64_t reserved3;
+    uint8_t reserved2[3];
+    uint8_t g;
+    uint32_t reserved3;
+    uint64_t reserved4;
 } QEMU_PACKED ClpReqQueryPciGrp;
 
 /* Query PCI function group response */
-- 
2.26.2


