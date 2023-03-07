Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8EC6AE91B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:21:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaxH-0003JL-Cn; Tue, 07 Mar 2023 12:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pZaww-00024X-1R
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:07 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pZawq-0007Sb-DU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gecK8XcXzPvwgAnWptcdPizelJbQTy3RtfVzFHsB5zQ=; b=pgRTQI3kJDMrZOsnRUinGOlu0T
 1OfvBVlkwUjjeIm/Yj6QrFcaqAcXr0i0xoYOvzqgfcMtcVqftQFvy0I1jOuNkGAcQ36UZ1tihkJMt
 qkECVD6eDm1T6XJDmmGxeCtlDz6v5L/BNM7ZHPqGcLexx5tNL/pKxW9MARaJgevcff/djCOOhzp/y
 8dMMTuibd1vG5ZXMj8GgcO+KrFMg+cWmtj3cpBbZFCDHMshuoDvUool526j9rAa87D6jPWQDvODuL
 ESgEI2Dz+Xkic3f8QwwkBtFE6bBIAdQx51XkV4CDduwnyYjEN+PjhIIAqWHBO0XEyqdLxyXLKud9y
 EFdHh1KA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZawj-006axJ-8S; Tue, 07 Mar 2023 17:17:53 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZawj-009cgU-0h; Tue, 07 Mar 2023 17:17:53 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 00/27] Enable PV backends with Xen/KVM emulation
Date: Tue,  7 Mar 2023 17:17:23 +0000
Message-Id: <20230307171750.2293175-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org;
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

Following on from the basic platform support which has already been
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
with that for 8.0 though, and we just mark the emulated XenStore device
as unmigratable to prevent users from trying.

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

v2: https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-2

 • Full set of reviewed-by tags from Paul (and associated minor fixes).

 • Disable migration for emulated XenStore device.

 • Update docs and add MAINTAINERS entry.

v1: https://lore.kernel.org/qemu-devel/20230302153435.1170111-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-1

David Woodhouse (23):
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
      MAINTAINERS: Add entry for Xen on KVM emulation
      docs: Update Xen-on-KVM documentation for PV disk support

Paul Durrant (4):
      hw/xen: Implement XenStore permissions
      hw/xen: Create initial XenStore nodes
      hw/xen: Add xenstore operations to allow redirection to internal emulation
      hw/xen: Avoid crash when backend watch fires too early

 MAINTAINERS                                   |    9 +
 accel/xen/xen-all.c                           |   69 +-
 docs/system/i386/xen.rst                      |   30 +-
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
 hw/i386/kvm/xen_xenstore.c                    | 1251 +++++++++++++++-
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
 53 files changed, 5804 insertions(+), 927 deletions(-)




