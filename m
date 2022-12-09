Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB1648736
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:04:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gnD-0002JG-5S; Fri, 09 Dec 2022 12:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p3gn8-0002I6-1e
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:04:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p3gn4-0005mL-Hk
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670605439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TxigfZtodMpecK7+Z3Yj0j4SLpVn2BANtBn7SJDzn3c=;
 b=cUZmOQImn11OqonTBbfth526euDFtljS0Py5RnkOZ0Hn1UhXRTxw0jT54zd1sNKC5lXMj0
 jL/8LubUr4rO1oc+SyjyOl21umPHDzqQ+KrVG526XiAnQgukWUPLOKFZ0oDqVwQNZLyvL3
 2IZYeGXT0ah3U2dZK6hC+lRK67BkBCk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-343-iYjWxPXOMxmxxqAXPx6hww-1; Fri, 09 Dec 2022 12:03:58 -0500
X-MC-Unique: iYjWxPXOMxmxxqAXPx6hww-1
Received: by mail-wm1-f71.google.com with SMTP id
 m38-20020a05600c3b2600b003d1fc5f1f80so139355wms.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TxigfZtodMpecK7+Z3Yj0j4SLpVn2BANtBn7SJDzn3c=;
 b=dz60GbVBnUmh3lgT8ht6EqPCyBTb9EymOzE64IepUWGBbv76RpJYVowCZcs1jxcIrj
 YmxAf6+3SbXj/+DakdkY+553zd8UBsTVVTtZ3luG+yM94z+j3Y+ok47W8nP3YBtxocdC
 4EwhKOasB8wIsOl7UKQtv5IxlhW+m1AlSP5Ji8f4Oto/ILAPtJzsW8QuD0sTsDxLzpt4
 rL3cOR9aPJmZNhHIS+j28hvPz+C+UqgviUE/17iGODztA4RzQBou/jL/+jAHN1n/7p3I
 xwsvOr6mwRSdSQXfNl6z7S4+fjfhvkDo1V/rBLrinbkgNacR3x64F83o2qpupYuDje0P
 BFPg==
X-Gm-Message-State: ANoB5pnEhMDfea6qMP7hqvWRXicxPP7yjhyv4urnqeIJUyfduNHx0HIL
 qi73u9yKepJtxi6dijc2A/BkaIH6UKqm7yJlamqSW4OMxkHhDoPMKNgH6lMdb4NHFFc9mnJSR10
 LAjZ6p3vIdUi7Mv8=
X-Received: by 2002:a05:600c:34cb:b0:3d1:f16d:5848 with SMTP id
 d11-20020a05600c34cb00b003d1f16d5848mr5196493wmq.26.1670605436377; 
 Fri, 09 Dec 2022 09:03:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5SGpkinQhuob4R3PaQ2zp8UjuhDUkQtj3PgufVX6IFjiScV53nxdhXpnCFT3YqV/WlONEv9Q==
X-Received: by 2002:a05:600c:34cb:b0:3d1:f16d:5848 with SMTP id
 d11-20020a05600c34cb00b003d1f16d5848mr5196474wmq.26.1670605436160; 
 Fri, 09 Dec 2022 09:03:56 -0800 (PST)
Received: from redhat.com ([2.52.31.249]) by smtp.gmail.com with ESMTPSA id
 iz2-20020a05600c554200b003cf78aafdd7sm264753wmb.39.2022.12.09.09.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 09:03:55 -0800 (PST)
