Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A23264AB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 16:24:36 +0100 (CET)
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFeyp-0007ju-AM
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 10:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lFevr-0006BM-NU
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:21:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lFevh-0002D1-E6
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:21:31 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QF3IRt122671; Fri, 26 Feb 2021 10:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/iMRn/McA6+WGpc+bqk/ahlX6ss1vm5Jp5sa6NNXD78=;
 b=frS5F7bUAJ4TsTMTGYnjRlu9UJEg1wrsbfb3mYrCNeoQqo76CDgjM2YOCATsSws3KJJk
 Ot3dFXbeqLP6kEy9g30KevIHewUiFQKzK01nZ/5lDphFaA9K3pzwECKHuu6UeYsUIkwt
 lHW6HCgrdJYX/OoFaqktMyik7M8nR2UghaZl6GwNnLAgKVqQ5y/h77Rj0V5mR1qSp2oY
 xWCga8RihfcsAaxltUJT/J5O+B+RQtOxj5m2b5V+MXQfIzuF2WcvrVQw6Ya0oV/HC6fA
 uXd/U9ewc9eeYMk59nGXw60k389MjiQneiGcV6RcQAsEmvvU457kqLSm1qbQ5l9T1hZ2 aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xx5u9et8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 10:21:18 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11QF3aEV123500;
 Fri, 26 Feb 2021 10:21:18 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xx5u9esu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 10:21:18 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11QFCIfj027315;
 Fri, 26 Feb 2021 15:21:17 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 36tt2a7gx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 15:21:17 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11QFLGSi30212578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 15:21:16 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAEEA1376C2;
 Fri, 26 Feb 2021 15:21:15 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 566D11376C3;
 Fri, 26 Feb 2021 15:21:15 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Feb 2021 15:21:15 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] gitlab-ci.yml: Add jobs to test CFI flags
Date: Fri, 26 Feb 2021 10:21:08 -0500
Message-Id: <20210226152108.7848-3-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_03:2021-02-24,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260117
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU has had options to enable control-flow integrity features
for a few months now. Add two sets of build/check/acceptance
jobs to ensure the binary produced is working fine.

The two sets allow testing of x86_64 binaries for every target
that is not deprecated.

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
---
 .gitlab-ci.yml | 93 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 814f51873f..15641abe63 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -483,6 +483,99 @@ clang-user:
       --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
     MAKE_CHECK_ARGS: check-unit check-tcg
 
+# Set LD_JOBS=1 because this requires LTO and ld consumes a large amount of memory.
+# On gitlab runners, default value sometimes end up calling 2 lds concurrently and
+# triggers an Out-Of-Memory error
+#
+# Since slirp callbacks are used in QEMU Timers, slirp needs to be compiled together
+# with QEMU and linked as a static library to avoid false positives in CFI checks.
+# This can be accomplished by using -enable-slirp=git, which avoids the use of
+# a system-wide version of the library
+#
+# Split in two sets of build/check/acceptance because a single build job for every
+# target creates an artifact archive too big to be uploaded
+build-cfi-set1:
+  <<: *native_build_job_definition
+  needs:
+  - job: amd64-fedora-container
+  variables:
+    LD_JOBS: 1
+    AR: llvm-ar
+    IMAGE: fedora
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
+      --enable-safe-stack --enable-slirp=git
+    TARGETS: aarch64-softmmu arm-softmmu alpha-softmmu i386-softmmu ppc-softmmu
+      ppc64-softmmu riscv32-softmmu riscv64-softmmu s390x-softmmu sparc-softmmu
+      sparc64-softmmu x86_64-softmmu
+      aarch64-linux-user aarch64_be-linux-user arm-linux-user i386-linux-user
+      ppc64-linux-user ppc64le-linux-user s390x-linux-user x86_64-linux-user
+    MAKE_CHECK_ARGS: check-build
+  timeout: 2h 30m
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-cfi-set1:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-cfi-set1
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check
+
+acceptance-cfi-set1:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-cfi-set1
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
+build-cfi-set2:
+  <<: *native_build_job_definition
+  needs:
+  - job: amd64-fedora-container
+  variables:
+    LD_JOBS: 1
+    AR: llvm-ar
+    IMAGE: fedora
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
+      --enable-safe-stack --enable-slirp=git
+    TARGETS: avr-softmmu cris-softmmu hppa-softmmu m68k-softmmu
+      microblaze-softmmu microblazeel-softmmu mips-softmmu mips64-softmmu
+      mips64el-softmmu mipsel-softmmu moxie-softmmu nios2-softmmu or1k-softmmu
+      rx-softmmu sh4-softmmu sh4eb-softmmu tricore-softmmu xtensa-softmmu
+      xtensaeb-softmmu
+    MAKE_CHECK_ARGS: check-build
+  timeout: 2h 30m
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-cfi-set2:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-cfi-set2
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check
+
+acceptance-cfi-set2:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-cfi-set2
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
 tsan-build:
   <<: *native_build_job_definition
   variables:
-- 
2.30.0


