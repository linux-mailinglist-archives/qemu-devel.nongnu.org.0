Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8737203A77
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 17:15:36 +0200 (CEST)
Received: from localhost ([::1]:32822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnOAZ-0006DJ-Lm
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 11:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jnO6Y-0008G4-46
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 11:11:26 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52912
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jnO6W-0005yN-41
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 11:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592838683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/QLjwJwWyXwpUrYwWof8lsHAdKQS5LjJPWzPxasJveQ=;
 b=KvvC/37EOo0WTjMfp/z0HOuDOoySBLflCE8PY0BzrDmQJognXWRW4HXTgpMpZIifvcf4Mb
 dLTEuamkWPvfCJOJh5qcyx9OzGSrPT7CMjKaqiZyfDtRnb4ldtxItcf1cDnDPg/BkCtcQF
 T0ZvESXG7dge08PwjMWLNXZiS5e/Tcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-54PMwGNTN72uyxT9ghqoPg-1; Mon, 22 Jun 2020 11:11:18 -0400
X-MC-Unique: 54PMwGNTN72uyxT9ghqoPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C211005512;
 Mon, 22 Jun 2020 15:11:17 +0000 (UTC)
Received: from localhost (ovpn-114-85.ams2.redhat.com [10.36.114.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE31210013D7;
 Mon, 22 Jun 2020 15:11:16 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/18] block/amend: separate amend and create options for
 qemu-img
Date: Mon, 22 Jun 2020 17:10:48 +0200
Message-Id: <20200622151059.921191-8-mreitz@redhat.com>
In-Reply-To: <20200622151059.921191-1-mreitz@redhat.com>
References: <20200622151059.921191-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200608094030.670121-5-mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h |   4 +
 block/qcow2.c             | 173 +++++++++++++++++++++-----------------
 qemu-img.c                |  18 ++--
 3 files changed, 107 insertions(+), 88 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 066b9eaa40..ed335519cc 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -420,6 +420,10 @@ struct BlockDriver {
 
     /* List of options for creating images, terminated by name == NULL */
     QemuOptsList *create_opts;
+
+    /* List of options for image amend */
+    QemuOptsList *amend_opts;
+
     /*
      * If this driver supports reopening images this contains a
      * NULL-terminated list of the runtime options that can be
diff --git a/block/qcow2.c b/block/qcow2.c
index 2ab0c382f7..fcfd90f2e2 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5649,89 +5649,103 @@ void qcow2_signal_corruption(BlockDriverState *bs, bool fatal, int64_t offset,
     s->signaled_corruption = true;
 }
 
+#define QCOW_COMMON_OPTIONS                                         \
+    {                                                               \
+        .name = BLOCK_OPT_SIZE,                                     \
+        .type = QEMU_OPT_SIZE,                                      \
+        .help = "Virtual disk size"                                 \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_COMPAT_LEVEL,                             \
+        .type = QEMU_OPT_STRING,                                    \
+        .help = "Compatibility level (v2 [0.10] or v3 [1.1])"       \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_BACKING_FILE,                             \
+        .type = QEMU_OPT_STRING,                                    \
+        .help = "File name of a base image"                         \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_BACKING_FMT,                              \
+        .type = QEMU_OPT_STRING,                                    \
+        .help = "Image format of the base image"                    \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_DATA_FILE,                                \
+        .type = QEMU_OPT_STRING,                                    \
+        .help = "File name of an external data file"                \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_DATA_FILE_RAW,                            \
+        .type = QEMU_OPT_BOOL,                                      \
+        .help = "The external data file must stay valid "           \
+                "as a raw image"                                    \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_ENCRYPT,                                  \
+        .type = QEMU_OPT_BOOL,                                      \
+        .help = "Encrypt the image with format 'aes'. (Deprecated " \
+                "in favor of " BLOCK_OPT_ENCRYPT_FORMAT "=aes)",    \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_ENCRYPT_FORMAT,                           \
+        .type = QEMU_OPT_STRING,                                    \
+        .help = "Encrypt the image, format choices: 'aes', 'luks'", \
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
+        .name = BLOCK_OPT_CLUSTER_SIZE,                             \
+        .type = QEMU_OPT_SIZE,                                      \
+        .help = "qcow2 cluster size",                               \
+        .def_value_str = stringify(DEFAULT_CLUSTER_SIZE)            \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_PREALLOC,                                 \
+        .type = QEMU_OPT_STRING,                                    \
+        .help = "Preallocation mode (allowed values: off, "         \
+                "metadata, falloc, full)"                           \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_LAZY_REFCOUNTS,                           \
+        .type = QEMU_OPT_BOOL,                                      \
+        .help = "Postpone refcount updates",                        \
+        .def_value_str = "off"                                      \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_REFCOUNT_BITS,                            \
+        .type = QEMU_OPT_NUMBER,                                    \
+        .help = "Width of a reference count entry in bits",         \
+        .def_value_str = "16"                                       \
+    },                                                              \
+    {                                                               \
+        .name = BLOCK_OPT_COMPRESSION_TYPE,                         \
+        .type = QEMU_OPT_STRING,                                    \
+        .help = "Compression method used for image cluster "        \
+                "compression",                                      \
+        .def_value_str = "zlib"                                     \
+    }
+
 static QemuOptsList qcow2_create_opts = {
     .name = "qcow2-create-opts",
     .head = QTAILQ_HEAD_INITIALIZER(qcow2_create_opts.head),
     .desc = {
-        {
-            .name = BLOCK_OPT_SIZE,
-            .type = QEMU_OPT_SIZE,
-            .help = "Virtual disk size"
-        },
-        {
-            .name = BLOCK_OPT_COMPAT_LEVEL,
-            .type = QEMU_OPT_STRING,
-            .help = "Compatibility level (v2 [0.10] or v3 [1.1])"
-        },
-        {
-            .name = BLOCK_OPT_BACKING_FILE,
-            .type = QEMU_OPT_STRING,
-            .help = "File name of a base image"
-        },
-        {
-            .name = BLOCK_OPT_BACKING_FMT,
-            .type = QEMU_OPT_STRING,
-            .help = "Image format of the base image"
-        },
-        {
-            .name = BLOCK_OPT_DATA_FILE,
-            .type = QEMU_OPT_STRING,
-            .help = "File name of an external data file"
-        },
-        {
-            .name = BLOCK_OPT_DATA_FILE_RAW,
-            .type = QEMU_OPT_BOOL,
-            .help = "The external data file must stay valid as a raw image"
-        },
-        {
-            .name = BLOCK_OPT_ENCRYPT,
-            .type = QEMU_OPT_BOOL,
-            .help = "Encrypt the image with format 'aes'. (Deprecated "
-                    "in favor of " BLOCK_OPT_ENCRYPT_FORMAT "=aes)",
-        },
-        {
-            .name = BLOCK_OPT_ENCRYPT_FORMAT,
-            .type = QEMU_OPT_STRING,
-            .help = "Encrypt the image, format choices: 'aes', 'luks'",
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
-            .name = BLOCK_OPT_CLUSTER_SIZE,
-            .type = QEMU_OPT_SIZE,
-            .help = "qcow2 cluster size",
-            .def_value_str = stringify(DEFAULT_CLUSTER_SIZE)
-        },
-        {
-            .name = BLOCK_OPT_PREALLOC,
-            .type = QEMU_OPT_STRING,
-            .help = "Preallocation mode (allowed values: off, metadata, "
-                    "falloc, full)"
-        },
-        {
-            .name = BLOCK_OPT_LAZY_REFCOUNTS,
-            .type = QEMU_OPT_BOOL,
-            .help = "Postpone refcount updates",
-            .def_value_str = "off"
-        },
-        {
-            .name = BLOCK_OPT_REFCOUNT_BITS,
-            .type = QEMU_OPT_NUMBER,
-            .help = "Width of a reference count entry in bits",
-            .def_value_str = "16"
-        },
-        {
-            .name = BLOCK_OPT_COMPRESSION_TYPE,
-            .type = QEMU_OPT_STRING,
-            .help = "Compression method used for image cluster compression",
-            .def_value_str = "zlib"
-        },
+        QCOW_COMMON_OPTIONS,
+        { /* end of list */ }
+    }
+};
+
+static QemuOptsList qcow2_amend_opts = {
+    .name = "qcow2-amend-opts",
+    .head = QTAILQ_HEAD_INITIALIZER(qcow2_amend_opts.head),
+    .desc = {
+        QCOW_COMMON_OPTIONS,
         { /* end of list */ }
     }
 };
