Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820643AC8EF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:35:27 +0200 (CEST)
Received: from localhost ([::1]:60526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBqQ-0002zj-Hh
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBiv-0007Hl-V1
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBiq-0001Pu-Ru
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624012056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PnV1zv0w+xz9f3BROTyRg7BM18r+BoeAO7cALxOZPMU=;
 b=TQ18lfaMEaUQ1cm6SMFDyWyrn7deXSsc37i8XffvAaMyPZ7K8nuEUhvjeMBRUU3Odn8tpO
 ejC6AREXjykE9LCwFPcc2V83bhOrq9ulATTtyTHRTUUtB2eA0j7InbmjR47a/FacYDWHBU
 tr6jw2qnx/7jAGX4+gQXRbgCOQ4bLBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-jAD6gtW7MEaS0RMibyinpw-1; Fri, 18 Jun 2021 06:27:34 -0400
X-MC-Unique: jAD6gtW7MEaS0RMibyinpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13BA1100CCC3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:27:33 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F36FC60C58;
 Fri, 18 Jun 2021 10:27:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/11] qapi: add 'not' condition operation
Date: Fri, 18 Jun 2021 14:25:06 +0400
Message-Id: <20210618102507.3761128-11-marcandre.lureau@redhat.com>
In-Reply-To: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

For the sake of completeness, introduce the 'not' condition.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/common.py                  | 4 ++++
 scripts/qapi/expr.py                    | 7 +++++--
 tests/qapi-schema/bad-if.err            | 2 +-
 tests/qapi-schema/doc-good.json         | 3 ++-
 tests/qapi-schema/doc-good.out          | 1 +
 tests/qapi-schema/doc-good.txt          | 6 ++++++
 tests/qapi-schema/enum-if-invalid.err   | 2 +-
 tests/qapi-schema/qapi-schema-test.json | 2 +-
 tests/qapi-schema/qapi-schema-test.out  | 4 ++--
 9 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 018d2f6996..f8718e201b 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -207,6 +207,8 @@ def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
         return ifcond
 
     oper, operands = next(iter(ifcond.items()))
+    if oper == 'not':
+        return '!' + docgen_ifcond(operands)
     oper = {'all': ' and ', 'any': ' or '}[oper]
     operands = [docgen_ifcond(o) for o in operands]
     return '(' + oper.join(operands) + ')'
@@ -219,6 +221,8 @@ def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
         return ifcond
 
     oper, operands = next(iter(ifcond.items()))
+    if oper == 'not':
+        return '!' + cgen_ifcond(operands)
     oper = {'all': '&&', 'any': '||'}[oper]
     operands = [cgen_ifcond(o) for o in operands]
     return '(' + (') ' + oper + ' (').join(operands) + ')'
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index e10a803dc2..d2bd52c49f 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -296,15 +296,18 @@ def _check_if(cond: Union[str, object]) -> None:
             raise QAPISemError(
                 info,
                 "'if' condition dict of %s must have one key: "
-                "'all' or 'any'" % source)
+                "'all', 'any' or 'not" % source)
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
                 info, "'%s' condition of %s must be a list" % (oper, source))
diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.err
index 3624e79b0c..454fbae387 100644
--- a/tests/qapi-schema/bad-if.err
+++ b/tests/qapi-schema/bad-if.err
@@ -1,3 +1,3 @@
 bad-if.json: In struct 'TestIfStruct':
 bad-if.json:2: 'if' condition has unknown key 'value'
-Valid keys are 'all', 'any'.
+Valid keys are 'all', 'any', 'not'.
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index a67d4d9467..836fb1bdc4 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -125,7 +125,8 @@
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
index 252fd8cc86..a0f09b277e 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -244,7 +244,7 @@
   'if': { 'all': ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'] } }
 
 { 'command': 'test-if-alternate-cmd', 'data': { 'alt-cmd-arg': 'TestIfAlternate' },
-  'if': { 'all': ['defined(TEST_IF_ALT)'] } }
+  'if': { 'all': ['defined(TEST_IF_ALT)', {'not': 'defined(TEST_IF_NOT_ALT)'}] } }
 
 { 'command': 'test-if-cmd',
   'data': {
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index e5625f2542..df2c57de54 100644
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
2.29.0


