Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2D76868D7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:48:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEB2-0001vN-85; Wed, 01 Feb 2023 09:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pNE9h-0001Op-8b
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:32:11 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pNE9Y-00036I-Pa
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ck5bjK5DO0pQeDG5ETLM2NfdPtcIF7ewMb5Lgf6lQtk=; b=FwAkoHISr8jzm35kTkdxpL8Cv8
 m4kzbx6Q4OCOOR/B1VyjcVrAmBaA3iRMWUgtujy0tno2tquxAEk0uJ6d+vivPZRhf8udIP5uNKA90
 XsHpYPQNcNyRr+MrJzWr4LRHlKccBYoK2JYTizZB227OputxJS2gQZ7/jSZcHuYLIKIvyYUg35bvS
 i+K2rHg+MN0fxTjvrs27PQ80c3fqtXuijdZ3TOyvhEhRSz2xX0Mp0sBuObk0f1xfZfEbL3/P1P4MG
 VT8ZdT0P2101GDwU9E9quH+ceyiIcFndxeqPfrFlX3grYSXpkXSoKZQepUa+uVGdiofEmrVpHD0BT
 ngwbO9Aw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pNE9O-00CMae-HH; Wed, 01 Feb 2023 14:31:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pNE9O-007Jpv-1a; Wed, 01 Feb 2023 14:31:50 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v10 00/59] Xen HVM support under KVM
Date: Wed,  1 Feb 2023 14:30:49 +0000
Message-Id: <20230201143148.1744093-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org;
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

It turns out that after some combination of header cleanups in upstream
and refinements of this patch series and the other parts that are waiting
in the wings to be sent next, we *can* get away with dropping the current
Xen headers over the top of the existing partial set in include/hw/xen.
We had previously added the new ones, done some cleanup to be able to use
those, and then finally removed the old. But that isn't needed any more.

Also, now we have PV disk working correctly in the follow-on patches, we 
kind of want the guest not to think that its domain ID is zero; that 
gets confusing because QEMU itself is playing at being dom0. So default 
to 1 and also allow the --xen-domid to be set in an additional patch 
from Paul.

As ever, a peek at what's to come *next* can be found in
https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv

There's a full XenStore implementation there, as well as the PV backend
support for running in emulated mode that has been seen before.


v10: https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-10

 • Move imported Xen headers to include/hw/xen/interface/.

 • Allow --xen-domid to be set, and default to non-zero.

 • Update documentation to include xen-evtchn-max-pirq and
   xen-gnttab-max-frames properties.

 • Explicitly include "qemu/lockable.h" in xen_evtchn.c to fix build.
v9: https://lore.kernel.org/qemu-devel/20230128081113.1615111-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-9

 • Fix race in GSI deassertion. I still hate this and want to fix it to
   happen on EOI at the irqchip and fix VFIO too, but we can do that in
   a separate series rather than piling it into this one. At least this
   one is nicer than the VFIO one that already exists.

 • Fix user builds by not including xen-stubs.c in those.

 • On rebasing, add some explicit includes needed after header cleanups.

v8: https://lore.kernel.org/qemu-devel/20230120131343.1441939-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-8

 • Instantiate xen pci-platform device automatically.

 • Add documentation.

 • Rename (newly-added) CONFIG_XENFV_PLATFORM to CONFIG_XEN_EMU. That's
   basically what it enables now that the dust is settling on the rest
   of the patch set that comes next.

 • Shift QMP commands to qapi/misc-target.json, other review feedback.

 • Clear upcall vector on soft reset.

 • Wire up soft reset to occur on qemu_devices_reset() (e.g. reboot).

 • Locking tweaks largely resulting from doing soft reset with the BQL.

 • Poll for deassertion of event channel GSI from kvm_arch_post_run()
   instead of kvm_arch_handle_exit().

 • Add PIRQ support.

v7: https://lore.kernel.org/qemu-devel/20230116215805.1123514-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-7

 • Trivial review feedback and collected ack/review tags.

 • Only call qemu_set_irq() under the BQL, which means doing so from a BH
   in some circumstances.

v6: https://lore.kernel.org/qemu-devel/20230110122042.1562155-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-6

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

David Woodhouse (39):
      xen: add CONFIG_XEN_BUS and CONFIG_XEN_EMU options for Xen emulation
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
      hw/xen: Automatically add xen-platform PCI device for emulated Xen guests
      i386/xen: Implement HYPERVISOR_physdev_op
      hw/xen: Implement emulated PIRQ hypercall support
      hw/xen: Support GSI mapping to PIRQ
      hw/xen: Support MSI mapping to PIRQ
      kvm/i386: Add xen-evtchn-max-pirq property
      i386/xen: Document Xen HVM emulation

