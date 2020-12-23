Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BB02E2229
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:38:30 +0100 (CET)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBq1-00051A-GP
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfj-0002D3-M5
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfh-0004Pd-RR
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608758869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1xJhqSXmZR0rZ1iGinBr8C3AClnvRHCONxDcDvw+vQ=;
 b=XFR3gzfHPAl2Quoag6gJMXS3Jfe6fuEPQIuCuoe+vCrPYDfbqnf03qAUie+DUp9MFd2fUh
 mPKjBAp+yEe+KJYdu/yv4/rqnd5jHgw/sxC1qU3Tp+ifAMdf6FC4EivGcbJ/ZP8AKfmrrZ
 /eO/kudnzgezqCep0XN6F5tFF9IqtDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-bssoEPUmOdO2EVl9Xq7QRw-1; Wed, 23 Dec 2020 16:27:46 -0500
X-MC-Unique: bssoEPUmOdO2EVl9Xq7QRw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90195800D53;
 Wed, 23 Dec 2020 21:27:45 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99B4863747;
 Wed, 23 Dec 2020 21:27:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 04/15] qdev: Get just property name at
 error_set_from_qdev_prop_error()
Date: Wed, 23 Dec 2020 16:27:24 -0500
Message-Id: <20201223212735.512062-5-ehabkost@redhat.com>
In-Reply-To: <20201223212735.512062-1-ehabkost@redhat.com>
References: <20201223212735.512062-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace `Property *prop` parameter with `char *name`, to reduce
dependency of getter and setter functions on the Property struct
(which will be changed in following patches).

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20201211220529.2290218-19-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties-system.c | 12 ++++++------
 hw/core/qdev-properties.c        |  8 ++++----
 include/hw/qdev-properties.h     |  2 +-
 hw/s390x/css.c                   |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

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


