Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D86AF03C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc21-0006ee-2M; Tue, 07 Mar 2023 13:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZc1w-0006dl-VR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:27:21 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZc1s-0005xT-NF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IaNafSRjao+HaQw+ELYtYhkTBjvlc263O8BCVna3wJQ=; b=AqDQak70zR9wTipkqxullPY4kX
 ZoGJ6bhYui0ncHAA5WTJ6IF2bEtLU3hiavoVEzGKJBVrlYa5rYIOE4CgdTzrlitaLDwvSOLzjPOEv
 1fe0qLcdks+wXeorcMBrIKW+eLT+49EPPnnhek5q7IN0NJ+rPxNCzUOnlvows0yrZLRUKwBwlB7V/
 NUGykSofL946Crl6ODSdlGzB81/sQEgK4yCfSIm9454Br/+ECWLxg8MBLHrKWZ7zR9lirgZlIfw+6
 NipmUli0AZB93LBghuS1GB6223Ehwpxe2bvIpI7fN9Im22Ui4X13fvgGWErxDHwu+1EgrHE9z6Ra4
 IV/F7Y4w==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZc1m-00H8T0-30; Tue, 07 Mar 2023 18:27:11 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1m-009e87-2N; Tue, 07 Mar 2023 18:27:10 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 00/27] Enable PV backends with Xen/KVM emulation
Date: Tue,  7 Mar 2023 18:26:40 +0000
Message-Id: <20230307182707.2298618-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@desiato.srs.infradead.org;
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

The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:

  Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)

are available in the Git repository at:

  git://git.infradead.org/users/dwmw2/qemu.git refs/tags/xenfv-2 

for you to fetch changes up to 154eac37190c4d80d29b09c226abd899e397530f:

  docs: Update Xen-on-KVM documentation for PV disk support (2023-03-07 17:04:30 +0000)


Tested-by: Paul Durrant <paul@xen.org>
... on real Xen (master branch, 4.18) with a Debian guest.

----------------------------------------------------------------
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
 create mode 100644 hw/i386/kvm/xenstore_impl.c
 create mode 100644 hw/i386/kvm/xenstore_impl.h
 create mode 100644 hw/xen/xen-operations.c
 create mode 100644 include/hw/xen/xen_backend_ops.h
 rename include/hw/xen/{xen_common.h => xen_native.h} (89%)
 create mode 100644 tests/unit/test-xs-node.c



