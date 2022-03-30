Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA744EC4F7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:53:19 +0200 (CEST)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXp8-0000oZ-Gb
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:53:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZW-0006Xo-Dp
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZU-0003Op-Hu
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:10 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UBQi5q026876; 
 Wed, 30 Mar 2022 12:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3DQXpi3vjEu9RFmblTblEcw2UqB1K4JNcjBtW1w7GVw=;
 b=hg7NjhLTO+7x4AW+lRhfJGLAqxmsjLNAYIQj9yVoRSgPuRHN31V2/BVpN8iKSCkUZAgu
 fVvTMj96ObTqFY7lpGpwt7lGxfEBJYfIeM6Mk223QQm2fKGzNNFOWvJDYKTcMbJ7z4Gm
 PfIN/N4aDhqa5vN6Gub1R4J5R4kctbgbKGg5JdsAv59XtW+wnLmSqtgV7/t+vhG6k5jy
 M4PoN2wQCvi392cjMoI3/kvbr6pdsjd5LS5D+mNR5uZWShAMwrop3fvjget69CQgvZye
 1Lzyo/sNn2P9vQCuUQkxndYSe0sWkfARo4qWfmi9GlIs68QgHZQ4Pii/C3UkxAIlNyvu qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4pbchfw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:06 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UCBh3K002377;
 Wed, 30 Mar 2022 12:37:06 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4pbchfv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:05 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UCMPwe030948;
 Wed, 30 Mar 2022 12:37:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3f1tf90js8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:03 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UCb1VW47972700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 12:37:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2353E5204F;
 Wed, 30 Mar 2022 12:37:01 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9B02C5204E;
 Wed, 30 Mar 2022 12:37:00 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/9] dump: Cleanup dump_begin write functions
Date: Wed, 30 Mar 2022 12:36:02 +0000
Message-Id: <20220330123603.107120-9-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330123603.107120-1-frankja@linux.ibm.com>
References: <20220330123603.107120-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MKT_8cWgwe9kyKg2yTN197nCaSabt_mZ
X-Proofpoint-ORIG-GUID: v9_rF_2ih-dEFazPE0gJ7K2nYJF3A9G9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=954 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: marcandre.lureau@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no need to have a gigantic if in there let's move the elf
32/64 bit logic into the section, segment or note code.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 dump/dump.c | 42 +++++++++++-------------------------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 365798f5a1..92acd9eb5c 100644
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


