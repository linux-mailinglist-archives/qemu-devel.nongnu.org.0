Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A06A8566
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 16:37:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkxe-00042L-O3; Thu, 02 Mar 2023 10:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXkxH-0003nV-PI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:34:52 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXkxC-0001f7-Iy
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+LHndM7s06jE4AQvHMfpIjWQzwiehskMN9ekfZrGg84=; b=C7oLaOwfN9v8e3sRj1Kx5VN2Oi
 4snywDWGsEZfIdTsRdGE6YD3mpSxFM+IiEpFpm+E9ThIfAaIpqxmq1E4qNc3nbjs0CBpV1ZqB3/8U
 gWCtBolozsoPRge4juS+R1ho5gTzdBEpHHWoI+OJQGTXj4PpJmpv5P4ZLUbOaq5WTUuQ0nhPtY/+8
 khZiyoqW2B/O5vedi99TITipU4c7ZBI+tjrTuUAOrGvLB+tUyCL/UdR4V+JdyA3hc5Vj87eDJBHhP
 m/QdDCSqCiWjCrw2fFIRGyPVNvPNVmE29XnC8OgkYeAoCwdIZgdHmf02b5iUm3vVceQ/sBkN8WR5A
 qchwnQ7A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx3-00FL3Z-2p; Thu, 02 Mar 2023 15:34:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx3-004uyH-2L; Thu, 02 Mar 2023 15:34:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 00/25] Enable PV backends with Xen/KVM emulation
Date: Thu,  2 Mar 2023 15:34:10 +0000
Message-Id: <20230302153435.1170111-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Now that the basic platform support is hopefully on the cusp of being 
merged, here's phase 2 which wires up the XenBus and PV back ends.

It starts with a basic single-tenant internal implementation of a 
XenStore, with a copy-on-write tree, watches, transactions, quotas.

Then we introduce operations tables for the grant table, event channel,
foreignmen and xenstore operations so that in addition to using the Xen
libraries for those, QEMU can use its internal emulated versions.

A little bit of cleaning up of header files, and we can enable the build
of xen-bus in the CONFIG_XEN_EMU build, and run a Xen guest with an
actual PV disk...

   qemu-system-x86_64 -serial mon:stdio -M q35 -display none -m 1G -smp 2 \
      -accel kvm,xen-version=0x4000e,kernel-irqchip=split \
      -kernel bzImage -append "console=ttyS0 root=/dev/xvda1 selinux=0" \
      -drive file=/var/lib/libvirt/images/fedora28.qcow2,if=none,id=disk \
      -device xen-disk,drive=disk,vdev=xvda

The main thing that isn't working here is migration. I've implemented it 
for the internal xenstore and the unit tests exercise it, but the 
existing PV back ends don't support it, perhaps partly because support 
for guest transparent live migration support isn't upstream in Xen yet. 
So the disk doesn't come back correctly after migration. I'm content 
with that for 8.0 though.

The other pre-existing constraint is that only the block back end has
yet been ported to the "new" XenBus infrastructure, and is actually
capable of creating its own backend nodes. Again, I can live with
that for 8.0. Maybe this will motivate us to finally get round to
converting the rest off XenLegacyBackend and killing it.

We also don't have a simple way to perform grant mapping of multiple
guest pages to contiguous addresses, as we can under real Xen. So we
don't advertise max-ring-page-order for xen-disk in the emulated mode.
Fixing that — if we actually want to — would probably require mapping
RAM from an actual backing store object, so that it can be mapped again
at a different location for the PV back end to see.

