Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F266BA39A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 00:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcEAw-0003Km-7A; Tue, 14 Mar 2023 19:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcEAn-0003Cb-J5; Tue, 14 Mar 2023 19:35:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcEAk-0002NV-Mi; Tue, 14 Mar 2023 19:35:17 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ENDRmg027112; Tue, 14 Mar 2023 23:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oTgi4gnd8v8PGc3AKinDD+gYA6dt4NSbD7p5qF7Kcuo=;
 b=IDgLr94HJZ+2hjsOlFdbty62yjKe2CK1V0PN6ZQVstGSdWOU+ewj2zdyIHoBbfBPrja3
 wUR0mQKXCa4/c2gYo3uGqLis9XyJRiyFJCtqVuZg+I2Lc2sd2dBZkRFMF3ICK9dv+POi
 Ty7ie1siwaib4XRSd+UNNko9SYkM+9beBq85GxMxEq/i9GEg7ooqU7oKj5+NBNuEgCJL
 7yUW1mZhBKMhc6c0Ol943LNS0LOe/cgU/LqFt9MhYpL7977aPfjJgevtja49b01EaqLs
 DqgmGzBlgTpKvPHcBC2C3hkhgI2U57Q8sdCCLBy1gIi+bfTe4zCE0c8iLGBvKDtvNF+7 oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb2df0d4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 23:35:12 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ENESnq030858;
 Tue, 14 Mar 2023 23:35:12 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb2df0d43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 23:35:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN5elQ008595;
 Tue, 14 Mar 2023 23:35:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pb29sg0ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 23:35:10 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32ENZ8Fq23855686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Mar 2023 23:35:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ECF72004B;
 Tue, 14 Mar 2023 23:35:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D476B20040;
 Tue, 14 Mar 2023 23:35:07 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.45.154])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Mar 2023 23:35:07 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/2] tests/tcg/s390x: Add rxsbg.c
Date: Wed, 15 Mar 2023 00:34:43 +0100
Message-Id: <20230314233443.324727-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314233443.324727-1-iii@linux.ibm.com>
References: <20230314233443.324727-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uwXPYyG55fcHCI7MDFa_svQuedlpOrwP
X-Proofpoint-ORIG-GUID: WgBJubdH1JljcBMPLGRTHx92imb-pzsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015
 phishscore=0 mlxlogscore=887 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303140189
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

Add a small test for RXSBG with T=1 to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target |  1 +
 tests/tcg/s390x/rxsbg.c         | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 tests/tcg/s390x/rxsbg.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index cf93b966862..b4d0d704534 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -29,6 +29,7 @@ TESTS+=clst
 TESTS+=long-double
 TESTS+=cdsg
 TESTS+=chrl
+TESTS+=rxsbg
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
diff --git a/tests/tcg/s390x/rxsbg.c b/tests/tcg/s390x/rxsbg.c
new file mode 100644
index 00000000000..b7f35411899
--- /dev/null
+++ b/tests/tcg/s390x/rxsbg.c
@@ -0,0 +1,25 @@
+/*
+ * Smoke test RXSBG instruction with T=1.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <stdlib.h>
+
+int main(void)
+{
+    unsigned long r1, r2, cc;
+
+    r1 = 0xc8dc86a225a77bb4;
+    r2 = 0xd6aff24fa3e7320;
+    cc = 0;
+    asm("rxsbg %[r1],%[r2],177,43,228\n"
+        "ipm %[cc]"
+        : [cc] "+r" (cc)
+        : [r1] "r" (r1)
+        , [r2] "r" (r2)
+        : "cc");
+    cc = (cc >> 28) & 1;
+    assert(cc == 1);
+
+    return EXIT_SUCCESS;
+}
-- 
2.39.2


