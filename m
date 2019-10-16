Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E903CD9A06
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 21:28:47 +0200 (CEST)
Received: from localhost ([::1]:47438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKoyU-00060p-Po
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 15:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iKovH-0002IK-CI
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 15:25:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iKovF-0002ln-UL
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 15:25:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60188)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1iKovD-0002jd-M4; Wed, 16 Oct 2019 15:25:23 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E718B18CB904;
 Wed, 16 Oct 2019 19:25:22 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 854CE60BF7;
 Wed, 16 Oct 2019 19:25:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] image-fuzzer: Use errors parameter of subprocess.Popen()
Date: Wed, 16 Oct 2019 16:24:30 -0300
Message-Id: <20191016192430.25098-11-ehabkost@redhat.com>
In-Reply-To: <20191016192430.25098-1-ehabkost@redhat.com>
References: <20191016192430.25098-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Wed, 16 Oct 2019 19:25:22 +0000 (UTC)
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of manually encoding stderr and stdout output, use
`errors` parameter of subprocess.Popen().  This will make
process.communicate() return unicode strings instead of bytes
objects.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 tests/image-fuzzer/runner.py | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/image-fuzzer/runner.py b/tests/image-fuzzer/runner.py
index 0793234815..4ba5c79e13 100755
--- a/tests/image-fuzzer/runner.py
+++ b/tests/image-fuzzer/runner.py
@@ -79,16 +79,13 @@ def run_app(fd, q_args):
     devnull =3D open('/dev/null', 'r+')
     process =3D subprocess.Popen(q_args, stdin=3Ddevnull,
                                stdout=3Dsubprocess.PIPE,
-                               stderr=3Dsubprocess.PIPE)
+                               stderr=3Dsubprocess.PIPE,
+                               errors=3D'replace')
     try:
         out, err =3D process.communicate()
         signal.alarm(0)
-        # fd is a text file, so we need to decode the process output bef=
ore
-        # writing to it.
-        # We could be simply using the `errors` parameter of subprocess.=
Popen(),
-        # but this will be possible only after migrating to Python 3
-        fd.write(out.decode(errors=3D'replace'))
-        fd.write(err.decode(errors=3D'replace'))
+        fd.write(out)
+        fd.write(err)
         fd.flush()
         return process.returncode
=20
--=20
2.21.0


