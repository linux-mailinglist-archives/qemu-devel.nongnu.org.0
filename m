Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444E78EDF4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 16:16:03 +0200 (CEST)
Received: from localhost ([::1]:42318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyGXq-0001I7-Dl
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 10:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1hyGWb-0000jO-Ih
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 10:14:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hyGWV-0000FX-VD
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 10:14:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hyGWV-0000F9-QA
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 10:14:39 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C4E0211A0E
 for <qemu-devel@nongnu.org>; Thu, 15 Aug 2019 14:14:38 +0000 (UTC)
Received: from localhost (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9D327DA4A;
 Thu, 15 Aug 2019 14:14:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 15 Aug 2019 15:14:28 +0100
Message-Id: <20190815141428.29080-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 15 Aug 2019 14:14:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] usb: reword -usb command-line option and
 mention xHCI
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
Cc: Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -usb section of the man page is not very clear on what exactly -usb
does and fails to mention xHCI as a modern alternative (-device
nec-usb-xhci).

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v2:
 * Use @option{-device ...} [Thomas]
 * Suggest qemu-xhci instead of nec-usb-xhci [Thomas and David]
---
 qemu-options.hx | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 9621e934c0..1fb362f06f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1436,12 +1436,15 @@ STEXI
 ETEXI
=20
 DEF("usb", 0, QEMU_OPTION_usb,
-    "-usb            enable the USB driver (if it is not used by default=
 yet)\n",
+    "-usb            enable on-board USB host controller (if not enabled=
 by default)\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -usb
 @findex -usb
-Enable the USB driver (if it is not used by default yet).
+Enable USB emulation on machine types with an on-board USB host controll=
er (if
+not enabled by default).  Note that on-board USB host controllers may no=
t
+support USB 3.0.  In this case @option{-device qemu-xhci} can be used in=
stead
+on machines with PCI.
 ETEXI
=20
 DEF("usbdevice", HAS_ARG, QEMU_OPTION_usbdevice,
--=20
2.21.0


