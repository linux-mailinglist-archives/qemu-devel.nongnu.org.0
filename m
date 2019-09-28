Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3773CC11EF
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Sep 2019 21:07:08 +0200 (CEST)
Received: from localhost ([::1]:34584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEI3f-0002O2-6o
	for lists+qemu-devel@lfdr.de; Sat, 28 Sep 2019 15:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iEHdD-0008VL-O5
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iEHd7-00040Q-Gr
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41676)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iEHd7-0003wC-2h
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E504E305B41C
 for <qemu-devel@nongnu.org>; Sat, 28 Sep 2019 18:39:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90BAD60852;
 Sat, 28 Sep 2019 18:39:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7EA081136424; Sat, 28 Sep 2019 20:39:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/27] qapi: Eliminate check_keys(), rename check_known_keys()
Date: Sat, 28 Sep 2019 20:39:31 +0200
Message-Id: <20190928183934.12459-25-armbru@redhat.com>
In-Reply-To: <20190928183934.12459-1-armbru@redhat.com>
References: <20190928183934.12459-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Sat, 28 Sep 2019 18:39:39 +0000 (UTC)
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

check_keys() has become a trivial wrapper for check_known_keys().
Eliminate it.

This makes its name available.  Rename check_known_keys().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190927134639.4284-24-armbru@redhat.com>
---
 scripts/qapi/common.py | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 4bc8c807aa..fa354b3f1e 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -756,7 +756,7 @@ def check_type(value, info, source,
                        allow_optional=3DTrue, permit_upper=3Dpermit_uppe=
r)
         if c_name(key, False) =3D=3D 'u' or c_name(key, False).startswit=
h('has_'):
             raise QAPISemError(info, "%s uses reserved name" % key_sourc=
e)
-        check_known_keys(arg, info, key_source, ['type'], ['if'])
+        check_keys(arg, info, key_source, ['type'], ['if'])
         check_if(arg, info, key_source)
         normalize_if(arg)
         check_type(arg['type'], info, key_source, allow_array=3DTrue)
@@ -800,7 +800,7 @@ def check_union(expr, info):
     for (key, value) in members.items():
         source =3D "'data' member '%s'" % key
         check_name_str(key, info, source)
-        check_known_keys(value, info, source, ['type'], ['if'])
+        check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
         normalize_if(value)
         check_type(value['type'], info, source, allow_array=3Dnot base)
@@ -814,7 +814,7 @@ def check_alternate(expr, info):
     for (key, value) in members.items():
         source =3D "'data' member '%s'" % key
         check_name_str(key, info, source)
-        check_known_keys(value, info, source, ['type'], ['if'])
+        check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
         normalize_if(value)
         check_type(value['type'], info, source)
@@ -834,7 +834,7 @@ def check_enum(expr, info):
=20
     for member in members:
         source =3D "'data' member"
-        check_known_keys(member, info, source, ['name'], ['if'])
+        check_keys(member, info, source, ['name'], ['if'])
         check_name_is_str(member['name'], info, source)
         source =3D "%s '%s'" % (source, member['name'])
         check_name_str(member['name'], info, source,
@@ -857,7 +857,7 @@ def check_struct(expr, info):
         for f in features:
             source =3D "'features' member"
             assert isinstance(f, dict)
-            check_known_keys(f, info, source, ['name'], ['if'])
+            check_keys(f, info, source, ['name'], ['if'])
             check_name_is_str(f['name'], info, source)
             source =3D "%s '%s'" % (source, f['name'])
             check_name_str(f['name'], info, source)
@@ -865,7 +865,7 @@ def check_struct(expr, info):
             normalize_if(f)
=20
=20
-def check_known_keys(value, info, source, required, optional):
+def check_keys(value, info, source, required, optional):
=20
     def pprint(elems):
         return ', '.join("'" + e + "'" for e in sorted(elems))
@@ -887,10 +887,6 @@ def check_known_keys(value, info, source, required, =
optional):
                pprint(unknown), pprint(allowed)))
=20
=20
-def check_keys(expr, info, meta, required, optional=3D[]):
-    check_known_keys(expr, info, meta, required + [meta], optional)
-
-
 def check_flags(expr, info):
     for key in ['gen', 'success-response']:
         if key in expr and expr[key] is not False:
@@ -966,33 +962,39 @@ def check_exprs(exprs):
                 info, "documentation comment is for '%s'" % doc.symbol)
=20
         if meta =3D=3D 'enum':
-            check_keys(expr, info, 'enum', ['data'], ['if', 'prefix'])
+            check_keys(expr, info, meta,
+                       ['enum', 'data'], ['if', 'prefix'])
             normalize_enum(expr)
             check_enum(expr, info)
         elif meta =3D=3D 'union':
-            check_keys(expr, info, 'union', ['data'],
+            check_keys(expr, info, meta,
+                       ['union', 'data'],
                        ['base', 'discriminator', 'if'])
             normalize_members(expr.get('base'))
             normalize_members(expr['data'])
             check_union(expr, info)
         elif meta =3D=3D 'alternate':
-            check_keys(expr, info, 'alternate', ['data'], ['if'])
+            check_keys(expr, info, meta,
+                       ['alternate', 'data'], ['if'])
             normalize_members(expr['data'])
             check_alternate(expr, info)
         elif meta =3D=3D 'struct':
-            check_keys(expr, info, 'struct', ['data'],
-                       ['base', 'if', 'features'])
+            check_keys(expr, info, meta,
+                       ['struct', 'data'], ['base', 'if', 'features'])
             normalize_members(expr['data'])
             normalize_features(expr.get('features'))
             check_struct(expr, info)
         elif meta =3D=3D 'command':
-            check_keys(expr, info, 'command', [],
-                       ['data', 'returns', 'gen', 'success-response',
-                        'boxed', 'allow-oob', 'allow-preconfig', 'if'])
+            check_keys(expr, info, meta,
+                       ['command'],
+                       ['data', 'returns', 'boxed', 'if',
+                        'gen', 'success-response', 'allow-oob',
+                        'allow-preconfig'])
             normalize_members(expr.get('data'))
             check_command(expr, info)
         elif meta =3D=3D 'event':
-            check_keys(expr, info, 'event', [], ['data', 'boxed', 'if'])
+            check_keys(expr, info, meta,
+                       ['event'], ['data', 'boxed', 'if'])
             normalize_members(expr.get('data'))
             check_event(expr, info)
         else:
--=20
2.21.0


