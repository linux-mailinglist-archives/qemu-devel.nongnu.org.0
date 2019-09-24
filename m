Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7ACBC90E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 15:43:05 +0200 (CEST)
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCl5s-0003OK-8K
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 09:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58691)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCkrw-000097-62
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCkrt-0001RX-PB
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35794)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCkrt-0001Ql-8X
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 73DDB3D965;
 Tue, 24 Sep 2019 13:28:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DF1E60C5E;
 Tue, 24 Sep 2019 13:28:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7C55211385CB; Tue, 24 Sep 2019 15:28:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/25] qapi: Use check_name_str() where it suffices
Date: Tue, 24 Sep 2019 15:28:15 +0200
Message-Id: <20190924132830.15835-11-armbru@redhat.com>
In-Reply-To: <20190924132830.15835-1-armbru@redhat.com>
References: <20190924132830.15835-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 24 Sep 2019 13:28:36 +0000 (UTC)
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

Replace check_name() by check_name_str() where the name is known to be
a string.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index fdc4379eff..6c870da50b 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -815,8 +815,8 @@ def check_type(value, info, source,
=20
     # value is a dictionary, check that each member is okay
     for (key, arg) in value.items():
-        check_name(key, info, "member of %s" % source,
-                   allow_optional=3DTrue, permit_upper=3Dpermit_upper)
+        check_name_str(key, info, "member of %s" % source,
+                       allow_optional=3DTrue, permit_upper=3Dpermit_uppe=
r)
         if c_name(key, False) =3D=3D 'u' or c_name(key, False).startswit=
h('has_'):
             raise QAPISemError(
                 info, "member of %s uses reserved name '%s'" % (source, =
key))
@@ -919,8 +919,7 @@ def check_union(expr, info):
         raise QAPISemError(info, "union '%s' has no branches" % name)
=20
     for (key, value) in members.items():
-        check_name(key, info, "member of union '%s'" % name)
-
+        check_name_str(key, info, "member of union '%s'" % name)
         check_known_keys(value, info,
                          "member '%s' of union '%s'" % (key, name),
                          ['type'], ['if'])
@@ -950,7 +949,7 @@ def check_alternate(expr, info):
         raise QAPISemError(info,
                            "alternate '%s' cannot have empty 'data'" % n=
ame)
     for (key, value) in members.items():
-        check_name(key, info, "member of alternate '%s'" % name)
+        check_name_str(key, info, "member of alternate '%s'" % name)
         check_known_keys(value, info,
                          "member '%s' of alternate '%s'" % (key, name),
                          ['type'], ['if'])
--=20
2.21.0


