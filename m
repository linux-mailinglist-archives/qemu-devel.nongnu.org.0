Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6163694F0C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 22:32:38 +0200 (CEST)
Received: from localhost ([::1]:57502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzoKT-0001K8-4K
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 16:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzo7o-0001qj-BX
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzo7n-0004f4-Dt
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:19:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43908)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzo7l-0004e0-A1; Mon, 19 Aug 2019 16:19:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9BC05C057E16;
 Mon, 19 Aug 2019 20:19:28 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 365591D0;
 Mon, 19 Aug 2019 20:19:28 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 22:18:51 +0200
Message-Id: <20190819201851.24418-9-mreitz@redhat.com>
In-Reply-To: <20190819201851.24418-1-mreitz@redhat.com>
References: <20190819201851.24418-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 19 Aug 2019 20:19:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 8/8] iotests: Cache supported_formats()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 8f315538e9..f6492b355f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -884,9 +884,17 @@ def qemu_pipe(*args):
 def supported_formats(read_only=3DFalse):
     '''Set 'read_only' to True to check ro-whitelist
        Otherwise, rw-whitelist is checked'''
-    format_message =3D qemu_pipe("-drive", "format=3Dhelp")
-    line =3D 1 if read_only else 0
-    return format_message.splitlines()[line].split(":")[1].split()
+
+    if not hasattr(supported_formats, "formats"):
+        supported_formats.formats =3D {}
+
+    if read_only not in supported_formats.formats:
+        format_message =3D qemu_pipe("-drive", "format=3Dhelp")
+        line =3D 1 if read_only else 0
+        supported_formats.formats[read_only] =3D \
+            format_message.splitlines()[line].split(":")[1].split()
+
+    return supported_formats.formats[read_only]
=20
 def skip_if_unsupported(required_formats=3D[], read_only=3DFalse):
     '''Skip Test Decorator
--=20
2.21.0


