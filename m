Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F523F87CF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:43:23 +0200 (CEST)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJEj4-0006zz-I2
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYv-0004CO-G9
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYh-0008Bb-VP
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629981154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+leUpHX+6A8WbUTKT4sOwbpktub1GqAlJx4luuoj6Q=;
 b=ZmeSJfr61IohtAs2fyg/oAi5TVA9Vm4Ycf55s64IQkRjMACBLibO7fZMFLznwezxyw5Hdo
 OgOYxSI8G5rPP82VazKTTHWGBKiO6p/6wgnFwllwv0XHDS3xHQrlUniSbduIKHahASHbNJ
 EJE2wF8ycgfRwXqFl8+BxmN+rI9AEn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-UI45yv0PPvCGnMoc1Trb8A-1; Thu, 26 Aug 2021 08:32:32 -0400
X-MC-Unique: UI45yv0PPvCGnMoc1Trb8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D25651966320;
 Thu, 26 Aug 2021 12:32:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0756A8E7;
 Thu, 26 Aug 2021 12:32:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B168111380BC; Thu, 26 Aug 2021 14:32:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] qapi: add 'any' condition
Date: Thu, 26 Aug 2021 14:32:22 +0200
Message-Id: <20210826123225.157891-9-armbru@redhat.com>
In-Reply-To: <20210826123225.157891-1-armbru@redhat.com>
References: <20210826123225.157891-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210804083105.97531-8-marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
index 3d7272a702..63a2e502fb 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -207,7 +207,7 @@ def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
         return ifcond
 
     oper, operands = next(iter(ifcond.items()))
-    oper = {'all': '&&'}[oper]
+    oper = {'all': '&&', 'any': '||'}[oper]
     operands = [cgen_ifcond(o) for o in operands]
     return '(' + (') ' + oper + ' (').join(operands) + ')'
 
@@ -220,7 +220,7 @@ def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
         return ifcond
 
     oper, operands = next(iter(ifcond.items()))
-    oper = {'all': ' and '}[oper]
+    oper = {'all': ' and ', 'any': ' or '}[oper]
     operands = [docgen_ifcond(o) for o in operands]
     return '(' + oper.join(operands) + ')'
 
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index d7a34655a7..f3ce10fb3e 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -290,16 +290,16 @@ def _check_if(cond: Union[str, object]) -> None:
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
                 info, "'%s' condition of %s must be an array" % (oper, source))
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
index e85a71c0f7..7737b32de8 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -291,6 +291,11 @@
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
@@ -314,7 +319,8 @@
             '*fs4': 'FeatureStruct4',
             '*cfs1': 'CondFeatureStruct1',
             '*cfs2': 'CondFeatureStruct2',
-            '*cfs3': 'CondFeatureStruct3' },
+            '*cfs3': 'CondFeatureStruct3',
+            '*cfs4': 'CondFeatureStruct4' },
   'returns': 'FeatureStruct1',
   'features': [] }
 
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index e74756cfd8..2f067d57af 100644
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
2.31.1


