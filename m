Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED57843F275
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 00:12:30 +0200 (CEST)
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDdN-0007RQ-Ki
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 18:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mgDS5-0005a4-Uv; Thu, 28 Oct 2021 18:00:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mgDRw-0007Wz-4y; Thu, 28 Oct 2021 18:00:48 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SLIQOK023641; 
 Thu, 28 Oct 2021 22:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xZwDK4+r2wWrYpB/87S1Os5baLBU6usbYjcgWAreGaE=;
 b=GL6l5ZgBA+pQ/wy4PHGCUAyvF1R+884keza+I4F2iW79D7WR6yPwsepDJPzH/gQMz6g1
 Etx2qHFX1RLgerL3xmsAGhxjBdCafQYZaiEjI/t0K/EsCxxmE0q/0PCrHlhxvawcWzZS
 N5UVzHAzvv3SasTipNTOMEi2V4i5k3Iy7ym8PY/6zKzrqgCrl+mR6ansWC1lC0pMXiZo
 TQ2Efv2ee7wpbFyzdagvPv5js6eXEle85SVnKSZeTp0KN+VKOu9nA49Ylzmq50mBs5Rn
 /KfK8i/u87v8MSB0Dm6YQbYJV6EMh8ahgrmRvuLMKtGmcHjWXXnWSMrfatxtdj+JmWMm xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c03nartyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 22:00:34 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19SLj3VE002300;
 Thu, 28 Oct 2021 22:00:34 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c03nartxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 22:00:34 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19SM046m011797;
 Thu, 28 Oct 2021 22:00:31 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3bx4eed21c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 22:00:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19SM0Rd56619748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 22:00:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DE45A407B;
 Thu, 28 Oct 2021 22:00:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0665DA405F;
 Thu, 28 Oct 2021 22:00:27 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Oct 2021 22:00:26 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v1 1/3] virtio: introduce virtio_force_modern()
Date: Fri, 29 Oct 2021 00:00:15 +0200
Message-Id: <20211028220017.930806-2-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028220017.930806-1-pasic@linux.ibm.com>
References: <20211028220017.930806-1-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M5Y5yd3zsadcADl2ducBGIDOs4IXNdaH
X-Proofpoint-GUID: awfhCR5NSlf2W_l69qy2ak3vYVQ_9cWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Legacy vs modern should be detected via transport specific means. We
can't wait till feature negotiation is done. Let us introduce
virtio_force_modern() as a means for the transport code to signal
that the device should operate in modern mode (because a modern driver
was detected).

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
---

I'm still struggling with how to deal with vhost-user and co. The
problem is that I'm not very familiar with the life-cycle of, let us
say, a vhost_user device.

Looks to me like the vhost part might be just an implementation detail,
and could even become a hot swappable thing.

Another thing is, that vhost processes set_features differently. It
might or might not be a good idea to change this.

Does anybody know why don't we propagate the features on features_set,
but under a set of different conditions, one of which is the vhost
device is started?
---
 hw/virtio/virtio.c         | 12 ++++++++++++
 include/hw/virtio/virtio.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 3a1f6c520c..75aee0e098 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3281,6 +3281,18 @@ void virtio_init(VirtIODevice *vdev, const char *name,
     vdev->use_guest_notifier_mask = true;
 }
 
+void  virtio_force_modern(VirtIODevice *vdev)
+{
+    /*
+     * This takes care of the devices that implement config space access
+     * in QEMU. For vhost-user and similar we need to make sure the features
+     * are actually propagated to the device implementing the config space.
+     *
+     * A VirtioDeviceClass callback may be a good idea.
+     */
+    virtio_set_features(vdev, (1ULL << VIRTIO_F_VERSION_1));
+}
+
 /*
  * Only devices that have already been around prior to defining the virtio
  * standard support legacy mode; this includes devices not specified in the
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb75..2ea92de7a5 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -394,6 +394,7 @@ static inline bool virtio_device_disabled(VirtIODevice *vdev)
     return unlikely(vdev->disabled || vdev->broken);
 }
 
+void  virtio_force_modern(VirtIODevice *vdev);
 bool virtio_legacy_allowed(VirtIODevice *vdev);
 bool virtio_legacy_check_disabled(VirtIODevice *vdev);
 
-- 
2.25.1


