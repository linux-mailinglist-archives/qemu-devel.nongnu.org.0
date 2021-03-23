Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE02A346BA2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:05:00 +0100 (CET)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOp91-0002NM-PI
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1T-00070X-21
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1O-0002lk-DM
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oO4u9YZ++qV+luw5AGlqnIh72dl8pLHeZD/b8jz3L+M=;
 b=RlfP8+LOl6CmuPDZ34C5sw+yqYHgkFvxjomc2NWhJXxnftuNsCsuVCrneBTlkcdPJJxg9b
 KlQLD09FSR6Y5SrPFhO3kv6pD7limkHSsE4yM4aYncV9ngLmTQniJyhgPt0TpHakdbpfcS
 /23ryO4fRAFK18/wTDwAjFhuDMFJZFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-0aRxjp5dPAOPChZUXrKLNQ-1; Tue, 23 Mar 2021 17:57:03 -0400
X-MC-Unique: 0aRxjp5dPAOPChZUXrKLNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21E6D83DD20;
 Tue, 23 Mar 2021 21:57:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0E655C1C5;
 Tue, 23 Mar 2021 21:57:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA6A911326A1; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/29] qapi: Enforce type naming rules
Date: Tue, 23 Mar 2021 22:56:43 +0100
Message-Id: <20210323215658.3840228-15-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Type names should be CamelCase.  Enforce this.  The only offenders are
in tests/.  Fix them.  Add test type-case to cover the new error.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-15-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[Regexp simplified, new test made more robust]
---
 scripts/qapi/expr.py                              | 3 ++-
 tests/qapi-schema/doc-bad-union-member.json       | 4 ++--
 tests/qapi-schema/double-type.err                 | 2 +-
 tests/qapi-schema/double-type.json                | 2 +-
 tests/qapi-schema/features-deprecated-type.err    | 2 +-
 tests/qapi-schema/features-deprecated-type.json   | 2 +-
 tests/qapi-schema/meson.build                     | 1 +
 tests/qapi-schema/redefined-builtin.err           | 4 ++--
 tests/qapi-schema/redefined-builtin.json          | 4 ++--
 tests/qapi-schema/redefined-type.err              | 6 +++---
 tests/qapi-schema/redefined-type.json             | 4 ++--
 tests/qapi-schema/struct-data-invalid.err         | 2 +-
 tests/qapi-schema/struct-data-invalid.json        | 2 +-
 tests/qapi-schema/struct-member-invalid-dict.err  | 2 +-
 tests/qapi-schema/struct-member-invalid-dict.json | 2 +-
 tests/qapi-schema/struct-member-invalid.err       | 2 +-
 tests/qapi-schema/struct-member-invalid.json      | 2 +-
 tests/qapi-schema/type-case.err                   | 2 ++
 tests/qapi-schema/type-case.json                  | 2 ++
 tests/qapi-schema/type-case.out                   | 0
 tests/qapi-schema/unknown-expr-key.err            | 2 +-
 tests/qapi-schema/unknown-expr-key.json           | 2 +-
 22 files changed, 30 insertions(+), 24 deletions(-)
 create mode 100644 tests/qapi-schema/type-case.err
 create mode 100644 tests/qapi-schema/type-case.json
 create mode 100644 tests/qapi-schema/type-case.out

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index c065505b27..7bd15559de 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -61,7 +61,8 @@ def check_name_lower(name, info, source,
 
 def check_name_camel(name, info, source):
     stem = check_name_str(name, info, source)
-    # TODO reject '[_-]' in stem, require CamelCase
+    if not re.match(r'[A-Z][A-Za-z0-9]*[a-z][A-Za-z0-9]*$', stem):
+        raise QAPISemError(info, "name of %s must use CamelCase" % source)
 
 
 def check_defn_name_str(name, info, meta):
diff --git a/tests/qapi-schema/doc-bad-union-member.json b/tests/qapi-schema/doc-bad-union-member.json
index d611435f6a..bd231a0109 100644
--- a/tests/qapi-schema/doc-bad-union-member.json
+++ b/tests/qapi-schema/doc-bad-union-member.json
@@ -11,9 +11,9 @@
   'data': { 'nothing': 'Empty' } }
 
 { 'struct': 'Base',
-  'data': { 'type': 'T' } }
+  'data': { 'type': 'FrobType' } }
 
 { 'struct': 'Empty',
   'data': { } }
 
-{ 'enum': 'T', 'data': ['nothing'] }
+{ 'enum': 'FrobType', 'data': ['nothing'] }
diff --git a/tests/qapi-schema/double-type.err b/tests/qapi-schema/double-type.err
index 71fc4dbb52..576e716197 100644
--- a/tests/qapi-schema/double-type.err
+++ b/tests/qapi-schema/double-type.err
@@ -1,3 +1,3 @@
-double-type.json: In struct 'bar':
+double-type.json: In struct 'Bar':
 double-type.json:2: struct has unknown key 'command'
 Valid keys are 'base', 'data', 'features', 'if', 'struct'.
