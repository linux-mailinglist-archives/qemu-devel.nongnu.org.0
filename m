Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D80531BA42
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:24:53 +0100 (CET)
Received: from localhost ([::1]:33416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdrw-0002LW-9h
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdju-0005SN-Gc
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:34 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjs-0005UQ-OT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:34 -0500
Received: by mail-ed1-x536.google.com with SMTP id o3so5823384edv.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76dw5Z0xlzDF5DA6fvM+I0AFUB+e7NqGmYzkTWS3sPw=;
 b=Yl4pO/A9LjcojS9TmgJ7b5V1bS+tCnPCsMcU1UHfjX4/7pM3XTptsmcwkzu+8T04mQ
 ng2vAAvCbH/pTlDzvubDtSRFfb9vwkTy7E6BjzNQXvSpw2CdQ42CLx7iRKPRg9rSg4In
 /XDgQvcZdTFbCwD1/eVcLkbkDXKK8YMo6d80HDLN8Ra7wQFnfqE1TYRJKUX1adHXkpi6
 DvwO/m698nDiEQbyt6dHFAx5mXfz1YOZ8XT0vAVkQgHvyGanj8tbtSmW7m5l509iJuan
 bwWv0B4I3jvQZECjr3L0Z9mWQLB1AtV/BGhUNvcBWiTyTJ0lWbRI2f0HbY7S5amWQsHb
 Zuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=76dw5Z0xlzDF5DA6fvM+I0AFUB+e7NqGmYzkTWS3sPw=;
 b=CTnRkoOzLVJ1dpGOW5Pj7ZqUtn4DOnZSI+ln933Ax4FzIsjvgKymSg+Xd8YKw+wz3z
 QokfczVj2QVWTF8hFvkxneoDsGpUw+K0FD2ddTGNQxZuX/qLPrIYoKGluXlTz5ICo43X
 ITeMZqnuxgJ7/UJIBDNsxA1A1VG/fnHn/2X0bavCokJxhoo662n6R1b9HjBVBm0Y7+25
 lw0atM0oA/ngJB+kr3jY787X1jCNIhJSJHaSUjDTfzQZD+EBqYBpW+02SvzPhn28hkw8
 JRx+pk9uaUmlwFg6GwPMgAn8prd5YXL0TTJotmrYpSsbIhs3uucReKf7ZwJRe9G8uqd8
 E6cg==
X-Gm-Message-State: AOAM530F0naIg7ywal3H6RjmY6V7Lgcxmt5DZ1OR5z2sh6O9y2SQCFyv
 MGLAEowPq9O7yK7VIfk+rE5c5ZTTUQo=
X-Google-Smtp-Source: ABdhPJzaY+LZWIQhZjqUJtcHv8YnJB+QNvH+kC8/ffOqTT0qg1v7Qm71uFJk93sj0Ywx0AzVpoR0Lw==
X-Received: by 2002:a05:6402:1152:: with SMTP id
 g18mr15736771edw.18.1613394991461; 
 Mon, 15 Feb 2021 05:16:31 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/19] sev/i386: Allow AP booting under SEV-ES
Date: Mon, 15 Feb 2021 14:16:12 +0100
Message-Id: <20210215131626.65640-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When SEV-ES is enabled, it is not possible modify the guests register
state after it has been initially created, encrypted and measured.

Normally, an INIT-SIPI-SIPI request is used to boot the AP. However, the
hypervisor cannot emulate this because it cannot update the AP register
state. For the very first boot by an AP, the reset vector CS segment
value and the EIP value must be programmed before the register has been
encrypted and measured. Search the guest firmware for the guest for a
specific GUID that tells Qemu the value of the reset vector to use.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Message-Id: <22db2bfb4d6551aed661a9ae95b4fdbef613ca21.1611682609.git.thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c    |   1 -
 hw/i386/pc_sysfw.c     |   8 +++
 include/sysemu/sev.h   |   4 ++
 target/i386/kvm/kvm.c  |   2 +
 target/i386/sev-stub.c |   9 +++
 target/i386/sev.c      | 128 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 151 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 47516913b7..bf61ef4b54 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -39,7 +39,6 @@
 #include "qemu/main-loop.h"
 #include "trace.h"
 #include "hw/irq.h"
-#include "sysemu/sev.h"
 #include "qapi/visitor.h"
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-visit-common.h"
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 6404b5a86f..9fe72b370e 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -256,6 +256,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
     MemoryRegion *flash_mem;
     void *flash_ptr;
     int flash_size;
+    int ret;
 
     assert(PC_MACHINE_GET_CLASS(pcms)->pci_enabled);
 
@@ -308,6 +309,13 @@ static void pc_system_flash_map(PCMachineState *pcms,
                  * search for them
                  */
                 pc_system_parse_ovmf_flash(flash_ptr, flash_size);
+
+                ret = sev_es_save_reset_vector(flash_ptr, flash_size);
+                if (ret) {
+                    error_report("failed to locate and/or save reset vector");
+                    exit(1);
+                }
+
                 sev_encrypt_flash(flash_ptr, flash_size, &error_fatal);
             }
         }
diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 882e8a4fb1..94d821d737 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -21,4 +21,8 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
                              uint64_t gpa, Error **errp);
+
+int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
+void sev_es_set_reset_vector(CPUState *cpu);
+
 #endif
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e97f841757..f56a8536d0 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1922,6 +1922,8 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
     }
     /* enabled by default */
     env->poll_control_msr = 1;
