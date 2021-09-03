Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4CF40063A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:55:56 +0200 (CEST)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFI3-0007sU-KS
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvE-0005l8-Dj
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvC-0003ad-Mb
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVe53MQsH80erQi3iInFDsoE4RGwLmE6RkRir1nu14w=;
 b=QM3T1rLddrbG3Y5mYur2C+BsAvFR8oi/EYOlqKZ6/WeBZn9P2ratqeGFYo5aHW41qnGIUv
 m2qmxsk83mJLc54Y/iDWIiBj4Qxhxno1FWQTmzxl+a6TAB5aS6MdGV7JOsuWe2rJUEJEu4
 KfvSGBdhrtwcveJF5AAYydtbL0F+nag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-CjAXF4FoMmSkj9hWtLLekg-1; Fri, 03 Sep 2021 15:32:16 -0400
X-MC-Unique: CjAXF4FoMmSkj9hWtLLekg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0B3C1854E2A;
 Fri,  3 Sep 2021 19:32:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D74619D9B;
 Fri,  3 Sep 2021 19:32:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF5F41138222; Fri,  3 Sep 2021 21:32:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] tests/qapi-schema: Demonstrate broken C code for 'if'
Date: Fri,  3 Sep 2021 21:32:01 +0200
Message-Id: <20210903193209.1426791-6-armbru@redhat.com>
In-Reply-To: <20210903193209.1426791-1-armbru@redhat.com>
References: <20210903193209.1426791-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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

The C code generated for 'if' conditionals is incorrectly
parenthesized.  For instance,

    'if': { 'not': { 'any': [ { 'not': 'TEST_IF_EVT' },
			      { 'not': 'TEST_IF_STRUCT' } ] } } }

generates

    #if !(!defined(TEST_IF_EVT)) || (!defined(TEST_IF_STRUCT))

This is wrong.  Correct would be:

    #if !(!defined(TEST_IF_EVT) || !defined(TEST_IF_STRUCT))

Cover the issue in qapi-schema-test.json.  This generates bad #if in
tests/test-qapi-events.h and other files.

Add a similar condition to doc-good.json.  The generated documentation
is fine.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210831123809.1107782-5-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qapi-schema/doc-good.json         | 2 +-
 tests/qapi-schema/doc-good.out          | 2 +-
 tests/qapi-schema/doc-good.txt          | 2 +-
 tests/qapi-schema/qapi-schema-test.json | 5 +++++
 tests/qapi-schema/qapi-schema-test.out  | 3 +++
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 5e30790730..e0027e4cf6 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -127,7 +127,7 @@
 { 'alternate': 'Alternate',
   'features': [ 'alt-feat' ],
   'data': { 'i': 'int', 'b': 'bool' },
-  'if': { 'not': 'IFNOT' } }
+  'if': { 'not': { 'any': [ 'IFONE', 'IFTWO' ] } } }
 
 ##
 # == Another subsection
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 26d1fa5d28..d72f3047e9 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -51,7 +51,7 @@ alternate Alternate
     tag type
     case i: int
     case b: bool
-    if OrderedDict([('not', 'IFNOT')])
+    if OrderedDict([('not', OrderedDict([('any', ['IFONE', 'IFTWO'])]))])
     feature alt-feat
 object q_obj_cmd-arg
     member arg1: int optional=False
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 5bfe06e14e..85a370831f 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -174,7 +174,7 @@ Features
 If
 ~~
 
-"!IFNOT"
+"!(IFONE or IFTWO)"
 
 
 Another subsection
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index e20f76d84c..6e37758280 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -261,6 +261,11 @@
     'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } },
   'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
 
+{ 'event': 'TEST_IF_EVENT2', 'data': {},
+  # FIXME C #if generated for this conditional is wrong
+  'if': { 'not': { 'any': [ { 'not': 'TEST_IF_EVT' },
+                            { 'not': 'TEST_IF_STRUCT' } ] } } }
+
 # test 'features'
 
 { 'struct': 'FeatureStruct0',
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 517d802636..5d2e830ba2 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -357,6 +357,9 @@ object q_obj_TEST_IF_EVENT-arg
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
     if OrderedDict([('all', ['TEST_IF_EVT', 'TEST_IF_STRUCT'])])
+event TEST_IF_EVENT2 None
+    boxed=False
+    if OrderedDict([('not', OrderedDict([('any', [OrderedDict([('not', 'TEST_IF_EVT')]), OrderedDict([('not', 'TEST_IF_STRUCT')])])]))])
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
-- 
2.31.1


