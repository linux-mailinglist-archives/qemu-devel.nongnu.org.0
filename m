Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10680699059
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:47:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSaow-00087g-IS; Thu, 16 Feb 2023 04:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSaos-00083h-FF
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:44:50 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSaoo-0006J0-Jg
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=MIpK75s6fkGBTxG3FKDoZ9miFdGAqA63/eE9zNyysRw=; b=mHVdz39wBkAndExpYdnsDHqOe5
 AyaQWyrW65oIioH4c9IlZtn2LLwxKoT2X57PTmaxizXp1D4SfXDFGPc7G523GjIVDUXVdnyO0Gd73
 2+nCTshCHISgjr88b7ydJ7A3CrEpyiYbk4g5ODzdldqxD2u/qCFn77+BbctZsKXub5jOA0+uwnWRv
 K7HENhlQCmfkuaNK5lrkFEBInVSPfsuETCcGHSHq1CSMUWVVsMV33xebzSTctMfu7tWfC+BFkyd09
 lgEdKb7fMc9Lhdo34YgHBo//tXtNoy2fxnOwFSaWBQxIP2ur1B7tewqIWsy3yyFuNH+yjYIu7qVA6
 I8DT9TIg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pSaoi-008Iai-FI; Thu, 16 Feb 2023 09:44:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSaoi-0090BB-1G; Thu, 16 Feb 2023 09:44:40 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [RFC PATCH v11bis 00/26] Emulated XenStore and PV backend support
Date: Thu, 16 Feb 2023 09:44:10 +0000
Message-Id: <20230216094436.2144978-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org;
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

The non-RFC patch submisson¹ is just the basic platform support for Xen
on KVM. This RFC series is phase 2, adding an internal XenStore and
hooking up the PV back end drivers to that and the emulated grant tables
and event channels.

With this, we can boot a Xen guest with PV disk, under KVM. Full support
for migration isn't there yet because it's actually missing in the PV
back end drivers in the first place (perhaps because upstream Xen doesn't
yet have guest transparent live migration support anyway). I'm assuming
that when the first round is merged and we drop the [RFC] from this set,
that won't be a showstopper for now?

I'd be particularly interested in opinions on the way I implemented
serialization for the XenStore, by creating a GByteArray and then dumping
it with VMSTATE_VARRAY_UINT32_ALLOC().

I may eventually attempt to make xs_node_walk() not actually recursive,
if I can do so without my brain exploding. Since the first time the
XenStore code was showed, I've stopped the XsNode from being an actual
Object; that just made it larger for almost no benefit. 

¹ https://lore.kernel.org/qemu-devel/20230216062444.2129371-1-dwmw2@infradead.org/

David Woodhouse (22):
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
      hw/xen: Subsume xen_be_register_common() into xen_be_init()
      i386/xen: Initialize Xen backends from pc_basic_device_init() for emulation

Paul Durrant (4):
      xenstore perms WIP
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
 hw/i386/kvm/xen_gnttab.c                      |  320 ++++-
 hw/i386/kvm/xen_gnttab.h                      |    1 +
 hw/i386/kvm/xen_xenstore.c                    | 1248 +++++++++++++++++-
 hw/i386/kvm/xenstore_impl.c                   | 1754 +++++++++++++++++++++++++
 hw/i386/kvm/xenstore_impl.h                   |   63 +
 hw/i386/pc.c                                  |    7 +
 hw/i386/pc_piix.c                             |    4 +-
 hw/i386/xen/xen-hvm.c                         |    8 +-
 hw/i386/xen/xen_platform.c                    |    7 +-
 hw/net/xen_nic.c                              |   25 +-
 hw/usb/meson.build                            |    2 +-
 hw/usb/xen-usb.c                              |   29 +-
 hw/xen/meson.build                            |    6 +-
 hw/xen/trace-events                           |    2 +-
 hw/xen/xen-bus-helper.c                       |   61 +-
 hw/xen/xen-bus.c                              |  408 +-----
 hw/xen/xen-hvm-common.c                       |   45 +-
 hw/xen/xen-legacy-backend.c                   |  307 ++---
 hw/xen/xen-mapcache.c                         |    2 +-
 hw/xen/xen-operations.c                       |  487 +++++++
 hw/xen/xen_devconfig.c                        |    4 +-
 hw/xen/xen_pt.c                               |    2 +-
 hw/xen/xen_pt.h                               |    2 +-
 hw/xen/xen_pt_config_init.c                   |    2 +-
 hw/xen/xen_pt_graphics.c                      |    1 -
 hw/xen/xen_pt_msi.c                           |    4 +-
 hw/xen/xen_pvdev.c                            |   63 +-
 hw/xenpv/xen_machine_pv.c                     |    6 +-
 include/hw/xen/xen-bus-helper.h               |   25 +-
 include/hw/xen/xen-bus.h                      |   21 +-
 include/hw/xen/xen-hvm-common.h               |    3 +-
 include/hw/xen/xen-legacy-backend.h           |   27 +-
 include/hw/xen/xen.h                          |   24 +-
 include/hw/xen/xen_backend_ops.h              |  399 ++++++
 include/hw/xen/{xen_common.h => xen_native.h} |   75 +-
 include/hw/xen/xen_pvdev.h                    |    6 +-
 softmmu/globals.c                             |    4 +
 target/i386/kvm/xen-emu.c                     |    5 +
 tests/unit/meson.build                        |    1 +
 tests/unit/test-xs-node.c                     |  717 ++++++++++
 54 files changed, 5454 insertions(+), 978 deletions(-)



