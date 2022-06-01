Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CE539CD6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 07:59:00 +0200 (CEST)
Received: from localhost ([::1]:41850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwHNj-0003MK-Je
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 01:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwHLK-00023M-9M
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 01:56:32 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:39109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwHLI-0001rP-3g
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 01:56:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EADC321022;
 Wed,  1 Jun 2022 05:56:24 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 1 Jun 2022
 07:56:24 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0069283bcfd-d478-446c-903b-f3229238ff02,
 A963F33A9D1A618F9A1E828761F10BD73193B711) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9b633a09-f79f-0a5c-7073-ec1a92d47fb5@kaod.org>
Date: Wed, 1 Jun 2022 07:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 11/16] ppc/pnv: add pnv-phb-root-port device
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <david@gibson.dropbear.id.au>,
 <mark.cave-ayland@ilande.co.uk>, <fbarrat@linux.ibm.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-12-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220531214917.31668-12-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fe8218c1-512f-4f60-a263-f36068723a9e
X-Ovh-Tracer-Id: 18412967077389437734
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeelgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/22 23:49, Daniel Henrique Barboza wrote:
> We have two very similar root-port devices, pnv-phb3-root-port and
> pnv-phb4-root-port. Both consist of a wrapper around the PCIESlot device
> that, until now, has no additional attributes.
> 
> The main difference between the PHB3 and PHB4 root ports is that
> pnv-phb4-root-port has the pnv_phb4_root_port_reset() callback. All
> other differences can be merged in a single device without too much
> trouble.
> 
> This patch introduces the unified pnv-phb-root-port that, in time, will
> be used as the default root port for the pnv-phb device.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb.c | 107 ++++++++++++++++++++++++++++++++++++++----
>   hw/pci-host/pnv_phb.h |  17 +++++++
>   2 files changed, 116 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 321c4e768a..5047e90d3a 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -114,15 +114,106 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
>       dc->user_creatable = true;
>   }
>   
> -static void pnv_phb_register_type(void)
> +static void pnv_phb_root_port_reset(DeviceState *dev)
>   {
> -    static const TypeInfo pnv_phb_type_info = {
> -        .name          = TYPE_PNV_PHB,
> -        .parent        = TYPE_PCIE_HOST_BRIDGE,
> -        .instance_size = sizeof(PnvPHB),
> -        .class_init    = pnv_phb_class_init,
> -    };
> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> +    PnvPHBRootPort *rootport = PNV_PHB_ROOT_PORT(dev);
> +    PCIDevice *d = PCI_DEVICE(dev);
> +    uint8_t *conf = d->config;
>   
> +    rpc->parent_reset(dev);
> +
> +    if (rootport->version == 3) {
> +        return;
> +    }
> +
> +    /* PHB4 and later requires these extra reset steps */
> +    pci_byte_test_and_set_mask(conf + PCI_IO_BASE,
> +                               PCI_IO_RANGE_MASK & 0xff);
> +    pci_byte_test_and_clear_mask(conf + PCI_IO_LIMIT,
> +                                 PCI_IO_RANGE_MASK & 0xff);
> +    pci_set_word(conf + PCI_MEMORY_BASE, 0);
> +    pci_set_word(conf + PCI_MEMORY_LIMIT, 0xfff0);
> +    pci_set_word(conf + PCI_PREF_MEMORY_BASE, 0x1);
> +    pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
> +    pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
> +    pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
> +    pci_config_set_interrupt_pin(conf, 0);
> +}
> +
> +static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
> +{
> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> +    PCIDevice *pci = PCI_DEVICE(dev);
> +    PCIBus *bus = pci_get_bus(pci);
> +    PnvPHB *phb = NULL;
> +    Error *local_err = NULL;
> +
> +    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> +                                          TYPE_PNV_PHB);
> +
> +    if (!phb) {
> +        error_setg(errp,
> +"pnv_phb_root_port devices must be connected to pnv-phb buses");
> +        return;
> +    }
> +
> +    /* Set unique chassis/slot values for the root port */
> +    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
> +    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
> +
> +    rpc->parent_realize(dev, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +    pci_config_set_interrupt_pin(pci->config, 0);
> +}
> +
> +static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
> +
> +    dc->desc     = "IBM PHB PCIE Root Port";
> +
> +    device_class_set_parent_realize(dc, pnv_phb_root_port_realize,
> +                                    &rpc->parent_realize);
> +
> +    device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
> +                                  &rpc->parent_reset);
> +    dc->reset = &pnv_phb_root_port_reset;
> +
> +    dc->user_creatable = true;
> +
> +    k->vendor_id = PCI_VENDOR_ID_IBM;
> +    /* device_id represents the latest PHB root port version supported */
> +    k->device_id = PNV_PHB5_DEVICE_ID;

does that mean powernv8 machines will see phb devices as phb5 devices ?

C.

> +    k->revision  = 0;
> +
> +    rpc->exp_offset = 0x48;
> +    rpc->aer_offset = 0x100;
> +}
> +
> +static const TypeInfo pnv_phb_type_info = {
> +    .name          = TYPE_PNV_PHB,
> +    .parent        = TYPE_PCIE_HOST_BRIDGE,
> +    .instance_size = sizeof(PnvPHB),
> +    .class_init    = pnv_phb_class_init,
> +};
> +
> +static const TypeInfo pnv_phb_root_port_info = {
> +    .name          = TYPE_PNV_PHB_ROOT_PORT,
> +    .parent        = TYPE_PCIE_ROOT_PORT,
> +    .instance_size = sizeof(PnvPHBRootPort),
> +    .class_init    = pnv_phb_root_port_class_init,
> +};
> +
> +static void pnv_phb_register_types(void)
> +{
>       type_register_static(&pnv_phb_type_info);
> +    type_register_static(&pnv_phb_root_port_info);
>   }
> -type_init(pnv_phb_register_type)
> +
> +type_init(pnv_phb_register_types)
> diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
> index a7cc8610e2..c8eab4b767 100644
> --- a/hw/pci-host/pnv_phb.h
> +++ b/hw/pci-host/pnv_phb.h
> @@ -36,4 +36,21 @@ struct PnvPHB {
>   #define TYPE_PNV_PHB "pnv-phb"
>   OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
>   
> +/*
> + * PHB PCIe Root port
> + */
> +#define PNV_PHB3_DEVICE_ID         0x03dc
> +#define PNV_PHB4_DEVICE_ID         0x04c1
> +#define PNV_PHB5_DEVICE_ID         0x0652
> +
> +typedef struct PnvPHBRootPort {
> +    PCIESlot parent_obj;
> +
> +    uint32_t version;
> +} PnvPHBRootPort;
> +
> +#define TYPE_PNV_PHB_ROOT_PORT "pnv-phb-root-port"
> +#define PNV_PHB_ROOT_PORT(obj) \
> +    OBJECT_CHECK(PnvPHBRootPort, obj, TYPE_PNV_PHB_ROOT_PORT)
> +
>   #endif /* PCI_HOST_PNV_PHB_H */


