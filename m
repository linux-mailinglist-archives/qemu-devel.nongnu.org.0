Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6452B43DF2A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:46:46 +0200 (CEST)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2vj-0001oz-UW
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg2bf-0007Ma-48
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mg2bW-00031x-FX
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635416749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dp4F6ngLK3CgvfvwPruQc5xxR7Q7Xdo+ZW7ud9zLFuI=;
 b=XULQ+rMckwkRmWpJO6qk8lahyTSRsIxLCYUq4aDWcu5AdGVGj8I2hRPZLZM3NkCiC3Wbaw
 4wOslBWOGvLsqypu9PDvw/m2VYfrgOuw6UAsW18nGg57FsBhOxARe+tCB+B/Iav4V5N2Uf
 61utap1dM9klHR6EZzCi/igVs1Y1GuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-erjOqYh7MFO84LygBQPg1Q-1; Thu, 28 Oct 2021 06:25:46 -0400
X-MC-Unique: erjOqYh7MFO84LygBQPg1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7855410A8E00;
 Thu, 28 Oct 2021 10:25:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B285DF36;
 Thu, 28 Oct 2021 10:25:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A46011380AA; Thu, 28 Oct 2021 12:25:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] qapi: New special feature flag "unstable"
Date: Thu, 28 Oct 2021 12:25:12 +0200
Message-Id: <20211028102520.747396-2-armbru@redhat.com>
In-Reply-To: <20211028102520.747396-1-armbru@redhat.com>
References: <20211028102520.747396-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, kchamart@redhat.com,
 mdroth@linux.vnet.ibm.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, philmd@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By convention, names starting with "x-" are experimental.  The parts
of external interfaces so named may be withdrawn or changed
incompatibly in future releases.

The naming convention makes unstable interfaces easy to recognize.
Promoting something from experimental to stable involves a name
change.  Client code needs to be updated.  Occasionally bothersome.

Worse, the convention is not universally observed:

* QOM type "input-barrier" has properties "x-origin", "y-origin".
  Looks accidental, but it's ABI since 4.2.

* QOM types "memory-backend-file", "memory-backend-memfd",
  "memory-backend-ram", and "memory-backend-epc" have a property
  "x-use-canonical-path-for-ramblock-id" that is documented to be
  stable despite its name.

We could document these exceptions, but documentation helps only
humans.  We want to recognize "unstable" in code, like "deprecated".

So support recognizing it the same way: introduce new special feature
flag "unstable".  It will be treated specially by the QAPI generator,
like the existing feature flag "deprecated", and unlike regular
feature flags.

This commit updates documentation and prepares tests.  The next commit
updates the QAPI schema.  The remaining patches update the QAPI
generator and wire up -compat policy checking.

Management applications can then use query-qmp-schema and -compat to
manage or guard against use of unstable interfaces the same way as for
deprecated interfaces.

docs/devel/qapi-code-gen.txt no longer mandates the naming convention.
Using it anyway might help writers of programs that aren't
full-fledged management applications.  Not using it can save us
bothersome renames.  We'll see how that shakes out.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 docs/devel/qapi-code-gen.rst            | 9 ++++++---
 tests/qapi-schema/qapi-schema-test.json | 7 +++++--
 tests/qapi-schema/qapi-schema-test.out  | 5 +++++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 4071c9074a..38f2d7aad3 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -713,6 +713,10 @@ member as deprecated.  It is not supported elsewhere so far.
 Interfaces so marked may be withdrawn in future releases in accordance
 with QEMU's deprecation policy.
 
+Feature "unstable" marks a command, event, enum value, or struct
+member as unstable.  It is not supported elsewhere so far.  Interfaces
+so marked may be withdrawn or changed incompatibly in future releases.
+
 
 Naming rules and reserved names
 -------------------------------
@@ -746,9 +750,8 @@ Member name ``u`` and names starting with ``has-`` or ``has_`` are reserved
 for the generator, which uses them for unions and for tracking
 optional members.
 
-Any name (command, event, type, member, or enum value) beginning with
-``x-`` is marked experimental, and may be withdrawn or changed
-incompatibly in a future release.
+Names beginning with ``x-`` used to signify "experimental".  This
+convention has been replaced by special feature "unstable".
 
 Pragmas ``command-name-exceptions`` and ``member-name-exceptions`` let
 you violate naming rules.  Use for new code is strongly discouraged. See
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index b677ab861d..43b8697002 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -273,7 +273,7 @@
   'data': { 'foo': { 'type': 'int', 'features': [ 'deprecated' ] } },
   'features': [ 'feature1' ] }
 { 'struct': 'FeatureStruct2',
-  'data': { 'foo': 'int' },
+  'data': { 'foo': { 'type': 'int', 'features': [ 'unstable' ] } },
   'features': [ { 'name': 'feature1' } ] }
 { 'struct': 'FeatureStruct3',
   'data': { 'foo': 'int' },
@@ -331,7 +331,7 @@
 { 'command': 'test-command-features1',
   'features': [ 'deprecated' ] }
 { 'command': 'test-command-features3',
-  'features': [ 'feature1', 'feature2' ] }
+  'features': [ 'unstable', 'feature1', 'feature2' ] }
 
 { 'command': 'test-command-cond-features1',
   'features': [ { 'name': 'feature1', 'if': 'TEST_IF_FEATURE_1'} ] }
@@ -348,3 +348,6 @@
 
 { 'event': 'TEST_EVENT_FEATURES1',
   'features': [ 'deprecated' ] }
+
+{ 'event': 'TEST_EVENT_FEATURES2',
+  'features': [ 'unstable' ] }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 16846dbeb8..1f9585fa9b 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -308,6 +308,7 @@ object FeatureStruct1
     feature feature1
 object FeatureStruct2
     member foo: int optional=False
+        feature unstable
     feature feature1
 object FeatureStruct3
     member foo: int optional=False
@@ -373,6 +374,7 @@ command test-command-features1 None -> None
     feature deprecated
 command test-command-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
+    feature unstable
     feature feature1
     feature feature2
 command test-command-cond-features1 None -> None
@@ -394,6 +396,9 @@ event TEST_EVENT_FEATURES0 FeatureStruct1
 event TEST_EVENT_FEATURES1 None
     boxed=False
     feature deprecated
+event TEST_EVENT_FEATURES2 None
+    boxed=False
+    feature unstable
 module include/sub-module.json
 include sub-sub-module.json
 object SecondArrayRef
-- 
2.31.1


