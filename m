Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A84DD61B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 09:28:19 +0100 (CET)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV7y6-0007hO-K9
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 04:28:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nV7tt-0005dv-OZ
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:23:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:23483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nV7ts-0002IT-3M
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647591836; x=1679127836;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=2B0jRUQkDPhNOC+pX7zn7Y+wP0pcFv2VGOcVYjoAfPg=;
 b=b+YJPfQfehzyhrlJRLVlRX2XmdCDFQ4r+r33+C5ncZ821fzUCSbfhX5O
 FEm8sd1mHQ/Bp8TzT0rlCaOO61LZrtQPuy8oefOxkFIVVMp4pIwF2T0ay
 t/QPhG+YsLXoUEHJPC2zxCQ0dZ6JXorhC5i5WPCgIhhzCMedUUBemZzMR
 yjOmDKM6LaEXZ7qyu4XRvJUF1tbcQMFu6IVfn5tqn+6XfDxWV2dVjChP/
 46qdhUGqHGazlP7VmAtDbHb4SDVKiB+MG+0rVN72TqDPRBE2m3ePIoqrO
 OVUObhJH6jexkFhjwBG/Kb9YjJxI2KF0SRKGYQkMIJgSoRX2Gn11SwBvA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="257280673"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="257280673"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 01:23:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="558320573"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 01:23:52 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH v2 2/3] i386: kvm: Save&restore triple fault event
Date: Fri, 18 Mar 2022 16:29:33 +0800
Message-Id: <20220318082934.25030-3-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220318082934.25030-1-chenyi.qiang@intel.com>
References: <20220318082934.25030-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=chenyi.qiang@intel.com; helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the direct triple faults, i.e. hardware detected and KVM morphed
to VM-Exit, KVM will never lose them. But for triple faults sythesized
by KVM, e.g. the RSM path, if KVM exits to userspace before the request
is serviced, userspace coud migrate the VM and lose the triple fault.

A new flag KVM_VCPUEVENT_TRIPLE_FAULT is defined to signal that there's
triple fault event waiting to be serviced. Track it and save/restore
during get/set_vcpu_events().

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c     |  1 +
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 10 ++++++++++
 3 files changed, 12 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6c7ef1099b..dbfecf46a0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5918,6 +5918,7 @@ static void x86_cpu_reset(DeviceState *dev)
     env->exception_has_payload = false;
     env->exception_payload = 0;
     env->nmi_injected = false;
+    env->has_triple_fault = false;
 #if !defined(CONFIG_USER_ONLY)
     /* We hard-wire the BSP to the first CPU. */
     apic_designate_bsp(cpu->apic_state, s->cpu_index == 0);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e11734ba86..5a2a005ae8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1659,6 +1659,7 @@ typedef struct CPUArchState {
     uint8_t has_error_code;
     uint8_t exception_has_payload;
     uint64_t exception_payload;
+    bool has_triple_fault;
     uint32_t ins_len;
     uint32_t sipi_vector;
     bool tsc_valid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 83d0988302..3159c9cefe 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4041,6 +4041,10 @@ static int kvm_put_vcpu_events(X86CPU *cpu, int level)
         }
     }
 
+    if (env->has_triple_fault) {
+        events.flags |= KVM_VCPUEVENT_TRIPLE_FAULT;
+    }
+
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
 }
 
@@ -4110,6 +4114,12 @@ static int kvm_get_vcpu_events(X86CPU *cpu)
         }
     }
 
+    if (events.flags & KVM_VCPUEVENT_TRIPLE_FAULT) {
+        env->has_triple_fault = true;
+    } else {
+        env->has_triple_fault = false;
+    }
+
     env->sipi_vector = events.sipi_vector;
 
     return 0;
-- 
2.17.1


