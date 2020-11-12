Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD382B1149
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:20:07 +0100 (CET)
Received: from localhost ([::1]:33218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKwo-0003fE-8C
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQo-0007ue-1r
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQd-0003fa-43
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WmVTi9i6vnaHfYJW3cEaYH3q9RAFuZxzXrcPplStXc=;
 b=PVh00+1UeK+22W+4Ag5FeFFikAOrcw7L0ZLvsl5T8UQQtM6RgvXjtmsfPdF2CHBDQkROsK
 MaYqnJl1euxPYPVGvoAH2k9utaQIp80wvRnho9pOtehefH/zABvD4UzR7o3tk1fZ5+xFY9
 Ln07lLloymVMV38i8zJBoR81aqfDgew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-Aabk5qYGOUafGwFWIsXe1Q-1; Thu, 12 Nov 2020 16:46:45 -0500
X-MC-Unique: Aabk5qYGOUafGwFWIsXe1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3900190A3E0;
 Thu, 12 Nov 2020 21:46:43 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 923A96EF56;
 Thu, 12 Nov 2020 21:46:43 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 39/53] qdev: Get rid of ArrayElementProperty struct
Date: Thu, 12 Nov 2020 16:43:36 -0500
Message-Id: <20201112214350.872250-40-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we don't store any additional data about the property in
AraryElementStruct, we don't need it anymore.  We can just
allocate a Property struct directly.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Change v1 -> v2:
* Get rid of the struct, but not of the release function (we
  still need it, or we will leak the Property struct we allocate)
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-properties.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 9f60f3b44d..0ffef5ab4f 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -521,27 +521,17 @@ const PropertyInfo prop_info_size32 = {
 
 /* --- support for array properties --- */
 
-/* Used as an opaque for the object properties we add for each
- * array element. Note that the struct Property must be first
- * in the struct so that a pointer to this works as the opaque
- * for the underlying element's property hooks as well as for
- * our own release callback.
- */
-typedef struct {
-    struct Property prop;
-} ArrayElementProperty;
-
 /* object property release callback for array element properties:
  * we call the underlying element's property release hook, and
  * then free the memory we allocated when we added the property.
  */
 static void array_element_release(Object *obj, const char *name, void *opaque)
 {
-    ArrayElementProperty *p = opaque;
-    if (p->prop.info->release) {
-        p->prop.info->release(obj, name, opaque);
+    Property *prop = opaque;
+    if (prop->info->release) {
+        prop->info->release(obj, name, opaque);
     }
-    g_free(p);
+    g_free(prop);
 }
 
 static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
@@ -585,20 +575,20 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
     *arrayptr = eltptr = g_malloc0(*alenptr * prop->arrayfieldsize);
     for (i = 0; i < *alenptr; i++, eltptr += prop->arrayfieldsize) {
         g_autofree char *propname = g_strdup_printf("%s[%d]", arrayname, i);
-        ArrayElementProperty *arrayprop = g_new0(ArrayElementProperty, 1);
+        Property *arrayprop = g_new0(Property, 1);
         ObjectProperty *elmop;
-        arrayprop->prop.info = prop->arrayinfo;
+        arrayprop->info = prop->arrayinfo;
         /* This ugly piece of pointer arithmetic sets up the offset so
          * that when the underlying get/set hooks call qdev_get_prop_ptr
          * they get the right answer despite the array element not actually
          * being inside the device struct.
          */
-        arrayprop->prop.offset = eltptr - (void *)obj;
-        assert(object_field_prop_ptr(obj, &arrayprop->prop) == eltptr);
+        arrayprop->offset = eltptr - (void *)obj;
+        assert(object_field_prop_ptr(obj, arrayprop) == eltptr);
         elmop = object_property_add(obj, propname,
-                                    arrayprop->prop.info->name,
-                                    field_prop_getter(arrayprop->prop.info),
-                                    field_prop_setter(arrayprop->prop.info),
+                                    arrayprop->info->name,
+                                    field_prop_getter(arrayprop->info),
+                                    field_prop_setter(arrayprop->info),
                                     array_element_release,
                                     arrayprop);
         elmop->allow_set = op->allow_set;
-- 
2.28.0


