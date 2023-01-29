Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F8680C22
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:42:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSYM-0001oX-EO; Mon, 30 Jan 2023 06:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@oro.sl.cloud9.ibm.com>)
 id 1pMSYK-0001nD-5P; Mon, 30 Jan 2023 06:42:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@oro.sl.cloud9.ibm.com>)
 id 1pMSYI-0003HM-EG; Mon, 30 Jan 2023 06:42:23 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30T6nATd016052; Sun, 29 Jan 2023 11:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=213llt9OUMMYOYJXB1RsX2fI7g7LU6NV7DtfwSztjDE=;
 b=qGpZvZ3ESl+Z3Skal3vQ8Y7MEeNmWKTXJqL8XtVAsA8gX+llvrDIcAkh3y/r0dpl3lLF
 NNwDzCTnUaa2s+D31xP1Ngi5wSAuGwftj03J6Sj36XLCrs8GkQPbWL9pL68INOeK/ZBC
 smMJJdK8IqVZW5yPMWIrNK733XfCuJy8kkhxz8qnmwIoGMTXfpjSGBfUyMzGrjxwWPx8
 p/IlPtsvV09zpy+xoAqOmiqSW6C9OACV3xXRYRQmWssl8tklwHc/0O7D9eE8Altrhhxn
 5B/I/fy4oOHv59bSQ52464WnMgVUMgGRSkzBAvRWxzeGuCyW6SMU4v6zlHLuc790KNiL Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddhp87jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:29 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30TBVSNS012461;
 Sun, 29 Jan 2023 11:31:28 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddhp87jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:28 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30TAVg3t006481;
 Sun, 29 Jan 2023 11:31:27 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ncvtky78a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:27 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30TBVQGg6619778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 29 Jan 2023 11:31:26 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16D645805B;
 Sun, 29 Jan 2023 11:31:26 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E595E58058;
 Sun, 29 Jan 2023 11:31:24 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 29 Jan 2023 11:31:24 +0000 (GMT)
From: "ORO@il.ibm.com" <oro@oro.sl.cloud9.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com, idryomov@gmail.com
Subject: [PATCH v6 1/3] block/rbd: Remove redundant stack variable
 passphrase_len
Date: Sun, 29 Jan 2023 05:31:18 -0600
Message-Id: <20230129113120.722708-2-oro@oro.sl.cloud9.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
References: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u8NkaxV5-Jzc8yPSFfn3su-qJm2hGkGi
X-Proofpoint-GUID: 0AfzfEM2I7qt2JUt-Dv7mzeontu54817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-29_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=725 lowpriorityscore=0 suspectscore=0 priorityscore=1501
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

Signed-off-by: Or Ozeri <oro@il.ibm.com>
---
 block/rbd.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 3aa6aae0e0..cfec0f2862 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -385,7 +385,6 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
 {
     int r = 0;
     g_autofree char *passphrase = NULL;
-    size_t passphrase_len;
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
@@ -467,7 +466,6 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
 {
     int r = 0;
     g_autofree char *passphrase = NULL;
-    size_t passphrase_len;
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


