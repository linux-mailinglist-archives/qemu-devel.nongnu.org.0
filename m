Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0147490852
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:09:55 +0100 (CET)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Qpe-0004iY-JA
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:09:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n9QjI-0001Kb-H3; Mon, 17 Jan 2022 07:03:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n9QjG-0003HY-LA; Mon, 17 Jan 2022 07:03:20 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HBumXI006767; 
 Mon, 17 Jan 2022 12:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Ry7m7hg7C5HMTJ0rULBipU0H1WMvwedE+jq9ByPuUbQ=;
 b=AVH/60kHIZQH6l73rvADn4Uu10Az7hO62wGUnHOtiZmI/mmxQ8O9qSWKLrMTup3X/tEI
 CDMRqaa57gpQeiWhZW76fvAv3/ZUudjjfEX7um6gq4jQbsRGGDtIk0bRznK4EEnjxulG
 frPAbDJnNkTXcljAr2w+fMjMzMMwATfZyNRM5tZLKGOyw2lqcljQjBoXPxajzE84ZIuL
 w26kj6nLhIPj5oJLzeVyCSnOyI7lB9bp+Da0ewm04saQaB4OkJFwB0tEWxBPKs0ZOseb
 PMYe7WuFTArq+ynrAqvi0+IybE04jLdVWwEq53EopX5cqwnJsLx0vECSZhQRaWDu2Inc /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn81fg4gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:02:45 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HBvLLi010068;
 Mon, 17 Jan 2022 12:02:45 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn81fg4fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:02:44 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HBqtXD016054;
 Mon, 17 Jan 2022 12:02:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3dknw92v1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:02:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HC2eUL27394380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 12:02:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B23F4C040;
 Mon, 17 Jan 2022 12:02:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE1E34C044;
 Mon, 17 Jan 2022 12:02:39 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 12:02:39 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] virtio: fix the condition for iommu_platform not
 supported
Date: Mon, 17 Jan 2022 13:02:38 +0100
Message-Id: <20220117120238.2519239-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _6QJ1t-y0kWTeN54Dpu9sStjle7EGFm3
X-Proofpoint-ORIG-GUID: zTO-obo6P9GpvwVHVwsaTkzSCTeZFyik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_05,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201170077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jakob Naucke <Jakob.Naucke@ibm.com>,
 qemu-stable@nongnu.org
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
turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
form the vhost device that does not need it, because on the vhost
interface it only means "I/O address translation is needed".

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
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-stable@nongnu.org

---

v1->v2: 
* Commit message tweaks. Most notably fixed commit SHA (Michael)

---
 hw/virtio/virtio-bus.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index d23db98c56..c1578f3de2 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -69,11 +69,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
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
@@ -88,6 +83,12 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
     } else {
         vdev->dma_as = &address_space_memory;
     }
+
+    if (has_iommu && vdev->dma_as != &address_space_memory
+                  && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
+        error_setg(errp, "iommu_platform=true is not supported by the device");
+        return;
+    }
 }
 
 /* Reset the virtio_bus */

base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32
-- 
2.32.0


