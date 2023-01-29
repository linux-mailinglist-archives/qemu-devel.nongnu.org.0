Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F886680C36
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:46:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSc6-0004C8-Gp; Mon, 30 Jan 2023 06:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@oro.sl.cloud9.ibm.com>)
 id 1pMSc3-0004B5-7s; Mon, 30 Jan 2023 06:46:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@oro.sl.cloud9.ibm.com>)
 id 1pMSc1-0003uQ-BS; Mon, 30 Jan 2023 06:46:14 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30T6UewM015335; Sun, 29 Jan 2023 11:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OBhC2BOfetovxWku1AKM7XCRkFl7SO4JlQc1bDxf7+k=;
 b=ZK/zSU5aT1ki73tWYftvuz10/mUSJRNqO8+PSP9ypI/sprHov60EFUabRnnj7QQT6KEw
 6CEbnXsFVJeHhWjmZJFrTYY6UQ2l8HhWBDaN1IGYmBOSR864Bu/3C/ii063P+oZQXU7U
 GyKhBmTmYyY8VEueN98mB1xSYK0Ihuh571nJEskeVVBHw8nEjujtMM7l+O979BnZdypc
 9zXLaNFqLzFbQ4nBmDxq5l8iGH2RiWC7QCFAeGhIiIcJJSl+44qbKl6muZsXEsgy4kDf
 cP0t6zsLYrEhdLNZ/WlN9s4r6HSPIdHL3dsoEVHSXk5jbYiSB3FTZUnRIirTvC5mr8Xc NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddhp87k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:30 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30TBQao7031059;
 Sun, 29 Jan 2023 11:31:29 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddhp87jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:29 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30TAna9L006475;
 Sun, 29 Jan 2023 11:31:28 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ncvtky78e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:28 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30TBVRlB59507086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 29 Jan 2023 11:31:27 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79EE858058;
 Sun, 29 Jan 2023 11:31:27 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53CE958059;
 Sun, 29 Jan 2023 11:31:26 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 29 Jan 2023 11:31:26 +0000 (GMT)
From: "ORO@il.ibm.com" <oro@oro.sl.cloud9.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com, idryomov@gmail.com
Subject: [PATCH v6 2/3] block/rbd: Add luks-any encryption opening option
Date: Sun, 29 Jan 2023 05:31:19 -0600
Message-Id: <20230129113120.722708-3-oro@oro.sl.cloud9.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
References: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: D-hkf7jfn1lKQS9KoCkiynfF2FPBi-lI
X-Proofpoint-GUID: PxiNAWdSyzyPq5SYnXdO_T8rH2ppk3J3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-29_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=920 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1034
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301290112
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

Ceph RBD encryption API required specifying the encryption format
for loading encryption. The supported formats were LUKS (v1) and LUKS2.

Starting from Reef release, RBD also supports loading with "luks-any" format,
which works for both versions of LUKS.

This commit extends the qemu rbd driver API to enable qemu users to use
this luks-any wildcard format.

Signed-off-by: Or Ozeri <oro@il.ibm.com>
---
 block/rbd.c          | 19 +++++++++++++++++++
 qapi/block-core.json | 20 ++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index cfec0f2862..b929378871 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -468,6 +468,9 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
     g_autofree char *passphrase = NULL;
     rbd_encryption_luks1_format_options_t luks_opts;
     rbd_encryption_luks2_format_options_t luks2_opts;
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
+    rbd_encryption_luks_format_options_t luks_any_opts;
+#endif
     rbd_encryption_format_t format;
     rbd_encryption_options_t opts;
     size_t opts_size;
@@ -501,6 +504,22 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
             luks2_opts.passphrase = passphrase;
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
+                    &passphrase, &luks_any_opts.passphrase_size, errp);
+            if (r < 0) {
+                return r;
+            }
+            luks_any_opts.passphrase = passphrase;
+            break;
+        }
+#endif
         default: {
             r = -ENOTSUP;
             error_setg_errno(
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 95ac4fa634..e59fb5d453 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3827,10 +3827,16 @@
 ##
 # @RbdImageEncryptionFormat:
 #
+# luks
+#
+# luks2
+#
+# luks-any: Used for opening either luks or luks2. (Since 8.0)
+#
 # Since: 6.1
 ##
 { 'enum': 'RbdImageEncryptionFormat',
-  'data': [ 'luks', 'luks2' ] }
+  'data': [ 'luks', 'luks2', 'luks-any' ] }
 
 ##
 # @RbdEncryptionOptionsLUKSBase:
@@ -3872,6 +3878,15 @@
   'base': 'RbdEncryptionOptionsLUKSBase',
   'data': { } }
 
+##
+# @RbdEncryptionOptionsLUKSAny:
+#
+# Since: 8.0
+##
+{ 'struct': 'RbdEncryptionOptionsLUKSAny',
+  'base': 'RbdEncryptionOptionsLUKSBase',
+  'data': { } }
+
 ##
 # @RbdEncryptionCreateOptionsLUKS:
 #
@@ -3899,7 +3914,8 @@
   'base': { 'format': 'RbdImageEncryptionFormat' },
   'discriminator': 'format',
   'data': { 'luks': 'RbdEncryptionOptionsLUKS',
-            'luks2': 'RbdEncryptionOptionsLUKS2' } }
+            'luks2': 'RbdEncryptionOptionsLUKS2',
+            'luks-any': 'RbdEncryptionOptionsLUKSAny'} }
 
 ##
 # @RbdEncryptionCreateOptions:
-- 
2.25.1


