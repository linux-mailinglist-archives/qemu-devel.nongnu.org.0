Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7F519D8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 19:43:32 +0200 (CEST)
Received: from localhost ([::1]:53462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfT07-0003Wv-CJ
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 13:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48810)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hfSwl-0001As-F6
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 13:40:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hfSwj-0004sG-6z
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 13:40:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34424)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hfSwZ-0004LB-Uq; Mon, 24 Jun 2019 13:39:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 82D823082E63;
 Mon, 24 Jun 2019 17:39:47 +0000 (UTC)
Received: from localhost (ovpn-204-152.brq.redhat.com [10.40.204.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 193415D71A;
 Mon, 24 Jun 2019 17:39:46 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 24 Jun 2019 19:39:24 +0200
Message-Id: <20190624173935.25747-5-mreitz@redhat.com>
In-Reply-To: <20190624173935.25747-1-mreitz@redhat.com>
References: <20190624173935.25747-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 24 Jun 2019 17:39:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 04/14] qapi: Allow optional discriminators
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optional discriminators are fine, as long as there is a default value.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 scripts/qapi/common.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 8c57d0c67a..203623795b 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -1052,11 +1052,21 @@ def check_union(expr, info):
         base_members =3D find_base_members(base)
         assert base_members is not None
=20
-        # The value of member 'discriminator' must name a non-optional
-        # member of the base struct.
+        # The value of member 'discriminator' must name a member of
+        # the base struct.  (Optional members are allowed, but the
+        # discriminator name must not start with '*', so keep
+        # allow_optional=3DFalse.)
         check_name(info, "Discriminator of flat union '%s'" % name,
                    discriminator)
+
         discriminator_value =3D base_members.get(discriminator)
+        if not discriminator_value:
+            discriminator_value =3D base_members.get('*' + discriminator=
)
+            if discriminator_value and 'default' not in discriminator_va=
lue:
+                raise QAPISemError(info,
+                    "Optional discriminator '%s' has no default value" %
+                    discriminator)
+
         if not discriminator_value:
             raise QAPISemError(info,
                                "Discriminator '%s' is not a member of ba=
se "
--=20
2.21.0


