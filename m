Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B92F6F73
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 01:27:51 +0100 (CET)
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Cxz-0004kj-29
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 19:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1l0Cvt-0003RQ-SN
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 19:25:41 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:35044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1l0Cvm-0005NC-Nw
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 19:25:41 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10F0FwnF106090;
 Fri, 15 Jan 2021 00:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=0rzWooZGZcVfaCvt4A/vGn5zKh1ptDjTXTh9PhGdtCM=;
 b=SXEgEjI4ATxiKXhE2QliVs/4khLzJyCuBrUICdRFFKBz2k9zoYKzK9AOVZMDXkOfSRvt
 6YLlXkMVDuZbWaBsqfnjvG6K7u0gJy/9xd0M580BkDqOcmb0zUjEWtj1ghD73srLQoMc
 yPeHyVQzNxAjDmQsr3CQ/YPgZ6B1QxEC4S6efIC4jHkvk1PuqIyUSiFt80tvi/f3ahN1
 8Z2PnnJKCKiZeW0mvvUAY9zrnoax5aa/hnkG0kQXRyDehsbTH+eJwYNoOJsNsr4y0cUj
 97tOuOYKP/VTtptFr/zs9xENGETq7n3iwQ/wa6lMTa3S00LKEo6SWwusQ7AFBKJ9Qoul bQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 360kvkasap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 00:25:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10F0FjlT030246;
 Fri, 15 Jan 2021 00:25:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 360keajr77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 00:25:30 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10F0PTbB008642;
 Fri, 15 Jan 2021 00:25:29 GMT
Received: from localhost.localdomain (/10.211.9.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 16:25:28 -0800
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 2/2] vhost-scsi: implement DeviceEvent
Date: Thu, 14 Jan 2021 16:27:30 -0800
Message-Id: <20210115002730.1279-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115002730.1279-1-dongli.zhang@oracle.com>
References: <20210115002730.1279-1-dongli.zhang@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150000
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=998
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150000
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=dongli.zhang@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, joao.m.martins@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements DeviceEvent for vhost-scsi. As RFC, this patch only
considers the case of eventfd and only for vhost-scsi.

Below are example for HMP and QAPI.

(qemu) device_event /machine/peripheral/vscsi0 kick 1

{ "execute": "x-debug-device-event",
  "arguments": { "dev": "/machine/peripheral/vscsi0",
                 "event": "kick",
                 "queue": 1 } }

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/virtio/vhost-scsi-pci.c | 10 ++++++++++
 hw/virtio/virtio.c         | 19 +++++++++++++++++++
 include/hw/virtio/virtio.h |  3 +++
 3 files changed, 32 insertions(+)

diff --git a/hw/virtio/vhost-scsi-pci.c b/hw/virtio/vhost-scsi-pci.c
index cb71a294fa..0236720868 100644
--- a/hw/virtio/vhost-scsi-pci.c
+++ b/hw/virtio/vhost-scsi-pci.c
@@ -62,12 +62,22 @@ static void vhost_scsi_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
+static void vhost_scsi_pci_event(DeviceState *dev, int event, int queue,
+                                 Error **errp)
+{
+    VHostSCSIPCI *vscsi = VHOST_SCSI_PCI(dev);
+    DeviceState *vdev = DEVICE(&vscsi->vdev);
+
+    virtio_device_event_eventfd(vdev, event, queue, errp);
+}
+
 static void vhost_scsi_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
     PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
     k->realize = vhost_scsi_pci_realize;
+    dc->event = vhost_scsi_pci_event;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     device_class_set_props(dc, vhost_scsi_pci_properties);
     pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b308026596..d9168c4ac8 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3690,6 +3690,25 @@ static void virtio_device_unrealize(DeviceState *dev)
     vdev->bus_name = NULL;
 }
 
+void virtio_device_event_eventfd(DeviceState *dev, int event, int queue,
+                         Error **errp)
+{
+    struct VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    int num = virtio_get_num_queues(vdev);
+
+    if (queue < 0 || queue >= num) {
+        error_setg(errp, "Invalid queue %d", queue);
+        return;
+    }
+
+    VirtQueue *vq = &vdev->vq[queue];
+
+    if (event == DEVICE_EVENT_CALL)
+        event_notifier_set(&vq->guest_notifier);
+    else if (event == DEVICE_EVENT_KICK)
+        event_notifier_set(&vq->host_notifier);
+}
+
 static void virtio_device_free_virtqueues(VirtIODevice *vdev)
 {
     int i;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a6a8..606ebdfb85 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -397,4 +397,7 @@ static inline bool virtio_device_disabled(VirtIODevice *vdev)
 bool virtio_legacy_allowed(VirtIODevice *vdev);
 bool virtio_legacy_check_disabled(VirtIODevice *vdev);
 
+void virtio_device_event_eventfd(DeviceState *dev, int event, int queue,
+                                 Error **errp);
+
 #endif
-- 
2.17.1


