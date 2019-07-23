Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF71B71240
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 09:02:42 +0200 (CEST)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpoor-0006nA-Bm
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 03:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35702)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hpooe-0006Ou-Vw
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 03:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hpood-0008V2-La
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 03:02:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58588)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hpood-0008Ua-Ga
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 03:02:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7FB2D30BD1B6;
 Tue, 23 Jul 2019 07:02:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-56.brq.redhat.com [10.40.204.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8443B19C58;
 Tue, 23 Jul 2019 07:02:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 09:02:18 +0200
Message-Id: <20190723070218.3606-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 23 Jul 2019 07:02:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] NSIS: Add missing firmware blobs
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various firmwares has been added in the pc-bios/ directory:

- CCW     (since commit 0c1fecdd523)
- skiboot (since commit bcad45de6a0)
- EDK2    (since commit f7fa38b74c3)

Since we install qemu-system able to run the architectures
targetted by these firmware, include them in the NSIS exe.

Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Add *.ndrv, update the Uninstall section (Stefan)
---
 qemu.nsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/qemu.nsi b/qemu.nsi
index 75f1608b9e..d0df0f4e3a 100644
--- a/qemu.nsi
+++ b/qemu.nsi
@@ -106,6 +106,9 @@ RequestExecutionLevel admin
 ;--------------------------------
=20
 ; The stuff to install.
+;
+; Remember to keep the "Uninstall" section in sync.
+
 Section "${PRODUCT} (required)"
=20
     SectionIn RO
@@ -122,6 +125,10 @@ Section "${PRODUCT} (required)"
     File "${BINDIR}\*.bmp"
     File "${BINDIR}\*.bin"
     File "${BINDIR}\*.dtb"
+    File "${BINDIR}\*.fd"
+    File "${BINDIR}\*.img"
+    File "${BINDIR}\*.lid"
+    File "${BINDIR}\*.ndrv"
     File "${BINDIR}\*.rom"
     File "${BINDIR}\openbios-*"
=20
@@ -210,6 +217,10 @@ Section "Uninstall"
     Delete "$INSTDIR\*.bin"
     Delete "$INSTDIR\*.dll"
     Delete "$INSTDIR\*.dtb"
+    Delete "$INSTDIR\*.fd"
+    Delete "$INSTDIR\*.img"
+    Delete "$INSTDIR\*.lid"
+    Delete "$INSTDIR\*.ndrv"
     Delete "$INSTDIR\*.rom"
     Delete "$INSTDIR\openbios-*"
     Delete "$INSTDIR\qemu-img.exe"
--=20
2.20.1


