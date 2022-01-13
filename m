Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057CC48DC42
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:54:56 +0100 (CET)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83NF-0007ta-R2
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:54:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n83KQ-0006k8-55; Thu, 13 Jan 2022 11:51:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n83KK-0004E8-FY; Thu, 13 Jan 2022 11:51:57 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20DFSXXM009317; 
 Thu, 13 Jan 2022 16:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=BRkm/JbjAi1TjausmF5rG7oXtJEdSTGiD8IU4rmVpiY=;
 b=Rx6iBpIHvhE6ic4yo9DH7L/atfGKdVjbfHZNsryITxryxJd/o81T35I13HxiybDR4YXn
 mwjCronNHntj/xx/CKv/r3c0kGfavgvAIPlhnBWOmMzdLyr3HqXxHIU5npiBZLcjKWnu
 9Isa97+mPXpUWF+5tnvIQ0sZkZDh8zKobh1WmQUGjQJesLi4hh4APG/YC8PSkNuh6AeV
 rhZrieyaGcgNK2RVPNf+q33St1dysM0E5r2KmhlYEKwAHoJq7k0O2jIr3i/3/8K7dM93
 ju5EoSyX00Tid10QV9IAnemPZ2hwbXm3KCOgOiBTyZ4rx8ay5NKIQMrdYgEREoByXz22 ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3djprpsu59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 16:51:49 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20DFVF8T016327;
 Thu, 13 Jan 2022 16:51:49 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3djprpsu32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 16:51:49 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20DGgSx4017752;
 Thu, 13 Jan 2022 16:51:45 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3df28a6q4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 16:51:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20DGph2P32833828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jan 2022 16:51:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08E874C080;
 Thu, 13 Jan 2022 16:51:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D22F94C070;
 Thu, 13 Jan 2022 16:51:42 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 13 Jan 2022 16:51:42 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 1/1] virtio: fix the condition for iommu_platform not supported
Date: Thu, 13 Jan 2022 17:51:31 +0100
Message-Id: <20220113165131.1057714-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HM39lokxBGSKbYBWRRQBo0mt9DOvlDe3
X-Proofpoint-ORIG-GUID: -SRQev01CCOnT9NW8SH6p1udhjIei_bW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_08,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201130102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Jakob Naucke <Jakob.Naucke@ibm.com>, qemu-stable@nongnu.org
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
negotiate _F_ACCESS_PLATFORM.

The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
"device can not access all of the guest ram" and "iova != gpa, thus
device needs to translate iova".

Confidential guest technologies currently rely on the device/hypervisor
offering _F_ACCESS_PLATFORM to grant access to whatever the device needs
to see, because of the first. But, generally, they don't care for the
second.

This is the very reason for which commit 7ef7e6e3b ("vhost: correctly
turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
form the vhost device that does not need it, because on the vhost
interface it only means "I/O address translation is needed".

This patch takes inspiration from 7ef7e6e3b ("vhost: correctly turn on
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

@Kevin: Can you please verify, that I don't break your fix?
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

base-commit: f8d75e10d3e0033a0a29a7a7e4777a4fbc17a016
-- 
2.32.0


