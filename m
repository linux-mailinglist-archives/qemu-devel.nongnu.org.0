Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF67374344
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:03:59 +0200 (CEST)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKwI-00072C-Hi
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1leKi2-0004Rf-Cf; Wed, 05 May 2021 12:49:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41270
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1leKhv-0005aC-IJ; Wed, 05 May 2021 12:49:14 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145GXPo8043687; Wed, 5 May 2021 12:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tiFz9ntCgIaUr5A4JXi5YXbyOv8XpH0NhdI3hCoOmt8=;
 b=QqJ08h7bm6gtaSPgp+W65/NKF/TmZaQsFyYjbRzp21eRUvLnbjfTHTUzOMmUxU94NLOY
 FrbEtNKQ5fZGlbrC1UmoQ/vgNvp9P0AoZ1u1DvUqkKnhuu8EEAs/kPfqOrKBts5FRw0N
 5IvgH0YByAhz8xZeYXamVocbuHweWCZ+b4BpVuBC4NHDjtG/1vOMLa/jVD5p7lUEwehH
 9D2KdKXyigWd4UzWknHWMijWtCkcgRyFTX/e9zzLspIySQ979HgBCDzaIdFGZeANijJK
 FKwtNsyiI7XDe5Ic58Hy9VVj9L6+VbxSazpvCDDINh2GP591+6ZGi2ZJxp0bdV/d+MIQ TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38bxpxgye4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 12:49:04 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 145GXluf044907;
 Wed, 5 May 2021 12:49:03 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38bxpxgydt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 12:49:03 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 145GfgLj023593;
 Wed, 5 May 2021 16:49:03 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 38bedtpyyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 16:49:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 145Gn0b334800124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 16:49:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 285507806A;
 Wed,  5 May 2021 16:49:00 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 238357805F;
 Wed,  5 May 2021 16:48:57 +0000 (GMT)
Received: from ceph-oro.sl.cloud9.ibm.com (unknown [9.148.245.63])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  5 May 2021 16:48:56 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/rbd: Add support for rbd image encryption
Date: Wed,  5 May 2021 19:48:34 +0300
Message-Id: <20210505164834.4082979-1-oro@il.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: InkzKRZBk63PCT6yPd2dFJJ9SZNPibDr
X-Proofpoint-ORIG-GUID: 2zSEf6kAmysYXIRvhMTmD4ab-Mk3B_e5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_09:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105050115
Received-SPF: pass client-ip=148.163.158.5; envelope-from=oro@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 dannyh@il.ibm.com, oro@il.ibm.com, to.my.trociny@gmail.com
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
 block/raw-format.c   |   7 +
 block/rbd.c          | 371 ++++++++++++++++++++++++++++++++++++++++++-
 qapi/block-core.json | 110 ++++++++++++-
 3 files changed, 482 insertions(+), 6 deletions(-)

diff --git a/block/raw-format.c b/block/raw-format.c
index 7717578ed6..f6e70e2356 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -369,6 +369,12 @@ static int raw_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     return bdrv_get_info(bs->file->bs, bdi);
 }
 
