Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1456A0FCE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGiF-0007V4-EH; Thu, 23 Feb 2023 13:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhd-00072P-09
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhb-0003G7-67
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u021ZoNvpw0FUMmDOwHQFXjd7nE1mAh/K7or6T7sIbI=;
 b=QNQN+8mzBnhXK9B5YwoGTCa+fzNFjvEyV/Urg2fq4n1oXzaU+hQND8A4cdubhZWoXP8gWP
 wJajNnLUtKqoPStI1O7lfmLqPB9Df2yt04nhuTjymMgd0MiEF4Q31SONZ35kboiYgMUv3z
 mKaWssu9EQCI+iiOz0+1ge1vFTF2f5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-OpJTCKEPPfG5rGuidGWClg-1; Thu, 23 Feb 2023 13:52:18 -0500
X-MC-Unique: OpJTCKEPPfG5rGuidGWClg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B1011816EC1;
 Thu, 23 Feb 2023 18:52:18 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 966621121314;
 Thu, 23 Feb 2023 18:52:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 29/29] block/rbd: Add support for layered encryption
Date: Thu, 23 Feb 2023 19:51:46 +0100
Message-Id: <20230223185146.306454-30-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Or Ozeri <oro@il.ibm.com>

Starting from ceph Reef, RBD has built-in support for layered encryption,
where each ancestor image (in a cloned image setting) can be possibly
encrypted using a unique passphrase.

A new function, rbd_encryption_load2, was added to librbd API.
This new function supports an array of passphrases (via "spec" structs).

This commit extends the qemu rbd driver API to use this new librbd API,
in order to support this new layered encryption feature.

Signed-off-by: Or Ozeri <oro@il.ibm.com>
Message-Id: <20230129113120.722708-4-oro@oro.sl.cloud9.ibm.com>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json |  11 +++-
 block/rbd.c          | 153 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 162 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 5f09b1d31a..c05ad0c07e 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3999,10 +3999,19 @@
 ##
 # @RbdEncryptionOptions:
 #
