Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9A664392
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:47:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDeq-0000Ft-7K; Tue, 10 Jan 2023 07:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b726f73bd8c89da575c8+7079+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pFDcu-00078O-4E
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:21:13 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b726f73bd8c89da575c8+7079+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pFDcj-0000Pi-Sv
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ppcW4rAf7eiIWwg3I4bn3axZo/TdY4vcUqXDdTstcCQ=; b=dlK/+KpiI3YimEky79JD+BAFxS
 kC3Eamee1FMn8ewu0/F5phtm8emLAOwUb4WAHTX6avbeB+xIjWDNoWrlchkkrJw35I98vLmxCCBXD
 Cki+nIL+gQozPefGUZTRS8rD3Qtazerfk1gvKzV4sSaOKm6hXRVGQdYf1nil0ESRi1lsQ5VMkZeTj
 xTEqaXWZ/8iKaZ/GLsU1YY7xgy33NwYrOq6D9osZQQvKMmA0WCUTkMk2LDGRRm8MptbAXuZq0b7F1
 8z95N6ZXi4mgXARu2rCNHevP+auemNwHwWlwecFZesJSJ0AZKYme8GUASh1ErMIcXQxkAqvNJjXqV
 C1XmBx4A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pFDcg-003C5v-Mp; Tue, 10 Jan 2023 12:21:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFDcR-006YdW-S0; Tue, 10 Jan 2023 12:20:43 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [PATCH v6 00/51] Xen support under KVM
Date: Tue, 10 Jan 2023 12:19:51 +0000
Message-Id: <20230110122042.1562155-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+b726f73bd8c89da575c8+7079+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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

Version 6, and I've dropped the [RFC] tag. This series provides the core
platform support and is fairly settled. The next phase is porting the PV
backend drivers over to work with it too. (Which is in progress at
https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv
and will probably be posted as RFC in a follow-up for early heckling).

   qemu-system-x86_64 -serial mon:stdio -M pc -cpu host \
    -accel kvm,xen-version=0x4000a,kernel-irqchip=split -display none \
    -kernel vmlinuz-5.17.8-200.fc35.x86_64 \
    -append "console=ttyS0 root=/dev/sda1" \
    -d unimp -m 1G -smp 2 -device xen-platform \
    -drive file=/var/lib/libvirt/images/fedora28.qcow2,if=none,id=disk \
    -device ahci,id=ahci -device ide-hd,drive=disk,bus=ahci.0

v6: https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-6

 • Require split irqchip to ensure the GSI handling works correctly.

 • Rework monitor commands to be QMP-based.

 • Cache vcpu_info hva to avoid MemoryRegion refcount leaks.

 • Pull in more Xen headers to allow for later PV backend work.

 • Define __XEN_TOOLS__ in hw/xen/xen.h instead of littering C files with
   separate definitions of __XEN_INTERFACE_VERSION__.

 • Drop debugging hexdump from xenstore processing.

 • Minor fixes in event channel backend handling.

 • Drop "Refactor xen_be_init()" patch. It turns out we're going to do that
   all quite differently, so it's neither necessary nor sufficient.

v5: https://lore.kernel.org/qemu-devel/20221230121235.1282915-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-5

 • Add backend implementation of event channel support, to parallel the
   libxenevtchn API used by existing backend drivers.

 • Add basic XenStore ring implementation, test migration and kexec.

 • Some kexec/soft reset fixes (clear port pending bits, kernel timer virq).
 
 • Fix race with setting the xen_callback_asserted flag before actually
   doing so, which could lead to it being *cleared* again before we even
   assert it... and leave it asserted for ever.

v4: https://lore.kernel.org/qemu-devel/20221221010623.1000191-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-4

 • Add soft reset support near the beginning and thread it through the
   rest of the feature enablement.

 • Add PV timer	support	and advertise XENFEAT_safe_hvm_pvclock.

 • Add basic grant table mapping and [gs]et_version / query_size support.

 • Make	xen_platform device build (and work) without CONFIG_XEN.

 • Fix Xen HVM mode not to require --xen-attach.

