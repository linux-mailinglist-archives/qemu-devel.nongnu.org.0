Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE56466D1AD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:20:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXpu-0007ZM-8J; Mon, 16 Jan 2023 17:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXpO-0007Pn-2P
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:42 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXpF-00070Z-4W
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=E89HLhAsYoc7SWPou+xhueRvTc1k2cfrP449kHNdRlY=; b=XGFFNe/S3ftlwytHB4vfBAbsLp
 ze2or8SY/Q3CWc6nZbwdcfpnoFxlkW/PLC4RCOCMls7lLg5scomXELvMjaVUoQDm70exWhBd6N/fW
 bzMrqIOQoGgSq7Mt7x+J66GT0cbRjE8AvBMiBWz/S0rqvsVjZo40KZxfqn4+To03hcCECtQLHxgww
 ZJoBi1qdQ+y5IAbFnxT7VkKA2Ygy9McJX50+MnmafgXMqCodA0BcAfOpCzWmdMJyOKZfqk4SB8eHs
 M7rMoeIkih7k6UXrqF3PAyLmPtNUyHVabMCXOQX8mc3xFsoYCXcRBnfAJiWmWiVqKBrmVUMTcR5ux
 b+vUOUDw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHXox-005juX-2v; Mon, 16 Jan 2023 22:19:16 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXp7-004iXE-0t; Mon, 16 Jan 2023 22:19:25 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [RFC PATCH v7bis 00/19] Emulated Xen PV backend and PIRQ support
Date: Mon, 16 Jan 2023 22:19:00 +0000
Message-Id: <20230116221919.1124201-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116215805.1123514-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org;
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

This is what's in flux on top of the series posted as v7.

It contains both the PV back end support and the PIRQ support which were
previous posted in separate series. The former is mostly unchanged, and
we still need to either port that C++ XenStore implementation or make
Xen's own xenstored stop crashing when run without a real Xen. Although
the basic ops table support is probably sane enough to go in; it just
wants testing on real Xen.

As noted, it would have been nice to remove the old Xen headers in the 
first phase of patches with the initial platform support, but it really 
does need the header untangling which occurs as we go through the 
backend and introduce the generic ops support.

The PIRQ support is significantly reworked and I think I've fixed up
the locking issues, and tested with both emulated and VFIO passthrough
devices for MSI and MSI-X to PIRQ mappings.

I do need to disable the KVM irqfd routing if there are VFIO devices and 
the kernel is old enough not to support native evtchn delivery. I have 
plans around that¹ but was hoping to avoid them becoming a dependency of 
any of the Xen suppport, so I'll probably just make it refuse that 
configuration on older kernels.

¹ https://lore.kernel.org/qemu-devel/aaef9961d210ac1873153bf3cf01d984708744fc.camel@infradead.org/


David Woodhouse (18):
      hw/xen: Add evtchn operations to allow redirection to internal emulation
      hw/xen: Add emulated evtchn ops
      hw/xen: Add gnttab operations to allow redirection to internal emulation
      hw/xen: Pass grant ref to gnttab unmap
      hw/xen: Add foreignmem operations to allow redirection to internal emulation
      hw/xen: Move xenstore_store_pv_console_info to xen_console.c
      hw/xen: Use XEN_PAGE_SIZE in PV backend drivers
      hw/xen: Rename xen_common.h to xen_native.h
      hw/xen: Build PV backend drivers for XENFV_MACHINE
      hw/xen: Map guest XENSTORE_PFN grant in emulated Xenstore
      hw/xen: Add backend implementation of grant table operations
      hw/xen: Implement soft reset for emulated gnttab
      hw/xen: Remove old version of Xen headers
      i386/xen: Initialize XenBus and legacy backends from pc_init1()
      i386/xen: Implement HYPERVISOR_physdev_op
      hw/xen: Implement emulated PIRQ hypercall support
      hw/xen: Support GSI mapping to PIRQ
      hw/xen: Support MSI mapping to PIRQ

