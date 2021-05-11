Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B32A37A1AF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:24:55 +0200 (CEST)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNhG-0004r8-7U
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNX1-0001yC-Ch
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWm-0000mA-C5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIKHCqVKFxqnSYiXR4PVcWeMTyphdyflv7h8WUoOadA=;
 b=NTJ72VWHDyT/Qi5onps1B0ztyGLT/RYvJtrPumI7d/+ggVuNhEJlltWIfzywBLX28FniVr
 XSw4cl4Ry9ZL7V4u8MSfLDwmcmVuomSJ3EoAjVNk61Bk6atHVPbj5FHm8PJWVjbMvyVnQQ
 EtSBl9D0DXzmMzWsATsJxGkJF0J2U7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-HCUCPowYO9eQtb_LTIxzMg-1; Tue, 11 May 2021 04:14:01 -0400
X-MC-Unique: HCUCPowYO9eQtb_LTIxzMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E2E61854E24;
 Tue, 11 May 2021 08:14:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFA7EE2DA;
 Tue, 11 May 2021 08:13:59 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/33] target/i386: gdbstub: introduce aux functions to
 read/write CS64 regs
Date: Tue, 11 May 2021 04:13:34 -0400
Message-Id: <20210511081350.419428-18-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

a number of registers are read as 64bit under the condition that
(hflags & HF_CS64_MASK) || TARGET_X86_64)

and a number of registers are written as 64bit under the condition that
(hflags & HF_CS64_MASK).

Provide some auxiliary functions that do that.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210322132800.7470-20-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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



