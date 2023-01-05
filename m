Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28AC65F13E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:32:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTA4-000168-6c; Thu, 05 Jan 2023 11:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDTA1-00013a-Ij
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDT9z-0007v5-34
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672936326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XutEzgDbV99Oavj8jRhu70UMh+kY++dQGftzujzIrF4=;
 b=AkWJRpPaBtk1KKH8FA3fiB5G3PCGJROV4d7eLw3I0jKuVtVXn4P/9bFUCuYrOE6ezU9zu9
 Qcv0v5kzUcdg1y4N7GzI/xkprwE7Rxl/ZKKTwG+RvWcAIFSEGHmN8cn4LQsV82L72KJbOn
 DSBGHzzE6/0zcjB0EsOJXYjwLnpC5fg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-ARw4cOJlM0yxsEl043xQmw-1; Thu, 05 Jan 2023 11:32:03 -0500
X-MC-Unique: ARw4cOJlM0yxsEl043xQmw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso23932169edd.14
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XutEzgDbV99Oavj8jRhu70UMh+kY++dQGftzujzIrF4=;
 b=DTQshL+cqkgSRS11E2YXy9X+4e1ORgE2sx48THht9OI2Wt3DditjdRq+wSCx7fNPb9
 fFUkMNSmE9lN4OZNJjeh1o6hE2L+ALsuBKSqKtrFtX88hV9cfVF7mfrKxMQtcYF1YYj6
 guJZvFlcksTVdgpFU6e4SUvxBSZImQvGTatO0PB0yeN3sk1XbpdELqTN8j2lxyWuCXEs
 1Lk4KknKwj6lA/RavKZ7aT2OedXHFxI0Tr3QwDjLRSJ1uGImKALwe1VTHW935AqPfM+P
 z8K031YO2svCX72SexL3VyK/VW90y1M7dxbLp2iR8rIDp1h8o6xcl2uKRDq5bwBfvqYk
 LfQg==
X-Gm-Message-State: AFqh2kqwM0kKQqAcL5ir0rPTDKwpx2IUPVEMMLmqeVq31T1yPlhNJ9Ii
 X7ibLsPddYEavBtsWmIDD3yOkvTF8X3eNeFYiANsZvyU75S5Ew0OnEeWm1cYcvir3GyttDvUdY7
 6aCg0kdEx+VGGB3rByb2VnQi0RoyWep41mzcwzkI3mSvzzOlcp1zjUhmMYTTg
X-Received: by 2002:a17:907:6e16:b0:7c1:b64:e290 with SMTP id
 sd22-20020a1709076e1600b007c10b64e290mr79825904ejc.45.1672936320161; 
 Thu, 05 Jan 2023 08:32:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsevJCrP7YPRbOazK6IDJVeNxWsaUe4vZXF/vRg2+nF6DjpBSSOVrrSfO72lwOgzG6+4Z2MCw==
X-Received: by 2002:a17:907:6e16:b0:7c1:b64:e290 with SMTP id
 sd22-20020a1709076e1600b007c10b64e290mr79825878ejc.45.1672936319748; 
 Thu, 05 Jan 2023 08:31:59 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b007c08439161dsm16557506ejo.50.2023.01.05.08.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:31:59 -0800 (PST)
Date: Thu, 5 Jan 2023 11:31:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/51] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20230105113111-mutt-send-email-mst@kernel.org>
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105045619-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105045619-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Jan 05, 2023 at 04:56:39AM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 05, 2023 at 04:14:20AM -0500, Michael S. Tsirkin wrote:
> > The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
> > 
> >   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > 
> > for you to fetch changes up to 6529cb46fa76bb4b4f217d6fcc68b61b543062c4:
> 
> 7c77271205339d3b161bdf925f5ead799b582e47 now - I dropped one patch
> as v2 is forthcoming.