Paul Durrant (1):
      hw/xen: Add xenstore operations to allow redirection to internal emulation

 accel/xen/xen-all.c                           |   69 +-
 hw/9pfs/meson.build                           |    2 +-
 hw/9pfs/xen-9p-backend.c                      |   32 +-
 hw/9pfs/xen-9pfs.h                            |    4 +-
 hw/block/dataplane/meson.build                |    2 +-
 hw/block/dataplane/xen-block.c                |   12 +-
 hw/block/meson.build                          |    2 +-
 hw/block/xen-block.c                          |    1 -
 hw/block/xen_blkif.h                          |    5 +-
 hw/char/meson.build                           |    2 +-
 hw/char/xen_console.c                         |   59 +-
 hw/display/meson.build                        |    2 +-
 hw/display/xenfb.c                            |   38 +-
 hw/i386/kvm/trace-events                      |    5 +
 hw/i386/kvm/trace.h                           |    1 +
 hw/i386/kvm/xen-stubs.c                       |   15 +
 hw/i386/kvm/xen_evtchn.c                      |  596 ++++++++++++++-
 hw/i386/kvm/xen_evtchn.h                      |   23 +
 hw/i386/kvm/xen_gnttab.c                      |  320 +++++++-
 hw/i386/kvm/xen_gnttab.h                      |    1 +
 hw/i386/kvm/xen_xenstore.c                    |   13 +-
 hw/i386/pc_piix.c                             |   17 +
 hw/i386/x86.c                                 |   16 +
 hw/i386/xen/xen-hvm.c                         |   45 +-
 hw/i386/xen/xen-mapcache.c                    |    2 +-
 hw/i386/xen/xen_platform.c                    |    7 +-
 hw/net/xen_nic.c                              |   27 +-
 hw/pci/msi.c                                  |   11 +
 hw/pci/msix.c                                 |    7 +
 hw/pci/pci.c                                  |   17 +
 hw/usb/meson.build                            |    2 +-
 hw/usb/xen-usb.c                              |   31 +-
 hw/xen/meson.build                            |    6 +-
 hw/xen/trace-events                           |    2 +-
 hw/xen/xen-bus-helper.c                       |   61 +-
 hw/xen/xen-bus.c                              |  394 ++--------
 hw/xen/xen-legacy-backend.c                   |  256 ++-----
 hw/xen/xen-operations.c                       |  487 ++++++++++++
 hw/xen/xen_devconfig.c                        |    4 +-
 hw/xen/xen_pt.c                               |    2 +-
 hw/xen/xen_pt.h                               |    2 +-
 hw/xen/xen_pt_config_init.c                   |    2 +-
 hw/xen/xen_pt_graphics.c                      |    1 -
 hw/xen/xen_pt_msi.c                           |    4 +-
 hw/xen/xen_pvdev.c                            |   63 +-
 include/hw/pci/msi.h                          |    1 +
 include/hw/xen/interface/grant_table.h        |   36 -
 include/hw/xen/interface/io/blkif.h           |  712 -----------------
 include/hw/xen/interface/io/console.h         |   46 --
 include/hw/xen/interface/io/fbif.h            |  156 ----
 include/hw/xen/interface/io/kbdif.h           |  566 --------------
 include/hw/xen/interface/io/netif.h           | 1010 -------------------------
 include/hw/xen/interface/io/protocols.h       |   42 -
 include/hw/xen/interface/io/ring.h            |  474 ------------
 include/hw/xen/interface/io/usbif.h           |  254 -------
 include/hw/xen/interface/io/xenbus.h          |   70 --
 include/hw/xen/xen-bus-helper.h               |   25 +-
 include/hw/xen/xen-bus.h                      |   21 +-
 include/hw/xen/xen-legacy-backend.h           |   24 +-
 include/hw/xen/xen.h                          |   24 +-
 include/hw/xen/xen_backend_ops.h              |  393 ++++++++++
 include/hw/xen/{xen_common.h => xen_native.h} |   75 +-
 include/hw/xen/xen_pvdev.h                    |    6 +-
 meson.build                                   |    1 +
 softmmu/globals.c                             |    4 +
 target/i386/kvm/kvm.c                         |   12 +-
 target/i386/kvm/kvm_i386.h                    |    2 +
 target/i386/kvm/xen-compat.h                  |   19 +
 target/i386/kvm/xen-emu.c                     |  141 +++-
 69 files changed, 2491 insertions(+), 4293 deletions(-)