diff --git a/tests/qapi-schema/double-type.json b/tests/qapi-schema/double-type.json
index 911fa7af50..2c0809f38d 100644
--- a/tests/qapi-schema/double-type.json
+++ b/tests/qapi-schema/double-type.json
@@ -1,2 +1,2 @@
 # we reject an expression with ambiguous metatype
-{ 'command': 'foo', 'struct': 'bar', 'data': { } }
+{ 'command': 'foo', 'struct': 'Bar', 'data': { } }
diff --git a/tests/qapi-schema/features-deprecated-type.err b/tests/qapi-schema/features-deprecated-type.err
index af4ffe20aa..ddaedf604e 100644
--- a/tests/qapi-schema/features-deprecated-type.err
+++ b/tests/qapi-schema/features-deprecated-type.err
@@ -1,2 +1,2 @@
-features-deprecated-type.json: In struct 'S':
+features-deprecated-type.json: In struct 'Foo':
 features-deprecated-type.json:2: feature 'deprecated' is not supported for types
diff --git a/tests/qapi-schema/features-deprecated-type.json b/tests/qapi-schema/features-deprecated-type.json
index 4b5bf5b86e..265849b1f7 100644
--- a/tests/qapi-schema/features-deprecated-type.json
+++ b/tests/qapi-schema/features-deprecated-type.json
@@ -1,3 +1,3 @@
 # Feature 'deprecated' is not supported for types
