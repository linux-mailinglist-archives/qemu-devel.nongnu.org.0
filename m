Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE4370BBC
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 15:57:30 +0200 (CEST)
Received: from localhost ([::1]:45448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldCbA-0003mW-8E
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 09:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1ld6ex-0002R4-7T; Sun, 02 May 2021 03:36:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1ld6eu-00052Y-CS; Sun, 02 May 2021 03:36:58 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1427YFVP075894; Sun, 2 May 2021 03:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PzTEKeHnviuWjWLHKlV+Ar4ZbFCQYxCzfxOlklTxe6c=;
 b=cfC+Gb0ucg8ICGGCNAEsjE0+jdfBheyM0yRmghuKWTFMcSpS9jwLtOTs7ReI1Oq7DeES
 x14esBlYN2eHS2SHn5+u2YwhWuPuMcMDwqNNdTfxz7Oyw0+prfBfI5qZKSLxk5c+kFar
 6j0/aSoL/FKJQM2+ljav6it7NjWSFDJRu/fjovs8pAPQVXbh2784Kbl/OB22qGOCCuOW
 oCeVzN7LxA8Fr8TUyYLtz2zCp7zi9iiAtZblNRnPQLsKecX47RCZY2Sm+HxXmt1oIgiR
 7Rzn5YC/vEhXzXNKujuKwUxsFE6IInZa9fxdabzwqjYIXuRY4tLQ+M/B/uNb7tkvuD25 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 389q9s0hu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 02 May 2021 03:36:52 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1427Zt9X083241;
 Sun, 2 May 2021 03:36:52 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 389q9s0htt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 02 May 2021 03:36:52 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1427SOT1015070;
 Sun, 2 May 2021 07:36:51 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 388xm8rpqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 02 May 2021 07:36:51 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1427ambQ29032818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 2 May 2021 07:36:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81F1BBE053;
 Sun,  2 May 2021 07:36:48 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B74ABE04F;
 Sun,  2 May 2021 07:36:46 +0000 (GMT)
Received: from ceph-oro.sl.cloud9.ibm.com (unknown [9.148.245.63])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sun,  2 May 2021 07:36:45 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/rbd: Add support for rbd image encryption
Date: Sun,  2 May 2021 10:36:17 +0300
Message-Id: <20210502073617.2978836-1-oro@il.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 25PZHn34t2NdRXJbXbW9oOdBm116yVzJ
X-Proofpoint-ORIG-GUID: 7MArAvWPZyf4RdMtEegH10f4kxs-cY_f
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-02_02:2021-04-30,
 2021-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1011 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105020062
Received-SPF: pass client-ip=148.163.156.1; envelope-from=oro@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 02 May 2021 09:54:49 -0400
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
Cc: kwolf@redhat.com, oro@il.ibm.com, to.my.trociny@gmail.com,
 qemu-block@nongnu.org, dannyh@il.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Starting from ceph Pacific, RBD has built-in support for image-level encryption.
Currently supported formats are LUKS version 1 and 2.

There are 2 new relevant librbd APIs for controlling encryption, both expect an
open image context:

rbd_encryption_format: formats an image (i.e. writes the LUKS header)
rbd_encryption_load: loads encryptor/decryptor to the image IO stack

This commit extends the qemu rbd driver API to support the above.

Signed-off-by: Or Ozeri <oro@il.ibm.com>
---
 block/rbd.c          | 230 ++++++++++++++++++++++++++++++++++++++++++-
 qapi/block-core.json |  61 ++++++++++++
 2 files changed, 287 insertions(+), 4 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index f098a89c7b..1239e97889 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -108,6 +108,13 @@ typedef struct BDRVRBDState {
     uint64_t image_size;
 } BDRVRBDState;
 
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION
+typedef int (*RbdEncryptionFunc)(rbd_image_t image,
+                                 rbd_encryption_format_t format,
+                                 rbd_encryption_options_t opts,
+                                 size_t opts_size);
+#endif
+
 static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
                             BlockdevOptionsRbd *opts, bool cache,
                             const char *keypairs, const char *secretid,
@@ -341,6 +348,115 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
     }
 }
 
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION
+static int qemu_rbd_convert_luks_options(
+        RbdEncryptionOptionsLUKSBase *luks_opts,
+        rbd_encryption_algorithm_t *alg,
+        char** passphrase,
+        Error **errp)
+{
+    int r = 0;
+
+    if (!luks_opts->has_passphrase_secret) {
+        r = -EINVAL;
+        error_setg_errno(errp, -r, "missing encrypt.passphrase-secret");
+        return r;
+    }
+
+    *passphrase = qcrypto_secret_lookup_as_utf8(luks_opts->passphrase_secret,
+                                                errp);
+    if (!*passphrase) {
+        return -EIO;
+    }
+
+    if (luks_opts->has_cipher_alg) {
+        switch (luks_opts->cipher_alg) {
+            case RBD_ENCRYPTION_ALGORITHM_AES_128: {
+                *alg = RBD_ENCRYPTION_ALGORITHM_AES128;
+                break;
+            }
+            case RBD_ENCRYPTION_ALGORITHM_AES_256: {
+                *alg = RBD_ENCRYPTION_ALGORITHM_AES256;
+                break;
+            }
+            default: {
+                r = -ENOTSUP;
+                error_setg_errno(errp, -r, "unknown encryption algorithm: %u",
+                                 luks_opts->cipher_alg);
+                return r;
+            }
+        }
+    } else {
+        /* default alg */
+        *alg = RBD_ENCRYPTION_ALGORITHM_AES256;
+    }
+
+    return 0;
+}
+
+static int qemu_rbd_apply_encryption_function(rbd_image_t image,
+                                              RbdEncryptionSpec* spec,
+                                              RbdEncryptionFunc func,
+                                              Error **errp)
+{
+    int r = 0;
+    g_autofree char *passphrase = NULL;
+    g_autofree rbd_encryption_options_t opts = NULL;
+    rbd_encryption_format_t format;
+    size_t opts_size;
+
+    switch (spec->format) {
+        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS1: {
+            rbd_encryption_luks1_format_options_t *luks1_opts =
+                    g_new0(rbd_encryption_luks1_format_options_t, 1);
+            format = RBD_ENCRYPTION_FORMAT_LUKS1;
+            opts = luks1_opts;
+            opts_size = sizeof(rbd_encryption_luks1_format_options_t);
+            r = qemu_rbd_convert_luks_options(
+                    qapi_RbdEncryptionOptionsLUKS1_base(&spec->u.luks1),
+                    &luks1_opts->alg, &passphrase, errp);
+            if (passphrase) {
+                luks1_opts->passphrase = passphrase;
+                luks1_opts->passphrase_size = strlen(passphrase);
+            }
+            break;
+        }
+        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
+            rbd_encryption_luks2_format_options_t *luks2_opts =
+                    g_new0(rbd_encryption_luks2_format_options_t, 1);
+            format = RBD_ENCRYPTION_FORMAT_LUKS2;
+            opts = luks2_opts;
+            opts_size = sizeof(rbd_encryption_luks2_format_options_t);
+            r = qemu_rbd_convert_luks_options(
+                    qapi_RbdEncryptionOptionsLUKS2_base(&spec->u.luks2),
+                    &luks2_opts->alg, &passphrase, errp);
+            if (passphrase) {
+                luks2_opts->passphrase = passphrase;
+                luks2_opts->passphrase_size = strlen(passphrase);
+            }
+            break;
+        }
+        default: {
+            r = -ENOTSUP;
+            error_setg_errno(
+                    errp, -r, "unknown image encryption format: %u",
+                    spec->format);
+        }
+    }
+
+    if (r < 0) {
+        return r;
+    }
+
+    r = func(image, format, opts, opts_size);
+    if (r < 0) {
+        error_setg_errno(errp, -r, "error applying encryption function");
+    }
+
+    return r;
+}
+#endif
+
 /* FIXME Deprecate and remove keypairs or make it available in QMP. */
 static int qemu_rbd_do_create(BlockdevCreateOptions *options,
                               const char *keypairs, const char *password_secret,
@@ -358,6 +474,13 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
         return -EINVAL;
     }
 
