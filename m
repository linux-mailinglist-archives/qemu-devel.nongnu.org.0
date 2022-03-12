Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603854D6DCF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 10:42:26 +0100 (CET)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSyGX-0005yE-Gc
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 04:42:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSy0a-0002b7-4c; Sat, 12 Mar 2022 04:25:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSy0X-0007Kb-GL; Sat, 12 Mar 2022 04:25:55 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22C4UpLZ033108; 
 Sat, 12 Mar 2022 09:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ngw1impbu8n/ZD4Xz7jexcCiHbSSv7thee+WGIqW5o4=;
 b=C5k2bkHWkZA4uAPtVlL85a4uessC3EEUoysWAe6dN9sPGVUoyp9iVG/U5/Tw+mgaddPC
 W/CHjhpYaUJ9R09p0nhwkhRVZsNF3501KmUiIuSo0L0mntPbpS1kQ6iyyGnsjQ2C5g32
 vSRCTE3cC1XqGaCKRiljn9dioSAjc1X94h0ff9a0S8XNN6NcnewtXmsASVaYYrKVvMC9
 8fLkDOzwG/qQWU8HY9aO8VorpJsG4xVUOuHkYgcn5XXBm/L5h6jx24nRyH/J2pPswNNQ
 +0r/Qr5BcWR8zmisJMGVj2eCFZovFKXPHmKUT4TVT9jS8KLntb9vIJPYfeJ23SIWURT0 Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3erjtqm8wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:51 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22C9AtRc016480;
 Sat, 12 Mar 2022 09:25:51 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3erjtqm8wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22C9DsZx018670;
 Sat, 12 Mar 2022 09:25:49 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3erjshghsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22C9PkfJ15466986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Mar 2022 09:25:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F93042045;
 Sat, 12 Mar 2022 09:25:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D06DA4203F;
 Sat, 12 Mar 2022 09:25:45 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.29.97])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 12 Mar 2022 09:25:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 3/3] tests/tcg/s390x: Test BRASL and BRCL with large
 negative offsets
Date: Sat, 12 Mar 2022 10:25:41 +0100
Message-Id: <20220312092541.585282-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312092541.585282-1-iii@linux.ibm.com>
References: <20220312092541.585282-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1mbpldh854xoPBeS2AJGs0xPmS4T1d6b
X-Proofpoint-GUID: IR_MWrB6Uxx_WcwI-WJ1fNiFv-DZx96F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-12_03,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203120053
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a small test in order to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target        |  1 +
 tests/tcg/s390x/branch-relative-long.c | 60 ++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 tests/tcg/s390x/branch-relative-long.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 257c568c58..fd34b130f7 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -15,6 +15,7 @@ TESTS+=mvc
 TESTS+=shift
 TESTS+=trap
 TESTS+=signals-s390x
+TESTS+=branch-relative-long
 
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
diff --git a/tests/tcg/s390x/branch-relative-long.c b/tests/tcg/s390x/branch-relative-long.c
new file mode 100644
index 0000000000..c6f3f2db6d
--- /dev/null
+++ b/tests/tcg/s390x/branch-relative-long.c
@@ -0,0 +1,60 @@
+#include <stddef.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mman.h>
+
+#define DEFINE_ASM(_name, _code) \
+    extern const char _name[]; \
+    extern const char _name ## _end[]; \
+    asm("    .globl " #_name "\n" \
+        #_name ":\n" \
+        "    " _code "\n" \
+        "    .globl " #_name "_end\n" \
+        #_name "_end:\n");
+
+DEFINE_ASM(br_r14, "br %r14");
+DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
+DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
+
+struct test {
+    const char *code;
+    const char *code_end;
+};
+
+static const struct test tests[] = {
+    {
+        .code = brasl_r0,
+        .code_end = brasl_r0_end,
+    },
+    {
+        .code = brcl_0xf,
+        .code_end = brcl_0xf_end,
+    },
+};
+
+int main(void)
+{
+    size_t length = 0x100000006;
+    unsigned char *buf;
+    void (*code)(void);
+    size_t i;
+
+    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
+               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (buf == MAP_FAILED) {
+        perror("SKIP: mmap() failed");
+        return 0;
+    }
+
+    memcpy(buf, br_r14, br_r14_end - br_r14);
+    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
+        code = (void *)(buf + 0x100000000);
+        memcpy(code, tests[i].code, tests[i].code_end - tests[i].code);
+        code();
+        memset(code, 0, tests[i].code_end - tests[i].code);
+    }
+
+    munmap(buf, length);
+
+    return 0;
+}
-- 
2.35.1


