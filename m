Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C43C1A52
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:05:59 +0200 (CEST)
Received: from localhost ([::1]:49662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aHW-0007EQ-3o
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1a7u-0003Ac-Mz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1a7q-0001r4-Vx
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625774157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUUNacenpIZlJEyGmdObkLlThuzT36HxrtqCf/9iJfQ=;
 b=Brw7qjGqay4IXFROSqp7bZ7uGNQ0KqaOcOFnub8/BnOj+WAT8ERxpF47imjiIGtLxeZD4Q
 THSpqPXrXYD0/p0zStqvpAikwJ4Pbj1UMEGJXpJBegyK4stPKAA48ecI4Gyal+x7ZSDxtf
 ztsQy61+txNQBw2A489abX8sMdMONxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-KoBFUgiZMnq4aenujtPkYg-1; Thu, 08 Jul 2021 15:55:56 -0400
X-MC-Unique: KoBFUgiZMnq4aenujtPkYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F129802E62;
 Thu,  8 Jul 2021 19:55:54 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B46E5D6B1;
 Thu,  8 Jul 2021 19:55:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 01/15] vmbus: Don't make QOM property registration
 conditional
Date: Thu,  8 Jul 2021 15:55:38 -0400
Message-Id: <20210708195552.2730970-2-ehabkost@redhat.com>
In-Reply-To: <20210708195552.2730970-1-ehabkost@redhat.com>
References: <20210708195552.2730970-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having properties registered conditionally makes QOM type
introspection difficult.  Instead of skipping registration of the
"instanceid" property, always register the property but validate
its value against the instance id required by the class.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Acked-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Message-Id: <20201009200701.1830060-1-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/hyperv/vmbus.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 984caf898dc..c9887d5a7bc 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -2372,6 +2372,14 @@ static void vmbus_dev_realize(DeviceState *dev, Error **errp)
 
     assert(!qemu_uuid_is_null(&vdev->instanceid));
 
+    if (!qemu_uuid_is_null(&vdc->instanceid)) {
+        /* Class wants to only have a single instance with a fixed UUID */
+        if (!qemu_uuid_is_equal(&vdev->instanceid, &vdc->instanceid)) {
+            error_setg(&err, "instance id can't be changed");
+            goto error_out;
+        }
+    }
+
     /* Check for instance id collision for this class id */
     QTAILQ_FOREACH(child, &BUS(vmbus)->children, sibling) {
         VMBusDevice *child_dev = VMBUS_DEVICE(child->child);
@@ -2438,18 +2446,22 @@ static void vmbus_dev_unrealize(DeviceState *dev)
     free_channels(vdev);
 }
 
+static Property vmbus_dev_props[] = {
+    DEFINE_PROP_UUID("instanceid", VMBusDevice, instanceid),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+
 static void vmbus_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *kdev = DEVICE_CLASS(klass);
+    device_class_set_props(kdev, vmbus_dev_props);
     kdev->bus_type = TYPE_VMBUS;
     kdev->realize = vmbus_dev_realize;
     kdev->unrealize = vmbus_dev_unrealize;
     kdev->reset = vmbus_dev_reset;
 }
 
-static Property vmbus_dev_instanceid =
-                        DEFINE_PROP_UUID("instanceid", VMBusDevice, instanceid);
-
 static void vmbus_dev_instance_init(Object *obj)
 {
     VMBusDevice *vdev = VMBUS_DEVICE(obj);
@@ -2458,8 +2470,6 @@ static void vmbus_dev_instance_init(Object *obj)
     if (!qemu_uuid_is_null(&vdc->instanceid)) {
         /* Class wants to only have a single instance with a fixed UUID */
         vdev->instanceid = vdc->instanceid;
-    } else {
-        qdev_property_add_static(DEVICE(vdev), &vmbus_dev_instanceid);
     }
 }
 
-- 
2.31.1


