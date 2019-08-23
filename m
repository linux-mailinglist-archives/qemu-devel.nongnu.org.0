Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28249B27D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 16:53:47 +0200 (CEST)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Awk-0004RJ-Ff
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 10:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i1AhB-00041p-QK
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:37:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i1Ah9-0004fc-1I
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:37:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40946)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1i1Ah3-0004at-SQ; Fri, 23 Aug 2019 10:37:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D76D081F0F;
 Fri, 23 Aug 2019 14:37:32 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB27D6CE60;
 Fri, 23 Aug 2019 14:37:31 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 09:37:22 -0500
Message-Id: <20190823143726.27062-2-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-1-eblake@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 23 Aug 2019 14:37:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/5] nbd: Improve per-export flag handling in
 server
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 libguestfs@redhat.com, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When creating a read-only image, we are still advertising support for
TRIM and WRITE_ZEROES to the client, even though the client should not
be issuing those commands.  But seeing this requires looking across
multiple functions:

All callers to nbd_export_new() passed a single flag based solely on
whether the export allows writes.  Later, we then pass a constant set
of flags to nbd_negotiate_options() (namely, the set of flags which we
always support, at least for writable images), which is then further
dynamically modified based on client requests for structured options.
Finally, when processing NBD_OPT_EXPORT_NAME or NBD_OPT_EXPORT_GO we
bitwise-or the original caller's flag with the runtime set of flags
we've built up over several functions.

Let's refactor things to instead compute a baseline of flags as soon
as possible, in nbd_export_new(), and changing the signature for the
callers to pass in a simpler bool rather than having to figure out
flags.  We can then get rid of the 'myflags' parameter to various
functions, and instead refer to client for everything we need (we
still have to perform a bitwise-OR during NBD_OPT_EXPORT_NAME and
NBD_OPT_EXPORT_GO, but it's easier to see what is being computed).
This lets us quit advertising senseless flags for read-only images, as
well as making the next patch for exposing FAST_ZERO support easier to
write.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h |  2 +-
 blockdev-nbd.c      |  3 +--
 nbd/server.c        | 62 +++++++++++++++++++++++++--------------------
 qemu-nbd.c          |  6 ++---
 4 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 991fd52a5134..2c87b42dfd48 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -326,7 +326,7 @@ typedef struct NBDClient NBDClient;

 NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
                           uint64_t size, const char *name, const char *d=
esc,
-                          const char *bitmap, uint16_t nbdflags, bool sh=
ared,
+                          const char *bitmap, bool readonly, bool shared=
,
                           void (*close)(NBDExport *), bool writethrough,
                           BlockBackend *on_eject_blk, Error **errp);
 void nbd_export_close(NBDExport *exp);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index ecfa2ef0adb5..1cdffab4fce1 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -187,8 +187,7 @@ void qmp_nbd_server_add(const char *device, bool has_=
name, const char *name,
         writable =3D false;
     }

