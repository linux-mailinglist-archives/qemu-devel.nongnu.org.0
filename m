Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7144408F49
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:42:01 +0200 (CEST)
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmDg-00086k-Ne
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFc-0000Sa-5n
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFV-0000jd-12
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lv2S7KscXdOTESDcY4Ql+nkRxpdCaDGlJx8vGnsfLiM=;
 b=Znc5yhOpC1i/YMLnTOLEmJLSxtq5PKjfVbOlyla+p5xbtan34zsUj7G/JWwGHuKjWS6Byd
 lEnbnb3FSw49qWkzQzYCn7l3nzQUYVDIAZWU+3O6PQZ+8KD/Pc3MQ53q7acWjlaTSYymIg
 G4aSmQFm2ge0ev/H/z1QiIFiBOQTnYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-lqc2i7fhPuy_AOgkhcRFZA-1; Mon, 13 Sep 2021 08:39:45 -0400
X-MC-Unique: lqc2i7fhPuy_AOgkhcRFZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A64780006E
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:39:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4D825D9CA;
 Mon, 13 Sep 2021 12:39:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4FC8211380D0; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/22] tests/qapi-schema: Purge simple unions from tests
Date: Mon, 13 Sep 2021 14:39:30 +0200
Message-Id: <20210913123932.3306639-21-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: jsnow@redhat.com, eblake@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop tests that are specifically about simple unions:

* SugaredUnion in doc-good: flat unions are covered by @Object.

* union-branch-case and union-clash-branches: branch naming for flat
  unions is enforced for the tag enum instead, which is covered by
  enum-member-case and enum-clash-member.

* union-empty: empty flat unions are covered by flat-union-empty.

Rewrite the remainder to use flat unions: args-union, bad-base,
flat-union-base-union, union-branch-invalid-dict, union-unknown.

Except drop union-optional-branch. because converting this one is not
worth the trouble; we don't explicitly check names beginning with '*'
in other places, either.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/args-union.err              |  2 +-
 tests/qapi-schema/args-union.json             |  8 ++++++-
 tests/qapi-schema/bad-base.err                |  2 +-
 tests/qapi-schema/bad-base.json               |  8 ++++++-
 tests/qapi-schema/doc-good.json               |  9 --------
 tests/qapi-schema/doc-good.out                | 22 -------------------
 tests/qapi-schema/doc-good.txt                | 20 -----------------
 tests/qapi-schema/flat-union-base-union.err   |  2 +-
 tests/qapi-schema/flat-union-base-union.json  |  3 +++
 tests/qapi-schema/meson.build                 |  4 ----
 tests/qapi-schema/union-branch-case.err       |  2 --
 tests/qapi-schema/union-branch-case.json      |  2 --
 tests/qapi-schema/union-branch-case.out       |  0
 .../qapi-schema/union-branch-invalid-dict.err |  2 +-
 .../union-branch-invalid-dict.json            |  4 ++++
 tests/qapi-schema/union-clash-branches.err    |  2 --
 tests/qapi-schema/union-clash-branches.json   |  7 ------
 tests/qapi-schema/union-clash-branches.out    |  0
 tests/qapi-schema/union-empty.err             |  2 --
 tests/qapi-schema/union-empty.json            |  2 --
 tests/qapi-schema/union-empty.out             |  0
 tests/qapi-schema/union-optional-branch.err   |  2 --
 tests/qapi-schema/union-optional-branch.json  |  2 --
 tests/qapi-schema/union-optional-branch.out   |  0
 tests/qapi-schema/union-unknown.err           |  2 +-
 tests/qapi-schema/union-unknown.json          |  5 ++++-
 26 files changed, 30 insertions(+), 84 deletions(-)
 delete mode 100644 tests/qapi-schema/union-branch-case.err
 delete mode 100644 tests/qapi-schema/union-branch-case.json
 delete mode 100644 tests/qapi-schema/union-branch-case.out
 delete mode 100644 tests/qapi-schema/union-clash-branches.err
 delete mode 100644 tests/qapi-schema/union-clash-branches.json
 delete mode 100644 tests/qapi-schema/union-clash-branches.out
 delete mode 100644 tests/qapi-schema/union-empty.err
 delete mode 100644 tests/qapi-schema/union-empty.json
 delete mode 100644 tests/qapi-schema/union-empty.out
 delete mode 100644 tests/qapi-schema/union-optional-branch.err
 delete mode 100644 tests/qapi-schema/union-optional-branch.json
 delete mode 100644 tests/qapi-schema/union-optional-branch.out

