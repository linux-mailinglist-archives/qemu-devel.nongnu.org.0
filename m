Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7CB34B02B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:30:52 +0100 (CET)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPt6Z-0000q6-2W
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHl-0007LW-6V
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:46180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHh-0001IP-N4
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67911AF26;
 Fri, 26 Mar 2021 19:38:06 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 54/65] target/arm: arch_dump: restrict ELFCLASS64 to AArch64
Date: Fri, 26 Mar 2021 20:36:50 +0100
Message-Id: <20210326193701.5981-55-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this will allow us to restrict more code to TARGET_AARCH64

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/arch_dump.c | 12 +++++++-----
 target/arm/cpu.c       |  1 -
 target/arm/cpu64.c     |  4 ++++
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 0184845310..9cc75a6fda 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -23,6 +23,8 @@
 #include "elf.h"
 #include "sysemu/dump.h"
 
+#ifdef TARGET_AARCH64
+
 /* struct user_pt_regs from arch/arm64/include/uapi/asm/ptrace.h */
 struct aarch64_user_regs {
     uint64_t regs[31];
@@ -141,7 +143,6 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
     return 0;
 }
 
-#ifdef TARGET_AARCH64
 static off_t sve_zreg_offset(uint32_t vq, int n)
 {
     off_t off = sizeof(struct aarch64_user_sve_header);
@@ -229,7 +230,6 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
 
     return 0;
 }
-#endif
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque)
@@ -272,15 +272,15 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
         return ret;
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sve, cpu)) {
         ret = aarch64_write_elf64_sve(f, env, cpuid, s);
     }
-#endif
 
     return ret;
 }
 
+#endif /* TARGET_AARCH64 */
+
 /* struct pt_regs from arch/arm/include/asm/ptrace.h */
 struct arm_user_regs {
     uint32_t regs[17];
@@ -449,12 +449,14 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     size_t note_size;
 
     if (class == ELFCLASS64) {
+#ifdef TARGET_AARCH64
         note_size = AARCH64_PRSTATUS_NOTE_SIZE;
         note_size += AARCH64_PRFPREG_NOTE_SIZE;
-#ifdef TARGET_AARCH64
         if (cpu_isar_feature(aa64_sve, cpu)) {
             note_size += AARCH64_SVE_NOTE_SIZE(&cpu->env);
         }
+#else
+        return -1; /* unsupported */
 #endif
     } else {
         note_size = ARM_PRSTATUS_NOTE_SIZE;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 78ffd72f6a..195fe49fbf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1391,7 +1391,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
-    cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
 #endif
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4c758ab5a4..52d8bff267 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -636,6 +636,10 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_arch_name = aarch64_gdb_arch_name;
     cc->dump_state = arm_cpu_dump_state;
 
+#ifndef CONFIG_USER_ONLY
+    cc->write_elf64_note = arm_cpu_write_elf64_note;
+#endif /* !CONFIG_USER_ONLY */
+
     object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
                                    aarch64_cpu_set_aarch64);
     object_class_property_set_description(oc, "aarch64",
-- 
2.26.2


