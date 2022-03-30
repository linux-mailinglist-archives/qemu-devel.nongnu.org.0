Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EB14EC4BC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:43:06 +0200 (CEST)
Received: from localhost ([::1]:40404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXfE-0002Sq-0h
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:43:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZW-0006Xn-70
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31456
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZU-0003Ol-Cf
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:09 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UAgOM1002845; 
 Wed, 30 Mar 2022 12:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DNx5PAzIS1qHZF/9OjgwYDkg0yhzscgqZ0MpqCjbyd0=;
 b=MiL1L/dkT+HmLVi9x53d1hH6sg6dH60UMQIr3S9HcCZRvgqQzI/HktB82EgDD7SuO9ek
 CA4TaNhlq5rlaGOIpuHMSX1QNHLo2l1HuWU1KSsQKOUxk+EkwpuzU6hysze27wZOfnmw
 +eNh9j7lZRJG/B4W3tcS1HpMgAdsmUBUA5tI87eGKVG5Ou20Rc2x2uKcxfcWLZxRH910
 VE6Ld8mYUwgfutHJ9/FVeuWNRP40K6TUJ6bHNG/7S/RfG8TyVXAWpRBjizgMO/W7FsTp
 d56dg0erU+FS9UcpX+0jwMPpWEqiIhje/CYVNBi9H7aA0KfnQVlcooxa2LMM3cBvSLx6 nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f4npk2fhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:06 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UCVY6Q006867;
 Wed, 30 Mar 2022 12:37:06 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f4npk2fgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:05 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UCNXwD027057;
 Wed, 30 Mar 2022 12:37:04 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3f3rs3kjc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UCb1h747972704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 12:37:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7AF75204E;
 Wed, 30 Mar 2022 12:37:01 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3F7775204F;
 Wed, 30 Mar 2022 12:37:01 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 9/9] dump: Consolidate elf note function
Date: Wed, 30 Mar 2022 12:36:03 +0000
Message-Id: <20220330123603.107120-10-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330123603.107120-1-frankja@linux.ibm.com>
References: <20220330123603.107120-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zzw7LUETBlkoAUSYm-IOpfm-kvoAdX9A
X-Proofpoint-ORIG-GUID: tRcCUb53Etik9dIAf4N9QgdOm-TF0X1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 impostorscore=0 mlxlogscore=738 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: marcandre.lureau@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just like with the other write functions let's move the 32/64 bit elf
handling to a function to improve readability.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 92acd9eb5c..4af71de9b1 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -510,6 +510,15 @@ static void write_elf_loads(DumpState *s, Error **errp)
     }
 }
 
+static void write_elf_notes(DumpState *s, Error **errp)
+{
+    if (dump_is_64bit(s)) {
+        write_elf64_notes(fd_write_vmcore, s, errp);
+    } else {
+        write_elf32_notes(fd_write_vmcore, s, errp);
+    }
+}
+
 /* write elf header, PT_NOTE and elf note to vmcore. */
 static void dump_begin(DumpState *s, Error **errp)
 {
@@ -569,13 +578,8 @@ static void dump_begin(DumpState *s, Error **errp)
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


