Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74BBCA9A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 16:49:37 +0200 (CEST)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCm8G-0007tv-2p
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 10:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCks2-0000GY-M1
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCkry-0001Uz-BA
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32964)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCkrx-0001Tv-Lr
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7318A81F31;
 Tue, 24 Sep 2019 13:28:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D287E10018FF;
 Tue, 24 Sep 2019 13:28:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D7341138406; Tue, 24 Sep 2019 15:28:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/25] qapi: Improve reporting of invalid 'if' errors
Date: Tue, 24 Sep 2019 15:28:23 +0200
Message-Id: <20190924132830.15835-19-armbru@redhat.com>
In-Reply-To: <20190924132830.15835-1-armbru@redhat.com>
References: <20190924132830.15835-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 24 Sep 2019 13:28:40 +0000 (UTC)
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

Move check_if() from check_keys() to check_exprs() and call it later,
so its error messages gain an "in definition" line.

Checking values in a function named check_keys() is unclean anyway.
The original sin was commit 0545f6b887 "qapi: Better error messages
for bad expressions", which checks the value of key 'name'.  More
sinning in commit 2cbf09925a "qapi: More rigorous checking for type
safety bypass", commit c818408e44 "qapi: Implement boxed types for
commands/events", and commit 967c885108 "qapi: add 'if' to top-level
expressions".  This commit does penance for the latter.  The next
commits will do penance for the others.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py                  | 4 ++--
 tests/qapi-schema/bad-if-empty-list.err | 1 +
 tests/qapi-schema/bad-if-empty.err      | 1 +
 tests/qapi-schema/bad-if-list.err       | 1 +
 tests/qapi-schema/bad-if.err            | 1 +
 5 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 7577120f12..fe99e59153 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -920,8 +920,6 @@ def check_keys(expr, info, meta, required, optional=3D=
[]):
             raise QAPISemError(info,
                                "'%s' of %s '%s' should only use true val=
ue"
                                % (key, meta, name))
-        if key =3D=3D 'if':
-            check_if(expr, info)
=20
=20
 def normalize_enum(expr):
@@ -1023,6 +1021,8 @@ def check_exprs(exprs):
         else:
             assert False, 'unexpected meta type'
=20
+        check_if(expr, info)
+
         if doc:
             doc.check_expr(expr)
=20
diff --git a/tests/qapi-schema/bad-if-empty-list.err b/tests/qapi-schema/=
bad-if-empty-list.err
index 75fe6497bc..2218c9279b 100644
--- a/tests/qapi-schema/bad-if-empty-list.err
+++ b/tests/qapi-schema/bad-if-empty-list.err
@@ -1 +1,2 @@
+tests/qapi-schema/bad-if-empty-list.json: In struct 'TestIfStruct':
 tests/qapi-schema/bad-if-empty-list.json:2: 'if' condition [] is useless
diff --git a/tests/qapi-schema/bad-if-empty.err b/tests/qapi-schema/bad-i=
f-empty.err
index 358bdc3e51..a3fdb3009d 100644
--- a/tests/qapi-schema/bad-if-empty.err
+++ b/tests/qapi-schema/bad-if-empty.err
@@ -1 +1,2 @@
+tests/qapi-schema/bad-if-empty.json: In struct 'TestIfStruct':
 tests/qapi-schema/bad-if-empty.json:2: 'if' condition '' makes no sense
diff --git a/tests/qapi-schema/bad-if-list.err b/tests/qapi-schema/bad-if=
-list.err
index 53af099083..e03bf0fc3a 100644
--- a/tests/qapi-schema/bad-if-list.err
+++ b/tests/qapi-schema/bad-if-list.err
@@ -1 +1,2 @@
+tests/qapi-schema/bad-if-list.json: In struct 'TestIfStruct':
 tests/qapi-schema/bad-if-list.json:2: 'if' condition ' ' makes no sense
diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.err
index c2e3f5f44c..190216c109 100644
--- a/tests/qapi-schema/bad-if.err
+++ b/tests/qapi-schema/bad-if.err
@@ -1 +1,2 @@
+tests/qapi-schema/bad-if.json: In struct 'TestIfStruct':
 tests/qapi-schema/bad-if.json:2: 'if' condition must be a string or a li=
st of strings
--=20
2.21.0


