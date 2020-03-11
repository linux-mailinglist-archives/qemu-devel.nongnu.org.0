Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13CE181CBA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:47:02 +0100 (CET)
Received: from localhost ([::1]:54562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3ZW-00005g-0k
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VD-0002iH-19
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VC-0002XP-0f
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40974
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VB-0002Wo-Su
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MWPhV+y2kBgTCwkC0yfNMHzSleKX6ycdVr9jjlicdOU=;
 b=CfWjE32rTqtCETNko3lTF7FpoxXRXao1jpny7m/H5XS5v0nP60cSgXi0gU2I+JLjHimR+C
 Qwmg/2QJvRcZpUiYexcacYlhNWyigmyyAwrOnu/bGeCkA/XcFbyma+i7xaPw6Wq0a4zEH+
 IhwJDSo61PyZ/4HIWjVu3d4Tj1kvFrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-dyzrZS-EMcyxk-2DKoZ9mw-1; Wed, 11 Mar 2020 11:42:29 -0400
X-MC-Unique: dyzrZS-EMcyxk-2DKoZ9mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 124D3DB60;
 Wed, 11 Mar 2020 15:42:28 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AB5D60BEE;
 Wed, 11 Mar 2020 15:42:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/13] iotests: Fix run_job() with use_log=False
Date: Wed, 11 Mar 2020 16:42:09 +0100
Message-Id: <20200311154218.15532-5-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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

The 'job-complete' QMP command should be run with qmp() rather than
qmp_log() if use_log=3DFalse is passed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200310113831.27293-4-kwolf@redhat.com>
Reviewed-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/iotests.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 8815052eb5..23043baa26 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -624,7 +624,10 @@ class VM(qtest.QEMUQtestMachine):
                         if use_log:
                             log('Job failed: %s' % (j['error']))
             elif status =3D=3D 'ready':
-                self.qmp_log('job-complete', id=3Djob)
+                if use_log:
+                    self.qmp_log('job-complete', id=3Djob)
+                else:
+                    self.qmp('job-complete', id=3Djob)
             elif status =3D=3D 'pending' and not auto_finalize:
                 if pre_finalize:
                     pre_finalize()
--=20
2.20.1


