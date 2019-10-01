Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901B3C40E2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 21:20:53 +0200 (CEST)
Received: from localhost ([::1]:46930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFNhb-0006Wk-Ji
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 15:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iFNcL-0004SW-Uy
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:15:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iFNcK-0003Km-6R
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:15:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iFNcJ-0003KC-TB
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:15:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 00BA2308A9E2;
 Tue,  1 Oct 2019 19:15:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 557E460C5D;
 Tue,  1 Oct 2019 19:15:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 160C71138606; Tue,  1 Oct 2019 21:15:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] qapi: Move gen_enum(),
 gen_enum_lookup() back to qapi/types.py
Date: Tue,  1 Oct 2019 21:15:12 +0200
Message-Id: <20191001191514.11208-6-armbru@redhat.com>
In-Reply-To: <20191001191514.11208-1-armbru@redhat.com>
References: <20191001191514.11208-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 01 Oct 2019 19:15:23 +0000 (UTC)
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
Cc: marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next commit will split up qapi/common.py.  gen_enum() needs
QAPISchemaEnumMember, and that's in the way.  Move it to qapi/types.py
along with its buddy gen_enum_lookup().

Permit me a short a digression on history: how did gen_enum() end up
in qapi/common.py?  Commit 21cd70dfc1 "qapi script: add event support"
duplicated qapi-types.py's gen_enum() and gen_enum_lookup() in
qapi-event.py.  Simply importing them would have been cleaner, but
wasn't possible as qapi-types.py was a program, not a module.  Commit
efd2eaa6c2 "qapi: De-duplicate enum code generation" de-duplicated by
moving them to qapi.py, which was a module.

Since then, program qapi-types.py has morphed into module types.py.
It's where gen_enum() and gen_enum_lookup() started, and where they
belong.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 59 ------------------------------------------
 scripts/qapi/events.py |  1 +
 scripts/qapi/types.py  | 59 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 59 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 9d5c05f6a1..306857f0c0 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -2239,65 +2239,6 @@ def _wrap_ifcond(ifcond, before, after):
     return out
=20
=20
-def gen_enum_lookup(name, members, prefix=3DNone):
-    ret =3D mcgen('''
-
-const QEnumLookup %(c_name)s_lookup =3D {
-    .array =3D (const char *const[]) {
-''',
-                c_name=3Dc_name(name))
-    for m in members:
-        ret +=3D gen_if(m.ifcond)
-        index =3D c_enum_const(name, m.name, prefix)
-        ret +=3D mcgen('''
-        [%(index)s] =3D "%(name)s",
-''',
-                     index=3Dindex, name=3Dm.name)
-        ret +=3D gen_endif(m.ifcond)
-
-    ret +=3D mcgen('''
-    },
-    .size =3D %(max_index)s
-};
-''',
-                 max_index=3Dc_enum_const(name, '_MAX', prefix))
-    return ret
-
-
-def gen_enum(name, members, prefix=3DNone):
-    # append automatically generated _MAX value
-    enum_members =3D members + [QAPISchemaEnumMember('_MAX', None)]
-
-    ret =3D mcgen('''
-
-typedef enum %(c_name)s {
-''',
-                c_name=3Dc_name(name))
-
-    for m in enum_members:
-        ret +=3D gen_if(m.ifcond)
-        ret +=3D mcgen('''
-    %(c_enum)s,
-''',
-                     c_enum=3Dc_enum_const(name, m.name, prefix))
-        ret +=3D gen_endif(m.ifcond)
-
-    ret +=3D mcgen('''
-} %(c_name)s;
-''',
-                 c_name=3Dc_name(name))
-
-    ret +=3D mcgen('''
-
-#define %(c_name)s_str(val) \\
-    qapi_enum_lookup(&%(c_name)s_lookup, (val))
-
-extern const QEnumLookup %(c_name)s_lookup;
-''',
-                 c_name=3Dc_name(name))
-    return ret
-
-
 def build_params(arg_type, boxed, extra=3DNone):
     ret =3D ''
     sep =3D ''
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 7308e8e589..a716a1d27f 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -13,6 +13,7 @@ See the COPYING file in the top-level directory.
 """
=20
 from qapi.common import *
+from qapi.types import gen_enum, gen_enum_lookup
=20
=20
 def build_event_send_proto(name, arg_type, boxed):
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 3edd9374aa..711543147d 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -21,6 +21,65 @@ from qapi.common import *
 objects_seen =3D set()
=20
=20
+def gen_enum_lookup(name, members, prefix=3DNone):
+    ret =3D mcgen('''
+
+const QEnumLookup %(c_name)s_lookup =3D {
+    .array =3D (const char *const[]) {
+''',
+                c_name=3Dc_name(name))
+    for m in members:
+        ret +=3D gen_if(m.ifcond)
+        index =3D c_enum_const(name, m.name, prefix)
+        ret +=3D mcgen('''
+        [%(index)s] =3D "%(name)s",
+''',
+                     index=3Dindex, name=3Dm.name)
+        ret +=3D gen_endif(m.ifcond)
+
+    ret +=3D mcgen('''
+    },
+    .size =3D %(max_index)s
+};
+''',
+                 max_index=3Dc_enum_const(name, '_MAX', prefix))
+    return ret
+
+
+def gen_enum(name, members, prefix=3DNone):
+    # append automatically generated _MAX value
+    enum_members =3D members + [QAPISchemaEnumMember('_MAX', None)]
+
+    ret =3D mcgen('''
+
+typedef enum %(c_name)s {
+''',
+                c_name=3Dc_name(name))
+
+    for m in enum_members:
+        ret +=3D gen_if(m.ifcond)
+        ret +=3D mcgen('''
+    %(c_enum)s,
+''',
+                     c_enum=3Dc_enum_const(name, m.name, prefix))
+        ret +=3D gen_endif(m.ifcond)
+
+    ret +=3D mcgen('''
+} %(c_name)s;
+''',
+                 c_name=3Dc_name(name))
+
+    ret +=3D mcgen('''
+
+#define %(c_name)s_str(val) \\
+    qapi_enum_lookup(&%(c_name)s_lookup, (val))
+
+extern const QEnumLookup %(c_name)s_lookup;
+''',
+                 c_name=3Dc_name(name))
+    return ret
+
+
 def gen_fwd_object_or_array(name):
     return mcgen('''
=20
--=20
2.21.0


