Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A344E1CCB5E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 15:43:05 +0200 (CEST)
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXmES-0006BZ-I4
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 09:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jXmCP-0003BX-Mk
 for qemu-devel@nongnu.org; Sun, 10 May 2020 09:40:57 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52864
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jXmCO-0003sc-DZ
 for qemu-devel@nongnu.org; Sun, 10 May 2020 09:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589118055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wteje7OXG1CsqidT45ZkyOnEmSSIY/yY0tWwjdbkh84=;
 b=YsWOGLVa4wqyMxs1rWLaJTe3If/XL0F5Oigil4k/hWJn9lP1Y90Nfz5vDNjy3Yw58WHFjx
 NLeDAMBORpkP6h2Tymp+HUCwqIlppH9HhnxErQk8n30lPkMkV7OvOd8eFHKDziN+ysZBlk
 +xPl3VFEW4F1kN2WEGFk2oDVoFE579k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-Rvk-a7EGNEmeak-jVOeuKw-1; Sun, 10 May 2020 09:40:53 -0400
X-MC-Unique: Rvk-a7EGNEmeak-jVOeuKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44E0F18A0725;
 Sun, 10 May 2020 13:40:52 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E08532E17D;
 Sun, 10 May 2020 13:40:49 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/14] block/amend: separate amend and create options for
 qemu-img
Date: Sun, 10 May 2020 16:40:27 +0300
Message-Id: <20200510134037.18487-5-mlevitsk@redhat.com>
In-Reply-To: <20200510134037.18487-1-mlevitsk@redhat.com>
References: <20200510134037.18487-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 08:00:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/qcow2.c             | 160 +++++++++++++++++++++-----------------
 include/block/block_int.h |   4 +
 qemu-img.c                |  18 ++---
 3 files changed, 100 insertions(+), 82 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 79fbad9d76..fc494c7591 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5520,83 +5520,96 @@ void qcow2_signal_corruption(BlockDriverState *bs, bool fatal, int64_t offset,
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
+    }                                                               \
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
@@ -5656,6 +5669,7 @@ BlockDriver bdrv_qcow2 = {
     .bdrv_inactivate            = qcow2_inactivate,
 
     .create_opts         = &qcow2_create_opts,
+    .amend_opts          = &qcow2_amend_opts,
     .strong_runtime_opts = qcow2_strong_runtime_opts,
     .mutable_opts        = mutable_opts,
     .bdrv_co_check       = qcow2_co_check,
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 952b2f033a..0a71357b50 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -412,6 +412,10 @@ struct BlockDriver {
 
     /* List of options for creating images, terminated by name == NULL */
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
@@ -3936,11 +3936,11 @@ static int print_amend_option_help(const char *format)
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
@@ -3950,7 +3950,7 @@ static int img_amend(int argc, char **argv)
     Error *err = NULL;
     int c, ret = 0;
     char *options = NULL;
-    QemuOptsList *create_opts = NULL;
+    QemuOptsList *amend_opts = NULL;
     QemuOpts *opts = NULL;
     const char *fmt = NULL, *filename, *cache;
     int flags;
@@ -4081,11 +4081,11 @@ static int img_amend(int argc, char **argv)
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
@@ -4108,7 +4108,7 @@ out:
 out_no_progress:
     blk_unref(blk);
     qemu_opts_del(opts);
-    qemu_opts_free(create_opts);
+    qemu_opts_free(amend_opts);
     g_free(options);
 
     if (ret) {
-- 
2.17.2


