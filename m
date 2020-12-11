Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19C82D81F7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:25:56 +0100 (CET)
Received: from localhost ([::1]:39226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knqrL-0007Qh-Tj
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqZ2-0002Nd-PE
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:07:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqYv-0006Yg-7V
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607724406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mauuiBzwc4imnwBuzDLwKVVcVa+v3UBaGy4quUlinA=;
 b=XvSADjZLoOASdLGxTBuI4veiXnwhrKm4x2hPJcfEp3eUMWPSc4rhmdwB7HBdKwLsAUYI6E
 w0kylAt/rE5iUO5ZdF0xHdHUjVfP7Zpt9Fj4VW0QH2lXKpt6jxelRMWok3o9uVT0onn00L
 bDEt3GTjH5ubdSDU5tJsSJnd83h6dUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-MJbOsA0LPw2-P_GgyAd-dw-1; Fri, 11 Dec 2020 17:06:45 -0500
X-MC-Unique: MJbOsA0LPw2-P_GgyAd-dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CFB19251A3;
 Fri, 11 Dec 2020 22:06:43 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453EF100AE31;
 Fri, 11 Dec 2020 22:06:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/32] qdev: Get just property name at
 error_set_from_qdev_prop_error()
Date: Fri, 11 Dec 2020 17:05:15 -0500
Message-Id: <20201211220529.2290218-19-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-1-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace `Property *prop` parameter with `char *name`, to reduce
dependency of getter and setter functions on the Property struct
(which will be changed in following patches).

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in series v2
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
---
 include/hw/qdev-properties.h     |  2 +-
 hw/core/qdev-properties-system.c | 12 ++++++------
 hw/core/qdev-properties.c        |  8 ++++----
 hw/s390x/css.c                   |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 1b58e4f922..476737b9da 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -201,7 +201,7 @@ const GlobalProperty *qdev_find_global_prop(Object *obj,
 int qdev_prop_check_globals(void);
 void qdev_prop_set_globals(DeviceState *dev);
 void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
-                                    Property *prop, const char *value);
+                                    const char *name, const char *value);
 
 /**
  * qdev_property_add_static:
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index e2d523b27a..9cf9bcb39d 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -354,7 +354,7 @@ static void set_mac(Object *obj, Visitor *v, const char *name, void *opaque,
     return;
 
 inval:
-    error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
+    error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
     g_free(str);
 }
 
@@ -442,7 +442,7 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
     peers_ptr->queues = queues;
 
 out:
-    error_set_from_qdev_prop_error(errp, err, obj, prop, str);
+    error_set_from_qdev_prop_error(errp, err, obj, name, str);
     g_free(str);
 }
 
@@ -494,7 +494,7 @@ static void set_audiodev(Object *obj, Visitor *v, const char* name,
     card->state = state;
 
 out:
-    error_set_from_qdev_prop_error(errp, err, obj, prop, str);
+    error_set_from_qdev_prop_error(errp, err, obj, name, str);
     g_free(str);
 }
 
@@ -792,7 +792,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
     return;
 
 invalid:
-    error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
+    error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
     g_free(str);
 }
 
@@ -916,7 +916,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     return;
 
 inval:
-    error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
+    error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
     g_free(str);
 }
 
@@ -1146,7 +1146,7 @@ static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
     if (!strcmp(str, UUID_VALUE_AUTO)) {
         qemu_uuid_generate(uuid);
     } else if (qemu_uuid_parse(str, uuid) < 0) {
-        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
+        error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
     }
     g_free(str);
 }
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index a2eaa43831..7495798a66 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -679,21 +679,21 @@ static Property *qdev_prop_find(DeviceState *dev, const char *name)
 }
 
 void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
-                                    Property *prop, const char *value)
+                                    const char *name, const char *value)
 {
     switch (ret) {
     case -EEXIST:
         error_setg(errp, "Property '%s.%s' can't take value '%s', it's in use",
-                  object_get_typename(obj), prop->name, value);
+                  object_get_typename(obj), name, value);
         break;
     default:
     case -EINVAL:
         error_setg(errp, QERR_PROPERTY_VALUE_BAD,
-                   object_get_typename(obj), prop->name, value);
+                   object_get_typename(obj), name, value);
         break;
     case -ENOENT:
         error_setg(errp, "Property '%s.%s' can't find value '%s'",
-                  object_get_typename(obj), prop->name, value);
+                  object_get_typename(obj), name, value);
         break;
     case 0:
         break;
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 38fd46b9a9..7a44320d12 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -2390,7 +2390,7 @@ static void set_css_devid(Object *obj, Visitor *v, const char *name,
 
     num = sscanf(str, "%2x.%1x%n.%4x%n", &cssid, &ssid, &n1, &devid, &n2);
     if (num != 3 || (n2 - n1) != 5 || strlen(str) != n2) {
-        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
+        error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
         goto out;
     }
     if ((cssid > MAX_CSSID) || (ssid > MAX_SSID)) {
-- 
2.28.0


