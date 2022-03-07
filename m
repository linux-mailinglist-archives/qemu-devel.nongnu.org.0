Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038D14CFDEA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:13:52 +0100 (CET)
Received: from localhost ([::1]:41500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCFL-00066C-2o
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:13:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nRBYq-0003dJ-It
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:29:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nRBYo-00089m-67
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:29:56 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227Ao1M2015691; 
 Mon, 7 Mar 2022 11:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=OaxzEh9iGRA7dHQCkOMpdCJLmGGLMzDQl+UqCh6J5pQ=;
 b=EfCdli9pbUVyZ2vBe+LAjrv2c8av2jbH6RBKJ/UNLBI0dZNGvhcX/bqlbx4848z8MxWk
 YoNEb6uQTiQ/umn9F/YUWqH/7xAcdUr97xOZhAjeQPMxYQBuSG1zMEWOtB5GU9Reqxpf
 ImBOyXyyFtMOYMWBwgQYLpqvZC/GFI1CbX1lc34ZhoFyXozIHjvjR3ZvZ03rdJ/JwBEy
 i5+LT++/6LDRnOjRXDs84wcWTmD9shludb1ruWfnEELgWSxHbB6y2+9c+2js0PqchakJ
 b0IU6+mRzfqA2F2gXYx1TJvyhLij4/eIlF66oXc0pvjSvGTbF+FOw1n8wgWGtnwyhszK 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3engn58pf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 11:29:50 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 227BD7gn003110;
 Mon, 7 Mar 2022 11:29:49 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3engn58pe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 11:29:49 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 227BSQPl024658;
 Mon, 7 Mar 2022 11:29:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ekyg8buk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 11:29:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 227BTiV133292678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 11:29:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5253811C04C;
 Mon,  7 Mar 2022 11:29:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 170B411C04A;
 Mon,  7 Mar 2022 11:29:44 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Mar 2022 11:29:44 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH v3 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Date: Mon,  7 Mar 2022 12:29:39 +0100
Message-Id: <20220307112939.2780117-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SR7PLm6UxxlEJu_ALqDcsQG5FcBtrt-U
X-Proofpoint-GUID: g1SPXZRQsbUGDLxyRnw7yIL3Ewko16Pq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_04,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070064
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unlike most virtio features ACCESS_PLATFORM is considered mandatory by
QEMU, i.e. the driver must accept it if offered by the device. The
virtio specification says that the driver SHOULD accept the
ACCESS_PLATFORM feature if offered, and that the device MAY fail to
operate if ACCESS_PLATFORM was offered but not negotiated.

While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
the device when the driver fences ACCESS_PLATFORM. With commit
2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM") we already made the
decision to do so whenever the get_dma_as() callback is implemented (by
the bus), which in practice means for the entirety of virtio-pci.

That means, if the device needs to translate I/O addresses, then
ACCESS_PLATFORM is mandatory. The aforementioned commit tells us in the
commit message that this is for security reasons. More precisely if we
were to allow a less then trusted driver (e.g. an user-space driver, or
a nested guest) to make the device bypass the IOMMU by not negotiating
ACCESS_PLATFORM, then the guest kernel would have no ability to
control/police (by programming the IOMMU) what pieces of guest memory
the driver may manipulate using the device. Which would break security
assumptions within the guest.

If ACCESS_PLATFORM is offered not because we want the device to utilize
an IOMMU and do address translation, but because the device does not
have access to the entire guest RAM, and needs the driver to grant
access to the bits it needs access to (e.g. confidential guest support),
we still require the guest to have the corresponding logic and to accept
ACCESS_PLATFORM. If the driver does not accept ACCESS_PLATFORM, then
things are bound to go wrong, and we may see failures much less graceful
than failing the device because the driver didn't negotiate
ACCESS_PLATFORM.

So let us make ACCESS_PLATFORM mandatory for the driver regardless
of whether the get_dma_as() callback is implemented or not.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Fixes: 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM")

---
v2 -> v3:
* Rebased onto the next branch of the git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
  repository
v1 -> v2:
* Change comment: reflect that this is not about the verify
  but also about the device features as seen by the driver (Connie)
RFC -> v1:
* Tweaked the commit message and fixed typos (Connie)
* Added two sentences discussing the security implications (Michael)

This patch is based on:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg866199.html

During the review of "virtio: fix the condition for iommu_platform not
supported" Daniel raised the question why do we "force IOMMU_PLATFORM"
iff has_iommu && !!klass->get_dma_as. My answer to that was, that
this logic ain't right.

While at it I used the opportunity to re-organize the code a little
and provide an explanatory comment.
---
 hw/virtio/virtio-bus.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 0f69d1c742..d7ec023adf 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -78,17 +78,23 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
         return;
     }
 
-    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
-    if (klass->get_dma_as != NULL && has_iommu) {
+    vdev->dma_as = &address_space_memory;
+    if (has_iommu) {
+        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+        /*
+         * Present IOMMU_PLATFORM to the driver iff iommu_plattform=on and
+         * device operational. If the driver does not accept IOMMU_PLATFORM
+         * we fail the device.
+         */
         virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
-        vdev->dma_as = klass->get_dma_as(qbus->parent);
-        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
-            error_setg(errp,
+        if (klass->get_dma_as) {
+            vdev->dma_as = klass->get_dma_as(qbus->parent);
+            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
+                error_setg(errp,
                        "iommu_platform=true is not supported by the device");
-            return;
+                return;
+            }
         }
-    } else {
-        vdev->dma_as = &address_space_memory;
     }
 }
 

base-commit: 41d137fc631bd9315ff84727d780757d25054c58
-- 
2.32.0


