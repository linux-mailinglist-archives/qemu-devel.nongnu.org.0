Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0056A1274
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:59:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJc8-00075V-G9; Thu, 23 Feb 2023 16:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVJc4-00072b-J5
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:58:52 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVJc1-0002Fm-0o
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:58:52 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NKL88D026136; Thu, 23 Feb 2023 21:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=G/ynAq+gVEDic/LEXIjGQywDL7mnx0doz9rgeqWvxmQ=;
 b=UGjhQOXwML7hv/MPlqnMN6sjhNd3/CI8NpHJKBe/WasDENsbfzPRyx4O89dbe6Kmu/K2
 Jf/IBYQ3s9BgwWWjdNxBILiy1i5L72U74Fa3QGgcSaIoiCHs1CdR5mk0uYWR1kUS/WM7
 oib3jMtJgY/pUtFov5fnV5iQA1I4y1jN+DACO+Pey/6hbgpVeHmg/4BMLxjnN3IGqr1R
 86yiGpobI06ZTwfml9j20NfDJOZP1lP5Z6F6lR02aztrFzDuSX/e6rHLLm3ynhX7PC27
 cSrH3Xzbzo460UOSGuqczk8E3c7rKpO3kMm4aABFQtTSfnH6L0s+9sW4g9K/MeFR85si Jg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nxf3m29kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 21:58:45 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31N7VYIZ007325;
 Thu, 23 Feb 2023 21:58:43 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa6f6ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 21:58:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31NLwdxA48824748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 21:58:40 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D625320043;
 Thu, 23 Feb 2023 21:58:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AC7820040;
 Thu, 23 Feb 2023 21:58:39 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.17.238])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Feb 2023 21:58:39 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 1/2] linux-user: Fix unaligned memory access in prlimit64
 syscall
Date: Thu, 23 Feb 2023 22:58:33 +0100
Message-Id: <20230223215834.166055-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223215834.166055-1-iii@linux.ibm.com>
References: <20230223215834.166055-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x-AxAy72TBbyiLoB6Qb7itrY4_9wnZrs
X-Proofpoint-ORIG-GUID: x-AxAy72TBbyiLoB6Qb7itrY4_9wnZrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230177
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

32-bit guests may enforce only 4-byte alignment for target_rlimit64,
whereas 64-bit hosts normally require the 8-byte one. Therefore
accessing this struct directly is UB.

Fix by adding a local copy.

Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/syscall.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a6c426d73cf..8ae7696d8f1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12876,7 +12876,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
     case TARGET_NR_prlimit64:
     {
         /* args: pid, resource number, ptr to new rlimit, ptr to old rlimit */
-        struct target_rlimit64 *target_rnew, *target_rold;
+        struct target_rlimit64 *target_rnew, *target_rold, tmp;
         struct host_rlimit64 rnew, rold, *rnewp = 0;
         int resource = target_to_host_resource(arg2);
 
@@ -12886,8 +12886,9 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!lock_user_struct(VERIFY_READ, target_rnew, arg3, 1)) {
                 return -TARGET_EFAULT;
             }
-            rnew.rlim_cur = tswap64(target_rnew->rlim_cur);
-            rnew.rlim_max = tswap64(target_rnew->rlim_max);
+            memcpy(&tmp, target_rnew, sizeof(tmp));
+            rnew.rlim_cur = tswap64(tmp.rlim_cur);
+            rnew.rlim_max = tswap64(tmp.rlim_max);
             unlock_user_struct(target_rnew, arg3, 0);
             rnewp = &rnew;
         }
@@ -12897,8 +12898,9 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!lock_user_struct(VERIFY_WRITE, target_rold, arg4, 1)) {
                 return -TARGET_EFAULT;
             }
-            target_rold->rlim_cur = tswap64(rold.rlim_cur);
-            target_rold->rlim_max = tswap64(rold.rlim_max);
+            tmp.rlim_cur = tswap64(rold.rlim_cur);
+            tmp.rlim_max = tswap64(rold.rlim_max);
+            memcpy(target_rold, &tmp, sizeof(*target_rold));
             unlock_user_struct(target_rold, arg4, 1);
         }
         return ret;
-- 
2.39.1


