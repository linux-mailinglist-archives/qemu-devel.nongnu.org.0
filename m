Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B06C5ADAF0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 23:41:54 +0200 (CEST)
Received: from localhost ([::1]:56720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJqr-0000Oq-D0
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 17:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVJpp-0007Ih-6x
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:40:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVJpn-00079j-CO
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:40:48 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285LLGx6011741;
 Mon, 5 Sep 2022 21:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=dpsZlPN7OFUiGRkp5xzBQmeeaUNMIB2aJOa95Vavj1g=;
 b=EaKgxwx4Pl7W34oU8zI4jvZDvJGaQfXPJ4bTUmdeCeDHclHBTzyMlQICYbSDHuwhoqoY
 fomRSisaRfd4ALsr4nJ0R2O2yl3lX/iqTXaH5M3Nc796C6f/QYiUI6dopChYZDkl7xqk
 ipNqGzBJQEfA4/QQyUfvgJK0fU4Jmk4Fg9HG8dMMnhAOmMenO6k2US87xuCfaY9CrSXK
 XC5cMjPA34rmVlbCUG7tCWsoOkiyfDMBtNaxjMnd81LFfSZ7Gni+vkXGD2ngQMuJ6bA/
 buRl1lGKPA3zyLxcoT+MEhmkfkqhNfSiW1PLs8XuqPjHFH4JI9A8eKx0BUCH0S7ciqr9 /g== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdrxu0c8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 21:40:45 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 285LYPK3016811;
 Mon, 5 Sep 2022 21:40:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3jbxj8t4p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 21:40:43 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 285LefeJ32047494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Sep 2022 21:40:41 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CB72A405B;
 Mon,  5 Sep 2022 21:40:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1EA4A4054;
 Mon,  5 Sep 2022 21:40:40 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.53.58])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Sep 2022 21:40:40 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2] linux-user: Implement stracing madvise()
Date: Mon,  5 Sep 2022 23:40:39 +0200
Message-Id: <20220905214039.1307142-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8P5V281nyiEVtzaq0YeVHm83Xfqq7MTW
X-Proofpoint-ORIG-GUID: 8P5V281nyiEVtzaq0YeVHm83Xfqq7MTW
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_16,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg04275.html
v1 -> v2: Add all enum values (Richard).

 linux-user/strace.c    | 67 ++++++++++++++++++++++++++++++++++++++++++
 linux-user/strace.list |  2 +-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da..da2ff27512 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -2969,6 +2969,73 @@ print_stat(CPUArchState *cpu_env, const struct syscallname *name,
 #define print_lstat64   print_stat
 #endif
 
+#if defined(TARGET_NR_madvise)
+#define TARGET_MADV_NORMAL 0
+#define TARGET_MADV_RANDOM 1
+#define TARGET_MADV_SEQUENTIAL 2
+#define TARGET_MADV_WILLNEED 3
+#define TARGET_MADV_DONTNEED 4
+#define TARGET_MADV_FREE 8
+#define TARGET_MADV_REMOVE 9
+#define TARGET_MADV_DONTFORK 10
+#define TARGET_MADV_DOFORK 11
+#define TARGET_MADV_HWPOISON 100
+#define TARGET_MADV_SOFT_OFFLINE 101
+#define TARGET_MADV_MERGEABLE 12
+#define TARGET_MADV_UNMERGEABLE 13
+#define TARGET_MADV_HUGEPAGE 14
+#define TARGET_MADV_NOHUGEPAGE 15
+#define TARGET_MADV_DONTDUMP 16
+#define TARGET_MADV_DODUMP 17
+#define TARGET_MADV_WIPEONFORK 18
+#define TARGET_MADV_KEEPONFORK 19
+#define TARGET_MADV_COLD 20
+#define TARGET_MADV_PAGEOUT 21
+#define TARGET_MADV_POPULATE_READ 22
+#define TARGET_MADV_POPULATE_WRITE 23
+#define TARGET_MADV_DONTNEED_LOCKED 24
+
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
+    ENUM_TARGET(MADV_HWPOISON),
+    ENUM_TARGET(MADV_SOFT_OFFLINE),
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


