Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FBC4C8DDA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:35:08 +0100 (CET)
Received: from localhost ([::1]:47208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3al-0005t4-Qt
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:35:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3Oe-0002lH-PJ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:37 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3Od-0007OP-57
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:36 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DBtrE032680
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PbVrMKq3KAZgF8tAr5bQ63dRTvoJpIGdxtmwDdMQQn4=;
 b=J/1YgrgMseZ/ffDHjc+qj5uPpYX0rmRO4ZrvWvSYzy0DnaCoU52MbTIWufTTfrVMHVOY
 fiyOYgZ8Xvu/l8koq0cMJiFjSvdxRWbl6+PM+p10byAVGhQ1D1npF2eyPLVTWa3TFivX
 JDG25zfIra9q0ZEr8zm78yiiZ8NWRx2RrTGQM1U7f//UyNZTuXqGpF/b2a9di3vz+3MH
 kvp8AxbUOAZ7EiSWy1FKahwjKYzj93x95UAERINzDENhm/B+Yr7wj+3Vb0cvBc0ADMbQ
 t2yy/Ry6259XuhvzYQHEr/uiIXxprwVrOIRzZUOmNMjkqwX0c2R+WsItrMZs+eKbfyrP pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehm5esra3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:22:34 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221EB09k025614
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:33 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehm5esr9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:33 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221EK7Da006113;
 Tue, 1 Mar 2022 14:22:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjkxqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221EMT4g50987354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 14:22:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD08211C04C;
 Tue,  1 Mar 2022 14:22:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D464111C04A;
 Tue,  1 Mar 2022 14:22:28 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 14:22:28 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] dump: Consolidate elf note function
Date: Tue,  1 Mar 2022 14:22:13 +0000
Message-Id: <20220301142213.28568-8-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301142213.28568-1-frankja@linux.ibm.com>
References: <20220301142213.28568-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1OnerehdrSgUSRDtz7Q5KrLgX4GCA96M
X-Proofpoint-GUID: 1LnaZevy4UZg7NXNPfsUEG5TON3UHBtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=562 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010077
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
 dump/dump.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 78654b9c27..9ba0392e00 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -507,6 +507,21 @@ static void write_elf_loads(DumpState *s, Error **errp)
     }
 }
 
+static void write_elf_notes(DumpState *s, Error **errp)
+{
+    Error *local_err = NULL;
+
+    if (dump_is_64bit(s)) {
+        write_elf64_notes(fd_write_vmcore, s, &local_err);
+    } else {
+        write_elf32_notes(fd_write_vmcore, s, &local_err);
+    }
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+}
+
 /* write elf header, PT_NOTE and elf note to vmcore. */
 static void dump_begin(DumpState *s, Error **errp)
 {
@@ -570,13 +585,8 @@ static void dump_begin(DumpState *s, Error **errp)
         }
     }
 
-    if (dump_is_64bit(s)) {
-        /* write notes to vmcore */
-        write_elf64_notes(fd_write_vmcore, s, &local_err);
-    } else {
-        /* write notes to vmcore */
-        write_elf32_notes(fd_write_vmcore, s, &local_err);
-    }
+    /* write notes to vmcore */
+    write_elf_notes(s, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
-- 
2.32.0


