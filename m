Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BA95BCBA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 15:20:05 +0200 (CEST)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhwE0-0003oR-Hi
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 09:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36814)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hhw21-0002lA-Rn
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hhw1v-00085b-0U
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:07:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52656)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hhw1u-00081J-MW
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:07:34 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4D91D308FF23
 for <qemu-devel@nongnu.org>; Mon,  1 Jul 2019 13:07:26 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A29FB4EE0B;
 Mon,  1 Jul 2019 13:07:25 +0000 (UTC)
Date: Mon, 1 Jul 2019 15:07:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190701150724.1fb1099c@redhat.com>
In-Reply-To: <20190621064615.20099-3-mst@redhat.com>
References: <20190621064615.20099-1-mst@redhat.com>
 <20190621064615.20099-3-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 01 Jul 2019 13:07:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] pcie: check that slt ctrl changed
 before deleting
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Jun 2019 02:46:48 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> During boot, linux would sometimes overwrites control of a powered off
> slot before powering it on. Unfortunately QEMU interprets that as a
> power off request and ejects the device.
> 
> For example:
> 
> /x86_64-softmmu/qemu-system-x86_64 -enable-kvm -S -machine q35  \
>     -device pcie-root-port,id=pcie_root_port_0,slot=2,chassis=2,addr=0x2,bus=pcie.0 \
>     -monitor stdio disk.qcow2
> (qemu)device_add virtio-balloon-pci,id=balloon,bus=pcie_root_port_0
> (qemu)cont
> 
> Balloon is deleted during guest boot.
> 
> To fix, save control beforehand and check that power
> or led state actually change before ejecting.
> 
> Note: this is more a hack than a solution, ideally we'd
> find a better way to detect ejects, or move away
> from ejects completely and instead monitor whether
> it's safe to delete device due to e.g. its power state.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/pci/pcie.h              |  3 ++-
>  hw/pci-bridge/pcie_root_port.c     |  5 ++++-
>  hw/pci-bridge/xio3130_downstream.c |  5 ++++-
>  hw/pci/pcie.c                      | 14 ++++++++++++--
>  4 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
> index e30334d74d..8d90c0e193 100644
> --- a/include/hw/pci/pcie.h
> +++ b/include/hw/pci/pcie.h
> @@ -107,7 +107,8 @@ void pcie_cap_lnkctl_reset(PCIDevice *dev);
>  
>  void pcie_cap_slot_init(PCIDevice *dev, uint16_t slot);
>  void pcie_cap_slot_reset(PCIDevice *dev);
> -void pcie_cap_slot_write_config(PCIDevice *dev,
> +void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slot_ctl, uint16_t *slt_sta);
> +void pcie_cap_slot_write_config(PCIDevice *dev, uint16_t slot_ctl, uint16_t slt_sta,
>                                  uint32_t addr, uint32_t val, int len);
>  int pcie_cap_slot_post_load(void *opaque, int version_id);
>  void pcie_cap_slot_push_attention_button(PCIDevice *dev);
> diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
> index 92f253c924..09019ca05d 100644
> --- a/hw/pci-bridge/pcie_root_port.c
> +++ b/hw/pci-bridge/pcie_root_port.c
> @@ -31,10 +31,13 @@ static void rp_write_config(PCIDevice *d, uint32_t address,
>  {
>      uint32_t root_cmd =
>          pci_get_long(d->config + d->exp.aer_cap + PCI_ERR_ROOT_COMMAND);
> +    uint16_t slt_ctl, slt_sta;
> +
> +    pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
>  
>      pci_bridge_write_config(d, address, val, len);
>      rp_aer_vector_update(d);
> -    pcie_cap_slot_write_config(d, address, val, len);
> +    pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
>      pcie_aer_write_config(d, address, val, len);
>      pcie_aer_root_write_config(d, address, val, len, root_cmd);
>  }
> diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
> index 264e37d6a6..899b0fd6c9 100644
> --- a/hw/pci-bridge/xio3130_downstream.c
> +++ b/hw/pci-bridge/xio3130_downstream.c
> @@ -41,9 +41,12 @@
>  static void xio3130_downstream_write_config(PCIDevice *d, uint32_t address,
>                                           uint32_t val, int len)
>  {
> +    uint16_t slt_ctl, slt_sta;
> +
> +    pcie_cap_slot_get(d, &slt_sta, &slt_ctl);
>      pci_bridge_write_config(d, address, val, len);
>      pcie_cap_flr_write_config(d, address, val, len);
> -    pcie_cap_slot_write_config(d, address, val, len);
> +    pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
>      pcie_aer_write_config(d, address, val, len);
>  }
>  
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index b22527000d..f8490a00de 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -594,7 +594,15 @@ void pcie_cap_slot_reset(PCIDevice *dev)
>      hotplug_event_update_event_status(dev);
>  }
>  
> -void pcie_cap_slot_write_config(PCIDevice *dev,
> +void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slt_ctl, uint16_t *slt_sta)
> +{
> +    uint32_t pos = dev->exp.exp_cap;
> +    uint8_t *exp_cap = dev->config + pos;
> +    *slt_ctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
> +    *slt_sta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
> +}
> +
> +void pcie_cap_slot_write_config(PCIDevice *dev, uint16_t slt_ctl, uint16_t slt_sta,
>                                  uint32_t addr, uint32_t val, int len)
>  {
>      uint32_t pos = dev->exp.exp_cap;
> @@ -623,7 +631,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>       * controller is off, it is safe to detach the devices.
>       */
>      if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> -        ((val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF)) {
> +        (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
> +        (!(slt_ctl & PCI_EXP_SLTCTL_PCC) ||
> +        (slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
>          PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
>          pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
>                              pcie_unplug_device, NULL);