+#ifndef LIBRBD_SUPPORTS_ENCRYPTION
+    if (opts->location->has_encrypt) {
+        error_setg(errp, "RBD library does not support image encryption");
+        return -ENOTSUP;
+    }
+#endif
+
     if (opts->has_cluster_size) {
         int64_t objsize = opts->cluster_size;
         if ((objsize - 1) & objsize) {    /* not a power of 2? */
@@ -383,6 +506,30 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
         goto out;
     }
 
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION
+    if (opts->location->has_encrypt) {
+        rbd_image_t image;
+
+        ret = rbd_open(io_ctx, opts->location->image, &image, NULL);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "error reading header from %s",
+                             opts->location->image);
+            goto out;
+        }
+
+        ret = qemu_rbd_apply_encryption_function(image,
+                                                 opts->location->encrypt,
+                                                 &rbd_encryption_format,
+                                                 errp);
+        rbd_close(image);
+        if (ret < 0) {
+            /* encryption format fail, try removing the image */
+            rbd_remove(io_ctx, opts->location->image);
+            goto out;
+        }
+    }
+#endif
+
     ret = 0;
 out:
     rados_ioctx_destroy(io_ctx);
@@ -395,6 +542,42 @@ static int qemu_rbd_co_create(BlockdevCreateOptions *options, Error **errp)
     return qemu_rbd_do_create(options, NULL, NULL, errp);
 }
 