-    exp =3D nbd_export_new(bs, 0, len, name, NULL, bitmap,
-                         writable ? 0 : NBD_FLAG_READ_ONLY, !writable,
+    exp =3D nbd_export_new(bs, 0, len, name, NULL, bitmap, !writable, !w=
ritable,
                          NULL, false, on_eject_blk, errp);
     if (!exp) {
         return;
diff --git a/nbd/server.c b/nbd/server.c
index 0fb41c6c50ea..b5577828aa44 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -423,14 +423,14 @@ static void nbd_check_meta_export(NBDClient *client=
)

 /* Send a reply to NBD_OPT_EXPORT_NAME.
  * Return -errno on error, 0 on success. */
-static int nbd_negotiate_handle_export_name(NBDClient *client,
-                                            uint16_t myflags, bool no_ze=
roes,
+static int nbd_negotiate_handle_export_name(NBDClient *client, bool no_z=
eroes,
                                             Error **errp)
 {
     char name[NBD_MAX_NAME_SIZE + 1];
     char buf[NBD_REPLY_EXPORT_NAME_SIZE] =3D "";
     size_t len;
     int ret;
+    uint16_t myflags;

     /* Client sends:
         [20 ..  xx]   export name (length bytes)
@@ -458,10 +458,13 @@ static int nbd_negotiate_handle_export_name(NBDClie=
nt *client,
         return -EINVAL;
     }

-    trace_nbd_negotiate_new_style_size_flags(client->exp->size,
-                                             client->exp->nbdflags | myf=
lags);
+    myflags =3D client->exp->nbdflags;
+    if (client->structured_reply) {
+        myflags |=3D NBD_FLAG_SEND_DF;
+    }
+    trace_nbd_negotiate_new_style_size_flags(client->exp->size, myflags)=
;
     stq_be_p(buf, client->exp->size);
-    stw_be_p(buf + 8, client->exp->nbdflags | myflags);
+    stw_be_p(buf + 8, myflags);
     len =3D no_zeroes ? 10 : sizeof(buf);
     ret =3D nbd_write(client->ioc, buf, len, errp);
     if (ret < 0) {
@@ -526,8 +529,7 @@ static int nbd_reject_length(NBDClient *client, bool =
fatal, Error **errp)
 /* Handle NBD_OPT_INFO and NBD_OPT_GO.
  * Return -errno on error, 0 if ready for next option, and 1 to move
  * into transmission phase.  */
-static int nbd_negotiate_handle_info(NBDClient *client, uint16_t myflags=
,
-                                     Error **errp)
+static int nbd_negotiate_handle_info(NBDClient *client, Error **errp)
 {
     int rc;
     char name[NBD_MAX_NAME_SIZE + 1];
@@ -540,6 +542,7 @@ static int nbd_negotiate_handle_info(NBDClient *clien=
t, uint16_t myflags,
     uint32_t sizes[3];
     char buf[sizeof(uint64_t) + sizeof(uint16_t)];
     uint32_t check_align =3D 0;
+    uint16_t myflags;

     /* Client sends:
         4 bytes: L, name length (can be 0)
@@ -637,10 +640,13 @@ static int nbd_negotiate_handle_info(NBDClient *cli=
ent, uint16_t myflags,
     }

     /* Send NBD_INFO_EXPORT always */
-    trace_nbd_negotiate_new_style_size_flags(exp->size,
-                                             exp->nbdflags | myflags);
+    myflags =3D exp->nbdflags;
+    if (client->structured_reply) {
+        myflags |=3D NBD_FLAG_SEND_DF;
+    }
+    trace_nbd_negotiate_new_style_size_flags(exp->size, myflags);
     stq_be_p(buf, exp->size);
-    stw_be_p(buf + 8, exp->nbdflags | myflags);
+    stw_be_p(buf + 8, myflags);
     rc =3D nbd_negotiate_send_info(client, NBD_INFO_EXPORT,
                                  sizeof(buf), buf, errp);
     if (rc < 0) {
@@ -1037,8 +1043,7 @@ static int nbd_negotiate_meta_queries(NBDClient *cl=
ient,
  * 1       if client sent NBD_OPT_ABORT, i.e. on valid disconnect,
  *         errp is not set
  */
-static int nbd_negotiate_options(NBDClient *client, uint16_t myflags,
-                                 Error **errp)
+static int nbd_negotiate_options(NBDClient *client, Error **errp)
 {
     uint32_t flags;
     bool fixedNewstyle =3D false;
@@ -1172,13 +1177,12 @@ static int nbd_negotiate_options(NBDClient *clien=
t, uint16_t myflags,
                 return 1;

             case NBD_OPT_EXPORT_NAME:
-                return nbd_negotiate_handle_export_name(client,
-                                                        myflags, no_zero=
es,
+                return nbd_negotiate_handle_export_name(client, no_zeroe=
s,
                                                         errp);

             case NBD_OPT_INFO:
             case NBD_OPT_GO:
-                ret =3D nbd_negotiate_handle_info(client, myflags, errp)=
;
+                ret =3D nbd_negotiate_handle_info(client, errp);
                 if (ret =3D=3D 1) {
                     assert(option =3D=3D NBD_OPT_GO);
                     return 0;
@@ -1209,7 +1213,6 @@ static int nbd_negotiate_options(NBDClient *client,=
 uint16_t myflags,
                 } else {
                     ret =3D nbd_negotiate_send_rep(client, NBD_REP_ACK, =
errp);
                     client->structured_reply =3D true;
-                    myflags |=3D NBD_FLAG_SEND_DF;
                 }
                 break;

@@ -1232,8 +1235,7 @@ static int nbd_negotiate_options(NBDClient *client,=
 uint16_t myflags,
              */
             switch (option) {
             case NBD_OPT_EXPORT_NAME:
-                return nbd_negotiate_handle_export_name(client,
-                                                        myflags, no_zero=
es,
+                return nbd_negotiate_handle_export_name(client, no_zeroe=
s,
                                                         errp);

             default:
@@ -1259,9 +1261,6 @@ static coroutine_fn int nbd_negotiate(NBDClient *cl=
ient, Error **errp)
 {
     char buf[NBD_OLDSTYLE_NEGOTIATE_SIZE] =3D "";
     int ret;
-    const uint16_t myflags =3D (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_TRIM =
|
-                              NBD_FLAG_SEND_FLUSH | NBD_FLAG_SEND_FUA |
-                              NBD_FLAG_SEND_WRITE_ZEROES | NBD_FLAG_SEND=
_CACHE);

     /* Old style negotiation header, no room for options
         [ 0 ..   7]   passwd       ("NBDMAGIC")
@@ -1289,7 +1288,7 @@ static coroutine_fn int nbd_negotiate(NBDClient *cl=
ient, Error **errp)
         error_prepend(errp, "write failed: ");
         return -EINVAL;
     }
-    ret =3D nbd_negotiate_options(client, myflags, errp);
+    ret =3D nbd_negotiate_options(client, errp);
     if (ret !=3D 0) {
         if (ret < 0) {
             error_prepend(errp, "option negotiation failed: ");
@@ -1461,7 +1460,7 @@ static void nbd_eject_notifier(Notifier *n, void *d=
ata)

 NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
                           uint64_t size, const char *name, const char *d=
esc,
-                          const char *bitmap, uint16_t nbdflags, bool sh=
ared,
+                          const char *bitmap, bool readonly, bool shared=
,
                           void (*close)(NBDExport *), bool writethrough,
                           BlockBackend *on_eject_blk, Error **errp)
 {
@@ -1485,10 +1484,8 @@ NBDExport *nbd_export_new(BlockDriverState *bs, ui=
nt64_t dev_offset,
     /* Don't allow resize while the NBD server is running, otherwise we =
don't
      * care what happens with the node. */
     perm =3D BLK_PERM_CONSISTENT_READ;
-    if ((nbdflags & NBD_FLAG_READ_ONLY) =3D=3D 0) {
+    if (!readonly) {
         perm |=3D BLK_PERM_WRITE;
-    } else if (shared) {
-        nbdflags |=3D NBD_FLAG_CAN_MULTI_CONN;
     }
     blk =3D blk_new(bdrv_get_aio_context(bs), perm,
                   BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
@@ -1507,7 +1504,16 @@ NBDExport *nbd_export_new(BlockDriverState *bs, ui=
nt64_t dev_offset,
     exp->dev_offset =3D dev_offset;
     exp->name =3D g_strdup(name);
     exp->description =3D g_strdup(desc);
-    exp->nbdflags =3D nbdflags;
+    exp->nbdflags =3D (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_FLUSH |
+                     NBD_FLAG_SEND_FUA | NBD_FLAG_SEND_CACHE);
+    if (readonly) {
+        exp->nbdflags |=3D NBD_FLAG_READ_ONLY;
+        if (shared) {
+            exp->nbdflags |=3D NBD_FLAG_CAN_MULTI_CONN;
+        }
+    } else {
+        exp->nbdflags |=3D NBD_FLAG_SEND_TRIM | NBD_FLAG_SEND_WRITE_ZERO=
ES;
+    }
     assert(size <=3D INT64_MAX - dev_offset);
     exp->size =3D QEMU_ALIGN_DOWN(size, BDRV_SECTOR_SIZE);

@@ -1532,7 +1538,7 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uin=
t64_t dev_offset,
             goto fail;
         }

-        if ((nbdflags & NBD_FLAG_READ_ONLY) && bdrv_is_writable(bs) &&
+        if (readonly && bdrv_is_writable(bs) &&
             bdrv_dirty_bitmap_enabled(bm)) {
             error_setg(errp,
                        "Enabled bitmap '%s' incompatible with readonly e=
xport",
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 55f5ceaf5c92..079702bb837f 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -600,7 +600,7 @@ int main(int argc, char **argv)
     BlockBackend *blk;
     BlockDriverState *bs;
     uint64_t dev_offset =3D 0;
-    uint16_t nbdflags =3D 0;
+    bool readonly =3D false;
     bool disconnect =3D false;
     const char *bindto =3D NULL;
     const char *port =3D NULL;
@@ -782,7 +782,7 @@ int main(int argc, char **argv)
             }
             /* fall through */
         case 'r':
-            nbdflags |=3D NBD_FLAG_READ_ONLY;
+            readonly =3D true;
             flags &=3D ~BDRV_O_RDWR;
             break;
         case 'P':
@@ -1173,7 +1173,7 @@ int main(int argc, char **argv)
     }

     export =3D nbd_export_new(bs, dev_offset, fd_size, export_name,
-                            export_description, bitmap, nbdflags, shared=
 > 1,
+                            export_description, bitmap, readonly, shared=
 > 1,
                             nbd_export_closed, writethrough, NULL,
                             &error_fatal);

--=20
2.21.0