And now it's c46dcec9f699508e811cb6a140250d07486b0e41 as I replaced that
patch with it's v2. Sorry about the back and forth, but it seemed
important :(

> 
> >   vhost-scsi: fix memleak of vsc->inflight (2023-01-05 04:07:39 -0500)
> > 
> > ----------------------------------------------------------------
> > virtio,pc,pci: features, cleanups, fixes
> > 
> > mostly vhost-vdpa:
> >     guest announce feature emulation when using shadow virtqueue
> >     support for configure interrupt
> >     startup speed ups
> > 
> > an acpi change to only generate cluster node in PPTT when specified for arm
> > 
> > misc fixes, cleanups
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ----------------------------------------------------------------
> > 
> > Note: linux-user build is failing for me on master, I just
> > disabled it for now as nothing I'm doing should affect linux-user.
> > Didn't debug yet.
> > 
> > 
> > Bernhard Beschow (7):
> >       hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9
> >       hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9
> >       hw/acpi/Kconfig: Do not needlessly build TYPE_PIIX4_PM in non-PC/Malta machines
> >       hw/acpi/Kconfig: Add missing dependencies to ACPI_PIIX4
> >       hw/isa/Kconfig: Add missing dependency to VT82C686
> >       i386, mips: Resolve redundant ACPI and APM dependencies
> >       hw/ppc/Kconfig: Remove unused dependencies from PEGASOS2
> > 
> > Cindy Lu (10):
> >       virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
> >       virtio-pci: decouple notifier from interrupt process
> >       virtio-pci: decouple the single vector from the interrupt process
> >       vhost: introduce new VhostOps vhost_set_config_call
> >       vhost-vdpa: add support for config interrupt
> >       virtio: add support for configure interrupt
> >       vhost: add support for configure interrupt
> >       virtio-net: add support for configure interrupt
> >       virtio-mmio: add support for configure interrupt
> >       virtio-pci: add support for configure interrupt
> > 
> > Dongli Zhang (1):
> >       vhost-scsi: fix memleak of vsc->inflight
> > 
> > Eugenio Pérez (4):
> >       virtio_net: Modify virtio_net_get_config to early return
> >       virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device model has it
> >       vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in vhost_vdpa_net_handle_ctrl_avail
> >       vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE in vhost-vdpa
> > 
> > Hyman Huang (3):
> >       vhost-user: Refactor vhost acked features saving
> >       vhost-user: Refactor the chr_closed_bh
> >       vhost-user: Fix the virtio features negotiation flaw
> > 
> > Laszlo Ersek (1):
> >       acpi: cpuhp: fix guest-visible maximum access size to the legacy reg block
> > 
> > Longpeng (Mike) (5):
> >       vdpa-dev: get iova range explicitly
> >       vdpa: harden the error path if get_iova_range failed
> >       vhost: simplify vhost_dev_enable_notifiers
> >       vhost: configure all host notifiers in a single MR transaction
> >       vdpa: commit all host notifier MRs in a single MR transaction
> > 
> > Markus Armbruster (11):
> >       include/hw/pci: Break inclusion loop pci_bridge.h and cxl.h
> >       include/hw/cxl: Move typedef PXBDev to cxl.h, and put it to use
> >       include/hw/cxl: Include hw/cxl/*.h where needed
> >       include/hw/pci: Clean up a few things checkpatch.pl would flag
> >       include/hw/pci: Split pci_device.h off pci.h
> >       include/hw/pci: Include hw/pci/pci.h where needed
> >       include/hw/cxl: Break inclusion loop cxl_pci.h and cxl_cdat_h
> >       include/hw/virtio: Break inclusion loop
> >       include: Include headers where needed
> >       include: Don't include qemu/osdep.h
> >       docs/devel: Rules on #include in headers
> > 
> > Philippe Mathieu-Daudé (2):
> >       hw/virtio: Rename virtio_device_find() -> qmp_find_virtio_device()
> >       hw/virtio: Extract QMP QOM-specific functions to virtio-qmp.c
> > 
> > Yicong Yang (6):
> >       tests: virt: Allow changes to PPTT test table
> >       hw/acpi/aml-build: Only generate cluster node in PPTT when specified
> >       tests: virt: Update expected ACPI tables for virt test
> >       tests: acpi: Add and whitelist *.topology blobs
> >       tests: acpi: aarch64: Add topology test for aarch64
> >       tests: acpi: aarch64: Add *.topology tables
> > 
> > leixiang (1):
> >       virtio-pci: fix proxy->vector_irqfd leak in virtio_pci_set_guest_notifiers
> > 
> >  configs/devices/mips-softmmu/common.mak     |   3 -
> >  bsd-user/qemu.h                             |   1 -
> >  crypto/block-luks-priv.h                    |   1 -
> >  hw/alpha/alpha_sys.h                        |   1 -
> >  hw/display/ati_int.h                        |   2 +-
> >  hw/display/qxl.h                            |   3 +-
> >  hw/ide/ahci_internal.h                      |   2 +-
> >  hw/net/vmxnet3_defs.h                       |   2 +-
> >  hw/nvme/nvme.h                              |   2 +-
> >  hw/rdma/rdma_utils.h                        |   1 -
> >  hw/rdma/vmw/pvrdma.h                        |   2 +-
> >  hw/scsi/mptsas.h                            |   2 +-
> >  hw/usb/hcd-ehci.h                           |   3 +-
> >  hw/usb/hcd-uhci.h                           |   2 +-
> >  hw/usb/hcd-xhci-pci.h                       |   1 +
> >  hw/vfio/pci.h                               |   2 +-
> >  hw/virtio/virtio-qmp.h                      |  10 +
> >  hw/xen/xen_pt.h                             |   1 -
> >  include/exec/plugin-gen.h                   |   1 +
> >  include/hw/acpi/erst.h                      |   3 +
> >  include/hw/acpi/piix4.h                     |   2 +-
> >  include/hw/arm/allwinner-a10.h              |   1 +
> >  include/hw/boards.h                         |   3 +
> >  include/hw/char/cmsdk-apb-uart.h            |   1 +
> >  include/hw/char/goldfish_tty.h              |   1 +
> >  include/hw/char/xilinx_uartlite.h           |   1 +
> >  include/hw/cris/etraxfs.h                   |   1 +
> >  include/hw/cxl/cxl.h                        |   5 +-
> >  include/hw/cxl/cxl_cdat.h                   |   1 +
> >  include/hw/cxl/cxl_component.h              |   1 +
> >  include/hw/cxl/cxl_device.h                 |   2 +
> >  include/hw/cxl/cxl_host.h                   |   1 -
> >  include/hw/cxl/cxl_pci.h                    |   3 -
> >  include/hw/display/macfb.h                  |   3 +-
> >  include/hw/dma/sifive_pdma.h                |   2 +
> >  include/hw/i386/ich9.h                      |   4 -
> >  include/hw/i386/ioapic_internal.h           |   1 +
> >  include/hw/i386/sgx-epc.h                   |   1 +
> >  include/hw/i386/x86-iommu.h                 |   1 -
> >  include/hw/ide/pci.h                        |   2 +-
> >  include/hw/input/pl050.h                    |   1 -
> >  include/hw/intc/goldfish_pic.h              |   2 +
> >  include/hw/intc/loongarch_pch_msi.h         |   2 +
> >  include/hw/intc/loongarch_pch_pic.h         |   2 +
> >  include/hw/intc/nios2_vic.h                 |   2 +
> >  include/hw/isa/vt82c686.h                   |   1 -
> >  include/hw/misc/macio/macio.h               |   2 +-
> >  include/hw/misc/mchp_pfsoc_dmc.h            |   2 +
> >  include/hw/misc/mchp_pfsoc_ioscb.h          |   2 +
> >  include/hw/misc/mchp_pfsoc_sysreg.h         |   2 +
> >  include/hw/misc/pvpanic.h                   |   1 +
> >  include/hw/misc/sifive_e_prci.h             |   3 +-
> >  include/hw/misc/sifive_u_otp.h              |   3 +-
> >  include/hw/misc/sifive_u_prci.h             |   3 +-
> >  include/hw/misc/virt_ctrl.h                 |   2 +
> >  include/hw/misc/xlnx-versal-pmc-iou-slcr.h  |   1 +
> >  include/hw/net/lasi_82596.h                 |   2 +-
> >  include/hw/net/xlnx-zynqmp-can.h            |   1 +
> >  include/hw/pci-host/designware.h            |   3 -
> >  include/hw/pci-host/gpex.h                  |   2 +-
> >  include/hw/pci-host/i440fx.h                |   2 +-
> >  include/hw/pci-host/ls7a.h                  |   2 -
> >  include/hw/pci-host/pnv_phb3.h              |   2 -
> >  include/hw/pci-host/pnv_phb4.h              |   3 +-
> >  include/hw/pci-host/q35.h                   |   2 +-
> >  include/hw/pci-host/sabre.h                 |   2 +-
> >  include/hw/pci-host/xilinx-pcie.h           |   1 -
> >  include/hw/pci/msi.h                        |   2 +-
> >  include/hw/pci/pci.h                        | 341 ---------------------------
> >  include/hw/pci/pci_bridge.h                 |   3 +-
> >  include/hw/pci/pci_device.h                 | 350 ++++++++++++++++++++++++++++
> >  include/hw/pci/pcie.h                       |   1 -
> >  include/hw/pci/pcie_port.h                  |   1 +
> >  include/hw/pci/pcie_sriov.h                 |   2 +
> >  include/hw/pci/shpc.h                       |   2 +-
> >  include/hw/ppc/pnv_psi.h                    |   2 +-
> >  include/hw/remote/iohub.h                   |   2 +-
> >  include/hw/remote/proxy.h                   |   2 +-
> >  include/hw/riscv/boot_opensbi.h             |   2 +
> >  include/hw/riscv/microchip_pfsoc.h          |   3 +
> >  include/hw/riscv/numa.h                     |   1 +
> >  include/hw/riscv/sifive_u.h                 |   2 +
> >  include/hw/riscv/spike.h                    |   2 +-
> >  include/hw/riscv/virt.h                     |   2 +-
> >  include/hw/sd/sdhci.h                       |   2 +-
> >  include/hw/southbridge/piix.h               |   3 +-
> >  include/hw/ssi/sifive_spi.h                 |   3 +
> >  include/hw/timer/sse-timer.h                |   1 +
> >  include/hw/tricore/triboard.h               |   1 -
> >  include/hw/usb/hcd-dwc3.h                   |   1 +
> >  include/hw/usb/hcd-musb.h                   |   2 +
> >  include/hw/usb/xlnx-usb-subsystem.h         |   2 +
> >  include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |   3 +
> >  include/hw/virtio/vhost-backend.h           |   3 +
> >  include/hw/virtio/vhost-vdpa.h              |   2 +
> >  include/hw/virtio/vhost.h                   |   4 +
> >  include/hw/virtio/virtio-mmio.h             |   2 +-
> >  include/hw/virtio/virtio-pci.h              |   4 +-
> >  include/hw/virtio/virtio-scsi.h             |   1 -
> >  include/hw/virtio/virtio.h                  |   8 +-
> >  include/hw/xen/xen_common.h                 |   2 +-
> >  include/net/vhost-user.h                    |   1 +
> >  include/net/vhost_net.h                     |   4 +
> >  include/qemu/plugin-memory.h                |   3 +
> >  include/qemu/userfaultfd.h                  |   1 -
> >  include/sysemu/dirtyrate.h                  |   2 +
> >  include/sysemu/dump.h                       |   1 +
> >  include/user/syscall-trace.h                |   1 +
> >  net/vmnet_int.h                             |   1 -
> >  qga/cutils.h                                |   1 -
> >  target/hexagon/hex_arch_types.h             |   1 -
> >  target/hexagon/mmvec/macros.h               |   1 -
> >  target/riscv/pmu.h                          |   1 -
> >  hw/acpi/aml-build.c                         |   2 +-
> >  hw/acpi/cpu_hotplug.c                       |   3 +
> >  hw/acpi/erst.c                              |   2 +-
> >  hw/alpha/pci.c                              |   1 +
> >  hw/alpha/typhoon.c                          |   2 +-
> >  hw/audio/ac97.c                             |   2 +-
> >  hw/audio/es1370.c                           |   2 +-
> >  hw/audio/via-ac97.c                         |   2 +-
> >  hw/char/serial-pci-multi.c                  |   2 +-
> >  hw/char/serial-pci.c                        |   2 +-
> >  hw/core/machine-smp.c                       |   2 +
> >  hw/core/qdev-properties-system.c            |   1 +
> >  hw/display/bochs-display.c                  |   2 +-
> >  hw/display/cirrus_vga.c                     |   2 +-
> >  hw/display/sm501.c                          |   2 +-
> >  hw/display/vga-pci.c                        |   2 +-
> >  hw/display/vhost-user-gpu.c                 |  18 ++
> >  hw/display/vmware_vga.c                     |   2 +-
> >  hw/i386/acpi-build.c                        |   2 +-
> >  hw/i386/xen/xen_pvdevice.c                  |   2 +-
> >  hw/ipack/tpci200.c                          |   2 +-
> >  hw/ipmi/pci_ipmi_bt.c                       |   2 +-
> >  hw/ipmi/pci_ipmi_kcs.c                      |   2 +-
> >  hw/isa/i82378.c                             |   2 +-
> >  hw/mips/gt64xxx_pci.c                       |   2 +-
> >  hw/misc/pci-testdev.c                       |   2 +-
> >  hw/misc/pvpanic-pci.c                       |   2 +-
> >  hw/net/can/can_kvaser_pci.c                 |   2 +-
> >  hw/net/can/can_mioe3680_pci.c               |   2 +-
> >  hw/net/can/can_pcm3680_pci.c                |   2 +-
> >  hw/net/can/ctucan_pci.c                     |   2 +-
> >  hw/net/e1000.c                              |   2 +-
> >  hw/net/e1000x_common.c                      |   2 +-
> >  hw/net/eepro100.c                           |   2 +-
> >  hw/net/ne2000-pci.c                         |   2 +-
> >  hw/net/net_tx_pkt.c                         |   2 +-
> >  hw/net/pcnet-pci.c                          |   2 +-
> >  hw/net/rocker/rocker.c                      |   2 +-
> >  hw/net/rocker/rocker_desc.c                 |   2 +-
> >  hw/net/rtl8139.c                            |   2 +-
> >  hw/net/sungem.c                             |   2 +-
> >  hw/net/sunhme.c                             |   2 +-
> >  hw/net/tulip.c                              |   2 +-
> >  hw/net/vhost_net-stub.c                     |  14 ++
> >  hw/net/vhost_net.c                          |  18 ++
> >  hw/net/virtio-net.c                         |  60 +++--
> >  hw/pci-bridge/i82801b11.c                   |   2 +-
> >  hw/pci-bridge/pci_expander_bridge.c         |   1 -
> >  hw/pci-host/bonito.c                        |   2 +-
> >  hw/pci-host/dino.c                          |   2 +-
> >  hw/pci-host/grackle.c                       |   2 +-
> >  hw/pci-host/mv64361.c                       |   2 +-
> >  hw/pci-host/ppce500.c                       |   2 +-
> >  hw/pci-host/raven.c                         |   2 +-
> >  hw/pci-host/sh_pci.c                        |   2 +-
> >  hw/pci-host/uninorth.c                      |   2 +-
> >  hw/pci-host/versatile.c                     |   2 +-
> >  hw/pci/pci-hmp-cmds.c                       |   1 +
> >  hw/pci/pcie_host.c                          |   2 +-
> >  hw/pci/pcie_sriov.c                         |   2 +-
> >  hw/pci/slotid_cap.c                         |   2 +-
> >  hw/ppc/ppc440_pcix.c                        |   2 +-
> >  hw/ppc/ppc4xx_pci.c                         |   2 +-
> >  hw/ppc/spapr_pci_vfio.c                     |   1 +
> >  hw/rdma/rdma_utils.c                        |   1 +
> >  hw/s390x/s390-pci-inst.c                    |   1 +
> >  hw/scsi/esp-pci.c                           |   2 +-
> >  hw/scsi/lsi53c895a.c                        |   2 +-
> >  hw/scsi/vhost-scsi-common.c                 |   1 +
> >  hw/scsi/virtio-scsi.c                       |   1 +
> >  hw/smbios/smbios.c                          |   1 +
> >  hw/usb/hcd-ohci-pci.c                       |   2 +-
> >  hw/virtio/vdpa-dev.c                        |   9 +
> >  hw/virtio/vhost-user-fs.c                   |  18 ++
> >  hw/virtio/vhost-user-gpio.c                 |  10 +
> >  hw/virtio/vhost-vdpa.c                      |  40 +++-
> >  hw/virtio/vhost-vsock-common.c              |  18 ++
> >  hw/virtio/vhost.c                           | 122 ++++++++--
> >  hw/virtio/virtio-crypto.c                   |  18 ++
> >  hw/virtio/virtio-mmio.c                     |  27 +++
> >  hw/virtio/virtio-pci.c                      | 305 ++++++++++++++++--------
> >  hw/virtio/virtio-qmp.c                      | 192 ++++++++++++++-
> >  hw/virtio/virtio.c                          | 225 +++---------------
> >  hw/watchdog/wdt_i6300esb.c                  |   2 +-
> >  net/vhost-user.c                            |  27 ++-
> >  net/vhost-vdpa.c                            |  32 +--
> >  qga/cutils.c                                |   3 +-
> >  tests/qtest/bios-tables-test.c              |  19 ++
> >  tests/qtest/fuzz/generic_fuzz.c             |   1 +
> >  ui/util.c                                   |   2 +-
> >  docs/devel/style.rst                        |   7 +
> >  hw/acpi/Kconfig                             |   9 +-
> >  hw/acpi/meson.build                         |   2 +-
> >  hw/i2c/meson.build                          |   2 +-
> >  hw/i386/Kconfig                             |   3 +-
> >  hw/isa/Kconfig                              |   4 +-
> >  hw/ppc/Kconfig                              |   2 -
> >  hw/virtio/trace-events                      |   1 +
> >  qemu-options.hx                             |   3 +
> >  tests/data/acpi/virt/APIC.topology          | Bin 0 -> 732 bytes
> >  tests/data/acpi/virt/DSDT.topology          | Bin 0 -> 5398 bytes
> >  tests/data/acpi/virt/PPTT                   | Bin 96 -> 76 bytes
> >  tests/data/acpi/virt/PPTT.acpihmatvirt      | Bin 196 -> 156 bytes
> >  tests/data/acpi/virt/PPTT.topology          | Bin 0 -> 336 bytes
> >  217 files changed, 1418 insertions(+), 839 deletions(-)
> >  create mode 100644 include/hw/pci/pci_device.h
> >  create mode 100644 tests/data/acpi/virt/APIC.topology
> >  create mode 100644 tests/data/acpi/virt/DSDT.topology
> >  create mode 100644 tests/data/acpi/virt/PPTT.topology
> > 


