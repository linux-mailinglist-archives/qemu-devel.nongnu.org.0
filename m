Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1D4D456E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:14:07 +0100 (CET)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGkA-00068a-3u
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:14:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfT-0007Gx-Bc
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfR-0004ej-4h
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:15 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22A8sO8s011063
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mAMCXXM5QvWIMws42WcrOmY8iDqMMvPSE8T4WmQHNFA=;
 b=X7NqBXtmX8jMgyvyZJ53bSetQmxVzQ7Bk5jTzLdM8iGhvL2QZYOEszWYJpE4wF1UBC5S
 TN1UB4jAuoCSNZFjmzPd+Yto0LTT+1Dhj6yvqXTXqpoxXKQAcfbB1I+pSPpx1isd4qqq
 waRvwp7neCHB9mxYnrrhgnf6yM/HRQEp/zOfniqHo90n9aT0PChOeRfcCGEKnXkcTUIV
 dPMNPUrCpwweDMUFFwpaM7yyBuHx1GaG04w3W1KPl3SI0RxCEwTJTu6na4JMB+Bt/20Y
 lkQIQIavynTHyA9MrZF2pJgViMxOrQEmc6FEwF7WW6ve9zsKn50jnanLSya5HkBUCtnN 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enywa31cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:12 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AAR2Z1015768
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enywa31ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AB3UnU031219;
 Thu, 10 Mar 2022 11:09:10 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4j4gs4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:09 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AB97ha19005858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:09:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A747711C06E;
 Thu, 10 Mar 2022 11:09:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CE9911C066;
 Thu, 10 Mar 2022 11:09:07 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:09:07 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] dump: Consolidate elf note function
Date: Thu, 10 Mar 2022 11:08:54 +0000
Message-Id: <20220310110854.2701-10-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310110854.2701-1-frankja@linux.ibm.com>
References: <20220310110854.2701-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6dVug4eMFtj-8MSVC473BTiW-4WWB8vo
X-Proofpoint-ORIG-GUID: 6n2b17vamPE8GRyyFTtpx8Z9lFT4Mszh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=685 phishscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203100059
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just like with the other write functions let's move the 32/64 bit elf
handling to a function to improve readability.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 5542adf7b8..ae8ec527de 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -510,6 +510,20 @@ static void write_elf_loads(DumpState *s, Error **errp)
     }
 }
 
+static void write_elf_notes(DumpState *s, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (dump_is_64bit(s)) {
+        write_elf64_notes(fd_write_vmcore, s, errp);
+    } else {
+        write_elf32_notes(fd_write_vmcore, s, errp);
+    }
+    if (*errp) {
+        return;
+    }
+}
+
 /* write elf header, PT_NOTE and elf note to vmcore. */
 static void dump_begin(DumpState *s, Error **errp)
 {
@@ -569,13 +583,8 @@ static void dump_begin(DumpState *s, Error **errp)
         }
     }
 
-    if (dump_is_64bit(s)) {
-        /* write notes to vmcore */
-        write_elf64_notes(fd_write_vmcore, s, errp);
-    } else {
-        /* write notes to vmcore */
-        write_elf32_notes(fd_write_vmcore, s, errp);
-    }
+    /* write notes to vmcore */
+    write_elf_notes(s, errp);
 }
 
 static int get_next_block(DumpState *s, GuestPhysBlock *block)
-- 
2.32.0


