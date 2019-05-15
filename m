Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF31FB71
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 22:20:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hR0Ns-0000kN-Ja
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 16:20:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hR0JH-0005ua-JH
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:15:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hR0JG-0007qJ-K8
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:15:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38536)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hR0J2-0007bO-0g; Wed, 15 May 2019 16:15:17 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F16331760ED;
	Wed, 15 May 2019 20:15:13 +0000 (UTC)
Received: from localhost (unknown [10.40.205.95])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99D351972A;
	Wed, 15 May 2019 20:15:12 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 15 May 2019 22:15:02 +0200
Message-Id: <20190515201503.19069-4-mreitz@redhat.com>
In-Reply-To: <20190515201503.19069-1-mreitz@redhat.com>
References: <20190515201503.19069-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 15 May 2019 20:15:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/4] iotests.py: Fix VM.run_job
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

log() is in the current module, there is no need to prefix it.  In fact,
doing so may make VM.run_job() unusable in tests that never use
iotests.log() themselves.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index d96ba1f63c..7bde380d96 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -552,7 +552,7 @@ class VM(qtest.QEMUQtestMachine):
                     elif status =3D=3D 'null':
                         return error
                 else:
-                    iotests.log(ev)
+                    log(ev)
=20
     def node_info(self, node_name):
         nodes =3D self.qmp('query-named-block-nodes')
--=20
2.21.0


