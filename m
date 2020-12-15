Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02D92DAFF3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:23:26 +0100 (CET)
Received: from localhost ([::1]:60666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCAf-0001W5-VO
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8b-00086g-Rb
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8a-0002NF-0n
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ubmo7QalFiuPlabdKIk4lgcDivKpb/Tg0glQucawe8o=;
 b=JKRCPlg0eDuyZLDGKY+ZnnPwRdGYeSVfWzZhXMAqVIUWk37a7h9raGMOMs7eGT6tjwy1L2
 i/oBi8z5dVXgrtYmtUN9te8badR9mDgV0wvK+BmIGTc8XMZEyKHXk29PadkLmv1q1Sic7M
 a4W9CGyszn+dvfcxTruL+ew3LJOwhaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-JOlS6-YYNvq8SAZck3vWNA-1; Tue, 15 Dec 2020 10:21:12 -0500
X-MC-Unique: JOlS6-YYNvq8SAZck3vWNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 284D31005504;
 Tue, 15 Dec 2020 15:20:38 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22D1D1865D;
 Tue, 15 Dec 2020 15:20:33 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 22/25] qdev: Make error_set_from_qdev_prop_error() get Object*
 argument
Date: Tue, 15 Dec 2020 10:19:39 -0500
Message-Id: <20201215151942.3125089-23-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the code more generic and not specific to TYPE_DEVICE.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com> #s390 parts
Message-Id: <20201211220529.2290218-13-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties-system.c | 10 +++++-----
 hw/core/qdev-properties.c        | 10 +++++-----
 include/hw/qdev-properties.h     |  2 +-
 hw/s390x/css.c                   |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 58bb129bbe..5796ed2619 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -352,7 +352,7 @@ static void set_mac(Object *obj, Visitor *v, const char *name, void *opaque,
     return;
 
 inval:
-    error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
+    error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
     g_free(str);
 }
 
@@ -440,7 +440,7 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
     peers_ptr->queues = queues;
 
 out:
-    error_set_from_qdev_prop_error(errp, err, dev, prop, str);
+    error_set_from_qdev_prop_error(errp, err, obj, prop, str);
     g_free(str);
 }
 
@@ -492,7 +492,7 @@ static void set_audiodev(Object *obj, Visitor *v, const char* name,
     card->state = state;
 
 out:
-    error_set_from_qdev_prop_error(errp, err, dev, prop, str);
+    error_set_from_qdev_prop_error(errp, err, obj, prop, str);
     g_free(str);
 }
 
@@ -790,7 +790,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
     return;
 
 invalid:
-    error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
+    error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
     g_free(str);
 }
 
@@ -914,7 +914,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     return;
 
 inval:
-    error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
+    error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
     g_free(str);
 }
 
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 41482d83d1..5e010afdb8 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -581,7 +581,7 @@ static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
     if (!strcmp(str, UUID_VALUE_AUTO)) {
         qemu_uuid_generate(uuid);
     } else if (qemu_uuid_parse(str, uuid) < 0) {
-        error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
+        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
     }
     g_free(str);
 }
@@ -735,22 +735,22 @@ static Property *qdev_prop_find(DeviceState *dev, const char *name)
     return NULL;
 }
 
-void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *dev,
+void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
                                     Property *prop, const char *value)
 {
     switch (ret) {
     case -EEXIST:
         error_setg(errp, "Property '%s.%s' can't take value '%s', it's in use",
-                  object_get_typename(OBJECT(dev)), prop->name, value);
+                  object_get_typename(obj), prop->name, value);
         break;
     default:
     case -EINVAL:
         error_setg(errp, QERR_PROPERTY_VALUE_BAD,
-                   object_get_typename(OBJECT(dev)), prop->name, value);
+                   object_get_typename(obj), prop->name, value);
         break;
     case -ENOENT:
         error_setg(errp, "Property '%s.%s' can't find value '%s'",
-                  object_get_typename(OBJECT(dev)), prop->name, value);
+                  object_get_typename(obj), prop->name, value);
         break;
     case 0:
         break;
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 7620095fed..530286e869 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -309,7 +309,7 @@ const GlobalProperty *qdev_find_global_prop(Object *obj,
                                             const char *name);
 int qdev_prop_check_globals(void);
 void qdev_prop_set_globals(DeviceState *dev);
-void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *dev,
+void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
                                     Property *prop, const char *value);
 
 /**
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 2b8f33fec2..38fd46b9a9 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -2390,7 +2390,7 @@ static void set_css_devid(Object *obj, Visitor *v, const char *name,
 
     num = sscanf(str, "%2x.%1x%n.%4x%n", &cssid, &ssid, &n1, &devid, &n2);
     if (num != 3 || (n2 - n1) != 5 || strlen(str) != n2) {
-        error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
+        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
         goto out;
     }
     if ((cssid > MAX_CSSID) || (ssid > MAX_SSID)) {
-- 
2.28.0


