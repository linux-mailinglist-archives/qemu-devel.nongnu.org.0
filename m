Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A1534461F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:46:09 +0100 (CET)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKsi-0002hJ-H0
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOKbb-0001AJ-CO
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:28:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:45396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOKbX-0001mT-GC
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:28:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 337ABAD8D;
 Mon, 22 Mar 2021 13:28:12 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v28 18/23] target/i386: gdbstub: introduce aux functions to
 read/write CS64 regs
Date: Mon, 22 Mar 2021 14:27:55 +0100
Message-Id: <20210322132800.7470-20-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322132800.7470-1-cfontana@suse.de>
References: <20210322132800.7470-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

a number of registers are read as 64bit under the condition that
(hflags & HF_CS64_MASK) || TARGET_X86_64)

and a number of registers are written as 64bit under the condition that
(hflags & HF_CS64_MASK).

Provide some auxiliary functions that do that.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/gdbstub.c | 155 ++++++++++++++----------------------------
 1 file changed, 51 insertions(+), 104 deletions(-)

diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 41e265fc67..4ad1295425 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -78,6 +78,23 @@ static const int gpr_map32[8] = { 0, 1, 2, 3, 4, 5, 6, 7 };
 #define GDB_FORCE_64 0
 #endif
 
+static int gdb_read_reg_cs64(uint32_t hflags, GByteArray *buf, target_ulong val)
+{
+    if ((hflags & HF_CS64_MASK) || GDB_FORCE_64) {
+        return gdb_get_reg64(buf, val);
+    }
+    return gdb_get_reg32(buf, val);
+}
+
+static int gdb_write_reg_cs64(uint32_t hflags, uint8_t *buf, target_ulong *val)
+{
+    if (hflags & HF_CS64_MASK) {
+        *val = ldq_p(buf);
+        return 8;
+    }
+    *val = ldl_p(buf);
+    return 4;
+}
 
 int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
@@ -142,25 +159,14 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
             return gdb_get_reg32(mem_buf, env->segs[R_FS].selector);
         case IDX_SEG_REGS + 5:
             return gdb_get_reg32(mem_buf, env->segs[R_GS].selector);
-
         case IDX_SEG_REGS + 6:
-            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
-                return gdb_get_reg64(mem_buf, env->segs[R_FS].base);
-            }
-            return gdb_get_reg32(mem_buf, env->segs[R_FS].base);
-
+            return gdb_read_reg_cs64(env->hflags, mem_buf, env->segs[R_FS].base);
         case IDX_SEG_REGS + 7:
-            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
-                return gdb_get_reg64(mem_buf, env->segs[R_GS].base);
-            }
-            return gdb_get_reg32(mem_buf, env->segs[R_GS].base);
+            return gdb_read_reg_cs64(env->hflags, mem_buf, env->segs[R_GS].base);
 
         case IDX_SEG_REGS + 8:
 #ifdef TARGET_X86_64
-            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
-                return gdb_get_reg64(mem_buf, env->kernelgsbase);
-            }
-            return gdb_get_reg32(mem_buf, env->kernelgsbase);
+            return gdb_read_reg_cs64(env->hflags, mem_buf, env->kernelgsbase);
 #else
             return gdb_get_reg32(mem_buf, 0);
 #endif
@@ -188,45 +194,23 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
             return gdb_get_reg32(mem_buf, env->mxcsr);
 
         case IDX_CTL_CR0_REG:
-            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
-                return gdb_get_reg64(mem_buf, env->cr[0]);
-            }
-            return gdb_get_reg32(mem_buf, env->cr[0]);
-
+            return gdb_read_reg_cs64(env->hflags, mem_buf, env->cr[0]);
         case IDX_CTL_CR2_REG:
-            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
-                return gdb_get_reg64(mem_buf, env->cr[2]);
-            }
-            return gdb_get_reg32(mem_buf, env->cr[2]);
-
+            return gdb_read_reg_cs64(env->hflags, mem_buf, env->cr[2]);
         case IDX_CTL_CR3_REG:
-            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
-                return gdb_get_reg64(mem_buf, env->cr[3]);
-            }
-            return gdb_get_reg32(mem_buf, env->cr[3]);
-
+            return gdb_read_reg_cs64(env->hflags, mem_buf, env->cr[3]);
         case IDX_CTL_CR4_REG:
-            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
-                return gdb_get_reg64(mem_buf, env->cr[4]);
-            }
-            return gdb_get_reg32(mem_buf, env->cr[4]);
-
+            return gdb_read_reg_cs64(env->hflags, mem_buf, env->cr[4]);
         case IDX_CTL_CR8_REG:
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
             tpr = cpu_get_apic_tpr(cpu->apic_state);
 #else
             tpr = 0;
 #endif