-{ 'struct': 'S', 'data': {},
+{ 'struct': 'Foo', 'data': {},
   'features': [ 'deprecated' ] }
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index d5fa035507..ba11cb76ac 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -180,6 +180,7 @@ schemas = [
   'trailing-comma-list.json',
   'trailing-comma-object.json',
   'type-bypass-bad-gen.json',
+  'type-case.json',
   'unclosed-list.json',
   'unclosed-object.json',
   'unclosed-string.json',
diff --git a/tests/qapi-schema/redefined-builtin.err b/tests/qapi-schema/redefined-builtin.err
index 58c7e42ffc..92bc62dc76 100644
--- a/tests/qapi-schema/redefined-builtin.err
+++ b/tests/qapi-schema/redefined-builtin.err
@@ -1,2 +1,2 @@
-redefined-builtin.json: In struct 'size':
-redefined-builtin.json:2: built-in type 'size' is already defined
+redefined-builtin.json: In struct 'QType':
+redefined-builtin.json:2: enum type 'QType' is already defined
diff --git a/tests/qapi-schema/redefined-builtin.json b/tests/qapi-schema/redefined-builtin.json
index 45b8a550ad..cad555cc73 100644
--- a/tests/qapi-schema/redefined-builtin.json
+++ b/tests/qapi-schema/redefined-builtin.json
@@ -1,2 +1,2 @@
-# we reject types that duplicate builtin names
-{ 'struct': 'size', 'data': { 'myint': 'size' } }
+# we reject types that clash with predefined types
+{ 'struct': 'QType', 'data': { 'myint': 'size' } }
diff --git a/tests/qapi-schema/redefined-type.err b/tests/qapi-schema/redefined-type.err
index b7103fc15f..5e5406f811 100644
--- a/tests/qapi-schema/redefined-type.err
+++ b/tests/qapi-schema/redefined-type.err
@@ -1,4 +1,4 @@
-redefined-type.json: In enum 'foo':
-redefined-type.json:3: 'foo' is already defined
-redefined-type.json: In struct 'foo':
+redefined-type.json: In enum 'Foo':
+redefined-type.json:3: 'Foo' is already defined
+redefined-type.json: In struct 'Foo':
 redefined-type.json:2: previous definition
diff --git a/tests/qapi-schema/redefined-type.json b/tests/qapi-schema/redefined-type.json
index a09e768bae..291453e70d 100644
--- a/tests/qapi-schema/redefined-type.json
+++ b/tests/qapi-schema/redefined-type.json
@@ -1,3 +1,3 @@
 # we reject types defined more than once
-{ 'struct': 'foo', 'data': { 'one': 'str' } }
-{ 'enum': 'foo', 'data': [ 'two' ] }
+{ 'struct': 'Foo', 'data': { 'one': 'str' } }
+{ 'enum': 'Foo', 'data': [ 'two' ] }
diff --git a/tests/qapi-schema/struct-data-invalid.err b/tests/qapi-schema/struct-data-invalid.err
index 5ed4bec573..23cbfc60ea 100644
--- a/tests/qapi-schema/struct-data-invalid.err
+++ b/tests/qapi-schema/struct-data-invalid.err
@@ -1,2 +1,2 @@
-struct-data-invalid.json: In struct 'foo':
+struct-data-invalid.json: In struct 'Foo':
 struct-data-invalid.json:1: 'data' should be an object or type name
diff --git a/tests/qapi-schema/struct-data-invalid.json b/tests/qapi-schema/struct-data-invalid.json
index 9adbc3bb6b..00ad11ef94 100644
--- a/tests/qapi-schema/struct-data-invalid.json
+++ b/tests/qapi-schema/struct-data-invalid.json
@@ -1,2 +1,2 @@
-{ 'struct': 'foo',
+{ 'struct': 'Foo',
   'data': false }
diff --git a/tests/qapi-schema/struct-member-invalid-dict.err b/tests/qapi-schema/struct-member-invalid-dict.err
index f9b3f33551..517793cc9b 100644
--- a/tests/qapi-schema/struct-member-invalid-dict.err
+++ b/tests/qapi-schema/struct-member-invalid-dict.err
@@ -1,2 +1,2 @@
-struct-member-invalid-dict.json: In struct 'foo':
+struct-member-invalid-dict.json: In struct 'Foo':
 struct-member-invalid-dict.json:3: 'data' member '*a' misses key 'type'
diff --git a/tests/qapi-schema/struct-member-invalid-dict.json b/tests/qapi-schema/struct-member-invalid-dict.json
index bc3d62ae63..df5d018f65 100644
--- a/tests/qapi-schema/struct-member-invalid-dict.json
+++ b/tests/qapi-schema/struct-member-invalid-dict.json
@@ -1,4 +1,4 @@
 # struct 'data' member with dict value is (longhand) member
 # definition, not inline complex type
-{ 'struct': 'foo',
+{ 'struct': 'Foo',
   'data': { '*a': { 'case': 'foo' } } }
diff --git a/tests/qapi-schema/struct-member-invalid.err b/tests/qapi-schema/struct-member-invalid.err
index 9a2c934538..7e01a41d7c 100644
--- a/tests/qapi-schema/struct-member-invalid.err
+++ b/tests/qapi-schema/struct-member-invalid.err
@@ -1,2 +1,2 @@
-struct-member-invalid.json: In struct 'foo':
+struct-member-invalid.json: In struct 'Foo':
 struct-member-invalid.json:1: 'data' member 'a' should be a type name
diff --git a/tests/qapi-schema/struct-member-invalid.json b/tests/qapi-schema/struct-member-invalid.json
index 8f172f7a87..a4cd860c67 100644
--- a/tests/qapi-schema/struct-member-invalid.json
+++ b/tests/qapi-schema/struct-member-invalid.json
@@ -1,2 +1,2 @@
-{ 'struct': 'foo',
+{ 'struct': 'Foo',
   'data': { 'a': false } }
diff --git a/tests/qapi-schema/type-case.err b/tests/qapi-schema/type-case.err
new file mode 100644
index 0000000000..36d2de2d00
--- /dev/null
+++ b/tests/qapi-schema/type-case.err
@@ -0,0 +1,2 @@
+type-case.json: In struct 'not-a-camel':
+type-case.json:2: name of struct must use CamelCase
diff --git a/tests/qapi-schema/type-case.json b/tests/qapi-schema/type-case.json
new file mode 100644
index 0000000000..a43c68e7eb
--- /dev/null
+++ b/tests/qapi-schema/type-case.json
@@ -0,0 +1,2 @@
+# Type names should use CamelCase
+{ 'struct': 'not-a-camel', 'data': {} }
diff --git a/tests/qapi-schema/type-case.out b/tests/qapi-schema/type-case.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/unknown-expr-key.err b/tests/qapi-schema/unknown-expr-key.err
index c5f395bf79..f2538e3ce7 100644
--- a/tests/qapi-schema/unknown-expr-key.err
+++ b/tests/qapi-schema/unknown-expr-key.err
@@ -1,3 +1,3 @@
-unknown-expr-key.json: In struct 'bar':
+unknown-expr-key.json: In struct 'Bar':
 unknown-expr-key.json:2: struct has unknown keys 'bogus', 'phony'
 Valid keys are 'base', 'data', 'features', 'if', 'struct'.
diff --git a/tests/qapi-schema/unknown-expr-key.json b/tests/qapi-schema/unknown-expr-key.json
index 13292d75ed..8003a0c36e 100644
--- a/tests/qapi-schema/unknown-expr-key.json
+++ b/tests/qapi-schema/unknown-expr-key.json
@@ -1,2 +1,2 @@
 # we reject an expression with unknown top-level keys
-{ 'struct': 'bar', 'data': { 'string': 'str'}, 'bogus': { }, 'phony': { } }
+{ 'struct': 'Bar', 'data': { 'string': 'str'}, 'bogus': { }, 'phony': { } }
-- 
2.26.3


