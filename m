Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92FB25BD1E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 10:25:08 +0200 (CEST)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDkYN-0004pF-DF
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 04:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDkXB-00036b-42
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 04:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDkX8-0008RB-Oj
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 04:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599121429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6+u67uMyp/AbE5WPamSR4/ih0VagjfgbRPD2Xx9GOc=;
 b=KQDAZrsXdJn039tqYmeq3VfHnJ6lxv+tmGLMEBy62P1F9qaeBrLimuHFDzX9GnEdVS3yuF
 yzHQrHH/9oDWRUVlN0dj9R3nOKKn53ZxTp5FIa9mbdo9O3JxKrxSLPSCbyBLKPqvewiHM8
 xrDEbLlpoBGlYZ30bg4UEworbRZfvc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-RpizbRp6NYClytkB-52oOw-1; Thu, 03 Sep 2020 04:23:47 -0400
X-MC-Unique: RpizbRp6NYClytkB-52oOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91DA880734E;
 Thu,  3 Sep 2020 08:23:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 385E219C59;
 Thu,  3 Sep 2020 08:23:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B2A47113861E; Thu,  3 Sep 2020 10:23:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] qapi: enable use of g_autoptr with QAPI types
Date: Thu,  3 Sep 2020 10:23:37 +0200
Message-Id: <20200903082344.1877175-2-armbru@redhat.com>
In-Reply-To: <20200903082344.1877175-1-armbru@redhat.com>
References: <20200903082344.1877175-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Currently QAPI generates a type and function for free'ing it:

  typedef struct QCryptoBlockCreateOptions QCryptoBlockCreateOptions;
  void qapi_free_QCryptoBlockCreateOptions(QCryptoBlockCreateOptions *obj);

This is used in the traditional manner:

  QCryptoBlockCreateOptions *opts = NULL;

  opts = g_new0(QCryptoBlockCreateOptions, 1);

  ....do stuff with opts...

  qapi_free_QCryptoBlockCreateOptions(opts);

Since bumping the min glib to 2.48, QEMU has incrementally adopted the
use of g_auto/g_autoptr. This allows the compiler to run a function to
free a variable when it goes out of scope, the benefit being the
compiler can guarantee it is freed in all possible code ptahs.

This benefit is applicable to QAPI types too, and given the seriously
long method names for some qapi_free_XXXX() functions, is much less
typing. This change thus makes the code generator emit:

 G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoBlockCreateOptions,
                              qapi_free_QCryptoBlockCreateOptions)

The above code example now becomes

  g_autoptr(QCryptoBlockCreateOptions) opts = NULL;

  opts = g_new0(QCryptoBlockCreateOptions, 1);

  ....do stuff with opts...

Note, if the local pointer needs to live beyond the scope holding the
variable, then g_steal_pointer can be used. This is useful to return the
pointer to the caller in the success codepath, while letting it be freed
in all error codepaths.

  return g_steal_pointer(&opts);

The crypto/block.h header needs updating to avoid symbol clash now that
the g_autoptr support is a standard QAPI feature.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20200723153845.2934357-1-berrange@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.txt       |  2 ++
 include/crypto/block.h             |  2 --
 tests/test-qobject-input-visitor.c | 23 +++++++----------------
 scripts/qapi/types.py              |  1 +
 4 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 69eede6c28..f3e7ced212 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -1321,6 +1321,7 @@ Example:
     };
 
     void qapi_free_UserDefOne(UserDefOne *obj);
+    G_DEFINE_AUTOPTR_CLEANUP_FUNC(UserDefOne, qapi_free_UserDefOne)
 
     struct UserDefOneList {
         UserDefOneList *next;
@@ -1328,6 +1329,7 @@ Example:
     };
 
     void qapi_free_UserDefOneList(UserDefOneList *obj);
+    G_DEFINE_AUTOPTR_CLEANUP_FUNC(UserDefOneList, qapi_free_UserDefOneList)
 
     struct q_obj_my_command_arg {
         UserDefOneList *arg1;
diff --git a/include/crypto/block.h b/include/crypto/block.h
index d274819791..7a65e8e402 100644
--- a/include/crypto/block.h
+++ b/include/crypto/block.h
@@ -311,7 +311,5 @@ uint64_t qcrypto_block_get_sector_size(QCryptoBlock *block);
 void qcrypto_block_free(QCryptoBlock *block);
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoBlock, qcrypto_block_free)
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoBlockCreateOptions,
-                              qapi_free_QCryptoBlockCreateOptions)
 
 #endif /* QCRYPTO_BLOCK_H */
