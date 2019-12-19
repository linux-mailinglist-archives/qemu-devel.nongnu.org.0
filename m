Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB33126891
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 19:00:35 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii06D-0000dn-PM
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 13:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihzYl-0007GE-Kr
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:26:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihzYi-0008DH-G0
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:58 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57375
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihzYh-00089t-1B
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576776354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDVqTpY3pjj42+37hfJNvN2IixURt4Ln1YS2ABghS38=;
 b=XTYqATv3Z24rQMb6GI5MgSJMJYwnu/xC7NDln33+pe3wyX/rG2T8+hyGrAyPofQG73vZSU
 EdIiiem8jXxLKqPJ28teDVSW/RXAZ+hwPkEG6E2MmmB0sJkLsWIRv7rOeC9JLEhzYK2xjt
 8D6UAZ54JOWjEGnkBNnpTvqFd0OcC0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-BIBfJ0r_PPyzRza2och-Xw-1; Thu, 19 Dec 2019 12:25:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7C99DB61;
 Thu, 19 Dec 2019 17:25:36 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 077EB620C0;
 Thu, 19 Dec 2019 17:25:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 26/30] iotests: 207: Remove duplication with
 VM.blockdev_create()
Date: Thu, 19 Dec 2019 18:24:37 +0100
Message-Id: <20191219172441.7289-27-kwolf@redhat.com>
In-Reply-To: <20191219172441.7289-1-kwolf@redhat.com>
References: <20191219172441.7289-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: BIBfJ0r_PPyzRza2och-Xw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

The blockdev_create() function in this test case adds another filter to
the logging, but provides otherwise the same functionality as
VM.blockdev_create() from iotests.py. Make it a thin wrapper around the
iotests.py function.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/207 | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/207 b/tests/qemu-iotests/207
index ec8c1d06f0..812ab34e47 100755
--- a/tests/qemu-iotests/207
+++ b/tests/qemu-iotests/207
@@ -35,13 +35,7 @@ def filter_hash(qmsg):
     return iotests.filter_qmp(qmsg, _filter)
=20
 def blockdev_create(vm, options):
-    result =3D vm.qmp_log('blockdev-create', job_id=3D'job0', options=3Dop=
tions,
-                        filters=3D[iotests.filter_qmp_testfiles, filter_ha=
sh])
-
-    if 'return' in result:
-        assert result['return'] =3D=3D {}
-        vm.run_job('job0')
-    iotests.log("")
+    vm.blockdev_create(options, filters=3D[iotests.filter_qmp_testfiles, f=
ilter_hash])
=20
 with iotests.FilePath('t.img') as disk_path, \
      iotests.VM() as vm:
--=20
2.20.1