+static int qemu_rbd_extract_encryption_spec(QemuOpts *opts,
+                                            RbdEncryptionSpec **spec,
+                                            Error **errp)
+{
+    QDict *opts_qdict;
+    QDict *encrypt_qdict;
+    Visitor *v;
+    int ret = 0;
+
+    opts_qdict = qemu_opts_to_qdict(opts, NULL);
+    qdict_extract_subqdict(opts_qdict, &encrypt_qdict, "encrypt.");
+    qobject_unref(opts_qdict);
+    if (!qdict_size(encrypt_qdict)) {
+        *spec = NULL;
+        goto exit;
+    }
+
+    /* Convert options into a QAPI object */
+    v = qobject_input_visitor_new_flat_confused(encrypt_qdict, errp);
+    if (!v) {
+        ret = -EINVAL;
+        goto exit;
+    }
+
+    visit_type_RbdEncryptionSpec(v, NULL, spec, errp);
+    visit_free(v);
+    if (!*spec) {
+        ret = -EINVAL;
+        goto exit;
+    }
+
+exit:
+    qobject_unref(encrypt_qdict);
+    return ret;
+}
+
 static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
                                                 const char *filename,
                                                 QemuOpts *opts,
@@ -403,6 +586,7 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
     BlockdevCreateOptions *create_options;
     BlockdevCreateOptionsRbd *rbd_opts;
     BlockdevOptionsRbd *loc;
+    RbdEncryptionSpec *encryption_spec = NULL;
     Error *local_err = NULL;
     const char *keypairs, *password_secret;
     QDict *options = NULL;
@@ -431,6 +615,11 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
         goto exit;
     }
 
