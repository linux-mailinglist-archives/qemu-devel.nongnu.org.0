Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B11C61E4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 22:19:54 +0200 (CEST)
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jW42j-0005Cb-PB
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 16:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jW3sD-0004ID-EY
 for qemu-devel@nongnu.org; Tue, 05 May 2020 16:09:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47137
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jW3sC-0000rR-Be
 for qemu-devel@nongnu.org; Tue, 05 May 2020 16:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588709339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiMabNuCutKQJgfNczJBp7C3ojbmOKIEcHMLOhpTu4M=;
 b=ZKAoB29u8b/cIH7uXEz3fCyb8V95UGGphiGF5zwRVR+cavB2nDxNN3/9c23j/0+h84gTrR
 3DXFxc7cRk9MZN8Tns6LemUH7maynAobXXAySy0AStMOVHQQCP+LUDaZiR9AqztimMiG5q
 3u/IrTxpvpRZkywO6UjMOTuDYKrcZXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-Gi3s47FiPJWbz67gmGI9_Q-1; Tue, 05 May 2020 16:08:58 -0400
X-MC-Unique: Gi3s47FiPJWbz67gmGI9_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44AC4103098C;
 Tue,  5 May 2020 20:08:56 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 030EE60621;
 Tue,  5 May 2020 20:08:53 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/14] block/crypto: implement blockdev-amend
Date: Tue,  5 May 2020 23:08:17 +0300
Message-Id: <20200505200819.5662-13-mlevitsk@redhat.com>
In-Reply-To: <20200505200819.5662-1-mlevitsk@redhat.com>
References: <20200505200819.5662-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 15:23:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 block/crypto.c       | 72 ++++++++++++++++++++++++++++++++------------
 qapi/block-core.json | 14 ++++++++-
 2 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/block/crypto.c b/block/crypto.c
index b71e57f777..d7725df79e 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -775,32 +775,21 @@ block_crypto_get_specific_info_luks(BlockDriverState =
*bs, Error **errp)
 }
=20
 static int
-block_crypto_amend_options_luks(BlockDriverState *bs,
-                                QemuOpts *opts,
-                                BlockDriverAmendStatusCB *status_cb,
-                                void *cb_opaque,
-                                bool force,
-                                Error **errp)
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
@@ -812,13 +801,57 @@ block_crypto_amend_options_luks(BlockDriverState *bs,
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
+    ret =3D block_crypto_amend_options_generic_luks(bs, amend_options,
+                                                  force, errp);
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
+    return block_crypto_amend_options_generic_luks(bs, &amend_opts,
+                                                   force, errp);
+}
=20
 static void
 block_crypto_child_perms(BlockDriverState *bs, BdrvChild *c,
@@ -891,6 +924,7 @@ static BlockDriver bdrv_crypto_luks =3D {
     .bdrv_get_info      =3D block_crypto_get_info_luks,
     .bdrv_get_specific_info =3D block_crypto_get_specific_info_luks,
     .bdrv_amend_options =3D block_crypto_amend_options_luks,
+    .bdrv_co_amend      =3D block_crypto_co_amend_luks,
=20
     .strong_runtime_opts =3D block_crypto_strong_runtime_opts,
 };
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 5b9123c15f..a5f679ac17 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4649,6 +4649,18 @@
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
@@ -4663,7 +4675,7 @@
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


