Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A1A23D1C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 18:21:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSl2d-0004Ch-Jy
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 12:21:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkwq-0008EE-Jn
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkwp-0003Y8-LC
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hSkwm-0003LT-Jn; Mon, 20 May 2019 12:15:32 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED5503092651;
	Mon, 20 May 2019 16:15:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-208.ams2.redhat.com
	[10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E68A601A0;
	Mon, 20 May 2019 16:15:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 20 May 2019 18:14:34 +0200
Message-Id: <20190520161453.30723-6-kwolf@redhat.com>
In-Reply-To: <20190520161453.30723-1-kwolf@redhat.com>
References: <20190520161453.30723-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 20 May 2019 16:15:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 05/24] iotest: fix 169: do not run qmp_cont in
 RUN_STATE_FINISH_MIGRATE
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

qmp_cont fails if vm in RUN_STATE_FINISH_MIGRATE, so let's wait for
final RUN_STATE_POSTMIGRATE. Also, while being here, check qmp_cont
result.

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/169 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/169
index 527aebd0cb..7e06cc1145 100755
--- a/tests/qemu-iotests/169
+++ b/tests/qemu-iotests/169
@@ -102,12 +102,17 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase)=
:
             event =3D self.vm_a.event_wait('MIGRATION')
             if event['data']['status'] =3D=3D 'completed':
                 break
+        while True:
+            result =3D self.vm_a.qmp('query-status')
+            if (result['return']['status'] =3D=3D 'postmigrate'):
+                break
=20
         # test that bitmap is still here
         removed =3D (not migrate_bitmaps) and persistent
         self.check_bitmap(self.vm_a, False if removed else sha256)
=20
-        self.vm_a.qmp('cont')
+        result =3D self.vm_a.qmp('cont')
+        self.assert_qmp(result, 'return', {})
=20
         # test that bitmap is still here after invalidation
         self.check_bitmap(self.vm_a, sha256)
--=20
2.20.1


