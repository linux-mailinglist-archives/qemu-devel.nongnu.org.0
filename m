Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF583E7E2A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 19:23:18 +0200 (CEST)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDVTB-0006YH-Hy
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 13:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1mDUwX-0003Zs-BH
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:49:33 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:59250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1mDUwV-0001wP-VR
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:49:33 -0400
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id AACCD11EF11;
 Tue, 10 Aug 2021 16:49:30 +0000 (UTC)
From: ~archi42 <archi42@git.sr.ht>
Date: Tue, 10 Aug 2021 18:04:36 +0200
Subject: [PATCH qemu 1/1] docs: how to use gdb with unix sockets
Message-ID: <162861417028.13673.3981098709822414721-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <162861417028.13673.3981098709822414721-0@git.sr.ht>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Aug 2021 13:21:40 -0400
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
Reply-To: ~archi42 <sourcehut@mailhell.seb7.de>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sebastian Meyer <meyer@absint.com>

Signed-off-by: Sebastian Meyer <meyer@absint.com>
---
 docs/system/gdb.rst | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 144d083df3..2ff4d6aab5 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -15,7 +15,8 @@ The ``-s`` option will make QEMU listen for an incoming con=
nection
 from gdb on TCP port 1234, and ``-S`` will make QEMU not start the
 guest until you tell it to from gdb. (If you want to specify which
 TCP port to use or to use something other than TCP for the gdbstub
-connection, use the ``-gdb dev`` option instead of ``-s``.)
+connection, use the ``-gdb dev`` option instead of ``-s``. See
+further below for an example using unix sockets.)
=20
 .. parsed-literal::
=20
@@ -168,3 +169,24 @@ The memory mode can be checked by sending the following =
command:
=20
 ``maintenance packet Qqemu.PhyMemMode:0``
     This will change it back to normal memory mode.
+
+Using unix sockets
+^^^^^^^^^^^^^^^^^^
+
+An alternate method for connecting gdb to the qemu gdbstub are unix
+sockets (if supported by your operating system). This is useful when
+running serveral tests in parallel and/or you do not know a free tcp
+port a priori (e.g. when running automated tests).
+First create a new chardev with the appropriate options, then
+instruct the gdbserver to use that device::
+
+.. parsed-literal::
+
+   |qemu_system| -chardev socket,path=3D/tmp/gdb-socket,server=3Don,wait=3Do=
ff,id=3Dgdb0 -gdb chardev:gdb0 -S -kernel bzImage -hda rootdisk.img -append "=
root=3D/dev/hda"
+
+Start gdb as before, but this time connect using the path to
+the socket::
+
+   (gdb) target remote /tmp/gdb-socket
+
+Please mind that this usually requires gdb version 9.0 or newer.
--=20
2.32.0

