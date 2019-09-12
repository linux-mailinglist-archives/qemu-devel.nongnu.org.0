Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B0B109C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:04:11 +0200 (CEST)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Phh-0002ZL-B8
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8PR7-0003FP-Pk
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:47:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8PR6-0001bQ-EC
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:47:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46628)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8PR3-0001Zu-Jd; Thu, 12 Sep 2019 09:46:57 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E599E307D942;
 Thu, 12 Sep 2019 13:46:56 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-179.ams2.redhat.com
 [10.36.116.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC4CC600C4;
 Thu, 12 Sep 2019 13:46:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 12 Sep 2019 15:46:03 +0200
Message-Id: <20190912134604.22019-22-kwolf@redhat.com>
In-Reply-To: <20190912134604.22019-1-kwolf@redhat.com>
References: <20190912134604.22019-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 12 Sep 2019 13:46:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 21/22] block/create: Do not abort if a block
 driver is not available
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The 'blockdev-create' QMP command was introduced as experimental
feature in commit b0292b851b8, using the assert() debug call.
It got promoted to 'stable' command in 3fb588a0f2c, but the
assert call was not removed.

Some block drivers are optional, and bdrv_find_format() might
return a NULL value, triggering the assertion.

Stable code is not expected to abort, so return an error instead.

This is easily reproducible when libnfs is not installed:

  ./configure
  [...]
  module support    no
  Block whitelist (rw)
  Block whitelist (ro)
  libiscsi support  yes
  libnfs support    no
  [...]

Start QEMU:

  $ qemu-system-x86_64 -S -qmp unix:/tmp/qemu.qmp,server,nowait

Send the 'blockdev-create' with the 'nfs' driver:

  $ ( cat << 'EOF'
  {'execute': 'qmp_capabilities'}
  {'execute': 'blockdev-create', 'arguments': {'job-id': 'x', 'options': =
{'size': 0, 'driver': 'nfs', 'location': {'path': '/', 'server': {'host':=
 '::1', 'type': 'inet'}}}}, 'id': 'x'}
  EOF
  ) | socat STDIO UNIX:/tmp/qemu.qmp
  {"QMP": {"version": {"qemu": {"micro": 50, "minor": 1, "major": 4}, "pa=
ckage": "v4.1.0-733-g89ea03a7dc"}, "capabilities": ["oob"]}}
  {"return": {}}

QEMU crashes:

  $ gdb qemu-system-x86_64 core
  Program received signal SIGSEGV, Segmentation fault.
  (gdb) bt
  #0  0x00007ffff510957f in raise () at /lib64/libc.so.6
  #1  0x00007ffff50f3895 in abort () at /lib64/libc.so.6
  #2  0x00007ffff50f3769 in _nl_load_domain.cold.0 () at /lib64/libc.so.6
  #3  0x00007ffff5101a26 in .annobin_assert.c_end () at /lib64/libc.so.6
  #4  0x0000555555d7e1f1 in qmp_blockdev_create (job_id=3D0x555556baee40 =
"x", options=3D0x555557666610, errp=3D0x7fffffffc770) at block/create.c:6=
9
  #5  0x0000555555c96b52 in qmp_marshal_blockdev_create (args=3D0x7fffdc0=
03830, ret=3D0x7fffffffc7f8, errp=3D0x7fffffffc7f0) at qapi/qapi-commands=
-block-core.c:1314
  #6  0x0000555555deb0a0 in do_qmp_dispatch (cmds=3D0x55555645de70 <qmp_c=
ommands>, request=3D0x7fffdc005c70, allow_oob=3Dfalse, errp=3D0x7fffffffc=
898) at qapi/qmp-dispatch.c:131
  #7  0x0000555555deb2a1 in qmp_dispatch (cmds=3D0x55555645de70 <qmp_comm=
ands>, request=3D0x7fffdc005c70, allow_oob=3Dfalse) at qapi/qmp-dispatch.=
c:174

With this patch applied, QEMU returns a QMP error:

  {'execute': 'blockdev-create', 'arguments': {'job-id': 'x', 'options': =
{'size': 0, 'driver': 'nfs', 'location': {'path': '/', 'server': {'host':=
 '::1', 'type': 'inet'}}}}, 'id': 'x'}
  {"id": "x", "error": {"class": "GenericError", "desc": "Block driver 'n=
fs' not found or not supported"}}

Cc: qemu-stable@nongnu.org
Reported-by: Xu Tian <xutian@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/create.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/create.c b/block/create.c
index 1bd00ed5f8..89812669df 100644
--- a/block/create.c
+++ b/block/create.c
@@ -64,9 +64,13 @@ void qmp_blockdev_create(const char *job_id, BlockdevC=
reateOptions *options,
     const char *fmt =3D BlockdevDriver_str(options->driver);
     BlockDriver *drv =3D bdrv_find_format(fmt);
=20
+    if (!drv) {
+        error_setg(errp, "Block driver '%s' not found or not supported",=
 fmt);
+        return;
+    }
+
     /* If the driver is in the schema, we know that it exists. But it ma=
y not
      * be whitelisted. */
-    assert(drv);
     if (bdrv_uses_whitelist() && !bdrv_is_whitelisted(drv, false)) {
         error_setg(errp, "Driver is not whitelisted");
         return;
--=20
2.20.1


