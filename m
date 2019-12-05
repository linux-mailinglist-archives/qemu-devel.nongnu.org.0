Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7386B114663
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 18:59:09 +0100 (CET)
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icvPA-000377-6Z
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 12:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icvDe-00083W-9n
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:47:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icvDc-0004sq-4i
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:47:14 -0500
Received: from relay.sw.ru ([185.231.240.75]:48370)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1icvDa-0003Vb-7r; Thu, 05 Dec 2019 12:47:12 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1icvD9-00013M-32; Thu, 05 Dec 2019 20:46:43 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 20/21] hw/vfio/ap: drop local_err from vfio_ap_realize
Date: Thu,  5 Dec 2019 20:46:34 +0300
Message-Id: <20191205174635.18758-21-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205174635.18758-1-vsementsov@virtuozzo.com>
References: <20191205174635.18758-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, vsementsov@virtuozzo.com,
 Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, armbru@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No reason for local_err here, use errp directly instead.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/vfio/ap.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index da6a20669d..8fbaa724c2 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -89,14 +89,13 @@ static void vfio_ap_realize(DeviceState *dev, Error **errp)
 {
     int ret;
     char *mdevid;
-    Error *local_err = NULL;
     VFIOGroup *vfio_group;
     APDevice *apdev = AP_DEVICE(dev);
     VFIOAPDevice *vapdev = VFIO_AP_DEVICE(apdev);
 
-    vfio_group = vfio_ap_get_group(vapdev, &local_err);
+    vfio_group = vfio_ap_get_group(vapdev, errp);
     if (!vfio_group) {
-        goto out_err;
+        return;
     }
 
     vapdev->vdev.ops = &vfio_ap_ops;
@@ -113,7 +112,7 @@ static void vfio_ap_realize(DeviceState *dev, Error **errp)
      */
     vapdev->vdev.balloon_allowed = true;
 
-    ret = vfio_get_device(vfio_group, mdevid, &vapdev->vdev, &local_err);
+    ret = vfio_get_device(vfio_group, mdevid, &vapdev->vdev, errp);
     if (ret) {
         goto out_get_dev_err;
     }
@@ -123,8 +122,6 @@ static void vfio_ap_realize(DeviceState *dev, Error **errp)
 out_get_dev_err:
     vfio_ap_put_device(vapdev);
     vfio_put_group(vfio_group);
-out_err:
-    error_propagate(errp, local_err);
 }
 
 static void vfio_ap_unrealize(DeviceState *dev, Error **errp)
-- 
2.21.0


