Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA585ADC37
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 02:13:22 +0200 (CEST)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVMDR-0000BL-Tb
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 20:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM9P-0003qF-B4
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:09:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM9B-0002HD-60
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:09:08 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285NqwcI026813;
 Tue, 6 Sep 2022 00:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=f+NjNWnUkwsuzU4eJD/wtK4cLCNeciA0GFbsOrawchc=;
 b=HEqstNKz/nQwHqfp1ph5eVp8Z5JHIruvvCUXMrGmXnX3l9QBsJLO5nx2teHl0igSZ2gJ
 TkXhxlLSF94wjhzL/ShlPF7/7Ch0njKt+LNq+jOPKkZ3uLGqTn3vtnYhzWgPX8SelT+s
 cFa6kxnwxZ0/3FDwtqSxctKDgjnihIaDqK/NpsCE4JL0thIxmZNVVjUvY8MLMM/i/5A/
 DWARGgjLPdAm+dG2l7fqRykNhDDaWXNTMURNzpZfjTp0R/R/nYSIqlfBlNFSPJZkwQSC
 19CQtaqKORUzcliqIErh3mttlEUvER7wjJLXfA1Xfvy5ctaXpgQy/IYxO/WQoUo0aVXz Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdu60rf1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:08:55 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 285NspT9003250;
 Tue, 6 Sep 2022 00:08:54 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdu60rf0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:08:54 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286067DQ024914;
 Tue, 6 Sep 2022 00:08:52 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3jbxj8u00r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:08:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 28605MxU24379686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Sep 2022 00:05:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C780711C050;
 Tue,  6 Sep 2022 00:08:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68A2311C04C;
 Tue,  6 Sep 2022 00:08:49 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.53.58])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Sep 2022 00:08:49 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 1/5] linux-user: Provide MADV_* definitions
Date: Tue,  6 Sep 2022 02:08:35 +0200
Message-Id: <20220906000839.1672934-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906000839.1672934-1-iii@linux.ibm.com>
References: <20220906000839.1672934-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zAimjCC2z69aplzyO0OPb6fokVu2P3iT
X-Proofpoint-ORIG-GUID: eQoJz3lbrgCJ3RW5REE_ra3J0SD15sG2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_16,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=741 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
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

Provide MADV_* definitions using target_mman.h header, similar to what
kernel does. Most architectures use the same values, with the exception
of alpha and hppa.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/aarch64/target_mman.h     |  1 +
 linux-user/alpha/target_mman.h       |  8 +++
 linux-user/arm/target_mman.h         |  1 +
 linux-user/cris/target_mman.h        |  1 +
 linux-user/generic/target_mman.h     | 92 ++++++++++++++++++++++++++++
 linux-user/hexagon/target_mman.h     |  1 +
 linux-user/hppa/target_mman.h        | 15 +++++
 linux-user/i386/target_mman.h        |  1 +
 linux-user/loongarch64/target_mman.h |  1 +
 linux-user/m68k/target_mman.h        |  1 +
 linux-user/microblaze/target_mman.h  |  1 +
 linux-user/mips/target_mman.h        |  1 +
 linux-user/mips64/target_mman.h      |  1 +
 linux-user/nios2/target_mman.h       |  1 +
 linux-user/openrisc/target_mman.h    |  1 +
 linux-user/ppc/target_mman.h         |  1 +
 linux-user/riscv/target_mman.h       |  1 +
 linux-user/s390x/target_mman.h       |  1 +
 linux-user/sh4/target_mman.h         |  1 +
 linux-user/sparc/target_mman.h       |  1 +
 linux-user/x86_64/target_mman.h      |  1 +
 linux-user/xtensa/target_mman.h      |  1 +
 22 files changed, 134 insertions(+)
 create mode 100644 linux-user/aarch64/target_mman.h
 create mode 100644 linux-user/alpha/target_mman.h
 create mode 100644 linux-user/arm/target_mman.h
 create mode 100644 linux-user/cris/target_mman.h
 create mode 100644 linux-user/generic/target_mman.h
 create mode 100644 linux-user/hexagon/target_mman.h
 create mode 100644 linux-user/hppa/target_mman.h
 create mode 100644 linux-user/i386/target_mman.h
 create mode 100644 linux-user/loongarch64/target_mman.h
 create mode 100644 linux-user/m68k/target_mman.h
 create mode 100644 linux-user/microblaze/target_mman.h
 create mode 100644 linux-user/mips/target_mman.h
 create mode 100644 linux-user/mips64/target_mman.h
 create mode 100644 linux-user/nios2/target_mman.h
 create mode 100644 linux-user/openrisc/target_mman.h
 create mode 100644 linux-user/ppc/target_mman.h
 create mode 100644 linux-user/riscv/target_mman.h
 create mode 100644 linux-user/s390x/target_mman.h
 create mode 100644 linux-user/sh4/target_mman.h
 create mode 100644 linux-user/sparc/target_mman.h
 create mode 100644 linux-user/x86_64/target_mman.h
 create mode 100644 linux-user/xtensa/target_mman.h

