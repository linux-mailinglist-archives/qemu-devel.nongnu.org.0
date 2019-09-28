Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DE2C11E0
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Sep 2019 20:55:24 +0200 (CEST)
Received: from localhost ([::1]:34442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEHsJ-0005bj-5V
	for lists+qemu-devel@lfdr.de; Sat, 28 Sep 2019 14:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iEHd9-0008SI-CB
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iEHd5-0003un-Or
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54158)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iEHd5-0003sa-7c
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:39 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6EB818763B
 for <qemu-devel@nongnu.org>; Sat, 28 Sep 2019 18:39:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A27060BF7;
 Sat, 28 Sep 2019 18:39:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5358411385D5; Sat, 28 Sep 2019 20:39:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/27] qapi: Report invalid '*' prefix like any other invalid
 name
Date: Sat, 28 Sep 2019 20:39:19 +0200
Message-Id: <20190928183934.12459-13-armbru@redhat.com>
In-Reply-To: <20190928183934.12459-1-armbru@redhat.com>
References: <20190928183934.12459-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Sat, 28 Sep 2019 18:39:38 +0000 (UTC)
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

The special "does not allow optional name" error is well meant, but
confusing in practice.  Drop it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190927134639.4284-12-armbru@redhat.com>
---
 scripts/qapi/common.py                                   | 6 ++----
 tests/qapi-schema/bad-ident.err                          | 2 +-
 tests/qapi-schema/flat-union-discriminator-bad-name.err  | 2 +-
 tests/qapi-schema/flat-union-discriminator-bad-name.json | 2 +-
 tests/qapi-schema/union-optional-branch.err              | 2 +-
 5 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index d0d997f31c..a4cf41f13e 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -724,11 +724,8 @@ def check_name_str(name, info, source,
     global valid_name
     membername =3D name
=20
-    if name.startswith('*'):
+    if allow_optional and name.startswith('*'):
         membername =3D name[1:]
-        if not allow_optional:
-            raise QAPISemError(info, "%s does not allow optional name '%=
s'"
-                               % (source, name))
     # Enum members can start with a digit, because the generated C
     # code always prefixes it with the enum name
     if enum_member and membername[0].isdigit():
@@ -741,6 +738,7 @@ def check_name_str(name, info, source,
     if not permit_upper and name.lower() !=3D name:
         raise QAPISemError(
             info, "%s uses uppercase in name '%s'" % (source, name))
+    assert not membername.startswith('*')
=20
=20
 def add_name(name, info, meta):
diff --git a/tests/qapi-schema/bad-ident.err b/tests/qapi-schema/bad-iden=
t.err
index 6878889854..ddc96bd3a9 100644
--- a/tests/qapi-schema/bad-ident.err
+++ b/tests/qapi-schema/bad-ident.err
@@ -1,2 +1,2 @@
 tests/qapi-schema/bad-ident.json: In struct '*oops':
-tests/qapi-schema/bad-ident.json:2: 'struct' does not allow optional nam=
e '*oops'
+tests/qapi-schema/bad-ident.json:2: 'struct' uses invalid name '*oops'
diff --git a/tests/qapi-schema/flat-union-discriminator-bad-name.err b/te=
sts/qapi-schema/flat-union-discriminator-bad-name.err
index f7f64c5c1a..44e41883b1 100644
--- a/tests/qapi-schema/flat-union-discriminator-bad-name.err
+++ b/tests/qapi-schema/flat-union-discriminator-bad-name.err
@@ -1,2 +1,2 @@
 tests/qapi-schema/flat-union-discriminator-bad-name.json: In union 'MyUn=
ion':
-tests/qapi-schema/flat-union-discriminator-bad-name.json:7: discriminato=
r of flat union 'MyUnion' does not allow optional name '*switch'
+tests/qapi-schema/flat-union-discriminator-bad-name.json:7: discriminato=
r of flat union 'MyUnion' uses invalid name '*switch'
diff --git a/tests/qapi-schema/flat-union-discriminator-bad-name.json b/t=
ests/qapi-schema/flat-union-discriminator-bad-name.json
index 66376084fc..ea84b75cac 100644
--- a/tests/qapi-schema/flat-union-discriminator-bad-name.json
+++ b/tests/qapi-schema/flat-union-discriminator-bad-name.json
@@ -1,5 +1,5 @@
 # discriminator '*switch' isn't a member of base, 'switch' is
-# reports "does not allow optional name", which is good enough
+# reports "uses invalid name", which is good enough
 { 'enum': 'Enum', 'data': [ 'one', 'two' ] }
 { 'struct': 'Base',
   'data': { '*switch': 'Enum' } }
diff --git a/tests/qapi-schema/union-optional-branch.err b/tests/qapi-sch=
ema/union-optional-branch.err
index a5677f74bc..8e9b18d7c6 100644
--- a/tests/qapi-schema/union-optional-branch.err
+++ b/tests/qapi-schema/union-optional-branch.err
@@ -1,2 +1,2 @@
 tests/qapi-schema/union-optional-branch.json: In union 'Union':
-tests/qapi-schema/union-optional-branch.json:2: member of union 'Union' =
does not allow optional name '*a'
+tests/qapi-schema/union-optional-branch.json:2: member of union 'Union' =
uses invalid name '*a'
--=20
2.21.0


