Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A9B32227B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 00:03:17 +0100 (CET)
Received: from localhost ([::1]:34496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEKEV-00042i-JV
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 18:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEKCi-000316-2B
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 18:01:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEKCd-0006sU-6v
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 18:01:23 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11MMWbbu164590; Mon, 22 Feb 2021 18:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Aymr6mTgscQXPxjx7t7iXD31+ob/GDAAQHtp292NJQw=;
 b=cgSDAPLnvGwcx3gJx08ZbdPK3iE3sE/QUI5EU+c2DzF+LACbj6c/3w0f5OFfM+S6o1fu
 Fqamh1keIn1KuYbxhPjb0BDCtQLXxSrComz/qLPNbMcQa2xWWV9/+bCOU42QIhv3tuSP
 7Env4SRogUFJ/w9jkcc/4it5rxmFZBibAi7lX92iSxpzh6b5yS8/K0C64TrR4PdRqYra
 qv3SzVVyHtQHNWD5MSzTZl2rda71CjHAK3WwtOEmp9LGSebt4Ff6tSeXhAWOzJlZieAO
 6ow6dVRw0d3B08ldycod/DBWZw6le+cKByj+71Jp8UBOIZWqdS9VE64CLETPLr16dOBN +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkg3mka6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 18:01:16 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11MMWba8164600;
 Mon, 22 Feb 2021 18:01:16 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkg3mk9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 18:01:16 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MMwHIw011220;
 Mon, 22 Feb 2021 23:01:15 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 36tt2a6xss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 23:01:15 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11MN1EFR23200138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 23:01:14 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E70A26A04F;
 Mon, 22 Feb 2021 23:01:13 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5830A6A051;
 Mon, 22 Feb 2021 23:01:13 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.163.12.145])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Feb 2021 23:01:13 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gitlab-ci.yml: Add jobs to test CFI flags
Date: Mon, 22 Feb 2021 18:01:05 -0500
Message-Id: <20210222230106.7030-3-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
References: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_07:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220194
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
 .gitlab-ci.yml | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5c198f05d4..f2fea8e2eb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -479,6 +479,98 @@ clang-user:
       --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
     MAKE_CHECK_ARGS: check-unit check-tcg
 
+# Set JOBS=1 because this requires LTO and ld consumes a large amount of memory.
+# On gitlab runners, default JOBS of 2 sometimes end up calling 2 lds concurrently
+# and triggers an Out-Of-Memory error
+#
+# Because of how slirp is used in QEMU, we need to have CFI also on libslirp.
+# System-wide version in fedora is not compiled with CFI so we recompile it using
+# -enable-slirp=git
+#
+# Split in two sets of build/check/acceptance because a single build job for every
+# target creates an artifact archive too big to be uploaded
+build-cfi-set1:
+  <<: *native_build_job_definition
+  needs:
+  - job: amd64-fedora-container
+  variables:
+    JOBS: 1
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
+  timeout: 3h
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
+    JOBS: 1
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
+  timeout: 3h
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