David Woodhouse (21):
      hw/xen: Add xenstore wire implementation and implementation stubs
      hw/xen: Add basic XenStore tree walk and write/read/directory support
      hw/xen: Implement XenStore watches
      hw/xen: Implement XenStore transactions
      hw/xen: Watches on XenStore transactions
      hw/xen: Implement core serialize/deserialize methods for xenstore_impl
      hw/xen: Add evtchn operations to allow redirection to internal emulation
      hw/xen: Add gnttab operations to allow redirection to internal emulation
      hw/xen: Pass grant ref to gnttab unmap operation
      hw/xen: Add foreignmem operations to allow redirection to internal emulation
      hw/xen: Move xenstore_store_pv_console_info to xen_console.c
      hw/xen: Use XEN_PAGE_SIZE in PV backend drivers
      hw/xen: Rename xen_common.h to xen_native.h
      hw/xen: Build PV backend drivers for CONFIG_XEN_BUS
      hw/xen: Only advertise ring-page-order for xen-block if gnttab supports it
      hw/xen: Hook up emulated implementation for event channel operations
      hw/xen: Add emulated implementation of grant table operations
      hw/xen: Add emulated implementation of XenStore operations
      hw/xen: Map guest XENSTORE_PFN grant in emulated Xenstore
      hw/xen: Implement soft reset for emulated gnttab
      i386/xen: Initialize Xen backends from pc_basic_device_init() for emulation

Paul Durrant (4):
      hw/xen: Implement XenStore permissions
      hw/xen: Create initial XenStore nodes
      hw/xen: Add xenstore operations to allow redirection to internal emulation
      hw/xen: Avoid crash when backend watch fires too early

 accel/xen/xen-all.c                           |   69 +-
 hw/9pfs/meson.build                           |    2 +-
 hw/9pfs/xen-9p-backend.c                      |   32 +-
 hw/block/dataplane/meson.build                |    2 +-
 hw/block/dataplane/xen-block.c                |   12 +-
 hw/block/meson.build                          |    2 +-
 hw/block/xen-block.c                          |   12 +-
 hw/char/meson.build                           |    2 +-
 hw/char/xen_console.c                         |   57 +-
 hw/display/meson.build                        |    2 +-
 hw/display/xenfb.c                            |   32 +-
 hw/i386/kvm/meson.build                       |    1 +
 hw/i386/kvm/trace-events                      |   15 +
 hw/i386/kvm/xen_evtchn.c                      |   15 +
 hw/i386/kvm/xen_gnttab.c                      |  325 ++++-
 hw/i386/kvm/xen_gnttab.h                      |    1 +
 hw/i386/kvm/xen_xenstore.c                    | 1250 +++++++++++++++-
 hw/i386/kvm/xenstore_impl.c                   | 1927 +++++++++++++++++++++++++
 hw/i386/kvm/xenstore_impl.h                   |   63 +
 hw/i386/pc.c                                  |    7 +
 hw/i386/pc_piix.c                             |    4 +-
 hw/i386/xen/xen-hvm.c                         |   38 +-
 hw/i386/xen/xen-mapcache.c                    |    2 +-
 hw/i386/xen/xen_platform.c                    |    7 +-
 hw/net/xen_nic.c                              |   25 +-
 hw/usb/meson.build                            |    2 +-
 hw/usb/xen-usb.c                              |   29 +-
 hw/xen/meson.build                            |    6 +-
 hw/xen/trace-events                           |    2 +-
 hw/xen/xen-bus-helper.c                       |   62 +-
 hw/xen/xen-bus.c                              |  411 +-----
 hw/xen/xen-legacy-backend.c                   |  254 +---
 hw/xen/xen-operations.c                       |  478 ++++++
 hw/xen/xen_devconfig.c                        |    4 +-
 hw/xen/xen_pt.c                               |    2 +-
 hw/xen/xen_pt.h                               |    2 +-
 hw/xen/xen_pt_config_init.c                   |    2 +-
 hw/xen/xen_pt_graphics.c                      |    1 -
 hw/xen/xen_pt_msi.c                           |    4 +-
 hw/xen/xen_pvdev.c                            |   63 +-
 include/hw/xen/xen-bus-helper.h               |   26 +-
 include/hw/xen/xen-bus.h                      |   21 +-
 include/hw/xen/xen-legacy-backend.h           |   24 +-
 include/hw/xen/xen.h                          |   24 +-
 include/hw/xen/xen_backend_ops.h              |  408 ++++++
 include/hw/xen/{xen_common.h => xen_native.h} |   75 +-
 include/hw/xen/xen_pvdev.h                    |    6 +-
 softmmu/globals.c                             |    4 +
 target/i386/kvm/xen-emu.c                     |    5 +
 tests/unit/meson.build                        |    1 +
 tests/unit/test-xs-node.c                     |  871 +++++++++++
 51 files changed, 5771 insertions(+), 920 deletions(-)




