Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E306482EF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:50:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3dkC-0006kK-16; Fri, 09 Dec 2022 08:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3dk6-0006jJ-AG
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:48:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3dk1-0004JR-HE
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670593690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D8vHGCoBFJMQ/yPMo3zxcuSXNKPw4p0XruZyTdPuF/8=;
 b=Lv/uiArUfpWi8GBr4+oiSPUAeFqdSCn5nTQB+fsmEXJjMcuvV2W1EKDIPt1+3eFw3vHnj0
 PMhVX6Ho7QODyOu/WP/wBSsio1bCujMOqC/Jj+MePQ/ZbjU4KHpDXwGyngp7btldOllmXd
 YnZwAs9zbjiciAKjpj53peAHjKaEw/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-jZ1Uk12mMNOkYVYpuHr_iQ-1; Fri, 09 Dec 2022 08:48:06 -0500
X-MC-Unique: jZ1Uk12mMNOkYVYpuHr_iQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C8E4803B38;
 Fri,  9 Dec 2022 13:48:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7E5A492B04;
 Fri,  9 Dec 2022 13:48:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D638421E6921; Fri,  9 Dec 2022 14:48:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, philmd@linaro.org
Subject: [PATCH 0/5] include/hw/pci include/hw/cxl: Clean up includes
Date: Fri,  9 Dec 2022 14:47:57 +0100
Message-Id: <20221209134802.3642942-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Back in 2016, we discussed[1] rules for headers, and these were
generally liked:

1. Have a carefully curated header that's included everywhere first.  We
   got that already thanks to Peter: osdep.h.

2. Headers should normally include everything they need beyond osdep.h.
   If exceptions are needed for some reason, they must be documented in
   the header.  If all that's needed from a header is typedefs, put
   those into qemu/typedefs.h instead of including the header.

3. Cyclic inclusion is forbidden.

After this series, include/hw/pci and include/hw/cxl conform to these
rules.

It is based on

    [PATCH 0/3] block: Clean up includes
    [PATCH 0/4] coroutine: Clean up includes

