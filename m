Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413C41C61B7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 22:12:56 +0200 (CEST)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jW3vy-0001s3-RT
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 16:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jW3rs-0003fr-O1
 for qemu-devel@nongnu.org; Tue, 05 May 2020 16:08:40 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39160
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jW3rq-0000lf-7k
 for qemu-devel@nongnu.org; Tue, 05 May 2020 16:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588709317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7+PNVhoIle6EuSYHRampD/Kb+osZbs3CY702bKL/UA=;
 b=Whdy09liCxO2IajAAP+WbWH6W3fhc4CL+QKvVOW66U7LGO7K5JgnT4MvLC3mmSJ5f46J9E
 VACLlOW6TxMUUKe5JlhMtaXCv31PNZlmnpjM8nEBKchz0oFunzfdIMTO2Bfxhnl3PEu8Ts
 FuTaNhRp6aYRZt1+ewyAH0OC9XYhIyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-59k0ux65Pq-YHbr4dU8Beg-1; Tue, 05 May 2020 16:08:35 -0400
X-MC-Unique: 59k0ux65Pq-YHbr4dU8Beg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F53F835B8B;
 Tue,  5 May 2020 20:08:34 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F86864421;
 Tue,  5 May 2020 20:08:32 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/14] block/amend: separate amend and create options for
 qemu-img
Date: Tue,  5 May 2020 23:08:09 +0300
Message-Id: <20200505200819.5662-5-mlevitsk@redhat.com>
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

Some options are only useful for creation
(or hard to be amended, like cluster size for qcow2), while some other
options are only useful for amend, like upcoming keyslot management
options for luks

Since currently only qcow2 supports amend, move all its options
to a common macro and then include it in each action option list.

In future it might be useful to remove some options which are
not supported anyway from amend list, which currently
cause an error message if amended.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 block/qcow2.c             | 160 +++++++++++++++++++++-----------------
 include/block/block_int.h |   4 +
 qemu-img.c                |  18 ++---
 3 files changed, 100 insertions(+), 82 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index ffb6b22e2d..13780b0278 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5495,83 +5495,96 @@ void qcow2_signal_corruption(BlockDriverState *bs, =
bool fatal, int64_t offset,
     s->signaled_corruption =3D true;
 }
