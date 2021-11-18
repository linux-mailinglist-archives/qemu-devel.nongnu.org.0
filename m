Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46998455E7E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:47:16 +0100 (CET)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnih1-00029e-D9
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:47:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnifO-0000HN-3b
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:45:36 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:47399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnifL-00063O-Mc
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:45:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1CD6320C72;
 Thu, 18 Nov 2021 14:45:29 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 18 Nov
 2021 15:45:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004c61d8112-eee7-472c-9917-2e6261ce78c8,
 4A6ABDF66DC85A3D00A6C17CB73E494911F6EB6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.24.82
Message-ID: <5a080585-6912-6b0f-8ad3-7b13093a8503@kaod.org>
Date: Thu, 18 Nov 2021 15:45:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] ppc/pnv: Tune the POWER9 PCIe Host bridge model
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20211116170133.724751-1-fbarrat@linux.ibm.com>
 <20211116170133.724751-2-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211116170133.724751-2-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 771545b9-e65d-4779-98f9-3bde1224b605
X-Ovh-Tracer-Id: 7424183986558765987
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.084,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 18:01, Frederic Barrat wrote:
> The PHB v4 found on POWER9 doesn't request any LSI, so let's clear the
> Interrupt Pin register in the config space so that the model matches
> the hardware.
> 
> If we don't, then we inherit from the default pcie root bridge, which
> requests a LSI. And because we don't map it correctly in the device
> tree, all PHBs allocate the same bogus hw interrupt. We end up with
> inconsistent interrupt controller (xive) data. The problem goes away
> if we don't allocate the LSI in the first place.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 5c375a9f28..1659d55b4f 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1234,10 +1234,13 @@ static void pnv_phb4_reset(DeviceState *dev)
>       PCIDevice *root_dev = PCI_DEVICE(&phb->root);
>   
>       /*
> -     * Configure PCI device id at reset using a property.
> +     * Configure the PCI device at reset:
> +     *   - set the Vendor and Device ID to for the root bridge
> +     *   - no LSI
>        */
>       pci_config_set_vendor_id(root_dev->config, PCI_VENDOR_ID_IBM);
>       pci_config_set_device_id(root_dev->config, phb->device_id);
> +    pci_config_set_interrupt_pin(root_dev->config, 0);
>   }
>   
>   static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
> 


