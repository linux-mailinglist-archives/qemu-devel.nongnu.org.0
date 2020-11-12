Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABF82B1105
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:08:29 +0100 (CET)
Received: from localhost ([::1]:32950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKlY-0008H0-T0
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKR9-0008QW-UC
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKR7-0003lp-S6
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jr2c+hFD8dhsPQVQpHdxJpajRfP2ukTaXihihYrX088=;
 b=c2n/MnZ4WtpNpjIo4z3S2Vdt4bZ7WsPQR5vb0TIN5Ab1JngrPIcrSbCngPYoPUp6Jnrq6Z
 Kq+DEHwZwxGxVhYWzaxW+xdRPskVl+N5m0X5HF3Ictm4K2sVFobIOk0KCygWEEOLG1P7R5
 hZ1PiETAR7CzdxxpCpNAZzU6FmKbiFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-UNppuZPkMRWCgPqYSAXcUw-1; Thu, 12 Nov 2020 16:47:17 -0500
X-MC-Unique: UNppuZPkMRWCgPqYSAXcUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA9461006CBB;
 Thu, 12 Nov 2020 21:47:16 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4548860C13;
 Thu, 12 Nov 2020 21:47:13 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 48/53] qom: object_class_property_add_field() function
Date: Thu, 12 Nov 2020 16:43:45 -0500
Message-Id: <20201112214350.872250-49-ehabkost@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is similar to object_class_property_add_field_static(), but
gets a copy of a Property struct so we don't need
static variables.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of this series, but v2 had a
object_class_property_add_field() function too.

This version of object_class_property_add_field() is slightly
different from the one in v2, as it gets a copy of the Property
struct (so it won't require static variables anymore).
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/qom/field-property.h | 23 +++++++++++++++++++++++
 qom/field-property.c         | 14 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/qom/field-property.h b/include/qom/field-property.h
index 419e5eef75..a904f98609 100644
--- a/include/qom/field-property.h
+++ b/include/qom/field-property.h
@@ -83,6 +83,29 @@ struct PropertyInfo {
     ObjectPropertyRelease *release;
 };
 
+/**
+ * object_class_property_add_field: Add a field property to object class
+ * @oc: object class
+ * @name: property name
+ * @prop: property definition
+ * @allow_set: check function called when property is set
+ *
+ * Add a field property to an object class.  A field property is
+ * a property that will change a field at a specific offset of the
+ * object instance struct.
+ *
+ * Note that data pointed by @prop (like strings or pointers to
+ * other structs) are not copied and must have static life time.
+ *
+ * @allow_set should not be NULL.  If the property can always be
+ * set, `prop_allow_set_always` can be used.  If the property can
+ * never be set, `prop_allow_set_never` can be used.
+ */
+ObjectProperty *
+object_class_property_add_field(ObjectClass *oc, const char *name,
+                                Property prop,
+                                ObjectPropertyAllowSet allow_set);
+
 void *object_field_prop_ptr(Object *obj, Property *prop);
 
 #endif
diff --git a/qom/field-property.c b/qom/field-property.c
index 1fd11f2ad3..cb729626ce 100644
--- a/qom/field-property.c
+++ b/qom/field-property.c
@@ -125,6 +125,20 @@ object_class_property_add_field_static(ObjectClass *oc, const char *name,
     return op;
 }
 
+ObjectProperty *
+object_class_property_add_field(ObjectClass *oc, const char *name,
+                                Property prop,
+                                ObjectPropertyAllowSet allow_set)
+{
+    /*
+     * QOM classes and class properties are never deallocated, so we don't
+     * have a corresponding release function that will free newprop.
+     */
+    Property *newprop = g_new0(Property, 1);
+    *newprop = prop;
+    return object_class_property_add_field_static(oc, name, newprop, allow_set);
+}
+
 void object_class_add_field_properties(ObjectClass *oc, Property *props,
                                        ObjectPropertyAllowSet allow_set)
 {
-- 
2.28.0


