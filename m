Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D624AF25A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 14:07:59 +0100 (CET)
Received: from localhost ([::1]:50198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHmhP-00007u-1a
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 08:07:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nHmNP-0001NA-Uw
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:47:16 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nHmNA-0000yA-CW
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:47:15 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 219AL5gx008129; 
 Wed, 9 Feb 2022 12:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=qXrYAbVXSf2fvcZJs0r3D1tNPH7lU2s70J24tTgfjA4=;
 b=ntxE++PRU+AGLt8AvvSfS+NMJkbLnhfvV+WLv3LlTdeUkOu0HQ0u2ll4hU2wTSXCa431
 fARznwmDPzTZ4uQcDaRrQ7K3nc0BuNCtw0Xwh3LwyWI7qFDzeiB395aKAryXDxo6GhYj
 PzXoz+XNJYeK1C00NYPUBQzqto9RENghj6ifUMMaI6p4ODD+CJ6eQFthPf91MC3MvK/c
 QsZn1X2/ucRsD0/cHLkmYRiNK/PP7NVCy4q+1uBQbCONnmZG8cbFVza+GTrwY+OO39as
 wmCMeo7Iyv5z22SzmQGbKpDHfRgeglFC7KPOIMye987nVFTs7tdHS8SG4g9sMPKOPAkh MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3tstkmqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 12:45:49 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 219CXKhP011925;
 Wed, 9 Feb 2022 12:45:48 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3tstkmpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 12:45:48 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 219Cfuk2015401;
 Wed, 9 Feb 2022 12:45:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3e1gv9pw7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 12:45:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 219CZaEh42336750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Feb 2022 12:35:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A433A406A;
 Wed,  9 Feb 2022 12:45:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21EDAA405C;
 Wed,  9 Feb 2022 12:45:43 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Feb 2022 12:45:43 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Date: Wed,  9 Feb 2022 13:45:34 +0100
Message-Id: <20220209124534.1206993-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VRfjE-raM0LDH7ZaABkYNHw1oby4wmlL
X-Proofpoint-GUID: HmaNVlvU5Frp6V8VaseENWIG8N_rYDA6
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_07,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090072
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
 
-- 
2.32.0


