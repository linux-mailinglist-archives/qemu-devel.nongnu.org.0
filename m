Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBDC423A8A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 11:27:55 +0200 (CEST)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY3DO-00068M-FS
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 05:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1mY3CS-0005SX-Uk; Wed, 06 Oct 2021 05:26:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52048
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1mY3CQ-0003wx-RR; Wed, 06 Oct 2021 05:26:56 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1967KJIo026466; 
 Wed, 6 Oct 2021 05:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=eRe/WNLpJgkrsPT62tE/GxnTMlLjSro3+xuEqJeMe2o=;
 b=mfBakcXDp2s80cHE+a5o/lAeWe5MzSuCvNqMaFrreQzjJsRk15psd2UXNrrU8mZqnyZG
 5EPLzn6vAQ2YP9pt1VsYBCjR5t6ww2j7vHMfIKYQIXa5wn7BbIm2yTRIOM6+f0X6oh89
 JTBGk0GXiG36uEvwu4ouHi8desoaI1V2o2NXddzCZNRMoF+JVVFjriYU6tYnL5IDdP9z
 zM84JiOgr7o5pDzCyqITd3T2X1mGoCmVtIHGTlQDQ+Z5PcyEsb1TzQ1Ny3Qu8Bjh1frh
 bpyahZM3t92RlLqED9F82zYiA9aQotrUhCEpQ2nYeDAdC38dtycBpyOPCslGP5+qpG0D zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bh2bxyxxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 05:26:52 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19690SAq023361;
 Wed, 6 Oct 2021 05:26:51 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bh2bxyxwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 05:26:51 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1969QkS2007203;
 Wed, 6 Oct 2021 09:26:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3bef2a09gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 09:26:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1969Qj3B42926558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Oct 2021 09:26:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E9A1AE058;
 Wed,  6 Oct 2021 09:26:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B68BAAE057;
 Wed,  6 Oct 2021 09:26:44 +0000 (GMT)
Received: from marcibm.fritz.box (unknown [9.171.50.254])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Oct 2021 09:26:44 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] s390x/ipl: check kernel command line size
Date: Wed,  6 Oct 2021 11:26:30 +0200
Message-Id: <20211006092631.20732-1-mhartmay@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AvHXdD5FsvKTZUb1JiNmo0P-JKiqGQwg
X-Proofpoint-GUID: 4j06lGKvRg4uDdQ12pBxzIfx2KXt3s_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_06,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 suspectscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110060058
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mhartmay@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Sven Schnelle <svens@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check if the provided kernel command line exceeds the maximum size of the s390x
Linux kernel command line size, which is 896 bytes.

Reported-by: Sven Schnelle <svens@linux.ibm.com>
Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
---
 hw/s390x/ipl.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 1821c6faeef3..a58ea58cc736 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -38,6 +38,7 @@
 #define KERN_IMAGE_START                0x010000UL
 #define LINUX_MAGIC_ADDR                0x010008UL
 #define KERN_PARM_AREA                  0x010480UL
+#define KERN_PARM_AREA_SIZE             0x000380UL
 #define INITRD_START                    0x800000UL
 #define INITRD_PARM_START               0x010408UL
 #define PARMFILE_START                  0x001000UL
@@ -190,10 +191,19 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
          * loader) and it won't work. For this case we force it to 0x10000, too.
          */
         if (pentry == KERN_IMAGE_START || pentry == 0x800) {
-            char *parm_area = rom_ptr(KERN_PARM_AREA, strlen(ipl->cmdline) + 1);
+            size_t cmdline_size = strlen(ipl->cmdline) + 1;
+            char *parm_area = rom_ptr(KERN_PARM_AREA, cmdline_size);
+
             ipl->start_addr = KERN_IMAGE_START;
             /* Overwrite parameters in the kernel image, which are "rom" */
             if (parm_area) {
+                if (cmdline_size > KERN_PARM_AREA_SIZE) {
+                    error_setg(errp,
+                               "kernel command line exceeds maximum size: %lu > %lu",
+                               cmdline_size, KERN_PARM_AREA_SIZE);
+                    return;
+                }
+
                 strcpy(parm_area, ipl->cmdline);
             }
         } else {
-- 
2.25.1


