Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A85EAEDA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:57:50 +0200 (CEST)
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsMW-0000Ll-UV
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocras-0005qS-1m
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrao-0005X2-10
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664212109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nH10BLxsjw+CboU8eNsCRjWeiRTieaesn1EB0+7G3tg=;
 b=PjdbX0rorv+N1U6WHnL0yeP2c6Z9AH9GRLsOj7aSLwdh5e+lwt9qLrOdiD1nrEThXx3Mak
 sVj1z9Y4+TurJqm0kAWq1lBw06gEl0fhi5cjw1PlzSr1CT1150+bUht7AJzF8kNuFR2t84
 SYlpjLLQOJ/dUEQSMmMwbzan1Ry/yKI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-ku6EJVHNPferJNLLjweJNw-1; Mon, 26 Sep 2022 13:08:26 -0400
X-MC-Unique: ku6EJVHNPferJNLLjweJNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CDAB3C01DF0;
 Mon, 26 Sep 2022 17:08:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 476C4140EBF4;
 Mon, 26 Sep 2022 17:08:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>
Subject: [PULL 07/14] s390x/pci: add routine to get host function handle from
 CLP info
Date: Mon, 26 Sep 2022 19:07:57 +0200
Message-Id: <20220926170804.453855-8-thuth@redhat.com>
In-Reply-To: <20220926170804.453855-1-thuth@redhat.com>
References: <20220926170804.453855-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

In order to interface with the underlying host zPCI device, we need
to know its function handle. Add a routine to grab this from the
vfio CLP capabilities chain.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Message-Id: <20220902172737.170349-3-mjrosato@linux.ibm.com>
[thuth: Replace free(info) with g_free(info)]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/s390-pci-vfio.h |  5 ++
 hw/s390x/s390-pci-vfio.c         | 83 ++++++++++++++++++++++++++------
 2 files changed, 72 insertions(+), 16 deletions(-)

diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
index ff708aef50..ae1b126ff7 100644
--- a/include/hw/s390x/s390-pci-vfio.h
+++ b/include/hw/s390x/s390-pci-vfio.h
@@ -20,6 +20,7 @@ bool s390_pci_update_dma_avail(int fd, unsigned int *avail);
 S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
                                           S390PCIBusDevice *pbdev);
 void s390_pci_end_dma_count(S390pciState *s, S390PCIDMACount *cnt);
+bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh);
 void s390_pci_get_clp_info(S390PCIBusDevice *pbdev);
 #else
 static inline bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
@@ -33,6 +34,10 @@ static inline S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
 }
 static inline void s390_pci_end_dma_count(S390pciState *s,
                                           S390PCIDMACount *cnt) { }
+static inline bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh)
+{
+    return false;
+}
 static inline void s390_pci_get_clp_info(S390PCIBusDevice *pbdev) { }
 #endif
 
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 6f80a47e29..08bcc55e85 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -124,6 +124,27 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
     pbdev->zpci_fn.pft = 0;
 }
 
+static bool get_host_fh(S390PCIBusDevice *pbdev, struct vfio_device_info *info,
+                        uint32_t *fh)
+{
+    struct vfio_info_cap_header *hdr;
+    struct vfio_device_info_cap_zpci_base *cap;
+    VFIOPCIDevice *vpci = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
+
+    hdr = vfio_get_device_info_cap(info, VFIO_DEVICE_INFO_CAP_ZPCI_BASE);
+
+    /* Can only get the host fh with version 2 or greater */
+    if (hdr == NULL || hdr->version < 2) {
+        trace_s390_pci_clp_cap(vpci->vbasedev.name,
+                               VFIO_DEVICE_INFO_CAP_ZPCI_BASE);
+        return false;
+    }
+    cap = (void *) hdr;
+
+    *fh = cap->fh;
+    return true;
+}
+
 static void s390_pci_read_group(S390PCIBusDevice *pbdev,
                                 struct vfio_device_info *info)
 {
@@ -217,25 +238,13 @@ static void s390_pci_read_pfip(S390PCIBusDevice *pbdev,
     memcpy(pbdev->zpci_fn.pfip, cap->pfip, CLP_PFIP_NR_SEGMENTS);
 }
 
-/*
- * This function will issue the VFIO_DEVICE_GET_INFO ioctl and look for
- * capabilities that contain information about CLP features provided by the
- * underlying host.
- * On entry, defaults have already been placed into the guest CLP response
- * buffers.  On exit, defaults will have been overwritten for any CLP features
- * found in the capability chain; defaults will remain for any CLP features not
- * found in the chain.
- */
-void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
+static struct vfio_device_info *get_device_info(S390PCIBusDevice *pbdev,
+                                                uint32_t argsz)
 {
-    g_autofree struct vfio_device_info *info = NULL;
+    struct vfio_device_info *info = g_malloc0(argsz);
     VFIOPCIDevice *vfio_pci;
-    uint32_t argsz;
     int fd;
 
-    argsz = sizeof(*info);
-    info = g_malloc0(argsz);
-
     vfio_pci = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
     fd = vfio_pci->vbasedev.fd;
 
@@ -250,7 +259,8 @@ retry:
 
     if (ioctl(fd, VFIO_DEVICE_GET_INFO, info)) {
         trace_s390_pci_clp_dev_info(vfio_pci->vbasedev.name);
-        return;
+        g_free(info);
+        return NULL;
     }
 
     if (info->argsz > argsz) {
@@ -259,6 +269,47 @@ retry:
         goto retry;
     }
 
+    return info;
+}
+
+/*
+ * Get the host function handle from the vfio CLP capabilities chain.  Returns
+ * true if a fh value was placed into the provided buffer.  Returns false
+ * if a fh could not be obtained (ioctl failed or capabilitiy version does
+ * not include the fh)
+ */
+bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh)
+{
+    g_autofree struct vfio_device_info *info = NULL;
+
+    assert(fh);
+
+    info = get_device_info(pbdev, sizeof(*info));
+    if (!info) {
+        return false;
+    }
+
+    return get_host_fh(pbdev, info, fh);
+}
+
+/*
+ * This function will issue the VFIO_DEVICE_GET_INFO ioctl and look for
+ * capabilities that contain information about CLP features provided by the
+ * underlying host.
+ * On entry, defaults have already been placed into the guest CLP response
+ * buffers.  On exit, defaults will have been overwritten for any CLP features
+ * found in the capability chain; defaults will remain for any CLP features not
+ * found in the chain.
+ */
+void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
+{
+    g_autofree struct vfio_device_info *info = NULL;
+
+    info = get_device_info(pbdev, sizeof(*info));
+    if (!info) {
+        return;
+    }
+
     /*
      * Find the CLP features provided and fill in the guest CLP responses.
      * Always call s390_pci_read_base first as information from this could
-- 
2.31.1


