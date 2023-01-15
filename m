Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32BF66B10A
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 13:41:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH2J1-000370-H6; Sun, 15 Jan 2023 07:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1pH2In-00031s-92; Sun, 15 Jan 2023 07:39:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1pH2Ik-0006nv-Mc; Sun, 15 Jan 2023 07:39:56 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30FAhxqW026929; Sun, 15 Jan 2023 12:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=db99MLEFtNtO0xb5H0G0kwTMDecZs4tuYQwT8W+Br70=;
 b=H/hm9E4a+pOsQatPOBieNpU4z/2rHRMc/xVvOAsr/KagRopH44Ri709QCDSl3xQcQO9k
 KcEVdgM0dCH1ue/uu83utrH07LFeJ/iW0uvA+pQaAbtldsCIE/uRYEtuWyib8KxnNvX4
 ug+mwkVhCyd7xrF74xX3iwQj5nqNzfJmlbkWNr27GICcbgaZIaPAU7baQPcRkJ++LP4r
 Fy/OXkOBnwJhPYZNA78iydSUEOGIR8L925eAIYSxA/LtqkljknVaWKzhvg4VJQenIMDR
 GhVZP0r48jN+M8mleyjzimbtH/a+TAt7NssnljgcPuP6iBk5R1lhUAxE31qII+SmtFeA NQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4g0798r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Jan 2023 12:39:50 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30FAA6Wj024981;
 Sun, 15 Jan 2023 12:39:50 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3n3m170jy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Jan 2023 12:39:50 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30FCdlWg14746006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Jan 2023 12:39:47 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CD0558059;
 Sun, 15 Jan 2023 12:39:47 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD9A658043;
 Sun, 15 Jan 2023 12:39:46 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 15 Jan 2023 12:39:46 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com
Subject: [PATCH v5 2/3] block/rbd: Add luks-any encryption opening option
Date: Sun, 15 Jan 2023 06:39:31 -0600
Message-Id: <20230115123932.2564966-3-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230115123932.2564966-1-oro@il.ibm.com>
References: <20230115123932.2564966-1-oro@il.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jSJT1ku12d0QNxt_rPgG-9wdy15nL2S7
X-Proofpoint-GUID: jSJT1ku12d0QNxt_rPgG-9wdy15nL2S7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-15_07,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=781 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301150096
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


