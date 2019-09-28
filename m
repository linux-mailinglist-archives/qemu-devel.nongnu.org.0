Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FDAC11EB
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Sep 2019 21:02:37 +0200 (CEST)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEHzH-0004Yx-HY
	for lists+qemu-devel@lfdr.de; Sat, 28 Sep 2019 15:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iEHdD-0008Uk-4U
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iEHd7-000404-Dc
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35692)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iEHd7-0003w3-1V
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DBDB53086208
 for <qemu-devel@nongnu.org>; Sat, 28 Sep 2019 18:39:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 850D45D9C3;
 Sat, 28 Sep 2019 18:39:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 739BF1136421; Sat, 28 Sep 2019 20:39:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/27] qapi: Improve reporting of missing / unknown definition
 keys
Date: Sat, 28 Sep 2019 20:39:28 +0200
Message-Id: <20190928183934.12459-22-armbru@redhat.com>
In-Reply-To: <20190928183934.12459-1-armbru@redhat.com>
References: <20190928183934.12459-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Sat, 28 Sep 2019 18:39:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have check_exprs() call check_keys() later, so its error messages gain
an "in definition" line.

Both check_keys() and check_name_is_str() check the definition's name
is a string.  Since check_keys() now runs after check_name_is_str()
rather than before, its check is dead.  Bury it.  Checking values in
check_keys() is unclean anyway.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190927134639.4284-21-armbru@redhat.com>
---
 scripts/qapi/common.py                  | 40 ++++++++++++-------------
 tests/qapi-schema/alternate-base.err    |  1 +
 tests/qapi-schema/bad-type-bool.err     |  2 +-
 tests/qapi-schema/bad-type-dict.err     |  2 +-
 tests/qapi-schema/double-type.err       |  1 +
 tests/qapi-schema/enum-missing-data.err |  1 +
 tests/qapi-schema/unknown-expr-key.err  |  1 +
 7 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 4f67b73684..42b9c2e36b 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -910,8 +910,6 @@ def check_known_keys(value, info, source, required, o=
ptional):
=20
 def check_keys(expr, info, meta, required, optional=3D[]):
     name =3D expr[meta]
-    if not isinstance(name, str):
-        raise QAPISemError(info, "'%s' key must have a string value" % m=
eta)
     required =3D required + [meta]
     source =3D "%s '%s'" % (meta, name)
     check_known_keys(expr, info, source, required, optional)
@@ -969,37 +967,18 @@ def check_exprs(exprs):
=20
         if 'enum' in expr:
             meta =3D 'enum'
-            check_keys(expr, info, 'enum', ['data'], ['if', 'prefix'])
-            normalize_enum(expr)
         elif 'union' in expr:
             meta =3D 'union'
-            check_keys(expr, info, 'union', ['data'],
-                       ['base', 'discriminator', 'if'])
-            normalize_members(expr.get('base'))
-            normalize_members(expr['data'])
         elif 'alternate' in expr:
             meta =3D 'alternate'
-            check_keys(expr, info, 'alternate', ['data'], ['if'])
-            normalize_members(expr['data'])
         elif 'struct' in expr:
             meta =3D 'struct'
-            check_keys(expr, info, 'struct', ['data'],
-                       ['base', 'if', 'features'])
-            normalize_members(expr['data'])
-            normalize_features(expr.get('features'))
         elif 'command' in expr:
             meta =3D 'command'
-            check_keys(expr, info, 'command', [],
-                       ['data', 'returns', 'gen', 'success-response',
-                        'boxed', 'allow-oob', 'allow-preconfig', 'if'])
-            normalize_members(expr.get('data'))
         elif 'event' in expr:
             meta =3D 'event'
-            check_keys(expr, info, 'event', [], ['data', 'boxed', 'if'])
-            normalize_members(expr.get('data'))
         else:
             raise QAPISemError(info, "expression is missing metatype")
-        normalize_if(expr)
=20
         name =3D expr[meta]
         check_name_is_str(name, info, "'%s'" % meta)
@@ -1013,20 +992,39 @@ def check_exprs(exprs):
                 % (name, doc.symbol))
=20
         if meta =3D=3D 'enum':
+            check_keys(expr, info, 'enum', ['data'], ['if', 'prefix'])
+            normalize_enum(expr)
             check_enum(expr, info)
         elif meta =3D=3D 'union':
+            check_keys(expr, info, 'union', ['data'],
+                       ['base', 'discriminator', 'if'])
+            normalize_members(expr.get('base'))
+            normalize_members(expr['data'])
             check_union(expr, info)
         elif meta =3D=3D 'alternate':
