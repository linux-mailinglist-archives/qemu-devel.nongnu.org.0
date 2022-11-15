Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32496298F1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:33:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouv0d-0006tH-6G; Tue, 15 Nov 2022 07:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1ouv0Z-0006rB-PM; Tue, 15 Nov 2022 07:25:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1ouv0X-00073t-KQ; Tue, 15 Nov 2022 07:25:43 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFCBv4U020671; Tue, 15 Nov 2022 12:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8kQB9n4zTyQT9PkndWpkg4Ddnesz5bI1vScDXViOKcg=;
 b=qAcxYTNfuWv9fspC38LFlw6Wz1UiMz5GRfWO69W3tx0GcdLncOe8e/EyMAYrkaQICjXq
 1fVW7FS4JoJJPwWT5wRzUmMS2S8BBYpOaOStYHoDVPUJiN1ouPKRiIQ3SowQxA76g8Hc
 s6Q4sxnGDdlQN8ml6usQ6+ON9ChmRLo9eLxncxUc42m2vUC+NZ52/31nnu00P1HCg8a7
 fW2OTM0Nz1Aloq3qOGubQSO0uZJj+DvHaEYdnIo73J2JTbmBxzpc8Le03+NJp9uyRnqA
 LYGATrhm0YOV29ncrLP55OrNflBBnwatzzGukBqqTkrIMbzU7vwNzyx6CkCTWsJ7qOjt Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvajd09ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 12:25:37 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AFCDcEe025555;
 Tue, 15 Nov 2022 12:25:36 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvajd09ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 12:25:36 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AFCKMnQ032586;
 Tue, 15 Nov 2022 12:25:35 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3kt349m5w7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 12:25:35 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AFCPX3H5243396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Nov 2022 12:25:33 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3062958058;
 Tue, 15 Nov 2022 12:25:33 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AC755805C;
 Tue, 15 Nov 2022 12:25:32 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 15 Nov 2022 12:25:32 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com, dannyh@il.ibm.com,
 idryomov@gmail.com
Subject: [PATCH v3] block/rbd: Add support for layered encryption
Date: Tue, 15 Nov 2022 06:25:27 -0600
Message-Id: <20221115122527.2896476-1-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aQ4X67Cl81-N9KFWI8O6avruRwH7WaBC
X-Proofpoint-ORIG-GUID: JevV5-Nt7ZiEq0V6WqIPTtcxm4S_9mKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_06,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=905 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211150083
Received-SPF: pass client-ip=148.163.156.1; envelope-from=oro@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Starting from ceph Reef, RBD has built-in support for layered encryption,
where each ancestor image (in a cloned image setting) can be possibly
encrypted using a unique passphrase.

A new function, rbd_encryption_load2, was added to librbd API.
This new function supports an array of passphrases (via "spec" structs).

This commit extends the qemu rbd driver API to use this new librbd API,
in order to support this new layered encryption feature.

