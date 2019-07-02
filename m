Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A5B5D38A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 17:52:48 +0200 (CEST)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiL5L-000097-SX
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 11:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58713)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hiKO9-0007FM-Tj
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:08:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hiKO8-0000wc-Pj
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:08:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52134)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hiKO8-0000vL-1f
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:08:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0573E83F51;
 Tue,  2 Jul 2019 15:08:03 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
 by smtp.corp.redhat.com (Postfix) with SMTP id 718651001B18;
 Tue,  2 Jul 2019 15:08:00 +0000 (UTC)
Date: Tue, 2 Jul 2019 11:07:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190626023130.31315-3-xieyongji@baidu.com>
References: <20190702150606.24851-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702150606.24851-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 02 Jul 2019 15:08:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 14/22] virtio: Set "start_on_kick" for legacy
 devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Xie Yongji <xieyongji@baidu.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@baidu.com>

Besides virtio 1.0 transitional devices, we should also
set "start_on_kick" flag for legacy devices (virtio 0.9).

Signed-off-by: Xie Yongji <xieyongji@baidu.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20190626023130.31315-3-xieyongji@baidu.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h | 2 +-
 hw/virtio/virtio.c         | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 15d5366939..b189788cb2 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -107,7 +107,7 @@ struct VirtIODevice
     bool broken; /* device in invalid state, needs reset */
     bool use_started;
     bool started;
-    bool start_on_kick; /* virtio 1.0 transitional devices support that */
+    bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
     VMChangeStateEntry *vmstate;
     char *bus_name;
     uint8_t device_endian;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index c9a6ca04b8..f7504d1395 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1212,8 +1212,7 @@ void virtio_reset(void *opaque)
         k->reset(vdev);
     }
 
-    vdev->start_on_kick = (virtio_host_has_feature(vdev, VIRTIO_F_VERSION_1) &&
-                          !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1));
+    vdev->start_on_kick = !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1);
     vdev->started = false;
     vdev->broken = false;
     vdev->guest_features = 0;
@@ -2325,8 +2324,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
             g_malloc0(sizeof(*vdev->vector_queues) * nvectors);
     }
 
-    vdev->start_on_kick = (virtio_host_has_feature(vdev, VIRTIO_F_VERSION_1) &&
-                          !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1));
+    vdev->start_on_kick = !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1);
     vdev->started = false;
     vdev->device_id = device_id;
     vdev->status = 0;
-- 
MST


