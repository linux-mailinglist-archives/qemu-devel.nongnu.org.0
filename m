Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EA965304F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 12:34:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7xMc-0003wV-Tu; Wed, 21 Dec 2022 06:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7xMa-0003tA-6S
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:34:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7xMY-0004bL-8n
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671622457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ijK/G9JNdo/S3AHHjMXkeChO+nFe3qm3IF5Mm81hPdw=;
 b=T3UIcCsFqIQTjM8r8YnDBbvjJ8dlOOljHdFV5D2NzC73Cmzmtk0BLvCLg3tMkmbw+URayC
 uD047XE9sy1JIXenis9L/HOGPMmJKfuiUoh4eqLrARAfvfyH6CCqzJf7TGwukx865jGMHS
 /djxH87oxtnx440uJZN/q09thXkbcSQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-p1gOo8pRNyO-JvjRhm2HWQ-1; Wed, 21 Dec 2022 06:34:16 -0500
X-MC-Unique: p1gOo8pRNyO-JvjRhm2HWQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 m8-20020ac807c8000000b003a7f82f0da7so6836057qth.11
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 03:34:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ijK/G9JNdo/S3AHHjMXkeChO+nFe3qm3IF5Mm81hPdw=;
 b=n8KXk4PWsgVd0UTURZtOQYZp6zbNp03mdSj7ki43q94e5omVJLrFZ3J5cFwjpbS7wD
 m8ZW9GctInB3lE+8vDO+ZctwBkRug0faH68atcjv+8n44fbvSHE8TF9ilRK22brUCktr
 iAp8YNaT2TBW5JEJZ6BCxAzA0c4uk63lmiR951OJwk+V69PDsrjaTb5BSszFfD9QwcZN
 fqq9l33CGoWFA+RcfejZfwSVqGrDHyZtDup3Zo0USth/CkxTS6pyHtn1u08ze9uj77OM
 tNcMEqyEak2sdJ+qUkaxgtFxGF2bwiJFb23Ja7nhMWQKePHJKuDQSgqgng7JKgX7WE05
 YIqg==
X-Gm-Message-State: AFqh2kqtzhOSyGqywRod3PVV+sLYqq8X2Z647l/NPt7NyRtz0TSt96Jq
 IlvzZvxDOWoHOAptxVE3bgDrt553YTll0xATQUyREDIMZK3j3/aBOp/Stzh4pCg6j8O7p/PPqEQ
 5xa1thdUcirT1avs=
X-Received: by 2002:a05:622a:1f15:b0:3a8:12eb:6834 with SMTP id
 ca21-20020a05622a1f1500b003a812eb6834mr1569649qtb.38.1671622455486; 
 Wed, 21 Dec 2022 03:34:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsuMArT3BHgLPr6oMx/PKFixbtlETXGnCil2YZ90fCElZ2Fy4pu1DaCcUJBQ6Y3xBdA8dpXog==
X-Received: by 2002:a05:622a:1f15:b0:3a8:12eb:6834 with SMTP id
 ca21-20020a05622a1f1500b003a812eb6834mr1569628qtb.38.1671622455183; 
 Wed, 21 Dec 2022 03:34:15 -0800 (PST)
Received: from redhat.com ([37.19.199.117]) by smtp.gmail.com with ESMTPSA id
 h26-20020ac8745a000000b00399fe4aac3esm9098917qtr.50.2022.12.21.03.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 03:34:14 -0800 (PST)
Date: Wed, 21 Dec 2022 06:34:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 ben.widawsky@intel.com, jonathan.cameron@huawei.com, philmd@linaro.org
Subject: Re: [PATCH 0/5] include/hw/pci include/hw/cxl: Clean up includes
Message-ID: <20221221063353-mutt-send-email-mst@kernel.org>
References: <20221209134802.3642942-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209134802.3642942-1-armbru@redhat.com>
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

On Fri, Dec 09, 2022 at 02:47:57PM +0100, Markus Armbruster wrote:
> Back in 2016, we discussed[1] rules for headers, and these were
> generally liked:
> 
> 1. Have a carefully curated header that's included everywhere first.  We
>    got that already thanks to Peter: osdep.h.
> 
> 2. Headers should normally include everything they need beyond osdep.h.
>    If exceptions are needed for some reason, they must be documented in
>    the header.  If all that's needed from a header is typedefs, put
>    those into qemu/typedefs.h instead of including the header.
> 
> 3. Cyclic inclusion is forbidden.

