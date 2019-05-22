Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3488A2650D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 15:50:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTRdK-00082Z-7Q
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 09:50:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTRac-0006sD-9k
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTRab-0002ak-7h
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36104)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hTRab-0002aF-0Q
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:47:29 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 606B85D5FF
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 13:47:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 313741001281
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 13:47:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D63CD1132B6C; Wed, 22 May 2019 15:47:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 15:47:24 +0200
Message-Id: <20190522134726.19225-4-armbru@redhat.com>
In-Reply-To: <20190522134726.19225-1-armbru@redhat.com>
References: <20190522134726.19225-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 22 May 2019 13:47:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/5] gdbstub: Reject invalid RLE repeat counts
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Debugging with GDB / Appendix E GDB Remote Serial Protocol /
Overview" specifies "The printable characters '#' and '$' or with a
numeric value greater than 126 must not be used."  gdb_read_byte()
only rejects values < 32.  This is wrong.  Impact depends on the caller:

* gdb_handlesig() passes a char.  Incorrectly accepts '#', '$' and
  '\127'.

* gdb_chr_receive() passes an uint8_t.  Additionally accepts
  characters with the most-significant bit set.

Correct the validity check to match the specification.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190514180311.16028-4-armbru@redhat.com>
---
 gdbstub.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index d54abd17cc..c41eb1de07 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2064,7 +2064,11 @@ static void gdb_read_byte(GDBState *s, int ch)
             }
             break;
         case RS_GETLINE_RLE:
-            if (ch < ' ') {
+            /*
+             * Run-length encoding is explained in "Debugging with GDB /
+             * Appendix E GDB Remote Serial Protocol / Overview".
+             */
+            if (ch < ' ' || ch =3D=3D '#' || ch =3D=3D '$' || ch > 126) =
{
                 /* invalid RLE count encoding */
                 trace_gdbstub_err_invalid_repeat((uint8_t)ch);
                 s->state =3D RS_GETLINE;
--=20
2.17.2


