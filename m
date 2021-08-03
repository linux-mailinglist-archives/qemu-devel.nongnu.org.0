Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB963DF3D8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 19:21:21 +0200 (CEST)
Received: from localhost ([::1]:58438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAy6S-0000nG-Hs
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 13:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mAy5W-0007TZ-WD
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 13:20:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mAy5V-0006ID-Am
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 13:20:22 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173H2qJo142642; Tue, 3 Aug 2021 13:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Yji+zS0NIx8v3qpkWLOC/vAc6wDLN1GXyaxYVeQlJbs=;
 b=LwXDiuT2lfObRnX7NJ6dqZo72mKyvcBs29fowNo920t0tE3My1O43CJpYON+yScsspCx
 yWEU/YeEyBUdlO52Ba7w5Y3FwWBp9X6PxvSdi0HGFMnEbSpSoBNnOAB5rq0mHXgJZzb5
 cjc/MP79o/r3NVyidui6VfwVoZ0uc9V+c33CSqL7XbUB90WwW4S0jojewUW2igJp20GU
 ifJoFB/KB5bnauyiZM9CoLc+k/jNueEYWhAC3vBkgbKzVDAxtwPkgPLDCe6J3JDZxEWL
 +lAx4h+Ux1+UAemjl8iqMdDqc8g1gzyZehRhlZLRllLaGYwmey3FWjr4ulqXK37fV2P0 EQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a76c3qah6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 13:20:20 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 173HIjcw029726;
 Tue, 3 Aug 2021 17:20:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3a4x58yj4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 17:20:18 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 173HHLwk53019082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Aug 2021 17:17:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D777FAE059;
 Tue,  3 Aug 2021 17:20:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A29BAE04D;
 Tue,  3 Aug 2021 17:20:14 +0000 (GMT)
Received: from vm.lan (unknown [9.145.77.113])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Aug 2021 17:20:14 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user/elfload: byteswap i386 registers when dumping core
Date: Tue,  3 Aug 2021 19:20:13 +0200
Message-Id: <20210803172013.148446-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: d0tksr6HrViGTGzBt0jzYi9nH_u3-DQp
X-Proofpoint-GUID: d0tksr6HrViGTGzBt0jzYi9nH_u3-DQp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_05:2021-08-03,
 2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030111
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Ilya Leoshkevich <iii@linux.ibm.com>, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Core dumps from emulating x86_64 on big-endian hosts contain incorrect
register values.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/elfload.c | 88 ++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 42ef2a1148..01e9a833fb 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -172,33 +172,33 @@ typedef target_elf_greg_t  target_elf_gregset_t[ELF_NREG];
  */
 static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *env)
 {
-    (*regs)[0] = env->regs[15];
-    (*regs)[1] = env->regs[14];
-    (*regs)[2] = env->regs[13];
-    (*regs)[3] = env->regs[12];
-    (*regs)[4] = env->regs[R_EBP];
-    (*regs)[5] = env->regs[R_EBX];
-    (*regs)[6] = env->regs[11];
-    (*regs)[7] = env->regs[10];
-    (*regs)[8] = env->regs[9];
-    (*regs)[9] = env->regs[8];
-    (*regs)[10] = env->regs[R_EAX];
-    (*regs)[11] = env->regs[R_ECX];
-    (*regs)[12] = env->regs[R_EDX];
-    (*regs)[13] = env->regs[R_ESI];
-    (*regs)[14] = env->regs[R_EDI];
-    (*regs)[15] = env->regs[R_EAX]; /* XXX */
-    (*regs)[16] = env->eip;
-    (*regs)[17] = env->segs[R_CS].selector & 0xffff;
-    (*regs)[18] = env->eflags;
-    (*regs)[19] = env->regs[R_ESP];
-    (*regs)[20] = env->segs[R_SS].selector & 0xffff;
-    (*regs)[21] = env->segs[R_FS].selector & 0xffff;
-    (*regs)[22] = env->segs[R_GS].selector & 0xffff;
-    (*regs)[23] = env->segs[R_DS].selector & 0xffff;
-    (*regs)[24] = env->segs[R_ES].selector & 0xffff;
-    (*regs)[25] = env->segs[R_FS].selector & 0xffff;
-    (*regs)[26] = env->segs[R_GS].selector & 0xffff;
+    (*regs)[0] = tswapreg(env->regs[15]);
+    (*regs)[1] = tswapreg(env->regs[14]);
+    (*regs)[2] = tswapreg(env->regs[13]);
+    (*regs)[3] = tswapreg(env->regs[12]);
+    (*regs)[4] = tswapreg(env->regs[R_EBP]);
+    (*regs)[5] = tswapreg(env->regs[R_EBX]);
+    (*regs)[6] = tswapreg(env->regs[11]);
+    (*regs)[7] = tswapreg(env->regs[10]);
+    (*regs)[8] = tswapreg(env->regs[9]);
+    (*regs)[9] = tswapreg(env->regs[8]);
+    (*regs)[10] = tswapreg(env->regs[R_EAX]);
+    (*regs)[11] = tswapreg(env->regs[R_ECX]);
+    (*regs)[12] = tswapreg(env->regs[R_EDX]);
+    (*regs)[13] = tswapreg(env->regs[R_ESI]);
+    (*regs)[14] = tswapreg(env->regs[R_EDI]);
+    (*regs)[15] = tswapreg(env->regs[R_EAX]); /* XXX */
+    (*regs)[16] = tswapreg(env->eip);
+    (*regs)[17] = tswapreg(env->segs[R_CS].selector & 0xffff);
+    (*regs)[18] = tswapreg(env->eflags);
+    (*regs)[19] = tswapreg(env->regs[R_ESP]);
+    (*regs)[20] = tswapreg(env->segs[R_SS].selector & 0xffff);
+    (*regs)[21] = tswapreg(env->segs[R_FS].selector & 0xffff);
+    (*regs)[22] = tswapreg(env->segs[R_GS].selector & 0xffff);
+    (*regs)[23] = tswapreg(env->segs[R_DS].selector & 0xffff);
+    (*regs)[24] = tswapreg(env->segs[R_ES].selector & 0xffff);
+    (*regs)[25] = tswapreg(env->segs[R_FS].selector & 0xffff);
+    (*regs)[26] = tswapreg(env->segs[R_GS].selector & 0xffff);
 }
 
 #else
