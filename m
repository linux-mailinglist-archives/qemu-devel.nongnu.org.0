Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9628B631350
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 11:30:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owhZR-00050y-6R; Sun, 20 Nov 2022 05:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1owhZH-0004yA-Ai; Sun, 20 Nov 2022 05:28:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1owhZE-0000DE-Rn; Sun, 20 Nov 2022 05:28:54 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AK6OZZe005032; Sun, 20 Nov 2022 10:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=u8J5U7aJnmDMZmSQJM5o6V5ouGM2rZ+vseGoqxU0WUc=;
 b=F8KnR3/6CPXid2bxoHyU5/BpfxDjOtgRXuR3ZHZKwnSGOj12SEEmJVeSp8izkAEmfhV0
 2tWoS7tDU9D5de167cE0oAwNbXfElJ97v3Os/Z3HsaaWlK8G1FjBqkV682iwOmTyCPWL
 hME6Tq9ioykRXnvOJFu4Niv8eVCO1gnGdaF0uP1Iypb03WISwVGwMhuUJZiqNNiSmcR8
 MKqPdMYrWajLYoCgVbE3UL9+9dexrMnlxagOal9/+KG1aPByywoo0qXH13lYRp79XBX8
 gCky9PIUbPsBhVh558nWapEY46vIcGK+LY7LBoQDsvimRk9CXLrQxPyM3wSvycd2D548 EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky930r39w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:49 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AKASmxt017070;
 Sun, 20 Nov 2022 10:28:48 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky930r39s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:48 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AKAKYHj025194;
 Sun, 20 Nov 2022 10:28:48 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 3kxps9f33k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:48 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AKASl9V59572778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Nov 2022 10:28:47 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93E7558043;
 Sun, 20 Nov 2022 10:28:45 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7F675805E;
 Sun, 20 Nov 2022 10:28:44 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 20 Nov 2022 10:28:44 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com, dannyh@il.ibm.com,
 idryomov@gmail.com
Subject: [PATCH v4 2/3] block/rbd: Add luks-any encryption opening option
Date: Sun, 20 Nov 2022 04:28:35 -0600
Message-Id: <20221120102836.3174090-3-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221120102836.3174090-1-oro@il.ibm.com>
References: <20221120102836.3174090-1-oro@il.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mvMpO-yaXOXp8Htt-kbGN-B7OLHXwFpF
X-Proofpoint-ORIG-GUID: TEYDU0EoTXLErqlgGBEOqtQ8EhzlLxRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_07,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=979 lowpriorityscore=0 malwarescore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211200086
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
index e575105e6d..7feae45e82 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -468,6 +468,9 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
     g_autofree const char *passphrase = NULL;
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
index 882b266532..d064847d85 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3753,10 +3753,16 @@
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
@@ -3798,6 +3804,15 @@
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
@@ -3825,7 +3840,8 @@
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


