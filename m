Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D144C631352
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 11:30:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owhZQ-0004zR-Ip; Sun, 20 Nov 2022 05:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1owhZJ-0004yS-Ei; Sun, 20 Nov 2022 05:28:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1owhZE-0000DJ-Ru; Sun, 20 Nov 2022 05:28:56 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AK6G1KM021664; Sun, 20 Nov 2022 10:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rIwTMarVdNWEhjbQgo+tJ7FLvmFGR23eEgSfB70NKgI=;
 b=TZnVAYbnDgLVPlg7hvgbmjzooJ6zcCSEEbhR2uOdWJ5UkRovDj70ghe21lLQaeQH1WSF
 weSsjdCVDTWGGkq2Oj/dj+k2fEy0eurENvS3rHxmvm8uU+MCELC74uw7AHQk1jGcRrs6
 LK1VPYYpcLh97TPsSsnQdtTT+fmc8jahpUBMzaAV5qNw8r9EO8DeSy+WPEZepM0cAuvx
 kObwzP5eMFKXt7kGM5IM5VM8QcSqxMAOOKF9Kh59CTJns4LRrkswZlvF2MWHwes2gb49
 3Vh1P+ngXNjsIy2He1Ly6W2aJlQQ1wxCyXwWY1yEWahUlr9naA+MF+ExwDQsKU69Ofrv ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky906fyjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:50 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AKASnST028752;
 Sun, 20 Nov 2022 10:28:49 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky906fyjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:49 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AKAKasp025217;
 Sun, 20 Nov 2022 10:28:49 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3kxps9f33n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:49 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AKASjEc31654492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Nov 2022 10:28:45 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 949B35805D;
 Sun, 20 Nov 2022 10:28:46 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8F6058059;
 Sun, 20 Nov 2022 10:28:45 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 20 Nov 2022 10:28:45 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com, dannyh@il.ibm.com,
 idryomov@gmail.com
Subject: [PATCH v4 3/3] block/rbd: Add support for layered encryption
Date: Sun, 20 Nov 2022 04:28:36 -0600
Message-Id: <20221120102836.3174090-4-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221120102836.3174090-1-oro@il.ibm.com>
References: <20221120102836.3174090-1-oro@il.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WwA0KmPbqq7LdMsYHx1rb1V-we-vxuQL
X-Proofpoint-ORIG-GUID: _frheCABbs10elnapd0jQmRwlbB8Ul8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_07,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxlogscore=971 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211200086
Received-SPF: pass client-ip=148.163.158.5; envelope-from=oro@il.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
 block/rbd.c          | 161 ++++++++++++++++++++++++++++++++++++++++++-
 qapi/block-core.json |  17 ++++-
 2 files changed, 175 insertions(+), 3 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 7feae45e82..157922e23a 100644
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
@@ -537,6 +547,136 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
 
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
+    rbd_encryption_luks1_format_options_t* luks_opts;
+    rbd_encryption_luks2_format_options_t* luks2_opts;
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
+        switch (curr_encrypt->format) {
+            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
+                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS1;
+                specs[i].opts_size =
+                        sizeof(rbd_encryption_luks1_format_options_t);
+
+                luks_opts = g_new0(rbd_encryption_luks1_format_options_t, 1);
+                specs[i].opts = luks_opts;
+
+                r = qemu_rbd_convert_luks_options(
+                        qapi_RbdEncryptionOptionsLUKS_base(
+                                &curr_encrypt->u.luks),
+                        &luks_opts->passphrase,
+                        &luks_opts->passphrase_size,
+                        errp);
+                break;
+            }
+
+            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
+                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS2;
+                specs[i].opts_size =
+                        sizeof(rbd_encryption_luks2_format_options_t);
+
+                luks2_opts = g_new0(rbd_encryption_luks2_format_options_t, 1);
+                specs[i].opts = luks2_opts;
+
+                r = qemu_rbd_convert_luks_options(
+                        qapi_RbdEncryptionOptionsLUKS2_base(
+                                &curr_encrypt->u.luks2),
+                        &luks2_opts->passphrase,
+                        &luks2_opts->passphrase_size,
+                        errp);
+                break;
+            }
+
+            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ANY: {
+                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS;
+                specs[i].opts_size =
+                        sizeof(rbd_encryption_luks_format_options_t);
+
+                luks_any_opts = g_new0(rbd_encryption_luks_format_options_t, 1);
+                specs[i].opts = luks_any_opts;
+
+                r = qemu_rbd_convert_luks_options(
+                        qapi_RbdEncryptionOptionsLUKSAny_base(
+                                &curr_encrypt->u.luks_any),
+                        &luks_any_opts->passphrase,
+                        &luks_any_opts->passphrase_size,
+                        errp);
+                break;
+            }
+
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
+                g_free((void*)luks_opts->passphrase);
+                break;
+            }
+
+            case RBD_ENCRYPTION_FORMAT_LUKS2: {
+                luks2_opts = specs[i].opts;
+                g_free((void*)luks2_opts->passphrase);
+                break;
+            }
+
+            case RBD_ENCRYPTION_FORMAT_LUKS: {
+                luks_any_opts = specs[i].opts;
+                g_free((void*)luks_any_opts->passphrase);
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
@@ -1008,7 +1148,16 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
 
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
@@ -1299,6 +1448,16 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
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
index d064847d85..68f8c7c203 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3759,10 +3759,14 @@
 #
 # luks-any: Used for opening either luks or luks2. (Since 8.0)
 #
+# luks-layered: Layered encryption. Only used for info. (Since 8.0)
+#
+# luks2-layered: Layered encryption. Only used for info. (Since 8.0)
+#
 # Since: 6.1
 ##
 { 'enum': 'RbdImageEncryptionFormat',
-  'data': [ 'luks', 'luks2', 'luks-any' ] }
+  'data': [ 'luks', 'luks2', 'luks-any', 'luks-layered', 'luks2-layered' ] }
 
 ##
 # @RbdEncryptionOptionsLUKSBase:
@@ -3834,10 +3838,19 @@
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
-- 
2.25.1


