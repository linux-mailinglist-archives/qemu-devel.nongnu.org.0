Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2494F4A799F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 21:39:15 +0100 (CET)
Received: from localhost ([::1]:49604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFMPJ-0004mp-Lf
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 15:39:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFLiY-0005T4-Rm; Wed, 02 Feb 2022 14:55:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17820
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFLiW-0002am-VD; Wed, 02 Feb 2022 14:55:02 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 212IkHSi029177; 
 Wed, 2 Feb 2022 19:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=A0/rNW1l5Sc7FYWTDyG0p27vCme3H7era6ril3z4k+w=;
 b=d9gKKj7A4NXJuGL1ct4vMvwnG/t5Gpdg6+VgU2umD04+ip++xYu1lNkYrVDOoh+LepPx
 LZhIrUyZjoxkY4stq6oPEaMe4nzOBNhathJMh5drCRxTmRBAJHAmxKvsW8n6nJsW+xvG
 Ty3aqxXyBdVbC9TMfnBlhf+BFGOkUwzmH+9X8HI6tp+w1MFetY4oZ3XaL5o8lCG0LgZu
 1xD9RQLhW4CgJ8vgVBLYipiHGnBvOdP5bP5WGXJOhwCH1fGa+FzN/PGHeGg9cDiGxTJq
 SDp603THnSWrY9odu3FsxeoSlkzdPd39tgAmVpgqlTXzXRlc3plNcipXHQjHKYGJJQuX ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dyu4uygcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 19:54:46 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 212JmF8Q007771;
 Wed, 2 Feb 2022 19:54:45 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dyu4uygcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 19:54:45 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 212JcuXn025172;
 Wed, 2 Feb 2022 19:54:44 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3dvw7a03x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 19:54:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 212JsfVC29819342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Feb 2022 19:54:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88E5AAE057;
 Wed,  2 Feb 2022 19:54:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 366D1AE053;
 Wed,  2 Feb 2022 19:54:41 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Feb 2022 19:54:41 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH v4 1/1] virtio: fix the condition for iommu_platform not
 supported
Date: Wed,  2 Feb 2022 20:54:38 +0100
Message-Id: <20220202195438.379753-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S2Kd6qXjtY1uySxRzCX01Gj6IS-lVvto
X-Proofpoint-GUID: 7E5EZzyd6e8xjRGNADXjSRtfLMcP1M31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_09,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020107
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-stable@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
unsupported") claims to fail the device hotplug when iommu_platform
is requested, but not supported by the (vhost) device. On the first
glance the condition for detecting that situation looks perfect, but
because a certain peculiarity of virtio_platform it ain't.

In fact the aforementioned commit introduces a regression. It breaks
virtio-fs support for Secure Execution, and most likely also for AMD SEV
or any other confidential guest scenario that relies encrypted guest
memory.  The same also applies to any other vhost device that does not
support _F_ACCESS_PLATFORM.

The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
"device can not access all of the guest RAM" and "iova != gpa, thus
device needs to translate iova".

Confidential guest technologies currently rely on the device/hypervisor
offering _F_ACCESS_PLATFORM, so that, after the feature has been
negotiated, the guest  grants access to the portions of memory the
device needs to see. So in for confidential guests, generally,
_F_ACCESS_PLATFORM is about the restricted access to memory, but not
about the addresses used being something else than guest physical
addresses.

This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
turn on VIRTIO_F_IOMMU_PLATFORM") fences _F_ACCESS_PLATFORM from the
vhost device that does not need it, because on the vhost interface it
only means "I/O address translation is needed".

This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
by the device, and thus no device capability is needed. In this
situation claiming that the device does not support iommu_plattform=on
is counter-productive. So let us stop doing that!

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
unsupported")
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-stable@nongnu.org

---

v3->v4:
* Fixed commit message (thanks Connie)
* Removed counter-productive initialization (thanks Connie)
* Added tags
v2->v3:
* Caught a bug: I tired to check if vdev has the feature
   ACCESS_PLATFORM after we have forced it. Moved the check
   to a better place
v1->v2:
* Commit message tweaks. Most notably fixed commit SHA (Michael)

---
---
 hw/virtio/virtio-bus.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index d23db98c56..fbf0dd14b8 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -48,6 +48,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
     VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
     bool has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+    bool vdev_has_iommu;
     Error *local_err = NULL;
 
     DPRINTF("%s: plug device.\n", qbus->name);
@@ -69,11 +70,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
         return;
     }
 
-    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
-        error_setg(errp, "iommu_platform=true is not supported by the device");
-        return;
-    }
-
     if (klass->device_plugged != NULL) {
         klass->device_plugged(qbus->parent, &local_err);
     }
@@ -82,9 +78,14 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
         return;
     }
 
+    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
     if (klass->get_dma_as != NULL && has_iommu) {
         virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
         vdev->dma_as = klass->get_dma_as(qbus->parent);
+        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
+            error_setg(errp,
+                       "iommu_platform=true is not supported by the device");
+        }
     } else {
         vdev->dma_as = &address_space_memory;
     }

base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32
-- 
2.32.0


