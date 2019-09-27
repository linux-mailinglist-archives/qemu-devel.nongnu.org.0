Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDF1C08F8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 17:54:32 +0200 (CEST)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDsZj-0004XQ-59
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 11:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iDqaC-0001H1-Pc
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:47:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iDqa8-00064z-KT
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:46:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42170)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iDqa8-00063e-3T
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:46:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 111162026F;
 Fri, 27 Sep 2019 13:46:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5062614C3;
 Fri, 27 Sep 2019 13:46:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B60A41136425; Fri, 27 Sep 2019 15:46:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/26] qapi: Improve reporting of redefinition
Date: Fri, 27 Sep 2019 15:46:38 +0200
Message-Id: <20190927134639.4284-26-armbru@redhat.com>
In-Reply-To: <20190927134639.4284-1-armbru@redhat.com>
References: <20190927134639.4284-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 27 Sep 2019 13:46:47 +0000 (UTC)
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
Cc: marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Point to the previous definition, unless it's a built-in.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/qapi/common.py                  | 5 +++++
 tests/qapi-schema/redefined-command.err | 4 +++-
 tests/qapi-schema/redefined-event.err   | 4 +++-
 tests/qapi-schema/redefined-type.err    | 4 +++-
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index bd834270f8..a74cd957d4 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -1759,6 +1759,11 @@ class QAPISchema(object):
         # because they're liable to clash in generated C.
         other_ent =3D self._entity_dict.get(ent.name)
         if other_ent:
+            if other_ent.info:
+                where =3D QAPIError(other_ent.info, None, "previous defi=
nition")
+                raise QAPISemError(
+                    ent.info,
+                    "'%s' is already defined\n%s" % (ent.name, where))
             raise QAPISemError(
                 ent.info, "%s is already defined" % other_ent.describe()=
)
         self._entity_dict[ent.name] =3D ent
diff --git a/tests/qapi-schema/redefined-command.err b/tests/qapi-schema/=
redefined-command.err
index b77a05d354..54e366bbf3 100644
--- a/tests/qapi-schema/redefined-command.err
+++ b/tests/qapi-schema/redefined-command.err
@@ -1,2 +1,4 @@
 tests/qapi-schema/redefined-command.json: In command 'foo':
-tests/qapi-schema/redefined-command.json:3: command 'foo' is already def=
ined
+tests/qapi-schema/redefined-command.json:3: 'foo' is already defined
+tests/qapi-schema/redefined-command.json: In command 'foo':
+tests/qapi-schema/redefined-command.json:2: previous definition
diff --git a/tests/qapi-schema/redefined-event.err b/tests/qapi-schema/re=
defined-event.err
index fd02d38157..606c6e4497 100644
--- a/tests/qapi-schema/redefined-event.err
+++ b/tests/qapi-schema/redefined-event.err
@@ -1,2 +1,4 @@
 tests/qapi-schema/redefined-event.json: In event 'EVENT_A':
-tests/qapi-schema/redefined-event.json:3: event 'EVENT_A' is already def=
ined
+tests/qapi-schema/redefined-event.json:3: 'EVENT_A' is already defined
+tests/qapi-schema/redefined-event.json: In event 'EVENT_A':
+tests/qapi-schema/redefined-event.json:2: previous definition
diff --git a/tests/qapi-schema/redefined-type.err b/tests/qapi-schema/red=
efined-type.err
index 39f51c14ea..77786f98ae 100644
--- a/tests/qapi-schema/redefined-type.err
+++ b/tests/qapi-schema/redefined-type.err
@@ -1,2 +1,4 @@
 tests/qapi-schema/redefined-type.json: In enum 'foo':
-tests/qapi-schema/redefined-type.json:3: struct type 'foo' is already de=
fined
+tests/qapi-schema/redefined-type.json:3: 'foo' is already defined
+tests/qapi-schema/redefined-type.json: In struct 'foo':
+tests/qapi-schema/redefined-type.json:2: previous definition
--=20
2.21.0


