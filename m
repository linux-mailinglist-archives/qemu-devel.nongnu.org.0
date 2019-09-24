Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52BCBC896
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 15:07:56 +0200 (CEST)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCkXq-0003AS-Qd
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 09:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCk0o-0001Ke-Mb
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCk0k-0006yi-BB
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55284)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCk0j-0006wB-PZ
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:42 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF68218C8935
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 12:33:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FDFD6012C;
 Tue, 24 Sep 2019 12:33:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33D9B113642C; Tue, 24 Sep 2019 14:33:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/37] qapi: Simplify check_keys()
Date: Tue, 24 Sep 2019 14:33:29 +0200
Message-Id: <20190924123334.30645-33-armbru@redhat.com>
In-Reply-To: <20190924123334.30645-1-armbru@redhat.com>
References: <20190924123334.30645-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 24 Sep 2019 12:33:40 +0000 (UTC)
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

check_keys() parameter expr_elem expects a dictionary with keys 'expr'
and 'info'.  Passing the two values separately is simpler, so do that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190914153506.2151-15-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/qapi/common.py | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 4d1f62e808..4d4e0be770 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -1029,9 +1029,7 @@ def check_known_keys(info, source, keys, required, =
optional):
                               source, pprint(allowed)))
=20
=20
-def check_keys(expr_elem, meta, required, optional=3D[]):
-    expr =3D expr_elem['expr']
-    info =3D expr_elem['info']
+def check_keys(expr, info, meta, required, optional=3D[]):
     name =3D expr[meta]
     if not isinstance(name, str):
         raise QAPISemError(info, "'%s' key must have a string value" % m=
eta)
@@ -1100,40 +1098,39 @@ def check_exprs(exprs):
=20
         if 'enum' in expr:
             meta =3D 'enum'
-            check_keys(expr_elem, 'enum', ['data'], ['if', 'prefix'])
+            check_keys(expr, info, 'enum', ['data'], ['if', 'prefix'])
             normalize_enum(expr)
             enum_types[expr[meta]] =3D expr
         elif 'union' in expr:
             meta =3D 'union'
-            check_keys(expr_elem, 'union', ['data'],
+            check_keys(expr, info, 'union', ['data'],
                        ['base', 'discriminator', 'if'])
             normalize_members(expr.get('base'))
             normalize_members(expr['data'])
             union_types[expr[meta]] =3D expr
         elif 'alternate' in expr:
             meta =3D 'alternate'
-            check_keys(expr_elem, 'alternate', ['data'], ['if'])
+            check_keys(expr, info, 'alternate', ['data'], ['if'])
             normalize_members(expr['data'])
         elif 'struct' in expr:
             meta =3D 'struct'
-            check_keys(expr_elem, 'struct', ['data'],
+            check_keys(expr, info, 'struct', ['data'],
                        ['base', 'if', 'features'])
             normalize_members(expr['data'])
             normalize_features(expr.get('features'))
             struct_types[expr[meta]] =3D expr
         elif 'command' in expr:
             meta =3D 'command'
-            check_keys(expr_elem, 'command', [],
+            check_keys(expr, info, 'command', [],
                        ['data', 'returns', 'gen', 'success-response',
                         'boxed', 'allow-oob', 'allow-preconfig', 'if'])
             normalize_members(expr.get('data'))
         elif 'event' in expr:
             meta =3D 'event'
-            check_keys(expr_elem, 'event', [], ['data', 'boxed', 'if'])
+            check_keys(expr, info, 'event', [], ['data', 'boxed', 'if'])
             normalize_members(expr.get('data'))
         else:
-            raise QAPISemError(expr_elem['info'],
-                               "Expression is missing metatype")
+            raise QAPISemError(info, "Expression is missing metatype")
         normalize_if(expr)
         name =3D expr[meta]
         add_name(name, info, meta)
--=20
2.21.0


