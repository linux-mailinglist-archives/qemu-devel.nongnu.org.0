Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFDE17A5C5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 13:56:59 +0100 (CET)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9q3e-0007kV-Dl
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 07:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43249)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j9py6-0008Rq-No
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:51:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j9py5-0006Lu-JM
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:51:14 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35539
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j9py5-0006Km-FU
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWmFsTqSPEH50eOtsc4mu7xbbfJh9pJRysylAo4hCak=;
 b=UACtu4tl3YSmcW1cn/Vllbn81bzMkOWUuGmDHsjUUiA8krZV3qgoSS4Fx6DS+Vf1NgtIYG
 chX5QT6Dtl6yEPcHbxUnyx0WVFAx1dZ4BEFEbVCKNivWTm+UShBz3wlfphbCbhK1sLewsw
 Yu7+rDIzcffeiKVUwRn8oS2AgHgbhzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-JtaASwOjNiCgZIYnOROrSg-1; Thu, 05 Mar 2020 07:51:11 -0500
X-MC-Unique: JtaASwOjNiCgZIYnOROrSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B5CA19067E1;
 Thu,  5 Mar 2020 12:51:10 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-210.ams2.redhat.com
 [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67CC5272A9;
 Thu,  5 Mar 2020 12:51:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/4] iotests: Fix run_job() with use_log=False
Date: Thu,  5 Mar 2020 13:50:59 +0100
Message-Id: <20200305125100.386-4-kwolf@redhat.com>
In-Reply-To: <20200305125100.386-1-kwolf@redhat.com>
References: <20200305125100.386-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'job-complete' QMP command should be run with qmp() rather than
qmp_log() if use_log=3DFalse is passed.

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