+static ImageInfoSpecific *raw_get_specific_info(BlockDriverState *bs,
+                                                Error **errp)
+{
+    return bdrv_get_specific_info(bs->file->bs, errp);
+}
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     if (bs->probed) {
@@ -603,6 +609,7 @@ BlockDriver bdrv_raw = {
     .has_variable_length  = true,
     .bdrv_measure         = &raw_measure,
     .bdrv_get_info        = &raw_get_info,
+    .bdrv_get_specific_info = &raw_get_specific_info,
     .bdrv_refresh_limits  = &raw_refresh_limits,
     .bdrv_probe_blocksizes = &raw_probe_blocksizes,
     .bdrv_probe_geometry  = &raw_probe_geometry,
diff --git a/block/rbd.c b/block/rbd.c
index f098a89c7b..183b17cd84 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -73,6 +73,18 @@
 #define LIBRBD_USE_IOVEC 0
 #endif
 
+#define RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN 8
+
+static const char rbd_luks_header_verification[
+        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
+    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1
+};
+
+static const char rbd_luks2_header_verification[
+        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
+    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
+};
+
 typedef enum {
     RBD_AIO_READ,
     RBD_AIO_WRITE,
@@ -341,6 +353,206 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
     }
 }
 
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION
+static int qemu_rbd_convert_luks_options(
+        RbdEncryptionOptionsLUKSBase *luks_opts,
+        char **passphrase,
+        Error **errp)
+{
+    int r = 0;
+
+    if (!luks_opts->has_key_secret) {
+        r = -EINVAL;
+        error_setg_errno(errp, -r, "missing encrypt.key-secret");
+        return r;
+    }
+
+    *passphrase = qcrypto_secret_lookup_as_utf8(luks_opts->key_secret, errp);
+    if (!*passphrase) {
+        return -EIO;
+    }
+
+    return 0;
+}
+
+static int qemu_rbd_convert_luks_create_options(
+        RbdEncryptionCreateOptionsLUKSBase *luks_opts,
+        rbd_encryption_algorithm_t *alg,
+        char **passphrase,
+        Error **errp)
+{
+    int r = 0;
+
+    r = qemu_rbd_convert_luks_options(
+            qapi_RbdEncryptionCreateOptionsLUKSBase_base(luks_opts),
+            passphrase, errp);
+    if (r < 0) {
+        return r;
+    }
+
+    if (luks_opts->has_cipher_alg) {
+        switch (luks_opts->cipher_alg) {
+            case QCRYPTO_CIPHER_ALG_AES_128: {
+                *alg = RBD_ENCRYPTION_ALGORITHM_AES128;
+                break;
+            }
+            case QCRYPTO_CIPHER_ALG_AES_256: {
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
+static int qemu_rbd_encryption_format(rbd_image_t image,
+                                      RbdEncryptionCreateOptions *encrypt,
+                                      Error **errp)
+{
+    int r = 0;
+    g_autofree char *passphrase = NULL;
+    g_autofree rbd_encryption_options_t opts = NULL;
+    rbd_encryption_format_t format;
+    rbd_image_info_t info;
+    size_t opts_size;
+    uint64_t raw_size;
+
+    r = rbd_stat(image, &info, sizeof(info));
+    if (r < 0) {
+        error_setg_errno(errp, -r, "cannot get raw image size");
+        return r;
+    }
+    raw_size = info.size;
+
+    switch (encrypt->format) {
+        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
+            rbd_encryption_luks1_format_options_t *luks_opts =
+                    g_new0(rbd_encryption_luks1_format_options_t, 1);
+            format = RBD_ENCRYPTION_FORMAT_LUKS1;
+            opts = luks_opts;
+            opts_size = sizeof(rbd_encryption_luks1_format_options_t);
+            r = qemu_rbd_convert_luks_create_options(
+                    qapi_RbdEncryptionCreateOptionsLUKS_base(&encrypt->u.luks),
+                    &luks_opts->alg, &passphrase, errp);
+            luks_opts->passphrase = passphrase;
+            luks_opts->passphrase_size = strlen(passphrase);
+            break;
+        }
+        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
+            rbd_encryption_luks2_format_options_t *luks2_opts =
+                    g_new0(rbd_encryption_luks2_format_options_t, 1);
+            format = RBD_ENCRYPTION_FORMAT_LUKS2;
+            opts = luks2_opts;
+            opts_size = sizeof(rbd_encryption_luks2_format_options_t);
+            r = qemu_rbd_convert_luks_create_options(
+                    qapi_RbdEncryptionCreateOptionsLUKS2_base(
+                            &encrypt->u.luks2),
+                    &luks2_opts->alg, &passphrase, errp);
+            luks2_opts->passphrase = passphrase;
+            luks2_opts->passphrase_size = strlen(passphrase);
+            break;
+        }
+        default: {
+            r = -ENOTSUP;
+            error_setg_errno(
+                    errp, -r, "unknown image encryption format: %u",
+                    encrypt->format);
+        }
+    }
+
+    if (r < 0) {
+        return r;
+    }
+
+    r = rbd_encryption_format(image, format, opts, opts_size);
+    if (r < 0) {
+        error_setg_errno(errp, -r, "encryption format fail");
+        return r;
+    }
+
+    r = rbd_stat(image, &info, sizeof(info));
+    if (r < 0) {
+        error_setg_errno(errp, -r, "cannot get effective image size");
+        return r;
+    }
+
+    r = rbd_resize(image, raw_size + (raw_size - info.size));
+    if (r < 0) {
+        error_setg_errno(errp, -r, "cannot resize image after format");
+        return r;
+    }
+
+    return 0;
+}
+
+static int qemu_rbd_encryption_load(rbd_image_t image,
+                                      RbdEncryptionOptions *encrypt,
+                                      Error **errp)
+{
+    int r = 0;
+    g_autofree char *passphrase = NULL;
+    g_autofree rbd_encryption_options_t opts = NULL;
+    rbd_encryption_format_t format;
+    size_t opts_size;
+
+    switch (encrypt->format) {
+        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
+            rbd_encryption_luks1_format_options_t *luks_opts =
+                    g_new0(rbd_encryption_luks1_format_options_t, 1);
+            format = RBD_ENCRYPTION_FORMAT_LUKS1;
+            opts = luks_opts;
+            opts_size = sizeof(rbd_encryption_luks1_format_options_t);
+            r = qemu_rbd_convert_luks_options(
+                    qapi_RbdEncryptionOptionsLUKS_base(&encrypt->u.luks),
+                    &passphrase, errp);
+            luks_opts->passphrase = passphrase;
+            luks_opts->passphrase_size = strlen(passphrase);
+            break;
+        }
+        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
+            rbd_encryption_luks2_format_options_t *luks2_opts =
+                    g_new0(rbd_encryption_luks2_format_options_t, 1);
+            format = RBD_ENCRYPTION_FORMAT_LUKS2;
+            opts = luks2_opts;
+            opts_size = sizeof(rbd_encryption_luks2_format_options_t);
+            r = qemu_rbd_convert_luks_options(
+                    qapi_RbdEncryptionOptionsLUKS2_base(&encrypt->u.luks2),
+                    &passphrase, errp);
+            luks2_opts->passphrase = passphrase;
+            luks2_opts->passphrase_size = strlen(passphrase);
+            break;
+        }
+        default: {
+            r = -ENOTSUP;
+            error_setg_errno(
+                    errp, -r, "unknown image encryption format: %u",
+                    encrypt->format);
+        }
+    }
+
+    if (r < 0) {
+        return r;
+    }
+
+    r = rbd_encryption_load(image, format, opts, opts_size);
+    if (r < 0) {
+        error_setg_errno(errp, -r, "encryption load fail");
+    }
+
+    return r;
+}
+#endif
+
 /* FIXME Deprecate and remove keypairs or make it available in QMP. */
 static int qemu_rbd_do_create(BlockdevCreateOptions *options,
                               const char *keypairs, const char *password_secret,
@@ -358,6 +570,13 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
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
@@ -383,6 +602,27 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
         goto out;
     }
 
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION
+    if (opts->has_encrypt) {
+        rbd_image_t image;
+
+        ret = rbd_open(io_ctx, opts->location->image, &image, NULL);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "error reading header from %s",
+                             opts->location->image);
+            goto out;
+        }
+
+        ret = qemu_rbd_encryption_format(image, opts->encrypt, errp);
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
@@ -395,6 +635,43 @@ static int qemu_rbd_co_create(BlockdevCreateOptions *options, Error **errp)
     return qemu_rbd_do_create(options, NULL, NULL, errp);
 }
 
