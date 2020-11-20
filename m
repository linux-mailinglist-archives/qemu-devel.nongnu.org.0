Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644C72BAF91
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:06:51 +0100 (CET)
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8vy-0002Zc-Eq
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kg8rx-0006qv-Nw; Fri, 20 Nov 2020 11:02:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kg8rw-0000y7-0l; Fri, 20 Nov 2020 11:02:41 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKG2MUA142148; Fri, 20 Nov 2020 11:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=L7Ao0tdT8nnEVKmYBfCWf3TYpBBOl5ef5qtaVpwtDKg=;
 b=N5388cZpMwzNyWFNNMBjiCUbqiC13dPaqjwbCHzLEgoDpkFlb/7nEdaaxXDcQSaY7qV8
 1pdJ9EMCeNApUEb7gFREALU44Lis42hi6xZRWTVGaB1fkyTNC+TPqM0sIsjqFi690pYB
 sJGVSqIyLJix1YWqCIfQxd3YzuAPya7td3qeQ6UuJ1q7CPPnDLoh06ldqS7uV9Vpn8c7
 9pAnwzmc8ykAQRKtGxnJ5rnsWJK8tXHAG5myJK6jF31QXPRwTnwYh6tO6RaIFQCR+P9X
 Hvpjjp3il3uXx6PbbcbNUuYeYBbZx5ENVIx+8IDts1L8OVNOvsSswG3lEAM0gUTHXzJF vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xghf15vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 11:02:38 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AKG2N71142266;
 Fri, 20 Nov 2020 11:02:38 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xghf15u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 11:02:37 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKG2CH3000482;
 Fri, 20 Nov 2020 16:02:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 34t6v8cuwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 16:02:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKG1I3k59310578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 16:01:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 390D2A4053;
 Fri, 20 Nov 2020 16:01:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 277BBA405D;
 Fri, 20 Nov 2020 16:01:18 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 20 Nov 2020 16:01:18 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id D8733E23B4; Fri, 20 Nov 2020 17:01:17 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 2/2] pc-bios: s390x: Clear out leftover S390EP string
Date: Fri, 20 Nov 2020 17:01:17 +0100
Message-Id: <20201120160117.59366-3-farman@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120160117.59366-1-farman@linux.ibm.com>
References: <20201120160117.59366-1-farman@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_08:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011200106
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
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A Linux binary will have the string "S390EP" at address 0x10008,
which is important in getting the guest up off the ground. In the
case of a reboot (specifically chreipl going to a new device),
we should defer to the PSW at address zero for the new config,
which will re-write "S390EP" from the new image.

Let's clear it out at this point so that a reipl to, say, a DASD
passthrough device drives the IPL path from scratch without disrupting
disrupting the order of operations for other boots.

Rather than hardcoding the address of this magic (again), let's
define it somewhere so that the two users are visibly related.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 pc-bios/s390-ccw/jump2ipl.c  | 2 +-
 pc-bios/s390-ccw/main.c      | 6 ++++++
 pc-bios/s390-ccw/s390-arch.h | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
index fbae45b03c..b9c70d64a5 100644
--- a/pc-bios/s390-ccw/jump2ipl.c
+++ b/pc-bios/s390-ccw/jump2ipl.c
@@ -78,7 +78,7 @@ void jump_to_low_kernel(void)
      * kernel start address (when jumping to the PSW-at-zero address instead,
      * the kernel startup code fails when we booted from a network device).
      */
-    if (!memcmp((char *)0x10008, "S390EP", 6)) {
+    if (!memcmp((char *)S390EP, "S390EP", 6)) {
         jump_to_IPL_code(KERN_IMAGE_START);
     }
 
diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
index fc4bfaa455..5d2b7ba94d 100644
--- a/pc-bios/s390-ccw/main.c
+++ b/pc-bios/s390-ccw/main.c
@@ -178,6 +178,12 @@ static void boot_setup(void)
     memcpy(lpmsg + 10, loadparm_str, 8);
     sclp_print(lpmsg);
 
+    /*
+     * Clear out any potential S390EP magic (see jump_to_low_kernel()),
+     * so we don't taint our decision-making process during a reboot.
+     */
+    memset((char *)S390EP, 0, 6);
+
     have_iplb = store_iplb(&iplb);
 }
 
diff --git a/pc-bios/s390-ccw/s390-arch.h b/pc-bios/s390-ccw/s390-arch.h
index 6da44d4436..a741488aaa 100644
--- a/pc-bios/s390-ccw/s390-arch.h
+++ b/pc-bios/s390-ccw/s390-arch.h
@@ -95,6 +95,9 @@ typedef struct LowCore {
 
 extern LowCore *lowcore;
 
+/* Location of "S390EP" in a Linux binary (see arch/s390/boot/head.S) */
+#define S390EP 0x10008
+
 static inline void set_prefix(uint32_t address)
 {
     asm volatile("spx %0" : : "m" (address) : "memory");
-- 
2.17.1


