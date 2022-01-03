Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA2482F01
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:27:29 +0100 (CET)
Received: from localhost ([::1]:35364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Igj-00078y-0d
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:27:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4IeK-0005bP-Q0
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:25:00 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:35373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4IeI-0005Qv-KK
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:25:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8CB1D20B2B;
 Mon,  3 Jan 2022 08:24:55 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 09:24:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004f28fdcb6-6364-4cce-8073-14d4c394c125,
 71ABFCEAB0EE88409933ED7B68EF8EFCD2601B88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2a8367ed-d23b-3716-77d0-911cba9ecb74@kaod.org>
Date: Mon, 3 Jan 2022 09:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 01/17] pnv_phb3.c: add unique chassis and slot for
 pnv_phb3_root_port
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-2-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211228193806.1198496-2-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 32f56b10-27c7-40c5-884b-eade99474b74
X-Ovh-Tracer-Id: 12886768861181610976
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeftddguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 20:37, Daniel Henrique Barboza wrote:
> When creating a pnv_phb3_root_port using the command line, the first
> root port is created successfully, but the second fails with the
> following error:
> 
> qemu-system-ppc64: -device pnv-phb3-root-port,bus=phb3-root.0,id=pcie.3:
> Can't add chassis slot, error -16
> 
> This error comes from the realize() function of its parent type,
> rp_realize() from TYPE_PCIE_ROOT_PORT. pcie_chassis_add_slot() fails
> with -EBUSY if there's an existing PCIESlot that has the same
> chassis/slot value, regardless of being in a different bus.
> 
> One way to prevent this error is simply set chassis and slot values in
> the command line. However, since phb3 root buses only supports a single
> root port, we can just get an unique chassis/slot value by checking
> which root bus the pnv_phb3_root_port is going to be attached, get the
> equivalent phb3 device and use its chip-id and index values, which are
> guaranteed to be unique.

I guess parent_realize() will fail if we add 2 root port devices under
the same phb ?

Thanks,

C.


> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb3.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 4e2d680d44..130d392b3e 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1156,8 +1156,24 @@ static const TypeInfo pnv_phb3_root_bus_info = {
>   static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> +    PCIDevice *pci = PCI_DEVICE(dev);
> +    PCIBus *bus = pci_get_bus(pci);
> +    PnvPHB3 *phb = NULL;
>       Error *local_err = NULL;
>   
> +    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> +                                          TYPE_PNV_PHB3);
> +
> +    if (!phb) {
> +        error_setg(errp,
> +"pnv_phb3_root_port devices must be connected to pnv-phb3 buses");
> +        return;
> +    }
> +
> +    /* Set unique chassis/slot values for the root port */
> +    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
> +    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
> +
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
> 


