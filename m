Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D78A6C05
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 16:57:59 +0200 (CEST)
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5AFq-0003Jm-7f
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 10:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i5AEd-0002Fs-GG
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 10:56:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i5AEc-0008Ko-Cj
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 10:56:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36706)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1i5AEZ-0008JM-Q7; Tue, 03 Sep 2019 10:56:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1F29CC057FA6;
 Tue,  3 Sep 2019 14:56:38 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81E915D9E1;
 Tue,  3 Sep 2019 14:56:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 09:56:34 -0500
Message-Id: <20190903145634.20237-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 03 Sep 2019 14:56:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] docs: Update preferred NBD device syntax
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
Cc: vsementsov@virtuozzo.com, rjones@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mention the preferred URI form, especially since NBD is trying to
standardize that form: https://lists.debian.org/nbd/2019/06/msg00012.html

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-doc.texi | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 577d1e837640..c83fb347d77e 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -297,7 +297,14 @@ qemu-system-i386 -drive file=3Discsi://192.0.2.1/iqn=
.2001-04.com.example/1

 @item NBD
 QEMU supports NBD (Network Block Devices) both using TCP protocol as wel=
l
-as Unix Domain Sockets.
+as Unix Domain Sockets.  With TCP, the default port is 10809.

-Syntax for specifying a NBD device using TCP
+Syntax for specifying a NBD device using TCP, in preferred URI form:
+``nbd://<server-ip>[:<port>]/[<export>]''
+
+Syntax for specifying a NBD device using Unix Domain Sockets; remember
+that '?' is a shell glob character and may need quoting:
+``nbd+unix:///[<export>]?socket=3D<domain-socket>''
+
+Older syntax that is also recognized:
 ``nbd:<server-ip>:<port>[:exportname=3D<export>]''

-Syntax for specifying a NBD device using Unix Domain Sockets
 ``nbd:unix:<domain-socket>[:exportname=3D<export>]''

 Example for TCP
 @example
-qemu-system-i386 --drive file=3Dnbd:192.0.2.1:30000
+qemu-system-i386 --drive file=3Dnbd://192.0.2.1:30000
 @end example

 Example for Unix Domain Sockets
 @example
-qemu-system-i386 --drive file=3Dnbd:unix:/tmp/nbd-socket
+qemu-system-i386 --drive "file=3Dnbd+unix:///?socket=3D/tmp/nbd-socket"
 @end example

 @item SSH
--=20
2.21.0


