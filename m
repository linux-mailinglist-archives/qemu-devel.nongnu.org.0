Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E72E221E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:32:13 +0100 (CET)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBjw-0007Fg-A8
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfl-0002H0-KH
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ksBfj-0004QV-Jh
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608758870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FqdE+1zj6jRvQb1fLqHlnJl/B1cSnTWsyfJMdMV7lio=;
 b=UzLS/TqBq52tGIH8ZUOVix25cI88oanQQj6Ym2qgNHbjAevZdwMcYIVy/K2gyvTLGO/5rg
 /RSDOKueIums93N+zSq+O0SnWOFXXXdxvNdqOzSTZjv+cZo5NsTO0GKwoIwk5y1o6Jom9j
 FGOaeX0joD8FqeD41e1Oirun6/oe+nA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-9smkDhwmMjSI4kTdnyHFSg-1; Wed, 23 Dec 2020 16:27:47 -0500
X-MC-Unique: 9smkDhwmMjSI4kTdnyHFSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B9B7107ACE4;
 Wed, 23 Dec 2020 21:27:46 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44DFB6685F;
 Wed, 23 Dec 2020 21:27:46 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 05/15] qdev: Avoid using prop->name unnecessarily
Date: Wed, 23 Dec 2020 16:27:25 -0500
Message-Id: <20201223212735.512062-6-ehabkost@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already get the property name as argument to the property
getter and setters, we don't need to use prop->name.  This will
make it easier to remove the Property.name field in the future.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201211220529.2290218-20-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties-system.c | 14 +++++++-------
 hw/core/qdev-properties.c        |  4 ++--
 backends/tpm/tpm_util.c          |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 9cf9bcb39d..42529c3b65 100644
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
@@ -966,7 +966,7 @@ static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
         abort();
     }
 
-    visit_type_enum(v, prop->name, &speed, prop->info->enum_table, errp);
+    visit_type_enum(v, name, &speed, prop->info->enum_table, errp);
 }
 
 static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
@@ -982,7 +982,7 @@ static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (!visit_type_enum(v, prop->name, &speed, prop->info->enum_table,
+    if (!visit_type_enum(v, name, &speed, prop->info->enum_table,
                          errp)) {
         return;
     }
@@ -1051,7 +1051,7 @@ static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
         abort();
     }
 
-    visit_type_enum(v, prop->name, &width, prop->info->enum_table, errp);
+    visit_type_enum(v, name, &width, prop->info->enum_table, errp);
 }
 
 static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
@@ -1067,7 +1067,7 @@ static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
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
diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index 3973105658..a5d997e7dc 100644
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
-- 
2.28.0


