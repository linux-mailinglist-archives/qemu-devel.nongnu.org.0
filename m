Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DD54A8922
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:57:03 +0100 (CET)
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFfPp-00039O-Tx
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:57:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFfFQ-0000BG-Ca
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:46:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56580
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nFfFO-0005bc-4l
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:46:16 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213GVupJ023608; 
 Thu, 3 Feb 2022 16:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=MMl/FEsTK4LiCk+zSAuIxooBG2YOqQt2JVUUdgbants=;
 b=q1p6IEORuavTekbwwlJuNJIcWO/eq6b5b8mKRr6gQ/wDYvzdx+I3mESpIvyT8iuUaXuT
 lgPuKh1AVyzWL1tSJZM7ii2k8kioR4WSlMNU/RnzYS06aWK9mwAzQXPybzQitjD3lUyT
 Vo7K22CMubmYhYa/GBS3t2wJLWugVS/0fOWHvQ+npS5p13OYHVwmOJT8QZryluRLvHHA
 w6KjwLDEpvViS3F7dQw4n3LOgDWPW+RHqs4uTnmGH9jTeqQQa9/jvourI3RxMEgs2MR8
 nlEHm6ACAJTB+JLksK4ddHhU6VkJfglqwL+b0jHms0t8+l0M2uF7qY+6f3SDJzzT7hz6 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0g16vq17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:46:08 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213FGkgn020483;
 Thu, 3 Feb 2022 16:46:08 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0g16vq0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:46:08 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213Gd2ST003364;
 Thu, 3 Feb 2022 16:46:06 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3dvvuk06hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:46:06 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213Gk4pf38207836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 16:46:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67CA35204E;
 Thu,  3 Feb 2022 16:46:04 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 25A3E52059;
 Thu,  3 Feb 2022 16:46:04 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: [RFC PATCH 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Date: Thu,  3 Feb 2022 17:45:56 +0100
Message-Id: <20220203164556.2666565-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9RN0Oz1qPcBwZqo17yetPcIrn59OhXgi
X-Proofpoint-ORIG-GUID: KcoYoyvHoI12nYbd0Q1mE0w43vXdOxN5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_05,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202030100
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unlike most virtio features ACCESS_PATFORM is considered mandatory, i.e.
the driver must accept it if offered by the device. The virtio
specification says that the driver SHOULD accept the ACCESS_PLATFORM
feature if offered, and that the device MAY fail to operate if
ACCESS_PLATFORM was offered but not negotiated.

While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
the device when the driver fences ACCESS_PLATFORM. With commit
2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM") we already made the
decision to do so whenever the get_dma_as() callback is implemented (by
the bus), which in practice means for the entirety of virtio-pci.

That means, if the device needs to translate I/O addresses, then
ACCESS_PLATFORM is mandatory. The aforementioned commit tells us
in the commit message that this is for security reasons.

If ACCESS_PLATFORM is offered not we want the device to utilize an
IOMMU and do address translation, but because the device does not have
access to the entire guest RAM, and needs the driver to grant access
to the bits it needs access to (e.g. confidential guest support), we
still require the guest to have the corresponding logic and to accept
ACCESS_PLATFORM. If the driver does not accept ACCESS_PLATFORM, then
things are bound to go wrong, and we may see failures much less graceful
than failing the device because the driver didn't negotiate
ACCESS_PLATFORM.

So let us make ACCESS_PLATFORM mandatory for the driver regardless
of whether the get_dma_as() callback is implemented or not.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Fixes: 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM")

---
This patch is based on:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg866199.html

During the review of "virtio: fix the condition for iommu_platform not
supported" Daniel raised the question why do we "force IOMMU_PLATFORM"
iff has_iommu && !!klass->get_dma_as. My answer to that was, that
this logic ain't right.

While at it I used the opportunity to re-organize the code a little
and provide an explanatory comment.
---
 hw/virtio/virtio-bus.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index fbf0dd14b8..359430eb1c 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -78,16 +78,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
         return;
     }
 
-    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
-    if (klass->get_dma_as != NULL && has_iommu) {
+    vdev->dma_as = &address_space_memory;
+    if (has_iommu) {
+        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+        /* Fail FEATURE_OK if the device tries to drop IOMMU_PLATFORM */
         virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
-        vdev->dma_as = klass->get_dma_as(qbus->parent);
-        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
-            error_setg(errp,
+        if (klass->get_dma_as) {
+            vdev->dma_as = klass->get_dma_as(qbus->parent);
+            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
+                error_setg(errp,
                        "iommu_platform=true is not supported by the device");
+                return;
+            }
         }
-    } else {
-        vdev->dma_as = &address_space_memory;
     }
 }
 

base-commit: da89f242b4b774a25eaa16be125cf3e17299c127
-- 
2.32.0


