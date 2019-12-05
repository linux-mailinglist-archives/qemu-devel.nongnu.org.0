Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23360114267
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 15:16:09 +0100 (CET)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icrvG-0000M9-Sf
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 09:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aastier@freebox.fr>) id 1icrmY-0000hx-OW
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 09:07:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aastier@freebox.fr>) id 1icrmX-0002zt-87
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 09:07:02 -0500
Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12]:21377)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aastier@freebox.fr>) id 1icrmW-0002kT-U3
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 09:07:01 -0500
Received: from anisse-station.iliad.local (unknown
 [IPv6:2a01:e34:ec0d:40e0:6c55:3f21:f604:859c])
 by smtp3-g21.free.fr (Postfix) with ESMTPS id 50C3F13F8DC;
 Thu,  5 Dec 2019 15:06:50 +0100 (CET)
From: Anisse Astier <aastier@freebox.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH] socket: websocket refresh of max_size outside of poll
Date: Thu,  5 Dec 2019 15:06:45 +0100
Message-Id: <20191205140645.6071-1-aastier@freebox.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
 [fuzzy]
X-Received-From: 2a01:e0c:1:1599::12
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
Cc: Anisse Astier <aastier@freebox.fr>, Julia Suvorova <jusual@mail.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because serial backend readiness isn't checked, the socket frontend (in
websocket mode) would send new characters before previous characters
were consumed. This lead to skipped characters, or worse, SysRq keys
being triggered.

This patch ensures the readable size is refreshed before consuming any
data. Normally, this size is refreshed in the event loop by the glib
prepare io_watch_poll_prepare; but since the websocket reader is a
greedy one to decode the websocket protocol, (whereas tcp one ready
bytes as necessary), there's nothing to read or poll, so the max_size
wouldn't be refreshed.

Buglink: https://bugs.launchpad.net/qemu/+bug/1828608
Signed-off-by: Anisse Astier <aastier@freebox.fr>
---
 chardev/char-socket.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 185fe38dda..5e093e6605 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -505,6 +505,9 @@ static gboolean tcp_chr_read(QIOChannel *chan, GIOCon=
dition cond, void *opaque)
     uint8_t buf[CHR_READ_BUF_LEN];
     int len, size;
=20
+    if(s->is_websock)
+        /* Greedy reader does not have event loop refresh by tcp_chr_rea=
d_poll */
+        s->max_size =3D qemu_chr_be_can_write(chr);
     if ((s->state !=3D TCP_CHARDEV_STATE_CONNECTED) ||
         s->max_size <=3D 0) {
         return TRUE;
--=20
2.20.1


