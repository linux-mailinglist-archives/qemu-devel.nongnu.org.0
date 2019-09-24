Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8640CBC8AA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 15:15:58 +0200 (CEST)
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCkfc-0002RV-Q8
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 09:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCk0o-0001K4-1r
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCk0j-0006wt-Al
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48548)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCk0i-0006uZ-JA
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E7D7317528C
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 12:33:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 483EA608C2;
 Tue, 24 Sep 2019 12:33:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CA97A1136421; Tue, 24 Sep 2019 14:33:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/37] tests/qapi-schema: Demonstrate misleading optional tag
 error
Date: Tue, 24 Sep 2019 14:33:18 +0200
Message-Id: <20190924123334.30645-22-armbru@redhat.com>
In-Reply-To: <20190924123334.30645-1-armbru@redhat.com>
References: <20190924123334.30645-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 24 Sep 2019 12:33:39 +0000 (UTC)
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

Test flat-union-optional-discriminator declares its union tag as
'*switch': 'Enum', and points to it with 'discriminator': '*switch'.
This gets rejected as "discriminator of flat union 'MyUnion' uses
invalid name '*switch'".  Correct; member 'discriminator' doesn't
accept a '*' prefix.

However, this merely tests name validity checking, which we already
cover elsewhere.  More interesting is testing the valid name 'switch'.
This reports "discriminator 'switch' is not a member of base struct
'Base'", which is misleading.

Copy the existing 'discriminator': '*switch' test to
flat-union-discriminator-bad-name, and rewrite its comment.  Change
flat-union-optional-discriminator to test 'discriminator': 'switch',
and mark it FIXME.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190914153506.2151-4-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/Makefile.include                                |  1 +
 .../qapi-schema/flat-union-discriminator-bad-name.err |  1 +
 .../flat-union-discriminator-bad-name.exit            |  1 +
 .../flat-union-discriminator-bad-name.json            | 11 +++++++++++
 .../qapi-schema/flat-union-discriminator-bad-name.out |  0
 .../qapi-schema/flat-union-optional-discriminator.err |  2 +-
 .../flat-union-optional-discriminator.json            |  3 ++-
 7 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 tests/qapi-schema/flat-union-discriminator-bad-name.e=
rr
 create mode 100644 tests/qapi-schema/flat-union-discriminator-bad-name.e=
xit
 create mode 100644 tests/qapi-schema/flat-union-discriminator-bad-name.j=
son
 create mode 100644 tests/qapi-schema/flat-union-discriminator-bad-name.o=
ut

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 0c862dbc42..7553616069 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -388,6 +388,7 @@ qapi-schema +=3D flat-union-bad-discriminator.json
 qapi-schema +=3D flat-union-base-any.json
 qapi-schema +=3D flat-union-base-union.json
 qapi-schema +=3D flat-union-clash-member.json
+qapi-schema +=3D flat-union-discriminator-bad-name.json
 qapi-schema +=3D flat-union-empty.json
 qapi-schema +=3D flat-union-inline.json
 qapi-schema +=3D flat-union-inline-invalid-dict.json
diff --git a/tests/qapi-schema/flat-union-discriminator-bad-name.err b/te=
sts/qapi-schema/flat-union-discriminator-bad-name.err
new file mode 100644
index 0000000000..7238d126ca
--- /dev/null
+++ b/tests/qapi-schema/flat-union-discriminator-bad-name.err
@@ -0,0 +1 @@
+tests/qapi-schema/flat-union-discriminator-bad-name.json:7: Discriminato=
r of flat union 'MyUnion' does not allow optional name '*switch'
diff --git a/tests/qapi-schema/flat-union-discriminator-bad-name.exit b/t=
ests/qapi-schema/flat-union-discriminator-bad-name.exit
new file mode 100644
index 0000000000..d00491fd7e
--- /dev/null
+++ b/tests/qapi-schema/flat-union-discriminator-bad-name.exit
@@ -0,0 +1 @@
+1
diff --git a/tests/qapi-schema/flat-union-discriminator-bad-name.json b/t=
ests/qapi-schema/flat-union-discriminator-bad-name.json
new file mode 100644
index 0000000000..66376084fc
--- /dev/null
+++ b/tests/qapi-schema/flat-union-discriminator-bad-name.json
@@ -0,0 +1,11 @@
+# discriminator '*switch' isn't a member of base, 'switch' is
+# reports "does not allow optional name", which is good enough
+{ 'enum': 'Enum', 'data': [ 'one', 'two' ] }
+{ 'struct': 'Base',
+  'data': { '*switch': 'Enum' } }
+{ 'struct': 'Branch', 'data': { 'name': 'str' } }
+{ 'union': 'MyUnion',
+  'base': 'Base',
+  'discriminator': '*switch',
+  'data': { 'one': 'Branch',
+            'two': 'Branch' } }
diff --git a/tests/qapi-schema/flat-union-discriminator-bad-name.out b/te=
sts/qapi-schema/flat-union-discriminator-bad-name.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/flat-union-optional-discriminator.err b/te=
sts/qapi-schema/flat-union-optional-discriminator.err
index aaabedb3bd..8b4a4ba847 100644
--- a/tests/qapi-schema/flat-union-optional-discriminator.err
+++ b/tests/qapi-schema/flat-union-optional-discriminator.err
@@ -1 +1 @@
-tests/qapi-schema/flat-union-optional-discriminator.json:6: Discriminato=
r of flat union 'MyUnion' does not allow optional name '*switch'
+tests/qapi-schema/flat-union-optional-discriminator.json:7: Discriminato=
r 'switch' is not a member of base struct 'Base'
diff --git a/tests/qapi-schema/flat-union-optional-discriminator.json b/t=
ests/qapi-schema/flat-union-optional-discriminator.json
index 08a8f7ef8b..143ab23a0d 100644
--- a/tests/qapi-schema/flat-union-optional-discriminator.json
+++ b/tests/qapi-schema/flat-union-optional-discriminator.json
@@ -1,10 +1,11 @@
 # we require the discriminator to be non-optional
+# FIXME reports "discriminator 'switch' is not a member of base struct '=
Base'"
 { 'enum': 'Enum', 'data': [ 'one', 'two' ] }
 { 'struct': 'Base',
   'data': { '*switch': 'Enum' } }
 { 'struct': 'Branch', 'data': { 'name': 'str' } }
 { 'union': 'MyUnion',
   'base': 'Base',
-  'discriminator': '*switch',
+  'discriminator': 'switch',
   'data': { 'one': 'Branch',
             'two': 'Branch' } }
--=20
2.21.0


