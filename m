Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8313124B7
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 15:39:12 +0100 (CET)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8lDS-00005i-Nb
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 09:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominik.gloess@tum.de>)
 id 1l8cJ2-0006x6-8t; Sun, 07 Feb 2021 00:08:20 -0500
Received: from postout1.mail.lrz.de ([2001:4ca0:0:103::81bb:ff89]:39621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominik.gloess@tum.de>)
 id 1l8cIx-00030N-Ey; Sun, 07 Feb 2021 00:08:19 -0500
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
 by postout1.mail.lrz.de (Postfix) with ESMTP id 4DYHGn34mJzyYk;
 Sun,  7 Feb 2021 06:08:01 +0100 (CET)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
 reason="pass (just generated,
 assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tum.de; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received; s=postout; t=1612674480; bh=rGhMF1YHtiCQHc/v
 DlLqjDKuKUUAdQcfCfjbDjmCjG8=; b=ZbvHe0GQwh4qZ0nTdEjJj9khb7jHGyGP
 7pKtsB6AKUPEBie4lxl3ZBUmxiEczDbKVKxkA3kuliN5RgJnBAslJ17qdGK5m5Pn
 KEh/kklT4CcM54sP8c+OXU5IxYFE44IDPLtKQMUpNbHXM7dY2Pr2fpklS/mLI6WM
 voUC/X+A1QgvBZOaAWt12xuade3rgnI/1eArhK5nPMPeHJXGyGqNjvlxdhZ96/Mf
 NSsKVrykQCFEBHrN6lXztI5rFxMDe1sBegB/TbVKyRDaUIrK1BjGMMa04dTLaXqh
 EET/CbDMBS7RpgyAdGQbV0MvNO9CG3xGBCRYtYLSCZWhMUtozbkiiA==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Score: -2.879
Received: from postout1.mail.lrz.de ([127.0.0.1])
 by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new,
 port 20024)
 with LMTP id 9elDdR2JVzxG; Sun,  7 Feb 2021 06:08:00 +0100 (CET)
