Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E2D29D137
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 18:04:49 +0100 (CET)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXosS-0000im-NJ
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 13:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kXoXP-0000Gz-5Z
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 12:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kXoXM-0001TT-6Z
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 12:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603903379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TrW/iXAG2s9ENGArfq6oI14QfPgCFFI6F13qb4HLRMs=;
 b=RbGGdFUG7grT4mby3navhv0AA5+mYxp9Gq24Wd6gv91bcOUQJcoZrk8OqD95ORbwt+qJsA
 iTkAtRT0sCDfhH+UCYjTqoDyHHSrnoU7x1yKPH48SxEYwpf7CWPXi/n7XiF6wk7XFATvDV
 VZxWHgOBB9kCldQPV/LO+i2hatvK1ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-9Fv3gBBuMBm0751HujpmmA-1; Wed, 28 Oct 2020 12:42:55 -0400
X-MC-Unique: 9Fv3gBBuMBm0751HujpmmA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2C10107465F;
 Wed, 28 Oct 2020 16:42:54 +0000 (UTC)
Received: from gimli.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E2295B4B2;
 Wed, 28 Oct 2020 16:42:51 +0000 (UTC)
Subject: [PULL v2 23/32] s390x/pci: Add routine to get the vfio dma
 available count
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Oct 2020 10:42:50 -0600
Message-ID: <160390337083.12234.15438165466296141369.stgit@gimli.home>
In-Reply-To: <160390309510.12234.8858324597971641979.stgit@gimli.home>
References: <160390309510.12234.8858324597971641979.stgit@gimli.home>
User-Agent: StGit/0.21-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
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
Cc: Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

Create new files for separating out vfio-specific work for s390
pci. Add the first such routine, which issues VFIO_IOMMU_GET_INFO
ioctl to collect the current dma available count.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/s390x/meson.build             |    1 +
 hw/s390x/s390-pci-vfio.c         |   54 ++++++++++++++++++++++++++++++++++++++
 include/hw/s390x/s390-pci-vfio.h |   17 ++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 hw/s390x/s390-pci-vfio.c
 create mode 100644 include/hw/s390x/s390-pci-vfio.h

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 948ceae7a7b3..3ee4594760ac 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -10,6 +10,7 @@ s390x_ss.add(files(
   's390-ccw.c',
   's390-pci-bus.c',
   's390-pci-inst.c',
+  's390-pci-vfio.c',
   's390-skeys.c',
   's390-stattrib.c',
   's390-virtio-hcall.c',
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
new file mode 100644
index 000000000000..cb3f4d98adf8
--- /dev/null
+++ b/hw/s390x/s390-pci-vfio.c
@@ -0,0 +1,54 @@
+/*
+ * s390 vfio-pci interfaces
+ *
+ * Copyright 2020 IBM Corp.
+ * Author(s): Matthew Rosato <mjrosato@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include <sys/ioctl.h>
+
+#include "qemu/osdep.h"
+#include "hw/s390x/s390-pci-vfio.h"
+#include "hw/vfio/vfio-common.h"
+
+/*
+ * Get the current DMA available count from vfio.  Returns true if vfio is
+ * limiting DMA requests, false otherwise.  The current available count read
+ * from vfio is returned in avail.
+ */
+bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
+{
+    g_autofree struct vfio_iommu_type1_info *info;
+    uint32_t argsz;
+
+    assert(avail);
+
+    argsz = sizeof(struct vfio_iommu_type1_info);
+    info = g_malloc0(argsz);
+
+    /*
+     * If the specified argsz is not large enough to contain all capabilities
+     * it will be updated upon return from the ioctl.  Retry until we have
+     * a big enough buffer to hold the entire capability chain.
+     */
+retry:
+    info->argsz = argsz;
+
+    if (ioctl(fd, VFIO_IOMMU_GET_INFO, info)) {
+        return false;
+    }
+
+    if (info->argsz > argsz) {
+        argsz = info->argsz;
+        info = g_realloc(info, argsz);
+        goto retry;
+    }
+
+    /* If the capability exists, update with the current value */
+    return vfio_get_info_dma_avail(info, avail);
+}
+
diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
new file mode 100644
index 000000000000..2a5a261cc9b1
--- /dev/null
+++ b/include/hw/s390x/s390-pci-vfio.h
@@ -0,0 +1,17 @@
+/*
+ * s390 vfio-pci interfaces
+ *
+ * Copyright 2020 IBM Corp.
+ * Author(s): Matthew Rosato <mjrosato@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#ifndef HW_S390_PCI_VFIO_H
+#define HW_S390_PCI_VFIO_H
+
+bool s390_pci_update_dma_avail(int fd, unsigned int *avail);
+
+#endif