Looks like this breaks fuzzer build:

https://gitlab.com/mstredhat/qemu/-/jobs/3506121308



> After this series, include/hw/pci and include/hw/cxl conform to these
> rules.
> 
> It is based on
> 
>     [PATCH 0/3] block: Clean up includes
>     [PATCH 0/4] coroutine: Clean up includes
> 
> [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
> 
> Based-on: <20221208143939.2775453-1-armbru@redhat.com>
> 
> Markus Armbruster (5):
>   include/hw/pci: Clean up superfluous inclusion of pci*/*.h cxl/*.h
>   include/hw/cxl: Include hw/cxl/*.h where needed
>   include/hw/pci: Clean up a few things checkpatch.pl would flag
>   include/hw/pci: Split pci_device.h off pci.h
>   include/hw/pci: Include hw/pci/pci.h where needed
> 
>  hw/alpha/alpha_sys.h              |   1 -
>  hw/display/ati_int.h              |   2 +-
>  hw/display/qxl.h                  |   3 +-
>  hw/ide/ahci_internal.h            |   2 +-
>  hw/net/vmxnet3_defs.h             |   2 +-
>  hw/nvme/nvme.h                    |   2 +-
>  hw/rdma/rdma_utils.h              |   1 -
>  hw/rdma/vmw/pvrdma.h              |   2 +-
>  hw/scsi/mptsas.h                  |   2 +-
>  hw/usb/hcd-ehci.h                 |   3 +-
>  hw/usb/hcd-uhci.h                 |   2 +-
>  hw/usb/hcd-xhci-pci.h             |   1 +
>  hw/vfio/pci.h                     |   2 +-
>  hw/xen/xen_pt.h                   |   1 -
>  include/hw/acpi/piix4.h           |   2 +-
>  include/hw/arm/allwinner-a10.h    |   1 +
>  include/hw/cxl/cxl.h              |   1 -
>  include/hw/cxl/cxl_cdat.h         |   1 +
>  include/hw/cxl/cxl_component.h    |   1 +
>  include/hw/cxl/cxl_device.h       |   2 +
>  include/hw/cxl/cxl_pci.h          |   2 -
>  include/hw/i386/ich9.h            |   4 -
>  include/hw/i386/x86-iommu.h       |   1 -
>  include/hw/ide/pci.h              |   2 +-
>  include/hw/isa/vt82c686.h         |   1 -
>  include/hw/misc/macio/macio.h     |   2 +-
>  include/hw/pci-host/designware.h  |   3 -
>  include/hw/pci-host/gpex.h        |   2 +-
>  include/hw/pci-host/i440fx.h      |   2 +-
>  include/hw/pci-host/ls7a.h        |   2 -
>  include/hw/pci-host/pnv_phb3.h    |   2 -
>  include/hw/pci-host/pnv_phb4.h    |   3 +-
>  include/hw/pci-host/q35.h         |   2 +-
>  include/hw/pci-host/sabre.h       |   2 +-
>  include/hw/pci-host/xilinx-pcie.h |   1 -
>  include/hw/pci/msi.h              |   2 +-
>  include/hw/pci/pci.h              | 352 -----------------------------
>  include/hw/pci/pci_bridge.h       |   2 +-
>  include/hw/pci/pci_device.h       | 361 ++++++++++++++++++++++++++++++
>  include/hw/pci/pcie.h             |   1 -
>  include/hw/pci/pcie_port.h        |   1 +
>  include/hw/pci/pcie_sriov.h       |   2 +
>  include/hw/pci/shpc.h             |   2 +-
>  include/hw/remote/iohub.h         |   2 +-
>  include/hw/remote/proxy.h         |   2 +-
>  include/hw/sd/sdhci.h             |   2 +-
>  include/hw/southbridge/piix.h     |   3 +-
>  include/hw/virtio/virtio-scsi.h   |   1 -
>  include/hw/xen/xen_common.h       |   2 +-
>  hw/acpi/erst.c                    |   2 +-
>  hw/alpha/pci.c                    |   1 +
>  hw/alpha/typhoon.c                |   2 +-
>  hw/audio/ac97.c                   |   2 +-
>  hw/audio/es1370.c                 |   2 +-
>  hw/audio/via-ac97.c               |   2 +-
>  hw/char/serial-pci-multi.c        |   2 +-
>  hw/char/serial-pci.c              |   2 +-
>  hw/core/qdev-properties-system.c  |   1 +
>  hw/display/bochs-display.c        |   2 +-
>  hw/display/cirrus_vga.c           |   2 +-
>  hw/display/sm501.c                |   2 +-
>  hw/display/vga-pci.c              |   2 +-
>  hw/display/vmware_vga.c           |   2 +-
>  hw/i386/acpi-build.c              |   2 +-
>  hw/i386/xen/xen_pvdevice.c        |   2 +-
>  hw/ipack/tpci200.c                |   2 +-
>  hw/ipmi/pci_ipmi_bt.c             |   2 +-
>  hw/ipmi/pci_ipmi_kcs.c            |   2 +-
>  hw/isa/i82378.c                   |   2 +-
>  hw/mips/gt64xxx_pci.c             |   2 +-
>  hw/misc/pci-testdev.c             |   2 +-
>  hw/misc/pvpanic-pci.c             |   2 +-
>  hw/net/can/can_kvaser_pci.c       |   2 +-
>  hw/net/can/can_mioe3680_pci.c     |   2 +-
>  hw/net/can/can_pcm3680_pci.c      |   2 +-
>  hw/net/can/ctucan_pci.c           |   2 +-
>  hw/net/e1000.c                    |   2 +-
>  hw/net/e1000x_common.c            |   2 +-
>  hw/net/eepro100.c                 |   2 +-
>  hw/net/ne2000-pci.c               |   2 +-
>  hw/net/net_tx_pkt.c               |   2 +-
>  hw/net/pcnet-pci.c                |   2 +-
>  hw/net/rocker/rocker.c            |   2 +-
>  hw/net/rocker/rocker_desc.c       |   2 +-
>  hw/net/rtl8139.c                  |   2 +-
>  hw/net/sungem.c                   |   2 +-
>  hw/net/sunhme.c                   |   2 +-
>  hw/net/tulip.c                    |   2 +-
>  hw/net/virtio-net.c               |   2 +-
>  hw/pci-bridge/i82801b11.c         |   2 +-
>  hw/pci-host/bonito.c              |   2 +-
>  hw/pci-host/dino.c                |   2 +-
>  hw/pci-host/grackle.c             |   2 +-
>  hw/pci-host/mv64361.c             |   2 +-
>  hw/pci-host/ppce500.c             |   2 +-
>  hw/pci-host/raven.c               |   2 +-
>  hw/pci-host/sh_pci.c              |   2 +-
>  hw/pci-host/uninorth.c            |   2 +-
>  hw/pci-host/versatile.c           |   2 +-
>  hw/pci/pcie_host.c                |   2 +-
>  hw/pci/pcie_sriov.c               |   2 +-
>  hw/pci/slotid_cap.c               |   2 +-
>  hw/ppc/ppc440_pcix.c              |   2 +-
>  hw/ppc/ppc4xx_pci.c               |   2 +-
>  hw/ppc/spapr_pci_vfio.c           |   1 +
>  hw/rdma/rdma_utils.c              |   1 +
>  hw/s390x/s390-pci-inst.c          |   1 +
>  hw/scsi/esp-pci.c                 |   2 +-
>  hw/scsi/lsi53c895a.c              |   2 +-
>  hw/scsi/virtio-scsi.c             |   1 +
>  hw/smbios/smbios.c                |   1 +
>  hw/usb/hcd-ohci-pci.c             |   2 +-
>  hw/watchdog/wdt_i6300esb.c        |   2 +-
>  ui/util.c                         |   2 +-
>  114 files changed, 461 insertions(+), 462 deletions(-)
>  create mode 100644 include/hw/pci/pci_device.h
> 
> -- 
> 2.37.3