-            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
-                return gdb_get_reg64(mem_buf, tpr);
-            }
-            return gdb_get_reg32(mem_buf, tpr);
+            return gdb_read_reg_cs64(env->hflags, mem_buf, tpr);
 
         case IDX_CTL_EFER_REG:
-            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
-                return gdb_get_reg64(mem_buf, env->efer);
-            }
-            return gdb_get_reg32(mem_buf, env->efer);
+            return gdb_read_reg_cs64(env->hflags, mem_buf, env->efer);
         }
     }
     return 0;
@@ -266,7 +250,8 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
-    uint32_t tmp;
+    target_ulong tmp;
+    int len;
 
     /* N.B. GDB can't deal with changes in registers or sizes in the middle
        of a session. So if we're in 32-bit mode on a 64-bit cpu, still act
@@ -329,30 +314,13 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             return x86_cpu_gdb_load_seg(cpu, R_FS, mem_buf);
         case IDX_SEG_REGS + 5:
             return x86_cpu_gdb_load_seg(cpu, R_GS, mem_buf);
-
         case IDX_SEG_REGS + 6:
-            if (env->hflags & HF_CS64_MASK) {
-                env->segs[R_FS].base = ldq_p(mem_buf);
-                return 8;
-            }
-            env->segs[R_FS].base = ldl_p(mem_buf);
-            return 4;
-
+            return gdb_write_reg_cs64(env->hflags, mem_buf, &env->segs[R_FS].base);
         case IDX_SEG_REGS + 7:
-            if (env->hflags & HF_CS64_MASK) {
-                env->segs[R_GS].base = ldq_p(mem_buf);
-                return 8;
-            }
-            env->segs[R_GS].base = ldl_p(mem_buf);
-            return 4;
-
+            return gdb_write_reg_cs64(env->hflags, mem_buf, &env->segs[R_GS].base);
         case IDX_SEG_REGS + 8:
 #ifdef TARGET_X86_64
-            if (env->hflags & HF_CS64_MASK) {
-                env->kernelgsbase = ldq_p(mem_buf);
-                return 8;
-            }
-            env->kernelgsbase = ldl_p(mem_buf);
+            return gdb_write_reg_cs64(env->hflags, mem_buf, &env->kernelgsbase);
 #endif
             return 4;
 
@@ -382,57 +350,36 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             return 4;
 
         case IDX_CTL_CR0_REG:
-            if (env->hflags & HF_CS64_MASK) {
-                cpu_x86_update_cr0(env, ldq_p(mem_buf));
-                return 8;
-            }
-            cpu_x86_update_cr0(env, ldl_p(mem_buf));
-            return 4;
+            len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+            cpu_x86_update_cr0(env, tmp);
+            return len;
 
         case IDX_CTL_CR2_REG:
-            if (env->hflags & HF_CS64_MASK) {
-                env->cr[2] = ldq_p(mem_buf);
-                return 8;
-            }
-            env->cr[2] = ldl_p(mem_buf);
-            return 4;
+            len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+            env->cr[2] = tmp;
+            return len;
 
         case IDX_CTL_CR3_REG:
-            if (env->hflags & HF_CS64_MASK) {
-                cpu_x86_update_cr3(env, ldq_p(mem_buf));
-                return 8;
-            }
-            cpu_x86_update_cr3(env, ldl_p(mem_buf));
-            return 4;
+            len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+            cpu_x86_update_cr3(env, tmp);
+            return len;
 
         case IDX_CTL_CR4_REG:
-            if (env->hflags & HF_CS64_MASK) {
-                cpu_x86_update_cr4(env, ldq_p(mem_buf));
-                return 8;
-            }
-            cpu_x86_update_cr4(env, ldl_p(mem_buf));
-            return 4;
+            len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+            cpu_x86_update_cr4(env, tmp);
+            return len;
 
         case IDX_CTL_CR8_REG:
-            if (env->hflags & HF_CS64_MASK) {
-#ifdef CONFIG_SOFTMMU
-                cpu_set_apic_tpr(cpu->apic_state, ldq_p(mem_buf));
+            len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+#ifndef CONFIG_USER_ONLY
+            cpu_set_apic_tpr(cpu->apic_state, tmp);
 #endif
-                return 8;
-            }
-#ifdef CONFIG_SOFTMMU
-            cpu_set_apic_tpr(cpu->apic_state, ldl_p(mem_buf));
-#endif
-            return 4;
+            return len;
 
         case IDX_CTL_EFER_REG:
-            if (env->hflags & HF_CS64_MASK) {
-                cpu_load_efer(env, ldq_p(mem_buf));
-                return 8;
-            }
-            cpu_load_efer(env, ldl_p(mem_buf));
-            return 4;
-
+            len = gdb_write_reg_cs64(env->hflags, mem_buf, &tmp);
+            cpu_load_efer(env, tmp);
+            return len;
         }
     }
     /* Unrecognised register.  */
-- 
2.26.2


