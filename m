Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF75995F8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 09:27:18 +0200 (CEST)
Received: from localhost ([::1]:41672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOwPV-0001f8-56
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 03:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oOwHp-0006Hn-KQ
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 03:19:27 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:39249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oOwHl-0002NQ-5l
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 03:19:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.41])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B0D8924170;
 Fri, 19 Aug 2022 07:19:13 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 19 Aug
 2022 09:19:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001b2edc332-93ca-4ad5-84ef-f70b9c4c6984,
 B1CA06E21BA7A2C3169B20B962F9E616B459CCCE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <125fdf68-a491-6098-9e19-2b334a1a25f9@kaod.org>
Date: Fri, 19 Aug 2022 09:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 2/2] ppc/pnv: fix QOM parenting of user creatable
 root ports
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220818224511.373255-1-danielhb413@gmail.com>
 <20220818224511.373255-3-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220818224511.373255-3-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ff4bf77f-382b-4ce5-85e5-173bf1001fc9
X-Ovh-Tracer-Id: 4135711833047010272
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeitddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/19/22 00:45, Daniel Henrique Barboza wrote:
> User creatable root ports are being parented by the 'peripheral' or the
> 'peripheral-anon' container. This happens because this is the regular
> QOM schema for sysbus devices that are added via the command line.
> 
> Let's make this QOM hierarchy similar to what we have with default root
> ports, i.e. the root port must be parented by the pnv-root-bus. To do
> that we change the qom and bus parent of the root port during
> root_port_realize(). The realize() is shared by the default root port
> code path, so we can remove the code inside pnv_phb_attach_root_port()
> that was adding the root port as a child of the bus as well.
> 
> While we're at it, change pnv_phb_attach_root_port() to receive a PCIBus
> instead of a PCIHostState to make it clear that the function does not
> make use of the PHB.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb.c | 38 +++++++++++++++++++-------------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 4ea33fb6ba..38ec8571b7 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -62,27 +62,11 @@ static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
>       return true;
>   }
>   
> -/*
> - * Attach a root port device.
> - *
> - * 'index' will be used both as a PCIE slot value and to calculate
> - * QOM id. 'chip_id' is going to be used as PCIE chassis for the
> - * root port.
> - */
> -static void pnv_phb_attach_root_port(PCIHostState *pci)
> +static void pnv_phb_attach_root_port(PCIBus *bus)

Do we still need this pnv_phb_attach_root_port routine ?

>   {
>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
> -    const char *dev_id = DEVICE(root)->id;
> -    g_autofree char *default_id = NULL;
> -    int index;
>   
> -    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
> -    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
> -
> -    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
> -                              OBJECT(root));
> -
> -    pci_realize_and_unref(root, pci->bus, &error_fatal);
> +    pci_realize_and_unref(root, bus, &error_fatal);
>   }
>   
>   /*
> @@ -184,7 +168,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    pnv_phb_attach_root_port(pci);
> +    pnv_phb_attach_root_port(pci->bus);
>   }
>   
>   static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
> @@ -259,6 +243,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>       Error *local_err = NULL;
>       int chip_id, index;
>   
> +    /*
> +     * 'index' will be used both as a PCIE slot value and to calculate
> +     * QOM id. 'chip_id' is going to be used as PCIE chassis for the
> +     * root port.
> +     */
>       chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
>       index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
>   
> @@ -266,6 +255,17 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>       qdev_prop_set_uint8(dev, "chassis", chip_id);
>       qdev_prop_set_uint16(dev, "slot", index);
>   
> +    /*
> +     * User created root ports are QOM parented to one of
> +     * the peripheral containers but it's already at the right
> +     * parent bus. Change the QOM parent to be the same as the
> +     * parent bus it's already assigned to.
> +     */
> +    if (!pnv_parent_fixup(OBJECT(bus), BUS(bus), OBJECT(dev),
> +                          index, errp)) {
> +        return;
> +    }
> +
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);


