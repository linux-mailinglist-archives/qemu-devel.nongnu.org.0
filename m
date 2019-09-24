Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DB1BC80B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 14:42:38 +0200 (CEST)
Received: from localhost ([::1]:45226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCk9M-0007N0-Rb
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 08:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50556)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCk0o-0001KI-A1
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCk0k-0006yY-9K
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCk0j-0006wD-Ru
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:42 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CAB5610CC1EE
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 12:33:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98265600CC;
 Tue, 24 Sep 2019 12:33:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 185A41136429; Tue, 24 Sep 2019 14:33:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/37] qapi: Reject blank 'if' conditions in addition to empty
 ones
Date: Tue, 24 Sep 2019 14:33:26 +0200
Message-Id: <20190924123334.30645-30-armbru@redhat.com>
In-Reply-To: <20190924123334.30645-1-armbru@redhat.com>
References: <20190924123334.30645-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 24 Sep 2019 12:33:40 +0000 (UTC)
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

"'if': 'COND'" generates "#if COND".  We reject empty COND because it
won't compile.  Blank COND won't compile any better, so reject that,
too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190914153506.2151-12-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/qapi/common.py             | 5 +++--
 tests/qapi-schema/bad-if-list.err  | 2 +-
 tests/qapi-schema/bad-if-list.json | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index a58e904978..2b46164854 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -742,8 +742,9 @@ def check_if(expr, info):
         if not isinstance(ifcond, str):
             raise QAPISemError(
                 info, "'if' condition must be a string or a list of stri=
ngs")
-        if ifcond =3D=3D '':
-            raise QAPISemError(info, "'if' condition '' makes no sense")
+        if ifcond.strip() =3D=3D '':
+            raise QAPISemError(info, "'if' condition '%s' makes no sense=
"
+                               % ifcond)
=20
     ifcond =3D expr.get('if')
     if ifcond is None:
diff --git a/tests/qapi-schema/bad-if-list.err b/tests/qapi-schema/bad-if=
-list.err
index 0af6316f78..53af099083 100644
--- a/tests/qapi-schema/bad-if-list.err
+++ b/tests/qapi-schema/bad-if-list.err
@@ -1 +1 @@
-tests/qapi-schema/bad-if-list.json:2: 'if' condition '' makes no sense
+tests/qapi-schema/bad-if-list.json:2: 'if' condition ' ' makes no sense
diff --git a/tests/qapi-schema/bad-if-list.json b/tests/qapi-schema/bad-i=
f-list.json
index 49ced9b9ca..ea3d95bb6b 100644
--- a/tests/qapi-schema/bad-if-list.json
+++ b/tests/qapi-schema/bad-if-list.json
@@ -1,3 +1,3 @@
 # check invalid 'if' content
 { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
-  'if': ['foo', ''] }
+  'if': ['foo', ' '] }
--=20
2.21.0


