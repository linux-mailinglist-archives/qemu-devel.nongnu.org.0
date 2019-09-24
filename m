Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B753ABC820
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 14:47:15 +0200 (CEST)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCkDp-0002g1-NU
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 08:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCk0k-0001IX-CG
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCk0h-0006te-AQ
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37008)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCk0g-0006sR-Oj
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0A66410CC1EE
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 12:33:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A72695D9DC;
 Tue, 24 Sep 2019 12:33:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 813F211385D4; Tue, 24 Sep 2019 14:33:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/37] qapi: Permit alternates with just one branch
Date: Tue, 24 Sep 2019 14:33:08 +0200
Message-Id: <20190924123334.30645-12-armbru@redhat.com>
In-Reply-To: <20190924123334.30645-1-armbru@redhat.com>
References: <20190924123334.30645-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 24 Sep 2019 12:33:38 +0000 (UTC)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A union or alternate without branches makes no sense and doesn't work:
it can't be instantiated.  A union or alternate with just one branch
works, but is degenerate.  We accept the former, but reject the
latter.  Weird.  docs/devel/qapi-code-gen.txt doesn't mention the
difference.  It claims an alternate definition is "is similar to a
simple union type".

Permit degenerate alternates to make them consistent with unions.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190913201349.24332-10-armbru@redhat.com>
---
 scripts/qapi/common.py                  | 6 ++----
 tests/qapi-schema/alternate-empty.err   | 2 +-
 tests/qapi-schema/alternate-empty.json  | 4 ++--
 tests/qapi-schema/qapi-schema-test.json | 4 +++-
 tests/qapi-schema/qapi-schema-test.out  | 6 ++++--
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index c5c71287c3..99db18f3d6 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -920,11 +920,9 @@ def check_alternate(expr, info):
     members =3D expr['data']
     types_seen =3D {}
=20
-    # Check every branch; require at least two branches
-    if len(members) < 2:
+    if len(members) =3D=3D 0:
         raise QAPISemError(info,
-                           "Alternate '%s' should have at least two bran=
ches "
-                           "in 'data'" % name)
+                           "Alternate '%s' cannot have empty 'data'" % n=
ame)
     for (key, value) in members.items():
         check_name(info, "Member of alternate '%s'" % name, key)
         check_known_keys(info,
diff --git a/tests/qapi-schema/alternate-empty.err b/tests/qapi-schema/al=
ternate-empty.err
index bb06c5bfec..86dbc666eb 100644
--- a/tests/qapi-schema/alternate-empty.err
+++ b/tests/qapi-schema/alternate-empty.err
@@ -1 +1 @@
-tests/qapi-schema/alternate-empty.json:2: Alternate 'Alt' should have at=
 least two branches in 'data'
+tests/qapi-schema/alternate-empty.json:2: Alternate 'Alt' cannot have em=
pty 'data'
diff --git a/tests/qapi-schema/alternate-empty.json b/tests/qapi-schema/a=
lternate-empty.json
index fff15baf16..9f445474e6 100644
--- a/tests/qapi-schema/alternate-empty.json
+++ b/tests/qapi-schema/alternate-empty.json
@@ -1,2 +1,2 @@
-# alternates must list at least two types to be useful
-{ 'alternate': 'Alt', 'data': { 'i': 'int' } }
+# alternates cannot be empty
+{ 'alternate': 'Alt', 'data': { } }
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/=
qapi-schema-test.json
index e6dbbbd328..8b0d47c4ab 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -186,19 +186,21 @@
=20
 # test that we correctly compile downstream extensions, as well as munge
 # ticklish names
+# also test union and alternate with just one branch
 { 'enum': '__org.qemu_x-Enum', 'data': [ '__org.qemu_x-value' ] }
 { 'struct': '__org.qemu_x-Base',
   'data': { '__org.qemu_x-member1': '__org.qemu_x-Enum' } }
 { 'struct': '__org.qemu_x-Struct', 'base': '__org.qemu_x-Base',
   'data': { '__org.qemu_x-member2': 'str', '*wchar-t': 'int' } }
 { 'union': '__org.qemu_x-Union1', 'data': { '__org.qemu_x-branch': 'str'=
 } }
+{ 'alternate': '__org.qemu_x-Alt1', 'data': { '__org.qemu_x-branch': 'st=
r' } }
 { 'struct': '__org.qemu_x-Struct2',
   'data': { 'array': ['__org.qemu_x-Union1'] } }
 { 'union': '__org.qemu_x-Union2', 'base': '__org.qemu_x-Base',
   'discriminator': '__org.qemu_x-member1',
   'data': { '__org.qemu_x-value': '__org.qemu_x-Struct2' } }
 { 'alternate': '__org.qemu_x-Alt',
-  'data': { '__org.qemu_x-branch': 'str', 'b': '__org.qemu_x-Base' } }
+  'data': { '__org.qemu_x-branch': '__org.qemu_x-Base' } }
 { 'event': '__ORG.QEMU_X-EVENT', 'data': '__org.qemu_x-Struct' }
 { 'command': '__org.qemu_x-command',
   'data': { 'a': ['__org.qemu_x-Enum'], 'b': ['__org.qemu_x-Struct'],
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/q=
api-schema-test.out
index fb00a21996..bea7976bbb 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -274,6 +274,9 @@ object __org.qemu_x-Union1
     member type: __org.qemu_x-Union1Kind optional=3DFalse
     tag type
     case __org.qemu_x-branch: q_obj_str-wrapper
+alternate __org.qemu_x-Alt1
+    tag type
+    case __org.qemu_x-branch: str
 array __org.qemu_x-Union1List __org.qemu_x-Union1
 object __org.qemu_x-Struct2
     member array: __org.qemu_x-Union1List optional=3DFalse
@@ -283,8 +286,7 @@ object __org.qemu_x-Union2
     case __org.qemu_x-value: __org.qemu_x-Struct2
 alternate __org.qemu_x-Alt
     tag type
-    case __org.qemu_x-branch: str
-    case b: __org.qemu_x-Base
+    case __org.qemu_x-branch: __org.qemu_x-Base
 event __ORG.QEMU_X-EVENT __org.qemu_x-Struct
    boxed=3DFalse
 array __org.qemu_x-EnumList __org.qemu_x-Enum
--=20
2.21.0


