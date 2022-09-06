Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A45ADC3E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 02:16:27 +0200 (CEST)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVMGQ-0003iw-AG
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 20:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM9Q-0003tD-Mu
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:09:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM9P-0002J2-0D
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:09:12 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285MlvYm021146;
 Tue, 6 Sep 2022 00:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tKrQgj6zNZT8me1fqWZ73d/N0frMlc0M3K02/yCwFLc=;
 b=Vgv2Ijua+7RF3Vz8KZwXJ09NV62Fs52r17vDDpTAcY1JEoeLW5nm+6t21L6vZpUQQCeM
 YXrcorUsz9GcKEhsp+h4dC+WZTgRW3nywi29HPVoJ7fKpZPTRWqQMoHGmyLmiZEiBlN1
 +8euvSjkhrEHxguePwj88Fz9vaYWlJG9xPVPeFokrMAMA21KFMEAe054dmERS2Nedxd7
 qdrW5PpKntJMBtI/3YY5fOkYWSFrPHJfAZuLu31//TiYmnG99TmBRD3vfQYNbS5o2Ge6
 3EACD1w6yQgjwNCG/I8hgsnqrH8XZVdMyV43tt0zmsoI1UpQKOO2IfeHk16vzYRvOYWd hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdt7n1q51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:08 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 285NrRwg010292;
 Tue, 6 Sep 2022 00:09:08 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdt7n1q34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:08 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286066WK010328;
 Tue, 6 Sep 2022 00:09:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3jbxj8u0xp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:04 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 28609Q3q42402138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Sep 2022 00:09:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9637911C050;
 Tue,  6 Sep 2022 00:09:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38B5611C04A;
 Tue,  6 Sep 2022 00:09:02 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.53.58])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Sep 2022 00:09:02 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 3/5] linux-user: Implement stracing madvise()
Date: Tue,  6 Sep 2022 02:08:37 +0200
Message-Id: <20220906000839.1672934-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906000839.1672934-1-iii@linux.ibm.com>
References: <20220906000839.1672934-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 76VIzvxZP-23bsZ64TnQ5U8X92pXU3C_
X-Proofpoint-ORIG-GUID: 61B0M-TIaSwtDEJOD4P28AC6_SIh6_Pt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_16,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050118
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The default implementation has several problems: the first argument is
not displayed as a pointer, making it harder to grep; the third
argument is not symbolized; and there are several extra unused
arguments.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/strace.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 linux-user/strace.list |  2 +-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da..c262c0c9b6 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -17,6 +17,7 @@
 #include "qemu.h"
 #include "user-internals.h"
 #include "strace.h"
+#include "target_mman.h"
 
 struct syscallname {
     int nr;
@@ -2969,6 +2970,46 @@ print_stat(CPUArchState *cpu_env, const struct syscallname *name,
 #define print_lstat64   print_stat
 #endif
 
+#if defined(TARGET_NR_madvise)
+static struct enums madvise_advice[] = {
+    ENUM_TARGET(MADV_NORMAL),
+    ENUM_TARGET(MADV_RANDOM),
+    ENUM_TARGET(MADV_SEQUENTIAL),
+    ENUM_TARGET(MADV_WILLNEED),
+    ENUM_TARGET(MADV_DONTNEED),
+    ENUM_TARGET(MADV_FREE),
+    ENUM_TARGET(MADV_REMOVE),
+    ENUM_TARGET(MADV_DONTFORK),
+    ENUM_TARGET(MADV_DOFORK),
+    ENUM_TARGET(MADV_MERGEABLE),
+    ENUM_TARGET(MADV_UNMERGEABLE),
+    ENUM_TARGET(MADV_HUGEPAGE),
+    ENUM_TARGET(MADV_NOHUGEPAGE),
+    ENUM_TARGET(MADV_DONTDUMP),
+    ENUM_TARGET(MADV_DODUMP),
+    ENUM_TARGET(MADV_WIPEONFORK),
+    ENUM_TARGET(MADV_KEEPONFORK),
+    ENUM_TARGET(MADV_COLD),
+    ENUM_TARGET(MADV_PAGEOUT),
+    ENUM_TARGET(MADV_POPULATE_READ),
+    ENUM_TARGET(MADV_POPULATE_WRITE),
+    ENUM_TARGET(MADV_DONTNEED_LOCKED),
+    ENUM_END,
+};
+
+static void
+print_madvise(CPUArchState *cpu_env, const struct syscallname *name,
+              abi_long arg0, abi_long arg1, abi_long arg2,
+              abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_pointer(arg0, 0);
+    print_raw_param("%d", arg1, 0);
+    print_enums(madvise_advice, arg2, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #if defined(TARGET_NR_fstat) || defined(TARGET_NR_fstat64)
 static void
 print_fstat(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 72e17b1acf..c93effdbc8 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -541,7 +541,7 @@
 { TARGET_NR_lstat64, "lstat64" , NULL, print_lstat64, NULL },
 #endif
 #ifdef TARGET_NR_madvise
-{ TARGET_NR_madvise, "madvise" , NULL, NULL, NULL },
+{ TARGET_NR_madvise, "madvise" , NULL, print_madvise, NULL },
 #endif
 #ifdef TARGET_NR_madvise1
 { TARGET_NR_madvise1, "madvise1" , NULL, NULL, NULL },
-- 
2.37.2


