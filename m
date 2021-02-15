Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFCD31BA63
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:31:45 +0100 (CET)
Received: from localhost ([::1]:49590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdya-0000Z5-NB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjv-0005UU-Ct
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:35 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjt-0005VK-Jm
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:35 -0500
Received: by mail-ed1-x534.google.com with SMTP id v9so3592210edw.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJI3qM7gIOXePDLd73m8wlmDXyNbPRnqK0YSUpDiyi0=;
 b=AtQD/u70Fv/u26K0rE5+n/ktk5mmCF6vE+D2To/Icxqd0wuU6emNLgNRISZ5PDC5Ff
 XLstY+5xAKugacxRW3itkd8lSOV1wfrHuTlY5RaBBx19TzhV8t+PlQoumaiJij6Cr5l0
 KiBUOdruKqslTy5TD0mYV3VF9la4CmAwB+3rwSDKTDDiGld0R98Vl2SVfsza9I6xN2yc
 GG0g2jbj1jEEznplzAvCU8LHSdBweNKXYRs2SiZVOheyw0bhcZuwUZJwWmYVukIzoif3
 wlrfI1riCxWQ4yMovGyyfiydPZufdhgDi603Dqbf6Q6UnR+2150Ui2J1XQrJPASnOHc3
 2Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OJI3qM7gIOXePDLd73m8wlmDXyNbPRnqK0YSUpDiyi0=;
 b=Gw6+p7RKo2glpZSn/dx2ReP1TuLmsKwK+MUmrq9M8tSeo+nqInh+iYOlK6LBDPNcfm
 qwKqkRMIRE3hK6NJ9eFVkiz2jzHMBDCDG1/KvnN1gGSFXWUukrGD/kbmG6jB3kCq4MGD
 w4jFGL05J5Nt8mmduTygguhK3u4TuOEQ1OcnIGCkAP99x95ShI2gSfyNq3iBrUHCBkXV
 QkCBF+uFTAda4SYFVZ2Kyd2taxR8KZOmzVOS251fU2kS8dLyHlTpR8KnZZLoFVAbqY74
 RLTb4SKJ2sRZDe1/88n2/T5Q7aKioDNTl34sfxYHx6sRTUZ5xSe3o3K3/68RAWm2SNCg
 mZbw==
X-Gm-Message-State: AOAM530dAg0u/Q5w5OVWHu2utXIPW4NEHz9bU2vY+Nl5HiUR6YWTJk1Q
 y7RShaZilFjcqKS+cJ85yy0tZPzhsuY=
X-Google-Smtp-Source: ABdhPJz7j+X6NtzdNy1/SsJNsiwTjpmVzXcVZKbafGONuZfY2okZiU1ZGELrndDVGtIoE+KyREwWsQ==
X-Received: by 2002:a05:6402:1806:: with SMTP id
 g6mr4588088edy.120.1613394992312; 
 Mon, 15 Feb 2021 05:16:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/19] sev/i386: Don't allow a system reset under an SEV-ES
 guest
Date: Mon, 15 Feb 2021 14:16:13 +0100
Message-Id: <20210215131626.65640-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Venu Busireddy <venu.busireddy@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

An SEV-ES guest does not allow register state to be altered once it has
been measured. When an SEV-ES guest issues a reboot command, Qemu will
reset the vCPU state and resume the guest. This will cause failures under
SEV-ES. Prevent that from occuring by introducing an arch-specific
callback that returns a boolean indicating whether vCPUs are resettable.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: David Hildenbrand <david@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Venu Busireddy <venu.busireddy@oracle.com>
Message-Id: <1ac39c441b9a3e970e9556e1cc29d0a0814de6fd.1611682609.git.thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c       |  5 +++++
 include/sysemu/cpus.h     |  2 ++
 include/sysemu/hw_accel.h |  5 +++++
 include/sysemu/kvm.h      | 10 ++++++++++
 softmmu/cpus.c            |  5 +++++
 softmmu/runstate.c        |  3 +++
 target/arm/kvm.c          |  5 +++++
 target/i386/kvm/kvm.c     |  6 ++++++
 target/mips/kvm.c         |  5 +++++
 target/ppc/kvm.c          |  5 +++++
 target/s390x/kvm.c        |  5 +++++
 11 files changed, 56 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index bf61ef4b54..84c943fcdb 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2312,6 +2312,11 @@ void kvm_flush_coalesced_mmio_buffer(void)
     s->coalesced_flush_in_progress = false;
 }
 
