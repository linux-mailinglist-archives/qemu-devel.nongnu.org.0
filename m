Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7544E993
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:08:31 +0100 (CET)
Received: from localhost ([::1]:59040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlYAI-0002cR-3w
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:08:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlY0d-0000NL-GL; Fri, 12 Nov 2021 09:58:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlY0Y-0005kQ-MI; Fri, 12 Nov 2021 09:58:29 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ACErj1S000875; 
 Fri, 12 Nov 2021 14:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4m4v72e8AhAYwdgBA/lw2nEG9f/fYSCLegX1PPSHzqA=;
 b=OxtCQkKaFq24f/+DPw11s+Rz5HyLdWs+JvSrh4MMIEfHLIKHMTyh/elYc3LlRaSssqT0
 0HuSkGqvbH6BBLZeLuVpBd52Qxt0e32itG+CY3tV46j8SF4D3Y3TUck0veegiecUxcqY
 h1wi7G2ERRnVFxhwzmeyGnDuJI4ixfRirTv0abnwdF/sJvuykoBx4NIg/nWQytvY76Iz
 c36iHdKXxe1eZOjR2S9+hIVdLSgV3n8eZOZonXAGEVmj9EKRs3j0I9BnFNOFSB6Ziz2O
 JKEnnMapeEKtsbhibWe1mfRwYa6TXNuhIr2sPYGQeIG4yUznpIzdC4dG64JXkFe52bB5 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c9tebg1tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:16 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ACEwGhv015294;
 Fri, 12 Nov 2021 14:58:16 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c9tebg1sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:16 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ACErLhm003231;
 Fri, 12 Nov 2021 14:58:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3c9t6sr4hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:14 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ACEwAF956426800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Nov 2021 14:58:10 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79C5EA4067;
 Fri, 12 Nov 2021 14:58:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ACFFA4060;
 Fri, 12 Nov 2021 14:58:10 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Nov 2021 14:58:10 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/5] virtio: introduce virtio_force_modern()
Date: Fri, 12 Nov 2021 15:57:45 +0100
Message-Id: <20211112145749.618157-2-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112145749.618157-1-pasic@linux.ibm.com>
References: <20211112145749.618157-1-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Iu4nadT6Pn-GT3NjmrNX1qsZim6wKQRs
X-Proofpoint-ORIG-GUID: _jL4SVykprJ2VCV2t5RVd0HtAw2_hfC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_05,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111120083
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

A new callback is added for the situations where the device needs
to do more than just setting the VIRTIO_F_VERSION_1 feature bit. For
example, when vhost is involved, we may need to propagate the features
to the vhost device.

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
 hw/virtio/virtio.c         | 13 +++++++++++++
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 3a1f6c520c..26db1b31e6 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3281,6 +3281,19 @@ void virtio_init(VirtIODevice *vdev, const char *name,
     vdev->use_guest_notifier_mask = true;
 }
 
+void  virtio_force_modern(VirtIODevice *vdev)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+
+    virtio_add_feature(&vdev->guest_features, VIRTIO_F_VERSION_1);
+    /* Let the device do it's normal thing. */
+    virtio_set_features(vdev, vdev->guest_features);
+    /* For example for vhost-user we have to propagate to the vhost dev. */
+    if (k->force_modern) {
+        k->force_modern(vdev);
+    }
+}
+
 /*
  * Only devices that have already been around prior to defining the virtio
  * standard support legacy mode; this includes devices not specified in the
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb75..1bb1551865 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -126,6 +126,7 @@ struct VirtioDeviceClass {
     int (*validate_features)(VirtIODevice *vdev);
     void (*get_config)(VirtIODevice *vdev, uint8_t *config);
     void (*set_config)(VirtIODevice *vdev, const uint8_t *config);
+    void (*force_modern)(VirtIODevice *vdev);
     void (*reset)(VirtIODevice *vdev);
     void (*set_status)(VirtIODevice *vdev, uint8_t val);
     /* For transitional devices, this is a bitmap of features
@@ -394,6 +395,7 @@ static inline bool virtio_device_disabled(VirtIODevice *vdev)
     return unlikely(vdev->disabled || vdev->broken);
 }
 
+void  virtio_force_modern(VirtIODevice *vdev);
 bool virtio_legacy_allowed(VirtIODevice *vdev);
 bool virtio_legacy_check_disabled(VirtIODevice *vdev);
 
-- 
2.25.1


