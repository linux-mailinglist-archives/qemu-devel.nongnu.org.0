Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253846B933
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:32:37 +0100 (CET)
Received: from localhost ([::1]:40298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXlz-0005Wx-CR
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:32:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXkF-0004LT-19
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:30:47 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:57399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXkA-0003uJ-WD
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:30:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DE16F202CB;
 Tue,  7 Dec 2021 10:30:38 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 11:30:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00149676afe-9069-4b30-90ee-67ff331c10d6,
 D5B34436B48CBBE29FDE786D5871FA4E32D79878) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8d653c1f-c2c0-4a03-8fdd-ed5945fa09e4@kaod.org>
Date: Tue, 7 Dec 2021 11:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 13/14] ppc/pnv: Move realize of PEC stacks under the PEC
 model
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-14-clg@kaod.org>
 <5dd72325-89b9-bcbf-a0fe-db76c3bd0acf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <5dd72325-89b9-bcbf-a0fe-db76c3bd0acf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9baa4793-00b1-472e-8bee-48a5540fb625
X-Ovh-Tracer-Id: 4021151519660280739
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeehgddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 11:10, Frederic Barrat wrote:
> 
> 
> On 02/12/2021 15:42, Cédric Le Goater wrote:
>> This change will help us providing support for user created PHB4
>> devices.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/pci-host/pnv_phb4_pec.c | 36 ++++++++++++++++++++++++++++++++----
>>   hw/ppc/pnv.c               | 31 +------------------------------
>>   2 files changed, 33 insertions(+), 34 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index dfed2af0f7df..9b081d543057 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -556,6 +556,10 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>>   {
>>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
>>       PnvPhb4PecState *pec = stack->pec;
>> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>> +    PnvChip *chip = pec->chip;
>> +    uint32_t pec_nest_base;
>> +    uint32_t pec_pci_base;
>>       char name[64];
>>       assert(pec);
>> @@ -579,10 +583,34 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>>       pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
>>                             &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
>> -    /*
>> -     * Let the machine/chip realize the PHB object to customize more
>> -     * easily some fields
>> -     */
>> +    {
>> +        Object *obj = OBJECT(&stack->phb);
>> +
>> +        object_property_set_int(obj, "chip-id", pec->chip_id, &error_fatal);
>> +        object_property_set_int(obj, "version", pecc->version, &error_fatal);
>> +        object_property_set_int(obj, "device-id", pecc->device_id,
>> +                                &error_fatal);
>> +        object_property_set_link(obj, "stack", OBJECT(stack),
>> +                                 &error_abort);
>> +        if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
>> +            return;
>> +        }
>> +    }
> 
> 
> Do we really need the extra sub-scope here? It looks off.

No. That's a left over from the initial patches I worked on.

>> +
>> +    pec_nest_base = pecc->xscom_nest_base(pec);
>> +    pec_pci_base = pecc->xscom_pci_base(pec);
>> +
>> +    /* Populate the XSCOM address space. */
>> +    pnv_xscom_add_subregion(chip,
>> +                            pec_nest_base + 0x40 * (stack->stack_no + 1),
>> +                            &stack->nest_regs_mr);
>> +    pnv_xscom_add_subregion(chip,
>> +                            pec_pci_base + 0x40 * (stack->stack_no + 1),
>> +                            &stack->pci_regs_mr);
>> +    pnv_xscom_add_subregion(chip,
>> +                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
>> +                            0x40 * stack->stack_no,
>> +                            &stack->phb_regs_mr);
>>   }
>>   static Property pnv_pec_stk_properties[] = {
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 3a550eed0f36..7e13b15241fd 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1370,7 +1370,7 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
>>   static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>>   {
> 
> 
> With that change, we should really rename pnv_chip_power9_phb_realize() to pnv_chip_power9_pec_realize().

yes.

Thanks,

C.


> 
>    Fred
> 
> 
>>       Pnv9Chip *chip9 = PNV9_CHIP(chip);
>> -    int i, j;
>> +    int i;
>>       for (i = 0; i < chip->num_pecs; i++) {
>>           PnvPhb4PecState *pec = &chip9->pecs[i];
>> @@ -1392,35 +1392,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>>           pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
>>           pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
>> -
>> -        for (j = 0; j < pec->num_stacks; j++) {
>> -            PnvPhb4PecStack *stack = &pec->stacks[j];
>> -            Object *obj = OBJECT(&stack->phb);
>> -
>> -            object_property_set_int(obj, "chip-id", chip->chip_id,
>> -                                    &error_fatal);
>> -            object_property_set_int(obj, "version", pecc->version,
>> -                                    &error_fatal);
>> -            object_property_set_int(obj, "device-id", pecc->device_id,
>> -                                    &error_fatal);
>> -            object_property_set_link(obj, "stack", OBJECT(stack),
>> -                                     &error_abort);
>> -            if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
>> -                return;
>> -            }
>> -
>> -            /* Populate the XSCOM address space. */
>> -            pnv_xscom_add_subregion(chip,
>> -                                   pec_nest_base + 0x40 * (stack->stack_no + 1),
>> -                                   &stack->nest_regs_mr);
>> -            pnv_xscom_add_subregion(chip,
>> -                                    pec_pci_base + 0x40 * (stack->stack_no + 1),
>> -                                    &stack->pci_regs_mr);
>> -            pnv_xscom_add_subregion(chip,
>> -                                    pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
>> -                                    0x40 * stack->stack_no,
>> -                                    &stack->phb_regs_mr);
>> -        }
>>       }
>>   }
>>


