Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1A0BCAB1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 16:56:37 +0200 (CEST)
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCmF1-0007RE-Qc
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 10:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCks5-0000Km-RE
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCkrw-0001U8-Nb
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35814)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCkrw-0001Sv-0Q
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C6A504FCC9;
 Tue, 24 Sep 2019 13:28:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F924600CC;
 Tue, 24 Sep 2019 13:28:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A28A11386A7; Tue, 24 Sep 2019 15:28:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/25] qapi: Clean up member name case checking
Date: Tue, 24 Sep 2019 15:28:10 +0200
Message-Id: <20190924132830.15835-6-armbru@redhat.com>
In-Reply-To: <20190924132830.15835-1-armbru@redhat.com>
References: <20190924132830.15835-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 24 Sep 2019 13:28:38 +0000 (UTC)
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

QAPISchemaMember.check_clash() checks for member names that map to the
same c_name().  Takes care of rejecting duplicate names.

It also checks a naming rule: no uppercase in member names.  That's a
rather odd place to do it.  Enforcing naming rules is
check_name_str()'s job.

qapi-code-gen.txt specifies the name case rule applies to the name as
it appears in the schema.  check_clash() checks c_name(name) instead.
No difference, as c_name() leaves alone case, but unclean.

Move the name case check into check_name_str(), less the c_name().
New argument @permit_upper suppresses it.  Pass permit_upper=3DTrue for
definitions (which are not members), and when the member's owner is
whitelisted with pragma name-case-whitelist.

Bonus: name-case-whitelist now applies to a union's inline base, too.
Update qapi/qapi-schema.json pragma to whitelist union CpuInfo instead
of CpuInfo's implicit base type's name q_obj_CpuInfo-base.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/qapi-schema.json                    |  2 +-
 scripts/qapi/common.py                   | 25 +++++++++++++-----------
 tests/qapi-schema/args-member-case.err   |  2 +-
 tests/qapi-schema/args-member-case.json  |  2 +-
 tests/qapi-schema/enum-member-case.err   |  2 +-
 tests/qapi-schema/union-branch-case.err  |  4 ++--
 tests/qapi-schema/union-branch-case.json |  4 ++--
 7 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 920b03b0aa..9751b11f8f 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -71,7 +71,7 @@
         'QapiErrorClass',           # all members, visible through error=
s
         'UuidInfo',                 # UUID, visible through query-uuid
         'X86CPURegister32',         # all members, visible indirectly th=
rough qom-get
-        'q_obj_CpuInfo-base'        # CPU, visible through query-cpu
+        'CpuInfo'                   # CPU, visible through query-cpu
     ] } }
=20
 # Documentation generated with qapi-gen.py is in source order, with
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index f0e7d5ad34..ed4bff4479 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -704,8 +704,8 @@ valid_name =3D re.compile(r'^(__[a-zA-Z0-9.-]+_)?'
                         '[a-zA-Z][a-zA-Z0-9_-]*$')
=20
=20
-def check_name(info, source, name, allow_optional=3DFalse,
-               enum_member=3DFalse):
+def check_name(info, source, name,
+               allow_optional=3DFalse, enum_member=3DFalse, permit_upper=
=3DFalse):
     global valid_name
     membername =3D name
=20
@@ -725,11 +725,14 @@ def check_name(info, source, name, allow_optional=3D=
False,
     if not valid_name.match(membername) or \
        c_name(membername, False).startswith('q_'):
         raise QAPISemError(info, "%s uses invalid name '%s'" % (source, =
name))
+    if not permit_upper and name.lower() !=3D name:
+        raise QAPISemError(
+            info, "%s uses uppercase in name '%s'" % (source, name))
=20
=20
 def add_name(name, info, meta):
     global all_names
-    check_name(info, "'%s'" % meta, name)
+    check_name(info, "'%s'" % meta, name, permit_upper=3DTrue)
     # FIXME should reject names that differ only in '_' vs. '.'
     # vs. '-', because they're liable to clash in generated C.
     if name in all_names:
@@ -797,10 +800,12 @@ def check_type(info, source, value,
         raise QAPISemError(info,
                            "%s should be an object or type name" % sourc=
e)
=20
+    permit_upper =3D allow_dict in name_case_whitelist
+
     # value is a dictionary, check that each member is okay
     for (key, arg) in value.items():
         check_name(info, "Member of %s" % source, key,
-                   allow_optional=3DTrue)
+                   allow_optional=3DTrue, permit_upper=3Dpermit_upper)
         if c_name(key, False) =3D=3D 'u' or c_name(key, False).startswit=
h('has_'):
             raise QAPISemError(info, "Member of %s uses reserved name '%=
s'"
                                % (source, key))
@@ -870,7 +875,7 @@ def check_union(expr, info):
     else:
         # The object must have a string or dictionary 'base'.
         check_type(info, "'base' for union '%s'" % name,
-                   base, allow_dict=3DTrue,
+                   base, allow_dict=3Dname,
                    allow_metas=3D['struct'])
         if not base:
             raise QAPISemError(info, "Flat union '%s' must have a base"
@@ -982,13 +987,15 @@ def check_enum(expr, info):
         raise QAPISemError(info,
                            "Enum '%s' requires a string for 'prefix'" % =
name)
=20
+    permit_upper =3D name in name_case_whitelist
+
     for member in members:
         check_known_keys(info, "member of enum '%s'" % name, member,
                          ['name'], ['if'])
         check_if(member, info)
         normalize_if(member)
         check_name(info, "Member of enum '%s'" % name, member['name'],
-                   enum_member=3DTrue)
+                   enum_member=3DTrue, permit_upper=3Dpermit_upper)
=20
=20
 def check_struct(expr, info):
@@ -997,7 +1004,7 @@ def check_struct(expr, info):
     features =3D expr.get('features')
=20
     check_type(info, "'data' for struct '%s'" % name, members,
-               allow_dict=3DTrue)
+               allow_dict=3Dname)
     check_type(info, "'base' for struct '%s'" % name, expr.get('base'),
                allow_metas=3D['struct'])
