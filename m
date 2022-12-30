Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09E9659861
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:43:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEGu-0000Sm-EX; Fri, 30 Dec 2022 07:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEG0-00080k-67
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:04 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFr-00050t-8z
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=VsYoRs6sJZBq3Ey01jjPNOfbTee12ksyJAImIqyGKho=; b=SGZ4xj6YAZAAqjt2o/1PTnCGR2
 ikxLnVcIiDioppJSBUlB4h3nKJmrU4VeOIg1NVbje8A8dBZktts1zvb355wYckEqIQUsx80sNC6DW
 RmVexnFlt5pmmpU2EYaCDVe3DIqEV83ONeByoGvk0OGm3CVPKGuD4cohUG9TjiIRDNZerZiQvP678
 0WJVDi+TF+erTn1Rf4Fg8b/h+kwI61WCq99NvoAyw6DOwO0FExeTFpMD5iOU7PM8hjX/eG+zj8nW1
 LSrtXe3XkcupJV4DjpRCTNZMGrogPvyspmyWuqy60Lvtx5zrJJiZ+CVEsFCHWju5ThMLXIHDmjO3c
 h8Gkwc1Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pBEFk-00Ac7C-30; Fri, 30 Dec 2022 12:12:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pBEFY-005NvB-QT; Fri, 30 Dec 2022 12:12:36 +0000
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
Subject: [RFC PATCH v5 00/52] Xen support under KVM
Date: Fri, 30 Dec 2022 12:11:43 +0000
Message-Id: <20221230121235.1282915-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org;
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

Round 5, in which it gains a XenStore implementation. This just returns
ENOSYS to every request for now, but that's enough to let older Linux
guests boot, and let the XTF tests run.

As noted, I'd like to hook that up to a real xenstored via the UNIX
socket and an XS_SU command to let that connection be seen as the client
domain. If I can just get xenstored to be a little less crashy when run
without actual Xen, that is... 

Having even this much XenStore allows the GSI and PCI_INTX event 
delivery to be tested properly, and it's working OK with userspace 
IOAPIC and the hack to poll for deassertion on vmexit. I do still want 
to clean that (and VFIO) up with a hook on EOI in the PIC/IOAPIC instead 
of the excessive polling, but that's a pre-existing problem and I can 
live with what we have for now.

The in-kernel PIC/IOAPIC *do* have the right notifiers for acked GSIs
but they're deprecated, so I don't think I want to add code to the Xen
support in the kernel to support them; I think I'll just declare that
Xen support requires split-irqchip mode.

XenStore also means I can do some more kexec testing (since I'm lazy and
the kernels *inside* the disk images I'm using are old enough to need
it). So there are some fixes for SHUTDOWN_soft_reset in there too.

I think this is mostly ready to merge as it is, as an implementation of
the basic platform support.

Next steps.. with an actual xenstore hooked up, I can work on a set of 
gnttab backend operations like the evtchn ones, and then selecting the 
right set of ops according to whether we're running on true Xen or under 
KVM, and the existing back end drivers ought to work without a large 
amount of work (except perhaps for migration).

v5: https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-5
 • Add backend implementation of event channel support, to parallel the
   libxenevtchn API used by existing backend drivers.

 • Add basic XenStore ring implementation, test migration and kexec.

 • Some kexec/soft reset fixes (clear port pending bits, kernel timer virq).
 
 • Fix race with setting the xen_callback_asserted flag before actually
   doing so, which could lead to it being *cleared* again before we even
   assert it... and leave it asserted for ever.

v4: https://lore.kernel.org/qemu-devel/20221221010623.1000191-1-dwmw2@infradead.org/
 • Add soft reset support near the beginning and thread it through the
   rest of the feature enablement.

 • Add PV timer	support	and advertise XENFEAT_safe_hvm_pvclock.

 • Add basic grant table mapping and [gs]et_version / query_size support.

 • Make	xen_platform device build (and work) without CONFIG_XEN.

 • Fix Xen HVM mode not to require --xen-attach.

