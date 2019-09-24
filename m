Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9FABCAAA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 16:54:13 +0200 (CEST)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCmCi-0005G0-0Q
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 10:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCks3-0000HE-4J
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCkrw-0001Tj-B8
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38484)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCkrv-0001SH-Kg
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 44453A26685;
 Tue, 24 Sep 2019 13:28:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC5C960C5E;
 Tue, 24 Sep 2019 13:28:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A439D1136420; Tue, 24 Sep 2019 15:28:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/25] qapi: Improve reporting of missing / unknown definition
 keys
Date: Tue, 24 Sep 2019 15:28:25 +0200
Message-Id: <20190924132830.15835-21-armbru@redhat.com>
In-Reply-To: <20190924132830.15835-1-armbru@redhat.com>
References: <20190924132830.15835-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Tue, 24 Sep 2019 13:28:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have check_exprs() call check_keys() later, so its error messages gain
an "in definition" line.

Both check_keys() and check_name_is_str() check the definition's name
is a string.  Since check_keys() now runs after check_name_is_str()
rather than before, its check is dead.  Bury it.  Checking values in
check_keys() is unclean anyway.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
index 4bfc007833..297b82db4c 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -905,8 +905,6 @@ def check_known_keys(value, info, source, required, o=
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
@@ -964,37 +962,18 @@ def check_exprs(exprs):
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
@@ -1008,20 +987,39 @@ def check_exprs(exprs):
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