@@ -244,23 +244,23 @@ typedef target_elf_greg_t  target_elf_gregset_t[ELF_NREG];
  */
 static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *env)
 {
-    (*regs)[0] = env->regs[R_EBX];
-    (*regs)[1] = env->regs[R_ECX];
-    (*regs)[2] = env->regs[R_EDX];
-    (*regs)[3] = env->regs[R_ESI];
-    (*regs)[4] = env->regs[R_EDI];
-    (*regs)[5] = env->regs[R_EBP];
-    (*regs)[6] = env->regs[R_EAX];
-    (*regs)[7] = env->segs[R_DS].selector & 0xffff;
-    (*regs)[8] = env->segs[R_ES].selector & 0xffff;
-    (*regs)[9] = env->segs[R_FS].selector & 0xffff;
-    (*regs)[10] = env->segs[R_GS].selector & 0xffff;
-    (*regs)[11] = env->regs[R_EAX]; /* XXX */
-    (*regs)[12] = env->eip;
-    (*regs)[13] = env->segs[R_CS].selector & 0xffff;
-    (*regs)[14] = env->eflags;
-    (*regs)[15] = env->regs[R_ESP];
-    (*regs)[16] = env->segs[R_SS].selector & 0xffff;
+    (*regs)[0] = tswapreg(env->regs[R_EBX]);
+    (*regs)[1] = tswapreg(env->regs[R_ECX]);
+    (*regs)[2] = tswapreg(env->regs[R_EDX]);
+    (*regs)[3] = tswapreg(env->regs[R_ESI]);
+    (*regs)[4] = tswapreg(env->regs[R_EDI]);
+    (*regs)[5] = tswapreg(env->regs[R_EBP]);
+    (*regs)[6] = tswapreg(env->regs[R_EAX]);
+    (*regs)[7] = tswapreg(env->segs[R_DS].selector & 0xffff);
+    (*regs)[8] = tswapreg(env->segs[R_ES].selector & 0xffff);
+    (*regs)[9] = tswapreg(env->segs[R_FS].selector & 0xffff);
+    (*regs)[10] = tswapreg(env->segs[R_GS].selector & 0xffff);
+    (*regs)[11] = tswapreg(env->regs[R_EAX]); /* XXX */
+    (*regs)[12] = tswapreg(env->eip);
+    (*regs)[13] = tswapreg(env->segs[R_CS].selector & 0xffff);
+    (*regs)[14] = tswapreg(env->eflags);
+    (*regs)[15] = tswapreg(env->regs[R_ESP]);
+    (*regs)[16] = tswapreg(env->segs[R_SS].selector & 0xffff);
 }
 #endif
 
-- 
2.31.1


