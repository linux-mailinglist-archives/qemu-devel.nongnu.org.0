Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CBF3DFD10
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:39:03 +0200 (CEST)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCQY-00025N-SC
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBCJt-0004xF-DA
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBCJr-0002Aj-D7
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7+jNnE00O6QYJBXUJhqs3prbOYBGEGypG0v5S92KgY=;
 b=O9uMsjL2iFQ0N8A+avpqBqmvpZoforocPSA36sLfhdmerRuzLMBJ+uiocYWIzsIcj2Tsmb
 TAwQP9vQyjQR4B2Vul66LeU4hqGHU3IaIQDzhpjVJX9iQvN5iFT7yNQufuhhEn+aGDGs4i
 g4v7YpoUUI4tc2iEGJ9OLG/qBmigEyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-Q1lIeIfHNv6w7THx-7pXOw-1; Wed, 04 Aug 2021 04:32:05 -0400
X-MC-Unique: Q1lIeIfHNv6w7THx-7pXOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7838D1940922
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 08:32:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABA315C1B4;
 Wed,  4 Aug 2021 08:31:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/10] qapi: add 'any' condition
Date: Wed,  4 Aug 2021 12:31:02 +0400
Message-Id: <20210804083105.97531-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210804083105.97531-1-marcandre.lureau@redhat.com>
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/test-qmp-cmds.c              | 1 +
 scripts/qapi/common.py                  | 4 ++--
 scripts/qapi/expr.py                    | 6 +++---
 tests/qapi-schema/bad-if-key.err        | 2 +-
 tests/qapi-schema/bad-if-keys.err       | 2 +-
 tests/qapi-schema/doc-good.json         | 4 +++-
 tests/qapi-schema/doc-good.out          | 2 +-
 tests/qapi-schema/doc-good.txt          | 3 ++-
 tests/qapi-schema/enum-if-invalid.err   | 2 +-
 tests/qapi-schema/qapi-schema-test.json | 8 +++++++-
 tests/qapi-schema/qapi-schema-test.out  | 5 +++++
 11 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 1b0b7d99df..83efa39720 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -51,6 +51,7 @@ FeatureStruct1 *qmp_test_features0(bool has_fs0, FeatureStruct0 *fs0,
                                    bool has_cfs1, CondFeatureStruct1 *cfs1,
                                    bool has_cfs2, CondFeatureStruct2 *cfs2,
                                    bool has_cfs3, CondFeatureStruct3 *cfs3,
+                                   bool has_cfs4, CondFeatureStruct4 *cfs4,
                                    Error **errp)
 {
     return g_new0(FeatureStruct1, 1);
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 51463510c9..018d2f6996 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -207,7 +207,7 @@ def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
         return ifcond
 
     oper, operands = next(iter(ifcond.items()))
-    oper = {'all': ' and '}[oper]
+    oper = {'all': ' and ', 'any': ' or '}[oper]
     operands = [docgen_ifcond(o) for o in operands]
     return '(' + oper.join(operands) + ')'
 
@@ -219,7 +219,7 @@ def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
         return ifcond
 
     oper, operands = next(iter(ifcond.items()))
-    oper = {'all': '&&'}[oper]
+    oper = {'all': '&&', 'any': '||'}[oper]
     operands = [cgen_ifcond(o) for o in operands]
     return '(' + (') ' + oper + ' (').join(operands) + ')'
 
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index b5187bfbca..e30fd3e31c 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -296,16 +296,16 @@ def _check_if(cond: Union[str, object]) -> None:
             raise QAPISemError(
                 info,
                 "'if' condition dict of %s must have one key: "
-                "'all'" % source)
+                "'all' or 'any'" % source)
         check_keys(cond, info, "'if' condition", [],
-                   ["all"])
+                   ["all", "any"])
 
         oper, operands = next(iter(cond.items()))
         if not operands:
             raise QAPISemError(
                 info, "'if' condition [] of %s is useless" % source)
 
-        if oper in ("all") and not isinstance(operands, list):
+        if oper in ("all", "any") and not isinstance(operands, list):
             raise QAPISemError(
                 info, "'%s' condition of %s must be a list" % (oper, source))
         for operand in operands:
diff --git a/tests/qapi-schema/bad-if-key.err b/tests/qapi-schema/bad-if-key.err
index 725d5abae5..7236f46e7a 100644
--- a/tests/qapi-schema/bad-if-key.err
+++ b/tests/qapi-schema/bad-if-key.err
@@ -1,3 +1,3 @@
 bad-if-key.json: In struct 'TestIfStruct':
 bad-if-key.json:2: 'if' condition has unknown key 'value'
