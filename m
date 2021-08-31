Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349FB3FC7DE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:06:59 +0200 (CEST)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3Te-0002Gh-06
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL322-0006GZ-84
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL31v-0005HO-R8
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFvsBkcFT4H4soWc1V+8KZlldijQR+OHyOKtf+J+1NE=;
 b=O+tgwwjEiEoRjty3pEitPWpC0CdyKUy1ZlkZJ5TCvCcV1ff+rjDy61n7PkIqBpa6MNNOSf
 V+Mjg5BXVDPgI7X4uWkLHJFpVS9nReV+Wz5a/A0T4fBRmgIiBytwMVrdXUEjjFiZhoEk+q
 SM85I+uwM2w8kyRROSnurKy1g5j2ecc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-5JkFQFPBMA6cMve68UK2iw-1; Tue, 31 Aug 2021 08:38:15 -0400
X-MC-Unique: 5JkFQFPBMA6cMve68UK2iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6906100A608;
 Tue, 31 Aug 2021 12:38:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C210560C05;
 Tue, 31 Aug 2021 12:38:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 63FF411380B7; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/12] tests/qapi-schema: Demonstrate broken C code for 'if'
Date: Tue, 31 Aug 2021 14:38:01 +0200
Message-Id: <20210831123809.1107782-5-armbru@redhat.com>
In-Reply-To: <20210831123809.1107782-1-armbru@redhat.com>
References: <20210831123809.1107782-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
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


