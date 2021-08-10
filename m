Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BE33E8CE6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:09:52 +0200 (CEST)
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDkFD-00053c-QN
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1mDkCy-0008E5-5x
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:07:32 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:56454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1mDkCw-0000en-Pg
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:07:31 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 85DA111EEAC
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 09:07:28 +0000 (UTC)
From: ~archi42 <archi42@git.sr.ht>
Date: Tue, 10 Aug 2021 18:04:36 +0200
Subject: [PATCH qemu v2] docs: how to use gdb with unix sockets (v2)
Message-ID: <162867284829.27377.4784930719350564918-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sebastian Meyer <meyer@absint.com>

This includes the changes suggested by Philippe.
I kept the `-S` in the command line. The user shall
use that instead of `wait=3Don`.

Signed-off-by: Sebastian Meyer <meyer@absint.com>
---
 docs/system/gdb.rst | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 144d083df3..f7411cb8ed 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -15,7 +15,8 @@ The ``-s`` option will make QEMU listen for an incoming con=
nection
 from gdb on TCP port 1234, and ``-S`` will make QEMU not start the
 guest until you tell it to from gdb. (If you want to specify which
 TCP port to use or to use something other than TCP for the gdbstub
-connection, use the ``-gdb dev`` option instead of ``-s``.)
+connection, use the ``-gdb dev`` option instead of ``-s``. See
+`Using unix sockets`_ for an example.)
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
+An alternate method for connecting gdb to the QEMU gdbstub are unix
+sockets (if supported by your operating system). This is useful when
+running several tests in parallel and/or you do not have a free TCP
+port a priori (e.g. when running automated tests).
+First create a chardev with the appropriate options, then
+instruct the gdbserver to use that device::
+
+.. parsed-literal::
+
+   |qemu_system| -chardev socket,path=3D/tmp/gdb-socket,server=3Don,wait=3Do=
ff,id=3Dgdb0 -gdb chardev:gdb0 -S ...
+
+Start gdb as before, but this time connect using the path to
+the socket::
+
+   (gdb) target remote /tmp/gdb-socket
+
+Note gdb version 9.0 or newer is required.
--=20
2.32.0

