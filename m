Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC8C33356
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 17:19:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXok5-0004gY-56
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 11:19:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoVi-0001Jn-N7
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoVd-0000iR-5m
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:04:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39532)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hXoVH-0008Qz-FS; Mon, 03 Jun 2019 11:04:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 128BF3001834;
	Mon,  3 Jun 2019 15:03:53 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BAEE6727E;
	Mon,  3 Jun 2019 15:03:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 17:02:19 +0200
Message-Id: <20190603150233.6614-15-kwolf@redhat.com>
In-Reply-To: <20190603150233.6614-1-kwolf@redhat.com>
References: <20190603150233.6614-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 03 Jun 2019 15:03:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 14/28] block: Add qdev_prop_drive_iothread
 property type
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some qdev block devices have support for iothreads and take care of the
AioContext they are running in, but most devices don't know about any of
this. For the latter category, the qdev drive property must make sure
that their BlockBackend is in the main AioContext.

Unfortunately, while the current code just does the same thing for
devices that do support iothreads, this is not correct and it would show
as soon as we actually try to keep a consistent AioContext assignment
across all nodes and users of a block graph subtree: If a node is
already in a non-default AioContext because of one of its users,
attaching a new device should still be possible if that device can work
in the same AioContext. Switching the node back to the main context
first and only then into the device AioContext causes failure (because
the existing user wouldn't allow the switch to the main context).

So devices that support iothreads need a different kind of drive
property that leaves the node in its current AioContext, but by using
this type, the device promises to check later that it can work with this
context.

This patch adds the qdev infrastructure that allows devices to signal
that they handle iothreads and qdev should leave the AioContext alone.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/block/block.h         |  7 ++++--
 include/hw/qdev-properties.h     |  3 +++
 hw/core/qdev-properties-system.c | 43 ++++++++++++++++++++++++++++----
 3 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/include/hw/block/block.h b/include/hw/block/block.h
index d06f25aa0f..607539057a 100644
--- a/include/hw/block/block.h
+++ b/include/hw/block/block.h
@@ -45,8 +45,7 @@ static inline unsigned int get_physical_block_exp(Block=
Conf *conf)
     return exp;
 }
=20
-#define DEFINE_BLOCK_PROPERTIES(_state, _conf)                          =
\
-    DEFINE_PROP_DRIVE("drive", _state, _conf.blk),                      =
\
+#define DEFINE_BLOCK_PROPERTIES_BASE(_state, _conf)                     =
\
     DEFINE_PROP_BLOCKSIZE("logical_block_size", _state,                 =
\
                           _conf.logical_block_size),                    =
\
     DEFINE_PROP_BLOCKSIZE("physical_block_size", _state,                =
\
@@ -59,6 +58,10 @@ static inline unsigned int get_physical_block_exp(Bloc=
kConf *conf)
                             ON_OFF_AUTO_AUTO), \
     DEFINE_PROP_BOOL("share-rw", _state, _conf.share_rw, false)
=20
+#define DEFINE_BLOCK_PROPERTIES(_state, _conf)                          =
\
+    DEFINE_PROP_DRIVE("drive", _state, _conf.blk),                      =
\
+    DEFINE_BLOCK_PROPERTIES_BASE(_state, _conf)
+
 #define DEFINE_BLOCK_CHS_PROPERTIES(_state, _conf)      \
     DEFINE_PROP_UINT32("cyls", _state, _conf.cyls, 0),  \
     DEFINE_PROP_UINT32("heads", _state, _conf.heads, 0), \
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index b6758c852e..1eae5ab056 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -28,6 +28,7 @@ extern const PropertyInfo qdev_prop_blockdev_on_error;
 extern const PropertyInfo qdev_prop_bios_chs_trans;
 extern const PropertyInfo qdev_prop_fdc_drive_type;
 extern const PropertyInfo qdev_prop_drive;
+extern const PropertyInfo qdev_prop_drive_iothread;
 extern const PropertyInfo qdev_prop_netdev;
 extern const PropertyInfo qdev_prop_pci_devfn;
 extern const PropertyInfo qdev_prop_blocksize;
