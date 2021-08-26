Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6873F879A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:36:38 +0200 (CEST)
Received: from localhost ([::1]:52400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJEcX-00079o-T0
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYq-0004At-0G
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYi-0008Bl-70
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629981155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GKi0XJTbgsMLnRtNs0aY+1QpIBEi8PJj0jzhMrCFlw=;
 b=R+BUxWp15712khXjJwsOJTxaCXj/EktpQ/mVzRCmVR0KnO6Hr25n4zxHKwy/Fuj2lEFPdC
 NZt3hLof/uNETQZnhg3h6LCJD5O4heObQzZDjYstfTOW7UEAfRza64+sKdU0GVrXM85kwC
 HJ77VXF6aad2aF75YptYLSnN093LE6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-zMdo2WpyPtyBSnL469MTiw-1; Thu, 26 Aug 2021 08:32:33 -0400
X-MC-Unique: zMdo2WpyPtyBSnL469MTiw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8F9A1008066;
 Thu, 26 Aug 2021 12:32:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8719860583;
 Thu, 26 Aug 2021 12:32:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B83C611380CC; Thu, 26 Aug 2021 14:32:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] qapi: add 'not' condition operation
Date: Thu, 26 Aug 2021 14:32:24 +0200
Message-Id: <20210826123225.157891-11-armbru@redhat.com>
In-Reply-To: <20210826123225.157891-1-armbru@redhat.com>
References: <20210826123225.157891-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

For the sake of completeness, introduce the 'not' condition.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210804083105.97531-10-marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Long line broken in tests/qapi-schema/qapi-schema-test.json]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py                  | 4 ++++
 scripts/qapi/expr.py                    | 7 +++++--
 tests/qapi-schema/bad-if-key.err        | 2 +-
 tests/qapi-schema/bad-if-keys.err       | 2 +-
 tests/qapi-schema/doc-good.json         | 3 ++-
 tests/qapi-schema/doc-good.out          | 1 +
 tests/qapi-schema/doc-good.txt          | 6 ++++++
 tests/qapi-schema/enum-if-invalid.err   | 2 +-
 tests/qapi-schema/qapi-schema-test.json | 3 ++-
 tests/qapi-schema/qapi-schema-test.out  | 4 ++--
 10 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 63a2e502fb..3fb2fbe7d4 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -207,6 +207,8 @@ def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
         return ifcond
 
     oper, operands = next(iter(ifcond.items()))
+    if oper == 'not':
+        return '!' + cgen_ifcond(operands)
     oper = {'all': '&&', 'any': '||'}[oper]
     operands = [cgen_ifcond(o) for o in operands]
     return '(' + (') ' + oper + ' (').join(operands) + ')'
@@ -220,6 +222,8 @@ def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
         return ifcond
 
     oper, operands = next(iter(ifcond.items()))
+    if oper == 'not':
+        return '!' + docgen_ifcond(operands)
     oper = {'all': ' and ', 'any': ' or '}[oper]
     operands = [docgen_ifcond(o) for o in operands]
     return '(' + oper.join(operands) + ')'
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index f3ce10fb3e..120b31089f 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -290,15 +290,18 @@ def _check_if(cond: Union[str, object]) -> None:
             raise QAPISemError(
                 info,
                 "'if' condition dict of %s must have one key: "
-                "'all' or 'any'" % source)
+                "'all', 'any' or 'not'" % source)
         check_keys(cond, info, "'if' condition", [],
-                   ["all", "any"])
+                   ["all", "any", "not"])
 
         oper, operands = next(iter(cond.items()))
         if not operands:
             raise QAPISemError(
                 info, "'if' condition [] of %s is useless" % source)
 
+        if oper == "not":
+            _check_if(operands)
+            return
         if oper in ("all", "any") and not isinstance(operands, list):
             raise QAPISemError(
                 info, "'%s' condition of %s must be an array" % (oper, source))
diff --git a/tests/qapi-schema/bad-if-key.err b/tests/qapi-schema/bad-if-key.err
index 7236f46e7a..a69dc9ee86 100644
--- a/tests/qapi-schema/bad-if-key.err
+++ b/tests/qapi-schema/bad-if-key.err
@@ -1,3 +1,3 @@
 bad-if-key.json: In struct 'TestIfStruct':
 bad-if-key.json:2: 'if' condition has unknown key 'value'
-Valid keys are 'all', 'any'.
+Valid keys are 'all', 'any', 'not'.
diff --git a/tests/qapi-schema/bad-if-keys.err b/tests/qapi-schema/bad-if-keys.err
index db6d019d77..aceb31dc6d 100644
--- a/tests/qapi-schema/bad-if-keys.err
+++ b/tests/qapi-schema/bad-if-keys.err
@@ -1,2 +1,2 @@
 bad-if-keys.json: In struct 'TestIfStruct':
-bad-if-keys.json:2: 'if' condition dict of struct must have one key: 'all' or 'any'
+bad-if-keys.json:2: 'if' condition dict of struct must have one key: 'all', 'any' or 'not'
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index e253d89ee0..2a35c679a4 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -126,7 +126,8 @@
 ##
 { 'alternate': 'Alternate',
   'features': [ 'alt-feat' ],
-  'data': { 'i': 'int', 'b': 'bool' } }
+  'data': { 'i': 'int', 'b': 'bool' },
+  'if': { 'not': 'IFNOT' } }
 
 ##
 # == Another subsection
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index c44c346ec8..a8871e8f99 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -51,6 +51,7 @@ alternate Alternate
     tag type
     case i: int
     case b: bool
+    if OrderedDict([('not', 'IFNOT')])
     feature alt-feat
 object q_obj_cmd-arg
     member arg1: int optional=False
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 251e9b746c..03c98c4182 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -171,6 +171,12 @@ Features
    a feature
 
 
+If
+~~
+
+"!IFNOT"
+
+
 Another subsection
 ==================
 
diff --git a/tests/qapi-schema/enum-if-invalid.err b/tests/qapi-schema/enum-if-invalid.err
index b96d94c48a..3bb84075a9 100644
--- a/tests/qapi-schema/enum-if-invalid.err
+++ b/tests/qapi-schema/enum-if-invalid.err
@@ -1,3 +1,3 @@
 enum-if-invalid.json: In enum 'TestIfEnum':
 enum-if-invalid.json:2: 'if' condition has unknown key 'val'
-Valid keys are 'all', 'any'.
+Valid keys are 'all', 'any', 'not'.
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 7737b32de8..a700f2531b 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -245,7 +245,8 @@
 
 { 'command': 'test-if-alternate-cmd',
   'data': { 'alt-cmd-arg': 'TestIfAlternate' },
-  'if': { 'all': ['defined(TEST_IF_ALT)'] } }
+  'if': { 'all': ['defined(TEST_IF_ALT)',
+                  {'not': 'defined(TEST_IF_NOT_ALT)'}] } }
 
 { 'command': 'test-if-cmd',
   'data': {
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 2f067d57af..53e12f3534 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -333,10 +333,10 @@ alternate TestIfAlternate
     if OrderedDict([('all', ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'])])
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if OrderedDict([('all', ['defined(TEST_IF_ALT)'])])
+    if OrderedDict([('all', ['defined(TEST_IF_ALT)', OrderedDict([('not', 'defined(TEST_IF_NOT_ALT)')])])])
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if OrderedDict([('all', ['defined(TEST_IF_ALT)'])])
+    if OrderedDict([('all', ['defined(TEST_IF_ALT)', OrderedDict([('not', 'defined(TEST_IF_NOT_ALT)')])])])
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-- 
2.31.1