diff --git a/tests/test-qobject-input-visitor.c b/tests/test-qobject-input-visitor.c
index 6bacabf063..e41b91a2a6 100644
--- a/tests/test-qobject-input-visitor.c
+++ b/tests/test-qobject-input-visitor.c
@@ -417,7 +417,7 @@ static void test_visitor_in_struct(TestInputVisitorData *data,
 static void test_visitor_in_struct_nested(TestInputVisitorData *data,
                                           const void *unused)
 {
-    UserDefTwo *udp = NULL;
+    g_autoptr(UserDefTwo) udp = NULL;
     Visitor *v;
 
     v = visitor_input_test_init(data, "{ 'string0': 'string0', "
@@ -433,8 +433,6 @@ static void test_visitor_in_struct_nested(TestInputVisitorData *data,
     g_assert_cmpstr(udp->dict1->dict2->userdef->string, ==, "string");
     g_assert_cmpstr(udp->dict1->dict2->string, ==, "string2");
     g_assert(udp->dict1->has_dict3 == false);
-
-    qapi_free_UserDefTwo(udp);
 }
 
 static void test_visitor_in_list(TestInputVisitorData *data,
@@ -546,7 +544,7 @@ static void test_visitor_in_union_flat(TestInputVisitorData *data,
                                        const void *unused)
 {
     Visitor *v;
-    UserDefFlatUnion *tmp;
+    g_autoptr(UserDefFlatUnion) tmp = NULL;
     UserDefUnionBase *base;
 
     v = visitor_input_test_init(data,
@@ -563,8 +561,6 @@ static void test_visitor_in_union_flat(TestInputVisitorData *data,
 
     base = qapi_UserDefFlatUnion_base(tmp);
     g_assert(&base->enum1 == &tmp->enum1);
-
-    qapi_free_UserDefFlatUnion(tmp);
 }
 
 static void test_visitor_in_alternate(TestInputVisitorData *data,
@@ -690,7 +686,7 @@ static void test_list_union_integer_helper(TestInputVisitorData *data,
                                            const void *unused,
                                            UserDefListUnionKind kind)
 {
-    UserDefListUnion *cvalue = NULL;
+    g_autoptr(UserDefListUnion) cvalue = NULL;
     Visitor *v;
     GString *gstr_list = g_string_new("");
     GString *gstr_union = g_string_new("");
@@ -782,7 +778,6 @@ static void test_list_union_integer_helper(TestInputVisitorData *data,
 
     g_string_free(gstr_union, true);
     g_string_free(gstr_list, true);
-    qapi_free_UserDefListUnion(cvalue);
 }
 
 static void test_visitor_in_list_union_int(TestInputVisitorData *data,
@@ -851,7 +846,7 @@ static void test_visitor_in_list_union_uint64(TestInputVisitorData *data,
 static void test_visitor_in_list_union_bool(TestInputVisitorData *data,
                                             const void *unused)
 {
-    UserDefListUnion *cvalue = NULL;
+    g_autoptr(UserDefListUnion) cvalue = NULL;
     boolList *elem = NULL;
     Visitor *v;
     GString *gstr_list = g_string_new("");
@@ -879,13 +874,12 @@ static void test_visitor_in_list_union_bool(TestInputVisitorData *data,
 
     g_string_free(gstr_union, true);
     g_string_free(gstr_list, true);
-    qapi_free_UserDefListUnion(cvalue);
 }
 
 static void test_visitor_in_list_union_string(TestInputVisitorData *data,
                                               const void *unused)
 {
-    UserDefListUnion *cvalue = NULL;
+    g_autoptr(UserDefListUnion) cvalue = NULL;
     strList *elem = NULL;
     Visitor *v;
     GString *gstr_list = g_string_new("");
@@ -914,7 +908,6 @@ static void test_visitor_in_list_union_string(TestInputVisitorData *data,
 
     g_string_free(gstr_union, true);
     g_string_free(gstr_list, true);
-    qapi_free_UserDefListUnion(cvalue);
 }
 
 #define DOUBLE_STR_MAX 16
@@ -922,7 +915,7 @@ static void test_visitor_in_list_union_string(TestInputVisitorData *data,
 static void test_visitor_in_list_union_number(TestInputVisitorData *data,
                                               const void *unused)
 {
-    UserDefListUnion *cvalue = NULL;
+    g_autoptr(UserDefListUnion) cvalue = NULL;
     numberList *elem = NULL;
     Visitor *v;
     GString *gstr_list = g_string_new("");
@@ -957,7 +950,6 @@ static void test_visitor_in_list_union_number(TestInputVisitorData *data,
 
     g_string_free(gstr_union, true);
     g_string_free(gstr_list, true);
-    qapi_free_UserDefListUnion(cvalue);
 }
 
 static void input_visitor_test_add(const char *testpath,
@@ -1253,7 +1245,7 @@ static void test_visitor_in_fail_alternate(TestInputVisitorData *data,
 static void do_test_visitor_in_qmp_introspect(TestInputVisitorData *data,
                                               const QLitObject *qlit)
 {
-    SchemaInfoList *schema = NULL;
+    g_autoptr(SchemaInfoList) schema = NULL;
     QObject *obj = qobject_from_qlit(qlit);
     Visitor *v;
 
@@ -1262,7 +1254,6 @@ static void do_test_visitor_in_qmp_introspect(TestInputVisitorData *data,
     visit_type_SchemaInfoList(v, NULL, &schema, &error_abort);
     g_assert(schema);
 
-    qapi_free_SchemaInfoList(schema);
     qobject_unref(obj);
     visit_free(v);
 }
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 3ad33af4ee..3640f17cd6 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -213,6 +213,7 @@ def gen_type_cleanup_decl(name):
     ret = mcgen('''
 
 void qapi_free_%(c_name)s(%(c_name)s *obj);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(%(c_name)s, qapi_free_%(c_name)s)
 ''',
                 c_name=c_name(name))
     return ret
-- 
2.26.2


