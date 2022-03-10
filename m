Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126924D4574
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:15:39 +0100 (CET)
Received: from localhost ([::1]:53586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGle-0008En-3Z
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:15:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfT-0007HO-Fz
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfQ-0004eV-Hu
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:15 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AABZn5022064
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lbWgJpVUEzAhvhhYex9+Qvx1UZNULxfMjXB2jxtflUE=;
 b=ksh7KgCLUI3PbhMYVmyQ8LIAwsLfwYu6sJhKfKMnZehEyoBKPee7QNydzJZDE8eaFyj3
 FRdKeIYICKe1RnSdnSy/5rrQmcrJe/5uHxkbb2ISeB0cSwDWZQ2q0T5JwAbVP4RXgz3T
 GCJisfQRuAPtgFkqx8D3agpuSk/rf7cdngiv23GuIX2hnEYzOvT9Cl3V5d2L1rQ2+G0H
 pWvf3vT7IXKNRDityTz1fob2UbMk5f4Dks13OclTffn1WzrwtgjP+vYm946kaYNkAT43
 ZenyhYXyjOOoT40uxhKKIVR+hEeJ+t4GlWw5Sw6v/IUf5gNshUwoyyAMau3RedPJA9ZW IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqcyy46n6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:11 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AArNCu017183
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqcyy46mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AB3HRf031168;
 Thu, 10 Mar 2022 11:09:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4j4gs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:09 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AB97GR16843026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:09:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1683311C069;
 Thu, 10 Mar 2022 11:09:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0D5F11C066;
 Thu, 10 Mar 2022 11:09:06 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:09:06 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] dump: Cleanup dump_begin write functions
Date: Thu, 10 Mar 2022 11:08:53 +0000
Message-Id: <20220310110854.2701-9-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310110854.2701-1-frankja@linux.ibm.com>
References: <20220310110854.2701-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G8KzOMk7oABGeb0-RTj3pXppewwDVzx2
X-Proofpoint-GUID: LNIuf2PSam4b4wZBIUY2kwnOrGtyO8yB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 mlxlogscore=861
 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
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

There's no need to have a gigantic if in there let's move the elf
32/64 bit logic into the section, segment or note code.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 42 +++++++++++-------------------------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 1294673444..5542adf7b8 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -555,46 +555,26 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    if (dump_is_64bit(s)) {
-        /* write all PT_LOAD to vmcore */
-        write_elf_loads(s, errp);
+    /* write all PT_LOAD to vmcore */
+    write_elf_loads(s, errp);
+    if (*errp) {
+        return;
+    }
+
+    /* write section to vmcore */
+    if (s->shdr_num) {
+        write_elf_section(s, 1, errp);
         if (*errp) {
             return;
         }
+    }
 
-        /* write section to vmcore */
-        if (s->shdr_num) {
-            write_elf_section(s, 1, errp);
-            if (*errp) {
-                return;
-            }
-        }
-
+    if (dump_is_64bit(s)) {
         /* write notes to vmcore */
         write_elf64_notes(fd_write_vmcore, s, errp);
-        if (*errp) {
-            return;
-        }
     } else {
-        /* write all PT_LOAD to vmcore */
-        write_elf_loads(s, errp);
-        if (*errp) {
-            return;
-        }
-
-        /* write section to vmcore */
-        if (s->shdr_num) {
-            write_elf_section(s, 0, errp);
-            if (*errp) {
-                return;
-            }
-        }
-
         /* write notes to vmcore */
         write_elf32_notes(fd_write_vmcore, s, errp);
-        if (*errp) {
-            return;
-        }
     }
 }
 
-- 
2.32.0