+static int qemu_rbd_extract_encryption_create_options(
+        QemuOpts *opts,
+        RbdEncryptionCreateOptions **spec,
+        Error **errp)
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
+    visit_type_RbdEncryptionCreateOptions(v, NULL, spec, errp);
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
@@ -403,6 +680,7 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
     BlockdevCreateOptions *create_options;
     BlockdevCreateOptionsRbd *rbd_opts;
     BlockdevOptionsRbd *loc;
+    RbdEncryptionCreateOptions *encrypt = NULL;
     Error *local_err = NULL;
     const char *keypairs, *password_secret;
     QDict *options = NULL;
@@ -431,6 +709,13 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
         goto exit;
     }
 
+    ret = qemu_rbd_extract_encryption_create_options(opts, &encrypt, errp);
+    if (ret < 0) {
+        goto exit;
+    }
+    rbd_opts->encrypt     = encrypt;
+    rbd_opts->has_encrypt = !!encrypt;
+
     /*
      * Caution: while qdict_get_try_str() is fine, getting non-string
      * types would require more care.  When @options come from -blockdev
@@ -756,12 +1041,25 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto failed_open;
     }
 
+    if (opts->has_encrypt) {
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION
+        r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
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
@@ -769,8 +1067,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
     if (s->snap != NULL) {
         r = bdrv_apply_auto_read_only(bs, "rbd snapshots are read-only", errp);
         if (r < 0) {
-            rbd_close(s->image);
-            goto failed_open;
+            goto failed_post_open;
         }
     }
 
@@ -780,6 +1077,8 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
     r = 0;
     goto out;
 
+failed_post_open:
+    rbd_close(s->image);
 failed_open:
     rados_ioctx_destroy(s->io_ctx);
     g_free(s->snap);
@@ -1050,6 +1349,53 @@ static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
     return 0;
 }
 
+static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
+                                                     Error **errp)
+{
+    BDRVRBDState *s = bs->opaque;
+    ImageInfoSpecific *spec_info;
+    rbd_image_info_t info;
+    char buf[RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {0};
+    int r;
+
+    r = rbd_stat(s->image, &info, sizeof(info));
+    if (r < 0) {
+        error_setg_errno(errp, -r, "cannot get image size");
+        return NULL;
+    }
+
+    if (info.size >= RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) {
+        r = rbd_read(s->image, 0,
+                     RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN, buf) ;
+        if (r < 0) {
+            error_setg_errno(errp, -r, "cannot read image start for probe");
+            return NULL;
+        }
+    }
+
+    spec_info = g_new(ImageInfoSpecific, 1);
+    *spec_info = (ImageInfoSpecific){
+        .type  = IMAGE_INFO_SPECIFIC_KIND_RBD,
+        .u.rbd.data = g_new0(ImageInfoSpecificRbd, 1),
+    };
+
+    if (memcmp(buf, rbd_luks_header_verification,
+               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
+        spec_info->u.rbd.data->encryption_format =
+                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS;
+        spec_info->u.rbd.data->has_encryption_format = true;
+    } else if (memcmp(buf, rbd_luks2_header_verification,
+               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
+        spec_info->u.rbd.data->encryption_format =
+                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2;
+        spec_info->u.rbd.data->has_encryption_format = true;
+    } else {
+        spec_info->u.rbd.data->has_encryption_format = false;
+    }
+
+    return spec_info;
+}
+
 static int64_t qemu_rbd_getlength(BlockDriverState *bs)
 {
     BDRVRBDState *s = bs->opaque;
@@ -1243,6 +1589,22 @@ static QemuOptsList qemu_rbd_create_opts = {
             .type = QEMU_OPT_STRING,
             .help = "ID of secret providing the password",
         },
+        {
+            .name = "encrypt.format",
+            .type = QEMU_OPT_STRING,
+            .help = "Encrypt the image, format choices: 'luks', 'luks2'",
+        },
+        {
+            .name = "encrypt.cipher-alg",
+            .type = QEMU_OPT_STRING,
+            .help = "Name of encryption cipher algorithm"
+                    " (allowed values: aes-128, aes-256)",
+        },
+        {
+            .name = "encrypt.key-secret",
+            .type = QEMU_OPT_STRING,
+            .help = "ID of secret providing LUKS passphrase",
+        },
         { /* end of list */ }
     }
 };
