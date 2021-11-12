Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A0644E983
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:05:40 +0100 (CET)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlY7Y-0001oq-05
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:05:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlY0b-0000L2-HH; Fri, 12 Nov 2021 09:58:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45102
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlY0Y-0005kT-Mm; Fri, 12 Nov 2021 09:58:28 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ACEuoP3000371; 
 Fri, 12 Nov 2021 14:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BApSWuuELc5pXk11TJVOLAF4aE5FMNPYwv9VI8IWetA=;
 b=EggA1uxULeQGzgClMsgyR92eTW49gn/U8ZgOgkfiVr4D7LulPpM7TAqbDqCNkZhxXEES
 +tKI7drgtVwJrwrvYEdNXJ6t1N2S+sp1nErCEt77wK/4lhIIIXC73qHnh+Q7FZr29Uhi
 ebLT2Yz4h6ArbiJEgK+BtV7EoYVRge+weapS/b3CjemqGFoLTIvSqTzaNbXTvWz35Chs
 iRCUkaQgFSV22zO1pf1DI4CKL06IxVT8FeTiZqgck48uFOkbarkQLXyns4940Xju5G3g
 deTBCztFrW0oszmmJhSeyJ6D9or5JXPVhF4HIm+gH2QvtxT3O84aXk2qFh6UVIwMTnVV rA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c9r2sumpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:18 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ACEjWov007876;
 Fri, 12 Nov 2021 14:58:18 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c9r2sump9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:17 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ACErLhI003230;
 Fri, 12 Nov 2021 14:58:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3c9t6sr4hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:15 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ACEwCpE63045916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Nov 2021 14:58:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05E1FA405B;
 Fri, 12 Nov 2021 14:58:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2024A4064;
 Fri, 12 Nov 2021 14:58:11 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Nov 2021 14:58:11 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v2 5/5] virtio-net: handle force_modern for vhost
Date: Fri, 12 Nov 2021 15:57:49 +0100
Message-Id: <20211112145749.618157-6-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112145749.618157-1-pasic@linux.ibm.com>
References: <20211112145749.618157-1-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uvetPgwJ94QG_H275d_vjrcMM5vA20A3
X-Proofpoint-ORIG-GUID: JeJfQqpRqHmCFB-n8r00WM618Tfopzna
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_05,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111120083
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
---

Inspired by virtio_net_set_features() which I don't quite understand.
Why do we have to do vhost_net_ack_features() for each possible queue?
---
 hw/net/virtio-net.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f205331dcf..43ed9ef3ba 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -766,6 +766,25 @@ static uint64_t virtio_net_bad_features(VirtIODevice *vdev)
     return features;
 }
 
+static void  virtio_net_force_modern(VirtIODevice *vdev)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    int i;
+
+    /*
+     * Why do we have to loop over all queues? Are not features a
+     * per-device thing?
+     */
+    for (i = 0;  i < n->max_queues; i++) {
+        NetClientState *nc = qemu_get_subqueue(n->nic, i);
+
+        if (!get_vhost_net(nc->peer)) {
+            continue;
+        }
+        vhost_dev_force_modern(&get_vhost_net(nc->peer)->dev);
+    }
+}
+
 static void virtio_net_apply_guest_offloads(VirtIONet *n)
 {
     qemu_set_offload(qemu_get_queue(n->nic)->peer,
@@ -3668,6 +3687,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->get_features = virtio_net_get_features;
     vdc->set_features = virtio_net_set_features;
     vdc->bad_features = virtio_net_bad_features;
+    vdc->force_modern = virtio_net_force_modern;
     vdc->reset = virtio_net_reset;
     vdc->set_status = virtio_net_set_status;
     vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
-- 
2.25.1


