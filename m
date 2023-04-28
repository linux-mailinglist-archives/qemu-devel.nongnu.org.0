Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FDA6F1462
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:44:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKe1-0003Qa-3H; Fri, 28 Apr 2023 05:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKdz-0003QS-7X
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKdx-0007Yj-FF
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682675036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Whl14FdWI0R6prvjrfI/55CDXqG3gB/mSgKCAYsXyE8=;
 b=HFsKfYiFGTZlko3UctGsxAtMYhlXLrzlR/+5GY2htJ0YIBZ6I2KukJo8RnpINhQeYXrH3y
 ASdCTnQANpVNZGdg2KJ9kTWDsfAWeoO0HsR31AWN+2zrrzZxRur4sUjlXbbEYksvdaPUKj
 edlO9lnvwsFzgIrSpqOrNhlTrncVmws=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-eK04ByLuNri398SQT-6Shg-1; Fri, 28 Apr 2023 05:43:52 -0400
X-MC-Unique: eK04ByLuNri398SQT-6Shg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D82B91C06EE6;
 Fri, 28 Apr 2023 09:43:51 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5A401410F23;
 Fri, 28 Apr 2023 09:43:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 01/13] s390x/gdb: Split s390-virt.xml
Date: Fri, 28 Apr 2023 11:43:34 +0200
Message-Id: <20230428094346.1292054-2-thuth@redhat.com>
In-Reply-To: <20230428094346.1292054-1-thuth@redhat.com>
References: <20230428094346.1292054-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Both TCG and KVM emulate ckc, cputm, last_break and prefix, and it's
quite useful to have them during debugging. Right now they are grouped
together with KVM-only pp, pfault_token, pfault_select and
pfault_compare in s390-virt.xml, and are not available when debugging
TCG-emulated code.

Move KVM-only registers into the new s390-virt-kvm.xml file. Advertise
s390-virt.xml always, and the new s390-virt-kvm.xml only for KVM.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230314101813.174874-1-iii@linux.ibm.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configs/targets/s390x-linux-user.mak |  2 +-
 configs/targets/s390x-softmmu.mak    |  2 +-
 target/s390x/gdbstub.c               | 65 +++++++++++++++++++---------
 gdb-xml/s390-virt-kvm.xml            | 14 ++++++
 gdb-xml/s390-virt.xml                |  4 --
 5 files changed, 61 insertions(+), 26 deletions(-)
 create mode 100644 gdb-xml/s390-virt-kvm.xml

diff --git a/configs/targets/s390x-linux-user.mak b/configs/targets/s390x-linux-user.mak
index e2978248ed..24c04c8589 100644
--- a/configs/targets/s390x-linux-user.mak
+++ b/configs/targets/s390x-linux-user.mak
@@ -2,4 +2,4 @@ TARGET_ARCH=s390x
 TARGET_SYSTBL_ABI=common,64
 TARGET_SYSTBL=syscall.tbl
 TARGET_BIG_ENDIAN=y
-TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-gs.xml
+TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-virt-kvm.xml gdb-xml/s390-gs.xml
diff --git a/configs/targets/s390x-softmmu.mak b/configs/targets/s390x-softmmu.mak
index 258b4cf358..70d2f9f0ba 100644
--- a/configs/targets/s390x-softmmu.mak
+++ b/configs/targets/s390x-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=s390x
 TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-gs.xml
+TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-virt-kvm.xml gdb-xml/s390-gs.xml
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index 0cb69395b4..6fbfd41bc8 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -206,12 +206,8 @@ static int cpu_write_c_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
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
@@ -224,14 +220,6 @@ static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
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
@@ -256,19 +244,51 @@ static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
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
@@ -321,10 +341,15 @@ void s390_cpu_gdb_init(CPUState *cs)
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
diff --git a/gdb-xml/s390-virt-kvm.xml b/gdb-xml/s390-virt-kvm.xml
new file mode 100644
index 0000000000..a256eddaf5
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
index e2e9a7ad3c..438eb68aab 100644
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
-- 
2.31.1


