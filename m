Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7177860DD90
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 10:53:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onc66-0001Dl-Sa; Wed, 26 Oct 2022 04:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1onc5t-0008Ul-H8; Wed, 26 Oct 2022 04:49:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1onc5o-0007eE-Hv; Wed, 26 Oct 2022 04:49:01 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q87tmZ028635;
 Wed, 26 Oct 2022 08:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=5BbyNYUbiqLqCpzUAVM00QoNv0439ZOCKxnSALLEtVU=;
 b=tey7oG1yhbweQnNbd7hjI6RikGe57lfmqe1NrCLWSPjIJc9syhv2K0Fl/ZDrfuGKK+4P
 XsS7ikxH81s9ors6OoYwsnb6dVO5DnJPch4WJZBiMraG0Qz41yEdP0mm+H6w2hjJbot4
 UkkGu0rIU/xYlUFExXA52v2ZseAu3pUZf3J8taERr7zw3pxoo4SUpsLVa9CQz6XpSGi0
 EqdyXd1a/0CD+yli2zooFxIV+ToP92Hh6af9Xl4yv9BTGdgjC7gsguiTTYR+EmXp2p9Y
 ny9XBZjGAj16aYnWETtK8Ke3VTodammqySN95YD0ICnxGMwRcuRdCgyWAQ+TJLs8fdae Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kf0qhss4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 08:48:52 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29Q88Yom030925;
 Wed, 26 Oct 2022 08:48:52 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kf0qhss4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 08:48:52 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29Q8ZSEq027582;
 Wed, 26 Oct 2022 08:48:51 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 3kdytw7y0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 08:48:51 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29Q8mnKE21496182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 08:48:50 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9332558043;
 Wed, 26 Oct 2022 08:48:49 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEA9158061;
 Wed, 26 Oct 2022 08:48:48 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 26 Oct 2022 08:48:48 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com, dannyh@il.ibm.com,
 idryomov@gmail.com
Subject: [PATCH v1] block/rbd: Add support for layered encryption
Date: Wed, 26 Oct 2022 03:48:36 -0500
Message-Id: <20221026084836.1819572-1-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: asrKOqdkSXI1TTmoZVpNocxOGak6luvD
X-Proofpoint-GUID: 9VzGImK6asOjzvJfp3YhCy0q0QODbHi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_04,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=906
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260047
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Starting from ceph Reef, RBD has built-in support for layered encryption,
where each ancestor image (in a cloned image setting) can be possibly
encrypted using a unique passphrase.

A new function, rbd_encryption_load2, was added to librbd API.
This new function supports an array of passphrases (via "spec" structs).

This commit extends the qemu rbd driver API to use this new librbd API,
in order to support this new layered encryption feature.

Signed-off-by: Or Ozeri <oro@il.ibm.com>
---
 block/rbd.c          | 134 ++++++++++++++++++++++++++++++++++++++++++-
 qapi/block-core.json |  33 ++++++++++-
 2 files changed, 163 insertions(+), 4 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index f826410f40..09953687c9 100644
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
+    rbd_encryption_luks_format_options_t luks_all_opts;
+#endif
     rbd_encryption_format_t format;
     rbd_encryption_options_t opts;
     size_t opts_size;
