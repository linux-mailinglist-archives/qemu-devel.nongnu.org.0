Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B5680CB5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:00:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSp9-0000DL-6Y; Mon, 30 Jan 2023 06:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@oro.sl.cloud9.ibm.com>)
 id 1pMSp1-0000Aq-Hf; Mon, 30 Jan 2023 06:59:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@oro.sl.cloud9.ibm.com>)
 id 1pMSow-0005rI-UY; Mon, 30 Jan 2023 06:59:38 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30T65iC8004445; Sun, 29 Jan 2023 11:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6J9bggOKF9Me2mK+ukw+kVsHsDNTMDYaLWaXDVU3JBE=;
 b=TleMQsGiRjseZv31EfUO9D5CmcZqw/cdOQ9ztjk/ZzYkt5o4w/JX1w42MMgvd2Y5nApJ
 K7YuA0MtOk+H3Ytf17s4HG4p/fsZFGvMPLB0OPmlGNVg28czlJVap/d568k2P3dczYWB
 mhDWO+TN90lpywZW/ZolqFdU6i/bBk+am6Bey8MsOarpoXE+z5e/+qUEOr7CBoHMNHpB
 mMaqHcvlOpzXw3Uhw0j1Zz5Qiahd0LPO3syIVYYorlMJW4YJ1fN/yO5jXxORtwjliW53
 IsLCWUDL5z+bewg1UC5c/keJ4DDJYTUQi06SHDZpPndKWav7S0+UB2QHW/+io54lczRg 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddfc0bg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:31 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30TBFSQm002560;
 Sun, 29 Jan 2023 11:31:31 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddfc0bfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:31 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30T91sfK007772;
 Sun, 29 Jan 2023 11:31:30 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3ncvtedsev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:30 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30TBVT6I10093218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 29 Jan 2023 11:31:29 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08CBD58059;
 Sun, 29 Jan 2023 11:31:29 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B686158058;
 Sun, 29 Jan 2023 11:31:27 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 29 Jan 2023 11:31:27 +0000 (GMT)
From: "ORO@il.ibm.com" <oro@oro.sl.cloud9.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com, idryomov@gmail.com
Subject: [PATCH v6 3/3] block/rbd: Add support for layered encryption
Date: Sun, 29 Jan 2023 05:31:20 -0600
Message-Id: <20230129113120.722708-4-oro@oro.sl.cloud9.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
References: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kjYJR7z4-FnsAQOyYZ4_RQPmByFQHNc5
X-Proofpoint-GUID: vDjLNlAbXEUiedLZstpT_PFYP2WI5Yh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-29_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=966 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301290112
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=oro@oro.sl.cloud9.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
---
 block/rbd.c          | 153 ++++++++++++++++++++++++++++++++++++++++++-
 qapi/block-core.json |  11 +++-
 2 files changed, 162 insertions(+), 2 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index b929378871..3a8060b88b 100644
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
@@ -537,6 +547,128 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
 
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
@@ -1003,7 +1135,16 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
 
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
@@ -1294,6 +1435,16 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
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


