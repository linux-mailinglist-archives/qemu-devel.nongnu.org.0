Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E8935E7EB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:00:11 +0200 (CEST)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQ8o-0000aw-Jc
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lWQ7B-0008KL-VL
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:58:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lWQ74-0007IZ-Uw
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:58:28 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DKXPxR137655; Tue, 13 Apr 2021 16:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=bNdm1EJDCaoPjOjPSr9wHraKM0PU5dmT7/WxyuthDPY=;
 b=m8b3Fz0f+9hw7D1NyYInjDHr8K3TQi9K5O9/n6i2pr3OGs2D8Si0mjF7jnzApi0z2NAL
 fcywz0ar9DoFFvAlc/4yjhVbBr9xEoOC7shQcgc74UFdU4SVzKkNc2bTdAdFe0doat8x
 kH2HgO9Qbre0B0lALsxQ7RWfbPh54R8YPyyBaWH/bsvqKWXDW3RH4X8Lv6FhcovMT+Te
 qLyxo9vMfXwvPHZM5dUFqgWviI6GDzei7+x1ciBGGUI4aPt+eEo2iMY/oKagVRa375hd
 Edekf0xJeYZnQzXz7pmRgJ2ab63vfa0reETn9/kmDSW/McvH9X6rgBjyCU70cKOV5+M/ uw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vjtup4a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:58:21 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DKrHC3011623;
 Tue, 13 Apr 2021 20:58:19 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n8aw6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 20:58:19 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DKwHnN44040480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 20:58:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F27BD42049;
 Tue, 13 Apr 2021 20:58:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A52E042041;
 Tue, 13 Apr 2021 20:58:16 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 20:58:16 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user/elfload: fix filling psinfo->pr_psargs
Date: Tue, 13 Apr 2021 22:58:14 +0200
Message-Id: <20210413205814.22821-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5bcOjQipFJe9y1oucx_FjNSgQGjrnzq2
X-Proofpoint-ORIG-GUID: 5bcOjQipFJe9y1oucx_FjNSgQGjrnzq2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104130137
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current code dumps the memory between arg_start and arg_end,
which contains the argv pointers. This results in the

    Core was generated by `<garbage>`

message when opening the core file in GDB. This is because the code is
supposed to dump the actual arg strings. Fix by using arg_strings and
env_strings instead of arg_start and arg_end.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/elfload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 4e45bd1539..cffcebfe45 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3662,10 +3662,10 @@ static int fill_psinfo(struct target_elf_prpsinfo *psinfo, const TaskState *ts)
 
     (void) memset(psinfo, 0, sizeof (*psinfo));
 
-    len = ts->info->arg_end - ts->info->arg_start;
+    len = ts->info->env_strings - ts->info->arg_strings;
     if (len >= ELF_PRARGSZ)
         len = ELF_PRARGSZ - 1;
-    if (copy_from_user(&psinfo->pr_psargs, ts->info->arg_start, len))
+    if (copy_from_user(&psinfo->pr_psargs, ts->info->arg_strings, len))
         return -EFAULT;
     for (i = 0; i < len; i++)
         if (psinfo->pr_psargs[i] == 0)
-- 
2.29.2


