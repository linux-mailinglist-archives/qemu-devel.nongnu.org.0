Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B00A2FE9ED
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:25:33 +0100 (CET)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Z1o-0001sM-9T
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l2Ytd-0000Pj-N2
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:17:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l2YtY-0005Zm-PH
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611231420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdC6LQnfMxo9VyGKQn2NnYL6iqSRc2CK+k+VMkjUkJE=;
 b=OdQ3xphUeK3Xc5lbvACR32DVqLWEsspj0zCkzfRlDcTZRamF8ctd7XSJbJXk2B6Ha61ORy
 lk5bXYF56iEv2U/+tj8Nr6nJi+1SA1dAkYhYjGoDewMrSWDw4T0WaGzrokDrViPV5sdly5
 hhgZTj8xNl9oD2uhus3HYvK3msjLZRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-IBcwdJx6OVK0Dq-xpCYGgQ-1; Thu, 21 Jan 2021 07:16:57 -0500
X-MC-Unique: IBcwdJx6OVK0Dq-xpCYGgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40D95107ACE3;
 Thu, 21 Jan 2021 12:16:56 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-94.ams2.redhat.com [10.36.113.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7C3810021B3;
 Thu, 21 Jan 2021 12:16:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 8/9] vfio-ccw: Connect the device request notifier
Date: Thu, 21 Jan 2021 13:16:28 +0100
Message-Id: <20210121121629.530506-9-cohuck@redhat.com>
In-Reply-To: <20210121121629.530506-1-cohuck@redhat.com>
References: <20210121121629.530506-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

Now that the vfio-ccw code has a notifier interface to request that
a device be unplugged, let's wire that together.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210104202057.48048-4-farman@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/vfio/ccw.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index d2755d7fc5ca..bc78a0ad7638 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -49,6 +49,7 @@ struct VFIOCCWDevice {
     struct ccw_crw_region *crw_region;
     EventNotifier io_notifier;
     EventNotifier crw_notifier;
+    EventNotifier req_notifier;
     bool force_orb_pfch;
     bool warned_orb_pfch;
 };
@@ -287,6 +288,21 @@ static void vfio_ccw_crw_read(VFIOCCWDevice *vcdev)
     } while (1);
 }
 
+static void vfio_ccw_req_notifier_handler(void *opaque)
+{
+    VFIOCCWDevice *vcdev = opaque;
+    Error *err = NULL;
+
+    if (!event_notifier_test_and_clear(&vcdev->req_notifier)) {
+        return;
+    }
+
+    qdev_unplug(DEVICE(vcdev), &err);
+    if (err) {
+        warn_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
+    }
+}
+
 static void vfio_ccw_crw_notifier_handler(void *opaque)
 {
     VFIOCCWDevice *vcdev = opaque;
@@ -386,6 +402,10 @@ static void vfio_ccw_register_irq_notifier(VFIOCCWDevice *vcdev,
         notifier = &vcdev->crw_notifier;
         fd_read = vfio_ccw_crw_notifier_handler;
         break;
+    case VFIO_CCW_REQ_IRQ_INDEX:
+        notifier = &vcdev->req_notifier;
+        fd_read = vfio_ccw_req_notifier_handler;
+        break;
     default:
         error_setg(errp, "vfio: Unsupported device irq(%d)", irq);
         return;
@@ -440,6 +460,9 @@ static void vfio_ccw_unregister_irq_notifier(VFIOCCWDevice *vcdev,
     case VFIO_CCW_CRW_IRQ_INDEX:
         notifier = &vcdev->crw_notifier;
         break;
+    case VFIO_CCW_REQ_IRQ_INDEX:
+        notifier = &vcdev->req_notifier;
+        break;
     default:
         error_report("vfio: Unsupported device irq(%d)", irq);
         return;
@@ -661,20 +684,28 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 
     vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX, &err);
     if (err) {
-        goto out_notifier_err;
+        goto out_io_notifier_err;
     }
 
     if (vcdev->crw_region) {
         vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX, &err);
         if (err) {
-            vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
-            goto out_notifier_err;
+            goto out_crw_notifier_err;
         }
     }
 
+    vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX, &err);
+    if (err) {
+        goto out_req_notifier_err;
+    }
+
     return;
 
-out_notifier_err:
+out_req_notifier_err:
+    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
+out_crw_notifier_err:
+    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
+out_io_notifier_err:
     vfio_ccw_put_region(vcdev);
 out_region_err:
     vfio_ccw_put_device(vcdev);
@@ -696,6 +727,7 @@ static void vfio_ccw_unrealize(DeviceState *dev)
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
     VFIOGroup *group = vcdev->vdev.group;
 
+    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX);
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
     vfio_ccw_put_region(vcdev);
-- 
2.26.2


