Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1EC38B4FE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:13:32 +0200 (CEST)
Received: from localhost ([::1]:42600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmEm-0007BO-1V
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm7S-0001qi-VQ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm7G-0005eG-OA
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621530345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CwF66TUVdEU4N2CNWmzN4Yai6fiOemufiFhmdTLXm+E=;
 b=fyy73p6tU2+l3xkoV52/UUumngt2alv7F9HlvC2X7Mpu3+VWqkyJ3oekg3KugP6TCH6NzG
 TiYOaQwD7UdvrDZXMxCpF8RC2guduJEWOeojdpTkTli5CaF79wC1kn+ncuo8/xIXEIUGPD
 32UEAQo3DnoiUwDKNRdUe1N+7fjRXj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-i4iBpDDpMo6IBNK_whmn3A-1; Thu, 20 May 2021 13:05:42 -0400
X-MC-Unique: i4iBpDDpMo6IBNK_whmn3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9A20107ACCD;
 Thu, 20 May 2021 17:05:40 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EE3F5D6D5;
 Thu, 20 May 2021 17:05:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 7/9] vfio-ccw: Attempt to clean up all IRQs on error
Date: Thu, 20 May 2021 19:05:17 +0200
Message-Id: <20210520170519.300951-8-cohuck@redhat.com>
In-Reply-To: <20210520170519.300951-1-cohuck@redhat.com>
References: <20210520170519.300951-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

The vfio_ccw_unrealize() routine makes an unconditional attempt to
unregister every IRQ notifier, though they may not have been registered
in the first place (when running on an older kernel, for example).

Let's mirror this behavior in the error cleanups in vfio_ccw_realize()
so that if/when new IRQs are added, it is less confusing to recognize
the necessary procedures. The worst case scenario would be some extra
messages about an undefined IRQ, but since this is an error exit that
won't be the only thing to worry about.

And regarding those messages, let's change it to a warning instead of
an error, to better reflect their severity. The existing code in both
paths handles everything anyway.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Acked-by: Matthew Rosato <mjrosato@linux.ibm.com>
Message-Id: <20210428143652.1571487-1-farman@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/vfio/ccw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 7c058d13e8ce..139a3d9d1b95 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -469,7 +469,7 @@ static void vfio_ccw_unregister_irq_notifier(VFIOCCWDevice *vcdev,
 
     if (vfio_set_irq_signaling(&vcdev->vdev, irq, 0,
                                VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err)) {
-        error_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
+        warn_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
     }
 
     qemu_set_fd_handler(event_notifier_get_fd(notifier),
@@ -689,7 +689,7 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
     if (vcdev->crw_region) {
         vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX, &err);
         if (err) {
-            goto out_crw_notifier_err;
+            goto out_irq_notifier_err;
         }
     }
 
@@ -704,7 +704,9 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 
     return;
 
-out_crw_notifier_err:
+out_irq_notifier_err:
+    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX);
+    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
 out_io_notifier_err:
     vfio_ccw_put_region(vcdev);
-- 
2.31.1


