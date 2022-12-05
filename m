Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EF0642EEC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:34:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKl-00081a-3Y; Mon, 05 Dec 2022 12:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FKR-0007uK-O2
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:31 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FJx-0007PP-Lu
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=4s2Y6nV/nobcYJgXrNw8xGKRSb4jdpBfUg9CkT6k3mM=; b=HIt0ITbgF04Tt3pyndwco9Hlon
 l2GUj30QLeEt3plHhc+kH2+eBYnan3aw99f72PRCmUx8vLemgSXceMOsCwVi0UpfUfF5dr9yIOEx7
 SrjGpK0DtNSlQdFffyrHu/H9dEA490GTcgYXlHKtH20A3cjcNrYsXWzqYcvEqi1ZwZ4qdQm6Ey1KQ
 6h28GcZKmonVSoRpYDTFwTFIip/kQMjPrCc/oR9JphikP8czSAvIlPhHBokipD3NI6lW/5GB9zGSk
 Ce0INCkUYt4EjozGJs/5hml6GyXi7b+DpbpSnpiwFIMlwVuqeWSVubBlAXqemvlUXfg4rx3sf+0Q0
 TVZHmZQA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJo-007fzF-Cm; Mon, 05 Dec 2022 17:31:52 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YJZ-3p; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 00/21] Xen HVM support under KVM
Date: Mon,  5 Dec 2022 17:31:16 +0000
Message-Id: <20221205173137.607044-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org;
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

In 2019, Joao Martins posted a set of Linux KVM patches¹ which added
support for hosting Xen HVM guests directly under KVM. Referenced from
that post was a qemu git tree² which made use of it.

Now that the core of the kernel support has been merged upstream, I'm
looking at updating the qemu support and potentially getting it merged
too. This is the first attempt at the first round of that, adding the
basics of KVM support with '-machine xenfv' and then just enough of
the hypercall support to register the shared_info and vcpu_info areas
before the guest kernel will panic when it can't use event channels
for IPIs.

Before I go much further, I think it needs all the runtime state (the
shared info page address, etc.) to be correctly live migratable. Some
pointers on how to do that would be welcomed. There's plenty more to
heckle too...

  qemu-system-x86_64 -serial mon:stdio -machine xenfv,xen-version=0x4000a \
         -cpu host,-kvm,+xen,+xen-vapic  -display none \
         -kernel /boot/vmlinuz-5.17.8-200.fc35.x86_64 \
         -append "console=ttyS0,115200 earlyprintk=ttyS0,115200" \
         --trace "kvm_xen*"

¹ https://lore.kernel.org/kvm/20190220201609.28290-1-joao.m.martins@oracle.com/
² https://github.com/jpemartins/qemu/commits/xen-shim-rfc

Ankur Arora (2):
      kvm/ioapic: mark gsi-2 used in ioapic routing init
      i386/xen: handle event channel upcall related hypercalls

David Woodhouse (1):
      i386/xen: Add xen-version machine property and init KVM Xen support

Joao Martins (18):
      include: import xen public headers
      i386/kvm: handle Xen HVM cpuid leaves
      xen-platform-pci: allow its creation with XEN_EMULATE mode
      hw/xen_backend: refactor xen_be_init()
      pc_piix: handle XEN_EMULATE backend init
      xen-platform-pci: register xen-mmio as RAM for XEN_EMULATE
      xen_platform: exclude vfio-pci from the PCI platform unplug
      pc_piix: allow xenfv machine with XEN_EMULATE
      i386/xen: handle guest hypercalls
      i386/xen: implement HYPERCALL_xen_version
      i386/xen: set shared_info page
      i386/xen: implement HYPERVISOR_hvm_op
      i386/xen: implement HYPERVISOR_vcpu_op
      i386/xen: handle register_vcpu_info
      i386/xen: handle register_vcpu_time_memory_area
      i386/xen: handle register_runstate_memory_area
      i386/xen: implement HYPERVISOR_event_channel_op
      i386/xen: implement HYPERVISOR_sched_op

 accel/kvm/kvm-all.c                                |   11 +
 backends/cryptodev-vhost.c                         |    4 +-
 backends/vhost-user.c                              |    4 +-
 hw/block/vhost-user-blk.c                          |   45 +-
 hw/display/next-fb.c                               |    2 +-
 hw/i386/kvm/ioapic.c                               |    1 +
 hw/i386/pc.c                                       |   32 +
 hw/i386/pc_piix.c                                  |   19 +-
 hw/i386/xen/xen_platform.c                         |   37 +-
 hw/loongarch/Kconfig                               |    1 -
 hw/loongarch/acpi-build.c                          |   18 -
 hw/loongarch/virt.c                                |   62 --
 hw/net/vhost_net.c                                 |    8 +-
 hw/nvme/ctrl.c                                     |  182 +++-
 hw/scsi/vhost-scsi-common.c                        |    4 +-
 hw/virtio/trace-events                             |    4 +-
 hw/virtio/vhost-user-fs.c                          |    4 +-
 hw/virtio/vhost-user-gpio.c                        |   26 +-
 hw/virtio/vhost-user-i2c.c                         |    4 +-
 hw/virtio/vhost-user-rng.c                         |    4 +-
 hw/virtio/vhost-user.c                             |   71 --
 hw/virtio/vhost-vsock-common.c                     |    4 +-
 hw/virtio/vhost.c                                  |   44 +-
 hw/xen/xen-legacy-backend.c                        |   62 +-
 include/hw/core/cpu.h                              |    2 +
 include/hw/i386/pc.h                               |    3 +
 include/hw/loongarch/virt.h                        |    5 -
 include/hw/virtio/vhost-user-gpio.h                |   10 -
 include/hw/virtio/vhost-user.h                     |   18 -
 include/hw/virtio/vhost.h                          |    6 +-
 include/hw/virtio/virtio.h                         |   23 +-
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
 include/sysemu/kvm.h                               |    3 +
 include/sysemu/kvm_int.h                           |    3 +
 target/i386/cpu.c                                  |    2 +
 target/i386/cpu.h                                  |   12 +
 target/i386/kvm/kvm.c                              |   95 ++
 target/i386/meson.build                            |    1 +
 target/i386/tcg/decode-new.c.inc                   |    3 +-
 target/i386/tcg/sysemu/excp_helper.c               |   34 +-
 target/i386/trace-events                           |    6 +
 target/i386/xen-proto.h                            |   23 +
 target/i386/xen.c                                  |  578 +++++++++++
 target/i386/xen.h                                  |   28 +
 target/s390x/tcg/cc_helper.c                       |    7 -
 target/s390x/tcg/insn-data.h.inc                   |    2 +-
 tests/qtest/libqos/virtio-gpio.c                   |    3 +-
 tests/qtest/migration-test.c                       |   20 +-
 65 files changed, 7141 insertions(+), 421 deletions(-)