-Valid keys are 'all'.
+Valid keys are 'all', 'any'.
diff --git a/tests/qapi-schema/bad-if-keys.err b/tests/qapi-schema/bad-if-keys.err
index b072db9a6f..db6d019d77 100644
--- a/tests/qapi-schema/bad-if-keys.err
+++ b/tests/qapi-schema/bad-if-keys.err
@@ -1,2 +1,2 @@
 bad-if-keys.json: In struct 'TestIfStruct':
-bad-if-keys.json:2: 'if' condition dict of struct must have one key: 'all'
+bad-if-keys.json:2: 'if' condition dict of struct must have one key: 'all' or 'any'
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 25b1053e8a..e253d89ee0 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -103,7 +103,9 @@
   'features': [ 'union-feat1' ],
   'base': 'Base',
   'discriminator': 'base1',
-  'data': { 'one': 'Variant1', 'two': { 'type': 'Variant2', 'if': 'IFTWO' } } }
+  'data': { 'one': 'Variant1',
+            'two': { 'type': 'Variant2',
+                     'if': { 'any': ['IFONE', 'IFTWO'] } } } }
 
 ##
 # @SugaredUnion:
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 689d084f3a..c44c346ec8 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -30,7 +30,7 @@ object Object
     tag base1
     case one: Variant1
     case two: Variant2
-        if IFTWO
+        if OrderedDict([('any', ['IFONE', 'IFTWO'])])
     feature union-feat1
 object q_obj_Variant1-wrapper
     member data: Variant1 optional=False
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 4490108cb7..251e9b746c 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -120,7 +120,8 @@ Members
 
 The members of "Base"
 The members of "Variant1" when "base1" is ""one""
-The members of "Variant2" when "base1" is ""two"" (**If: **"IFTWO")
+The members of "Variant2" when "base1" is ""two"" (**If: **"(IFONE or
+IFTWO)")
 
 Features
 ~~~~~~~~
diff --git a/tests/qapi-schema/enum-if-invalid.err b/tests/qapi-schema/enum-if-invalid.err
index df305cd79f..b96d94c48a 100644
--- a/tests/qapi-schema/enum-if-invalid.err
+++ b/tests/qapi-schema/enum-if-invalid.err
@@ -1,3 +1,3 @@
 enum-if-invalid.json: In enum 'TestIfEnum':
 enum-if-invalid.json:2: 'if' condition has unknown key 'val'
-Valid keys are 'all'.
+Valid keys are 'all', 'any'.
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index f2e0fff51f..5e3dbc0f72 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -290,6 +290,11 @@
   'features': [ { 'name': 'feature1',
                   'if': { 'all': [ 'defined(TEST_IF_COND_1)',
                                    'defined(TEST_IF_COND_2)'] } } ] }
+{ 'struct': 'CondFeatureStruct4',
+  'data': { 'foo': 'int' },
+  'features': [ { 'name': 'feature1',
+                  'if': {'any': ['defined(TEST_IF_COND_1)',
+                                 'defined(TEST_IF_COND_2)'] } } ] }
 
 { 'enum': 'FeatureEnum1',
   'data': [ 'eins', 'zwei', 'drei' ],
@@ -313,7 +318,8 @@
             '*fs4': 'FeatureStruct4',
             '*cfs1': 'CondFeatureStruct1',
             '*cfs2': 'CondFeatureStruct2',
-            '*cfs3': 'CondFeatureStruct3' },
+            '*cfs3': 'CondFeatureStruct3',
+            '*cfs4': 'CondFeatureStruct4' },
   'returns': 'FeatureStruct1',
   'features': [] }
 
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 6a1b3aa341..e5625f2542 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -390,6 +390,10 @@ object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
         if OrderedDict([('all', ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])])
+object CondFeatureStruct4
+    member foo: int optional=False
+    feature feature1
+        if OrderedDict([('any', ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])])
 enum FeatureEnum1
     member eins
     member zwei
@@ -417,6 +421,7 @@ object q_obj_test-features0-arg
     member cfs1: CondFeatureStruct1 optional=True
     member cfs2: CondFeatureStruct2 optional=True
     member cfs3: CondFeatureStruct3 optional=True
+    member cfs4: CondFeatureStruct4 optional=True
 command test-features0 q_obj_test-features0-arg -> FeatureStruct1
     gen=True success_response=True boxed=False oob=False preconfig=False
 command test-command-features1 None -> None
-- 
2.32.0.264.g75ae10bc75