@@ -505,6 +518,23 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
             luks2_opts.passphrase_size = passphrase_len;
             break;
         }
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
+        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ALL: {
+            memset(&luks_all_opts, 0, sizeof(luks_all_opts));
+            format = RBD_ENCRYPTION_FORMAT_LUKS;
+            opts = &luks_all_opts;
+            opts_size = sizeof(luks_all_opts);
+            r = qemu_rbd_convert_luks_options(
+                    qapi_RbdEncryptionOptionsLUKSAll_base(&encrypt->u.luks_all),
+                    &passphrase, &passphrase_len, errp);
+            if (r < 0) {
+                return r;
+            }
+            luks_all_opts.passphrase = passphrase;
+            luks_all_opts.passphrase_size = passphrase_len;
+            break;
+        }
+#endif
         default: {
             r = -ENOTSUP;
             error_setg_errno(
@@ -522,6 +552,87 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
 
     return 0;
 }
+
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
+static int qemu_rbd_encryption_load2(rbd_image_t image,
+                                     RbdEncryptionOptions *encrypt,
+                                     Error **errp)
+{
+    int r = 0;
+    int encryption_options_count = 1;
+    int spec_count = 0;
+    int passphrase_count = 0;
+    int i;
+    RbdEncryptionOptions *curr_encrypt;
+    rbd_encryption_spec_t *specs;
+    rbd_encryption_spec_t *curr_spec;
+    rbd_encryption_luks_format_options_t* luks_all_opts;
+    char **passphrases;
+    char **curr_passphrase;
+
+    /* count encryption options */
+    for (curr_encrypt = encrypt; curr_encrypt->has_parent;
+         curr_encrypt = curr_encrypt->parent, ++encryption_options_count) {
+    }
+
+    specs = g_new0(rbd_encryption_spec_t, encryption_options_count);
+    passphrases = g_new0(char*, encryption_options_count);
+
+    curr_encrypt = encrypt;
+    for (i = 0; i < encryption_options_count; ++i) {
+        if (curr_encrypt->format != RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ALL) {
+            r = -ENOTSUP;
+            error_setg_errno(
+                    errp, -r, "unknown image encryption format: %u",
+                    curr_encrypt->format);
+            goto exit;
+        }
+
+        curr_spec = &specs[i];
+        curr_passphrase = &passphrases[i];
+        curr_spec->format = RBD_ENCRYPTION_FORMAT_LUKS;
+        curr_spec->opts_size = sizeof(rbd_encryption_luks_format_options_t);
+
+        luks_all_opts = g_new0(rbd_encryption_luks_format_options_t, 1);
+        curr_spec->opts = luks_all_opts;
+        ++spec_count;
+        memset(luks_all_opts, 0, sizeof(rbd_encryption_luks_format_options_t));
+
+        r = qemu_rbd_convert_luks_options(
+                qapi_RbdEncryptionOptionsLUKSAll_base(
+                        &curr_encrypt->u.luks_all),
+                curr_passphrase, &luks_all_opts->passphrase_size,
+                errp);
+        if (r < 0) {
+            goto exit;
+        }
+
+        ++passphrase_count;
+        luks_all_opts->passphrase = *curr_passphrase;
+
+        curr_encrypt = curr_encrypt->parent;
+    }
+
+    r = rbd_encryption_load2(image, specs, spec_count);
+    if (r < 0) {
+        error_setg_errno(errp, -r, "encryption load (2) fail");
+        goto exit;
+    }
+
+exit:
+    for (i = 0; i < spec_count; ++i) {
+        luks_all_opts = (rbd_encryption_luks_format_options_t*)(specs[i].opts);
+        if (passphrase_count > 0) {
+            g_free(passphrases[i]);
+            --passphrase_count;
+        }
+        g_free(luks_all_opts);
+    }
+    g_free(passphrases);
+    g_free(specs);
+    return r;
+}
+#endif
 #endif
 
 /* FIXME Deprecate and remove keypairs or make it available in QMP. */
@@ -993,7 +1104,18 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
 
     if (opts->has_encrypt) {
 #ifdef LIBRBD_SUPPORTS_ENCRYPTION
-        r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
+        if (opts->encrypt->has_parent) {
+#ifndef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
+            r = -ENOTSUP;
+            error_setg(errp, "RBD library does not support"
+                             " specifying parent encryption");
+            goto failed_post_open;
+#else
+            r = qemu_rbd_encryption_load2(s->image, opts->encrypt, errp);
+#endif
+        } else {
+            r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
+        }
         if (r < 0) {
             goto failed_post_open;
         }
@@ -1284,6 +1406,16 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
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
index 882b266532..81ac58cd8a 100644
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
+# luks-all: Used for opening either luks or luks2. (Since 7.2)
+#
+# luks-layered: Layered encryption. Only used for info. (Since 7.2)
+#
+# luks2-layered: Layered encryption. Only used for info. (Since 7.2)
+#
 # Since: 6.1
 ##
 { 'enum': 'RbdImageEncryptionFormat',
-  'data': [ 'luks', 'luks2' ] }
+  'data': [ 'luks', 'luks2', 'luks-all', 'luks-layered', 'luks2-layered' ] }
 
 ##
 # @RbdEncryptionOptionsLUKSBase:
@@ -3798,6 +3808,15 @@
   'base': 'RbdEncryptionOptionsLUKSBase',
   'data': { } }
 
+##
+# @RbdEncryptionOptionsLUKSAll:
+#
+# Since: 7.2
+##
+{ 'struct': 'RbdEncryptionOptionsLUKSAll',
+  'base': 'RbdEncryptionOptionsLUKSBase',
+  'data': { } }
+
 ##
 # @RbdEncryptionCreateOptionsLUKS:
 #
@@ -3819,13 +3838,21 @@
 ##
 # @RbdEncryptionOptions:
 #
+# @format: Encryption format.
+#
+# @parent: Parent image encryption options (for cloned images).
+#          Can be left unspecified if all ancestor images are encrypted
+#          the same way as the child image.  (Since 7.2)
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
+            'luks-all': 'RbdEncryptionOptionsLUKSAll'} }
 
 ##
 # @RbdEncryptionCreateOptions:
-- 
2.25.1