=20
+#define QCOW_COMMON_OPTIONS                                         \
+    {                                                               \
+        .name =3D BLOCK_OPT_SIZE,                                     \
+        .type =3D QEMU_OPT_SIZE,                                      \
+        .help =3D "Virtual disk size"                                 \
+    },                                                              \
+    {                                                               \
+        .name =3D BLOCK_OPT_COMPAT_LEVEL,                             \
+        .type =3D QEMU_OPT_STRING,                                    \
+        .help =3D "Compatibility level (v2 [0.10] or v3 [1.1])"       \
+    },                                                              \
+    {                                                               \
+        .name =3D BLOCK_OPT_BACKING_FILE,                             \
+        .type =3D QEMU_OPT_STRING,                                    \
+        .help =3D "File name of a base image"                         \
+    },                                                              \
+    {                                                               \
+        .name =3D BLOCK_OPT_BACKING_FMT,                              \
+        .type =3D QEMU_OPT_STRING,                                    \
+        .help =3D "Image format of the base image"                    \
+    },                                                              \
+    {                                                               \
+        .name =3D BLOCK_OPT_DATA_FILE,                                \
+        .type =3D QEMU_OPT_STRING,                                    \
+        .help =3D "File name of an external data file"                \
+    },                                                              \
+    {                                                               \
+        .name =3D BLOCK_OPT_DATA_FILE_RAW,                            \
+        .type =3D QEMU_OPT_BOOL,                                      \
+        .help =3D "The external data file must stay valid "           \
+                "as a raw image"                                    \
+    },                                                              \
+    {                                                               \
+        .name =3D BLOCK_OPT_ENCRYPT,                                  \
+        .type =3D QEMU_OPT_BOOL,                                      \
+        .help =3D "Encrypt the image with format 'aes'. (Deprecated " \
+                "in favor of " BLOCK_OPT_ENCRYPT_FORMAT "=3Daes)",    \
+    },                                                              \
+    {                                                               \
+        .name =3D BLOCK_OPT_ENCRYPT_FORMAT,                           \
+        .type =3D QEMU_OPT_STRING,                                    \
+        .help =3D "Encrypt the image, format choices: 'aes', 'luks'", \
+    },                                                              \
+    BLOCK_CRYPTO_OPT_DEF_KEY_SECRET("encrypt.",                     \
+        "ID of secret providing qcow AES key or LUKS passphrase"),  \
+    BLOCK_CRYPTO_OPT_DEF_LUKS_CIPHER_ALG("encrypt."),               \
+    BLOCK_CRYPTO_OPT_DEF_LUKS_CIPHER_MODE("encrypt."),              \
+    BLOCK_CRYPTO_OPT_DEF_LUKS_IVGEN_ALG("encrypt."),                \
+    BLOCK_CRYPTO_OPT_DEF_LUKS_IVGEN_HASH_ALG("encrypt."),           \
+    BLOCK_CRYPTO_OPT_DEF_LUKS_HASH_ALG("encrypt."),                 \
+    BLOCK_CRYPTO_OPT_DEF_LUKS_ITER_TIME("encrypt."),                \
+    {                                                               \
+        .name =3D BLOCK_OPT_CLUSTER_SIZE,                             \
+        .type =3D QEMU_OPT_SIZE,                                      \
+        .help =3D "qcow2 cluster size",                               \
+        .def_value_str =3D stringify(DEFAULT_CLUSTER_SIZE)            \
+    },                                                              \
+    {                                                               \
+        .name =3D BLOCK_OPT_PREALLOC,                                 \
+        .type =3D QEMU_OPT_STRING,                                    \
+        .help =3D "Preallocation mode (allowed values: off, "         \
+                "metadata, falloc, full)"                           \
+    },                                                              \
+    {                                                               \
+        .name =3D BLOCK_OPT_LAZY_REFCOUNTS,                           \
+        .type =3D QEMU_OPT_BOOL,                                      \
+        .help =3D "Postpone refcount updates",                        \
+        .def_value_str =3D "off"                                      \
+    },                                                              \
+    {                                                               \
+        .name =3D BLOCK_OPT_REFCOUNT_BITS,                            \
+        .type =3D QEMU_OPT_NUMBER,                                    \
+        .help =3D "Width of a reference count entry in bits",         \
+        .def_value_str =3D "16"                                       \
+    }                                                               \
+
 static QemuOptsList qcow2_create_opts =3D {
     .name =3D "qcow2-create-opts",
     .head =3D QTAILQ_HEAD_INITIALIZER(qcow2_create_opts.head),
     .desc =3D {
-        {
-            .name =3D BLOCK_OPT_SIZE,
-            .type =3D QEMU_OPT_SIZE,
-            .help =3D "Virtual disk size"
-        },
-        {
-            .name =3D BLOCK_OPT_COMPAT_LEVEL,
-            .type =3D QEMU_OPT_STRING,
-            .help =3D "Compatibility level (v2 [0.10] or v3 [1.1])"
-        },
-        {
-            .name =3D BLOCK_OPT_BACKING_FILE,
-            .type =3D QEMU_OPT_STRING,
-            .help =3D "File name of a base image"
-        },
-        {
-            .name =3D BLOCK_OPT_BACKING_FMT,
-            .type =3D QEMU_OPT_STRING,
-            .help =3D "Image format of the base image"
-        },
-        {
-            .name =3D BLOCK_OPT_DATA_FILE,
-            .type =3D QEMU_OPT_STRING,
-            .help =3D "File name of an external data file"
-        },
-        {
-            .name =3D BLOCK_OPT_DATA_FILE_RAW,
-            .type =3D QEMU_OPT_BOOL,
-            .help =3D "The external data file must stay valid as a raw ima=
ge"
-        },
-        {
-            .name =3D BLOCK_OPT_ENCRYPT,
-            .type =3D QEMU_OPT_BOOL,
-            .help =3D "Encrypt the image with format 'aes'. (Deprecated "
-                    "in favor of " BLOCK_OPT_ENCRYPT_FORMAT "=3Daes)",
-        },
-        {
-            .name =3D BLOCK_OPT_ENCRYPT_FORMAT,
-            .type =3D QEMU_OPT_STRING,
-            .help =3D "Encrypt the image, format choices: 'aes', 'luks'",
-        },
-        BLOCK_CRYPTO_OPT_DEF_KEY_SECRET("encrypt.",
-            "ID of secret providing qcow AES key or LUKS passphrase"),
-        BLOCK_CRYPTO_OPT_DEF_LUKS_CIPHER_ALG("encrypt."),
-        BLOCK_CRYPTO_OPT_DEF_LUKS_CIPHER_MODE("encrypt."),
-        BLOCK_CRYPTO_OPT_DEF_LUKS_IVGEN_ALG("encrypt."),
-        BLOCK_CRYPTO_OPT_DEF_LUKS_IVGEN_HASH_ALG("encrypt."),
-        BLOCK_CRYPTO_OPT_DEF_LUKS_HASH_ALG("encrypt."),
-        BLOCK_CRYPTO_OPT_DEF_LUKS_ITER_TIME("encrypt."),
-        {
-            .name =3D BLOCK_OPT_CLUSTER_SIZE,
-            .type =3D QEMU_OPT_SIZE,
-            .help =3D "qcow2 cluster size",
-            .def_value_str =3D stringify(DEFAULT_CLUSTER_SIZE)
-        },
-        {
-            .name =3D BLOCK_OPT_PREALLOC,
-            .type =3D QEMU_OPT_STRING,
-            .help =3D "Preallocation mode (allowed values: off, metadata, =
"
-                    "falloc, full)"
-        },
-        {
-            .name =3D BLOCK_OPT_LAZY_REFCOUNTS,
-            .type =3D QEMU_OPT_BOOL,
-            .help =3D "Postpone refcount updates",
-            .def_value_str =3D "off"
-        },
-        {
-            .name =3D BLOCK_OPT_REFCOUNT_BITS,
-            .type =3D QEMU_OPT_NUMBER,
-            .help =3D "Width of a reference count entry in bits",
-            .def_value_str =3D "16"
-        },
+        QCOW_COMMON_OPTIONS,
+        { /* end of list */ }
+    }
+};
+
+static QemuOptsList qcow2_amend_opts =3D {
+    .name =3D "qcow2-amend-opts",
+    .head =3D QTAILQ_HEAD_INITIALIZER(qcow2_amend_opts.head),
+    .desc =3D {
+        QCOW_COMMON_OPTIONS,
         { /* end of list */ }
     }
 };
