Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DABD3E77
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 13:29:37 +0200 (CEST)
Received: from localhost ([::1]:48714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIt71-0008DK-SN
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 07:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iIszK-0007Pp-BC
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:21:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iIszJ-0002G3-ET
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:21:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59216)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iIszJ-0002Ew-8y
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:21:37 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7CD763065603;
 Fri, 11 Oct 2019 11:21:36 +0000 (UTC)
Received: from localhost (dhcp-192-238.str.redhat.com [10.33.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A818196B2;
 Fri, 11 Oct 2019 11:21:31 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/10] libqos: tolerate wait-unplug migration state
Date: Fri, 11 Oct 2019 13:20:13 +0200
Message-Id: <20191011112015.11785-9-jfreimann@redhat.com>
In-Reply-To: <20191011112015.11785-1-jfreimann@redhat.com>
References: <20191011112015.11785-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 11 Oct 2019 11:21:36 +0000 (UTC)
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
Cc: parav@mellanox.com, mst@redhat.com, aadam@redhat.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, laine@redhat.com, ailan@redhat.com,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jens Freimann <jfreimann@redhat.com>
---
 tests/libqos/libqos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/libqos/libqos.c b/tests/libqos/libqos.c
index d71557c5cb..f229eb2cb8 100644
--- a/tests/libqos/libqos.c
+++ b/tests/libqos/libqos.c
@@ -125,7 +125,8 @@ void migrate(QOSState *from, QOSState *to, const char=
 *uri)
             break;
         }
=20
-        if ((strcmp(st, "setup") =3D=3D 0) || (strcmp(st, "active") =3D=3D=
 0)) {
+        if ((strcmp(st, "setup") =3D=3D 0) || (strcmp(st, "active") =3D=3D=
 0)
+            || (strcmp(st, "wait-unplug") =3D=3D 0)) {
             qobject_unref(rsp);
             g_usleep(5000);
             continue;
--=20
2.21.0


