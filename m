Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9A1074C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 13:01:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLmzM-0001WG-Vg
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 07:01:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hLmxG-0000Vg-In
	for qemu-devel@nongnu.org; Wed, 01 May 2019 06:59:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hLmxC-0002lp-Pj
	for qemu-devel@nongnu.org; Wed, 01 May 2019 06:59:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hLmxC-0002dh-H9
	for qemu-devel@nongnu.org; Wed, 01 May 2019 06:59:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DB8F3092675
	for <qemu-devel@nongnu.org>; Wed,  1 May 2019 10:59:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-152.ams2.redhat.com
	[10.36.116.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE70E7192A;
	Wed,  1 May 2019 10:59:07 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	crobinso@redhat.com
Date: Wed,  1 May 2019 11:59:03 +0100
Message-Id: <20190501105904.29907-2-dgilbert@redhat.com>
In-Reply-To: <20190501105904.29907-1-dgilbert@redhat.com>
References: <20190501105904.29907-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 01 May 2019 10:59:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/2] hmp: delvm: use hmp_handle_error
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cole Robinson <crobinso@redhat.com>

This gives us the consistent 'Error:' prefix added in 66363e9a43f,
which helps users like libvirt who still need to scrape hmp error
messages to detect failure.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Cole Robinson <crobinso@redhat.com>
Message-Id: <984634226fa14316641f31f84e7dd0bb770bd94c.1556141033.git.crob=
inso@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hmp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hmp.c b/hmp.c
index 4bb3af748e..56a3ed7375 100644
--- a/hmp.c
+++ b/hmp.c
@@ -1480,10 +1480,11 @@ void hmp_delvm(Monitor *mon, const QDict *qdict)
     const char *name =3D qdict_get_str(qdict, "name");
=20
     if (bdrv_all_delete_snapshot(name, &bs, &err) < 0) {
-        error_reportf_err(err,
-                          "Error while deleting snapshot on device '%s':=
 ",
-                          bdrv_get_device_name(bs));
+        error_prepend(&err,
+                      "deleting snapshot on device '%s': ",
+                      bdrv_get_device_name(bs));
     }
+    hmp_handle_error(mon, &err);
 }
=20
 void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
--=20
2.21.0