Joao Martins (17):
      include: import Xen public headers to hw/xen/interface
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

Paul Durrant (1):
      xen: Permit --xen-domid argument when accel is KVM

 accel/kvm/kvm-all.c                            |    3 +
 accel/xen/xen-all.c                            |    2 +
 docs/system/i386/xen.rst                       |   76 +
 docs/system/target-i386.rst                    |    1 +
 hmp-commands.hx                                |   29 +
 hw/Kconfig                                     |    1 +
 hw/i386/Kconfig                                |    5 +
 hw/i386/kvm/meson.build                        |   13 +
 hw/i386/kvm/trace-events                       |    5 +
 hw/i386/kvm/trace.h                            |    1 +
 hw/i386/kvm/xen-stubs.c                        |   27 +
 hw/i386/kvm/xen_evtchn.c                       | 2330 ++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h                       |   88 +
 hw/i386/kvm/xen_gnttab.c                       |  233 +++
 hw/i386/kvm/xen_gnttab.h                       |   25 +
 hw/i386/kvm/xen_overlay.c                      |  272 +++
 hw/i386/kvm/xen_overlay.h                      |   26 +
 hw/i386/kvm/xen_xenstore.c                     |  465 +++++
 hw/i386/kvm/xen_xenstore.h                     |   20 +
 hw/i386/pc.c                                   |   26 +
 hw/i386/x86.c                                  |   16 +
 hw/i386/xen/meson.build                        |    5 +-
 hw/i386/xen/xen_platform.c                     |   57 +-
 hw/pci/msi.c                                   |   11 +
 hw/pci/msix.c                                  |    7 +
 hw/pci/pci.c                                   |   17 +
 hw/xen/Kconfig                                 |    3 +
 include/hw/i386/pc.h                           |    3 +
 include/hw/pci/msi.h                           |    1 +
 include/hw/xen/interface/arch-x86/cpuid.h      |  118 ++
 include/hw/xen/interface/arch-x86/xen-x86_32.h |  194 ++
 include/hw/xen/interface/arch-x86/xen-x86_64.h |  241 +++
 include/hw/xen/interface/arch-x86/xen.h        |  398 ++++
 include/hw/xen/interface/event_channel.h       |  388 ++++
 include/hw/xen/interface/features.h            |  143 ++
 include/hw/xen/interface/grant_table.h         |  650 +++++++
 include/hw/xen/interface/hvm/hvm_op.h          |  395 ++++
 include/hw/xen/interface/hvm/params.h          |  318 ++++
 include/hw/xen/interface/io/blkif.h            |   14 +-
 include/hw/xen/interface/io/console.h          |   10 +
 include/hw/xen/interface/io/fbif.h             |   20 +
 include/hw/xen/interface/io/kbdif.h            |   10 +
 include/hw/xen/interface/io/netif.h            |   94 +-
 include/hw/xen/interface/io/ring.h             |   99 +-
 include/hw/xen/interface/io/usbif.h            |  377 ++--
 include/hw/xen/interface/io/xenbus.h           |   10 +
 include/hw/xen/interface/io/xs_wire.h          |  153 ++
 include/hw/xen/interface/memory.h              |  754 ++++++++
 include/hw/xen/interface/physdev.h             |  383 ++++
 include/hw/xen/interface/sched.h               |  202 ++
 include/hw/xen/interface/trace.h               |  341 ++++
 include/hw/xen/interface/vcpu.h                |  248 +++
 include/hw/xen/interface/version.h             |  113 ++
 include/hw/xen/interface/xen-compat.h          |   46 +
 include/hw/xen/interface/xen.h                 | 1049 +++++++++++
 include/hw/xen/xen.h                           |   21 +-
 include/monitor/hmp.h                          |    2 +
 include/sysemu/kvm_int.h                       |    4 +
 include/sysemu/kvm_xen.h                       |   42 +
 meson.build                                    |    2 +
 qapi/misc-target.json                          |  116 ++
 softmmu/globals.c                              |    2 +-
 softmmu/vl.c                                   |    2 +-
 target/i386/cpu.c                              |    1 +
 target/i386/cpu.h                              |   19 +
 target/i386/kvm/kvm.c                          |  259 ++-
 target/i386/kvm/kvm_i386.h                     |    2 +
 target/i386/kvm/meson.build                    |    2 +
 target/i386/kvm/trace-events                   |    7 +
 target/i386/kvm/xen-compat.h                   |   70 +
 target/i386/kvm/xen-emu.c                      | 1867 +++++++++++++++++++
 target/i386/kvm/xen-emu.h                      |   33 +
 target/i386/machine.c                          |   25 +
 73 files changed, 12840 insertions(+), 172 deletions(-)