+# @format: Encryption format.
+#
+# @parent: Parent image encryption options (for cloned images).
+#          Can be left unspecified if this cloned image is encrypted
+#          using the same format and secret as its parent image (i.e.
+#          not explicitly formatted) or if its parent image is not
+#          encrypted. (Since 8.0)
+#
 # Since: 6.1
 ##
 { 'union': 'RbdEncryptionOptions',
-  'base': { 'format': 'RbdImageEncryptionFormat' },
+  'base': { 'format': 'RbdImageEncryptionFormat',
+            '*parent': 'RbdEncryptionOptions' },
   'discriminator': 'format',
   'data': { 'luks': 'RbdEncryptionOptionsLUKS',
             'luks2': 'RbdEncryptionOptionsLUKS2',
diff --git a/block/rbd.c b/block/rbd.c
index 744f84c222..978671411e 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -72,6 +72,16 @@ static const char rbd_luks2_header_verification[
     'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
 };
 
+static const char rbd_layered_luks_header_verification[
+        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
+    'R', 'B', 'D', 'L', 0xBA, 0xBE, 0, 1
+};
+
+static const char rbd_layered_luks2_header_verification[
+        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
+    'R', 'B', 'D', 'L', 0xBA, 0xBE, 0, 2
+};
+
 typedef enum {
     RBD_AIO_READ,
     RBD_AIO_WRITE,
@@ -538,6 +548,128 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
 
     return 0;
 }
+
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
+static int qemu_rbd_encryption_load2(rbd_image_t image,
+                                     RbdEncryptionOptions *encrypt,
+                                     Error **errp)
+{
+    int r = 0;
+    int encrypt_count = 1;
+    int i;
+    RbdEncryptionOptions *curr_encrypt;
+    rbd_encryption_spec_t *specs;
+    rbd_encryption_luks1_format_options_t *luks_opts;
+    rbd_encryption_luks2_format_options_t *luks2_opts;
+    rbd_encryption_luks_format_options_t *luks_any_opts;
+
+    /* count encryption options */
+    for (curr_encrypt = encrypt->parent; curr_encrypt;
+         curr_encrypt = curr_encrypt->parent) {
+        ++encrypt_count;
+    }
+
+    specs = g_new0(rbd_encryption_spec_t, encrypt_count);
+
+    curr_encrypt = encrypt;
+    for (i = 0; i < encrypt_count; ++i) {
+        switch (curr_encrypt->format) {
+            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
+                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS1;
+
+                luks_opts = g_new0(rbd_encryption_luks1_format_options_t, 1);
+                specs[i].opts = luks_opts;
+                specs[i].opts_size = sizeof(*luks_opts);
+
+                r = qemu_rbd_convert_luks_options(
+                        qapi_RbdEncryptionOptionsLUKS_base(
+                                &curr_encrypt->u.luks),
+                        (char **)&luks_opts->passphrase,
+                        &luks_opts->passphrase_size,
+                        errp);
+                break;
+            }
+            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
+                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS2;
+
+                luks2_opts = g_new0(rbd_encryption_luks2_format_options_t, 1);
+                specs[i].opts = luks2_opts;
+                specs[i].opts_size = sizeof(*luks2_opts);
+
+                r = qemu_rbd_convert_luks_options(
+                        qapi_RbdEncryptionOptionsLUKS2_base(
+                                &curr_encrypt->u.luks2),
+                        (char **)&luks2_opts->passphrase,
+                        &luks2_opts->passphrase_size,
+                        errp);
+                break;
+            }
+            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ANY: {
+                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS;
+
+                luks_any_opts = g_new0(rbd_encryption_luks_format_options_t, 1);
+                specs[i].opts = luks_any_opts;
+                specs[i].opts_size = sizeof(*luks_any_opts);
+
+                r = qemu_rbd_convert_luks_options(
+                        qapi_RbdEncryptionOptionsLUKSAny_base(
+                                &curr_encrypt->u.luks_any),
+                        (char **)&luks_any_opts->passphrase,
+                        &luks_any_opts->passphrase_size,
+                        errp);
+                break;
+            }
+            default: {
+                r = -ENOTSUP;
+                error_setg_errno(
+                        errp, -r, "unknown image encryption format: %u",
+                        curr_encrypt->format);
+            }
+        }
+
+        if (r < 0) {
+            goto exit;
+        }
+
+        curr_encrypt = curr_encrypt->parent;
+    }
+
+    r = rbd_encryption_load2(image, specs, encrypt_count);
+    if (r < 0) {
+        error_setg_errno(errp, -r, "layered encryption load fail");
+        goto exit;
+    }
+
+exit:
+    for (i = 0; i < encrypt_count; ++i) {
+        if (!specs[i].opts) {
+            break;
+        }
+
+        switch (specs[i].format) {
+            case RBD_ENCRYPTION_FORMAT_LUKS1: {
+                luks_opts = specs[i].opts;
+                g_free((void *)luks_opts->passphrase);
+                break;
+            }
+            case RBD_ENCRYPTION_FORMAT_LUKS2: {
+                luks2_opts = specs[i].opts;
+                g_free((void *)luks2_opts->passphrase);
+                break;
+            }
+            case RBD_ENCRYPTION_FORMAT_LUKS: {
+                luks_any_opts = specs[i].opts;
+                g_free((void *)luks_any_opts->passphrase);
+                break;
+            }
+        }
+
+        g_free(specs[i].opts);
+    }
+    g_free(specs);
+    return r;
+}
+#endif
 #endif
 
 /* FIXME Deprecate and remove keypairs or make it available in QMP. */
@@ -1004,7 +1136,16 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
 
     if (opts->encrypt) {
 #ifdef LIBRBD_SUPPORTS_ENCRYPTION
-        r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
+        if (opts->encrypt->parent) {
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
+            r = qemu_rbd_encryption_load2(s->image, opts->encrypt, errp);
+#else
+            r = -ENOTSUP;
+            error_setg(errp, "RBD library does not support layered encryption");
+#endif
+        } else {
+            r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
+        }
         if (r < 0) {
             goto failed_post_open;
         }
@@ -1296,6 +1437,16 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
         spec_info->u.rbd.data->encryption_format =
                 RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2;
         spec_info->u.rbd.data->has_encryption_format = true;
+    } else if (memcmp(buf, rbd_layered_luks_header_verification,
+               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
+        spec_info->u.rbd.data->encryption_format =
+                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS;
+        spec_info->u.rbd.data->has_encryption_format = true;
+    } else if (memcmp(buf, rbd_layered_luks2_header_verification,
+               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
+        spec_info->u.rbd.data->encryption_format =
+                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2;
+        spec_info->u.rbd.data->has_encryption_format = true;
     } else {
         spec_info->u.rbd.data->has_encryption_format = false;
     }
-- 
2.39.2