@@ -1272,6 +1634,7 @@ static BlockDriver bdrv_rbd = {
     .bdrv_co_create_opts    = qemu_rbd_co_create_opts,
     .bdrv_has_zero_init     = bdrv_has_zero_init_1,
     .bdrv_get_info          = qemu_rbd_getinfo,
+    .bdrv_get_specific_info = qemu_rbd_get_specific_info,
     .create_opts            = &qemu_rbd_create_opts,
     .bdrv_getlength         = qemu_rbd_getlength,
     .bdrv_co_truncate       = qemu_rbd_co_truncate,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6d227924d0..60d2ff0d1a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -127,6 +127,18 @@
       'extents': ['ImageInfo']
   } }
 
+##
+# @ImageInfoSpecificRbd:
+#
+# @encryption-format: Image encryption format
+#
+# Since: 6.1
+##
+{ 'struct': 'ImageInfoSpecificRbd',
+  'data': {
+      '*encryption-format': 'RbdImageEncryptionFormat'
+  } }
+
 ##
 # @ImageInfoSpecific:
 #
@@ -141,7 +153,8 @@
       # If we need to add block driver specific parameters for
       # LUKS in future, then we'll subclass QCryptoBlockInfoLUKS
       # to define a ImageInfoSpecificLUKS
-      'luks': 'QCryptoBlockInfoLUKS'
+      'luks': 'QCryptoBlockInfoLUKS',
+      'rbd': 'ImageInfoSpecificRbd'
   } }
 
 ##
