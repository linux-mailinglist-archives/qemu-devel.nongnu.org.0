Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048952B110E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:10:11 +0100 (CET)
Received: from localhost ([::1]:37646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKnC-0001se-1e
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQL-0007ZT-NL
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQJ-0003ds-Rl
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9SbFl2yOXu+0VCiayKzhvj7M0fCoKeZLWqJHQW7JehU=;
 b=UaIVcoQTq2KyGfxxupt7Zq0drITOqmkqHADiEmj0yKWR9pBE6+qDs8p4EJtymXuftvohcU
 GMRlFLet1sTOZJQJ3ue6cgYtjmEH0OSLNiVMfe2TQxb/igsS1LUaVYqjLsFBLP5djwwQR7
 FjeTOkOMY7/qKr9qfI6QDFXhzYVltRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-1iwRfYxGPNGZwOrYNYlQbg-1; Thu, 12 Nov 2020 16:46:27 -0500
X-MC-Unique: 1iwRfYxGPNGZwOrYNYlQbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43445190A3E2;
 Thu, 12 Nov 2020 21:46:26 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9E415D9CA;
 Thu, 12 Nov 2020 21:46:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 32/53] tests: Add unit test for qdev array properties
Date: Thu, 12 Nov 2020 16:43:29 -0500
Message-Id: <20201112214350.872250-33-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Add a test case to ensure array properties are behaving as
expected.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of this series.
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 tests/test-qdev-global-props.c | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-props.c
index c8862cac5f..9426ce2a72 100644
--- a/tests/test-qdev-global-props.c
+++ b/tests/test-qdev-global-props.c
@@ -44,11 +44,16 @@ struct MyType {
 
     uint32_t prop1;
     uint32_t prop2;
+
+    char **myarray;
+    uint32_t myarray_len;
 };
 
 static Property static_props[] = {
     DEFINE_PROP_UINT32("prop1", MyType, prop1, PROP_DEFAULT),
     DEFINE_PROP_UINT32("prop2", MyType, prop2, PROP_DEFAULT),
+    DEFINE_PROP_ARRAY("myarray", MyType, myarray_len, myarray,
+                      prop_info_string, char *),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -60,11 +65,19 @@ static void static_prop_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, static_props);
 }
 
+static void static_props_finalize(Object *obj)
+{
+    MyType *mt = STATIC_TYPE(obj);
+
+    g_free(mt->myarray);
+}
+
 static const TypeInfo static_prop_type = {
     .name = TYPE_STATIC_PROPS,
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(MyType),
     .class_init = static_prop_class_init,
+    .instance_finalize = static_props_finalize,
 };
 
 static const TypeInfo subclass_type = {
@@ -91,6 +104,52 @@ static void test_static_prop(void)
     g_test_trap_assert_stdout("");
 }
 
+static void test_static_prop_array(void)
+{
+    Error *err = NULL;
+    ObjectClass *oc = object_class_by_name(TYPE_STATIC_PROPS);
+    Object *obj = object_new(TYPE_STATIC_PROPS);
+    char *s = NULL;
+
+    g_assert_nonnull(object_class_property_find(oc, "len-myarray"));
+    g_assert_null(object_class_property_find(oc, "myarray[0]"));
+
+    g_assert_nonnull(object_property_find(obj, "len-myarray"));
+    g_assert_null(object_property_find(obj, "myarray[0]"));
+
+    g_assert_cmpint(object_property_get_int(obj, "len-myarray", &error_abort), ==, 0);
+    object_property_set_int(obj, "len-myarray", 3, &error_abort);
+    g_assert_cmpint(object_property_get_int(obj, "len-myarray", &error_abort), ==, 3);
+
+    g_assert_nonnull(object_property_find(obj, "myarray[0]"));
+    g_assert_nonnull(object_property_find(obj, "myarray[1]"));
+    g_assert_nonnull(object_property_find(obj, "myarray[2]"));
+    g_assert_null(object_property_find(obj, "myarray[3]"));
+
+    /* Setting length a second time must fail */
+    object_property_set_int(obj, "len-myarray", 42, &err);
+    error_free_or_abort(&err);
+
+    g_assert_nonnull(object_property_find(obj, "myarray[2]"));
+    g_assert_null(object_property_find(obj, "myarray[3]"));
+
+    s = object_property_get_str(obj, "myarray[2]", &error_abort);
+    g_assert_cmpstr(s, ==, "");
+    g_free(s);
+
+    object_property_set_str(obj, "myarray[1]", "value", &error_abort);
+
+    s = object_property_get_str(obj, "myarray[1]", &error_abort);
+    g_assert_cmpstr(s, ==, "value");
+    g_free(s);
+
+    s = object_property_get_str(obj, "myarray[2]", &error_abort);
+    g_assert_cmpstr(s, ==, "");
+    g_free(s);
+
+    object_unref(obj);
+}
+
 static void register_global_properties(GlobalProperty *props)
 {
     int i;
@@ -299,6 +358,8 @@ int main(int argc, char **argv)
                     test_static_prop_subprocess);
     g_test_add_func("/qdev/properties/static/default",
                     test_static_prop);
+    g_test_add_func("/qdev/properties/static/array",
+                    test_static_prop_array);
 
     g_test_add_func("/qdev/properties/static/global/subprocess",
                     test_static_globalprop_subprocess);
-- 
2.28.0