diff --git a/tests/qapi-schema/args-union.err b/tests/qapi-schema/args-union.err
index 4bf4955027..4b80a99f74 100644
--- a/tests/qapi-schema/args-union.err
+++ b/tests/qapi-schema/args-union.err
@@ -1,2 +1,2 @@
 args-union.json: In command 'oops':
-args-union.json:3: command's 'data' can take union type 'Uni' only with 'boxed': true
+args-union.json:9: command's 'data' can take union type 'Uni' only with 'boxed': true
diff --git a/tests/qapi-schema/args-union.json b/tests/qapi-schema/args-union.json
index 2fcaeaae16..aabb159063 100644
--- a/tests/qapi-schema/args-union.json
+++ b/tests/qapi-schema/args-union.json
@@ -1,3 +1,9 @@
 # use of union arguments requires 'boxed':true
-{ 'union': 'Uni', 'data': { 'case1': 'int', 'case2': 'str' } }
+{ 'enum': 'Enum', 'data': [ 'case1', 'case2' ] }
+{ 'struct': 'Case1', 'data': { 'data': 'int' } }
+{ 'struct': 'Case2', 'data': { 'data': 'str' } }
+{ 'union': 'Uni',
+  'base': { 'type': 'Enum' },
+  'discriminator': 'type',
+  'data': { 'case1': 'Case1', 'case2': 'Case2' } }
 { 'command': 'oops', 'data': 'Uni' }
diff --git a/tests/qapi-schema/bad-base.err b/tests/qapi-schema/bad-base.err
index 61a1efc2c0..1fad63e392 100644
--- a/tests/qapi-schema/bad-base.err
+++ b/tests/qapi-schema/bad-base.err
@@ -1,2 +1,2 @@
 bad-base.json: In struct 'MyType':
-bad-base.json:3: 'base' requires a struct type, union type 'Union' isn't
+bad-base.json:9: 'base' requires a struct type, union type 'Union' isn't
diff --git a/tests/qapi-schema/bad-base.json b/tests/qapi-schema/bad-base.json
index a634331cdd..8c773ff544 100644
--- a/tests/qapi-schema/bad-base.json
+++ b/tests/qapi-schema/bad-base.json
@@ -1,3 +1,9 @@
 # we reject a base that is not a struct
-{ 'union': 'Union', 'data': { 'a': 'int', 'b': 'str' } }
+{ 'enum': 'Enum', 'data': [ 'a', 'b' ] }
+{ 'struct': 'Int', 'data': { 'data': 'int' } }
+{ 'struct': 'Str', 'data': { 'data': 'str' } }
+{ 'union': 'Union',
+  'base': { 'type': 'Enum' },
+  'discriminator': 'type',
+  'data': { 'a': 'Int', 'b': 'Str' } }
 { 'struct': 'MyType', 'base': 'Union', 'data': { 'c': 'int' } }
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index cbf5c56c4b..a20acffd8b 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -107,15 +107,6 @@
             'two': { 'type': 'Variant2',
                      'if': { 'any': ['IFONE', 'IFTWO'] } } } }
 
-##
-# @SugaredUnion:
-# Features:
-# @union-feat2: a feature
-##
-{ 'union': 'SugaredUnion',
-  'features': [ 'union-feat2' ],
-  'data': { 'one': 'Variant1', 'two': { 'type': 'Variant2', 'if': 'IFTWO' } } }
-
 ##
 # @Alternate:
 # @i: an integer
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 478fe6f82e..5a324e2627 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -32,21 +32,6 @@ object Object
     case two: Variant2
         if {'any': ['IFONE', 'IFTWO']}
     feature union-feat1
-object q_obj_Variant1-wrapper
-    member data: Variant1 optional=False
-object q_obj_Variant2-wrapper
-    member data: Variant2 optional=False
-enum SugaredUnionKind
-    member one
-    member two
-        if IFTWO
-object SugaredUnion
-    member type: SugaredUnionKind optional=False
-    tag type
-    case one: q_obj_Variant1-wrapper
-    case two: q_obj_Variant2-wrapper
-        if IFTWO
-    feature union-feat2
 alternate Alternate
     tag type
     case i: int
@@ -149,13 +134,6 @@ doc symbol=Object
 
     feature=union-feat1
 a feature
-doc symbol=SugaredUnion
-    body=
-
-    arg=type
-
-    feature=union-feat2
-a feature
 doc symbol=Alternate
     body=
 
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 0c59d75964..701402ee5e 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -130,26 +130,6 @@ Features
    a feature
 
 
