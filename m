Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07733438EDB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 07:32:11 +0200 (CEST)
Received: from localhost ([::1]:44092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mesag-0006Ug-49
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 01:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUq-0005Xx-Pe
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUn-0005Tr-C8
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635139564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwLwGEujYpzYkui5eea/xnzhjYxetuw28fQTiE0qHhs=;
 b=EyxbUQYpXF487OLgeGqxTryHIVoMP9R+qBmKWVWzxBaI1fwjdNWlAdAOf4INSQTmmFbKuU
 0L1kqvbCVMA9LLqsU/9x4NOb2wftAsS9RJcXUWV3OjexsFoV5IeCd2BsokIOphiCBkWdWy
 3AP24YwP9qZutteh0EmBnrfI5A4is6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-Akk4Owv-PkG6l2C_qRMPpA-1; Mon, 25 Oct 2021 01:26:01 -0400
X-MC-Unique: Akk4Owv-PkG6l2C_qRMPpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 579D61006AA2;
 Mon, 25 Oct 2021 05:26:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 484D219D9D;
 Mon, 25 Oct 2021 05:25:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D185411380AA; Mon, 25 Oct 2021 07:25:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] qapi: New special feature flag "unstable"
Date: Mon, 25 Oct 2021 07:25:24 +0200
Message-Id: <20211025052532.3859634-2-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-1-armbru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By convention, names starting with "x-" are experimental.  The parts
of external interfaces so named may be withdrawn or changed
incompatibly in future releases.

Drawback: promoting something from experimental to stable involves a
name change.  Client code needs to be updated.

Moreover, the convention is not universally observed:

* QOM type "input-barrier" has properties "x-origin", "y-origin".
  Looks accidental, but it's ABI since 4.2.

* QOM types "memory-backend-file", "memory-backend-memfd",
  "memory-backend-ram", and "memory-backend-epc" have a property
  "x-use-canonical-path-for-ramblock-id" that is documented to be
  stable despite its name.

We could document these exceptions, but documentation helps only
humans.  We want to recognize "unstable" in code, like "deprecated".

Replace the convention by a new special feature flag "unstable".  It
will be recognized by the QAPI generator, like the existing feature
flag "deprecated", and unlike regular feature flags.

This commit updates documentation and prepares tests.  The next commit
updates the QAPI schema.  The remaining patches update the QAPI
generator and wire up -compat policy checking.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


