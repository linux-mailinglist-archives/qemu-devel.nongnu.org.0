Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F915B2BFC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Sep 2019 17:44:09 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9ADX-0005eY-Rg
	for lists+qemu-devel@lfdr.de; Sat, 14 Sep 2019 11:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i9A5C-00050l-L9
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 11:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i9A5A-0004z3-LK
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 11:35:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46796)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i9A5A-0004sm-46
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 11:35:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9AD6210DCC8D;
 Sat, 14 Sep 2019 15:35:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67CA75FCA2;
 Sat, 14 Sep 2019 15:35:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B971B113306C; Sat, 14 Sep 2019 17:35:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Sep 2019 17:35:02 +0200
Message-Id: <20190914153506.2151-16-armbru@redhat.com>
In-Reply-To: <20190914153506.2151-1-armbru@redhat.com>
References: <20190914153506.2151-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Sat, 14 Sep 2019 15:35:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 15/19] qapi: Clean up around check_known_keys()
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

All callers pass a dict argument to @keys, except check_keys() passes
a dict's .keys().  Drop .keys() there, and rename parameter @keys to
@value.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 4d4e0be770..3c3154a039 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -1011,18 +1011,18 @@ def check_struct(expr, info):
             check_name(info, "Feature of struct %s" % name, f['name'])
=20
=20
-def check_known_keys(info, source, keys, required, optional):
+def check_known_keys(info, source, value, required, optional):
=20
     def pprint(elems):
         return ', '.join("'" + e + "'" for e in sorted(elems))
=20
-    missing =3D set(required) - set(keys)
+    missing =3D set(required) - set(value)
     if missing:
         raise QAPISemError(info, "Key%s %s %s missing from %s"
                            % ('s' if len(missing) > 1 else '', pprint(mi=
ssing),
                               'are' if len(missing) > 1 else 'is', sourc=
e))
     allowed =3D set(required + optional)
-    unknown =3D set(keys) - allowed
+    unknown =3D set(value) - allowed
     if unknown:
         raise QAPISemError(info, "Unknown key%s %s in %s\nValid keys are=
 %s."
                            % ('s' if len(unknown) > 1 else '', pprint(un=
known),
@@ -1035,7 +1035,7 @@ def check_keys(expr, info, meta, required, optional=
=3D[]):
         raise QAPISemError(info, "'%s' key must have a string value" % m=
eta)
     required =3D required + [meta]
     source =3D "%s '%s'" % (meta, name)
-    check_known_keys(info, source, expr.keys(), required, optional)
+    check_known_keys(info, source, expr, required, optional)
     for (key, value) in expr.items():
         if key in ['gen', 'success-response'] and value is not False:
             raise QAPISemError(info,
--=20
2.21.0