@@ -198,6 +199,8 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
     DEFINE_PROP(_n, _s, _f, qdev_prop_netdev, NICPeers)
 #define DEFINE_PROP_DRIVE(_n, _s, _f) \
     DEFINE_PROP(_n, _s, _f, qdev_prop_drive, BlockBackend *)
+#define DEFINE_PROP_DRIVE_IOTHREAD(_n, _s, _f) \
+    DEFINE_PROP(_n, _s, _f, qdev_prop_drive_iothread, BlockBackend *)
 #define DEFINE_PROP_MACADDR(_n, _s, _f)         \
     DEFINE_PROP(_n, _s, _f, qdev_prop_macaddr, MACAddr)
 #define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-s=
ystem.c
index 42e048f190..ba412dd2ca 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -69,8 +69,8 @@ static void set_pointer(Object *obj, Visitor *v, Proper=
ty *prop,
=20
 /* --- drive --- */
=20
-static void parse_drive(DeviceState *dev, const char *str, void **ptr,
-                        const char *propname, Error **errp)
+static void do_parse_drive(DeviceState *dev, const char *str, void **ptr=
,
+                           const char *propname, bool iothread, Error **=
errp)
 {
     BlockBackend *blk;
     bool blk_created =3D false;
@@ -80,9 +80,16 @@ static void parse_drive(DeviceState *dev, const char *=
str, void **ptr,
     if (!blk) {
         BlockDriverState *bs =3D bdrv_lookup_bs(NULL, str, NULL);
         if (bs) {
-            /* BlockBackends of devices start in the main context and ar=
e only
-             * later moved into another context if the device supports t=
hat. */
-            blk =3D blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
+            /*
+             * If the device supports iothreads, it will make sure to mo=
ve the
+             * block node to the right AioContext if necessary (or fail =
if this
+             * isn't possible because of other users). Devices that are =
not
+             * aware of iothreads require their BlockBackends to be in t=
he main
+             * AioContext.
+             */
+            AioContext *ctx =3D iothread ? bdrv_get_aio_context(bs) :
+                                         qemu_get_aio_context();
+            blk =3D blk_new(ctx, 0, BLK_PERM_ALL);
             blk_created =3D true;
=20
             ret =3D blk_insert_bs(blk, bs, errp);
@@ -120,6 +127,18 @@ fail:
     }
 }
=20
+static void parse_drive(DeviceState *dev, const char *str, void **ptr,
+                        const char *propname, Error **errp)
+{
+    do_parse_drive(dev, str, ptr, propname, false, errp);
+}
+
+static void parse_drive_iothread(DeviceState *dev, const char *str, void=
 **ptr,
+                                 const char *propname, Error **errp)
+{
+    do_parse_drive(dev, str, ptr, propname, true, errp);
+}
+
 static void release_drive(Object *obj, const char *name, void *opaque)
 {
     DeviceState *dev =3D DEVICE(obj);
@@ -162,6 +181,12 @@ static void set_drive(Object *obj, Visitor *v, const=
 char *name, void *opaque,
     set_pointer(obj, v, opaque, parse_drive, name, errp);
 }
=20
+static void set_drive_iothread(Object *obj, Visitor *v, const char *name=
,
+                               void *opaque, Error **errp)
+{
+    set_pointer(obj, v, opaque, parse_drive_iothread, name, errp);
+}
+
 const PropertyInfo qdev_prop_drive =3D {
     .name  =3D "str",
     .description =3D "Node name or ID of a block device to use as a back=
end",
@@ -170,6 +195,14 @@ const PropertyInfo qdev_prop_drive =3D {
     .release =3D release_drive,
 };
=20
+const PropertyInfo qdev_prop_drive_iothread =3D {
+    .name  =3D "str",
+    .description =3D "Node name or ID of a block device to use as a back=
end",
+    .get   =3D get_drive,
+    .set   =3D set_drive_iothread,
+    .release =3D release_drive,
+};
+
 /* --- character device --- */
=20
 static void get_chr(Object *obj, Visitor *v, const char *name, void *opa=
que,
--=20
2.20.1