+    ret = qemu_rbd_extract_encryption_spec(opts, &encryption_spec, errp);
+    if (ret < 0) {
+        goto exit;
+    }
+
     /*
      * Caution: while qdict_get_try_str() is fine, getting non-string
      * types would require more care.  When @options come from -blockdev
@@ -446,6 +635,8 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
     loc->q_namespace = g_strdup(qdict_get_try_str(options, "namespace"));
     loc->has_q_namespace = !!loc->q_namespace;
     loc->image       = g_strdup(qdict_get_try_str(options, "image"));
+    loc->encrypt     = encryption_spec;
+    loc->has_encrypt = !!encryption_spec;
     keypairs         = qdict_get_try_str(options, "=keyvalue-pairs");
 
     ret = qemu_rbd_do_create(create_options, keypairs, password_secret, errp);
@@ -756,12 +947,26 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto failed_open;
     }
 
+    if (opts->has_encrypt) {
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION
+        r = qemu_rbd_apply_encryption_function(s->image, opts->encrypt,
+                                               &rbd_encryption_load, errp);
+        if (r < 0) {
+            goto failed_post_open;
+        }
+#else
+        r = -ENOTSUP;
+        error_setg_errno(errp, -r,
+                         "RBD library does not support image encryption");
+        goto failed_post_open;
+#endif
+    }
+
     r = rbd_get_size(s->image, &s->image_size);
     if (r < 0) {
         error_setg_errno(errp, -r, "error getting image size from %s",
                          s->image_name);
-        rbd_close(s->image);
-        goto failed_open;
+        goto failed_post_open;
     }
 
     /* If we are using an rbd snapshot, we must be r/o, otherwise
@@ -769,8 +974,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
     if (s->snap != NULL) {
         r = bdrv_apply_auto_read_only(bs, "rbd snapshots are read-only", errp);
         if (r < 0) {
-            rbd_close(s->image);
-            goto failed_open;
+            goto failed_post_open;
         }
     }
 
@@ -780,6 +984,8 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
     r = 0;
     goto out;
 
+failed_post_open:
+    rbd_close(s->image);
 failed_open:
     rados_ioctx_destroy(s->io_ctx);
     g_free(s->snap);
@@ -1243,6 +1449,22 @@ static QemuOptsList qemu_rbd_create_opts = {
             .type = QEMU_OPT_STRING,
             .help = "ID of secret providing the password",
         },
+        {
+            .name = "encrypt.format",
+            .type = QEMU_OPT_STRING,
+            .help = "Encrypt the image, format choices: 'luks1', 'luks2'",
+        },
+        {
+            .name = "encrypt.cipher-alg",
+            .type = QEMU_OPT_STRING,
+            .help = "Name of encryption cipher algorithm"
+                    " (allowed values: aes-128, aes-256)",
+        },
+        {
+            .name = "encrypt.passphrase-secret",
+            .type = QEMU_OPT_STRING,
+            .help = "ID of secret providing LUKS passphrase",
+        },
         { /* end of list */ }
     }
 };
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6d227924d0..a1f3230e29 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3609,6 +3609,64 @@
 { 'enum': 'RbdAuthMode',
   'data': [ 'cephx', 'none' ] }
 
+##
+# @RbdImageEncryptionFormat:
+#
+# Since: 6.1
+##
+{ 'enum': 'RbdImageEncryptionFormat',
+  'data': [ 'luks1', 'luks2' ] }
+
+##
+# @RbdEncryptionAlgorithm:
+#
+# Since: 6.1
+##
+{ 'enum': 'RbdEncryptionAlgorithm',
+  'data': [ 'aes-128', 'aes-256' ] }
+
+##
+# @RbdEncryptionOptionsLUKSBase:
+#
+# @cipher-alg: The encryption algorithm
+# @passphrase-secret: ID of a QCryptoSecret object providing a passphrase
+#                     for unlocking the encryption
+#
+# Since: 6.1
+##
+{ 'struct': 'RbdEncryptionOptionsLUKSBase',
+  'data': { '*cipher-alg': 'RbdEncryptionAlgorithm',
+            '*passphrase-secret': 'str' }}
+
+##
+# @RbdEncryptionOptionsLUKS1:
+#
+# Since: 6.1
+##
+{ 'struct': 'RbdEncryptionOptionsLUKS1',
+  'base': 'RbdEncryptionOptionsLUKSBase',
+  'data': {}}
+
+##
+# @RbdEncryptionOptionsLUKS2:
+#
+# Since: 6.1
+##
+{ 'struct': 'RbdEncryptionOptionsLUKS2',
+  'base': 'RbdEncryptionOptionsLUKSBase',
+  'data': {}}
+
+##
+# @RbdEncryptionSpec:
+#
+# Since: 6.1
+##
+{ 'union': 'RbdEncryptionSpec',
+  'base': { 'format': 'RbdImageEncryptionFormat' },
+  'discriminator': 'format',
+  'data': { 'luks1': 'RbdEncryptionOptionsLUKS1',
+            'luks2': 'RbdEncryptionOptionsLUKS2'} }
+
 ##
 # @BlockdevOptionsRbd:
 #
@@ -3624,6 +3682,8 @@
 #
 # @snapshot: Ceph snapshot name.
 #
+# @encrypt: Image encryption specification. (Since 6.1)
+#
 # @user: Ceph id name.
 #
 # @auth-client-required: Acceptable authentication modes.
@@ -3646,6 +3706,7 @@
             'image': 'str',
             '*conf': 'str',
             '*snapshot': 'str',
+            '*encrypt': 'RbdEncryptionSpec',
             '*user': 'str',
             '*auth-client-required': ['RbdAuthMode'],
             '*key-secret': 'str',
-- 
2.27.0


