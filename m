Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D758131412
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:51:32 +0100 (CET)
Received: from localhost ([::1]:52900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTj9-0006pN-8O
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ioTaT-0005Yx-5y
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ioTaR-0008Kk-Il
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52919
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ioTaR-0008Jv-Eb
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9tpAQdINwsC2qxcq9bQXk8UJ95ABgg+qf/HxpPai1I=;
 b=alG9N8e9skJAMuWTfedGPZy43mc4zq/EubbyaerVPk3A2nVl0/4exc7EafYv8X3X7v/dE2
 dDBnB11dTdSn127KrcU8ihYoNYiBkwtTLc8YbSWnJnMp0q94he5RMON6ZXGLk/td2ZNTFw
 E5ACl0fOrWiJFQEkmxLWt0TqJl/oD3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-yN6O0pjCPbWvhexxuZVeTw-1; Mon, 06 Jan 2020 09:42:27 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53ED61083E88;
 Mon,  6 Jan 2020 14:42:26 +0000 (UTC)
Received: from localhost (ovpn-117-91.ams2.redhat.com [10.36.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B698E7C00A;
 Mon,  6 Jan 2020 14:42:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/34] blkdebug: Allow taking/unsharing permissions
Date: Mon,  6 Jan 2020 15:41:35 +0100
Message-Id: <20200106144206.698920-4-mreitz@redhat.com>
In-Reply-To: <20200106144206.698920-1-mreitz@redhat.com>
References: <20200106144206.698920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: yN6O0pjCPbWvhexxuZVeTw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes it is useful to be able to add a node to the block graph that
takes or unshare a certain set of permissions for debugging purposes.
This patch adds this capability to blkdebug.

(Note that you cannot make blkdebug release or share permissions that it
needs to take or cannot share, because this might result in assertion
failures in the block layer.  But if the blkdebug node has no parents,
it will not take any permissions and share everything by default, so you
can then freely choose what permissions to take and share.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20191108123455.39445-4-mreitz@redhat.com
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/blkdebug.c     | 93 +++++++++++++++++++++++++++++++++++++++++++-
 qapi/block-core.json | 14 ++++++-
 2 files changed, 105 insertions(+), 2 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 5ae96c52b0..af44aa973f 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -28,10 +28,14 @@
 #include "qemu/cutils.h"
 #include "qemu/config-file.h"
 #include "block/block_int.h"
+#include "block/qdict.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qapi/qapi-visit-block-core.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qlist.h"
 #include "qapi/qmp/qstring.h"
+#include "qapi/qobject-input-visitor.h"
 #include "sysemu/qtest.h"
=20
 typedef struct BDRVBlkdebugState {
@@ -44,6 +48,9 @@ typedef struct BDRVBlkdebugState {
     uint64_t opt_discard;
     uint64_t max_discard;
=20
+    uint64_t take_child_perms;
+    uint64_t unshare_child_perms;
+
     /* For blkdebug_refresh_filename() */
     char *config_file;
=20
@@ -344,6 +351,69 @@ static void blkdebug_parse_filename(const char *filena=
me, QDict *options,
     qdict_put_str(options, "x-image", filename);
 }
=20
+static int blkdebug_parse_perm_list(uint64_t *dest, QDict *options,
+                                    const char *prefix, Error **errp)
+{
+    int ret =3D 0;
+    QDict *subqdict =3D NULL;
+    QObject *crumpled_subqdict =3D NULL;
+    Visitor *v =3D NULL;
+    BlockPermissionList *perm_list =3D NULL, *element;
+    Error *local_err =3D NULL;
+
+    *dest =3D 0;
+
+    qdict_extract_subqdict(options, &subqdict, prefix);
+    if (!qdict_size(subqdict)) {
+        goto out;
+    }
+
+    crumpled_subqdict =3D qdict_crumple(subqdict, errp);
+    if (!crumpled_subqdict) {
+        ret =3D -EINVAL;
+        goto out;
+    }
+
+    v =3D qobject_input_visitor_new(crumpled_subqdict);
+    visit_type_BlockPermissionList(v, NULL, &perm_list, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        ret =3D -EINVAL;
+        goto out;
+    }
+
+    for (element =3D perm_list; element; element =3D element->next) {
+        *dest |=3D bdrv_qapi_perm_to_blk_perm(element->value);
+    }
+
+out:
+    qapi_free_BlockPermissionList(perm_list);
+    visit_free(v);
+    qobject_unref(subqdict);
+    qobject_unref(crumpled_subqdict);
+    return ret;
+}
+
+static int blkdebug_parse_perms(BDRVBlkdebugState *s, QDict *options,
+                                Error **errp)
+{
+    int ret;
+
+    ret =3D blkdebug_parse_perm_list(&s->take_child_perms, options,
+                                   "take-child-perms.", errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret =3D blkdebug_parse_perm_list(&s->unshare_child_perms, options,
+                                   "unshare-child-perms.", errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return 0;
+}
+
 static QemuOptsList runtime_opts =3D {
     .name =3D "blkdebug",
     .head =3D QTAILQ_HEAD_INITIALIZER(runtime_opts.head),
@@ -419,6 +489,12 @@ static int blkdebug_open(BlockDriverState *bs, QDict *=
options, int flags,
     /* Set initial state */
     s->state =3D 1;
=20
+    /* Parse permissions modifiers before opening the image file */
+    ret =3D blkdebug_parse_perms(s, options, errp);
+    if (ret < 0) {
+        goto out;
+    }
+
     /* Open the image file */
     bs->file =3D bdrv_open_child(qemu_opt_get(opts, "x-image"), options, "=
image",
                                bs, &child_file, false, &local_err);
@@ -916,6 +992,21 @@ static int blkdebug_reopen_prepare(BDRVReopenState *re=
open_state,
     return 0;
 }
=20
+static void blkdebug_child_perm(BlockDriverState *bs, BdrvChild *c,
+                                const BdrvChildRole *role,
+                                BlockReopenQueue *reopen_queue,
+                                uint64_t perm, uint64_t shared,
+                                uint64_t *nperm, uint64_t *nshared)
+{
+    BDRVBlkdebugState *s =3D bs->opaque;
+
+    bdrv_filter_default_perms(bs, c, role, reopen_queue, perm, shared,
+                              nperm, nshared);
+
+    *nperm |=3D s->take_child_perms;
+    *nshared &=3D ~s->unshare_child_perms;
+}
+
 static const char *const blkdebug_strong_runtime_opts[] =3D {
     "config",
     "inject-error.",
@@ -940,7 +1031,7 @@ static BlockDriver bdrv_blkdebug =3D {
     .bdrv_file_open         =3D blkdebug_open,
     .bdrv_close             =3D blkdebug_close,
     .bdrv_reopen_prepare    =3D blkdebug_reopen_prepare,
-    .bdrv_child_perm        =3D bdrv_filter_default_perms,
+    .bdrv_child_perm        =3D blkdebug_child_perm,
=20
     .bdrv_getlength         =3D blkdebug_getlength,
     .bdrv_refresh_filename  =3D blkdebug_refresh_filename,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index fcb52ec24f..839b10b3f0 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3454,6 +3454,16 @@
 #
 # @set-state:       array of state-change descriptions
 #
+# @take-child-perms: Permissions to take on @image in addition to what
+#                    is necessary anyway (which depends on how the
+#                    blkdebug node is used).  Defaults to none.
+#                    (since 5.0)
+#
+# @unshare-child-perms: Permissions not to share on @image in addition
+#                       to what cannot be shared anyway (which depends
+#                       on how the blkdebug node is used).  Defaults
+#                       to none.  (since 5.0)
+#
 # Since: 2.9
 ##
 { 'struct': 'BlockdevOptionsBlkdebug',
@@ -3463,7 +3473,9 @@
             '*opt-write-zero': 'int32', '*max-write-zero': 'int32',
             '*opt-discard': 'int32', '*max-discard': 'int32',
             '*inject-error': ['BlkdebugInjectErrorOptions'],
-            '*set-state': ['BlkdebugSetStateOptions'] } }
+            '*set-state': ['BlkdebugSetStateOptions'],
+            '*take-child-perms': ['BlockPermission'],
+            '*unshare-child-perms': ['BlockPermission'] } }
=20
 ##
 # @BlockdevOptionsBlklogwrites:
--=20
2.24.1


