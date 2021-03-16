Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98933D197
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:14:51 +0100 (CET)
Received: from localhost ([::1]:42344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM6iw-0007WY-96
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lM6hA-0005m3-PN
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lM6h8-0004pt-4X
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615889577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/nN1ZRtMSGZS9U2Z0VTrBZDPHuSHhkcSk1Mn+85a+Q=;
 b=IV/UQhjQ+ZdhyRZTmCQPVJ8gGh945BvI25BrUYxKV5Z6cm6AGIGX45H6Tg2cwMy1ZWxgeV
 TbIBD8x+SO2DOQMgsN+S5z7W6KUMPZWb8uDs1YZs+Y+GHcHPpTAou1cxY4G0Qv5NVuyz9w
 nB2V0I/h8CsRTvL10galShszmGaKHYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-RvcgILtjNFS8O5czCtZQsg-1; Tue, 16 Mar 2021 06:12:53 -0400
X-MC-Unique: RvcgILtjNFS8O5czCtZQsg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2761F801817;
 Tue, 16 Mar 2021 10:12:52 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-185.ams2.redhat.com
 [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76DA25B4B6;
 Tue, 16 Mar 2021 10:12:50 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/6] s390x/pci: Add missing initialization for g_autofree
 variables
Date: Tue, 16 Mar 2021 11:12:21 +0100
Message-Id: <20210316101221.1890034-7-cohuck@redhat.com>
In-Reply-To: <20210316101221.1890034-1-cohuck@redhat.com>
References: <20210316101221.1890034-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

When declaring g_autofree variable without initialization, compiler
will raise "may be used uninitialized in this function" warning due
to automatic free handling.

This is mentioned in docs/devel/style.rst (quote from section
"Automatic memory deallocation"):

  * Variables declared with g_auto* MUST always be initialized,
    otherwise the cleanup function will use uninitialized stack memory

Add initialization for these declarations to prevent the warning and
comply with coding style.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Fixes: cd7498d07fbb ("s390x/pci: Add routine to get the vfio dma available count")
Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Message-Id: <20210315101352.152888-1-mrezanin@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-pci-vfio.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index ead4f222d55a..2a153fa8c9e2 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -29,14 +29,11 @@
  */
 bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
 {
-    g_autofree struct vfio_iommu_type1_info *info;
-    uint32_t argsz;
+    uint32_t argsz = sizeof(struct vfio_iommu_type1_info);
+    g_autofree struct vfio_iommu_type1_info *info = g_malloc0(argsz);
 
     assert(avail);
 
-    argsz = sizeof(struct vfio_iommu_type1_info);
-    info = g_malloc0(argsz);
-
     /*
      * If the specified argsz is not large enough to contain all capabilities
      * it will be updated upon return from the ioctl.  Retry until we have
@@ -230,7 +227,7 @@ static void s390_pci_read_pfip(S390PCIBusDevice *pbdev,
  */
 void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
 {
-    g_autofree struct vfio_device_info *info;
+    g_autofree struct vfio_device_info *info = NULL;
     VFIOPCIDevice *vfio_pci;
     uint32_t argsz;
     int fd;
-- 
2.26.3


