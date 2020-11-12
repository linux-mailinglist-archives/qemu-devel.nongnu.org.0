Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC252B111A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:11:30 +0100 (CET)
Received: from localhost ([::1]:40610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKoT-00037A-4p
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKPO-0006FB-5Y
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKPL-0003R2-SH
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/SQLTuPjEMWYqy7TZdUNWsNX6yogYSzymEF07xNEY4=;
 b=i7DLYtVJh/W+8wS+hNGZBYw2WqaoEvNqfYytmHHMHorxMDRAxiRhTlXEEkI7Wzc12JlH5W
 0OTCmxz8E4yejq8IaVd3FrAYzwrGer28ayaP8Y655yinoMHkxcZ2MujTjIjMG/CRqUfDnr
 6tM3BCiNJQWU/OZ2ZNP17H1u1P4OcM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-G6dFlsTJPDyOIzWSs8zhqg-1; Thu, 12 Nov 2020 16:45:29 -0500
X-MC-Unique: G6dFlsTJPDyOIzWSs8zhqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A8FC803F41;
 Thu, 12 Nov 2020 21:45:28 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E67991002382;
 Thu, 12 Nov 2020 21:45:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/53] qdev: Avoid using prop->name unnecessarily
Date: Thu, 12 Nov 2020 16:43:16 -0500
Message-Id: <20201112214350.872250-20-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already get the property name as argument to the property
getter and setters, we don't need to use prop->name.  This will
make it easier to remove the Property.name field in the future.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in series v2
---
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 backends/tpm/tpm_util.c          |  2 +-
 hw/core/qdev-properties-system.c | 14 +++++++-------
 hw/core/qdev-properties.c        |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index e91c21dd4a..dba2f6b04a 100644
--- a/backends/tpm/tpm_util.c
+++ b/backends/tpm/tpm_util.c
@@ -63,7 +63,7 @@ static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
     s = qemu_find_tpm_be(str);
     if (s == NULL) {
         error_setg(errp, "Property '%s.%s' can't find value '%s'",
-                   object_get_typename(obj), prop->name, str);
+                   object_get_typename(obj), name, str);
     } else if (tpm_backend_init(s, TPM_IF(obj), errp) == 0) {
         *be = s; /* weak reference, avoid cyclic ref */
     }
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 808e7136a0..202abd0e4b 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -141,7 +141,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
     }
     if (!blk) {
         error_setg(errp, "Property '%s.%s' can't find value '%s'",
-                   object_get_typename(OBJECT(dev)), prop->name, str);
+                   object_get_typename(OBJECT(dev)), name, str);
         goto fail;
     }
     if (blk_attach_dev(blk, dev) < 0) {
@@ -262,10 +262,10 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
     s = qemu_chr_find(str);
     if (s == NULL) {
         error_setg(errp, "Property '%s.%s' can't find value '%s'",
-                   object_get_typename(obj), prop->name, str);
+                   object_get_typename(obj), name, str);
     } else if (!qemu_chr_fe_init(be, s, errp)) {
         error_prepend(errp, "Property '%s.%s' can't take value '%s': ",
-                      object_get_typename(obj), prop->name, str);
+                      object_get_typename(obj), name, str);
     }
     g_free(str);
 }
@@ -965,7 +965,7 @@ static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
         abort();
     }
 
-    visit_type_enum(v, prop->name, &speed, prop->info->enum_table, errp);
+    visit_type_enum(v, name, &speed, prop->info->enum_table, errp);
 }
 
 static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
@@ -981,7 +981,7 @@ static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (!visit_type_enum(v, prop->name, &speed, prop->info->enum_table,
+    if (!visit_type_enum(v, name, &speed, prop->info->enum_table,
                          errp)) {
         return;
     }
@@ -1050,7 +1050,7 @@ static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
         abort();
     }
 
-    visit_type_enum(v, prop->name, &width, prop->info->enum_table, errp);
+    visit_type_enum(v, name, &width, prop->info->enum_table, errp);
 }
 
 static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
@@ -1066,7 +1066,7 @@ static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (!visit_type_enum(v, prop->name, &width, prop->info->enum_table,
+    if (!visit_type_enum(v, name, &width, prop->info->enum_table,
                          errp)) {
         return;
     }
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 7495798a66..50734a1cd4 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -50,7 +50,7 @@ void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
     Property *prop = opaque;
     int *ptr = qdev_get_prop_ptr(obj, prop);
 
-    visit_type_enum(v, prop->name, ptr, prop->info->enum_table, errp);
+    visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
 }
 
 void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
@@ -65,7 +65,7 @@ void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    visit_type_enum(v, prop->name, ptr, prop->info->enum_table, errp);
+    visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
 }
 
 void qdev_propinfo_set_default_value_enum(ObjectProperty *op,
-- 
2.28.0


