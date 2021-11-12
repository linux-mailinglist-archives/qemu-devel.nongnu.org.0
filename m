Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F044E989
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:05:51 +0100 (CET)
Received: from localhost ([::1]:50696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlY7f-00021V-5o
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:05:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlY0b-0000L3-HH; Fri, 12 Nov 2021 09:58:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlY0Y-0005kV-Lp; Fri, 12 Nov 2021 09:58:28 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ACDe7do013786; 
 Fri, 12 Nov 2021 14:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BpsDwGspYmxNfw1Wc2Lav1ChYbAorcBYe0UJAiUmDNs=;
 b=NRWRzk7TfZD++FyrgJYZFY1Ae28mQh5MFkSoqTiRcUZeqI4prWSskro7y4+d2IITxV1I
 kE1GDJR3QvKQpTLspfybo9C7K52ucbFLp3Nqea10YIHk9ijrzrRfyiR4JBrxv4m6TsTI
 aGMdJVE/ktdZ2StDKNDZz9HyOG9RvUYltM18DxHhmBsBeQgnUp/Rv0YFe7JnvFF122oL
 TkERETiTUqT1syppkKZd+G/HekbKivIAa3av8wbaxK/CkIOh3gDJMzFQGW+wILWOXEC6
 enRq8bOeWNOTl2n0/iPLTpI9Kk80K1k/B86qwpjr8+1EH/naTbWqtxjarCRNXOJsBB3x pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c9pu2d80m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:17 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ACDem94015479;
 Fri, 12 Nov 2021 14:58:17 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c9pu2d7yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:17 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ACErRl9004380;
 Fri, 12 Nov 2021 14:58:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3c5hbb6e7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:14 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1ACEpRBp61866302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Nov 2021 14:51:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4DC0A405B;
 Fri, 12 Nov 2021 14:58:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CEA8A405C;
 Fri, 12 Nov 2021 14:58:11 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Nov 2021 14:58:11 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/5] vhost: push features to backend on force_modern
Date: Fri, 12 Nov 2021 15:57:48 +0100
Message-Id: <20211112145749.618157-5-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112145749.618157-1-pasic@linux.ibm.com>
References: <20211112145749.618157-1-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NkMquReM09Rl4t-Fmydy3GdqZzUREXCy
X-Proofpoint-ORIG-GUID: tjtXqWtY5m18X_S95jiSOEIpmlDR-3tJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_05,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111120083
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

In vhost we don't push the features to the vhost device when the
features are set, but when the vhost device is started. This can
lead to problems when config space is implemented in the vhost
device, and the driver does some early config space reading (early in a
sense that it precedes setting FEATURES_OK).

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
---
 hw/virtio/vhost.c         | 17 +++++++++++++++++
 include/hw/virtio/vhost.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index b4b29413e6..5764970298 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1628,6 +1628,23 @@ void vhost_dev_free_inflight(struct vhost_inflight *inflight)
     }
 }
 
+int vhost_dev_force_modern(struct vhost_dev *hdev)
+{
+    uint64_t features;
+    int r;
+
+    assert(hdev->vhost_ops);
+
+    hdev->acked_features |= (0x1ULL << VIRTIO_F_VERSION_1);
+    features = hdev->acked_features;
+    r = hdev->vhost_ops->vhost_set_features(hdev, features);
+    if (r < 0) {
+        VHOST_OPS_DEBUG("vhost_set_features failed");
+        return -errno;
+    }
+    return 0;
+}
+
 static int vhost_dev_resize_inflight(struct vhost_inflight *inflight,
                                      uint64_t new_size)
 {
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 1a9fc65089..9ef784e2e9 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -138,6 +138,8 @@ int vhost_dev_get_config(struct vhost_dev *hdev, uint8_t *config,
                          uint32_t config_len, Error **errp);
 int vhost_dev_set_config(struct vhost_dev *dev, const uint8_t *data,
                          uint32_t offset, uint32_t size, uint32_t flags);
+
+int vhost_dev_force_modern(struct vhost_dev *vdev);
 /* notifier callback in case vhost device config space changed
  */
 void vhost_dev_set_config_notifier(struct vhost_dev *dev,
-- 
2.25.1


