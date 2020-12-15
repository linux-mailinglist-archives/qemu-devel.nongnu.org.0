Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158C42DAFF0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:23:20 +0100 (CET)
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCAZ-0001O9-1L
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8Y-00083F-TE
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8V-0002Lk-Tt
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fE6tkeHYUwGg5/xiwY7+S/kM0qBpnrAu27vtqYeUnU=;
 b=db4EtSJA8qni0RsETacQx7XUK58Gltu6ajw0IjNmq6ykeN/USaC663lKDxtziMkkkWJR3n
 AhjYPsCJvaSofLcW3q7TVxhrQj1yQfJgI0P7maGIdCq7rQkjpRnHdyttP+GUxGkqOingEO
 mzMhwggqYslEwQF7+UlTPN8la8LCDi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-rLIJwwnGNuS0ja4VcidPOg-1; Tue, 15 Dec 2020 10:21:07 -0500
X-MC-Unique: rLIJwwnGNuS0ja4VcidPOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8829881C464;
 Tue, 15 Dec 2020 15:19:48 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D2C45D9D7;
 Tue, 15 Dec 2020 15:19:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/25] tmp421: Register properties as class properties
Date: Tue, 15 Dec 2020 10:19:20 -0500
Message-Id: <20201215151942.3125089-4-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201111183823.283752-4-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/misc/tmp421.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index ef3c682e32..a3db57dcb5 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -337,22 +337,6 @@ static void tmp421_realize(DeviceState *dev, Error **errp)
     tmp421_reset(&s->i2c);
 }
 
-static void tmp421_initfn(Object *obj)
-{
-    object_property_add(obj, "temperature0", "int",
-                        tmp421_get_temperature,
-                        tmp421_set_temperature, NULL, NULL);
-    object_property_add(obj, "temperature1", "int",
-                        tmp421_get_temperature,
-                        tmp421_set_temperature, NULL, NULL);
-    object_property_add(obj, "temperature2", "int",
-                        tmp421_get_temperature,
-                        tmp421_set_temperature, NULL, NULL);
-    object_property_add(obj, "temperature3", "int",
-                        tmp421_get_temperature,
-                        tmp421_set_temperature, NULL, NULL);
-}
-
 static void tmp421_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -365,6 +349,19 @@ static void tmp421_class_init(ObjectClass *klass, void *data)
     k->send = tmp421_tx;
     dc->vmsd = &vmstate_tmp421;
     sc->dev = (DeviceInfo *) data;
+
+    object_class_property_add(klass, "temperature0", "int",
+                              tmp421_get_temperature,
+                              tmp421_set_temperature, NULL, NULL);
+    object_class_property_add(klass, "temperature1", "int",
+                              tmp421_get_temperature,
+                              tmp421_set_temperature, NULL, NULL);
+    object_class_property_add(klass, "temperature2", "int",
+                              tmp421_get_temperature,
+                              tmp421_set_temperature, NULL, NULL);
+    object_class_property_add(klass, "temperature3", "int",
+                              tmp421_get_temperature,
+                              tmp421_set_temperature, NULL, NULL);
 }
 
 static const TypeInfo tmp421_info = {
@@ -372,7 +369,6 @@ static const TypeInfo tmp421_info = {
     .parent        = TYPE_I2C_SLAVE,
     .instance_size = sizeof(TMP421State),
     .class_size    = sizeof(TMP421Class),
-    .instance_init = tmp421_initfn,
     .abstract      = true,
 };
 
-- 
2.28.0


