Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7976B83DA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 22:17:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbpX3-0005iq-28; Mon, 13 Mar 2023 17:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbpX1-0005iX-Ay; Mon, 13 Mar 2023 17:16:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbpWx-0007jy-Gd; Mon, 13 Mar 2023 17:16:35 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DLBNT6006731; Mon, 13 Mar 2023 21:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=fh/wOhxVATdbXox26mne9z/RyCa/fvA7HXwd3kR2C6k=;
 b=IyG0Ieaq2bn42KcQ/utXrqsQs8l3D/gaPt1cqZewbzWeuyHl8iczsqgB7SASrQNF2dtw
 xTuqG+dVe6hwhMvXxxXqCDK+u3OseXWDoiXFR/KFBmnfsOTubVh9+dWjhl1al2jouGRv
 R3YXxT8/rF6Beb59qD31cBPl1nsfHQ8RgfKUcHg7AufJmkUu57Z0K9yTxt8r9XEdQOez
 WGQ9aZqVsbIzyq32l/tRoXW3s4kS47z0Gg+E6hRcIdPCFYrDBVmy0odjx9DaUZjpfbkI
 A0ZNV0v8H4WN46leUaXriUeUhDgEsBgoSp3Z0qdU3p4adXp4zXmicY99NCCGm/kjd1ap vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa7rrp8uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 21:16:28 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DKr1bN004223;
 Mon, 13 Mar 2023 21:16:28 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa7rrp8u3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 21:16:28 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DE1mOm029999;
 Mon, 13 Mar 2023 21:16:26 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p8gwfbw15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 21:16:26 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32DLGMDQ62390622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 21:16:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83CC920043;
 Mon, 13 Mar 2023 21:16:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2C4D20040;
 Mon, 13 Mar 2023 21:16:21 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.57.117])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Mar 2023 21:16:21 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] s390x/gdb: Split s390-virt.xml
Date: Mon, 13 Mar 2023 22:16:14 +0100
Message-Id: <20230313211614.98739-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uEg9hpu9jZY9OHyqB_hSu_5AH9_G6KCq
X-Proofpoint-ORIG-GUID: 3qnC4Thqvas2WCDuv2xylo5Bx9ogBRDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_11,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130166
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

TCG emulates ckc, cputm, last_break and prefix, and it's quite useful
to have them during debugging.

So move them into the new s390-virt-tcg.xml file.

pp, pfault_token, pfault_select and pfault_compare are not emulated,
so keep them in s390-virt.xml.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 configs/targets/s390x-linux-user.mak |  2 +-
 configs/targets/s390x-softmmu.mak    |  2 +-
 gdb-xml/s390-virt-tcg.xml            | 14 +++++
 gdb-xml/s390-virt.xml                |  4 --
 target/s390x/gdbstub.c               | 82 ++++++++++++++++++----------
 5 files changed, 69 insertions(+), 35 deletions(-)
 create mode 100644 gdb-xml/s390-virt-tcg.xml

diff --git a/configs/targets/s390x-linux-user.mak b/configs/targets/s390x-linux-user.mak
index e2978248ede..fb3e2b73be7 100644
--- a/configs/targets/s390x-linux-user.mak
+++ b/configs/targets/s390x-linux-user.mak
@@ -2,4 +2,4 @@ TARGET_ARCH=s390x
 TARGET_SYSTBL_ABI=common,64
 TARGET_SYSTBL=syscall.tbl
 TARGET_BIG_ENDIAN=y
-TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-gs.xml
+TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-virt-tcg.xml gdb-xml/s390-gs.xml
diff --git a/configs/targets/s390x-softmmu.mak b/configs/targets/s390x-softmmu.mak
index 258b4cf3582..554330d7c85 100644
--- a/configs/targets/s390x-softmmu.mak
+++ b/configs/targets/s390x-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=s390x
 TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-gs.xml
+TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-virt-tcg.xml gdb-xml/s390-gs.xml
diff --git a/gdb-xml/s390-virt-tcg.xml b/gdb-xml/s390-virt-tcg.xml
new file mode 100644
index 00000000000..0f77c9b48c6
--- /dev/null
+++ b/gdb-xml/s390-virt-tcg.xml
@@ -0,0 +1,14 @@
+<?xml version="1.0"?>
+<!-- Copyright 2023 IBM Corp.
+
+     This work is licensed under the terms of the GNU GPL, version 2 or
+     (at your option) any later version. See the COPYING file in the
+     top-level directory. -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.s390.virt.tcg">
+  <reg name="ckc" bitsize="64" type="uint64" group="system"/>
+  <reg name="cputm" bitsize="64" type="uint64" group="system"/>
+  <reg name="last_break" bitsize="64" type="code_ptr" group="system"/>
+  <reg name="prefix" bitsize="64" type="data_ptr" group="system"/>
+</feature>
diff --git a/gdb-xml/s390-virt.xml b/gdb-xml/s390-virt.xml
index e2e9a7ad3cc..a79c0307682 100644
--- a/gdb-xml/s390-virt.xml
+++ b/gdb-xml/s390-virt.xml
@@ -7,10 +7,6 @@
 
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name="org.gnu.gdb.s390.virt">
-  <reg name="ckc" bitsize="64" type="uint64" group="system"/>
-  <reg name="cputm" bitsize="64" type="uint64" group="system"/>
-  <reg name="last_break" bitsize="64" type="code_ptr" group="system"/>
-  <reg name="prefix" bitsize="64" type="data_ptr" group="system"/>
   <reg name="pp" bitsize="64" type="uint64" group="system"/>
   <reg name="pfault_token" bitsize="64" type="uint64" group="system"/>
   <reg name="pfault_select" bitsize="64" type="uint64" group="system"/>
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index a5d69d0e0bc..111b695dc85 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -200,61 +200,81 @@ static int cpu_write_c_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
     }
 }
 
