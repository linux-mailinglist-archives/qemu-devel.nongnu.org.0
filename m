Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D36A14DFF7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 18:34:06 +0100 (CET)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixDhd-0005PS-Jo
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 12:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1ixDdv-0008K9-GG
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 12:30:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1ixDdt-0001Iu-4V
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 12:30:15 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50292
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1ixDds-0001GZ-V4
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 12:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580405412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3dljArO8ALlulkmHIpZcUOiQ8TSAgtIVhJ1URDaGow=;
 b=FAR9BqbNdmmd6ndBrhN36jwrpNOBDs0lqswjPCqdlePjKk0YYP+gKieUzo+LB3CebLQ8Af
 Qj8bD+bSFvjGhBt/0WIy50Vbv04A/rTh8GcGDcpMORQJ9fzqLN66wUouvdu3ciauJU7iOX
 Px8hRmVeTaf/FemlyxRkERBizlvqUYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-Ri0TMGBePKuEISjOSluJRg-1; Thu, 30 Jan 2020 12:30:05 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA6D7800D5A;
 Thu, 30 Jan 2020 17:30:04 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1E9F5D9E5;
 Thu, 30 Jan 2020 17:29:59 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/14] block/crypto: implement blockdev-amend
Date: Thu, 30 Jan 2020 19:29:17 +0200
Message-Id: <20200130172919.13424-13-mlevitsk@redhat.com>
In-Reply-To: <20200130172919.13424-1-mlevitsk@redhat.com>
References: <20200130172919.13424-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Ri0TMGBePKuEISjOSluJRg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 block/crypto.c       | 70 ++++++++++++++++++++++++++++++++------------
 qapi/block-core.json | 14 ++++++++-
 2 files changed, 64 insertions(+), 20 deletions(-)

diff --git a/block/crypto.c b/block/crypto.c
index 1f1a6da6a9..82d078e889 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -697,32 +697,21 @@ block_crypto_get_specific_info_luks(BlockDriverState =
*bs, Error **errp)
 }
=20
 static int
-block_crypto_amend_options_luks(BlockDriverState *bs,
-                           QemuOpts *opts,
-                           BlockDriverAmendStatusCB *status_cb,
-                           void *cb_opaque,
-                           bool force,
-                           Error **errp)
+block_crypto_amend_options_generic_luks(BlockDriverState *bs,
+                                        QCryptoBlockAmendOptions *amend_op=
tions,
+                                        bool force,
+                                        Error **errp)
 {
     BlockCrypto *crypto =3D bs->opaque;
-    QDict *cryptoopts =3D NULL;
-    QCryptoBlockAmendOptions *amend_options =3D NULL;
     int ret;
=20
     assert(crypto);
     assert(crypto->block);
-    crypto->updating_keys =3D true;
=20
+    /* apply for exclusive read/write permissions to the underlying file*/
+    crypto->updating_keys =3D true;
     ret =3D bdrv_child_refresh_perms(bs, bs->file, errp);
-    if (ret < 0) {
-        goto cleanup;
-    }
-
-    cryptoopts =3D qemu_opts_to_qdict(opts, NULL);
-    qdict_put_str(cryptoopts, "format", "luks");
-    amend_options =3D block_crypto_amend_opts_init(cryptoopts, errp);
-    if (!amend_options) {
-        ret =3D -EINVAL;
+    if (ret) {
         goto cleanup;
     }
=20
@@ -734,13 +723,55 @@ block_crypto_amend_options_luks(BlockDriverState *bs,
                                       force,
                                       errp);
 cleanup:
+    /* release exclusive read/write permissions to the underlying file*/
     crypto->updating_keys =3D false;
     bdrv_child_refresh_perms(bs, bs->file, errp);
-    qapi_free_QCryptoBlockAmendOptions(amend_options);
+    return ret;
+}
+
+static int
+block_crypto_amend_options_luks(BlockDriverState *bs,
+                                QemuOpts *opts,
+                                BlockDriverAmendStatusCB *status_cb,
+                                void *cb_opaque,
+                                bool force,
+                                Error **errp)
+{
+    BlockCrypto *crypto =3D bs->opaque;
+    QDict *cryptoopts =3D NULL;
+    QCryptoBlockAmendOptions *amend_options =3D NULL;
+    int ret =3D -EINVAL;
+
+    assert(crypto);
+    assert(crypto->block);
+
+    cryptoopts =3D qemu_opts_to_qdict(opts, NULL);
+    qdict_put_str(cryptoopts, "format", "luks");
+    amend_options =3D block_crypto_amend_opts_init(cryptoopts, errp);
     qobject_unref(cryptoopts);
+    if (!amend_options) {
+        goto cleanup;
+    }
+    ret =3D block_crypto_amend_options_generic_luks(bs, amend_options, for=
ce, errp);
+cleanup:
+    qapi_free_QCryptoBlockAmendOptions(amend_options);
     return ret;
 }
=20
+static int
+coroutine_fn block_crypto_co_amend_luks(BlockDriverState *bs,
+                                        BlockdevAmendOptions *opts,
+                                        bool force,
+                                        Error **errp)
+{
+    QCryptoBlockAmendOptions amend_opts;
+
+    amend_opts =3D (QCryptoBlockAmendOptions) {
+        .format =3D Q_CRYPTO_BLOCK_FORMAT_LUKS,
+        .u.luks =3D *qapi_BlockdevAmendOptionsLUKS_base(&opts->u.luks),
+    };
+    return block_crypto_amend_options_generic_luks(bs, &amend_opts, force,=
 errp);
+}
=20
 static void
 block_crypto_child_perms(BlockDriverState *bs, BdrvChild *c,
@@ -812,6 +843,7 @@ static BlockDriver bdrv_crypto_luks =3D {
     .bdrv_get_info      =3D block_crypto_get_info_luks,
     .bdrv_get_specific_info =3D block_crypto_get_specific_info_luks,
     .bdrv_amend_options =3D block_crypto_amend_options_luks,
+    .bdrv_co_amend      =3D block_crypto_co_amend_luks,
=20
     .strong_runtime_opts =3D block_crypto_strong_runtime_opts,
 };
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 601f7dc9a4..790aa40991 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4743,6 +4743,18 @@
   'data': { 'job-id': 'str',
             'options': 'BlockdevCreateOptions' } }
=20
+##
+# @BlockdevAmendOptionsLUKS:
+#
+# Driver specific image amend options for LUKS.
+#
+# Since: 5.0
+##
+{ 'struct': 'BlockdevAmendOptionsLUKS',
+  'base': 'QCryptoBlockAmendOptionsLUKS',
+  'data': { }
+}
+
 ##
 # @BlockdevAmendOptions:
 #
@@ -4757,7 +4769,7 @@
       'driver':         'BlockdevDriver' },
   'discriminator': 'driver',
   'data': {
-  } }
+      'luks':           'BlockdevAmendOptionsLUKS' } }
=20
 ##
 # @x-blockdev-amend:
--=20
2.17.2


