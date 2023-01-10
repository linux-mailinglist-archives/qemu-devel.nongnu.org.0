Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A87664421
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:08:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDu9-0007R2-Hr; Tue, 10 Jan 2023 07:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDtH-0007C3-7C
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:38:16 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDtC-0006Zk-L3
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wskMQVYy0SSexHcMPDDg9TobzH0QQyeV2wN9gKHtNBw=; b=lOI4JRqPXLYuLy+GAjXTqBDvDI
 ZJmTGz9Lao60gH81LtGF9Ztc0dCieBRknE6otELcQHyD28qGYdbk+dfb7sXtNKYMWIFIgMumTzF/c
 GS5N6ZgYaYEnWrV97fZcQs5z4zBiZX4ZeqM41zJ3YccMBE3ddrVNLLp4mmFkyzkdhQv+mR2rFouVb
 MlGVr5cQ2jK7AAFYrLzpI5Fqft/TUhC8OLyF0S6KSfgYOM+r7amdszL9HEW0bIebnFlC/AesujNvo
 UmJFSugX+TG2V1pFdIBXhj63dGI8XnthOtz9wy9QtgLhvavPPHJJGoVivk/zZxSJ2b1uInOD2Hmcm
 KTJ1jLDA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pFDsy-003885-2v; Tue, 10 Jan 2023 12:37:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFDt6-006Z5j-5l; Tue, 10 Jan 2023 12:37:56 +0000
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
Subject: [RFC PATCH v1 00/15] Xen PV backend support for KVM/Xen guests
Date: Tue, 10 Jan 2023 12:37:39 +0000
Message-Id: <20230110123754.1564465-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230110122042.1562155-1-dwmw2@infradead.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org;
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

This is a very early preview of phase 2, in which we make the PV backend 
drivers build. Mostly by providing operations tables that can be backed 
either by the true Xen toolstack libraries, or by the internal emulated 
versions. But also a bunch of untangling of headers to keep things sane.

Some parts of it are relatively straightforward; others less so. In
particular, it looks really hard to provide a contiguous virtual mapping
of multiple potentially discontiguous pages granted by the guest. To
fix that we might actually need the guest memory blocks to be backed
by real files (perhaps deleted or shmem) in order that they can be mapped
again in at a different virtual address. So for now we'll limit the
back ends to mapping a single grant ref at a time.

https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-backends-1

David Woodhouse (14):
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
 hw/i386/kvm/xen_evtchn.c                      |   15 +
 hw/i386/kvm/xen_gnttab.c                      |  320 +++++++-
 hw/i386/kvm/xen_gnttab.h                      |    1 +
 hw/i386/kvm/xen_xenstore.c                    |   13 +-
 hw/i386/pc_piix.c                             |   17 +
 hw/i386/xen/xen-hvm.c                         |   45 +-
 hw/i386/xen/xen-mapcache.c                    |    2 +-
 hw/i386/xen/xen_platform.c                    |    7 +-
 hw/net/xen_nic.c                              |   27 +-
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
 softmmu/globals.c                             |    4 +
 target/i386/kvm/xen-emu.c                     |    5 +
 56 files changed, 1651 insertions(+), 4286 deletions(-)




