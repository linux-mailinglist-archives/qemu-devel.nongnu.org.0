Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312AB696D28
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:45:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0Hn-0006Xn-Ng; Tue, 14 Feb 2023 13:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pS0Hl-0006XL-IP
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:44:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pS0Hj-0006LE-MI
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676400251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3tkrTI/z3uWrzneqkQV/NjOVQF491LXOFad9U5GuUZg=;
 b=iRL9OjhEtIvGkPjMO1kK2gdndvoJren93pnp1WJBOxqE06rqZ+KFTd50PybgHYGQ0J/Wgn
 qxStcuMsFKYWLkBR2Mrhst+l1J3Jws9VN1t6RgLCUXPhIX0uuKm88xpB8eddFSjAjcXcG0
 j4697rbhzPpzSPFqk2f6Vp3HhYY1QkU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-U-kYQTYhPi2zc9ll4lT33A-1; Tue, 14 Feb 2023 13:44:09 -0500
X-MC-Unique: U-kYQTYhPi2zc9ll4lT33A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E12C53815F6A;
 Tue, 14 Feb 2023 18:44:08 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57E174010E82;
 Tue, 14 Feb 2023 18:44:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Het Gala <het.gala@nutanix.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] qapi: allow unions to contain further unions
Date: Tue, 14 Feb 2023 18:44:04 +0000
Message-Id: <20230214184404.1865237-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This extends the QAPI schema validation to permit unions inside unions,
provided the checks for clashing fields pass.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---

This patch comes out of the discussion on Het's migration series
starting at this patch:

  https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02111.html

Markus had described his desired improved architecture

  https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02719.html

but I don't think I have enough knowledge of the QAPI code to attempt
to fuse the handling of structs/unions as mentioned. This patch does
what looks to be the bare minimum to permit unions in unions, while
keeping validation checks for clashing fields.

I've not tested beyond the unit tests, but if this is acceptable
from Markus' POV, I'd expect Het to insert this patch at the
start of his migration series and thus test it more fully.

 scripts/qapi/schema.py                        |  6 +--
 .../union-invalid-union-subfield.err          |  2 +
 .../union-invalid-union-subfield.json         | 27 +++++++++++++
 .../union-invalid-union-subfield.out          |  0
 .../union-invalid-union-subtype.err           |  2 +
 .../union-invalid-union-subtype.json          | 26 +++++++++++++
 .../union-invalid-union-subtype.out           |  0
 tests/qapi-schema/union-union-branch.err      |  0
 tests/qapi-schema/union-union-branch.json     | 26 +++++++++++++
 tests/qapi-schema/union-union-branch.out      | 38 +++++++++++++++++++
 10 files changed, 124 insertions(+), 3 deletions(-)
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.err
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.json
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.out
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.err
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.json
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.out
 create mode 100644 tests/qapi-schema/union-union-branch.err
 create mode 100644 tests/qapi-schema/union-union-branch.json
 create mode 100644 tests/qapi-schema/union-union-branch.out

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index cd8661125c..062c6bbb00 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -465,9 +465,10 @@ def check(self, schema):
     # on behalf of info, which is not necessarily self.info
     def check_clash(self, info, seen):
         assert self._checked
-        assert not self.variants       # not implemented
         for m in self.members:
             m.check_clash(info, seen)
+        if self.variants:
+            self.variants.check_clash(info, seen)
 
     def connect_doc(self, doc=None):
         super().connect_doc(doc)
@@ -652,8 +653,7 @@ def check(self, schema, seen):
                         self.info,
                         "branch '%s' is not a value of %s"
                         % (v.name, self.tag_member.type.describe()))