Received: from venus.. (p54b93a9a.dip0.t-ipconnect.de [84.185.58.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DYHGm3dtczyYX;
 Sun,  7 Feb 2021 06:08:00 +0100 (CET)
From: =?UTF-8?q?Dominik=20Gl=C3=B6=C3=9F?= <dominik.gloess@tum.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: expose more MSRs to GDB
Date: Sun,  7 Feb 2021 06:07:14 +0100
Message-Id: <20210207050714.258627-1-dominik.gloess@tum.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4ca0:0:103::81bb:ff89;
 envelope-from=dominik.gloess@tum.de; helo=postout1.mail.lrz.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 07 Feb 2021 09:37:45 -0500
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Dominik=20Gl=C3=B6=C3=9F?= <dominik.gloess@tum.de>,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds 7 more model-specific registers to be usable while remote
debugging in gdb. Accessing these registers can for example be useful for
tracing Linux Systemcalls.

Signed-off-by: Dominik Glöß <dominik.gloess@tum.de>
---

Adding registers to GDB like this works fine for now. Should there
arise the need to add more MSRs, a rework of the code that reads
the xml file should be considered. Hard coding the amount of registers and
matching the offsets in gdbstub and the xml seems prone to error.

This is similar to the patch by Elias Djossou to allow outputting the same
registers via HMP. Both patches are however independent from each other.

gdb-xml/i386-32bit.xml |   7 +++
 gdb-xml/i386-64bit.xml |   7 +++
 target/i386/cpu.c      |   4 +-
 target/i386/gdbstub.c  | 122 ++++++++++++++++++++++++++++++++++++-----
 4 files changed, 125 insertions(+), 15 deletions(-)

diff --git a/gdb-xml/i386-32bit.xml b/gdb-xml/i386-32bit.xml
index 872fcea9c2..0e650c9027 100644
--- a/gdb-xml/i386-32bit.xml
+++ b/gdb-xml/i386-32bit.xml
@@ -61,6 +61,13 @@
   <reg name="es_base" bitsize="32" type="int32"/-->
   <reg name="fs_base" bitsize="32" type="int32"/>
   <reg name="gs_base" bitsize="32" type="int32"/>
+  <reg name="sysenter_cs" bitsize="32" type="int32"/>
+  <reg name="sysenter_esp" bitsize="32" type="int32"/>
+  <reg name="sysenter_eip" bitsize="32" type="int32"/>
+  <reg name="star" bitsize="32" type="int32"/>
+  <reg name="lstar" bitsize="32" type="int32"/>
+  <reg name="cstar" bitsize="32" type="int32"/>
+  <reg name="fmask" bitsize="32" type="int32"/>
   <reg name="k_gs_base" bitsize="32" type="int32"/>

   <flags id="i386_cr0" size="4">
diff --git a/gdb-xml/i386-64bit.xml b/gdb-xml/i386-64bit.xml
index 6d88969211..d7ca2d8586 100644
--- a/gdb-xml/i386-64bit.xml
+++ b/gdb-xml/i386-64bit.xml
@@ -74,6 +74,13 @@
   <reg name="es_base" bitsize="64" type="int64"/-->
   <reg name="fs_base" bitsize="64" type="int64"/>
   <reg name="gs_base" bitsize="64" type="int64"/>
+  <reg name="sysenter_cs" bitsize="64" type="int64"/>
+  <reg name="sysenter_esp" bitsize="64" type="int64"/>
+  <reg name="sysenter_eip" bitsize="64" type="int64"/>
+  <reg name="star" bitsize="64" type="int64"/>
+  <reg name="lstar" bitsize="64" type="int64"/>
+  <reg name="cstar" bitsize="64" type="int64"/>
+  <reg name="fmask" bitsize="64" type="int64"/>
   <reg name="k_gs_base" bitsize="64" type="int64"/>

   <!-- Control registers -->
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae89024d36..2b7be1c248 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7321,10 +7321,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_arch_name = x86_gdb_arch_name;
 #ifdef TARGET_X86_64
     cc->gdb_core_xml_file = "i386-64bit.xml";
-    cc->gdb_num_core_regs = 66;
+    cc->gdb_num_core_regs = 73;
 #else
     cc->gdb_core_xml_file = "i386-32bit.xml";
-    cc->gdb_num_core_regs = 50;
+    cc->gdb_num_core_regs = 57;
 #endif
     cc->disas_set_info = x86_disas_set_info;

diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 41e265fc67..5743ba39b3 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -46,7 +46,8 @@ static const int gpr_map32[8] = { 0, 1, 2, 3, 4, 5, 6, 7 };
  */
 #define IDX_NB_IP       1
 #define IDX_NB_FLAGS    1
-#define IDX_NB_SEG      (6 + 3)
+#define IDX_NB_SEG      6
+#define IDX_NB_MSR      10
 #define IDX_NB_CTL      6
 #define IDX_NB_FP       16
 /*
@@ -54,13 +55,14 @@ static const int gpr_map32[8] = { 0, 1, 2, 3, 4, 5, 6, 7 };
  */
 #define IDX_NB_MXCSR    1
 /*
- *          total ----> 8+1+1+9+6+16+8+1=50 or 16+1+1+9+6+16+16+1=66
+ *          total ----> 8+1+1+6+10+6+16+8+1=57 or 16+1+1+6+10+6+16+16+1=73
  */

 #define IDX_IP_REG      CPU_NB_REGS
 #define IDX_FLAGS_REG   (IDX_IP_REG + IDX_NB_IP)
 #define IDX_SEG_REGS    (IDX_FLAGS_REG + IDX_NB_FLAGS)
-#define IDX_CTL_REGS    (IDX_SEG_REGS + IDX_NB_SEG)
+#define IDX_MSR_REGS    (IDX_SEG_REGS + IDX_NB_SEG)
+#define IDX_CTL_REGS    (IDX_MSR_REGS + IDX_NB_MSR)
 #define IDX_FP_REGS     (IDX_CTL_REGS + IDX_NB_CTL)
 #define IDX_XMM_REGS    (IDX_FP_REGS + IDX_NB_FP)
 #define IDX_MXCSR_REG   (IDX_XMM_REGS + CPU_NB_REGS)
@@ -143,25 +145,56 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         case IDX_SEG_REGS + 5:
             return gdb_get_reg32(mem_buf, env->segs[R_GS].selector);

-        case IDX_SEG_REGS + 6:
+        case IDX_MSR_REGS:
             if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
                 return gdb_get_reg64(mem_buf, env->segs[R_FS].base);
             }
             return gdb_get_reg32(mem_buf, env->segs[R_FS].base);

-        case IDX_SEG_REGS + 7:
+        case IDX_MSR_REGS + 1:
             if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
                 return gdb_get_reg64(mem_buf, env->segs[R_GS].base);
             }
             return gdb_get_reg32(mem_buf, env->segs[R_GS].base);

-        case IDX_SEG_REGS + 8:
-#ifdef TARGET_X86_64
+        case IDX_MSR_REGS + 2:
+            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
+                return gdb_get_reg64(mem_buf, env->sysenter_cs);
+            }
+            return gdb_get_reg32(mem_buf, env->sysenter_cs);
+
+        case IDX_MSR_REGS + 3:
+            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
+                return gdb_get_reg64(mem_buf, env->sysenter_esp);
+            }
+            return gdb_get_reg32(mem_buf, env->sysenter_esp);
+
+        case IDX_MSR_REGS + 4:
             if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
