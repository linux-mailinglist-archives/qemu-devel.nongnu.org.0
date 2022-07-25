Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1176E5800C9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:32:45 +0200 (CEST)
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFz8V-0004YB-MQ
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oFz50-0001fL-1e
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:29:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oFz4x-00042Z-Mb
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:29:05 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PECOQZ015546;
 Mon, 25 Jul 2022 14:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=37c9+hO6LBgpz3ru9HTjgiFIqqDQLhr6MCysafOjqRI=;
 b=ppcDZ6BlNI+PApoYVo1tf21fQT3y/Pi8C2JlZrLT3XT7EjJPJRR1PzHG1nTeNzaJr6Tb
 ezenyNiAD7NjXvC0gSDrOjEZbuEf6kNabPwNnamVwvBIvU9hurhaP+dMh4B7r29sH2ZL
 9lUZXHyMghDMm80vxAvCZqszJK3uFGZN4FcLSNp2GSWoR8WvVdFypZw37/CIB0U9hq03
 mkLo9Aqc+Xs2HAOVVXpRfCfgijaIbf0GahQsG9bURh5X10UT/FrQ+WIT2ae1AbF4dcRs
 eHxjn8otjYisBwu7OmPChCd+OgwbpA//NT0u0SBVeKK1RM1+16YQ1nwbpYZ5CZevp8nG Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhvqrrjtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 14:29:01 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26PEDPMT017832;
 Mon, 25 Jul 2022 14:29:01 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhvqrrjsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 14:29:01 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26PENLqA002848;
 Mon, 25 Jul 2022 14:28:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3hg96wjjrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 14:28:58 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26PEQwn418350516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 14:26:58 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66C3CA405B;
 Mon, 25 Jul 2022 14:28:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B1A1A4054;
 Mon, 25 Jul 2022 14:28:55 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.40.49])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jul 2022 14:28:55 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] target/sh4: Honor QEMU_LOG_FILENAME with QEMU_LOG=cpu
Date: Mon, 25 Jul 2022 16:28:54 +0200
Message-Id: <20220725142854.177451-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c2Amv1C5Flez3aIMh9hO0M4LYmgcxZQ8
X-Proofpoint-GUID: 71qTcRtdsEWL9tRJjHEGgir3mPOj5hoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_09,2022-07-25_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1011 mlxscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250059
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

When using QEMU_LOG=cpu on sh4, QEMU_LOG_FILENAME is partially ignored.
Fix by using qemu_fprintf() instead of qemu_printf() in the respective
places.

Fixes: 90c84c560067 ("qom/cpu: Simplify how CPUClass:cpu_dump_state() prints")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/sh4/translate.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index f1b190e7cf..9aadaf52cd 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -171,16 +171,16 @@ void superh_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "sgr=0x%08x dbr=0x%08x delayed_pc=0x%08x fpul=0x%08x\n",
                  env->sgr, env->dbr, env->delayed_pc, env->fpul);
     for (i = 0; i < 24; i += 4) {
-        qemu_printf("r%d=0x%08x r%d=0x%08x r%d=0x%08x r%d=0x%08x\n",
-		    i, env->gregs[i], i + 1, env->gregs[i + 1],
-		    i + 2, env->gregs[i + 2], i + 3, env->gregs[i + 3]);
+        qemu_fprintf(f, "r%d=0x%08x r%d=0x%08x r%d=0x%08x r%d=0x%08x\n",
+                     i, env->gregs[i], i + 1, env->gregs[i + 1],
+                     i + 2, env->gregs[i + 2], i + 3, env->gregs[i + 3]);
     }
     if (env->flags & DELAY_SLOT) {
-        qemu_printf("in delay slot (delayed_pc=0x%08x)\n",
-		    env->delayed_pc);
+        qemu_fprintf(f, "in delay slot (delayed_pc=0x%08x)\n",
+                     env->delayed_pc);
     } else if (env->flags & DELAY_SLOT_CONDITIONAL) {
-        qemu_printf("in conditional delay slot (delayed_pc=0x%08x)\n",
-		    env->delayed_pc);
+        qemu_fprintf(f, "in conditional delay slot (delayed_pc=0x%08x)\n",
+                     env->delayed_pc);
     } else if (env->flags & DELAY_SLOT_RTE) {
         qemu_fprintf(f, "in rte delay slot (delayed_pc=0x%08x)\n",
                      env->delayed_pc);
-- 
2.35.3