-"SugaredUnion" (Object)
------------------------
-
-
-Members
-~~~~~~~
-
-"type"
-   One of "one", "two"
-
-"data": "Variant1" when "type" is ""one""
-"data": "Variant2" when "type" is ""two"" (**If: **"IFTWO")
-
-Features
-~~~~~~~~
-
-"union-feat2"
-   a feature
-
-
 "Alternate" (Alternate)
 -----------------------
 
diff --git a/tests/qapi-schema/flat-union-base-union.err b/tests/qapi-schema/flat-union-base-union.err
index 3b0087220e..3563e8777e 100644
--- a/tests/qapi-schema/flat-union-base-union.err
+++ b/tests/qapi-schema/flat-union-base-union.err
@@ -1,2 +1,2 @@
 flat-union-base-union.json: In union 'TestUnion':
-flat-union-base-union.json:14: 'base' requires a struct type, union type 'UnionBase' isn't
+flat-union-base-union.json:17: 'base' requires a struct type, union type 'UnionBase' isn't
diff --git a/tests/qapi-schema/flat-union-base-union.json b/tests/qapi-schema/flat-union-base-union.json
index 98b4eba181..82d4c96e57 100644
--- a/tests/qapi-schema/flat-union-base-union.json
+++ b/tests/qapi-schema/flat-union-base-union.json
@@ -8,7 +8,10 @@
   'data': { 'string': 'str' } }
 { 'struct': 'TestTypeB',
   'data': { 'integer': 'int' } }
