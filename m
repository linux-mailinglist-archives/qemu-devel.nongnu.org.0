Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEF85D2D2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 17:27:37 +0200 (CEST)
Received: from localhost ([::1]:54482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiKgy-00018u-Q8
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 11:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58763)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hiKOM-0007Js-7T
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:08:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hiKOF-00011i-LU
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:08:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56388)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hiKOD-0000zb-M7
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:08:15 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3FA2AC18B2E0;
 Tue,  2 Jul 2019 15:08:12 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
 by smtp.corp.redhat.com (Postfix) with SMTP id 17A7B7DF57;
 Tue,  2 Jul 2019 15:08:10 +0000 (UTC)
Date: Tue, 2 Jul 2019 11:08:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190626023130.31315-6-xieyongji@baidu.com>
References: <20190702150606.24851-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702150606.24851-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 02 Jul 2019 15:08:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 17/22] virtio: Don't change "started" flag on
 virtio_vmstate_change()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Xie Yongji <xieyongji@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@baidu.com>

We will call virtio_set_status() on virtio_vmstate_change().
The "started" flag should not be changed in this case. Otherwise,
we may get an incorrect value when we set "started" flag but
not set DRIVER_OK in source VM.

Signed-off-by: Xie Yongji <xieyongji@baidu.com>
Message-Id: <20190626023130.31315-6-xieyongji@baidu.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e098fc8ef0..18f9f4c372 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1163,7 +1163,10 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
         }
     }
 
-    virtio_set_started(vdev, val & VIRTIO_CONFIG_S_DRIVER_OK);
+    if ((vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) !=
+        (val & VIRTIO_CONFIG_S_DRIVER_OK)) {
+        virtio_set_started(vdev, val & VIRTIO_CONFIG_S_DRIVER_OK);
+    }
 
     if (k->set_status) {
         k->set_status(vdev, val);
-- 
MST


