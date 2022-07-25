Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EBD580028
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 15:49:37 +0200 (CEST)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFySl-00020X-LY
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 09:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oFyOB-0006NY-ES
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:44:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oFyO9-00052b-KL
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:44:51 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PDBvYH011622;
 Mon, 25 Jul 2022 13:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Pz/gTj+4Dq/VaCqzBApevJOS1bfX/1mQPspzCYtHoBo=;
 b=Pw0ZVrGgO+1TaPv7Bkb5ddf8qnCsUG7o1ZEmwcQQTAfV2tlegYGWB2bk5j3nMulx5/Iz
 RYdESyPkGF72SbmRirTE5V1T/BHmEpogqXaovnF/LZwSwIJWkeNFssMIUCeuBU2eEn1J
 UdnK7JA1Ztm7fgcKrfZubwzzm4S3n3qnYh3zxogdejmtwIdXzXVo2VDwTuCTc0ahq5hP
 pGbWOICxfV1Mk/WYtiEt93iE1eEIHZu840G6JfsYcWuKb9Ms8ehqDphc1ODX09NHCE80
 Y3SxqjyHWuZwrw5lz7pptzGyi8oT6GFeOUkJy88NWa25+GXppq5UQl+/sVdExqkiM8yc lA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhuue99bu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 13:44:47 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26PDZYh8029950;
 Mon, 25 Jul 2022 13:44:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3hg96wjh7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 13:44:45 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26PDigIN22479180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 13:44:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25308AE04D;
 Mon, 25 Jul 2022 13:44:42 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D444AAE045;
 Mon, 25 Jul 2022 13:44:41 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.40.49])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jul 2022 13:44:41 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] linux-user: Implement stracing madvise()
Date: Mon, 25 Jul 2022 15:44:40 +0200
Message-Id: <20220725134440.172892-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tBwA17oCUjUVjs9TQh8AtxA5STrneg-l
X-Proofpoint-ORIG-GUID: tBwA17oCUjUVjs9TQh8AtxA5STrneg-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_09,2022-07-25_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207250057
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
 linux-user/strace.c    | 29 +++++++++++++++++++++++++++++
 linux-user/strace.list |  2 +-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da..32a6987844 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -2969,6 +2969,35 @@ print_stat(CPUArchState *cpu_env, const struct syscallname *name,
 #define print_lstat64   print_stat
 #endif
 
+#if defined(TARGET_NR_madvise)
+#define TARGET_MADV_NORMAL 0
+#define TARGET_MADV_RANDOM 1
+#define TARGET_MADV_SEQUENTIAL 2
+#define TARGET_MADV_WILLNEED 3
+#define TARGET_MADV_DONTNEED 4
+
+static struct enums madvise_advice[] = {
+    ENUM_TARGET(MADV_NORMAL),
+    ENUM_TARGET(MADV_RANDOM),
+    ENUM_TARGET(MADV_SEQUENTIAL),
+    ENUM_TARGET(MADV_WILLNEED),
+    ENUM_TARGET(MADV_DONTNEED),
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
2.35.3