+{ 'enum': 'Enum', 'data': [ 'kind1', 'kind2' ] }
 { 'union': 'UnionBase',
+  'base': { 'type': 'Enum' },
+  'discriminator': 'type',
   'data': { 'kind1': 'TestTypeA',
             'kind2': 'TestTypeB' } }
 { 'union': 'TestUnion',
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 0798e94042..85d3de1481 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -192,14 +192,10 @@ schemas = [
   'unclosed-string.json',
   'union-base-empty.json',
   'union-base-no-discriminator.json',
-  'union-branch-case.json',
   'union-branch-if-invalid.json',
   'union-branch-invalid-dict.json',
-  'union-clash-branches.json',
-  'union-empty.json',
   'union-invalid-base.json',
   'union-invalid-data.json',
-  'union-optional-branch.json',
   'union-unknown.json',
   'unknown-escape.json',
   'unknown-expr-key.json',
diff --git a/tests/qapi-schema/union-branch-case.err b/tests/qapi-schema/union-branch-case.err
deleted file mode 100644
index d2d5cb8993..0000000000
--- a/tests/qapi-schema/union-branch-case.err
+++ /dev/null
@@ -1,2 +0,0 @@
-union-branch-case.json: In union 'Uni':
-union-branch-case.json:2: name of 'data' member 'Branch' must not use uppercase or '_'
diff --git a/tests/qapi-schema/union-branch-case.json b/tests/qapi-schema/union-branch-case.json
deleted file mode 100644
index b7894b75d6..0000000000
--- a/tests/qapi-schema/union-branch-case.json
+++ /dev/null
@@ -1,2 +0,0 @@
-# Branch names should be 'lower-case'
-{ 'union': 'Uni', 'data': { 'Branch': 'int' } }
diff --git a/tests/qapi-schema/union-branch-case.out b/tests/qapi-schema/union-branch-case.out
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/tests/qapi-schema/union-branch-invalid-dict.err b/tests/qapi-schema/union-branch-invalid-dict.err
index 8137c5a767..001cdec069 100644
--- a/tests/qapi-schema/union-branch-invalid-dict.err
+++ b/tests/qapi-schema/union-branch-invalid-dict.err
@@ -1,2 +1,2 @@
 union-branch-invalid-dict.json: In union 'UnionInvalidBranch':
-union-branch-invalid-dict.json:2: 'data' member 'integer' misses key 'type'
+union-branch-invalid-dict.json:4: 'data' member 'integer' misses key 'type'
diff --git a/tests/qapi-schema/union-branch-invalid-dict.json b/tests/qapi-schema/union-branch-invalid-dict.json
index 9778598dbd..c7c81c0e00 100644
--- a/tests/qapi-schema/union-branch-invalid-dict.json
+++ b/tests/qapi-schema/union-branch-invalid-dict.json
@@ -1,4 +1,8 @@
 # Long form of member must have a value member 'type'
+{ 'enum': 'TestEnum',
+  'data': [ 'integer', 's8' ] }
 { 'union': 'UnionInvalidBranch',
+  'base': { 'type': 'TestEnum' },
+  'discriminator': 'type',
   'data': { 'integer': { 'if': 'foo'},
             's8': 'int8' } }
diff --git a/tests/qapi-schema/union-clash-branches.err b/tests/qapi-schema/union-clash-branches.err
deleted file mode 100644
index ef53645728..0000000000
--- a/tests/qapi-schema/union-clash-branches.err
+++ /dev/null
@@ -1,2 +0,0 @@
-union-clash-branches.json: In union 'TestUnion':
-union-clash-branches.json:6: name of 'data' member 'a_b' must not use uppercase or '_'
diff --git a/tests/qapi-schema/union-clash-branches.json b/tests/qapi-schema/union-clash-branches.json
deleted file mode 100644
index 7bdda0b0da..0000000000
--- a/tests/qapi-schema/union-clash-branches.json
+++ /dev/null
@@ -1,7 +0,0 @@
-# Union branch name collision
-# Naming rules make collision impossible (even with the pragma).  If
-# that wasn't the case, then we'd get collisions in generated C: two
-# union members a_b, and two enum members TEST_UNION_A_B.
-{ 'pragma': { 'member-name-exceptions': [ 'TestUnion' ] } }
-{ 'union': 'TestUnion',
-  'data': { 'a-b': 'int', 'a_b': 'str' } }
diff --git a/tests/qapi-schema/union-clash-branches.out b/tests/qapi-schema/union-clash-branches.out
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/tests/qapi-schema/union-empty.err b/tests/qapi-schema/union-empty.err
deleted file mode 100644
index 59788c94ce..0000000000
--- a/tests/qapi-schema/union-empty.err
+++ /dev/null
@@ -1,2 +0,0 @@
-union-empty.json: In union 'Union':
-union-empty.json:2: union has no branches
diff --git a/tests/qapi-schema/union-empty.json b/tests/qapi-schema/union-empty.json
deleted file mode 100644
index df3e5e639a..0000000000
--- a/tests/qapi-schema/union-empty.json
+++ /dev/null
@@ -1,2 +0,0 @@
-# simple unions cannot be empty
-{ 'union': 'Union', 'data': { } }
diff --git a/tests/qapi-schema/union-empty.out b/tests/qapi-schema/union-empty.out
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/tests/qapi-schema/union-optional-branch.err b/tests/qapi-schema/union-optional-branch.err
deleted file mode 100644
index b33f111de4..0000000000
--- a/tests/qapi-schema/union-optional-branch.err
+++ /dev/null
@@ -1,2 +0,0 @@
-union-optional-branch.json: In union 'Union':
-union-optional-branch.json:2: 'data' member '*a' has an invalid name
diff --git a/tests/qapi-schema/union-optional-branch.json b/tests/qapi-schema/union-optional-branch.json
deleted file mode 100644
index 591615fc68..0000000000
--- a/tests/qapi-schema/union-optional-branch.json
+++ /dev/null
@@ -1,2 +0,0 @@
-# union branches cannot be optional
-{ 'union': 'Union', 'data': { '*a': 'int', 'b': 'str' } }
diff --git a/tests/qapi-schema/union-optional-branch.out b/tests/qapi-schema/union-optional-branch.out
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/tests/qapi-schema/union-unknown.err b/tests/qapi-schema/union-unknown.err
index 7aba9f94da..dad79beae0 100644
--- a/tests/qapi-schema/union-unknown.err
+++ b/tests/qapi-schema/union-unknown.err
@@ -1,2 +1,2 @@
 union-unknown.json: In union 'Union':
-union-unknown.json:2: union uses unknown type 'MissingType'
+union-unknown.json:3: branch 'unknown' uses unknown type 'MissingType'
diff --git a/tests/qapi-schema/union-unknown.json b/tests/qapi-schema/union-unknown.json
index 64d3666176..4736f1ab08 100644
--- a/tests/qapi-schema/union-unknown.json
+++ b/tests/qapi-schema/union-unknown.json
@@ -1,3 +1,6 @@
 # we reject a union with unknown type in branch
+{ 'enum': 'Enum', 'data': [ 'unknown' ] }
 { 'union': 'Union',
-  'data': { 'unknown': ['MissingType'] } }
+  'base': { 'type': 'Enum' },
+  'discriminator': 'type',
+  'data': { 'unknown': 'MissingType' } }
-- 
2.31.1


