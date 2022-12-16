Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520664E54E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:43:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ynV-0005Jt-9S; Thu, 15 Dec 2022 19:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynC-0005Dj-BO
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:40 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5yn7-0006eg-Bb
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=TRj8tjdNU9xuPzGoCSixzZtm7DMXawFjn9UKoXLwcX4=; b=eR6Scs3LOkrvs57ybZ7rlVJApC
 QjtPejAeEQXCbUtc+Ykz/HkV1ar9Z8jMV+S70kl2nWfCNBLyEmPBtMMmc8c4w5tYKQ7H4icTxvFQP
 myW0OPQ27o5zRAFIyRFSTvKV242LAT+zbp8/PvcJi1+RTWRy2OMYYOJ7rfQ47FEw21DSVkpSXx3Hz
 Ku+wxr+v/vSPLJHf5HAOh/nU5SJQ48XqsxqjBzXgW4hJu8LD5hmf4+LRKB3qinQH+z/omHsR78a2t
 WynyzXWYG9O37IxYrwVcoCuBNkeVffTVzLCz93O0i611J0h5kmJx+2Dup19Q0WPqebW1NQHjnr9jr
 rTay9zQg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5ymy-00Azyw-1z; Fri, 16 Dec 2022 00:41:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymv-003cO5-Cq; Fri, 16 Dec 2022 00:41:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v3 00/38] Xen HVM support under KVM
Date: Fri, 16 Dec 2022 00:40:39 +0000
Message-Id: <20221216004117.862106-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Xen guests actually boot now. No PV drivers, as there's no grant table
or xenstore yet. But event channel IPIs are working, as are in-kernel
vCPU timers.

Moderately unhappy with having to poll for the GSI callback going down,
because we don't have a hook on the PIC EOI. If I can fix that for VFIO
while I'm at it, I may investigate further. I note that VFIO does seem
to use pci_device_route_intx_to_irq() and know the actual target GSI#,
which means that a trivial hook based on the GSI# might be feasible.

Next up, timers (which actually work with a new enough kernel where it's
all offloaded, but even then they need migration support). Then grant
tables, at which point it's time to work out how to provide a xenstore
implementation. I quite like the idea of that being purely internal,
but don't fancy adding *that* much code to qemu so will probably hook
up to an existing external xenstored. 

Still need to fix up that platform PCI patch to call pam_update() to
change UMB mode.

  qemu-system-x86_64 -serial mon:stdio -accel kvm,xen-version=0x4000a \
         -device xen-platform -cpu host,+xen-vapic  -display none \
         -kernel /boot/vmlinuz-5.17.8-200.fc35.x86_64 \
         -append "console=ttyS0,115200 earlyprintk=ttyS0,115200" \
         --trace "kvm_xen*"

