Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742024DE006
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:34:22 +0100 (CET)
Received: from localhost ([::1]:38544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGUX-0004Hp-DQ
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:34:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVGR4-0000QI-JY
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:30:48 -0400
Received: from [2a00:1450:4864:20::32d] (port=36851
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVGR2-0001nA-7i
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:30:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 r8-20020a1c4408000000b0038c8b999f58so93117wma.1
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUE6sfvAltRAlXCzVOlKWMnwU3PcaYTORKoYmag2hAc=;
 b=yH2/Pz2rL7n4krJCCsxdWjS93HIWraxpwTL3zer11p7SDdUb1n25s7/U1K38h8rVSZ
 tUV0U/tI64F1ALcgxFHkPopeSQhIhKfq+Z2sXKMi9QYIhDOsyzZWzm2FGkfhnluvfc/Y
 mY3WXHaQ+RUWSZgB0x5wensVyhFkiwJGI0zgD98JJLnmSyK0d5KOaU1v4xFp/aMURUH2
 vf4Nnpiv8r+w8qq/yyu+k/vOWVmsiGlOnNRBkC5P0zRneCx8FMJY5hT7DbWpB0jY8lSn
 T8KHubS660wN+W7sm8UYHI409w6LRN7Brd4N/3KFgNQdqYSTzdrpyyjqgSqFQglTYarh
 LYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUE6sfvAltRAlXCzVOlKWMnwU3PcaYTORKoYmag2hAc=;
 b=KKXEvrxs76kGPHRJPbtkqYspDTGLO/q1gZDrW8pabEKRo79pkBWt/V6ws7qaGfp22v
 QTvv09/w2ZgaliTjbzjn7U0Qen83d5Y5KJwkHkqIsNnW8lU/uxlEs1CuGODm8OLS0z0t
 2XE0bNbk3j3TJOrUD6rJp5QEfxLzrWG7rgqNi5hvYxCVfuvQ7jCpq2nQLSRIhTkgF7VQ
 4NNd5kbg1j8KFN3kBmGohHttda8cTUPJDs4OOR8hE9j2h3g6JLgO4ifL0JeV12W+hHEQ
 5EpRNSEcNqBfcmTL0ZOMnuWAILtT9ffldC6itHP5VnyZZanhOCk2yKaap9T1m309y7zS
 sZDw==
X-Gm-Message-State: AOAM532udNHKriF3ygBil//FuY5wmp2bBVRcxDxzGsoV18+gwM7iA1/o
 IUGUG5oNmjkrY4t1T0dnJeKPXJxoN9jPag==
X-Google-Smtp-Source: ABdhPJyBRnRltm+6VsK53ARW246YDoZpdj0f4qxGYT5Y+Qg6e35D97oAXMcYlM8L1Xiq+Lfgzxs8rQ==
X-Received: by 2002:a7b:c2aa:0:b0:389:891f:1fd1 with SMTP id
 c10-20020a7bc2aa000000b00389891f1fd1mr16675338wmk.138.1647624641585; 
 Fri, 18 Mar 2022 10:30:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm7029300wri.4.2022.03.18.10.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:30:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] Fix 'writeable' typos
Date: Fri, 18 Mar 2022 17:30:38 +0000
Message-Id: <20220318173038.3350098-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have about 25 instances of the typo/variant spelling 'writeable',
and over 500 of the more common 'writable'.  Standardize on the
latter.

Change produced with:

 sed -i -e 's/writeable/writable/g' $(git grep -l writeable)

and then hand-undoing the instance in linux-headers/linux/kvm.h.

All these changes are in comments or documentation, except for the
two local variables in accel/hvf/hvf-accel-ops.c and
accel/kvm/kvm-all.c.


Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/interop/vhost-user.rst    | 2 +-
 docs/specs/vmgenid.txt         | 4 ++--
 hw/scsi/mfi.h                  | 2 +-
 target/arm/internals.h         | 2 +-
 accel/hvf/hvf-accel-ops.c      | 4 ++--
 accel/kvm/kvm-all.c            | 4 ++--
 accel/tcg/user-exec.c          | 6 +++---
 hw/acpi/ghes.c                 | 2 +-
 hw/intc/arm_gicv3_cpuif.c      | 2 +-
 hw/intc/arm_gicv3_dist.c       | 2 +-
 hw/intc/arm_gicv3_redist.c     | 2 +-
 hw/intc/riscv_aclint.c         | 2 +-
 hw/intc/riscv_aplic.c          | 2 +-
 hw/pci/shpc.c                  | 2 +-
 hw/timer/sse-timer.c           | 2 +-
 target/arm/gdbstub.c           | 2 +-
 target/i386/cpu-sysemu.c       | 2 +-
 target/s390x/ioinst.c          | 2 +-
 python/qemu/machine/machine.py | 2 +-
 tests/tcg/x86_64/system/boot.S | 2 +-
 20 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 4dbc84fd001..09dad5aea9f 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -222,7 +222,7 @@ Virtio device config space
 :size: a 32-bit configuration space access size in bytes
 
 :flags: a 32-bit value:
-  - 0: Vhost master messages used for writeable fields
+  - 0: Vhost master messages used for writable fields
   - 1: Vhost master messages used for live migration
 
 :payload: Size bytes array holding the contents of the virtio
diff --git a/docs/specs/vmgenid.txt b/docs/specs/vmgenid.txt
index aa9f5186767..80ff69f31cc 100644
--- a/docs/specs/vmgenid.txt
+++ b/docs/specs/vmgenid.txt
@@ -153,7 +153,7 @@ change the contents of the memory at runtime, specifically when starting a
 backed-up or snapshotted image.  In order to do this, QEMU must know the
 address that has been allocated.
 
-The mechanism chosen for this memory sharing is writeable fw_cfg blobs.
+The mechanism chosen for this memory sharing is writable fw_cfg blobs.
 These are data object that are visible to both QEMU and guests, and are
 addressable as sequential files.
 
@@ -164,7 +164,7 @@ Two fw_cfg blobs are used in this case:
 /etc/vmgenid_guid - contains the actual VM Generation ID GUID
                   - read-only to the guest
 /etc/vmgenid_addr - contains the address of the downloaded vmgenid blob
-                  - writeable by the guest
+                  - writable by the guest
 
 
 QEMU sends the following commands to the guest at startup:
diff --git a/hw/scsi/mfi.h b/hw/scsi/mfi.h
index e67a5c0b477..0b4ee53dfc0 100644
--- a/hw/scsi/mfi.h
+++ b/hw/scsi/mfi.h
@@ -633,7 +633,7 @@ struct mfi_ctrl_props {
                               * metadata and user data
                               * 1=5%, 2=10%, 3=15% and so on
                               */
-    uint8_t viewSpace;       /* snapshot writeable VIEWs
+    uint8_t viewSpace;       /* snapshot writable VIEWs
                               * capacity as a % of source LD
                               * capacity. 0=READ only
                               * 1=5%, 2=10%, 3=15% and so on
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a34be2e4595..3f573d53d66 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1255,7 +1255,7 @@ enum MVEECIState {
 #define PMCRP   0x2
 #define PMCRE   0x1
 /*
- * Mask of PMCR bits writeable by guest (not including WO bits like C, P,
+ * Mask of PMCR bits writable by guest (not including WO bits like C, P,
  * which can be written as 1 to trigger behaviour but which stay RAZ).
  */
 #define PMCR_WRITEABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 54457c76c2f..684b30dd26e 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -120,12 +120,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
     hvf_slot *mem;
     MemoryRegion *area = section->mr;
-    bool writeable = !area->readonly && !area->rom_device;
+    bool writable = !area->readonly && !area->rom_device;
     hv_memory_flags_t flags;
     uint64_t page_size = qemu_real_host_page_size;
 
     if (!memory_region_is_ram(area)) {
-        if (writeable) {
+        if (writable) {
             return;
         } else if (!memory_region_is_romd(area)) {
             /*
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 27864dfaeaa..52c52accede 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1346,13 +1346,13 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     KVMSlot *mem;
     int err;
     MemoryRegion *mr = section->mr;
-    bool writeable = !mr->readonly && !mr->rom_device;
+    bool writable = !mr->readonly && !mr->rom_device;
     hwaddr start_addr, size, slot_size, mr_offset;
     ram_addr_t ram_start_offset;
     void *ram;
 
     if (!memory_region_is_ram(mr)) {
-        if (writeable || !kvm_readonly_mem_allowed) {
+        if (writable || !kvm_readonly_mem_allowed) {
             return;
         } else if (!mr->romd_mode) {
             /* If the memory device is not in romd_mode, then we actually want
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 8edf0bbaa11..eb050cf9913 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -101,10 +101,10 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write)
  * Return true if the write fault has been handled, and should be re-tried.
  *
  * Note that it is important that we don't call page_unprotect() unless
- * this is really a "write to nonwriteable page" fault, because
+ * this is really a "write to nonwritable page" fault, because
  * page_unprotect() assumes that if it is called for an access to
- * a page that's writeable this means we had two threads racing and
- * another thread got there first and already made the page writeable;
+ * a page that's writable this means we had two threads racing and
+ * another thread got there first and already made the page writable;
  * so we will retry the access. If we were to call page_unprotect()
  * for some other kind of fault that should really be passed to the
  * guest, we'd end up in an infinite loop of retrying the faulting access.
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 45d9a809cc9..e9511d9b8f7 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -249,7 +249,7 @@ void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
     for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
         /*
          * Initialize the value of read_ack_register to 1, so GHES can be
-         * writeable after (re)boot.
+         * writable after (re)boot.
          * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
          * (GHESv2 - Type 10)
          */
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 1a3d440a54b..285f86fd0c9 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1893,7 +1893,7 @@ static void icc_ctlr_el3_write(CPUARMState *env, const ARMCPRegInfo *ri,
         cs->icc_ctlr_el1[GICV3_S] |= ICC_CTLR_EL1_CBPR;
     }
 
-    /* The only bit stored in icc_ctlr_el3 which is writeable is EOIMODE_EL3: */
+    /* The only bit stored in icc_ctlr_el3 which is writable is EOIMODE_EL3: */
     mask = ICC_CTLR_EL3_EOIMODE_EL3;
 
     cs->icc_ctlr_el3 &= ~mask;
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 28d913b2114..f20476887ac 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -610,7 +610,7 @@ static bool gicd_writel(GICv3State *s, hwaddr offset,
         if (value & mask & GICD_CTLR_DS) {
             /* We just set DS, so the ARE_NS and EnG1S bits are now RES0.
              * Note that this is a one-way transition because if DS is set
-             * then it's not writeable, so it can only go back to 0 with a
+             * then it's not writable, so it can only go back to 0 with a
              * hardware reset.
              */
             s->gicd_ctlr &= ~(GICD_CTLR_EN_GRP1S | GICD_CTLR_ARE_NS);
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 412a04f59cf..267933d8618 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -267,7 +267,7 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         /* RAZ/WI for our implementation */
         return MEMTX_OK;
     case GICR_WAKER:
-        /* Only the ProcessorSleep bit is writeable. When the guest sets
+        /* Only the ProcessorSleep bit is writable. When the guest sets
          * it it requests that we transition the channel between the
          * redistributor and the cpu interface to quiescent, and that
          * we set the ChildrenAsleep bit once the inteface has reached the
diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index f1a5d3d284f..d32e1eb6970 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -399,7 +399,7 @@ static void riscv_aclint_swi_realize(DeviceState *dev, Error **errp)
     /* Claim software interrupt bits */
     for (i = 0; i < swi->num_harts; i++) {
         RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(swi->hartid_base + i));
-        /* We don't claim mip.SSIP because it is writeable by software */
+        /* We don't claim mip.SSIP because it is writable by software */
         if (riscv_cpu_claim_interrupts(cpu, swi->sswi ? 0 : MIP_MSIP) < 0) {
             error_report("MSIP already claimed");
             exit(1);
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index e7809fb6b2c..cfd007e629c 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -646,7 +646,7 @@ static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,
     }
 
     if (addr == APLIC_DOMAINCFG) {
-        /* Only IE bit writeable at the moment */
+        /* Only IE bit writable at the moment */
         value &= APLIC_DOMAINCFG_IE;
         aplic->domaincfg = value;
     } else if ((APLIC_SOURCECFG_BASE <= addr) &&
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 28e62174c42..f822f18b980 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -456,7 +456,7 @@ static int shpc_cap_add_config(PCIDevice *d, Error **errp)
     pci_set_byte(config + SHPC_CAP_CxP, 0);
     pci_set_long(config + SHPC_CAP_DWORD_DATA, 0);
     d->shpc->cap = config_offset;
-    /* Make dword select and data writeable. */
+    /* Make dword select and data writable. */
     pci_set_byte(d->wmask + config_offset + SHPC_CAP_DWORD_SELECT, 0xff);
     pci_set_long(d->wmask + config_offset + SHPC_CAP_DWORD_DATA, 0xffffffff);
     return 0;
diff --git a/hw/timer/sse-timer.c b/hw/timer/sse-timer.c
index f959cb9d603..e92e83747d2 100644
--- a/hw/timer/sse-timer.c
+++ b/hw/timer/sse-timer.c
@@ -324,7 +324,7 @@ static void sse_timer_write(void *opaque, hwaddr offset, uint64_t value,
     {
         uint32_t old_ctl = s->cntp_aival_ctl;
 
-        /* EN bit is writeable; CLR bit is write-0-to-clear, write-1-ignored */
+        /* EN bit is writable; CLR bit is write-0-to-clear, write-1-ignored */
         s->cntp_aival_ctl &= ~R_CNTP_AIVAL_CTL_EN_MASK;
         s->cntp_aival_ctl |= value & R_CNTP_AIVAL_CTL_EN_MASK;
         if (!(value & R_CNTP_AIVAL_CTL_CLR_MASK)) {
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index ca1de475116..65200778702 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -117,7 +117,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             /*
              * Don't allow writing to XPSR.Exception as it can cause
              * a transition into or out of handler mode (it's not
-             * writeable via the MSR insn so this is a reasonable
+             * writable via the MSR insn so this is a reasonable
              * restriction). Other fields are safe to update.
              */
             xpsr_write(env, tmp, ~XPSR_EXCP);
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 37b7c562f53..e61f3d75366 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -103,7 +103,7 @@ static void x86_cpu_to_dict(X86CPU *cpu, QDict *props)
 
 /* Convert CPU model data from X86CPU object to a property dictionary
  * that can recreate exactly the same CPU model, including every
- * writeable QOM property.
+ * writable QOM property.
  */
 static void x86_cpu_to_dict_full(X86CPU *cpu, QDict *props)
 {
diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index bdae5090bc8..b12f18d346f 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -284,7 +284,7 @@ void ioinst_handle_stsch(S390CPU *cpu, uint64_t reg1, uint32_t ipb,
         g_assert(!s390_is_pv());
         /*
          * As operand exceptions have a lower priority than access exceptions,
-         * we check whether the memory area is writeable (injecting the
+         * we check whether the memory area is writable (injecting the
          * access execption if it is not) first.
          */
         if (!s390_cpu_virt_mem_check_write(cpu, addr, ar, sizeof(schib))) {
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index a5972fab4d2..ed51d34c339 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -500,7 +500,7 @@ def _early_cleanup(self) -> None:
         """
         # If we keep the console socket open, we may deadlock waiting
         # for QEMU to exit, while QEMU is waiting for the socket to
-        # become writeable.
+        # become writable.
         if self._console_socket is not None:
             self._console_socket.close()
             self._console_socket = None
diff --git a/tests/tcg/x86_64/system/boot.S b/tests/tcg/x86_64/system/boot.S
index f8a2fcc8395..ed0f638406b 100644
--- a/tests/tcg/x86_64/system/boot.S
+++ b/tests/tcg/x86_64/system/boot.S
@@ -56,7 +56,7 @@
 	*
 	* - `ebx`: contains the physical memory address where the loader has placed
 	*          the boot start info structure.
-	* - `cr0`: bit 0 (PE) must be set. All the other writeable bits are cleared.
+	* - `cr0`: bit 0 (PE) must be set. All the other writable bits are cleared.
 	* - `cr4`: all bits are cleared.
 	* - `cs `: must be a 32-bit read/execute code segment with a base of ‘0’
 	*          and a limit of ‘0xFFFFFFFF’. The selector value is unspecified.
-- 
2.25.1