-/* the values represent the positions in s390-virt.xml */
-#define S390_VIRT_CKC_REGNUM    0
-#define S390_VIRT_CPUTM_REGNUM  1
-#define S390_VIRT_BEA_REGNUM    2
-#define S390_VIRT_PREFIX_REGNUM 3
-#define S390_VIRT_PP_REGNUM     4
-#define S390_VIRT_PFT_REGNUM    5
-#define S390_VIRT_PFS_REGNUM    6
-#define S390_VIRT_PFC_REGNUM    7
-/* total number of registers in s390-virt.xml */
-#define S390_NUM_VIRT_REGS 8
+/* the values represent the positions in s390-virt-tcg.xml */
+#define S390_VIRT_TCG_CKC_REGNUM    0
+#define S390_VIRT_TCG_CPUTM_REGNUM  1
+#define S390_VIRT_TCG_BEA_REGNUM    2
+#define S390_VIRT_TCG_PREFIX_REGNUM 3
+/* total number of registers in s390-virt-tcg.xml */
+#define S390_NUM_VIRT_TCG_REGS 4
 
-static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
+static int cpu_read_virt_tcg_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
 {
     switch (n) {
-    case S390_VIRT_CKC_REGNUM:
+    case S390_VIRT_TCG_CKC_REGNUM:
         return gdb_get_regl(mem_buf, env->ckc);
-    case S390_VIRT_CPUTM_REGNUM:
+    case S390_VIRT_TCG_CPUTM_REGNUM:
         return gdb_get_regl(mem_buf, env->cputm);
-    case S390_VIRT_BEA_REGNUM:
+    case S390_VIRT_TCG_BEA_REGNUM:
         return gdb_get_regl(mem_buf, env->gbea);
-    case S390_VIRT_PREFIX_REGNUM:
+    case S390_VIRT_TCG_PREFIX_REGNUM:
         return gdb_get_regl(mem_buf, env->psa);
-    case S390_VIRT_PP_REGNUM:
-        return gdb_get_regl(mem_buf, env->pp);
-    case S390_VIRT_PFT_REGNUM:
-        return gdb_get_regl(mem_buf, env->pfault_token);
-    case S390_VIRT_PFS_REGNUM:
-        return gdb_get_regl(mem_buf, env->pfault_select);
-    case S390_VIRT_PFC_REGNUM:
-        return gdb_get_regl(mem_buf, env->pfault_compare);
     default:
         return 0;
     }
 }
 
-static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
+static int cpu_write_virt_tcg_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 {
     switch (n) {
-    case S390_VIRT_CKC_REGNUM:
+    case S390_VIRT_TCG_CKC_REGNUM:
         env->ckc = ldtul_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
-    case S390_VIRT_CPUTM_REGNUM:
+    case S390_VIRT_TCG_CPUTM_REGNUM:
         env->cputm = ldtul_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
-    case S390_VIRT_BEA_REGNUM:
+    case S390_VIRT_TCG_BEA_REGNUM:
         env->gbea = ldtul_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
-    case S390_VIRT_PREFIX_REGNUM:
+    case S390_VIRT_TCG_PREFIX_REGNUM:
         env->psa = ldtul_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
+    default:
+        return 0;
+    }
+}
+
+/* the values represent the positions in s390-virt.xml */
+#define S390_VIRT_PP_REGNUM     0
+#define S390_VIRT_PFT_REGNUM    1
+#define S390_VIRT_PFS_REGNUM    2
+#define S390_VIRT_PFC_REGNUM    3
+/* total number of registers in s390-virt.xml */
+#define S390_NUM_VIRT_REGS 4
+
+static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
+{
+    switch (n) {
+    case S390_VIRT_PP_REGNUM:
+        return gdb_get_regl(mem_buf, env->pp);
+    case S390_VIRT_PFT_REGNUM:
+        return gdb_get_regl(mem_buf, env->pfault_token);
+    case S390_VIRT_PFS_REGNUM:
+        return gdb_get_regl(mem_buf, env->pfault_select);
+    case S390_VIRT_PFC_REGNUM:
+        return gdb_get_regl(mem_buf, env->pfault_compare);
+    default:
+        return 0;
+    }
+}
+
+static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
+{
+    switch (n) {
     case S390_VIRT_PP_REGNUM:
         env->pp = ldtul_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
@@ -320,6 +340,10 @@ void s390_cpu_gdb_init(CPUState *cs)
                              cpu_write_c_reg,
                              S390_NUM_C_REGS, "s390-cr.xml", 0);
 
+    gdb_register_coprocessor(cs, cpu_read_virt_tcg_reg,
+                             cpu_write_virt_tcg_reg,
+                             S390_NUM_VIRT_TCG_REGS, "s390-virt-tcg.xml", 0);
+
     if (kvm_enabled()) {
         gdb_register_coprocessor(cs, cpu_read_virt_reg,
                                  cpu_write_virt_reg,
-- 
2.39.2


