Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324292B10CF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:01:56 +0100 (CET)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKfD-0000k1-2B
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKOy-0005uP-8W
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKOv-0003GY-Ou
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4QElOHDC/35LO7q4B7zn7FLHHICgXF/5toJDsrOlvt4=;
 b=IZ1ojGMETo7BTdeliBuD5KXin08MwjW7SiYoPMTyVGLmz2IFO+aeNbXXvmxn1g5ABB9/nt
 sC5K9Oc6mDk2xkCgxC2cb6IJ/aLBYkUiQzNk9sasU/qYCW6qFUW+7uJaFAg8uauR5rGlcD
 efWuhdtfquy4zWEXb8fuu8fgOlf2FRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-XGcBN1HSMuKPhQBkF01Wtw-1; Thu, 12 Nov 2020 16:45:03 -0500
X-MC-Unique: XGcBN1HSMuKPhQBkF01Wtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4636190A3E1;
 Thu, 12 Nov 2020 21:45:01 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F14E460C13;
 Thu, 12 Nov 2020 21:44:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/53] qdev: Make error_set_from_qdev_prop_error() get
 Object* argument
Date: Thu, 12 Nov 2020 16:43:09 -0500
Message-Id: <20201112214350.872250-13-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the code more generic and not specific to TYPE_DEVICE.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: David Hildenbrand <david@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
---
 include/hw/qdev-properties.h     |  2 +-
 hw/core/qdev-properties-system.c | 10 +++++-----
 hw/core/qdev-properties.c        | 10 +++++-----
 hw/s390x/css.c                   |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

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
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 85dd38db0f..fca1b694ca 100644
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
 
@@ -913,7 +913,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
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


