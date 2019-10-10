Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E07FD29E2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 14:46:52 +0200 (CEST)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIXqE-00071u-Uz
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 08:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iIXSF-00018Y-RG
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:22:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iIXSE-0005pk-58
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:22:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iIXSD-0005pP-Vx
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:22:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E77A810DCCA2
 for <qemu-devel@nongnu.org>; Thu, 10 Oct 2019 12:22:00 +0000 (UTC)
Received: from localhost (ovpn-117-170.ams2.redhat.com [10.36.117.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5168A5DA2C;
 Thu, 10 Oct 2019 12:21:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] trace: avoid "is" with a literal Python 3.8 warnings
Date: Thu, 10 Oct 2019 13:21:54 +0100
Message-Id: <20191010122154.10553-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 10 Oct 2019 12:22:00 +0000 (UTC)
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following statement produces a SyntaxWarning with Python 3.8:

  if len(format) is 0:
  scripts/tracetool/__init__.py:459: SyntaxWarning: "is" with a literal. =
Did you mean "=3D=3D"?

Use the conventional len(x) =3D=3D 0 syntax instead.

Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 scripts/tracetool/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.p=
y
index 04279fa62e..44c118bc2a 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -456,12 +456,12 @@ def generate(events, group, format, backends,
     import tracetool
=20
     format =3D str(format)
-    if len(format) is 0:
+    if len(format) =3D=3D 0:
         raise TracetoolError("format not set")
     if not tracetool.format.exists(format):
         raise TracetoolError("unknown format: %s" % format)
=20
-    if len(backends) is 0:
+    if len(backends) =3D=3D 0:
         raise TracetoolError("no backends specified")
     for backend in backends:
         if not tracetool.backend.exists(backend):
--=20
2.21.0


