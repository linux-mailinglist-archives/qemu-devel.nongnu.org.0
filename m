Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F1F6A1390
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:13:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKkj-0002aL-5Z; Thu, 23 Feb 2023 18:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVKkh-0002T5-Av
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:11:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVKkf-0007YN-IQ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:11:51 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NKL64Y026092; Thu, 23 Feb 2023 23:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IPuHGGppJaOR5wlzZQlRKGYz41DCto29sIhDuCPXiRU=;
 b=IZO+6kIPTk1Gzsp4t8y8oh4QqQU9C/LJBYYjKWMr8r6Mj7WLto82cl5jrEWEwHxLBH96
 4V9zCUAvDdirVDsinm0zpZHAuWhmgnmjXQW8ihoHIcsjMrDEYS5FDHrh9ArEPhKz4shh
 iMPvhkHYbiDO+ATpNNG5yWJbp/hllPkX741H3eSt3cING+CUkOgI4VhUAqMiAZOATHdD
 zA0IksQEzaVbm0bTnvf5wtPxJ/Wh21rfqyOOspQXWtUMNSnxEOLJFL08qTvDbxyjueZG
 2PYTdXIvmvdVB1fKIsmHTJBpblgU/GbtBL4viQ6QADeWKAzlonGAA7CsMXWdb/a0bXUg 0Q== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nxf3m3vbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 23:11:47 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31N86v53016606;
 Thu, 23 Feb 2023 23:11:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa6f93b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 23:11:46 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31NNBgKD35062128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 23:11:42 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 903C420040;
 Thu, 23 Feb 2023 23:11:42 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 167742004E;
 Thu, 23 Feb 2023 23:11:42 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.17.238])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Feb 2023 23:11:41 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/2] linux-user: Fix unaligned memory access in prlimit64
 syscall
Date: Fri, 24 Feb 2023 00:11:36 +0100
Message-Id: <20230223231137.186344-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223231137.186344-1-iii@linux.ibm.com>
References: <20230223231137.186344-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: duh2l7SPeuaWZqjBX524ErEzrTrSQ3F8
X-Proofpoint-ORIG-GUID: duh2l7SPeuaWZqjBX524ErEzrTrSQ3F8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230192
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

target_rlimit64 contains uint64_t fields, so it's 8-byte aligned on
some hosts, while some guests may align their respective type on a
4-byte boundary. This may lead to an unaligned access, which is an UB.

Fix by defining the fields as abi_ullong. This makes the host alignment
match that of the guest, and lets the compiler know that it should emit
code that can deal with the guest alignment.

While at it, also use __get_user() and __put_user() instead of
tswap64().

Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/generic/target_resource.h | 4 ++--
 linux-user/syscall.c                 | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
index 539d8c46772..37d3eb09b3b 100644
--- a/linux-user/generic/target_resource.h
+++ b/linux-user/generic/target_resource.h
@@ -12,8 +12,8 @@ struct target_rlimit {
 };
 
 struct target_rlimit64 {
-    uint64_t rlim_cur;
-    uint64_t rlim_max;
+    abi_ullong rlim_cur;
+    abi_ullong rlim_max;
 };
 
 #define TARGET_RLIM_INFINITY    ((abi_ulong)-1)
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a6c426d73cf..1f7a272799b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12886,8 +12886,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!lock_user_struct(VERIFY_READ, target_rnew, arg3, 1)) {
                 return -TARGET_EFAULT;
             }
-            rnew.rlim_cur = tswap64(target_rnew->rlim_cur);
-            rnew.rlim_max = tswap64(target_rnew->rlim_max);
+            __get_user(rnew.rlim_cur, &target_rnew->rlim_cur);
+            __get_user(rnew.rlim_max, &target_rnew->rlim_max);
             unlock_user_struct(target_rnew, arg3, 0);
             rnewp = &rnew;
         }
@@ -12897,8 +12897,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!lock_user_struct(VERIFY_WRITE, target_rold, arg4, 1)) {
                 return -TARGET_EFAULT;
             }
-            target_rold->rlim_cur = tswap64(rold.rlim_cur);
-            target_rold->rlim_max = tswap64(rold.rlim_max);
+            __put_user(target_rold->rlim_cur, &rold.rlim_cur);
+            __put_user(target_rold->rlim_max, &rold.rlim_max);
             unlock_user_struct(target_rold, arg4, 1);
         }
         return ret;
-- 
2.39.1