v3:

 • Switch back to xen-version as KVM accelerator property, other review
   feedback and bug fixes.

 • Fix Hyper-V coexistence (ick, calling kvm_xen_init() again because
   hyperv_enabled() doesn't return the right answer the first time).

 • Implement event channel support, including GSI/PCI_INTX callback.

 • Implement 32-bit guest support.

v2: https://lore.kernel.org/qemu-devel/20221209095612.689243-1-dwmw2@infradead.org/

 • Attempt to implement migration support; every Xen enlightenment is
   now recorded either from vmstate_x86_cpu or from a new sysdev device
   created for that purpose. And — I believe — correctly restored, in
   the right order, on vmload.

 • The shared_info page is created as a proper overlay instead of abusing
   the underlying guest page. This is important because Windows doesn't
   even select a GPA which had RAM behind it beforehand. This will be
   extended to handle the grant frames too, in the fullness of time.

 • Set vCPU attributes from the correct vCPU thread to avoid deadlocks.

 • Carefully copy the entire hypercall argument structure from userspace
   instead of assuming that it's contiguous in HVA space.

 • Distinguish between "handled but intentionally returns -ENOSYS" and
   "no idea what that was" in hypercalls, allowing us to emit a
   GUEST_ERROR (actually, shouldn't that change to UNIMP?) on the
   latter. Experience shows that to we'll end up having to intentionally
   return -ENOSYS to a bunch of weird crap that ancient guests still
   attempt to use, including XenServer local hacks that nobody even
   remembers what they were (hvmop 0x101, anyone? Some old Windows
   PV driver appears to be trying to use it...).

 * Drop the '+xen' CPU property and present Xen CPUID instead of KVM
   unconditionally when running in Xen mode. Make the Xen CPUID coexist
   with Hyper-V CPUID as it should, though.

 • Add XEN_EMU and XENFV_MACHINE (the latter to be XEN_EMU||XEN) config
   options. Some more work on this, and the incestuous relationships
   between the KVM target code and the 'platform' code, is going to be
   required but it's probably better to get on with implementing the
   real code so we can see those interactions in all their glory,
   before losing too much sleep over the details here.

 • Drop the GSI-2 hack, and also the patch which made the PCI platform
   device have real RAM (which isn't needed now we have overlays, qv).

 • Drop the XenState and XenVcpuState from KVMState and CPUArchState
   respectively. The Xen-specific fields are natively included in
   CPUArchState now though, for migration purposes. And we don't
   keep a host pointer to the shared_info or vcpu_info at all any
   more. With the kernel doing everything for us, we don't actually
   need them.

v1: https://lore.kernel.org/qemu-devel/20221205173137.607044-1-dwmw2@infradead.org/T/

v0: https://github.com/jpemartins/qemu/commits/xen-shim-rfc (Joao et al.)

Ankur Arora (2):
      i386/xen: implement HVMOP_set_evtchn_upcall_vector
      i386/xen: HVMOP_set_param / HVM_PARAM_CALLBACK_IRQ

David Woodhouse (20):
      xen: add CONFIG_XENFV_MACHINE and CONFIG_XEN_EMU options for Xen emulation
      xen: Add XEN_DISABLED mode and make it default
      i386/kvm: Add xen-version machine property and init KVM Xen support
      hw/xen: Add xen_overlay device for emulating shared xenheap pages
      i386/xen: add pc_machine_kvm_type to initialize XEN_EMULATE mode
      i386/xen: manage and save/restore Xen guest long_mode setting
      i386/xen: implement XENMEM_add_to_physmap_batch
      hw/xen: Implement EVTCHNOP_status
      hw/xen: Implement EVTCHNOP_close
      hw/xen: Implement EVTCHNOP_unmask
      hw/xen: Implement EVTCHNOP_bind_virq
      hw/xen: Implement EVTCHNOP_bind_ipi
      hw/xen: Implement EVTCHNOP_send
      hw/xen: Implement EVTCHNOP_alloc_unbound
      hw/xen: Implement EVTCHNOP_bind_interdomain
      hw/xen: Implement EVTCHNOP_bind_vcpu
      hw/xen: Implement EVTCHNOP_reset
      i386/xen: Implement SCHEDOP_poll
      hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback
      hw/xen: Support HVM_PARAM_CALLBACK_TYPE_PCI_INTX callback

Joao Martins (16):
      include: import xen public headers
      i386/kvm: handle Xen HVM cpuid leaves
      xen-platform: exclude vfio-pci from the PCI platform unplug
      xen-platform: allow its creation with XEN_EMULATE mode
      hw/xen_backend: refactor xen_be_init()
      i386/xen: handle guest hypercalls
      i386/xen: implement HYPERCALL_xen_version
      i386/xen: implement HYPERVISOR_memory_op
      i386/xen: implement HYPERVISOR_hvm_op
      i386/xen: implement HYPERVISOR_vcpu_op
      i386/xen: handle VCPUOP_register_vcpu_info
      i386/xen: handle VCPUOP_register_vcpu_time_info
      i386/xen: handle VCPUOP_register_runstate_memory_area
      i386/xen: implement HYPERVISOR_event_channel_op
      i386/xen: implement HYPERVISOR_sched_op
      i386/xen: add monitor commands to test event injection

 accel/kvm/kvm-all.c                                |    1 +
 accel/xen/xen-all.c                                |    4 +
 hmp-commands.hx                                    |   30 +
 hw/Kconfig                                         |    1 +
 hw/i386/Kconfig                                    |    5 +
 hw/i386/kvm/meson.build                            |    4 +
 hw/i386/kvm/xen_evtchn.c                           | 1158 ++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h                           |   41 +
 hw/i386/kvm/xen_overlay.c                          |  261 +++++
 hw/i386/kvm/xen_overlay.h                          |   18 +
 hw/i386/pc.c                                       |   19 +
 hw/i386/xen/xen_platform.c                         |   29 +-
 hw/xen/Kconfig                                     |    3 +
 hw/xen/xen-legacy-backend.c                        |   40 +-
 include/hw/i386/pc.h                               |    3 +
 include/hw/xen/xen-legacy-backend.h                |    3 +
 include/hw/xen/xen.h                               |    5 +-
 include/standard-headers/xen/arch-x86/cpuid.h      |  118 ++
 include/standard-headers/xen/arch-x86/xen-x86_32.h |  194 ++++
 include/standard-headers/xen/arch-x86/xen-x86_64.h |  241 ++++
 include/standard-headers/xen/arch-x86/xen.h        |  398 +++++++
 include/standard-headers/xen/event_channel.h       |  388 +++++++
 include/standard-headers/xen/features.h            |  143 +++
 include/standard-headers/xen/grant_table.h         |  686 ++++++++++++
 include/standard-headers/xen/hvm/hvm_op.h          |  395 +++++++
 include/standard-headers/xen/hvm/params.h          |  318 ++++++
 include/standard-headers/xen/memory.h              |  754 +++++++++++++
 include/standard-headers/xen/physdev.h             |  383 +++++++
 include/standard-headers/xen/sched.h               |  202 ++++
 include/standard-headers/xen/trace.h               |  341 ++++++
 include/standard-headers/xen/vcpu.h                |  248 +++++
 include/standard-headers/xen/version.h             |  113 ++
 include/standard-headers/xen/xen-compat.h          |   46 +
 include/standard-headers/xen/xen.h                 | 1049 ++++++++++++++++++
 include/sysemu/kvm_int.h                           |    1 +
 include/sysemu/kvm_xen.h                           |   19 +
 meson.build                                        |    1 +
 monitor/misc.c                                     |    4 +
 target/i386/cpu.c                                  |    1 +
 target/i386/cpu.h                                  |   11 +
 target/i386/kvm/kvm.c                              |  191 +++-
 target/i386/kvm/meson.build                        |    2 +
 target/i386/kvm/trace-events                       |    6 +
 target/i386/kvm/xen-compat.h                       |   51 +
 target/i386/kvm/xen-emu.c                          | 1034 +++++++++++++++++
 target/i386/kvm/xen-emu.h                          |   32 +
 target/i386/machine.c                              |   28 +
 47 files changed, 8998 insertions(+), 25 deletions(-)