Date: Fri, 9 Dec 2022 12:03:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 ben.widawsky@intel.com, jonathan.cameron@huawei.com, philmd@linaro.org
Subject: Re: [PATCH 1/5] include/hw/pci: Clean up superfluous inclusion of
 pci*/*.h cxl/*.h
Message-ID: <20221209120234-mutt-send-email-mst@kernel.org>
References: <20221209134802.3642942-1-armbru@redhat.com>
 <20221209134802.3642942-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209134802.3642942-2-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Dec 09, 2022 at 02:47:58PM +0100, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Thanks!
How can I verify this is correct, i.e. that none
of the headers that we remove is actually needed?


> ---
>  hw/alpha/alpha_sys.h              | 1 -
>  hw/rdma/rdma_utils.h              | 1 -
>  hw/rdma/vmw/pvrdma.h              | 1 -
>  hw/usb/hcd-ehci.h                 | 1 -
>  hw/xen/xen_pt.h                   | 1 -
>  include/hw/cxl/cxl.h              | 1 -
>  include/hw/cxl/cxl_cdat.h         | 1 +
>  include/hw/cxl/cxl_device.h       | 1 +
>  include/hw/cxl/cxl_pci.h          | 2 --
>  include/hw/i386/ich9.h            | 4 ----
>  include/hw/i386/x86-iommu.h       | 1 -
>  include/hw/isa/vt82c686.h         | 1 -
>  include/hw/pci-host/designware.h  | 3 ---
>  include/hw/pci-host/i440fx.h      | 2 +-
>  include/hw/pci-host/ls7a.h        | 2 --
>  include/hw/pci-host/pnv_phb3.h    | 2 --
>  include/hw/pci-host/pnv_phb4.h    | 3 +--
>  include/hw/pci-host/xilinx-pcie.h | 1 -
>  include/hw/pci/pcie.h             | 1 -
>  include/hw/virtio/virtio-scsi.h   | 1 -
>  hw/alpha/pci.c                    | 1 +
>  hw/alpha/typhoon.c                | 2 +-
>  hw/i386/acpi-build.c              | 2 +-
>  hw/pci-bridge/i82801b11.c         | 2 +-
>  hw/rdma/rdma_utils.c              | 1 +
>  hw/scsi/virtio-scsi.c             | 1 +
>  26 files changed, 10 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
> index 2263e821da..a303c58438 100644
> --- a/hw/alpha/alpha_sys.h
> +++ b/hw/alpha/alpha_sys.h
> @@ -5,7 +5,6 @@
>  
>  #include "target/alpha/cpu-qom.h"
>  #include "hw/pci/pci.h"
> -#include "hw/pci/pci_host.h"
>  #include "hw/boards.h"
>  #include "hw/intc/i8259.h"
>  
> diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h
> index 0c6414e7e0..54e4f56edd 100644
> --- a/hw/rdma/rdma_utils.h
> +++ b/hw/rdma/rdma_utils.h
> @@ -18,7 +18,6 @@
>  #define RDMA_UTILS_H
>  
>  #include "qemu/error-report.h"
> -#include "hw/pci/pci.h"
>  #include "sysemu/dma.h"
>  
>  #define rdma_error_report(fmt, ...) \
> diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
> index d08965d3e2..0caf95ede8 100644
> --- a/hw/rdma/vmw/pvrdma.h
> +++ b/hw/rdma/vmw/pvrdma.h
> @@ -18,7 +18,6 @@
>  
>  #include "qemu/units.h"
>  #include "qemu/notify.h"
> -#include "hw/pci/pci.h"
>  #include "hw/pci/msix.h"
>  #include "chardev/char-fe.h"
>  #include "hw/net/vmxnet3_defs.h"
> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
> index a173707d9b..4d4b2830b7 100644
> --- a/hw/usb/hcd-ehci.h
> +++ b/hw/usb/hcd-ehci.h
> @@ -23,7 +23,6 @@
>  #include "sysemu/dma.h"
>  #include "hw/pci/pci.h"
>  #include "hw/sysbus.h"
> -#include "qom/object.h"
>  
>  #ifndef EHCI_DEBUG
>  #define EHCI_DEBUG   0
> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> index e7c4316a7d..cf10fc7bbf 100644
> --- a/hw/xen/xen_pt.h
> +++ b/hw/xen/xen_pt.h
> @@ -2,7 +2,6 @@
>  #define XEN_PT_H
>  
>  #include "hw/xen/xen_common.h"
> -#include "hw/pci/pci.h"
>  #include "xen-host-pci-device.h"
>  #include "qom/object.h"
>  
> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> index 38e0e271d5..5129557bee 100644
> --- a/include/hw/cxl/cxl.h
> +++ b/include/hw/cxl/cxl.h
> @@ -13,7 +13,6 @@
>  
>  #include "qapi/qapi-types-machine.h"
>  #include "qapi/qapi-visit-machine.h"
> -#include "hw/pci/pci_bridge.h"
>  #include "hw/pci/pci_host.h"
>  #include "cxl_pci.h"
>  #include "cxl_component.h"
> diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
> index e9eda00142..7f67638685 100644
> --- a/include/hw/cxl/cxl_cdat.h
> +++ b/include/hw/cxl/cxl_cdat.h
> @@ -11,6 +11,7 @@
>  #define CXL_CDAT_H
>  
>  #include "hw/cxl/cxl_pci.h"
> +#include "hw/pci/pcie_doe.h"
>  
>  /*
>   * Reference:
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index 449b0edfe9..fd475b947b 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -10,6 +10,7 @@
>  #ifndef CXL_DEVICE_H
>  #define CXL_DEVICE_H
>  
> +#include "hw/pci/pci.h"
>  #include "hw/register.h"
>  
>  /*
> diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
> index 3cb79eca1e..aca14845ab 100644
> --- a/include/hw/cxl/cxl_pci.h
> +++ b/include/hw/cxl/cxl_pci.h
> @@ -11,8 +11,6 @@
>  #define CXL_PCI_H
>  
>  #include "qemu/compiler.h"
> -#include "hw/pci/pci.h"
> -#include "hw/pci/pcie.h"
>  #include "hw/cxl/cxl_cdat.h"
>  
>  #define CXL_VENDOR_ID 0x1e98
> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> index 23ee8e371b..222781e8b9 100644
> --- a/include/hw/i386/ich9.h
> +++ b/include/hw/i386/ich9.h
> @@ -5,12 +5,8 @@
>  #include "hw/sysbus.h"
>  #include "hw/i386/pc.h"
>  #include "hw/isa/apm.h"
> -#include "hw/pci/pci.h"
> -#include "hw/pci/pcie_host.h"
> -#include "hw/pci/pci_bridge.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/ich9.h"
> -#include "hw/pci/pci_bus.h"
>  #include "qom/object.h"
>  
>  void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
> diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
> index 7637edb430..8d8d53b18b 100644
> --- a/include/hw/i386/x86-iommu.h
> +++ b/include/hw/i386/x86-iommu.h
> @@ -21,7 +21,6 @@
>  #define HW_I386_X86_IOMMU_H
>  
>  #include "hw/sysbus.h"
> -#include "hw/pci/pci.h"
>  #include "hw/pci/msi.h"
>  #include "qom/object.h"
>  
> diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
> index eaa07881c5..e273cd38dc 100644
> --- a/include/hw/isa/vt82c686.h
> +++ b/include/hw/isa/vt82c686.h
> @@ -1,7 +1,6 @@
>  #ifndef HW_VT82C686_H
>  #define HW_VT82C686_H
>  
> -#include "hw/pci/pci.h"
>  
>  #define TYPE_VT82C686B_ISA "vt82c686b-isa"
>  #define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
> diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
> index 6d9b51ae67..908f3d946b 100644
> --- a/include/hw/pci-host/designware.h
> +++ b/include/hw/pci-host/designware.h
> @@ -22,9 +22,6 @@
>  #define DESIGNWARE_H
>  
>  #include "hw/sysbus.h"
> -#include "hw/pci/pci.h"
> -#include "hw/pci/pci_bus.h"
> -#include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "qom/object.h"
>  
> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> index d02bf1ed6b..fc93e22732 100644
> --- a/include/hw/pci-host/i440fx.h
> +++ b/include/hw/pci-host/i440fx.h
> @@ -11,7 +11,7 @@
>  #ifndef HW_PCI_I440FX_H
>  #define HW_PCI_I440FX_H
>  
> -#include "hw/pci/pci_bus.h"
> +#include "hw/pci/pci.h"
>  #include "hw/pci-host/pam.h"
>  #include "qom/object.h"
>  
> diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
> index df7fa55a30..b27db8e2ca 100644
> --- a/include/hw/pci-host/ls7a.h
> +++ b/include/hw/pci-host/ls7a.h
> @@ -8,8 +8,6 @@
>  #ifndef HW_LS7A_H
>  #define HW_LS7A_H
>  
> -#include "hw/pci/pci.h"
> -#include "hw/pci/pcie_host.h"
>  #include "hw/pci-host/pam.h"
>  #include "qemu/units.h"
>  #include "qemu/range.h"
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index 4854f6d2f6..f791ebda9b 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -10,8 +10,6 @@
>  #ifndef PCI_HOST_PNV_PHB3_H
>  #define PCI_HOST_PNV_PHB3_H
>  
> -#include "hw/pci/pcie_host.h"
> -#include "hw/pci/pcie_port.h"
>  #include "hw/ppc/xics.h"
>  #include "qom/object.h"
>  #include "hw/pci-host/pnv_phb.h"
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 50d4faa001..d9cea3f952 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -10,8 +10,7 @@
>  #ifndef PCI_HOST_PNV_PHB4_H
>  #define PCI_HOST_PNV_PHB4_H
>  
> -#include "hw/pci/pcie_host.h"
> -#include "hw/pci/pcie_port.h"
> +#include "hw/pci/pci_bus.h"
>  #include "hw/ppc/xive.h"
>  #include "qom/object.h"
>  
> diff --git a/include/hw/pci-host/xilinx-pcie.h b/include/hw/pci-host/xilinx-pcie.h
> index 89be88d87f..e1b3c1c280 100644
> --- a/include/hw/pci-host/xilinx-pcie.h
> +++ b/include/hw/pci-host/xilinx-pcie.h
> @@ -21,7 +21,6 @@
>  #define HW_XILINX_PCIE_H
>  
>  #include "hw/sysbus.h"
> -#include "hw/pci/pci.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/pci/pcie_host.h"
>  #include "qom/object.h"
> diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
> index 698d3de851..798a262a0a 100644
> --- a/include/hw/pci/pcie.h
> +++ b/include/hw/pci/pcie.h
> @@ -26,7 +26,6 @@
>  #include "hw/pci/pcie_aer.h"
>  #include "hw/pci/pcie_sriov.h"
>  #include "hw/hotplug.h"
> -#include "hw/pci/pcie_doe.h"
>  
>  typedef enum {
>      /* for attention and power indicator */
> diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
> index a36aad9c86..37b75e15e3 100644
> --- a/include/hw/virtio/virtio-scsi.h
> +++ b/include/hw/virtio/virtio-scsi.h
> @@ -20,7 +20,6 @@
>  #define VIRTIO_SCSI_SENSE_SIZE 0
>  #include "standard-headers/linux/virtio_scsi.h"
>  #include "hw/virtio/virtio.h"
> -#include "hw/pci/pci.h"
>  #include "hw/scsi/scsi.h"
>  #include "chardev/char-fe.h"
>  #include "sysemu/iothread.h"
> diff --git a/hw/alpha/pci.c b/hw/alpha/pci.c
> index 72251fcdf0..7c18297177 100644
> --- a/hw/alpha/pci.c
> +++ b/hw/alpha/pci.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "hw/pci/pci_host.h"
>  #include "alpha_sys.h"
>  #include "qemu/log.h"
>  #include "trace.h"
> diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
> index bd39c8ca86..49a80550c5 100644
> --- a/hw/alpha/typhoon.c
> +++ b/hw/alpha/typhoon.c
> @@ -10,10 +10,10 @@
>  #include "qemu/module.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> +#include "hw/pci/pci_host.h"
>  #include "cpu.h"
>  #include "hw/irq.h"
>  #include "alpha_sys.h"
> -#include "qom/object.h"
>  
>  
>  #define TYPE_TYPHOON_PCI_HOST_BRIDGE "typhoon-pcihost"
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d9eaa5fc4d..b75d1507f9 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -27,7 +27,7 @@
>  #include "acpi-common.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/error-report.h"
> -#include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"
>  #include "hw/cxl/cxl.h"
>  #include "hw/core/cpu.h"
>  #include "target/i386/cpu.h"
> diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
> index f28181e210..06f704a2e1 100644
> --- a/hw/pci-bridge/i82801b11.c
> +++ b/hw/pci-bridge/i82801b11.c
> @@ -42,7 +42,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"
>  #include "migration/vmstate.h"
>  #include "qemu/module.h"
>  #include "hw/i386/ich9.h"
> diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
> index 5a7ef63ad2..77008552f4 100644
> --- a/hw/rdma/rdma_utils.c
> +++ b/hw/rdma/rdma_utils.c
> @@ -14,6 +14,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "hw/pci/pci.h"
>  #include "trace.h"
>  #include "rdma_utils.h"
>  
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 6f6e2e32ba..2b649ca976 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -22,6 +22,7 @@
>  #include "qemu/iov.h"
>  #include "qemu/module.h"
>  #include "sysemu/block-backend.h"
> +#include "sysemu/dma.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/scsi/scsi.h"
>  #include "scsi/constants.h"
> -- 
> 2.37.3


