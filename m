Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAFF3AC8EA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:34:52 +0200 (CEST)
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBpr-0001zz-If
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBiL-0006VG-Tv
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBiJ-00012U-QA
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624012023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7WXBydCFdCYHxWai4MX+58WesCkY4CNcY695kWf6R5Y=;
 b=RmYLCNn12yC4f9Aifm8iSpNj+SK49KbRr3Z3wY8lVwsjzc/H1AKf6jsYj50An/vAcqZci+
 MQaxDrUZHUSYQOBRfKZZPjQm+D99YYsFV+4l3/YG5N6uJNLv8S7tqfR4h2WIPPtvbAzM5A
 FhoJvQS36GHM5kLjw6haWmYNfwqxA04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-7PqzE6RDNOmTNG43nKp85w-1; Fri, 18 Jun 2021 06:27:02 -0400
X-MC-Unique: 7PqzE6RDNOmTNG43nKp85w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 395419F92A
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:27:01 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 376F8604CD;
 Fri, 18 Jun 2021 10:26:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/11] qapi: add 'any' condition
Date: Fri, 18 Jun 2021 14:25:04 +0400
Message-Id: <20210618102507.3761128-9-marcandre.lureau@redhat.com>
In-Reply-To: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/test-qmp-cmds.c              | 1 +
 scripts/qapi/common.py                  | 4 ++--
 scripts/qapi/expr.py                    | 6 +++---
 tests/qapi-schema/bad-if.err            | 2 +-
 tests/qapi-schema/doc-good.json         | 3 ++-
 tests/qapi-schema/doc-good.out          | 2 +-
 tests/qapi-schema/doc-good.txt          | 3 ++-
 tests/qapi-schema/enum-if-invalid.err   | 2 +-
 tests/qapi-schema/qapi-schema-test.json | 7 ++++++-
 tests/qapi-schema/qapi-schema-test.out  | 5 +++++
 10 files changed, 24 insertions(+), 11 deletions(-)

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
index 3ee66c5f62..e10a803dc2 100644
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
diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.err
index 8278c49368..3624e79b0c 100644
--- a/tests/qapi-schema/bad-if.err
+++ b/tests/qapi-schema/bad-if.err
@@ -1,3 +1,3 @@
 bad-if.json: In struct 'TestIfStruct':
 bad-if.json:2: 'if' condition has unknown key 'value'
-Valid keys are 'all'.
+Valid keys are 'all', 'any'.
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 25b1053e8a..a67d4d9467 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -103,7 +103,8 @@
   'features': [ 'union-feat1' ],
   'base': 'Base',
   'discriminator': 'base1',
-  'data': { 'one': 'Variant1', 'two': { 'type': 'Variant2', 'if': 'IFTWO' } } }
+  'data': { 'one': 'Variant1', 'two': { 'type': 'Variant2',
+                                        'if': { 'any': ['IFONE', 'IFTWO'] } } } }
 
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
index f2e0fff51f..252fd8cc86 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -290,6 +290,10 @@
   'features': [ { 'name': 'feature1',
                   'if': { 'all': [ 'defined(TEST_IF_COND_1)',
                                    'defined(TEST_IF_COND_2)'] } } ] }
+{ 'struct': 'CondFeatureStruct4',
+  'data': { 'foo': 'int' },
+  'features': [ { 'name': 'feature1', 'if': {'any': ['defined(TEST_IF_COND_1)',
+                                                     'defined(TEST_IF_COND_2)'] } } ] }
 
 { 'enum': 'FeatureEnum1',
   'data': [ 'eins', 'zwei', 'drei' ],
@@ -313,7 +317,8 @@
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
2.29.0