-                if (not isinstance(v.type, QAPISchemaObjectType)
-                        or v.type.variants):
+                if not isinstance(v.type, QAPISchemaObjectType):
                     raise QAPISemError(
                         self.info,
                         "%s cannot use %s"
diff --git a/tests/qapi-schema/union-invalid-union-subfield.err b/tests/qapi-schema/union-invalid-union-subfield.err
new file mode 100644
index 0000000000..d3a2e31aff
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-union-subfield.err
@@ -0,0 +1,2 @@
+union-invalid-union-subfield.json: In union 'TestUnion':
+union-invalid-union-subfield.json:22: member 'teeth' of type 'TestTypeFish' collides with base member 'teeth'
diff --git a/tests/qapi-schema/union-invalid-union-subfield.json b/tests/qapi-schema/union-invalid-union-subfield.json
new file mode 100644
index 0000000000..235f76d7da
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-union-subfield.json
@@ -0,0 +1,27 @@
+{ 'enum': 'TestEnum',
+  'data': [ 'animals', 'plants' ] }
+
+{ 'enum': 'TestAnimals',
+  'data': [ 'fish', 'birds'] }
+
+{ 'struct': 'TestTypeFish',
+  'data': { 'scales': 'int', 'teeth': 'int' } }
+
+{ 'struct': 'TestTypeBirds',
+  'data': { 'feathers': 'int' } }
+
+{ 'union': 'TestTypeAnimals',
+  'base': { 'atype': 'TestAnimals' },
+  'discriminator': 'atype',
+  'data': { 'fish': 'TestTypeFish',
+            'birds': 'TestTypeBirds' } }
+
+{ 'struct': 'TestTypePlants',
+  'data': { 'integer': 'int' } }
+
+{ 'union': 'TestUnion',
+  'base': { 'type': 'TestEnum',
+	    'teeth': 'int' },
+  'discriminator': 'type',
+  'data': { 'animals': 'TestTypeAnimals',
+            'plants': 'TestTypePlants' } }
diff --git a/tests/qapi-schema/union-invalid-union-subfield.out b/tests/qapi-schema/union-invalid-union-subfield.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/union-invalid-union-subtype.err b/tests/qapi-schema/union-invalid-union-subtype.err
new file mode 100644
index 0000000000..7b8679c08f
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-union-subtype.err
@@ -0,0 +1,2 @@
+union-invalid-union-subtype.json: In union 'TestUnion':
+union-invalid-union-subtype.json:22: base member 'type' collides with base member 'type'
diff --git a/tests/qapi-schema/union-invalid-union-subtype.json b/tests/qapi-schema/union-invalid-union-subtype.json
new file mode 100644
index 0000000000..59ca4b0385
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-union-subtype.json
@@ -0,0 +1,26 @@
+{ 'enum': 'TestEnum',
+  'data': [ 'value-a', 'value-b' ] }
+
+{ 'enum': 'TestEnumA',
+  'data': [ 'value-a1', 'value-a2' ] }
+
+{ 'struct': 'TestTypeA1',
+  'data': { 'integer': 'int' } }
+
+{ 'struct': 'TestTypeA2',
+  'data': { 'integer': 'int' } }
+
+{ 'union': 'TestTypeA',
+  'base': { 'type': 'TestEnumA' },
+  'discriminator': 'type',
+  'data': { 'value-a1': 'TestTypeA1',
+            'value-a2': 'TestTypeA2' } }
+
+{ 'struct': 'TestTypeB',
+  'data': { 'integer': 'int' } }
+
+{ 'union': 'TestUnion',
+  'base': { 'type': 'TestEnum' },
+  'discriminator': 'type',
+  'data': { 'value-a': 'TestTypeA',
+            'value-b': 'TestTypeB' } }
diff --git a/tests/qapi-schema/union-invalid-union-subtype.out b/tests/qapi-schema/union-invalid-union-subtype.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/union-union-branch.err b/tests/qapi-schema/union-union-branch.err
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/union-union-branch.json b/tests/qapi-schema/union-union-branch.json
new file mode 100644
index 0000000000..d3d7ce57c6
--- /dev/null
+++ b/tests/qapi-schema/union-union-branch.json
@@ -0,0 +1,26 @@
+{ 'enum': 'TestEnum',
+  'data': [ 'value-a', 'value-b' ] }
+
+{ 'enum': 'TestEnumA',
+  'data': [ 'value-a1', 'value-a2' ] }
+
+{ 'struct': 'TestTypeA1',
+  'data': { 'integer': 'int' } }
+
+{ 'struct': 'TestTypeA2',
+  'data': { 'integer': 'int' } }
+
+{ 'union': 'TestTypeA',
+  'base': { 'type-a': 'TestEnumA' },
+  'discriminator': 'type-a',
+  'data': { 'value-a1': 'TestTypeA1',
+            'value-a2': 'TestTypeA2' } }
+
+{ 'struct': 'TestTypeB',
+  'data': { 'integer': 'int' } }
+
+{ 'union': 'TestUnion',
+  'base': { 'type': 'TestEnum' },
+  'discriminator': 'type',
+  'data': { 'value-a': 'TestTypeA',
+            'value-b': 'TestTypeB' } }
diff --git a/tests/qapi-schema/union-union-branch.out b/tests/qapi-schema/union-union-branch.out
new file mode 100644
index 0000000000..d0c37495c2
--- /dev/null
+++ b/tests/qapi-schema/union-union-branch.out
@@ -0,0 +1,38 @@
+module ./builtin
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module union-union-branch.json
+enum TestEnum
+    member value-a
+    member value-b
+enum TestEnumA
+    member value-a1
+    member value-a2
+object TestTypeA1
+    member integer: int optional=False
+object TestTypeA2
+    member integer: int optional=False
+object q_obj_TestTypeA-base
+    member type-a: TestEnumA optional=False
+object TestTypeA
+    base q_obj_TestTypeA-base
+    tag type-a
+    case value-a1: TestTypeA1
+    case value-a2: TestTypeA2
+object TestTypeB
+    member integer: int optional=False
+object q_obj_TestUnion-base
+    member type: TestEnum optional=False
+object TestUnion
+    base q_obj_TestUnion-base
+    tag type
+    case value-a: TestTypeA
+    case value-b: TestTypeB
-- 
2.39.1