+
+    sev_es_set_reset_vector(CPU(cpu));
 }
 
 void kvm_arch_do_init_vcpu(X86CPU *cpu)
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index edf6c519d7..0207f1c5aa 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -65,3 +65,12 @@ bool sev_es_enabled(void)
 {
     return false;
 }
+
+void sev_es_set_reset_vector(CPUState *cpu)
+{
+}
+
+int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
+{
+    abort();
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 35b9259bfc..4b70d4284f 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -22,6 +22,7 @@
 #include "qom/object_interfaces.h"
 #include "qemu/base64.h"
 #include "qemu/module.h"
+#include "qemu/uuid.h"
 #include "sysemu/kvm.h"
 #include "sev_i386.h"
 #include "sysemu/sysemu.h"
@@ -32,6 +33,7 @@
 #include "exec/address-spaces.h"
 #include "monitor/monitor.h"
 #include "exec/confidential-guest-support.h"
+#include "hw/i386/pc.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
@@ -67,11 +69,21 @@ struct SevGuestState {
     int sev_fd;
     SevState state;
     gchar *measurement;
+
+    uint32_t reset_cs;
+    uint32_t reset_ip;
+    bool reset_data_valid;
 };
 
 #define DEFAULT_GUEST_POLICY    0x1 /* disable debug */
 #define DEFAULT_SEV_DEVICE      "/dev/sev"
 
+#define SEV_INFO_BLOCK_GUID     "00f771de-1a7e-4fcb-890e-68c77e2fb44e"
+typedef struct __attribute__((__packed__)) SevInfoBlock {
+    /* SEV-ES Reset Vector Address */
+    uint32_t reset_addr;
+} SevInfoBlock;
+
 static SevGuestState *sev_guest;
 static Error *sev_mig_blocker;
 
@@ -879,6 +891,122 @@ int sev_inject_launch_secret(const char *packet_hdr, const char *secret,
     return 0;
 }
 
+static int
+sev_es_parse_reset_block(SevInfoBlock *info, uint32_t *addr)
+{
+    if (!info->reset_addr) {
+        error_report("SEV-ES reset address is zero");
+        return 1;
+    }
+
+    *addr = info->reset_addr;
+
+    return 0;
+}
+
+static int
+sev_es_find_reset_vector(void *flash_ptr, uint64_t flash_size,
+                         uint32_t *addr)
+{
+    QemuUUID info_guid, *guid;
+    SevInfoBlock *info;
+    uint8_t *data;
+    uint16_t *len;
+
+    /*
+     * Initialize the address to zero. An address of zero with a successful
+     * return code indicates that SEV-ES is not active.
+     */
+    *addr = 0;
+
+    /*
+     * Extract the AP reset vector for SEV-ES guests by locating the SEV GUID.
+     * The SEV GUID is located on its own (original implementation) or within
+     * the Firmware GUID Table (new implementation), either of which are
+     * located 32 bytes from the end of the flash.
+     *
+     * Check the Firmware GUID Table first.
+     */
+    if (pc_system_ovmf_table_find(SEV_INFO_BLOCK_GUID, &data, NULL)) {
+        return sev_es_parse_reset_block((SevInfoBlock *)data, addr);
+    }
+
+    /*
+     * SEV info block not found in the Firmware GUID Table (or there isn't
+     * a Firmware GUID Table), fall back to the original implementation.
+     */
+    data = flash_ptr + flash_size - 0x20;
+
+    qemu_uuid_parse(SEV_INFO_BLOCK_GUID, &info_guid);
+    info_guid = qemu_uuid_bswap(info_guid); /* GUIDs are LE */
+
+    guid = (QemuUUID *)(data - sizeof(info_guid));
+    if (!qemu_uuid_is_equal(guid, &info_guid)) {
+        error_report("SEV information block/Firmware GUID Table block not found in pflash rom");
+        return 1;
+    }
+
+    len = (uint16_t *)((uint8_t *)guid - sizeof(*len));
+    info = (SevInfoBlock *)(data - le16_to_cpu(*len));
+
+    return sev_es_parse_reset_block(info, addr);
+}
+
+void sev_es_set_reset_vector(CPUState *cpu)
+{
+    X86CPU *x86;
+    CPUX86State *env;
+
+    /* Only update if we have valid reset information */
+    if (!sev_guest || !sev_guest->reset_data_valid) {
+        return;
+    }
+
+    /* Do not update the BSP reset state */
+    if (cpu->cpu_index == 0) {
+        return;
+    }
+
+    x86 = X86_CPU(cpu);
+    env = &x86->env;
+
+    cpu_x86_load_seg_cache(env, R_CS, 0xf000, sev_guest->reset_cs, 0xffff,
+                           DESC_P_MASK | DESC_S_MASK | DESC_CS_MASK |
+                           DESC_R_MASK | DESC_A_MASK);
+
+    env->eip = sev_guest->reset_ip;
+}
+
+int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
+{
+    CPUState *cpu;
+    uint32_t addr;
+    int ret;
+
+    if (!sev_es_enabled()) {
+        return 0;
+    }
+
+    addr = 0;
+    ret = sev_es_find_reset_vector(flash_ptr, flash_size,
+                                   &addr);
+    if (ret) {
+        return ret;
+    }
+
+    if (addr) {
+        sev_guest->reset_cs = addr & 0xffff0000;
+        sev_guest->reset_ip = addr & 0x0000ffff;
+        sev_guest->reset_data_valid = true;
+
+        CPU_FOREACH(cpu) {
+            sev_es_set_reset_vector(cpu);
+        }
+    }
+
+    return 0;
+}
+
 static void
 sev_register_types(void)
 {
-- 
2.29.2



