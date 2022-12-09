Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29707648084
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:58:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a7u-0002cL-5o; Fri, 09 Dec 2022 04:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7K-0002S4-TT
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:30 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7G-0006pG-R8
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1Gx79qVml6cc8/FuICbzwvs++hoiA59DMkTeEwuiISA=; b=lT+3I1//9CHxMWli0iud5/9cH2
 u5C41o+yxREIbAaz+b0J/c2afRnCKx91SMFbry3hr8xa2oJ0zG73a3bOx0oldYvt9J2PVwOEVKvJU
 shsaZWIVu9/QtYpCS99J9RaLUqkXkoMw7+Mk7XrvGJs5UQpK60k15wLYFEoM/tDqDRKwmxdd9RC17
 KUjfR7YaTFtIYxPjAlfVkDH1bqY6fhPoj3GlbKAf3hUMl4jD/WlZJqUmOu0k2Ba5R/BkrQKW3fY4c
 jodFufcGOnTRtlfsiufJxgw6lZWYHHcqYneT9etWfv308V/hvqd6R7EqYNb5yITSvEsnCQRhn8dB4
 RpIRLvag==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a7F-007tiH-Sh; Fri, 09 Dec 2022 09:56:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a77-002tYB-FP; Fri, 09 Dec 2022 09:56:17 +0000
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
Subject: [RFC PATCH v2 00/22] Xen HVM support under KVM
Date: Fri,  9 Dec 2022 09:55:50 +0000
Message-Id: <20221209095612.689243-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org;
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

Continuing the revival of Oracle's work at
https://github.com/jpemartins/qemu/commits/xen-shim-rfc to work against
the Xen guest support as it was finally merged into the kernel, and
updated to today's QEMU. When complete, this will allow us to run native
Xen guests on top of Linux/KVM without them noticing that it's not Xen.

Thanks for the useful feedback in response to v1. Hopefully I've taken
it all on board correctly.

The main question I have right now is about the way the target KVM
code calls directly into things like xen_overlay_map_page() which
live in hw/i386/kvm/ — and the way that function uses a singleton
object. That can't be right, but I figured I should just keep typing
and get the actual code working to show what I'm trying to do...

v2:
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
 
The guest boots as far as panicking when it can't register the timer
VIRQ because we haven't implemented event channel hypercalls yet. 

The xen-platform-pci and pc_piix patches still need a little cleaning
up but I'll rework them when the dust settles on the config options and
how the target/machine components interact rather than bikeshedding them
too much early on. For now, we just need to be able to use the xenfv
machine in order to instantiate the shinfo and evtchn objects.

  qemu-system-x86_64 -serial mon:stdio -machine xenfv,xen-version=0x4000a \
         -cpu host,+xen-vapic  -display none --trace "kvm_xen*" \
         -kernel /boot/vmlinuz-5.17.8-200.fc35.x86_64 \
         -append "console=ttyS0,115200 earlyprintk=ttyS0,115200"

Ankur Arora (2):
      i386/xen: implement HVMOP_set_evtchn_upcall_vector
      i386/xen: HVMOP_set_param / HVM_PARAM_CALLBACK_IRQ

David Woodhouse (3):
      xen: add CONFIG_XENFV_MACHINE and CONFIG_XEN_EMU options for Xen emulation
      i386/xen: Add xen-version machine property and init KVM Xen support
      hw/xen: Add xen_overlay device for emulating shared xenheap pages

Joao Martins (17):
      include: import xen public headers
      i386/kvm: handle Xen HVM cpuid leaves
      xen-platform-pci: allow its creation with XEN_EMULATE mode
      hw/xen_backend: refactor xen_be_init()
      pc_piix: handle XEN_EMULATE backend init
      xen_platform: exclude vfio-pci from the PCI platform unplug
      pc_piix: allow xenfv machine with XEN_EMULATE
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

 accel/Kconfig                                      |    1 +
 hw/Kconfig                                         |    1 +
 hw/i386/kvm/meson.build                            |    4 +
 hw/i386/kvm/xen_evtchn.c                           |  117 +++
 hw/i386/kvm/xen_evtchn.h                           |   13 +
 hw/i386/kvm/xen_overlay.c                          |  198 ++++
 hw/i386/kvm/xen_overlay.h                          |   14 +
 hw/i386/pc.c                                       |   32 +
 hw/i386/pc_piix.c                                  |   29 +-
 hw/i386/xen/xen_platform.c                         |   29 +-
 hw/xen/Kconfig                                     |    3 +
 hw/xen/xen-legacy-backend.c                        |   62 +-
 include/hw/i386/pc.h                               |    3 +
 include/hw/xen/xen-legacy-backend.h                |    5 +
 include/standard-headers/xen/arch-x86/cpuid.h      |  118 +++
 include/standard-headers/xen/arch-x86/xen-x86_32.h |  194 ++++
 include/standard-headers/xen/arch-x86/xen-x86_64.h |  241 +++++
 include/standard-headers/xen/arch-x86/xen.h        |  398 ++++++++
 include/standard-headers/xen/event_channel.h       |  388 ++++++++
 include/standard-headers/xen/features.h            |  143 +++
 include/standard-headers/xen/grant_table.h         |  686 +++++++++++++
 include/standard-headers/xen/hvm/hvm_op.h          |  395 ++++++++
 include/standard-headers/xen/hvm/params.h          |  318 ++++++
 include/standard-headers/xen/memory.h              |  754 ++++++++++++++
 include/standard-headers/xen/physdev.h             |  383 +++++++
 include/standard-headers/xen/sched.h               |  202 ++++
 include/standard-headers/xen/trace.h               |  341 +++++++
 include/standard-headers/xen/vcpu.h                |  248 +++++
 include/standard-headers/xen/version.h             |  113 +++
 include/standard-headers/xen/xen-compat.h          |   46 +
 include/standard-headers/xen/xen.h                 | 1049 ++++++++++++++++++++
 meson.build                                        |    1 +
 target/Kconfig                                     |    4 +
 target/i386/cpu.c                                  |    1 +
 target/i386/cpu.h                                  |    7 +
 target/i386/kvm/kvm.c                              |  147 ++-
 target/i386/machine.c                              |   27 +
 target/i386/meson.build                            |    1 +
 target/i386/trace-events                           |    6 +
 target/i386/xen.c                                  |  594 +++++++++++
 target/i386/xen.h                                  |   30 +
 41 files changed, 7312 insertions(+), 34 deletions(-)




