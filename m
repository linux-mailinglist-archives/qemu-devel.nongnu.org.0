Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5326BC2D7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 01:34:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcbZj-0002r1-9T; Wed, 15 Mar 2023 20:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pcbZg-0002qF-H2
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:34:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pcbZe-000070-9P
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:34:32 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FMWDEW024391; Thu, 16 Mar 2023 00:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=dVSyntriDL92wsOjFQcRl1pSq9UrHeH+DAEvjG0D+Ss=;
 b=NnJWJShlDJCLGTgsgx8z0ajLYtNpQooPv5svHJ46/aBfTUL2GmKGK8ohF3QTyp5ab8uh
 D2Ci5SjypcdaYdti2FwFlzyT4CtPfkDTG36ZppIrlMXm0UjAtTVzLZbtAKmCkLT51quJ
 7wQTDjgesKXQSleakDhw96nbevuuOIb3/AKFwwzI0mFEf75528ZArslEo5/pmDlvNl1r
 o4TePwUDrp5B88GnOn8sXIrx5LJ0c6U0xHq5FaqVcJIGr/YU+VL0HLP6fmgeEbG4IK7R
 1z6SVqVODlVTEvL5mmp1KVZqdjKPH20TE7Y7MUKn2h4CrLRb9rEwyZRs7qxrUOAw1YhO iQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpw9t4t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 00:34:27 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32FKKUKF006944;
 Thu, 16 Mar 2023 00:34:25 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3pbmyh055j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 00:34:25 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32G0YMiY47120846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 00:34:23 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E06AA20040;
 Thu, 16 Mar 2023 00:34:22 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62EF12004B;
 Thu, 16 Mar 2023 00:34:22 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.19.28])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 00:34:22 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2] target/sh4: Honor QEMU_LOG_FILENAME with QEMU_LOG=cpu
Date: Thu, 16 Mar 2023 01:34:11 +0100
Message-Id: <20230316003411.129462-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WBO04LZJtOzMaCY-rNvlb_twI2z__fpg
X-Proofpoint-ORIG-GUID: WBO04LZJtOzMaCY-rNvlb_twI2z__fpg
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160003
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When using QEMU_LOG=cpu on sh4, QEMU_LOG_FILENAME is partially ignored.
Fix by using qemu_fprintf() instead of qemu_printf() in the respective
places.

Fixes: 90c84c560067 ("qom/cpu: Simplify how CPUClass:cpu_dump_state() prints")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---

Resend of https://patchew.org/QEMU/20220725142854.177451-1-iii@linux.ibm.com/
with a trivial rebase.

 target/sh4/translate.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 97da8bce488..6e40d5dd6a1 100644
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
     if (env->flags & TB_FLAG_DELAY_SLOT) {
-        qemu_printf("in delay slot (delayed_pc=0x%08x)\n",
-		    env->delayed_pc);
+        qemu_fprintf(f, "in delay slot (delayed_pc=0x%08x)\n",
+                     env->delayed_pc);
     } else if (env->flags & TB_FLAG_DELAY_SLOT_COND) {
-        qemu_printf("in conditional delay slot (delayed_pc=0x%08x)\n",
-		    env->delayed_pc);
+        qemu_fprintf(f, "in conditional delay slot (delayed_pc=0x%08x)\n",
+                     env->delayed_pc);
     } else if (env->flags & TB_FLAG_DELAY_SLOT_RTE) {
         qemu_fprintf(f, "in rte delay slot (delayed_pc=0x%08x)\n",
                      env->delayed_pc);
-- 
2.39.2


