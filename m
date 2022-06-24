Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B598559B6E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:23:10 +0200 (CEST)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kDF-0003Nt-Jb
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4jbp-0004O8-PL
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:44:29 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:40153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4jbk-0005ZS-Gp
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:44:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5EBF81FD7C;
 Fri, 24 Jun 2022 13:44:20 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 15:44:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0060e3d7ced-8e4d-4c9c-a99b-feca3ee0c1e2,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9e8671ea-1d13-5df1-64e5-1d28cab0ac80@kaod.org>
Date: Fri, 24 Jun 2022 15:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 01/12] ppc/pnv: add PHB3 bus init helper
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-2-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624084921.399219-2-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: de7da4a5-9857-4905-809b-4b89f0a92c0f
X-Ovh-Tracer-Id: 13813665960737671974
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehkrhgrgigvlhesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

(Adding people who could help making the right change)

On 6/24/22 10:49, Daniel Henrique Barboza wrote:
> The PnvPHB3 bus init consists of initializing the pci_io and pci_mmio
> regions, registering it via pci_register_root_bus() and then setup the
> iommu.
> 
> We'll want to init the bus from outside pnv_phb3.c when the bus is
> removed from the PnvPHB3 device and put into a new parent PnvPHB device.
> The new pnv_phb3_bus_init() helper will be used by the parent to init
> the bus when using the PHB3 backend.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb3.c         | 39 ++++++++++++++++++++--------------
>   include/hw/pci-host/pnv_phb3.h |  1 +
>   2 files changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index d58d3c1701..058cbab555 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -986,6 +986,28 @@ static void pnv_phb3_instance_init(Object *obj)
>   
>   }
>   
> +void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb)
> +{
> +    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> +
> +    /*
> +     * PHB3 doesn't support IO space. However, qemu gets very upset if
> +     * we don't have an IO region to anchor IO BARs onto so we just
> +     * initialize one which we never hook up to anything
> +     */
> +    memory_region_init(&phb->pci_io, OBJECT(phb), "pci-io", 0x10000);
> +    memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
> +                       PCI_MMIO_TOTAL_SIZE);


Could we change the root port settings with io-reserve=0 to remove
the IO range ?


Thanks,

C.



> +    pci->bus = pci_register_root_bus(dev,
> +                                     dev->id ? dev->id : NULL,
> +                                     pnv_phb3_set_irq, pnv_phb3_map_irq, phb,
> +                                     &phb->pci_mmio, &phb->pci_io,
> +                                     0, 4, TYPE_PNV_PHB3_ROOT_BUS);
> +
> +    pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
> +}
> +
>   static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB3 *phb = PNV_PHB3(dev);
> @@ -1035,22 +1057,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>       memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb3_reg_ops, phb,
>                             "phb3-regs", 0x1000);
>   
> -    /*
> -     * PHB3 doesn't support IO space. However, qemu gets very upset if
> -     * we don't have an IO region to anchor IO BARs onto so we just
> -     * initialize one which we never hook up to anything
> -     */
> -    memory_region_init(&phb->pci_io, OBJECT(phb), "pci-io", 0x10000);
> -    memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
> -                       PCI_MMIO_TOTAL_SIZE);
> -
> -    pci->bus = pci_register_root_bus(dev,
> -                                     dev->id ? dev->id : NULL,
> -                                     pnv_phb3_set_irq, pnv_phb3_map_irq, phb,
> -                                     &phb->pci_mmio, &phb->pci_io,
> -                                     0, 4, TYPE_PNV_PHB3_ROOT_BUS);
> -
> -    pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
> +    pnv_phb3_bus_init(dev, phb);
>   
>       pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT,
>                                phb->phb_id, phb->chip_id);
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index af6ec83cf6..1375f18fc1 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -164,5 +164,6 @@ uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size);
>   void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size);
>   void pnv_phb3_update_regions(PnvPHB3 *phb);
>   void pnv_phb3_remap_irqs(PnvPHB3 *phb);
> +void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb);
>   
>   #endif /* PCI_HOST_PNV_PHB3_H */


