Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C619162802
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 15:21:33 +0100 (CET)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j43ki-0007vJ-5q
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 09:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j43YF-0008MC-Ku
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j43YE-0001l6-JG
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57871
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j43YE-0001ku-EG
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582034918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrGTigJ/1KSoic/7Ee+x03+ohrW1sGqmo5MqQVR+98Y=;
 b=IVSiybqztAgdzM6JmdTzruoEyXnJ7C6nkVAvyMpgynhyjUvUBUWHhzZHCatTxinypPKPYc
 mkKLY6MKx3TTI9ykybKHlgdVm+0+q1ZgbfEuzJ4deu3uUc67zsWR4HQRl9h88+Aa4dkAoP
 WmEKLc1UwnYdl7h/rSImzFz8vCg8WQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-aDGXM-NNOviHVYJY9NepQw-1; Tue, 18 Feb 2020 09:08:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D71F8800EB2;
 Tue, 18 Feb 2020 14:08:31 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D41FB8B549;
 Tue, 18 Feb 2020 14:08:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 30/36] iotests: Use complete_and_wait() in 155
Date: Tue, 18 Feb 2020 15:07:16 +0100
Message-Id: <20200218140722.23876-31-kwolf@redhat.com>
In-Reply-To: <20200218140722.23876-1-kwolf@redhat.com>
References: <20200218140722.23876-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: aDGXM-NNOviHVYJY9NepQw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

This way, we get to see errors during the completion phase.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20200218103454.296704-14-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/155 | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index e35b1d534b..f237868710 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -163,12 +163,7 @@ class MirrorBaseClass(BaseClass):
=20
         self.assert_qmp(result, 'return', {})
=20
-        self.vm.event_wait('BLOCK_JOB_READY')
-
-        result =3D self.vm.qmp('block-job-complete', device=3D'mirror-job'=
)
-        self.assert_qmp(result, 'return', {})
-
-        self.vm.event_wait('BLOCK_JOB_COMPLETED')
+        self.complete_and_wait('mirror-job')
=20
     def testFull(self):
         self.runMirror('full')
--=20
2.20.1


