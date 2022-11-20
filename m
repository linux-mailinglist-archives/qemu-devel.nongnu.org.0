Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A75E63134F
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 11:30:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owhZQ-0004ze-R7; Sun, 20 Nov 2022 05:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1owhZJ-0004yT-Bh; Sun, 20 Nov 2022 05:28:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1owhZE-0000Cu-R4; Sun, 20 Nov 2022 05:28:55 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AK6G1KL021664; Sun, 20 Nov 2022 10:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xdWivcnzo+dsc0nLdCJCZCT/aNr71O6ES7nhLKMZBWY=;
 b=ctPr1iAwodvdQt6plEbOZaYyJb3Ct1Q6bkCyvTN3CMhJOM1P+9tY5svoqvII6USGX/hR
 CaSGsxfFk0qb8V6xY/3WuZGtZx2hqTr7Fb2Zsrq1Q6y096ZrRbvobCOEFHRIceRPgELY
 PJ9HaOL7BV0WYGrvCpTnpq6hWLyzxIw2wcjpVG2P5zDt47QNUzoopLH5EbglRZYzWdFm
 GcPGgdwoets/dWnzMKxPrAv/s+76Xxys8ue75RIgCNp//o65AIyJQTjqIYmplBq4NcTa
 XnWDKfBhX7PFgcjVKPKQtUTC8URwUUtyUtzigfHrUXeo9mBvnr8EPiEe3U4CX/lNb2Hf iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky906fyjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:48 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AKAPQWq019089;
 Sun, 20 Nov 2022 10:28:48 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky906fyjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:48 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AKAJcbx019163;
 Sun, 20 Nov 2022 10:28:47 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3kxps9rtpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:47 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AKASfsm52429312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Nov 2022 10:28:41 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 932E15805D;
 Sun, 20 Nov 2022 10:28:44 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C77FA58059;
 Sun, 20 Nov 2022 10:28:43 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 20 Nov 2022 10:28:43 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com, dannyh@il.ibm.com,
 idryomov@gmail.com
Subject: [PATCH v4 1/3] block/rbd: encryption nit fixes
Date: Sun, 20 Nov 2022 04:28:34 -0600
Message-Id: <20221120102836.3174090-2-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221120102836.3174090-1-oro@il.ibm.com>
References: <20221120102836.3174090-1-oro@il.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xnSqfUsDjvjq0kyzDymUuwWGzRzbxPhx
X-Proofpoint-ORIG-GUID: W96pUy6KkdcCl937Ok_W8Y0eDSOlDynO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_07,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxlogscore=798 mlxscore=0 adultscore=0
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

Add const modifier to passphrases,
and remove redundant stack variable passphrase_len.

Signed-off-by: Or Ozeri <oro@il.ibm.com>
---
 block/rbd.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index f826410f40..e575105e6d 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -330,7 +330,7 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
 #ifdef LIBRBD_SUPPORTS_ENCRYPTION
 static int qemu_rbd_convert_luks_options(
         RbdEncryptionOptionsLUKSBase *luks_opts,
-        char **passphrase,
+        const char **passphrase,
         size_t *passphrase_len,
         Error **errp)
 {
@@ -341,7 +341,7 @@ static int qemu_rbd_convert_luks_options(
 static int qemu_rbd_convert_luks_create_options(
         RbdEncryptionCreateOptionsLUKSBase *luks_opts,
         rbd_encryption_algorithm_t *alg,
-        char **passphrase,
+        const char **passphrase,
         size_t *passphrase_len,
         Error **errp)
 {
@@ -384,8 +384,7 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
                                       Error **errp)
 {
     int r = 0;
-    g_autofree char *passphrase = NULL;
-    size_t passphrase_len;
+    g_autofree const char *passphrase = NULL;
     rbd_encryption_format_t format;
     rbd_encryption_options_t opts;
     rbd_encryption_luks1_format_options_t luks_opts;
@@ -407,12 +406,12 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
             opts_size = sizeof(luks_opts);
             r = qemu_rbd_convert_luks_create_options(
                     qapi_RbdEncryptionCreateOptionsLUKS_base(&encrypt->u.luks),
-                    &luks_opts.alg, &passphrase, &passphrase_len, errp);
+                    &luks_opts.alg, &passphrase, &luks_opts.passphrase_size,
+                    errp);
             if (r < 0) {
                 return r;
             }
             luks_opts.passphrase = passphrase;
-            luks_opts.passphrase_size = passphrase_len;
             break;
         }
         case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
@@ -423,12 +422,12 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
             r = qemu_rbd_convert_luks_create_options(
                     qapi_RbdEncryptionCreateOptionsLUKS2_base(
                             &encrypt->u.luks2),
-                    &luks2_opts.alg, &passphrase, &passphrase_len, errp);
+                    &luks2_opts.alg, &passphrase, &luks2_opts.passphrase_size,
+                    errp);
             if (r < 0) {
                 return r;
             }
             luks2_opts.passphrase = passphrase;
-            luks2_opts.passphrase_size = passphrase_len;
             break;
         }
         default: {
@@ -466,8 +465,7 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
                                     Error **errp)
 {
     int r = 0;
-    g_autofree char *passphrase = NULL;
-    size_t passphrase_len;
+    g_autofree const char *passphrase = NULL;
     rbd_encryption_luks1_format_options_t luks_opts;
     rbd_encryption_luks2_format_options_t luks2_opts;
     rbd_encryption_format_t format;
@@ -482,12 +480,11 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
             opts_size = sizeof(luks_opts);
             r = qemu_rbd_convert_luks_options(
                     qapi_RbdEncryptionOptionsLUKS_base(&encrypt->u.luks),
-                    &passphrase, &passphrase_len, errp);
+                    &passphrase, &luks_opts.passphrase_size, errp);
             if (r < 0) {
                 return r;
             }
             luks_opts.passphrase = passphrase;
-            luks_opts.passphrase_size = passphrase_len;
             break;
         }
         case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
@@ -497,12 +494,11 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
             opts_size = sizeof(luks2_opts);
             r = qemu_rbd_convert_luks_options(
                     qapi_RbdEncryptionOptionsLUKS2_base(&encrypt->u.luks2),
-                    &passphrase, &passphrase_len, errp);
+                    &passphrase, &luks2_opts.passphrase_size, errp);
             if (r < 0) {
                 return r;
             }
             luks2_opts.passphrase = passphrase;
-            luks2_opts.passphrase_size = passphrase_len;
             break;
         }
         default: {
-- 
2.25.1


