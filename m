Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAC61E72FF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 05:08:47 +0200 (CEST)
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeVO2-0001Sl-Ct
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 23:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jeVN3-0000Rb-10
 for qemu-devel@nongnu.org; Thu, 28 May 2020 23:07:45 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43415
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jeVN1-0000M8-HQ
 for qemu-devel@nongnu.org; Thu, 28 May 2020 23:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590721661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GQGxQRL+XdgwQl0ERL0r9Elrw53V2oDRBNxdGiipILU=;
 b=KkTYF3SUd7oO/xKS65nk6pktboGZgDR0ykLPoJmraiu48dt8AqU9xdRCy/INE4KzsLOLo9
 ATIwLQCyfsdKEzIIqJl1ASw9RFx+XrUOTQUfLUIpxJt3Fe0fWHYtDrjYkRkIol9iVEPdLe
 bJMjVCuw8RJteIUSAdWXrTYpg079yDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-NMm0_092PGeTMg6p91bFwA-1; Thu, 28 May 2020 23:07:39 -0400
X-MC-Unique: NMm0_092PGeTMg6p91bFwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B2B018A0721
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 03:07:38 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-231.pek2.redhat.com [10.72.13.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A377719D71;
 Fri, 29 May 2020 03:07:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH] virtio-pci: fix queue_enable write
Date: Fri, 29 May 2020 11:07:28 +0800
Message-Id: <20200529030728.7687-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 23:07:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spec said: The driver uses this to selectively prevent the device from
executing requests from this virtqueue. 1 - enabled; 0 - disabled.

Though write 0 to queue_enable is forbidden by the sepc, we should not
assume that the value is 1.

Fix this by ignoring the write value other than 1.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-pci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index d028c17c24..b3558eeaee 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1273,16 +1273,18 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
         virtio_queue_set_vector(vdev, vdev->queue_sel, val);
         break;
     case VIRTIO_PCI_COMMON_Q_ENABLE:
-        virtio_queue_set_num(vdev, vdev->queue_sel,
-                             proxy->vqs[vdev->queue_sel].num);
-        virtio_queue_set_rings(vdev, vdev->queue_sel,
+        if (val == 1) {
+            virtio_queue_set_num(vdev, vdev->queue_sel,
+                                 proxy->vqs[vdev->queue_sel].num);
+            virtio_queue_set_rings(vdev, vdev->queue_sel,
                        ((uint64_t)proxy->vqs[vdev->queue_sel].desc[1]) << 32 |
                        proxy->vqs[vdev->queue_sel].desc[0],
                        ((uint64_t)proxy->vqs[vdev->queue_sel].avail[1]) << 32 |
                        proxy->vqs[vdev->queue_sel].avail[0],
                        ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
                        proxy->vqs[vdev->queue_sel].used[0]);
-        proxy->vqs[vdev->queue_sel].enabled = 1;
+            proxy->vqs[vdev->queue_sel].enabled = 1;
+        }
         break;
     case VIRTIO_PCI_COMMON_Q_DESCLO:
         proxy->vqs[vdev->queue_sel].desc[0] = val;
-- 
2.20.1


