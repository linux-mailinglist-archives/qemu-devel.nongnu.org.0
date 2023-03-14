Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E686B8F9A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 11:19:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc1jn-0007Pf-G9; Tue, 14 Mar 2023 06:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pc1jj-0007PD-Vo; Tue, 14 Mar 2023 06:18:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pc1jh-000516-Kv; Tue, 14 Mar 2023 06:18:31 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32E9g365016882; Tue, 14 Mar 2023 10:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Cltd8khnhgmk3w3ivaULAVSQKbaL+QjSvoUpaHSO33A=;
 b=RN73TChsRNaG3yJwWo0HJKj+eKk80XMYmJVd+LP7hy3PGUkOesB1jQXDQuL5clrpfExP
 C7RHqxE42ptWmizLjVA+SPbFVM2ggGnjwK50IEBcEYaK9zLwFxISGj+wUWI4oRGej3E/
 cJIO5rsx7TUZEhlrINywGccpBncncoFiUqLHvdZfq726T1Uv5yk9gAnKMP7jfjOBet4E
 FVwbstCFRm4ImBsP7ai9HxVYNVAQ9m0LaUE6acV3YhgxJ4nmKumUD05SqGPGagUxwIBt
 9XKyHnNNnjZDZx4h6TZc9rJuo9p2Sur7KgGzt7J6a7wvvzq24skbJIJocPSpRlelA6pm Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3paph210t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 10:18:25 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32EAGfkL017088;
 Tue, 14 Mar 2023 10:18:24 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3paph210sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 10:18:24 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32E9fkrg016362;
 Tue, 14 Mar 2023 10:18:22 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3p8h96kmva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 10:18:22 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32EAII8C20382350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Mar 2023 10:18:18 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57CE720089;
 Tue, 14 Mar 2023 10:18:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7175520085;
 Tue, 14 Mar 2023 10:18:17 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.57.117])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Mar 2023 10:18:17 +0000 (GMT)
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
Subject: [PATCH v2] s390x/gdb: Split s390-virt.xml
Date: Tue, 14 Mar 2023 11:18:13 +0100
Message-Id: <20230314101813.174874-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B-kLyPux6ZXefVgtAr3IxqMbY3oi6zqV
X-Proofpoint-GUID: O2_QIhj8ih1odbjzzxgT39kJWbKrvHRs
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_04,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=937 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140082
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

Both TCG and KVM emulate ckc, cputm, last_break and prefix, and it's
quite useful to have them during debugging. Right now they are grouped
together with KVM-only pp, pfault_token, pfault_select and
pfault_compare in s390-virt.xml, and are not available when debugging
TCG-emulated code.

Move KVM-only registers into the new s390-virt-kvm.xml file. Advertise
s390-virt.xml always, and the new s390-virt-kvm.xml only for KVM.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230313211614.98739-1-iii@linux.ibm.com>
---

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04307.html
v1 -> v2: Improve the naming and the commit message (Christian).

 configs/targets/s390x-linux-user.mak |  2 +-
 configs/targets/s390x-softmmu.mak    |  2 +-
 gdb-xml/s390-virt-kvm.xml            | 14 ++++++
 gdb-xml/s390-virt.xml                |  4 --
 target/s390x/gdbstub.c               | 65 +++++++++++++++++++---------
 5 files changed, 61 insertions(+), 26 deletions(-)
 create mode 100644 gdb-xml/s390-virt-kvm.xml

diff --git a/configs/targets/s390x-linux-user.mak b/configs/targets/s390x-linux-user.mak
index e2978248ede..24c04c85894 100644
--- a/configs/targets/s390x-linux-user.mak
+++ b/configs/targets/s390x-linux-user.mak
@@ -2,4 +2,4 @@ TARGET_ARCH=s390x
 TARGET_SYSTBL_ABI=common,64
 TARGET_SYSTBL=syscall.tbl
 TARGET_BIG_ENDIAN=y
-TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-gs.xml
+TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-virt-kvm.xml gdb-xml/s390-gs.xml
diff --git a/configs/targets/s390x-softmmu.mak b/configs/targets/s390x-softmmu.mak
index 258b4cf3582..70d2f9f0ba0 100644
--- a/configs/targets/s390x-softmmu.mak
+++ b/configs/targets/s390x-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=s390x
 TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-gs.xml
+TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-virt-kvm.xml gdb-xml/s390-gs.xml
diff --git a/gdb-xml/s390-virt-kvm.xml b/gdb-xml/s390-virt-kvm.xml
new file mode 100644
index 00000000000..a256eddaf57
--- /dev/null
+++ b/gdb-xml/s390-virt-kvm.xml
@@ -0,0 +1,14 @@
+<?xml version="1.0"?>
+<!-- Copyright 2023 IBM Corp.
+
+     This work is licensed under the terms of the GNU GPL, version 2 or
+     (at your option) any later version. See the COPYING file in the
+     top-level directory. -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.s390.virt.kvm">
+  <reg name="pp" bitsize="64" type="uint64" group="system"/>
+  <reg name="pfault_token" bitsize="64" type="uint64" group="system"/>
+  <reg name="pfault_select" bitsize="64" type="uint64" group="system"/>
+  <reg name="pfault_compare" bitsize="64" type="uint64" group="system"/>
+</feature>
diff --git a/gdb-xml/s390-virt.xml b/gdb-xml/s390-virt.xml
index e2e9a7ad3cc..438eb68aabe 100644
--- a/gdb-xml/s390-virt.xml
+++ b/gdb-xml/s390-virt.xml
@@ -11,8 +11,4 @@
   <reg name="cputm" bitsize="64" type="uint64" group="system"/>
   <reg name="last_break" bitsize="64" type="code_ptr" group="system"/>
   <reg name="prefix" bitsize="64" type="data_ptr" group="system"/>
-  <reg name="pp" bitsize="64" type="uint64" group="system"/>
-  <reg name="pfault_token" bitsize="64" type="uint64" group="system"/>
-  <reg name="pfault_select" bitsize="64" type="uint64" group="system"/>
-  <reg name="pfault_compare" bitsize="64" type="uint64" group="system"/>
 </feature>
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index a5d69d0e0bc..e1153f5dc4a 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -205,12 +205,8 @@ static int cpu_write_c_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
 #define S390_VIRT_CPUTM_REGNUM  1
 #define S390_VIRT_BEA_REGNUM    2
 #define S390_VIRT_PREFIX_REGNUM 3
-#define S390_VIRT_PP_REGNUM     4
-#define S390_VIRT_PFT_REGNUM    5
-#define S390_VIRT_PFS_REGNUM    6
-#define S390_VIRT_PFC_REGNUM    7
 /* total number of registers in s390-virt.xml */
-#define S390_NUM_VIRT_REGS 8
+#define S390_NUM_VIRT_REGS 4
 
 static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
 {
@@ -223,14 +219,6 @@ static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
         return gdb_get_regl(mem_buf, env->gbea);
     case S390_VIRT_PREFIX_REGNUM:
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
@@ -255,19 +243,51 @@ static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
         env->psa = ldtul_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
-    case S390_VIRT_PP_REGNUM:
+    default:
+        return 0;
+    }
+}
+
+/* the values represent the positions in s390-virt-kvm.xml */
+#define S390_VIRT_KVM_PP_REGNUM     0
+#define S390_VIRT_KVM_PFT_REGNUM    1
+#define S390_VIRT_KVM_PFS_REGNUM    2
+#define S390_VIRT_KVM_PFC_REGNUM    3
+/* total number of registers in s390-virt-kvm.xml */
+#define S390_NUM_VIRT_KVM_REGS 4
+
+static int cpu_read_virt_kvm_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
+{
+    switch (n) {
+    case S390_VIRT_KVM_PP_REGNUM:
+        return gdb_get_regl(mem_buf, env->pp);
+    case S390_VIRT_KVM_PFT_REGNUM:
+        return gdb_get_regl(mem_buf, env->pfault_token);
+    case S390_VIRT_KVM_PFS_REGNUM:
+        return gdb_get_regl(mem_buf, env->pfault_select);
+    case S390_VIRT_KVM_PFC_REGNUM:
+        return gdb_get_regl(mem_buf, env->pfault_compare);
+    default:
+        return 0;
+    }
+}
+
+static int cpu_write_virt_kvm_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
+{
+    switch (n) {
+    case S390_VIRT_KVM_PP_REGNUM:
         env->pp = ldtul_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
-    case S390_VIRT_PFT_REGNUM:
+    case S390_VIRT_KVM_PFT_REGNUM:
         env->pfault_token = ldtul_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
-    case S390_VIRT_PFS_REGNUM:
+    case S390_VIRT_KVM_PFS_REGNUM:
         env->pfault_select = ldtul_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
-    case S390_VIRT_PFC_REGNUM:
+    case S390_VIRT_KVM_PFC_REGNUM:
         env->pfault_compare = ldtul_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
@@ -320,10 +340,15 @@ void s390_cpu_gdb_init(CPUState *cs)
                              cpu_write_c_reg,
                              S390_NUM_C_REGS, "s390-cr.xml", 0);
 
+    gdb_register_coprocessor(cs, cpu_read_virt_reg,
+                             cpu_write_virt_reg,
+                             S390_NUM_VIRT_REGS, "s390-virt.xml", 0);
+
     if (kvm_enabled()) {
-        gdb_register_coprocessor(cs, cpu_read_virt_reg,
-                                 cpu_write_virt_reg,
-                                 S390_NUM_VIRT_REGS, "s390-virt.xml", 0);
+        gdb_register_coprocessor(cs, cpu_read_virt_kvm_reg,
+                                 cpu_write_virt_kvm_reg,
+                                 S390_NUM_VIRT_KVM_REGS, "s390-virt-kvm.xml",
+                                 0);
     }
 #endif
 }
-- 
2.39.2