@@ -3609,6 +3622,94 @@
 { 'enum': 'RbdAuthMode',
   'data': [ 'cephx', 'none' ] }
 
+##
+# @RbdImageEncryptionFormat:
+#
+# Since: 6.1
+##
+{ 'enum': 'RbdImageEncryptionFormat',
+  'data': [ 'luks', 'luks2' ] }
+
+##
+# @RbdEncryptionOptionsLUKSBase:
+#
+# @key-secret: ID of a QCryptoSecret object providing a passphrase
+#              for unlocking the encryption
+#
+# Since: 6.1
+##
+{ 'struct': 'RbdEncryptionOptionsLUKSBase',
+  'data': { '*key-secret': 'str' }}
+
+##
+# @RbdEncryptionCreateOptionsLUKSBase:
+#
+# @cipher-alg: The encryption algorithm
+#
+# Since: 6.1
+##
+{ 'struct': 'RbdEncryptionCreateOptionsLUKSBase',
+  'base': 'RbdEncryptionOptionsLUKSBase',
+  'data': { '*cipher-alg': 'QCryptoCipherAlgorithm'}}
+
+##
+# @RbdEncryptionOptionsLUKS:
+#
+# Since: 6.1
+##
+{ 'struct': 'RbdEncryptionOptionsLUKS',
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
+# @RbdEncryptionCreateOptionsLUKS:
+#
+# Since: 6.1
+##
+{ 'struct': 'RbdEncryptionCreateOptionsLUKS',
+  'base': 'RbdEncryptionCreateOptionsLUKSBase',
+  'data': {}}
+
+##
+# @RbdEncryptionCreateOptionsLUKS2:
+#
+# Since: 6.1
+##
+{ 'struct': 'RbdEncryptionCreateOptionsLUKS2',
+  'base': 'RbdEncryptionCreateOptionsLUKSBase',
+  'data': {}}
+
+##
+# @RbdEncryptionOptions:
+#
+# Since: 6.1
+##
+{ 'union': 'RbdEncryptionOptions',
+  'base': { 'format': 'RbdImageEncryptionFormat' },
+  'discriminator': 'format',
+  'data': { 'luks': 'RbdEncryptionOptionsLUKS',
+            'luks2': 'RbdEncryptionOptionsLUKS2'} }
+
+##
+# @RbdEncryptionCreateOptions:
+#
+# Since: 6.1
+##
+{ 'union': 'RbdEncryptionCreateOptions',
+  'base': { 'format': 'RbdImageEncryptionFormat' },
+  'discriminator': 'format',
+  'data': { 'luks': 'RbdEncryptionCreateOptionsLUKS',
+            'luks2': 'RbdEncryptionCreateOptionsLUKS2'} }
+
 ##
 # @BlockdevOptionsRbd:
 #
@@ -3624,6 +3725,8 @@
 #
 # @snapshot: Ceph snapshot name.
 #
+# @encrypt: Image encryption options. (Since 6.1)
+#
 # @user: Ceph id name.
 #
 # @auth-client-required: Acceptable authentication modes.
@@ -3646,6 +3749,7 @@
             'image': 'str',
             '*conf': 'str',
             '*snapshot': 'str',
+            '*encrypt': 'RbdEncryptionOptions',
             '*user': 'str',
             '*auth-client-required': ['RbdAuthMode'],
             '*key-secret': 'str',
@@ -4418,13 +4522,15 @@
 #            point to a snapshot.
 # @size: Size of the virtual disk in bytes
 # @cluster-size: RBD object size
+# @encrypt: Image encryption options. (Since 6.1)
 #
 # Since: 2.12
 ##
 { 'struct': 'BlockdevCreateOptionsRbd',
   'data': { 'location':         'BlockdevOptionsRbd',
             'size':             'size',
-            '*cluster-size' :   'size' } }
+            '*cluster-size' :   'size',
+            '*encrypt' :        'RbdEncryptionCreateOptions'} }
 
 ##
 # @BlockdevVmdkSubformat:
-- 
2.27.0