v3: https://lore.kernel.org/qemu-devel/20221216004117.862106-1-dwmw2@infradead.org/

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

v1: https://lore.kernel.org/qemu-devel/20221205173137.607044-1-dwmw2@infradead.org/

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

Joao Martins (18):
      include: import Xen public headers to include/standard-headers/
      i386/kvm: handle Xen HVM cpuid leaves
      xen-platform: exclude vfio-pci from the PCI platform unplug
      xen-platform: allow its creation with XEN_EMULATE mode
      hw/xen_backend: refactor xen_be_init()
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
 hw/i386/kvm/meson.build                            |    6 +
 hw/i386/kvm/xen_evtchn.c                           | 1598 +++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h                           |   69 +
 hw/i386/kvm/xen_gnttab.c                           |  241 +++
 hw/i386/kvm/xen_gnttab.h                           |   25 +
 hw/i386/kvm/xen_overlay.c                          |  265 ++++
 hw/i386/kvm/xen_overlay.h                          |   26 +
 hw/i386/kvm/xen_xenstore.c                         |  469 ++++++
 hw/i386/kvm/xen_xenstore.h                         |   20 +
 hw/i386/pc.c                                       |   23 +
 hw/i386/xen/meson.build                            |    5 +-
 hw/i386/xen/xen_platform.c                         |   57 +-
 hw/xen/Kconfig                                     |    3 +
 hw/xen/xen-legacy-backend.c                        |   40 +-
 include/hw/i386/pc.h                               |    3 +
 include/hw/xen/xen-legacy-backend.h                |    3 +
 include/hw/xen/xen.h                               |    5 +-
 include/standard-headers/xen/arch-x86/cpuid.h      |  118 ++
 include/standard-headers/xen/arch-x86/xen-x86_32.h |  194 +++
 include/standard-headers/xen/arch-x86/xen-x86_64.h |  241 +++
 include/standard-headers/xen/arch-x86/xen.h        |  398 +++++
 include/standard-headers/xen/event_channel.h       |  388 +++++
 include/standard-headers/xen/features.h            |  143 ++
 include/standard-headers/xen/grant_table.h         |  686 ++++++++
 include/standard-headers/xen/hvm/hvm_op.h          |  395 +++++
 include/standard-headers/xen/hvm/params.h          |  318 ++++
 include/standard-headers/xen/io/console.h          |   56 +
 include/standard-headers/xen/io/ring.h             |  495 ++++++
 include/standard-headers/xen/io/xs_wire.h          |  153 ++
 include/standard-headers/xen/memory.h              |  754 +++++++++
 include/standard-headers/xen/physdev.h             |  383 +++++
 include/standard-headers/xen/sched.h               |  202 +++
 include/standard-headers/xen/trace.h               |  341 ++++
 include/standard-headers/xen/vcpu.h                |  248 +++
 include/standard-headers/xen/version.h             |  113 ++
 include/standard-headers/xen/xen-compat.h          |   46 +
 include/standard-headers/xen/xen.h                 | 1049 +++++++++++++
 include/sysemu/kvm_int.h                           |    3 +
 include/sysemu/kvm_xen.h                           |   36 +
 meson.build                                        |    1 +
 monitor/misc.c                                     |    4 +
 softmmu/globals.c                                  |    2 +-
 target/i386/cpu.c                                  |    1 +
 target/i386/cpu.h                                  |   17 +
 target/i386/kvm/kvm.c                              |  208 ++-
 target/i386/kvm/meson.build                        |    2 +
 target/i386/kvm/trace-events                       |    6 +
 target/i386/kvm/xen-compat.h                       |   51 +
 target/i386/kvm/xen-emu.c                          | 1657 ++++++++++++++++++++
 target/i386/kvm/xen-emu.h                          |   33 +
 target/i386/machine.c                              |   25 +
 56 files changed, 11632 insertions(+), 32 deletions(-)



