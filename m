Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893F2B98CA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:00:56 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnIl-0001Qr-1L
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kfnFl-0008Pq-Hz; Thu, 19 Nov 2020 11:57:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kfnFj-0004gD-7E; Thu, 19 Nov 2020 11:57:49 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJGXWf0039575; Thu, 19 Nov 2020 11:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=ya3pQN6oYVrioC/aUTTNBDEvS/PtAxIKdhXex56o5Uk=;
 b=AYFT3j/Dd+Luw5d0ZrIDWnCY2wvFz3yrHZg2tu9MeZ6nxsuiPdxZkH2Z8W3zjgNGq5Jr
 BYN8sbF90nmhJ3ht16HzkEbjSMKHFHq9eWHl//y4ljVC5IY3on94Wl3rVbbILdosYvON
 NedAD2F3G78gDSSoxrd0C9iBApM8uqg8P3LV2pNllHjQc+tUlqlUAxt54O3Od5mO3tQ4
 cQLCSS37/KTzbWH3Ay6XwoNdxSVjsqrDBY54INjMAdSzfol0RMt2sc2RWZf0+N7iz5dg
 5y7dAeZb3R+yjKpVRqOcSxRJ2rNy7Be84kt55/0Ns7a1IJMvqCGBM+OtNAGV/lhOLIsx 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wu6mja0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 11:57:45 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJGY1wr042907;
 Thu, 19 Nov 2020 11:57:40 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wu6mj9xa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 11:57:40 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJGrNLI030562;
 Thu, 19 Nov 2020 16:57:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 34weby0umx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 16:57:34 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJGvVPs5571242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 16:57:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5145BA4059;
 Thu, 19 Nov 2020 16:57:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48374A4057;
 Thu, 19 Nov 2020 16:57:31 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 19 Nov 2020 16:57:31 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 08C6FE23B1; Thu, 19 Nov 2020 17:57:31 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 2/2] pc-bios: s390x: Give precedence to reset PSW
Date: Thu, 19 Nov 2020 17:57:29 +0100
Message-Id: <20201119165729.63351-3-farman@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119165729.63351-1-farman@linux.ibm.com>
References: <20201119165729.63351-1-farman@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_09:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190119
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's look at the Reset PSW first instead of the contents of memory.
It might be leftover from an earlier system boot when processing
a chreipl.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 pc-bios/s390-ccw/jump2ipl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
index fbae45b03c..67b4afb6a0 100644
--- a/pc-bios/s390-ccw/jump2ipl.c
+++ b/pc-bios/s390-ccw/jump2ipl.c
@@ -72,16 +72,6 @@ void jump_to_IPL_code(uint64_t address)
 
 void jump_to_low_kernel(void)
 {
-    /*
-     * If it looks like a Linux binary, i.e. there is the "S390EP" magic from
-     * arch/s390/kernel/head.S here, then let's jump to the well-known Linux
-     * kernel start address (when jumping to the PSW-at-zero address instead,
-     * the kernel startup code fails when we booted from a network device).
-     */
-    if (!memcmp((char *)0x10008, "S390EP", 6)) {
-        jump_to_IPL_code(KERN_IMAGE_START);
-    }
-
     /* Trying to get PSW at zero address */
     if (*((uint64_t *)0) & RESET_PSW_MASK) {
         /*
@@ -92,6 +82,16 @@ void jump_to_low_kernel(void)
         jump_to_IPL_code(0);
     }
 
+    /*
+     * If it looks like a Linux binary, i.e. there is the "S390EP" magic from
+     * arch/s390/kernel/head.S here, then let's jump to the well-known Linux
+     * kernel start address (when jumping to the PSW-at-zero address instead,
+     * the kernel startup code fails when we booted from a network device).
+     */
+    if (!memcmp((char *)0x10008, "S390EP", 6)) {
+        jump_to_IPL_code(KERN_IMAGE_START);
+    }
+
     /* No other option left, so use the Linux kernel start address */
     jump_to_IPL_code(KERN_IMAGE_START);
 }
-- 
2.17.1