[1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html

Based-on: <20221208143939.2775453-1-armbru@redhat.com>

Markus Armbruster (5):
  include/hw/pci: Clean up superfluous inclusion of pci*/*.h cxl/*.h
  include/hw/cxl: Include hw/cxl/*.h where needed
  include/hw/pci: Clean up a few things checkpatch.pl would flag
  include/hw/pci: Split pci_device.h off pci.h
  include/hw/pci: Include hw/pci/pci.h where needed

 hw/alpha/alpha_sys.h              |   1 -
 hw/display/ati_int.h              |   2 +-
 hw/display/qxl.h                  |   3 +-
 hw/ide/ahci_internal.h            |   2 +-
 hw/net/vmxnet3_defs.h             |   2 +-
 hw/nvme/nvme.h                    |   2 +-
 hw/rdma/rdma_utils.h              |   1 -
 hw/rdma/vmw/pvrdma.h              |   2 +-
 hw/scsi/mptsas.h                  |   2 +-
 hw/usb/hcd-ehci.h                 |   3 +-
 hw/usb/hcd-uhci.h                 |   2 +-
 hw/usb/hcd-xhci-pci.h             |   1 +
 hw/vfio/pci.h                     |   2 +-
 hw/xen/xen_pt.h                   |   1 -
 include/hw/acpi/piix4.h           |   2 +-
 include/hw/arm/allwinner-a10.h    |   1 +
 include/hw/cxl/cxl.h              |   1 -
 include/hw/cxl/cxl_cdat.h         |   1 +
 include/hw/cxl/cxl_component.h    |   1 +
 include/hw/cxl/cxl_device.h       |   2 +
 include/hw/cxl/cxl_pci.h          |   2 -
 include/hw/i386/ich9.h            |   4 -
 include/hw/i386/x86-iommu.h       |   1 -
 include/hw/ide/pci.h              |   2 +-
 include/hw/isa/vt82c686.h         |   1 -
 include/hw/misc/macio/macio.h     |   2 +-
 include/hw/pci-host/designware.h  |   3 -
 include/hw/pci-host/gpex.h        |   2 +-
 include/hw/pci-host/i440fx.h      |   2 +-
 include/hw/pci-host/ls7a.h        |   2 -
 include/hw/pci-host/pnv_phb3.h    |   2 -
 include/hw/pci-host/pnv_phb4.h    |   3 +-
 include/hw/pci-host/q35.h         |   2 +-
 include/hw/pci-host/sabre.h       |   2 +-
 include/hw/pci-host/xilinx-pcie.h |   1 -
 include/hw/pci/msi.h              |   2 +-
 include/hw/pci/pci.h              | 352 -----------------------------
 include/hw/pci/pci_bridge.h       |   2 +-
 include/hw/pci/pci_device.h       | 361 ++++++++++++++++++++++++++++++
 include/hw/pci/pcie.h             |   1 -
 include/hw/pci/pcie_port.h        |   1 +
 include/hw/pci/pcie_sriov.h       |   2 +
 include/hw/pci/shpc.h             |   2 +-
 include/hw/remote/iohub.h         |   2 +-
 include/hw/remote/proxy.h         |   2 +-
 include/hw/sd/sdhci.h             |   2 +-
 include/hw/southbridge/piix.h     |   3 +-
 include/hw/virtio/virtio-scsi.h   |   1 -
 include/hw/xen/xen_common.h       |   2 +-
 hw/acpi/erst.c                    |   2 +-
 hw/alpha/pci.c                    |   1 +
 hw/alpha/typhoon.c                |   2 +-
 hw/audio/ac97.c                   |   2 +-
 hw/audio/es1370.c                 |   2 +-
 hw/audio/via-ac97.c               |   2 +-
 hw/char/serial-pci-multi.c        |   2 +-
 hw/char/serial-pci.c              |   2 +-
 hw/core/qdev-properties-system.c  |   1 +
 hw/display/bochs-display.c        |   2 +-
 hw/display/cirrus_vga.c           |   2 +-
 hw/display/sm501.c                |   2 +-
 hw/display/vga-pci.c              |   2 +-
 hw/display/vmware_vga.c           |   2 +-
 hw/i386/acpi-build.c              |   2 +-
 hw/i386/xen/xen_pvdevice.c        |   2 +-
 hw/ipack/tpci200.c                |   2 +-
 hw/ipmi/pci_ipmi_bt.c             |   2 +-
 hw/ipmi/pci_ipmi_kcs.c            |   2 +-
 hw/isa/i82378.c                   |   2 +-
 hw/mips/gt64xxx_pci.c             |   2 +-
 hw/misc/pci-testdev.c             |   2 +-
 hw/misc/pvpanic-pci.c             |   2 +-
 hw/net/can/can_kvaser_pci.c       |   2 +-
 hw/net/can/can_mioe3680_pci.c     |   2 +-
 hw/net/can/can_pcm3680_pci.c      |   2 +-
 hw/net/can/ctucan_pci.c           |   2 +-
 hw/net/e1000.c                    |   2 +-
 hw/net/e1000x_common.c            |   2 +-
 hw/net/eepro100.c                 |   2 +-
 hw/net/ne2000-pci.c               |   2 +-
 hw/net/net_tx_pkt.c               |   2 +-
 hw/net/pcnet-pci.c                |   2 +-
 hw/net/rocker/rocker.c            |   2 +-
 hw/net/rocker/rocker_desc.c       |   2 +-
 hw/net/rtl8139.c                  |   2 +-
 hw/net/sungem.c                   |   2 +-
 hw/net/sunhme.c                   |   2 +-
 hw/net/tulip.c                    |   2 +-
 hw/net/virtio-net.c               |   2 +-
 hw/pci-bridge/i82801b11.c         |   2 +-
 hw/pci-host/bonito.c              |   2 +-
 hw/pci-host/dino.c                |   2 +-
 hw/pci-host/grackle.c             |   2 +-
 hw/pci-host/mv64361.c             |   2 +-
 hw/pci-host/ppce500.c             |   2 +-
 hw/pci-host/raven.c               |   2 +-
 hw/pci-host/sh_pci.c              |   2 +-
 hw/pci-host/uninorth.c            |   2 +-
 hw/pci-host/versatile.c           |   2 +-
 hw/pci/pcie_host.c                |   2 +-
 hw/pci/pcie_sriov.c               |   2 +-
 hw/pci/slotid_cap.c               |   2 +-
 hw/ppc/ppc440_pcix.c              |   2 +-
 hw/ppc/ppc4xx_pci.c               |   2 +-
 hw/ppc/spapr_pci_vfio.c           |   1 +
 hw/rdma/rdma_utils.c              |   1 +
 hw/s390x/s390-pci-inst.c          |   1 +
 hw/scsi/esp-pci.c                 |   2 +-
 hw/scsi/lsi53c895a.c              |   2 +-
 hw/scsi/virtio-scsi.c             |   1 +
 hw/smbios/smbios.c                |   1 +
 hw/usb/hcd-ohci-pci.c             |   2 +-
 hw/watchdog/wdt_i6300esb.c        |   2 +-
 ui/util.c                         |   2 +-
 114 files changed, 461 insertions(+), 462 deletions(-)
 create mode 100644 include/hw/pci/pci_device.h

-- 
2.37.3


