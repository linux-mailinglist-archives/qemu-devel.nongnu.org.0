Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B8AAADBA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 23:18:11 +0200 (CEST)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5z8r-0003Lf-TA
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 17:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36342)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i5z6X-0001i2-Vf
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 17:15:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i5z6W-0002CO-IF
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 17:15:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36688)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1i5z6T-0002A0-D6; Thu, 05 Sep 2019 17:15:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BADC73064FB0;
 Thu,  5 Sep 2019 21:15:40 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA9F36060D;
 Thu,  5 Sep 2019 21:15:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  5 Sep 2019 16:15:14 -0500
Message-Id: <20190905211522.2824-2-eblake@redhat.com>
In-Reply-To: <20190905211522.2824-1-eblake@redhat.com>
References: <20190905211522.2824-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 05 Sep 2019 21:15:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 1/9] nbd: Advertise multi-conn for shared
 read-only connections
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The NBD specification defines NBD_FLAG_CAN_MULTI_CONN, which can be
advertised when the server promises cache consistency between
simultaneous clients (basically, rules that determine what FUA and
flush from one client are able to guarantee for reads from another
client).  When we don't permit simultaneous clients (such as qemu-nbd
without -e), the bit makes no sense; and for writable images, we
probably have a lot more work before we can declare that actions from
one client are cache-consistent with actions from another.  But for
read-only images, where flush isn't changing any data, we might as
well advertise multi-conn support.  What's more, advertisement of the
bit makes it easier for clients to determine if 'qemu-nbd -e' was in
use, where a second connection will succeed rather than hang until the
first client goes away.

This patch affects qemu as server in advertising the bit.  We may want
to consider patches to qemu as client to attempt parallel connections
for higher throughput by spreading the load over those connections
when a server advertises multi-conn, but for now sticking to one
connection per nbd:// BDS is okay.

See also: https://bugzilla.redhat.com/1708300
Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190815185024.7010-1-eblake@redhat.com>
[eblake: tweak blockdev-nbd.c to not request shared when writable,
fix iotest 233]
Reviewed-by: John Snow <jsnow@redhat.com>
---
 docs/interop/nbd.txt       | 1 +
 include/block/nbd.h        | 2 +-
 blockdev-nbd.c             | 2 +-
 nbd/server.c               | 4 +++-
 qemu-nbd.c                 | 2 +-
 tests/qemu-iotests/223.out | 2 +-
 6 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index fc64473e02b2..6dfec7f47647 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -53,3 +53,4 @@ the operation of that feature.
 * 2.12: NBD_CMD_BLOCK_STATUS for "base:allocation"
 * 3.0: NBD_OPT_STARTTLS with TLS Pre-Shared Keys (PSK),
 NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
+* 4.2: NBD_FLAG_CAN_MULTI_CONN for sharable read-only exports
diff --git a/include/block/nbd.h b/include/block/nbd.h
index 7b36d672f046..991fd52a5134 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -326,7 +326,7 @@ typedef struct NBDClient NBDClient;

 NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
                           uint64_t size, const char *name, const char *d=
esc,
-                          const char *bitmap, uint16_t nbdflags,
+                          const char *bitmap, uint16_t nbdflags, bool sh=
ared,
                           void (*close)(NBDExport *), bool writethrough,
                           BlockBackend *on_eject_blk, Error **errp);
 void nbd_export_close(NBDExport *exp);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index c621686131fd..1fcfdb0997c6 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -188,7 +188,7 @@ void qmp_nbd_server_add(const char *device, bool has_=
name, const char *name,
     }

     exp =3D nbd_export_new(bs, 0, len, name, NULL, bitmap,
-                         writable ? 0 : NBD_FLAG_READ_ONLY,
+                         writable ? 0 : NBD_FLAG_READ_ONLY, !writable,
                          NULL, false, on_eject_blk, errp);
     if (!exp) {
         return;
diff --git a/nbd/server.c b/nbd/server.c
index f55ccf8edfde..0fb41c6c50ea 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1461,7 +1461,7 @@ static void nbd_eject_notifier(Notifier *n, void *d=
ata)

 NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
                           uint64_t size, const char *name, const char *d=
esc,
-                          const char *bitmap, uint16_t nbdflags,
+                          const char *bitmap, uint16_t nbdflags, bool sh=
ared,
                           void (*close)(NBDExport *), bool writethrough,
                           BlockBackend *on_eject_blk, Error **errp)
 {
@@ -1487,6 +1487,8 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uin=
t64_t dev_offset,
     perm =3D BLK_PERM_CONSISTENT_READ;
     if ((nbdflags & NBD_FLAG_READ_ONLY) =3D=3D 0) {
         perm |=3D BLK_PERM_WRITE;
+    } else if (shared) {
+        nbdflags |=3D NBD_FLAG_CAN_MULTI_CONN;
     }
     blk =3D blk_new(bdrv_get_aio_context(bs), perm,
                   BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 83b6c32d73aa..2403ef3d0f9f 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1173,7 +1173,7 @@ int main(int argc, char **argv)
     }

     export =3D nbd_export_new(bs, dev_offset, fd_size, export_name,
-                            export_description, bitmap, nbdflags,
+                            export_description, bitmap, nbdflags, shared=
 > 1,
                             nbd_export_closed, writethrough, NULL,
                             &error_fatal);

diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
index d5201b2356a3..2bca28ae72f9 100644
--- a/tests/qemu-iotests/223.out
+++ b/tests/qemu-iotests/223.out
@@ -40,7 +40,7 @@ exports available: 0
 exports available: 2
  export: 'n'
   size:  4194304
-  flags: 0x4ef ( readonly flush fua trim zeroes df cache )
+  flags: 0x5ef ( readonly flush fua trim zeroes df multi cache )
   min block: 1
   opt block: 4096
   max block: 33554432
--=20
2.21.0