+bool kvm_cpu_check_are_resettable(void)
+{
+    return kvm_arch_cpu_check_are_resettable();
+}
+
 static void do_kvm_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
 {
     if (!cpu->vcpu_dirty) {
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index 2cd74392e0..868f1192de 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -41,6 +41,8 @@ extern int icount_align_option;
 /* Unblock cpu */
 void qemu_cpu_kick_self(void);
 
+bool cpus_are_resettable(void);
+
 void cpu_synchronize_all_states(void);
 void cpu_synchronize_all_post_reset(void);
 void cpu_synchronize_all_post_init(void);
diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
index ffed6192a3..61672f9b32 100644
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -22,4 +22,9 @@ void cpu_synchronize_post_reset(CPUState *cpu);
 void cpu_synchronize_post_init(CPUState *cpu);
 void cpu_synchronize_pre_loadvm(CPUState *cpu);
 
+static inline bool cpu_check_are_resettable(void)
+{
+    return kvm_enabled() ? kvm_cpu_check_are_resettable() : true;
+}
+
 #endif /* QEMU_HW_ACCEL_H */
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index c5546bdecc..687c598be9 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -541,4 +541,14 @@ int kvm_get_max_memslots(void);
 /* Notify resamplefd for EOI of specific interrupts. */
 void kvm_resample_fd_notify(int gsi);
 
+/**
+ * kvm_cpu_check_are_resettable - return whether CPUs can be reset
+ *
+ * Returns: true: CPUs are resettable
+ *          false: CPUs are not resettable
+ */
+bool kvm_cpu_check_are_resettable(void);
+
+bool kvm_arch_cpu_check_are_resettable(void);
+
 #endif
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 112eba9d54..a7ee431187 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -194,6 +194,11 @@ void cpu_synchronize_pre_loadvm(CPUState *cpu)
     }
 }
 
+bool cpus_are_resettable(void)
+{
+    return cpu_check_are_resettable();
+}
+
 int64_t cpus_get_virtual_clock(void)
 {
     /*
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index a7fcb603f7..2874417b61 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -528,6 +528,9 @@ void qemu_system_reset_request(ShutdownCause reason)
     if (reboot_action == REBOOT_ACTION_SHUTDOWN &&
         reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
         shutdown_requested = reason;
+    } else if (!cpus_are_resettable()) {
+        error_report("cpus are not resettable, terminating");
+        shutdown_requested = reason;
     } else {
         reset_requested = reason;
     }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ffe186de8d..00e124c812 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1045,3 +1045,8 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
 {
     return (data - 32) & 0xffff;
 }
+
+bool kvm_arch_cpu_check_are_resettable(void)
+{
+    return true;
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f56a8536d0..d10667b21b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -27,6 +27,7 @@
 #include "sysemu/kvm_int.h"
 #include "sysemu/runstate.h"
 #include "kvm_i386.h"
+#include "sev_i386.h"
 #include "hyperv.h"
 #include "hyperv-proto.h"
 
@@ -4821,3 +4822,8 @@ bool kvm_has_waitpkg(void)
 {
     return has_msr_umwait;
 }
+
+bool kvm_arch_cpu_check_are_resettable(void)
+{
+    return !sev_es_enabled();
+}
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 84fb10ea35..123ec1be7e 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -1290,3 +1290,8 @@ int mips_kvm_type(MachineState *machine, const char *vm_type)
 
     return -1;
 }
+
+bool kvm_arch_cpu_check_are_resettable(void)
+{
+    return true;
+}
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 0c5056dd5b..298c1f882c 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2929,3 +2929,8 @@ void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset)
         kvm_set_one_reg(cs, KVM_REG_PPC_TB_OFFSET, &tb_offset);
     }
 }
+
+bool kvm_arch_cpu_check_are_resettable(void)
+{
+    return true;
+}
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index dc27fa36c9..7a892d663d 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -2599,3 +2599,8 @@ void kvm_s390_stop_interrupt(S390CPU *cpu)
 
     kvm_s390_vcpu_interrupt(cpu, &irq);
 }
+
+bool kvm_arch_cpu_check_are_resettable(void)
+{
+    return true;
+}
-- 
2.29.2



