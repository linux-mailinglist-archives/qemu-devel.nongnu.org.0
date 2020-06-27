Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB5820C3E0
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 21:53:04 +0200 (CEST)
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpGso-0003tS-Sh
	for lists+qemu-devel@lfdr.de; Sat, 27 Jun 2020 15:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jpGrb-0002MK-VP
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 15:51:47 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jpGra-0003sy-DR
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 15:51:47 -0400
Received: by mail-ed1-x52e.google.com with SMTP id n2so456684edr.5
 for <qemu-devel@nongnu.org>; Sat, 27 Jun 2020 12:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Tps7nMTNDUkl/eAj1enISwY5nRsZq9itXUGQjMYdQXM=;
 b=ekDlIumK/wO3tCGoOxnefGrmZGhDlHGEgCaJgQCU+M2uX6c9XiVTTcriio43eQvTd4
 zVO9HDHl/jzeYWPVA1bmOp8fuF9sYClBhGo0C2sg+70KEkMZCdhrZDEubVI2XpKWYcYe
 Py1YUvyYLzAhfv2DftCY+CCZw1PzB4/7BignIQvjP8AYtL8v6unfHh58TmOuv2LOeVCR
 sUwQprO7rK74FFVQp51VC+Fhc0WTyV//ZwROdndh6kD7olbORgcqe9vvIYSIIGNY1wk6
 e+pz+aGs9eZ7bHe9vmQliARzGkEzUum1f/LPnVON2bh/TON+jZarB26gPNvG6UxrNajr
 YwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Tps7nMTNDUkl/eAj1enISwY5nRsZq9itXUGQjMYdQXM=;
 b=s1xVFjWjRjDy9QoTRrFzV+DgjETahU5Xm24d6Bihg+lDaD7nBdBN8jfN4a//8quQFp
 xeTtKRaZ7Lu9kEhbbSJVCOUnA8qil1tGwENBmeCjQmcpV/6064InZkmkvXAwWoMSV2/c
 9i58/ou1pKOfvc6iitT8wYgd5BRjyY+D2uE17Bvk57ABTbIon+CP6NObRSQknLD8dLBK
 YtjouxNVmiVmGq1mck9XZ2WabdQtBKf82JkbvWSFuOHBycgWlFw99nfTBS9kTUvacT39
 M404fGVl6tm7oHPyvPJUMM4agz2pivq2rxPba4dPC7bkXcdazqXWkqLAOhNbXpHHk17W
 WghA==
X-Gm-Message-State: AOAM531LRQVL1enUhC0fPqDyD8Jdk8Kla3/qG19PZTJD5GGx84WB8XYX
 i4rYTc95MVmNyOUWFJoMiv7kUs6R
X-Google-Smtp-Source: ABdhPJwbyd2Dw2lk7nO7/LWjnxYvdkOrlkzgJIWrNuakUPecF66zMgbpXUPeF1u1P65OXfLK0NZeEQ==
X-Received: by 2002:a05:6402:17ee:: with SMTP id
 t14mr6591824edy.359.1593287504913; 
 Sat, 27 Jun 2020 12:51:44 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id y11sm5298734ejw.63.2020.06.27.12.51.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Jun 2020 12:51:44 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 1/6] hw/mips: Implement the kvm_type() hook in MachineClass
Date: Sat, 27 Jun 2020 21:51:38 +0200
Message-Id: <1593287503-25197-2-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593287503-25197-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1593287503-25197-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-ed1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.qemu.devel@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Huacai Chen <zltjiangshi@gmail.com>

MIPS has two types of KVM: TE & VZ, and TE is the default type. Now we
can't create a VZ guest in QEMU because it lacks the kvm_type() hook in
MachineClass. This patch add the the kvm_type() hook to support both of
the two types.

[AM: Added "if defined" guards.]

Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <1592995531-32600-2-git-send-email-chenhc@lemote.com>
---
 target/mips/kvm_mips.h | 11 +++++++++++
 target/mips/kvm.c      | 26 ++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/mips/kvm_mips.h b/target/mips/kvm_mips.h
index 1e40147..171d53d 100644
--- a/target/mips/kvm_mips.h
+++ b/target/mips/kvm_mips.h
@@ -12,6 +12,8 @@
 #ifndef KVM_MIPS_H
 #define KVM_MIPS_H
 
+#include "cpu.h"
+
 /**
  * kvm_mips_reset_vcpu:
  * @cpu: MIPSCPU
@@ -23,4 +25,13 @@ void kvm_mips_reset_vcpu(MIPSCPU *cpu);
 int kvm_mips_set_interrupt(MIPSCPU *cpu, int irq, int level);
 int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int irq, int level);
 
+#ifdef CONFIG_KVM
+int mips_kvm_type(MachineState *machine, const char *vm_type);
+#else
+static inline int mips_kvm_type(MachineState *machine, const char *vm_type)
+{
+    return 0;
+}
+#endif
+
 #endif /* KVM_MIPS_H */
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 96cfa10..72637a1 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -21,10 +21,12 @@
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
 #include "sysemu/kvm.h"
+#include "sysemu/kvm_int.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpus.h"
 #include "kvm_mips.h"
 #include "exec/memattrs.h"
+#include "hw/boards.h"
 
 #define DEBUG_KVM 0
 
@@ -1270,3 +1272,27 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
 {
     abort();
 }
+
+int mips_kvm_type(MachineState *machine, const char *vm_type)
+{
+#if defined(KVM_CAP_MIPS_VZ) || defined(KVM_CAP_MIPS_TE)
+    int r;
+    KVMState *s = KVM_STATE(machine->accelerator);
+#endif
+
+#if defined(KVM_CAP_MIPS_VZ)
+    r = kvm_check_extension(s, KVM_CAP_MIPS_VZ);
+    if (r > 0) {
+        return KVM_VM_MIPS_VZ;
+    }
+#endif
+
+#if defined(KVM_CAP_MIPS_TE)
+    r = kvm_check_extension(s, KVM_CAP_MIPS_TE);
+    if (r > 0) {
+        return KVM_VM_MIPS_TE;
+    }
+#endif
+
+    return -1;
+}
-- 
2.7.4


