Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F353F66D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 08:44:07 +0200 (CEST)
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nySwg-0004UL-3o
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 02:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nySoK-000298-Ki
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:35:29 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:52915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nySoF-0001xL-UQ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:35:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C2296251D6;
 Tue,  7 Jun 2022 06:35:20 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 08:35:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00512a34922-9685-4638-9147-e59a09e4f81a,
 B3A9F5ABA359FFEAA5F192A1B4EC97B2EEB111D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bbbb71c0-c4bd-0c87-5d44-f6398d64cf36@kaod.org>
Date: Tue, 7 Jun 2022 08:35:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 08/16] ppc/pnv: user created pnv-phb for powernv9
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Frederic Barrat
 <fbarrat@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <david@gibson.dropbear.id.au>,
 <mark.cave-ayland@ilande.co.uk>
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-9-danielhb413@gmail.com>
 <d2ae2236-7a49-22e7-3950-cb635697721a@linux.ibm.com>
 <edef4577-c7d1-51aa-01c2-cd5846f7ba40@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <edef4577-c7d1-51aa-01c2-cd5846f7ba40@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8c9086bf-76b6-42a6-b022-f53491329083
X-Ovh-Tracer-Id: 17413167959998696230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
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

On 6/3/22 23:00, Daniel Henrique Barboza wrote:
> 
> 
> On 6/2/22 13:33, Frederic Barrat wrote:
>>
>>
>> On 31/05/2022 23:49, Daniel Henrique Barboza wrote:
>>> To enable user creatable PnvPHB devices for powernv9 we'll revert the
>>> powernv9 related changes made in 9c10d86fee "ppc/pnv: Remove
>>> user-created PHB{3,4,5} devices".
>>>
>>> This change alone isn't enough to enable user creatable devices for powernv10
>>> due to how pnv_phb4_get_pec() currently works. For now let's just enable it
>>> for powernv9 alone.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   hw/pci-host/pnv_phb4.c     | 58 +++++++++++++++++++++++++++++++++++++-
>>>   hw/pci-host/pnv_phb4_pec.c |  6 ++--
>>>   hw/ppc/pnv.c               |  2 ++
>>>   3 files changed, 63 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>>> index 22cf1c2a5e..a5c8ae494b 100644
>>> --- a/hw/pci-host/pnv_phb4.c
>>> +++ b/hw/pci-host/pnv_phb4.c
>>> @@ -1571,13 +1571,69 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
>>>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>>>   }
>>> +static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
>>> +                                         Error **errp)
>>> +{
>>> +    Pnv9Chip *chip9 = PNV9_CHIP(chip);
>>> +    int chip_id = phb->chip_id;
>>> +    int index = phb->phb_id;
>>> +    int i, j;
>>> +
>>> +    for (i = 0; i < chip->num_pecs; i++) {
>>> +        /*
>>> +         * For each PEC, check the amount of phbs it supports
>>> +         * and see if the given phb4 index matches an index.
>>> +         */
>>> +        PnvPhb4PecState *pec = &chip9->pecs[i];
>>> +
>>> +        for (j = 0; j < pec->num_phbs; j++) {
>>> +            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
>>> +                return pec;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    error_setg(errp,
>>> +               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
>>> +               chip_id, index);
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>>   {
>>>       PnvPHB4 *phb = PNV_PHB4(dev);
>>> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>>> +    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>>>       XiveSource *xsrc = &phb->xsrc;
>>> +    BusState *s;
>>> +    Error *local_err = NULL;
>>>       int nr_irqs;
>>>       char name[32];
>>> +    if (!chip) {
>>> +        error_setg(errp, "invalid chip id: %d", phb->chip_id);
>>> +        return;
>>> +    }
>>> +
>>> +    /* User created PHBs need to be assigned to a PEC */
>>> +    if (!phb->pec) {
>>> +        phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
>>> +        if (local_err) {
>>> +            error_propagate(errp, local_err);
>>> +            return;
>>> +        }
>>> +    }
>>> +
>>> +    /* Reparent the PHB to the chip to build the device tree */
>>> +    pnv_chip_parent_fixup(chip, OBJECT(phb->phb_base), phb->phb_id);
>>
>>
>> Didn't you mean to do that only for the user-created case? 
> 
> It's done for both because the default generated PHBs are being created loosely
> from the chip starting on 3f4c369ea63e ("ppc/pnv: make PECs create and realize
> PHB4s"). We had to amend the code after that commit to fix the QOM hierarchy
> of these devices. 6e7b96750359 ("ppc/pnv: fix default PHB4 QOM hierarchy") has
> more details.
> 
> 
>> And why not attaching the PHB to the PEC instead of the chip, like in pnv_pec_default_phb_realize() ? I think it makes more sense to keep the chip->PEC->PHB parenting in the qom tree (and incidentally, that's where I'd prefer to have the phb3 model move to).
>
> I can only speculate since I didn't participate in the initial design. My
> educated guess is that we didn't want to show PECs in qtree, 

PECs are low level pieces of logic, that don't need to be exposed
under the monitor. We need the models for the FW though.

> hence we made the PHB a child of the chip instead. 

Did we ? see below.

> I'll also guess that this can be
> due to how PHB3 worked and we just copied the existing design.


hmm, I am not following what you are saying. Here is what we have :

P8:

/machine (powernv8-machine)
   /chip[0] (power8_v2.0-pnv-chip)
     /phb[0] (pnv-phb3)
       /lsi (ics)
       /msi (phb3-msi)
       /pbcq (pnv-pbcq)
         /xscom-pbcq-nest-0.0[0] (memory-region)
         /xscom-pbcq-pci-0.0[0] (memory-region)
         /xscom-pbcq-spci-0.0[0] (memory-region)
       /pnv-phb3-root.0 (pnv-phb3-root)

   /unattached (container)
     /device[1] (pnv-phb3-root-port)

P9:

/machine (powernv9-machine)
   /chip[0] (power9_v2.0-pnv-chip)
     /pec[0] (pnv-phb4-pec)
       /phb[0] (pnv-phb4)
         /pnv-phb4-root.0 (pnv-phb4-root)
         /source (xive-source)
         /xscom-pec-0.0-nest-phb-0[0] (memory-region)
         /xscom-pec-0.0-pci-phb-0[0] (memory-region)
         /xscom-pec-0.0-pci-phb-0[1] (memory-region)
     ...

   /unattached (container)
     /device[1] (pnv-phb4-root-port)


The RP was detached for some libvirt reason I think.

We would like to keep the same QOM hierarchy and possibly fixed
the modeling of PHB3 which is reversed.


> 
>> Also, the comment seems wrong to me. The qom parenting doesn't matter when building the device tree. 

it does. See pnv_dt_xscom()

Thanks,

C.


>> We only iterate over the PHBs found in the array of the PEC object (cf. pnv_pec_dt_xscom())
> 
> I believe it refers to the QOM tree, a.k.a qtree. This has no relation to the
> actual device tree the kernel uses. This comment can be clearer though.
> 
> 
> Thanks,
> 
> 
> Daniel
> 
>>
>>
>>
>>> +    s = qdev_get_parent_bus(DEVICE(chip));
>>> +    if (!qdev_set_parent_bus(DEVICE(phb->phb_base), s, &local_err)) {
>>> +        error_propagate(errp, local_err);
>>> +        return;
>>> +    }
>>
>>
>> Same comment, I think that's only desirable for user-created devices. We're already calling sysbus_realize() for the default case.
>>
>>
>> Silly question: where does it break if a user tries to create 2 PHBs with the same index?
>>
>>
>>    Fred
>>
>>
>>
>>
>>>       /* Set the "big_phb" flag */
>>>       phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
>>> @@ -1803,7 +1859,7 @@ static void pnv_phb4_root_port_class_init(ObjectClass *klass, void *data)
>>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
>>>       dc->desc     = "IBM PHB4 PCIE Root Port";
>>> -    dc->user_creatable = false;
>>> +    dc->user_creatable = true;
>>>       device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
>>>                                       &rpc->parent_realize);
>>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>>> index 888ecbe8f3..0e67f3a338 100644
>>> --- a/hw/pci-host/pnv_phb4_pec.c
>>> +++ b/hw/pci-host/pnv_phb4_pec.c
>>> @@ -146,8 +146,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>>>       pec->num_phbs = pecc->num_phbs[pec->index];
>>>       /* Create PHBs if running with defaults */
>>> -    for (i = 0; i < pec->num_phbs; i++) {
>>> -        pnv_pec_default_phb_realize(pec, i, errp);
>>> +    if (defaults_enabled()) {
>>> +        for (i = 0; i < pec->num_phbs; i++) {
>>> +            pnv_pec_default_phb_realize(pec, i, errp);
>>> +        }
>>>       }
>>>       /* Initialize the XSCOM regions for the PEC registers */
>>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>>> index 3b0b230e49..697a2b5302 100644
>>> --- a/hw/ppc/pnv.c
>>> +++ b/hw/ppc/pnv.c
>>> @@ -2186,6 +2186,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>>>       pmc->compat = compat;
>>>       pmc->compat_size = sizeof(compat);
>>>       pmc->dt_power_mgt = pnv_dt_power_mgt;
>>> +
>>> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
>>>   }
>>>   static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)