=20
@@ -1555,10 +1562,6 @@ class QAPISchemaMember(object):
=20
     def check_clash(self, info, seen):
         cname =3D c_name(self.name)
-        if (cname.lower() !=3D cname
-                and self.defined_in not in name_case_whitelist):
-            raise QAPISemError(info,
-                               "%s should not use uppercase" % self.desc=
ribe())
         if cname in seen:
             raise QAPISemError(info, "%s collides with %s" %
                                (self.describe(), seen[cname].describe())=
)
diff --git a/tests/qapi-schema/args-member-case.err b/tests/qapi-schema/a=
rgs-member-case.err
index 725ba16192..da183957b2 100644
--- a/tests/qapi-schema/args-member-case.err
+++ b/tests/qapi-schema/args-member-case.err
@@ -1,2 +1,2 @@
 tests/qapi-schema/args-member-case.json: In command 'no-way-this-will-ge=
t-whitelisted':
-tests/qapi-schema/args-member-case.json:2: 'Arg' (parameter of no-way-th=
is-will-get-whitelisted) should not use uppercase
+tests/qapi-schema/args-member-case.json:2: Member of 'data' for command =
'no-way-this-will-get-whitelisted' uses uppercase in name 'Arg'
diff --git a/tests/qapi-schema/args-member-case.json b/tests/qapi-schema/=
args-member-case.json
index 93439bee8b..e27c603548 100644
--- a/tests/qapi-schema/args-member-case.json
+++ b/tests/qapi-schema/args-member-case.json
@@ -1,2 +1,2 @@
-# Member names should be 'lower-case' unless the struct/command is white=
listed
+# Member names should be 'lower-case' unless the struct is whitelisted
 { 'command': 'no-way-this-will-get-whitelisted', 'data': { 'Arg': 'int' =
} }
diff --git a/tests/qapi-schema/enum-member-case.err b/tests/qapi-schema/e=
num-member-case.err
index f6c872d3bf..8f2007c86f 100644
--- a/tests/qapi-schema/enum-member-case.err
+++ b/tests/qapi-schema/enum-member-case.err
@@ -1,2 +1,2 @@
 tests/qapi-schema/enum-member-case.json: In enum 'NoWayThisWillGetWhitel=
isted':
-tests/qapi-schema/enum-member-case.json:4: 'Value' (value of NoWayThisWi=
llGetWhitelisted) should not use uppercase
+tests/qapi-schema/enum-member-case.json:4: Member of enum 'NoWayThisWill=
GetWhitelisted' uses uppercase in name 'Value'
diff --git a/tests/qapi-schema/union-branch-case.err b/tests/qapi-schema/=
union-branch-case.err
index 8e81a2d0b6..09313d7f83 100644
--- a/tests/qapi-schema/union-branch-case.err
+++ b/tests/qapi-schema/union-branch-case.err
@@ -1,2 +1,2 @@
-tests/qapi-schema/union-branch-case.json: In union 'NoWayThisWillGetWhit=
elisted':
-tests/qapi-schema/union-branch-case.json:2: 'Branch' (branch of NoWayThi=
sWillGetWhitelisted) should not use uppercase
+tests/qapi-schema/union-branch-case.json: In union 'Uni':
+tests/qapi-schema/union-branch-case.json:2: Member of union 'Uni' uses u=
ppercase in name 'Branch'
diff --git a/tests/qapi-schema/union-branch-case.json b/tests/qapi-schema=
/union-branch-case.json
index e6565dc3b3..b7894b75d6 100644
--- a/tests/qapi-schema/union-branch-case.json
+++ b/tests/qapi-schema/union-branch-case.json
@@ -1,2 +1,2 @@
-# Branch names should be 'lower-case' unless the union is whitelisted
-{ 'union': 'NoWayThisWillGetWhitelisted', 'data': { 'Branch': 'int' } }
+# Branch names should be 'lower-case'
+{ 'union': 'Uni', 'data': { 'Branch': 'int' } }
--=20
2.21.0