Signed-off-by: Or Ozeri <oro@il.ibm.com>
---
v3: further nit fixes suggested by @idryomov
v2: nit fixes suggested by @idryomov
---
 block/rbd.c          | 119 ++++++++++++++++++++++++++++++++++++++++++-
 qapi/block-core.json |  35 +++++++++++--
 2 files changed, 150 insertions(+), 4 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index f826410f40..ce017c29b5 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -71,6 +71,16 @@ static const char rbd_luks2_header_verification[
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
@@ -470,6 +480,9 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
     size_t passphrase_len;
     rbd_encryption_luks1_format_options_t luks_opts;
     rbd_encryption_luks2_format_options_t luks2_opts;
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
+    rbd_encryption_luks_format_options_t luks_any_opts;
+#endif
     rbd_encryption_format_t format;
     rbd_encryption_options_t opts;
     size_t opts_size;
@@ -505,6 +518,23 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
             luks2_opts.passphrase_size = passphrase_len;
             break;
         }
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
+        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ANY: {
+            memset(&luks_any_opts, 0, sizeof(luks_any_opts));
+            format = RBD_ENCRYPTION_FORMAT_LUKS;
+            opts = &luks_any_opts;
+            opts_size = sizeof(luks_any_opts);
+            r = qemu_rbd_convert_luks_options(
+                    qapi_RbdEncryptionOptionsLUKSAny_base(&encrypt->u.luks_any),
+                    &passphrase, &passphrase_len, errp);
+            if (r < 0) {
+                return r;
+            }
+            luks_any_opts.passphrase = passphrase;
+            luks_any_opts.passphrase_size = passphrase_len;
+            break;
+        }
+#endif
         default: {
             r = -ENOTSUP;
             error_setg_errno(
@@ -522,6 +552,74 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
 
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
+    rbd_encryption_luks_format_options_t* luks_any_opts;
+
+    /* count encryption options */
+    for (curr_encrypt = encrypt; curr_encrypt->has_parent;
+         curr_encrypt = curr_encrypt->parent) {
+        ++encrypt_count;
+    }
+
+    specs = g_new0(rbd_encryption_spec_t, encrypt_count);
+
+    curr_encrypt = encrypt;
+    for (i = 0; i < encrypt_count; ++i) {
+        if (curr_encrypt->format != RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ANY) {
+            r = -ENOTSUP;
+            error_setg_errno(
+                    errp, -r, "unknown image encryption format: %u",
+                    curr_encrypt->format);
+            goto exit;
+        }
+
+        specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS;
+        specs[i].opts_size = sizeof(rbd_encryption_luks_format_options_t);
+
+        luks_any_opts = g_new0(rbd_encryption_luks_format_options_t, 1);
+        specs[i].opts = luks_any_opts;
+
+        r = qemu_rbd_convert_luks_options(
+                qapi_RbdEncryptionOptionsLUKSAny_base(
+                        &curr_encrypt->u.luks_any),
+                (char**)&luks_any_opts->passphrase,
+                &luks_any_opts->passphrase_size,
+                errp);
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
+        luks_any_opts = specs[i].opts;
+        if (luks_any_opts) {
+            g_free((char*)luks_any_opts->passphrase);
+            g_free(luks_any_opts);
+        }
+    }
+    g_free(specs);
+    return r;
+}
+#endif
 #endif
 
 /* FIXME Deprecate and remove keypairs or make it available in QMP. */
@@ -993,7 +1091,16 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
 
     if (opts->has_encrypt) {
 #ifdef LIBRBD_SUPPORTS_ENCRYPTION
-        r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
+        if (opts->encrypt->has_parent) {
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
@@ -1284,6 +1391,16 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
         spec_info->u.rbd.data->encryption_format =
                 RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2;
         spec_info->u.rbd.data->has_encryption_format = true;
+    } else if (memcmp(buf, rbd_layered_luks_header_verification,
+               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
+        spec_info->u.rbd.data->encryption_format =
+                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_LAYERED;
+        spec_info->u.rbd.data->has_encryption_format = true;
+    } else if (memcmp(buf, rbd_layered_luks2_header_verification,
+               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
+        spec_info->u.rbd.data->encryption_format =
+                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2_LAYERED;
+        spec_info->u.rbd.data->has_encryption_format = true;
     } else {
         spec_info->u.rbd.data->has_encryption_format = false;
     }
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 882b266532..15715d990e 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3753,10 +3753,20 @@
 ##
 # @RbdImageEncryptionFormat:
 #
+# luks
+#
+# luks2
+#
+# luks-any: Used for opening either luks or luks2. (Since 7.2)
+#
+# luks-layered: Layered encryption. Only used for info. (Since 7.2)
+#
+# luks2-layered: Layered encryption. Only used for info. (Since 7.2)
+#
 # Since: 6.1
 ##
 { 'enum': 'RbdImageEncryptionFormat',
-  'data': [ 'luks', 'luks2' ] }
+  'data': [ 'luks', 'luks2', 'luks-any', 'luks-layered', 'luks2-layered' ] }
 
 ##
 # @RbdEncryptionOptionsLUKSBase:
@@ -3798,6 +3808,15 @@
   'base': 'RbdEncryptionOptionsLUKSBase',
   'data': { } }
 
+##
+# @RbdEncryptionOptionsLUKSAny:
+#
+# Since: 7.2
+##
+{ 'struct': 'RbdEncryptionOptionsLUKSAny',
+  'base': 'RbdEncryptionOptionsLUKSBase',
+  'data': { } }
+
 ##
 # @RbdEncryptionCreateOptionsLUKS:
 #
@@ -3819,13 +3838,23 @@
 ##
 # @RbdEncryptionOptions:
 #
+# @format: Encryption format.
+#
+# @parent: Parent image encryption options (for cloned images).
+#          Can be left unspecified if this cloned image is encrypted
+#          using the same format and secret as its parent image (i.e.
+#          not explicitly formatted) or if its parent image is not
+#          encrypted. (Since 7.2)
+#
 # Since: 6.1
 ##
 { 'union': 'RbdEncryptionOptions',
-  'base': { 'format': 'RbdImageEncryptionFormat' },
+  'base': { 'format': 'RbdImageEncryptionFormat',
+            '*parent': 'RbdEncryptionOptions' },
   'discriminator': 'format',
   'data': { 'luks': 'RbdEncryptionOptionsLUKS',
-            'luks2': 'RbdEncryptionOptionsLUKS2' } }
+            'luks2': 'RbdEncryptionOptionsLUKS2',
+            'luks-any': 'RbdEncryptionOptionsLUKSAny'} }
 
 ##
 # @RbdEncryptionCreateOptions:
-- 
2.25.1


