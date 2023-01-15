Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D595066B108
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 13:41:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH2J6-0003AC-86; Sun, 15 Jan 2023 07:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1pH2Iq-00032l-1p; Sun, 15 Jan 2023 07:40:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1pH2Ik-0006o0-OB; Sun, 15 Jan 2023 07:39:57 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30F8scjn010797; Sun, 15 Jan 2023 12:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=30dD+v21qgSVlbv964vuqn6KndWUruJa38MNfUQKp3s=;
 b=OzRH16yFLlXf9Poq87+UM7Gz49SX824cinEupXWuWB+owdypofYgCfdC0q3QSeTkL4eU
 TzArInXsjVAHzcdwYEKCIdMSIQEfO5duB4VXbj3thCs1Oeu2AuUQRRa20yrO6z3lD403
 5Gr/x5WbaZTGIFPUk0MhVZn78qHFAtHFuNSXTWgkq6UiLSHWJH7JFwXYftbIqRiLVyFq
 HBvQBPEc2xzwVuvUHS8f4CJE01J8urT7vWW8sQkFmFu9UOdVmYIhzJkwsu30fywqtyVM
 bil/j89bm/sRF5+xgZPSEgwxt7tCWWXNLbNi/BbhkICrTfRpQTArR6yC6gaFPL7GvUPq hA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4ed22mgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Jan 2023 12:39:51 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30F9sSC0018758;
 Sun, 15 Jan 2023 12:39:50 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3n3m16rjs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Jan 2023 12:39:50 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30FCdm3N3080882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Jan 2023 12:39:48 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41F5358055;
 Sun, 15 Jan 2023 12:39:48 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA88758043;
 Sun, 15 Jan 2023 12:39:47 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 15 Jan 2023 12:39:47 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com
Subject: [PATCH v5 3/3] block/rbd: Add support for layered encryption
Date: Sun, 15 Jan 2023 06:39:32 -0600
Message-Id: <20230115123932.2564966-4-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230115123932.2564966-1-oro@il.ibm.com>
References: <20230115123932.2564966-1-oro@il.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0HP0Rt134qnH7cS4__quTmZ8uhqgKy1L
X-Proofpoint-ORIG-GUID: 0HP0Rt134qnH7cS4__quTmZ8uhqgKy1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-15_07,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 mlxlogscore=870 impostorscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301150096
Received-SPF: pass client-ip=148.163.158.5; envelope-from=oro@il.ibm.com;
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
 block/rbd.c          | 154 ++++++++++++++++++++++++++++++++++++++++++-
 qapi/block-core.json |  11 +++-
 2 files changed, 163 insertions(+), 2 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index b929378871..c8418a8057 100644
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
@@ -537,6 +547,129 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
 
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
+    for (curr_encrypt = encrypt; curr_encrypt->parent;
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
@@ -1003,7 +1136,16 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
 
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
@@ -1294,6 +1436,16 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
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
diff --git a/qapi/block-core.json b/qapi/block-core.json
index e59fb5d453..49df47c3c6 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3908,10 +3908,19 @@
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


