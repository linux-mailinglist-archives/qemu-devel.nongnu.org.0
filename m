Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7BE45FE7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 16:02:53 +0200 (CEST)
Received: from localhost ([::1]:51806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbmn5-0001ty-ST
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 10:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46395)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbmRl-0001fJ-Tg
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:40:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbmRk-0005vN-0S
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:40:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30136)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbmRe-0005pm-8Q; Fri, 14 Jun 2019 09:40:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5D79F59474;
 Fri, 14 Jun 2019 13:40:41 +0000 (UTC)
Received: from localhost (unknown [10.40.205.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EABF1601AC;
 Fri, 14 Jun 2019 13:40:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 14 Jun 2019 15:40:07 +0200
Message-Id: <20190614134021.32486-7-mreitz@redhat.com>
In-Reply-To: <20190614134021.32486-1-mreitz@redhat.com>
References: <20190614134021.32486-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 14 Jun 2019 13:40:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 06/20] event_match: always match on None value
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Before, event_match didn't always recurse if the event value was not a
dictionary, and would instead check for equality immediately.

By delaying equality checking to post-recursion, we can allow leaf
values like "5" to match "None" and take advantage of the generic
None-returns-True clause.

This makes the matching a little more obviously consistent at the
expense of being able to check for explicit None values, which is
probably not that important given what this function is used for.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20190528183857.26167-1-jsnow@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 python/qemu/__init__.py | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/python/qemu/__init__.py b/python/qemu/__init__.py
index 98ed8a2e28..dbaf8a5311 100644
--- a/python/qemu/__init__.py
+++ b/python/qemu/__init__.py
@@ -409,27 +409,31 @@ class QEMUMachine(object):
=20
         The match criteria takes the form of a matching subdict. The eve=
nt is
         checked to be a superset of the subdict, recursively, with match=
ing
-        values whenever those values are not None.
+        values whenever the subdict values are not None.
+
+        This has a limitation that you cannot explicitly check for None =
values.
=20
         Examples, with the subdict queries on the left:
          - None matches any object.
          - {"foo": None} matches {"foo": {"bar": 1}}
-         - {"foo": {"baz": None}} does not match {"foo": {"bar": 1}}
-         - {"foo": {"baz": 2}} matches {"foo": {"bar": 1, "baz": 2}}
+         - {"foo": None} matches {"foo": 5}
+         - {"foo": {"abc": None}} does not match {"foo": {"bar": 1}}
+         - {"foo": {"rab": 2}} matches {"foo": {"bar": 1, "rab": 2}}
         """
         if match is None:
             return True
=20
-        for key in match:
-            if key in event:
-                if isinstance(event[key], dict):
+        try:
+            for key in match:
+                if key in event:
                     if not QEMUMachine.event_match(event[key], match[key=
]):
                         return False
-                elif event[key] !=3D match[key]:
+                else:
                     return False
-            else:
-                return False
-        return True
+            return True
+        except TypeError:
+            # either match or event wasn't iterable (not a dict)
+            return match =3D=3D event
=20
     def event_wait(self, name, timeout=3D60.0, match=3DNone):
         """
--=20
2.21.0