-                return gdb_get_reg64(mem_buf, env->kernelgsbase);
+                return gdb_get_reg64(mem_buf, env->sysenter_eip);
             }
-            return gdb_get_reg32(mem_buf, env->kernelgsbase);
+            return gdb_get_reg32(mem_buf, env->sysenter_eip);
+
+        case IDX_MSR_REGS + 5:
+            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
+                return gdb_get_reg64(mem_buf, env->star);
+            }
+            return gdb_get_reg32(mem_buf, env->star);
+
+#ifdef TARGET_X86_64
+        case IDX_MSR_REGS + 6:
+            return gdb_get_reg64(mem_buf, env->fmask);
+        case IDX_MSR_REGS + 7:
+            return gdb_get_reg64(mem_buf, env->lstar);
+        case IDX_MSR_REGS + 8:
+            return gdb_get_reg64(mem_buf, env->cstar);
+        case IDX_MSR_REGS + 9:
+            return gdb_get_reg64(mem_buf, env->kernelgsbase);
 #else
+        case IDX_MSR_REGS + 6:
+        case IDX_MSR_REGS + 7:
+        case IDX_MSR_REGS + 8:
+        case IDX_MSR_REGS + 9:
             return gdb_get_reg32(mem_buf, 0);
 #endif

@@ -330,7 +363,7 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         case IDX_SEG_REGS + 5:
             return x86_cpu_gdb_load_seg(cpu, R_GS, mem_buf);

-        case IDX_SEG_REGS + 6:
+        case IDX_MSR_REGS:
             if (env->hflags & HF_CS64_MASK) {
                 env->segs[R_FS].base = ldq_p(mem_buf);
                 return 8;
@@ -338,7 +371,7 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             env->segs[R_FS].base = ldl_p(mem_buf);
             return 4;

-        case IDX_SEG_REGS + 7:
+        case IDX_MSR_REGS + 1:
             if (env->hflags & HF_CS64_MASK) {
                 env->segs[R_GS].base = ldq_p(mem_buf);
                 return 8;
@@ -346,16 +379,79 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             env->segs[R_GS].base = ldl_p(mem_buf);
             return 4;

-        case IDX_SEG_REGS + 8:
+        case IDX_MSR_REGS + 2:
+            if (env->hflags & HF_CS64_MASK) {
+                env->sysenter_cs = ldq_p(mem_buf);
+                return 8;
+            }
+            env->sysenter_cs = ldl_p(mem_buf);
+            return 4;
+
+        case IDX_MSR_REGS + 3:
+            if (env->hflags & HF_CS64_MASK) {
+                env->sysenter_esp = ldq_p(mem_buf);
+                return 8;
+            }
+            env->sysenter_esp = ldl_p(mem_buf);
+            return 4;
+
+        case IDX_MSR_REGS + 4:
+            if (env->hflags & HF_CS64_MASK) {
+                env->sysenter_eip = ldq_p(mem_buf);
+                return 8;
+            }
+            env->sysenter_eip = ldl_p(mem_buf);
+            return 4;
+
+        case IDX_MSR_REGS + 5:
+            if (env->hflags & HF_CS64_MASK) {
+                env->star = ldq_p(mem_buf);
+                return 8;
+            }
+            env->star = ldl_p(mem_buf);
+            return 4;
+
 #ifdef TARGET_X86_64
+        case IDX_MSR_REGS + 6:
+            if (env->hflags & HF_CS64_MASK) {
+                env->lstar = ldq_p(mem_buf);
+                return 8;
+            }
+            env->lstar = ldl_p(mem_buf);
+            return 4;
+
+        case IDX_MSR_REGS + 7:
+            if (env->hflags & HF_CS64_MASK) {
+                env->cstar = ldq_p(mem_buf);
+                return 8;
+            }
+            env->cstar = ldl_p(mem_buf);
+            return 4;
+
+        case IDX_MSR_REGS + 8:
+            if (env->hflags & HF_CS64_MASK) {
+                env->fmask = ldq_p(mem_buf);
+                return 8;
+            }
+            env->fmask = ldl_p(mem_buf);
+            return 4;
+
+        case IDX_MSR_REGS + 9:
             if (env->hflags & HF_CS64_MASK) {
                 env->kernelgsbase = ldq_p(mem_buf);
                 return 8;
             }
             env->kernelgsbase = ldl_p(mem_buf);
-#endif
             return 4;
+#else
+        case IDX_MSR_REGS + 6:
+        case IDX_MSR_REGS + 7:
+        case IDX_MSR_REGS + 8:
+        case IDX_MSR_REGS + 9:
+            return 4;
+#endif

+        /* The first 8 registers have been addressed in an if block above */
         case IDX_FP_REGS + 8:
             cpu_set_fpuc(env, ldl_p(mem_buf));
             return 4;
--
2.30.0

