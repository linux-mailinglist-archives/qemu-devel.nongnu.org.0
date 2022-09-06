Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A208A5ADC4B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 02:19:43 +0200 (CEST)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVMJa-0005FM-Px
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 20:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM9Z-0004CK-3B
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:09:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM9X-0002Jr-5c
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:09:20 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285Nqquj026402;
 Tue, 6 Sep 2022 00:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SJVlNYp2jnCYqwXoOXgMe4CXpegtFcahAJjXjXU3v80=;
 b=phrk6tGfElBteAoDPdnobKYmibDmQoLD7nq6iJEGCwIRZEDMx6lmlLRv5dxe3J0GL6kW
 2mtNd7wSnComs5QY4bTPMvO0XA3SoeD+gChTRwZ6z3dSlahb4VopqiYK0Og6J3iQ/5q+
 IQgVlV1ihekjxQctl5zUpbbCH+Tz37io0pYBogRsk+dNU+n3Goar2i1ATOogPqBBzKEX
 121j0S2xIb8g9UvUE6VRplattxyam0hPXxh/qThBs4ydznI8xkskVgRzZDG/UxDSDCC8
 AZJRsl1xAEQzPyVbCcjl7BKWmWslEipIFsOqrkxEp9UfzKQlUi/i873MhBe+HHs/dRaw YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdu60rfh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:17 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 285NqvON026717;
 Tue, 6 Sep 2022 00:09:16 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdu60rffu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:16 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28606ffJ016399;
 Tue, 6 Sep 2022 00:09:14 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3jbx6hk13c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:14 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28609B8739190918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Sep 2022 00:09:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA6F611C04A;
 Tue,  6 Sep 2022 00:09:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CE3E11C04C;
 Tue,  6 Sep 2022 00:09:11 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.53.58])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Sep 2022 00:09:11 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 5/5] tests/tcg/linux-test: Add linux-madvise test
Date: Tue,  6 Sep 2022 02:08:39 +0200
Message-Id: <20220906000839.1672934-6-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906000839.1672934-1-iii@linux.ibm.com>
References: <20220906000839.1672934-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i5vt7sTOt71Q84e8lzkA2jN3GLLpJNBh
X-Proofpoint-ORIG-GUID: k4ShOq4VMQVUaSO9aVNgsv3r-3AkV3s4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_16,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=948 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add a test that checks madvise(MADV_DONTNEED) behavior with anonymous
and file mappings in order to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/linux/linux-madvise.c | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 tests/tcg/multiarch/linux/linux-madvise.c

diff --git a/tests/tcg/multiarch/linux/linux-madvise.c b/tests/tcg/multiarch/linux/linux-madvise.c
new file mode 100644
index 0000000000..29d0997e68
--- /dev/null
+++ b/tests/tcg/multiarch/linux/linux-madvise.c
@@ -0,0 +1,70 @@
+#include <assert.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+static void test_anonymous(void)
+{
+    int pagesize = getpagesize();
+    char *page;
+    int ret;
+
+    page = mmap(NULL, pagesize, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+    assert(page != MAP_FAILED);
+
+    /* Check that mprotect() does not interfere with MADV_DONTNEED. */
+    ret = mprotect(page, pagesize, PROT_READ | PROT_WRITE);
+    assert(ret == 0);
+
+    /* Check that MADV_DONTNEED clears the page. */
+    *page = 42;
+    ret = madvise(page, pagesize, MADV_DONTNEED);
+    assert(ret == 0);
+    assert(*page == 0);
+
+    ret = munmap(page, pagesize);
+    assert(ret == 0);
+}
+
+static void test_file(void)
+{
+    char tempname[] = "/tmp/.cmadviseXXXXXX";
+    int pagesize = getpagesize();
+    ssize_t written;
+    char c = 42;
+    char *page;
+    int ret;
+    int fd;
+
+    fd = mkstemp(tempname);
+    assert(fd != -1);
+    ret = unlink(tempname);
+    assert(ret == 0);
+    written = write(fd, &c, sizeof(c));
+    assert(written == sizeof(c));
+    page = mmap(NULL, pagesize, PROT_READ, MAP_PRIVATE, fd, 0);
+    assert(page != MAP_FAILED);
+
+    /* Check that mprotect() does not interfere with MADV_DONTNEED. */
+    ret = mprotect(page, pagesize, PROT_READ | PROT_WRITE);
+    assert(ret == 0);
+
+    /* Check that MADV_DONTNEED resets the page. */
+    *page = 0;
+    ret = madvise(page, pagesize, MADV_DONTNEED);
+    assert(ret == 0);
+    assert(*page == c);
+
+    ret = munmap(page, pagesize);
+    assert(ret == 0);
+    ret = close(fd);
+    assert(ret == 0);
+}
+
+int main(void)
+{
+    test_anonymous();
+    test_file();
+
+    return EXIT_SUCCESS;
+}
-- 
2.37.2


