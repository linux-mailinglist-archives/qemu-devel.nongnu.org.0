Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C3213140C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:48:17 +0100 (CET)
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTg0-0003EQ-Hx
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43237)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ioTaX-0005jT-8Q
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ioTaW-0008Nh-5J
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26222
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ioTaW-0008NF-2Q
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGUsSHviFiMFZM+Ex3/VmZDtOXy0QymT91TaVIBYx3o=;
 b=Mz00BfDZeQbtXC1MFtDvpwoSGMBUkxdw1smFwiBA2peseYx16tMdywPlH+U6ClhZHCAxcH
 h7w8Ww5rcljCjbtzhRlBknxlQ6Bh1kpyIjYf4GP89wSiK5Y749FWWBv5w4bi+XEOPkbDU1
 s6GsrmAkCNf9+S9NNaaIjTm2BhSgEww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-bOjreZorPmm5FGVBFUjPXw-1; Mon, 06 Jan 2020 09:42:32 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5A0A108C317;
 Mon,  6 Jan 2020 14:42:30 +0000 (UTC)
Received: from localhost (ovpn-117-91.ams2.redhat.com [10.36.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81A2B60F89;
 Mon,  6 Jan 2020 14:42:28 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/34] iotests: Add @error to wait_until_completed
Date: Mon,  6 Jan 2020 15:41:36 +0100
Message-Id: <20200106144206.698920-5-mreitz@redhat.com>
In-Reply-To: <20200106144206.698920-1-mreitz@redhat.com>
References: <20200106144206.698920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: bOjreZorPmm5FGVBFUjPXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

Callers can use this new parameter to expect failure during the
completion process.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20191108123455.39445-5-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 8739ec6613..13fd8b5cd2 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -811,15 +811,20 @@ class QMPTestCase(unittest.TestCase):
         self.assert_no_active_block_jobs()
         return result
=20
-    def wait_until_completed(self, drive=3D'drive0', check_offset=3DTrue, =
wait=3D60.0):
+    def wait_until_completed(self, drive=3D'drive0', check_offset=3DTrue, =
wait=3D60.0,
+                             error=3DNone):
         '''Wait for a block job to finish, returning the event'''
         while True:
             for event in self.vm.get_qmp_events(wait=3Dwait):
                 if event['event'] =3D=3D 'BLOCK_JOB_COMPLETED':
                     self.assert_qmp(event, 'data/device', drive)
-                    self.assert_qmp_absent(event, 'data/error')
-                    if check_offset:
-                        self.assert_qmp(event, 'data/offset', event['data'=
]['len'])
+                    if error is None:
+                        self.assert_qmp_absent(event, 'data/error')
+                        if check_offset:
+                            self.assert_qmp(event, 'data/offset',
+                                            event['data']['len'])
+                    else:
+                        self.assert_qmp(event, 'data/error', error)
                     self.assert_no_active_block_jobs()
                     return event
                 elif event['event'] =3D=3D 'JOB_STATUS_CHANGE':
@@ -837,7 +842,8 @@ class QMPTestCase(unittest.TestCase):
         self.assert_qmp(event, 'data/type', 'mirror')
         self.assert_qmp(event, 'data/offset', event['data']['len'])
=20
-    def complete_and_wait(self, drive=3D'drive0', wait_ready=3DTrue):
+    def complete_and_wait(self, drive=3D'drive0', wait_ready=3DTrue,
+                          completion_error=3DNone):
         '''Complete a block job and wait for it to finish'''
         if wait_ready:
             self.wait_ready(drive=3Ddrive)
@@ -845,7 +851,7 @@ class QMPTestCase(unittest.TestCase):
         result =3D self.vm.qmp('block-job-complete', device=3Ddrive)
         self.assert_qmp(result, 'return', {})
=20
-        event =3D self.wait_until_completed(drive=3Ddrive)
+        event =3D self.wait_until_completed(drive=3Ddrive, error=3Dcomplet=
ion_error)
         self.assert_qmp(event, 'data/type', 'mirror')
=20
     def pause_wait(self, job_id=3D'job0'):
--=20
2.24.1


