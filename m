Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52D388645
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 06:59:29 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljEIp-0005Nu-Jd
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 00:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ljEHJ-0003Cs-L7
 for qemu-devel@nongnu.org; Wed, 19 May 2021 00:57:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14042
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ljEHF-0001S9-F8
 for qemu-devel@nongnu.org; Wed, 19 May 2021 00:57:53 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14J4jENq084794; Wed, 19 May 2021 00:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6EDfo3BOWC1E+h8Xf69hMQ6X5QGy5KbBy7Bg23k+I5I=;
 b=sgC3WJdnUakOQyw7sKEgTYSlHsjVOPrrp4HhLeza7nXAJQ/Sx+bILvlP8nc5i5lYf45K
 gDncPJjRSQx68KQZrMBF+zjGlrcnoA7xUjBWOGqWCToG6RbgZVGg+j1pNAyffB2nSUnt
 0qScTcuwSZrfGPGZqPtzi8fORaYpDtK4sRiA9yInOm2Is5kNCDXEsxItfqqHpbMCZ1Dy
 oezXEHTyfajLAYbbJ87lQF4Kbq0ICQSt/5t8VMwy+IIHrAzuOddcvZE7hi7I53YYN9hy
 +cL3uLCx6A4cVQMAoSMS71oJsdr6HOpTsqj1PybsJ5dJkBmSTIWlUQX0/pd+ZAFVSn1D cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38muwv06a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 00:57:47 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14J4qJ64111804;
 Wed, 19 May 2021 00:57:47 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38muwv069m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 00:57:47 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14J4vHEt016679;
 Wed, 19 May 2021 04:57:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 38j5jgsugg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 04:57:45 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14J4vgb925362932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 04:57:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D48452052;
 Wed, 19 May 2021 04:57:42 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9EA915204F;
 Wed, 19 May 2021 04:57:41 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v2 2/2] tests/tcg/x86_64: add vsyscall smoke test
Date: Wed, 19 May 2021 06:57:38 +0200
Message-Id: <20210519045738.1335210-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519045738.1335210-1-iii@linux.ibm.com>
References: <20210519045738.1335210-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eVcUZ2bcFN8w0HLWWrcZns_PxHbXEz73
X-Proofpoint-ORIG-GUID: dCACPYtDd_C-uMbhqDeWeibMXFyRxiaw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_01:2021-05-18,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190033
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having a small test will prevent trivial regressions in the future.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/x86_64/Makefile.target |  6 +++++-
 tests/tcg/x86_64/vsyscall.c      | 12 ++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/x86_64/vsyscall.c

diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 20bf96202a..2151ea6302 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -3,14 +3,18 @@
 # x86_64 tests - included from tests/tcg/Makefile.target
 #
 # Currently we only build test-x86_64 and test-i386-ssse3 from
-# $(SRC)/tests/tcg/i386/
+# $(SRC_PATH)/tests/tcg/i386/
 #
 
 include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 
+X86_64_TESTS += vsyscall
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 QEMU_OPTS += -cpu max
 
 test-x86_64: LDFLAGS+=-lm -lc
 test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+
+vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
+	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
diff --git a/tests/tcg/x86_64/vsyscall.c b/tests/tcg/x86_64/vsyscall.c
new file mode 100644
index 0000000000..786b047053
--- /dev/null
+++ b/tests/tcg/x86_64/vsyscall.c
@@ -0,0 +1,12 @@
+#include <stdio.h>
+#include <time.h>
+
+#define VSYSCALL_PAGE 0xffffffffff600000
+#define TIME_OFFSET 0x400
+typedef time_t (*time_func)(time_t *);
+
+int main(void)
+{
+    printf("%ld\n", ((time_func)(VSYSCALL_PAGE + TIME_OFFSET))(NULL));
+    return 0;
+}
-- 
2.31.1


