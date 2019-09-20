Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2654EB94F0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 18:09:00 +0200 (CEST)
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBLSs-0000WV-1A
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 12:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iBKq7-00016j-S2
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:28:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iBKq5-0004hS-Kd
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:28:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15065)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iBKpz-0004au-Nv; Fri, 20 Sep 2019 11:28:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4950810C0928;
 Fri, 20 Sep 2019 15:28:44 +0000 (UTC)
Received: from localhost (unknown [10.40.205.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D566A60C80;
 Fri, 20 Sep 2019 15:28:43 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 16/22] iotests: Use complete_and_wait() in 155
Date: Fri, 20 Sep 2019 17:27:58 +0200
Message-Id: <20190920152804.12875-17-mreitz@redhat.com>
In-Reply-To: <20190920152804.12875-1-mreitz@redhat.com>
References: <20190920152804.12875-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Fri, 20 Sep 2019 15:28:44 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This way, we get to see errors during the completion phase.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/155 | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index e19485911c..d7ef2579d3 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -163,12 +163,7 @@ class MirrorBaseClass(BaseClass):
=20
         self.assert_qmp(result, 'return', {})
=20
-        self.vm.event_wait('BLOCK_JOB_READY')
-
-        result =3D self.vm.qmp('block-job-complete', device=3D'mirror-jo=
b')
-        self.assert_qmp(result, 'return', {})
-
-        self.vm.event_wait('BLOCK_JOB_COMPLETED')
+        self.complete_and_wait('mirror-job')
=20
     def testFull(self):
         self.runMirror('full')
--=20
2.21.0


