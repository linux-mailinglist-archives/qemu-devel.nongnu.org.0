Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8482E37888
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 17:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYufd-0007WQ-NS
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 11:51:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hYuXo-0001lp-Dt
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 11:43:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hYuXn-0000uA-6o
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 11:43:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57736)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hYuSu-0005Zh-F6; Thu, 06 Jun 2019 11:38:08 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77EF231628EE;
	Thu,  6 Jun 2019 15:38:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CBFF619B7;
	Thu,  6 Jun 2019 15:38:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8C89011386B0; Thu,  6 Jun 2019 17:38:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 17:37:58 +0200
Message-Id: <20190606153803.5278-3-armbru@redhat.com>
In-Reply-To: <20190606153803.5278-1-armbru@redhat.com>
References: <20190606153803.5278-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 06 Jun 2019 15:38:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/7] tests/qapi-schema: Test for good feature
 lists in structs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qapi-schema/qapi-schema-test.json | 39 ++++++++++++++++++++++
 tests/qapi-schema/qapi-schema-test.out  | 43 +++++++++++++++++++++++++
 tests/qapi-schema/test-qapi.py          |  4 +++
 tests/test-qmp-cmds.c                   |  8 +++++
 4 files changed, 94 insertions(+)

diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/=
qapi-schema-test.json
index 0952c68734..c6d59acc3e 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -242,3 +242,42 @@
   { 'foo': 'TestIfStruct',
     'bar': { 'type': ['TestIfEnum'], 'if': 'defined(TEST_IF_EVT_BAR)' } =
},
   'if': 'defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)' }
+
+# test 'features' for structs
+
+{ 'struct': 'FeatureStruct0',
+  'data': { 'foo': 'int' },
+  'features': [] }
+{ 'struct': 'FeatureStruct1',
+  'data': { 'foo': 'int' },
+  'features': [ 'feature1' ] }
+{ 'struct': 'FeatureStruct2',
+  'data': { 'foo': 'int' },
+  'features': [ { 'name': 'feature1' } ] }
+{ 'struct': 'FeatureStruct3',
+  'data': { 'foo': 'int' },
+  'features': [ 'feature1', 'feature2' ] }
+{ 'struct': 'FeatureStruct4',
+  'data': { 'namespace-test': 'int' },
+  'features': [ 'namespace-test', 'int', 'name', 'if' ] }
+
+{ 'struct': 'CondFeatureStruct1',
+  'data': { 'foo': 'int' },
+  'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'=
} ] }
+{ 'struct': 'CondFeatureStruct2',
+  'data': { 'foo': 'int' },
+  'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'=
},
+                { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'=
} ] }
+{ 'struct': 'CondFeatureStruct3',
+  'data': { 'foo': 'int' },
+  'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
+                                              'defined(TEST_IF_COND_2)']=
 } ] }
+{ 'command': 'test-features',
+  'data': { 'fs0': 'FeatureStruct0',
+            'fs1': 'FeatureStruct1',
+            'fs2': 'FeatureStruct2',
+            'fs3': 'FeatureStruct3',
+            'fs4': 'FeatureStruct4',
+            'cfs1': 'CondFeatureStruct1',
+            'cfs2': 'CondFeatureStruct2',
+            'cfs3': 'CondFeatureStruct3' } }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/q=
api-schema-test.out
index 77fb1e1aa9..85d510bc00 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -354,3 +354,46 @@ object q_obj_TestIfEvent-arg
 event TestIfEvent q_obj_TestIfEvent-arg
    boxed=3DFalse
     if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
+object FeatureStruct0
+    member foo: int optional=3DFalse
+object FeatureStruct1
+    member foo: int optional=3DFalse
+    feature feature1
+object FeatureStruct2
+    member foo: int optional=3DFalse
+    feature feature1
+object FeatureStruct3
+    member foo: int optional=3DFalse
+    feature feature1
+    feature feature2
+object FeatureStruct4
+    member namespace-test: int optional=3DFalse
+    feature namespace-test
+    feature int
+    feature name
+    feature if
+object CondFeatureStruct1
+    member foo: int optional=3DFalse
+    feature feature1
+        if ['defined(TEST_IF_FEATURE_1)']
+object CondFeatureStruct2
+    member foo: int optional=3DFalse
+    feature feature1
+        if ['defined(TEST_IF_FEATURE_1)']
+    feature feature2
+        if ['defined(TEST_IF_FEATURE_2)']
+object CondFeatureStruct3
+    member foo: int optional=3DFalse
+    feature feature1
+        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
+object q_obj_test-features-arg
+    member fs0: FeatureStruct0 optional=3DFalse
+    member fs1: FeatureStruct1 optional=3DFalse
+    member fs2: FeatureStruct2 optional=3DFalse
+    member fs3: FeatureStruct3 optional=3DFalse
+    member fs4: FeatureStruct4 optional=3DFalse
+    member cfs1: CondFeatureStruct1 optional=3DFalse
+    member cfs2: CondFeatureStruct2 optional=3DFalse
+    member cfs3: CondFeatureStruct3 optional=3DFalse
+command test-features q_obj_test-features-arg -> None
+   gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconfi=
g=3DFalse
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi=
.py
index f2d6815c86..b0f770b9bd 100644
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -49,6 +49,10 @@ class QAPISchemaTestVisitor(QAPISchemaVisitor):
             self._print_if(m.ifcond, 8)
         self._print_variants(variants)
         self._print_if(ifcond)
+        if features:
+            for f in features:
+                print('    feature %s' % f.name)
+                self._print_if(f.ifcond, 8)
=20
     def visit_alternate_type(self, name, info, ifcond, variants):
         print('alternate %s' % name)
diff --git a/tests/test-qmp-cmds.c b/tests/test-qmp-cmds.c
index 630b1b9bac..1f738f12e2 100644
--- a/tests/test-qmp-cmds.c
+++ b/tests/test-qmp-cmds.c
@@ -45,6 +45,14 @@ void qmp_user_def_cmd1(UserDefOne * ud1, Error **errp)
 {
 }
=20
+void qmp_test_features(FeatureStruct0 *fs0, FeatureStruct1 *fs1,
+                       FeatureStruct2 *fs2, FeatureStruct3 *fs3,
+                       FeatureStruct4 *fs4, CondFeatureStruct1 *cfs1,
+                       CondFeatureStruct2 *cfs2, CondFeatureStruct3 *cfs=
3,
+                       Error **errp)
+{
+}
+
 UserDefTwo *qmp_user_def_cmd2(UserDefOne *ud1a,
                               bool has_udb1, UserDefOne *ud1b,
                               Error **errp)
--=20
2.21.0