+            check_keys(expr, info, 'alternate', ['data'], ['if'])
+            normalize_members(expr['data'])
             check_alternate(expr, info)
         elif meta =3D=3D 'struct':
+            check_keys(expr, info, 'struct', ['data'],
+                       ['base', 'if', 'features'])
+            normalize_members(expr['data'])
+            normalize_features(expr.get('features'))
             check_struct(expr, info)
         elif meta =3D=3D 'command':
+            check_keys(expr, info, 'command', [],
+                       ['data', 'returns', 'gen', 'success-response',
+                        'boxed', 'allow-oob', 'allow-preconfig', 'if'])
+            normalize_members(expr.get('data'))
             check_command(expr, info)
         elif meta =3D=3D 'event':
+            check_keys(expr, info, 'event', [], ['data', 'boxed', 'if'])
+            normalize_members(expr.get('data'))
             check_event(expr, info)
         else:
             assert False, 'unexpected meta type'
=20
+        normalize_if(expr)
         check_if(expr, info)
         check_flags(expr, info)
=20
diff --git a/tests/qapi-schema/alternate-base.err b/tests/qapi-schema/alt=
ernate-base.err
index 4c9158db02..6290665ac2 100644
--- a/tests/qapi-schema/alternate-base.err
+++ b/tests/qapi-schema/alternate-base.err
@@ -1,2 +1,3 @@
+tests/qapi-schema/alternate-base.json: In alternate 'Alt':
 tests/qapi-schema/alternate-base.json:4: unknown key 'base' in alternate=
 'Alt'
 Valid keys are 'alternate', 'data', 'if'.
diff --git a/tests/qapi-schema/bad-type-bool.err b/tests/qapi-schema/bad-=
type-bool.err
index 62fd70baaf..984a77c4e3 100644
--- a/tests/qapi-schema/bad-type-bool.err
+++ b/tests/qapi-schema/bad-type-bool.err
@@ -1 +1 @@
-tests/qapi-schema/bad-type-bool.json:2: 'struct' key must have a string =
value
+tests/qapi-schema/bad-type-bool.json:2: 'struct' requires a string name
diff --git a/tests/qapi-schema/bad-type-dict.err b/tests/qapi-schema/bad-=
type-dict.err
index 0b2a2aeac4..e83b8cfb41 100644
--- a/tests/qapi-schema/bad-type-dict.err
+++ b/tests/qapi-schema/bad-type-dict.err
@@ -1 +1 @@
-tests/qapi-schema/bad-type-dict.json:2: 'command' key must have a string=
 value
+tests/qapi-schema/bad-type-dict.json:2: 'command' requires a string name
diff --git a/tests/qapi-schema/double-type.err b/tests/qapi-schema/double=
-type.err
index 44a9dfdd55..ddb22af638 100644
--- a/tests/qapi-schema/double-type.err
+++ b/tests/qapi-schema/double-type.err
@@ -1,2 +1,3 @@
+tests/qapi-schema/double-type.json: In struct 'bar':
 tests/qapi-schema/double-type.json:2: unknown key 'command' in struct 'b=
ar'
 Valid keys are 'base', 'data', 'features', 'if', 'struct'.
diff --git a/tests/qapi-schema/enum-missing-data.err b/tests/qapi-schema/=
enum-missing-data.err
index 3c3c52d037..ffde1082c3 100644
--- a/tests/qapi-schema/enum-missing-data.err
+++ b/tests/qapi-schema/enum-missing-data.err
@@ -1 +1,2 @@
+tests/qapi-schema/enum-missing-data.json: In enum 'MyEnum':
 tests/qapi-schema/enum-missing-data.json:2: key 'data' is missing from e=
num 'MyEnum'
diff --git a/tests/qapi-schema/unknown-expr-key.err b/tests/qapi-schema/u=
nknown-expr-key.err
index 07558edb78..e401efe148 100644
--- a/tests/qapi-schema/unknown-expr-key.err
+++ b/tests/qapi-schema/unknown-expr-key.err
@@ -1,2 +1,3 @@
+tests/qapi-schema/unknown-expr-key.json: In struct 'bar':
 tests/qapi-schema/unknown-expr-key.json:2: unknown keys 'bogus', 'phony'=
 in struct 'bar'
 Valid keys are 'base', 'data', 'features', 'if', 'struct'.
--=20
2.21.0