@@ -5632,6 +5645,7 @@ BlockDriver bdrv_qcow2 =3D {
     .bdrv_inactivate            =3D qcow2_inactivate,
=20
     .create_opts         =3D &qcow2_create_opts,
+    .amend_opts          =3D &qcow2_amend_opts,
     .strong_runtime_opts =3D qcow2_strong_runtime_opts,
     .mutable_opts        =3D mutable_opts,
     .bdrv_co_check       =3D qcow2_co_check,
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 98671ecdf6..1f0524285d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -412,6 +412,10 @@ struct BlockDriver {
=20
     /* List of options for creating images, terminated by name =3D=3D NULL=
 */
     QemuOptsList *create_opts;
+
+    /* List of options for image amend*/
+    QemuOptsList *amend_opts;
+
     /*
      * If this driver supports reopening images this contains a
      * NULL-terminated list of the runtime options that can be
diff --git a/qemu-img.c b/qemu-img.c
index ef422d5471..8f69366f03 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3936,11 +3936,11 @@ static int print_amend_option_help(const char *form=
at)
         return 1;
     }
=20
-    /* Every driver supporting amendment must have create_opts */
-    assert(drv->create_opts);
+    /* Every driver supporting amendment must have amend_opts */
+    assert(drv->amend_opts);
=20
     printf("Creation options for '%s':\n", format);
-    qemu_opts_print_help(drv->create_opts, false);
+    qemu_opts_print_help(drv->amend_opts, false);
     printf("\nNote that not all of these options may be amendable.\n");
     return 0;
 }
@@ -3950,7 +3950,7 @@ static int img_amend(int argc, char **argv)
     Error *err =3D NULL;
     int c, ret =3D 0;
     char *options =3D NULL;
-    QemuOptsList *create_opts =3D NULL;
+    QemuOptsList *amend_opts =3D NULL;
     QemuOpts *opts =3D NULL;
     const char *fmt =3D NULL, *filename, *cache;
     int flags;
@@ -4081,11 +4081,11 @@ static int img_amend(int argc, char **argv)
         goto out;
     }
=20
-    /* Every driver supporting amendment must have create_opts */
-    assert(bs->drv->create_opts);
+    /* Every driver supporting amendment must have amend_opts */
+    assert(bs->drv->amend_opts);
=20
-    create_opts =3D qemu_opts_append(create_opts, bs->drv->create_opts);
-    opts =3D qemu_opts_create(create_opts, NULL, 0, &error_abort);
+    amend_opts =3D qemu_opts_append(amend_opts, bs->drv->amend_opts);
+    opts =3D qemu_opts_create(amend_opts, NULL, 0, &error_abort);
     qemu_opts_do_parse(opts, options, NULL, &err);
     if (err) {
         error_report_err(err);
@@ -4108,7 +4108,7 @@ out:
 out_no_progress:
     blk_unref(blk);
     qemu_opts_del(opts);
-    qemu_opts_free(create_opts);
+    qemu_opts_free(amend_opts);
     g_free(options);
=20
     if (ret) {
--=20
2.17.2


