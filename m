Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69125220922
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 11:47:59 +0200 (CEST)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jve18-0007xa-G7
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 05:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jvdvz-0001nf-CJ
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 05:42:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52382
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jvdvx-0006Xl-H4
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 05:42:39 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F9Y0cx156063
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 05:42:36 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 329r1hmb68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 05:42:36 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06F9Z6Uj161885
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 05:42:36 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 329r1hmb5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 05:42:36 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F9ZRgJ011998;
 Wed, 15 Jul 2020 09:42:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 327527vc0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 09:42:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06F9dsbS57147796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 09:39:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7F764C040;
 Wed, 15 Jul 2020 09:41:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E9654C046;
 Wed, 15 Jul 2020 09:41:16 +0000 (GMT)
Received: from linux01.pok.stglabs.ibm.com (unknown [9.114.17.81])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jul 2020 09:41:16 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] pc-bios: s390x: Cleanup jump to ipl code
Date: Wed, 15 Jul 2020 05:40:40 -0400
Message-Id: <20200715094045.381984-3-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715094045.381984-1-frankja@linux.ibm.com>
References: <20200715094045.381984-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_07:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxscore=0 bulkscore=0 phishscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 05:27:14
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

jump_to_IPL_code takes a 64 bit address, masks it with the short psw
address mask and later branches to it using a full 64 bit register.

* As the masking is not necessary, let's remove it
* Without the mask we can save the ipl address to a static 64 bit
  function ptr as we later branch to it
* Let's also clean up the variable names and remove the now unneeded
  ResetInfo

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 pc-bios/s390-ccw/jump2ipl.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
index 767012bf0c..aef37cea76 100644
--- a/pc-bios/s390-ccw/jump2ipl.c
+++ b/pc-bios/s390-ccw/jump2ipl.c
@@ -13,20 +13,15 @@
 #define KERN_IMAGE_START 0x010000UL
 #define RESET_PSW_MASK (PSW_MASK_SHORTPSW | PSW_MASK_64)
 
-typedef struct ResetInfo {
-    uint64_t ipl_psw;
-    uint32_t ipl_continue;
-} ResetInfo;
-
-static ResetInfo save;
+static void (*ipl_continue)(void);
+static uint64_t psw_save;
 
 static void jump_to_IPL_2(void)
 {
-    ResetInfo *current = 0;
+    uint64_t *psw_current = 0;
 
-    void (*ipl)(void) = (void *) (uint64_t) current->ipl_continue;
-    *current = save;
-    ipl(); /* should not return */
+    *psw_current = psw_save;
+    ipl_continue(); /* should not return */
 }
 
 void jump_to_IPL_code(uint64_t address)
@@ -46,15 +41,15 @@ void jump_to_IPL_code(uint64_t address)
      * content of non-BIOS memory after we loaded the guest, so we
      * save the original content and restore it in jump_to_IPL_2.
      */
-    ResetInfo *current = 0;
+    uint64_t *psw_current = 0;
 
-    save = *current;
+    psw_save = *psw_current;
 
-    current->ipl_psw = (uint64_t) &jump_to_IPL_2;
-    current->ipl_psw |= RESET_PSW_MASK;
-    current->ipl_continue = address & PSW_MASK_SHORT_ADDR;
+    *psw_current = (uint64_t) &jump_to_IPL_2;
+    *psw_current |= RESET_PSW_MASK;
+    ipl_continue = (void *)address;
 
-    debug_print_int("set IPL addr to", current->ipl_continue);
+    debug_print_int("set IPL addr to", (uint64_t)ipl_continue);
 
     /* Ensure the guest output starts fresh */
     sclp_print("\n");
-- 
2.25.1