@@ -5792,6 +5806,7 @@ BlockDriver bdrv_qcow2 = {
     .bdrv_inactivate            = qcow2_inactivate,
 
     .create_opts         = &qcow2_create_opts,
+    .amend_opts          = &qcow2_amend_opts,
     .strong_runtime_opts = qcow2_strong_runtime_opts,
     .mutable_opts        = mutable_opts,
     .bdrv_co_check       = qcow2_co_check,
diff --git a/qemu-img.c b/qemu-img.c
index 10d81f09db..0c4541b017 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4077,11 +4077,11 @@ static int print_amend_option_help(const char *format)
         return 1;
     }
 
-    /* Every driver supporting amendment must have create_opts */
-    assert(drv->create_opts);
+    /* Every driver supporting amendment must have amend_opts */
+    assert(drv->amend_opts);
 
     printf("Creation options for '%s':\n", format);
-    qemu_opts_print_help(drv->create_opts, false);
+    qemu_opts_print_help(drv->amend_opts, false);
     printf("\nNote that not all of these options may be amendable.\n");
     return 0;
 }
@@ -4091,7 +4091,7 @@ static int img_amend(int argc, char **argv)
     Error *err = NULL;
     int c, ret = 0;
     char *options = NULL;
-    QemuOptsList *create_opts = NULL;
+    QemuOptsList *amend_opts = NULL;
     QemuOpts *opts = NULL;
     const char *fmt = NULL, *filename, *cache;
     int flags;
@@ -4222,11 +4222,11 @@ static int img_amend(int argc, char **argv)
         goto out;
     }
 
-    /* Every driver supporting amendment must have create_opts */
-    assert(bs->drv->create_opts);
+    /* Every driver supporting amendment must have amend_opts */
+    assert(bs->drv->amend_opts);
 
-    create_opts = qemu_opts_append(create_opts, bs->drv->create_opts);
-    opts = qemu_opts_create(create_opts, NULL, 0, &error_abort);
+    amend_opts = qemu_opts_append(amend_opts, bs->drv->amend_opts);
+    opts = qemu_opts_create(amend_opts, NULL, 0, &error_abort);
     qemu_opts_do_parse(opts, options, NULL, &err);
     if (err) {
         error_report_err(err);
@@ -4249,7 +4249,7 @@ out:
 out_no_progress:
     blk_unref(blk);
     qemu_opts_del(opts);
-    qemu_opts_free(create_opts);
+    qemu_opts_free(amend_opts);
     g_free(options);
 
     if (ret) {
-- 
2.26.2


