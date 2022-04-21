Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA9C50A2A0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:35:35 +0200 (CEST)
Received: from localhost ([::1]:42120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXuA-0005uA-Pr
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqQ-0002cR-A1
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqN-0004KY-Lm
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650551498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QoVcMAqdY+GpguPwNtbDNu7RgHt7AT0G42Ac8ZbNe1E=;
 b=QPoFHk3cm9orCpgsX4kCDWIGt50KvO7sy966uu1fowArRo28FE7NKSqIbWkpadV9gi66VF
 3+fIOchQhljbQ6cdXB1SFTzj1RrZbTzrw5cSvG4etZIChaypryLw62t/h5eNNtl6EviD5o
 hvLzZeRCJMqGjZbMoHS3YaY04On/LNc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-hQ3E8AybOYqrg2C7uPoYGg-1; Thu, 21 Apr 2022 10:31:37 -0400
X-MC-Unique: hQ3E8AybOYqrg2C7uPoYGg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 079CC3811A2E;
 Thu, 21 Apr 2022 14:31:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDAA654CE48;
 Thu, 21 Apr 2022 14:31:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A70F321E6A22; Thu, 21 Apr 2022 16:31:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] qapi-schema: test: add a unit test for parsing array
 alternates
Date: Thu, 21 Apr 2022 16:31:31 +0200
Message-Id: <20220421143135.1491256-4-armbru@redhat.com>
In-Reply-To: <20220421143135.1491256-1-armbru@redhat.com>
References: <20220421143135.1491256-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220321164243.200569-4-pbonzini@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Dead code dropped in test_visitor_in_alternate_list()]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/unit/test-qobject-input-visitor.c | 40 +++++++++++++++++++++++++
 tests/qapi-schema/qapi-schema-test.json |  1 +
 tests/qapi-schema/qapi-schema-test.out  |  4 +++
 3 files changed, 45 insertions(+)

diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index aed08eaebc..14329dabcf 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -775,6 +775,7 @@ static void test_visitor_in_alternate_number(TestInputVisitorData *data,
     AltEnumNum *aen;
     AltNumEnum *ans;
     AltEnumInt *asi;
+    AltListInt *ali;
 
     /* Parsing an int */
 
@@ -801,6 +802,12 @@ static void test_visitor_in_alternate_number(TestInputVisitorData *data,
     g_assert_cmpint(asi->u.i, ==, 42);
     qapi_free_AltEnumInt(asi);
 
+    v = visitor_input_test_init(data, "42");
+    visit_type_AltListInt(v, NULL, &ali, &error_abort);
+    g_assert_cmpint(ali->type, ==, QTYPE_QNUM);
+    g_assert_cmpint(ali->u.i, ==, 42);
+    qapi_free_AltListInt(ali);
+
     /* Parsing a double */
 
     v = visitor_input_test_init(data, "42.5");
@@ -826,6 +833,37 @@ static void test_visitor_in_alternate_number(TestInputVisitorData *data,
     qapi_free_AltEnumInt(asi);
 }
 
+static void test_visitor_in_alternate_list(TestInputVisitorData *data,
+                                 const void *unused)
+{
+    intList *item;
+    Visitor *v;
+    AltListInt *ali;
+    int i;
+
+    v = visitor_input_test_init(data, "[ 42, 43, 44 ]");
+    visit_type_AltListInt(v, NULL, &ali, &error_abort);
+    g_assert(ali != NULL);
+
+    g_assert_cmpint(ali->type, ==, QTYPE_QLIST);
+    for (i = 0, item = ali->u.l; item; item = item->next, i++) {
+        g_assert_cmpint(item->value, ==, 42 + i);
+    }
+
+    qapi_free_AltListInt(ali);
+    ali = NULL;
+
+    /* An empty list is valid */
+    v = visitor_input_test_init(data, "[]");
+    visit_type_AltListInt(v, NULL, &ali, &error_abort);
+    g_assert(ali != NULL);
+
+    g_assert_cmpint(ali->type, ==, QTYPE_QLIST);
+    g_assert(!ali->u.l);
+    qapi_free_AltListInt(ali);
+    ali = NULL;
+}
+
 static void input_visitor_test_add(const char *testpath,
                                    const void *user_data,
                                    void (*test_func)(TestInputVisitorData *data,
@@ -1187,6 +1225,8 @@ int main(int argc, char **argv)
                            NULL, test_visitor_in_wrong_type);
     input_visitor_test_add("/visitor/input/alternate-number",
                            NULL, test_visitor_in_alternate_number);
+    input_visitor_test_add("/visitor/input/alternate-list",
+                           NULL, test_visitor_in_alternate_list);
     input_visitor_test_add("/visitor/input/fail/struct",
                            NULL, test_visitor_in_fail_struct);
     input_visitor_test_add("/visitor/input/fail/struct-nested",
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 43b8697002..ba7302f42b 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -119,6 +119,7 @@
 { 'alternate': 'AltEnumNum', 'data': { 'e': 'EnumOne', 'n': 'number' } }
 { 'alternate': 'AltNumEnum', 'data': { 'n': 'number', 'e': 'EnumOne' } }
 { 'alternate': 'AltEnumInt', 'data': { 'e': 'EnumOne', 'i': 'int' } }
+{ 'alternate': 'AltListInt', 'data': { 'l': ['int'], 'i': 'int' } }
 
 # for testing use of 'str' within alternates
 { 'alternate': 'AltStrObj', 'data': { 's': 'str', 'o': 'TestStruct' } }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 1f9585fa9b..043d75c655 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -121,6 +121,10 @@ alternate AltEnumInt
     tag type
     case e: EnumOne
     case i: int
+alternate AltListInt
+    tag type
+    case l: intList
+    case i: int
 alternate AltStrObj
     tag type
     case s: str
-- 
2.35.1


