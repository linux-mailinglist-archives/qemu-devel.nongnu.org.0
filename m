Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7BA66B107
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 13:41:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH2J7-0003DF-SZ; Sun, 15 Jan 2023 07:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1pH2Ir-00032r-CP; Sun, 15 Jan 2023 07:40:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1pH2Ik-0006o5-NV; Sun, 15 Jan 2023 07:40:00 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30FAPeA9012411; Sun, 15 Jan 2023 12:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yGGgRBbeuV+h16W/IxogjwPn7ZQTpXREF023Zue8ljI=;
 b=nvloXpoEcq747CsgFX10YhI8v7ieGUN81pWOtCbibrTv+kEaEa4J77LdvNZmnqDJW4ru
 ks+KjDT/B0ACnq5+gVXU5M9JYvi37Ah2F+4TmLvwN6hOb/woGJGAx9u7pERBE1TIXbW3
 PxktiVt5vc6m2ABYgnphtudIdWDdomfYo5BkOtftwVtZwUx/1MMmHqMABhcbnuGXvg+b
 zfL3XCW/MG/X7TLjIv3exemOpLGIkT/CGMqCEBso6jNaot/rZywlVxipfc8jLrZnKjxO
 1MkbgfcKxQYK9y6jqr42spZLRB+QiAMoi1gERtinVre4fexNr8LYXlt/x9GFxyCr1RCo Eg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4fqp9e4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Jan 2023 12:39:51 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30FBxP85005665;
 Sun, 15 Jan 2023 12:39:50 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3n3m16tq7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Jan 2023 12:39:50 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30FCdkpN7930380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Jan 2023 12:39:47 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F9F958059;
 Sun, 15 Jan 2023 12:39:46 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09C055805D;
 Sun, 15 Jan 2023 12:39:46 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 15 Jan 2023 12:39:45 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com
Subject: [PATCH v5 1/3] block/rbd: Remove redundant stack variable
 passphrase_len
Date: Sun, 15 Jan 2023 06:39:30 -0600
Message-Id: <20230115123932.2564966-2-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230115123932.2564966-1-oro@il.ibm.com>
References: <20230115123932.2564966-1-oro@il.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: apW3CbBAShtJL-Wl58CkQeHH1ZO_sq-T
X-Proofpoint-GUID: apW3CbBAShtJL-Wl58CkQeHH1ZO_sq-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-15_07,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 mlxlogscore=588
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301150096
Received-SPF: pass client-ip=148.163.156.1; envelope-from=oro@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