diff --git a/linux-user/aarch64/target_mman.h b/linux-user/aarch64/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/aarch64/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/alpha/target_mman.h b/linux-user/alpha/target_mman.h
new file mode 100644
index 0000000000..cd6e3d70a6
--- /dev/null
+++ b/linux-user/alpha/target_mman.h
@@ -0,0 +1,8 @@
+#ifndef ALPHA_TARGET_MMAN_H
+#define ALPHA_TARGET_MMAN_H
+
+#define TARGET_MADV_DONTNEED 6
+
+#include "../generic/target_mman.h"
+
+#endif
diff --git a/linux-user/arm/target_mman.h b/linux-user/arm/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/arm/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/cris/target_mman.h b/linux-user/cris/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/cris/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/generic/target_mman.h b/linux-user/generic/target_mman.h
new file mode 100644
index 0000000000..1436a3c543
--- /dev/null
+++ b/linux-user/generic/target_mman.h
@@ -0,0 +1,92 @@
+#ifndef LINUX_USER_TARGET_MMAN_H
+#define LINUX_USER_TARGET_MMAN_H
+
+#ifndef TARGET_MADV_NORMAL
+#define TARGET_MADV_NORMAL 0
+#endif
+
+#ifndef TARGET_MADV_RANDOM
+#define TARGET_MADV_RANDOM 1
+#endif
+
+#ifndef TARGET_MADV_SEQUENTIAL
+#define TARGET_MADV_SEQUENTIAL 2
+#endif
+
+#ifndef TARGET_MADV_WILLNEED
+#define TARGET_MADV_WILLNEED 3
+#endif
+
+#ifndef TARGET_MADV_DONTNEED
+#define TARGET_MADV_DONTNEED 4
+#endif
+
+#ifndef TARGET_MADV_FREE
+#define TARGET_MADV_FREE 8
+#endif
+
+#ifndef TARGET_MADV_REMOVE
+#define TARGET_MADV_REMOVE 9
+#endif
+
+#ifndef TARGET_MADV_DONTFORK
+#define TARGET_MADV_DONTFORK 10
+#endif
+
+#ifndef TARGET_MADV_DOFORK
+#define TARGET_MADV_DOFORK 11
+#endif
+
+#ifndef TARGET_MADV_MERGEABLE
+#define TARGET_MADV_MERGEABLE 12
+#endif
+
+#ifndef TARGET_MADV_UNMERGEABLE
+#define TARGET_MADV_UNMERGEABLE 13
+#endif
+
+#ifndef TARGET_MADV_HUGEPAGE
+#define TARGET_MADV_HUGEPAGE 14
+#endif
+
+#ifndef TARGET_MADV_NOHUGEPAGE
+#define TARGET_MADV_NOHUGEPAGE 15
+#endif
+
+#ifndef TARGET_MADV_DONTDUMP
+#define TARGET_MADV_DONTDUMP 16
+#endif
+
+#ifndef TARGET_MADV_DODUMP
+#define TARGET_MADV_DODUMP 17
+#endif
+
+#ifndef TARGET_MADV_WIPEONFORK
+#define TARGET_MADV_WIPEONFORK 18
+#endif
+
+#ifndef TARGET_MADV_KEEPONFORK
+#define TARGET_MADV_KEEPONFORK 19
+#endif
+
+#ifndef TARGET_MADV_COLD
+#define TARGET_MADV_COLD 20
+#endif
+
+#ifndef TARGET_MADV_PAGEOUT
+#define TARGET_MADV_PAGEOUT 21
+#endif
+
+#ifndef TARGET_MADV_POPULATE_READ
+#define TARGET_MADV_POPULATE_READ 22
+#endif
+
+#ifndef TARGET_MADV_POPULATE_WRITE
+#define TARGET_MADV_POPULATE_WRITE 23
+#endif
+
+#ifndef TARGET_MADV_DONTNEED_LOCKED
+#define TARGET_MADV_DONTNEED_LOCKED 24
+#endif
+
+#endif
diff --git a/linux-user/hexagon/target_mman.h b/linux-user/hexagon/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/hexagon/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/hppa/target_mman.h b/linux-user/hppa/target_mman.h
new file mode 100644
index 0000000000..66dd9f7941
--- /dev/null
+++ b/linux-user/hppa/target_mman.h
@@ -0,0 +1,15 @@
+#ifndef HPPA_TARGET_MMAN_H
+#define HPPA_TARGET_MMAN_H
+
+#define TARGET_MADV_MERGEABLE 65
+#define TARGET_MADV_UNMERGEABLE 66
+#define TARGET_MADV_HUGEPAGE 67
+#define TARGET_MADV_NOHUGEPAGE 68
+#define TARGET_MADV_DONTDUMP 69
+#define TARGET_MADV_DODUMP 70
+#define TARGET_MADV_WIPEONFORK 71
+#define TARGET_MADV_KEEPONFORK 72
+
+#include "../generic/target_mman.h"
+
+#endif
diff --git a/linux-user/i386/target_mman.h b/linux-user/i386/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/i386/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/loongarch64/target_mman.h b/linux-user/loongarch64/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/loongarch64/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/m68k/target_mman.h b/linux-user/m68k/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/m68k/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/microblaze/target_mman.h b/linux-user/microblaze/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/microblaze/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/mips/target_mman.h b/linux-user/mips/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/mips/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/mips64/target_mman.h b/linux-user/mips64/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/mips64/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/nios2/target_mman.h b/linux-user/nios2/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/nios2/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/openrisc/target_mman.h b/linux-user/openrisc/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/openrisc/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/ppc/target_mman.h b/linux-user/ppc/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/ppc/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/riscv/target_mman.h b/linux-user/riscv/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/riscv/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/s390x/target_mman.h b/linux-user/s390x/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/s390x/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/sh4/target_mman.h b/linux-user/sh4/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/sh4/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/sparc/target_mman.h b/linux-user/sparc/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/sparc/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/x86_64/target_mman.h b/linux-user/x86_64/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/x86_64/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
diff --git a/linux-user/xtensa/target_mman.h b/linux-user/xtensa/target_mman.h
new file mode 100644
index 0000000000..e7ba6070fe
--- /dev/null
+++ b/linux-user/xtensa/target_mman.h
@@ -0,0 +1 @@
+#include "../generic/target_mman.h"
-- 
2.37.2