v3: https://lore.kernel.org/qemu-devel/20221216004117.862106-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-3

 • Switch back to xen-version as KVM accelerator property, other review
   feedback and bug fixes.

 • Fix Hyper-V coexistence (ick, calling kvm_xen_init() again because
   hyperv_enabled() doesn't return the right answer the first time).

 • Implement event channel support, including GSI/PCI_INTX callback.

 • Implement 32-bit guest support.

v2: https://lore.kernel.org/qemu-devel/20221209095612.689243-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-2

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

v1: https://lore.kernel.org/qemu-devel/20221205173137.607044-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-1

v0: https://github.com/jpemartins/qemu/commits/xen-shim-rfc (Joao et al.)

Ankur Arora (2):
      i386/xen: implement HVMOP_set_evtchn_upcall_vector
      i386/xen: implement HVMOP_set_param

David Woodhouse (32):
      xen: add CONFIG_XENFV_MACHINE and CONFIG_XEN_EMU options for Xen emulation
      xen: Add XEN_DISABLED mode and make it default
      i386/kvm: Add xen-version KVM accelerator property and init KVM Xen support
      i386/hvm: Set Xen vCPU ID in KVM
      i386/xen: Implement SCHEDOP_poll and SCHEDOP_yield
      hw/xen: Add xen_overlay device for emulating shared xenheap pages
      i386/xen: add pc_machine_kvm_type to initialize XEN_EMULATE mode
      i386/xen: manage and save/restore Xen guest long_mode setting
      i386/xen: implement XENMEM_add_to_physmap_batch
      hw/xen: Add xen_evtchn device for event channel emulation
      i386/xen: Add support for Xen event channel delivery to vCPU
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
      hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback
      hw/xen: Support HVM_PARAM_CALLBACK_TYPE_PCI_INTX callback
      kvm/i386: Add xen-gnttab-max-frames property
      hw/xen: Add xen_gnttab device for grant table emulation
      hw/xen: Support mapping grant frames
      i386/xen: Implement HYPERVISOR_grant_table_op and GNTTABOP_[gs]et_verson
      hw/xen: Implement GNTTABOP_query_size
      i386/xen: Reserve Xen special pages for console, xenstore rings
      hw/xen: Add backend implementation of interdomain event channel support
      hw/xen: Add xen_xenstore device for xenstore emulation
      hw/xen: Add basic ring handling to xenstore

Joao Martins (17):
      include: import Xen public headers to include/standard-headers/
      i386/kvm: handle Xen HVM cpuid leaves
      xen-platform: exclude vfio-pci from the PCI platform unplug
      xen-platform: allow its creation with XEN_EMULATE mode
      i386/xen: handle guest hypercalls
      i386/xen: implement HYPERVISOR_xen_version
      i386/xen: implement HYPERVISOR_sched_op, SCHEDOP_shutdown
      i386/xen: implement HYPERVISOR_memory_op
      i386/xen: implement HYPERVISOR_hvm_op
      i386/xen: implement HYPERVISOR_vcpu_op
      i386/xen: handle VCPUOP_register_vcpu_info
      i386/xen: handle VCPUOP_register_vcpu_time_info
      i386/xen: handle VCPUOP_register_runstate_memory_area
      i386/xen: implement HYPERVISOR_event_channel_op
      i386/xen: add monitor commands to test event injection
      i386/xen: handle PV timer hypercalls
      i386/xen: handle HVMOP_get_param

 accel/kvm/kvm-all.c                                |    2 +
 accel/xen/xen-all.c                                |    2 +
 hmp-commands.hx                                    |   29 +
 hw/Kconfig                                         |    1 +
 hw/i386/Kconfig                                    |    5 +
 hw/i386/kvm/meson.build                            |   10 +
 hw/i386/kvm/xen-stubs.c                            |   25 +
 hw/i386/kvm/xen_evtchn.c                           | 1653 +++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h                           |   68 +
 hw/i386/kvm/xen_gnttab.c                           |  238 +++
 hw/i386/kvm/xen_gnttab.h                           |   25 +
 hw/i386/kvm/xen_overlay.c                          |  265 +++
 hw/i386/kvm/xen_overlay.h                          |   26 +
 hw/i386/kvm/xen_xenstore.c                         |  465 ++++++
 hw/i386/kvm/xen_xenstore.h                         |   20 +
 hw/i386/pc.c                                       |   23 +
 hw/i386/xen/meson.build                            |    5 +-
 hw/i386/xen/xen_platform.c                         |   57 +-
 hw/xen/Kconfig                                     |    3 +
 include/hw/i386/pc.h                               |    3 +
 include/hw/xen/xen.h                               |   21 +-
 include/standard-headers/xen/arch-x86/cpuid.h      |  118 ++
 include/standard-headers/xen/arch-x86/xen-x86_32.h |  194 +++
 include/standard-headers/xen/arch-x86/xen-x86_64.h |  241 +++
 include/standard-headers/xen/arch-x86/xen.h        |  398 +++++
 include/standard-headers/xen/event_channel.h       |  388 +++++
 include/standard-headers/xen/features.h            |  143 ++
 include/standard-headers/xen/grant_table.h         |  686 ++++++++
 include/standard-headers/xen/hvm/hvm_op.h          |  395 +++++
 include/standard-headers/xen/hvm/params.h          |  318 ++++
 include/standard-headers/xen/io/blkif.h            |  722 +++++++++
 include/standard-headers/xen/io/console.h          |   56 +
 include/standard-headers/xen/io/fbif.h             |  176 ++
 include/standard-headers/xen/io/kbdif.h            |  576 +++++++
 include/standard-headers/xen/io/netif.h            | 1102 +++++++++++++
 include/standard-headers/xen/io/protocols.h        |   42 +
 include/standard-headers/xen/io/ring.h             |  495 ++++++
 include/standard-headers/xen/io/usbif.h            |  425 +++++
 include/standard-headers/xen/io/xenbus.h           |   80 +
 include/standard-headers/xen/io/xs_wire.h          |  153 ++
 include/standard-headers/xen/memory.h              |  754 +++++++++
 include/standard-headers/xen/physdev.h             |  383 +++++
 include/standard-headers/xen/sched.h               |  202 +++
 include/standard-headers/xen/trace.h               |  341 ++++
 include/standard-headers/xen/vcpu.h                |  248 +++
 include/standard-headers/xen/version.h             |  113 ++
 include/standard-headers/xen/xen-compat.h          |   46 +
 include/standard-headers/xen/xen.h                 | 1049 ++++++++++++
 include/sysemu/kvm_int.h                           |    3 +
 include/sysemu/kvm_xen.h                           |   39 +
 meson.build                                        |    1 +
 monitor/misc.c                                     |    4 +
 qapi/misc.json                                     |   91 ++
 softmmu/globals.c                                  |    2 +-
 target/i386/cpu.c                                  |    1 +
 target/i386/cpu.h                                  |   19 +
 target/i386/kvm/kvm.c                              |  208 ++-
 target/i386/kvm/meson.build                        |    2 +
 target/i386/kvm/trace-events                       |    6 +
 target/i386/kvm/xen-compat.h                       |   51 +
 target/i386/kvm/xen-emu.c                          | 1685 ++++++++++++++++++++
 target/i386/kvm/xen-emu.h                          |   33 +
 target/i386/machine.c                              |   25 +
 63 files changed, 14936 insertions(+), 24 deletions(-)



