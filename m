Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7341C8BA7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 15:02:40 +0200 (CEST)
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWgAh-0002QZ-8d
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 09:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jWg3E-0007U5-OF
 for qemu-devel@nongnu.org; Thu, 07 May 2020 08:54:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26077
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jWg3D-0003V4-QO
 for qemu-devel@nongnu.org; Thu, 07 May 2020 08:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588856095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKbif+NuY6QzhiXJBP1uH/ivTC5YokTkzV6y3mVP8OY=;
 b=HRntl3R9bjzjkLG+rAQee2nwiU5E/fr/Pvj9KGGTBcEQA56QxtoTJvYuSZJkdOLfWUNmLh
 mO1TJ6AzGbN3GCJEaiq9RjPnqzwRpvOZE07Ko4wJJVt+bT2/JG/GpE+zp1IPrKZFifOXij
 24r8ln+AZXyczHivJJvjZzvWNOPc2R8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-xZJSZUXUOXWZbO3yiUivXQ-1; Thu, 07 May 2020 08:54:53 -0400
X-MC-Unique: xZJSZUXUOXWZbO3yiUivXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 891EA801504;
 Thu,  7 May 2020 12:54:52 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4488170559;
 Thu,  7 May 2020 12:54:50 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/14] block/crypto: implement blockdev-amend
Date: Thu,  7 May 2020 15:54:12 +0300
Message-Id: <20200507125414.2151-13-mlevitsk@redhat.com>
In-Reply-To: <20200507125414.2151-1-mlevitsk@redhat.com>
References: <20200507125414.2151-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:56:18
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
index dbc3ab25f4..86b621d069 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -774,32 +774,21 @@ block_crypto_get_specific_info_luks(BlockDriverState =
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
@@ -811,13 +800,57 @@ block_crypto_amend_options_luks(BlockDriverState *bs,
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
@@ -890,6 +923,7 @@ static BlockDriver bdrv_crypto_luks =3D {
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


