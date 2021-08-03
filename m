Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073143DF3D3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 19:20:23 +0200 (CEST)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAy5W-0006NS-1R
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 13:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mAy4M-0005Xg-7w
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 13:19:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mAy4K-0005Ph-BN
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 13:19:09 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173H2tUL142862; Tue, 3 Aug 2021 13:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lOWpG1wmsZcvPBF5QghtQDEN4ZDpI+tg8Ryb3PSefls=;
 b=bT5pBNsHhmM3J4wfcZF6OCjjiVtow8J5e02r8HA9CzSI2ALYmFl5licuf6FaERva3TkY
 PZfwAeLpLHI1x3bFXNOUSTIL2/F0MBcrg2ES0JP8qnsNZ01Qda6bVRHyfr1IVjvcJ9cI
 T/v3rfxTn2G4rFGhwwtJsWE/QIoxVoQLAj4cNYzdmwf01ZJQTQTTmrxayY90fIEN7p0j
 7YqklCyxlH9hQJOaovWRynpsEO9eCsXaxYqVMln1jBEmYgiedhXP7kDryq9RaHWVj6iP
 AAz0C5lrimwSbK6v0vaZvMZJUZfDk7jWAcjtgQh4LKLcNK+GY/LC8GtQkOsfsIaUdV3o JA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a76c3q9fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 13:19:05 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 173HIJvN005706;
 Tue, 3 Aug 2021 17:19:03 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3a4x596s70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 17:19:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 173HJ0Xc51773760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Aug 2021 17:19:00 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BCC7A4054;
 Tue,  3 Aug 2021 17:19:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7AF3A405C;
 Tue,  3 Aug 2021 17:18:59 +0000 (GMT)
Received: from vm.lan (unknown [9.145.77.113])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Aug 2021 17:18:59 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: fix guest/host address mixup in i386
 setup_rt_frame()
Date: Tue,  3 Aug 2021 19:18:58 +0200
Message-Id: <20210803171858.148394-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GyuCuR99D82YjLn6REv-1Y2-Rm0KSThK
X-Proofpoint-GUID: GyuCuR99D82YjLn6REv-1Y2-Rm0KSThK
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

setup_rt_frame() passes siginfo and ucontext host addresses to guest
signal handlers, causing problems when e.g. emulating x86_64 on s390x.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/i386/signal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 8701774e37..841cd19651 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -436,13 +436,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
 #ifndef TARGET_X86_64
     env->regs[R_EAX] = sig;
-    env->regs[R_EDX] = (unsigned long)&frame->info;
-    env->regs[R_ECX] = (unsigned long)&frame->uc;
+    env->regs[R_EDX] = frame_addr + offsetof(struct rt_sigframe, info);
+    env->regs[R_ECX] = frame_addr + offsetof(struct rt_sigframe, uc);
 #else
     env->regs[R_EAX] = 0;
     env->regs[R_EDI] = sig;
-    env->regs[R_ESI] = (unsigned long)&frame->info;
-    env->regs[R_EDX] = (unsigned long)&frame->uc;
+    env->regs[R_ESI] = frame_addr + offsetof(struct rt_sigframe, info);
+    env->regs[R_EDX] = frame_addr + offsetof(struct rt_sigframe, uc);
 #endif
 
     cpu_x86_load_seg(env, R_DS, __USER_DS);
-- 
2.31.1


