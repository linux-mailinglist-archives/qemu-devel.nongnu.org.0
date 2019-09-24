Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA2BCA47
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 16:33:45 +0200 (CEST)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iClsu-0001ah-3N
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 10:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCks1-0000FS-RX
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCkrv-0001TD-LW
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54610)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCkrv-0001Rz-5E
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:39 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E85553091786;
 Tue, 24 Sep 2019 13:28:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D2760BFB;
 Tue, 24 Sep 2019 13:28:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8CB6211384AA; Tue, 24 Sep 2019 15:28:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/25] qapi: Inline check_name() into check_union()
Date: Tue, 24 Sep 2019 15:28:20 +0200
Message-Id: <20190924132830.15835-16-armbru@redhat.com>
In-Reply-To: <20190924132830.15835-1-armbru@redhat.com>
References: <20190924132830.15835-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 24 Sep 2019 13:28:37 +0000 (UTC)
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

check_name() consists of check_name_is_str() and check_name_str().
check_union() relies on the latter to catch optional discriminators.
The next commit will replace that by a more straightforward check.
Inlining check_name() into check_union() now should make that easier
to review.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 2dd794dfe7..f5599559ac 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -896,8 +896,10 @@ def check_union(expr, info):
=20
         # The value of member 'discriminator' must name a non-optional
         # member of the base struct.
-        check_name(discriminator, info,
-                   "discriminator of flat union '%s'" % name)
+        check_name_is_str(discriminator, info,
+                          "discriminator of flat union '%s'" % name)
+        check_name_str(discriminator, info,
+                       "discriminator of flat union '%s'" % name)
         discriminator_value =3D base_members.get(discriminator)
         if not discriminator_value:
             raise QAPISemError(info,
--=20
2.21.0


