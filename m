Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1937648E8D7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:06:05 +0100 (CET)
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KPE-0007Ka-8A
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:06:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8KCJ-0007NI-Lx
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:52:43 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:44399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8KCE-0001Mf-Oi
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:52:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.162])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D94F722040;
 Fri, 14 Jan 2022 10:52:36 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:52:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0057ac16c9e-0e7e-4a8e-b173-a9da5ee11b0c,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8d43f1c6-18b1-77ee-8f07-031295aa595b@kaod.org>
Date: Fri, 14 Jan 2022 11:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 15/17] ppc/pnv: convert pec->stacks[] into pec->phbs[]
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-16-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-16-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: abebb0d5-9f9a-47bc-b1db-e77afb6c6479
X-Ovh-Tracer-Id: 6193575388382661600
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/22 20:29, Daniel Henrique Barboza wrote:
> This patch changes the design of the PEC device to use PHB4s instead of
> PecStacks. After all the recent changes, PHB4s now contain all the
> information needed for their proper functioning, not relying on PecStack
> in any capacity.
> 
> All changes are being made in a single patch to avoid renaming parts of
> the PecState and leaving the code in a strange way. E.g. rename
> PecClass->num_stacks to num_phbs, which would then read a
> pnv_pec_num_stacks[] array. To avoid mixing the old and new design more
> than necessary it's clearer to do these changes in a single step.
> 
> The name changes made are:
> 
> - in PnvPhb4PecState, rename PHB4_PEC_MAX_STACKS to PHB4_PEC_MAX_PHBS,
> 'num_stacks' to 'num_phbs' and convert "PnvPhb4PecStack
> stacks[PHB4_PEC_MAX_STACKS]" to "PnvPHB4 *phbs[PHB4_PEC_MAX_PHBS]";
> 
> - in PnvPhb4PecClass, rename *num_stacks to *num_phbs;
> 
> - pnv_pec_num_stacks[] is renamed to pnv_pec_num_phbs[].
> 
> The logical changes:
> 
> - pnv_pec_default_phb_realize():
>    * init the PnvPHB4 qdev and assign it to the corresponding
> pec->phbs[phb_number];
>    * do not use stack->phb anymore;
> 
> - pnv_pec_realize():
>    * use the new default_phb_realize() to init/realize each PHB if
> running with defaults;
> 
> - pnv_pec_instance_init(): removed since we're creating the PHBs during
> pec_realize();
> 
> - pnv_phb4_get_stack():
>    * renamed to pnv_phb4_get_pec() and returns a PnvPhb4PecState*;
>    * assign the right pec->phbs[] pointer to the phb;
>    * set 'phb_number' of the PHB given that the information is already
> available;
> 
> - pnv_phb4_realize(): use 'phb->pec' instead of 'stack'.
> 
> This design change shouldn't caused any behavioral change in the runtime
> of the machine.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c         | 31 +++++++--------
>   hw/pci-host/pnv_phb4_pec.c     | 71 ++++++++++------------------------
>   include/hw/pci-host/pnv_phb4.h | 10 ++---
>   3 files changed, 40 insertions(+), 72 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 25b4248776..a9ec42ce2c 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1360,7 +1360,7 @@ int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index)
>       int offset = 0;
>   
>       while (index--) {
> -        offset += pecc->num_stacks[index];
> +        offset += pecc->num_phbs[index];
>       }
>   
>       return offset + stack_index;
> @@ -1510,8 +1510,8 @@ static void pnv_phb4_instance_init(Object *obj)
>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
>   }
>   
> -static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
> -                                           Error **errp)
> +static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
> +                                         Error **errp)
>   {
>       Pnv9Chip *chip9 = PNV9_CHIP(chip);
>       int chip_id = phb->chip_id;
> @@ -1520,14 +1520,19 @@ static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
>   
>       for (i = 0; i < chip->num_pecs; i++) {
>           /*
> -         * For each PEC, check the amount of stacks it supports
> -         * and see if the given phb4 index matches a stack.
> +         * For each PEC, check the amount of phbs it supports
> +         * and see if the given phb4 index matches an index.
>            */
>           PnvPhb4PecState *pec = &chip9->pecs[i];
>   
> -        for (j = 0; j < pec->num_stacks; j++) {
> +        for (j = 0; j < pec->num_phbs; j++) {
>               if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
> -                return &pec->stacks[j];
> +                pec->phbs[j] = phb;
> +
> +                /* Set phb-number now since we already have it */
> +                object_property_set_int(OBJECT(phb), "phb-number",
> +                                               j, &error_abort);
> +                return pec;
>               }
>           }
>       }
> @@ -1552,7 +1557,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       if (!phb->pec) {
>           PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>           PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
> -        PnvPhb4PecStack *stack;
>           PnvPhb4PecClass *pecc;
>           BusState *s;
>   
> @@ -1561,23 +1565,16 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>   
> -        stack = pnv_phb4_get_stack(chip, phb, &local_err);
> +        phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
>           if (local_err) {
>               error_propagate(errp, local_err);
>               return;
>           }
>   
> -        /*
> -         * All other phb properties but 'pec', 'version' and
> -         * 'phb-number' are already set.
> -         */
> -        object_property_set_link(OBJECT(phb), "pec", OBJECT(stack->pec),
> -                                 &error_abort);
> +        /* All other phb properties are already set */
>           pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
>           object_property_set_int(OBJECT(phb), "version", pecc->version,
>                                   &error_fatal);
> -        object_property_set_int(OBJECT(phb), "phb-number",
> -                                stack->stack_no, &error_abort);
>   
>           /*
>            * Reparent user created devices to the chip to build
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 3339e0ea3d..61d7add25a 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -112,40 +112,29 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
>       .endianness = DEVICE_BIG_ENDIAN,
>   };
>   
> -static void pnv_pec_default_phb_realize(PnvPhb4PecStack *stack,
> +static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>                                           int phb_number,
>                                           Error **errp)
>   {
> -    PnvPhb4PecState *pec = stack->pec;
> +    PnvPHB4 *phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
>       PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, phb_number);
>   
> -    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
> -
> -    object_property_set_int(OBJECT(stack->phb), "phb-number", phb_number,
> +    object_property_set_int(OBJECT(phb), "phb-number", phb_number,
>                               &error_abort);
> -    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
> +    object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
>                                &error_abort);
> -    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
> +    object_property_set_int(OBJECT(phb), "chip-id", pec->chip_id,
>                               &error_fatal);
> -    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
> +    object_property_set_int(OBJECT(phb), "index", phb_id,
>                               &error_fatal);
> -    object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
> +    object_property_set_int(OBJECT(phb), "version", pecc->version,
>                               &error_fatal);
>   
> -    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
> -        return;
> -    }
> -}
> -
> -static void pnv_pec_instance_init(Object *obj)
> -{
> -    PnvPhb4PecState *pec = PNV_PHB4_PEC(obj);
> -    int i;
> +    pec->phbs[phb_number] = phb;
>   
> -    for (i = 0; i < PHB4_PEC_MAX_STACKS; i++) {
> -        object_initialize_child(obj, "stack[*]", &pec->stacks[i],
> -                                TYPE_PNV_PHB4_PEC_STACK);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
> +        return;
>       }
>   }
>   
> @@ -161,30 +150,13 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    pec->num_stacks = pecc->num_stacks[pec->index];
> -
> -    /* Create stacks */
> -    for (i = 0; i < pec->num_stacks; i++) {
> -        PnvPhb4PecStack *stack = &pec->stacks[i];
> -        Object *stk_obj = OBJECT(stack);
> -
> -        object_property_set_int(stk_obj, "stack-no", i, &error_abort);
> -        object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
> +    pec->num_phbs = pecc->num_phbs[pec->index];
>   
> -        if (defaults_enabled()) {
> -            pnv_pec_default_phb_realize(stack, i, errp);
> +    /* Create PHBs if running with defaults */
> +    if (defaults_enabled()) {
> +        for (i = 0; i < pec->num_phbs; i++) {
> +            pnv_pec_default_phb_realize(pec, i, errp);
>           }
> -
> -        /*
> -         * qdev gets angry if we don't realize 'stack' here, even
> -         * if stk_realize() is now empty.
> -         */
> -        if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
> -            return;
> -        }
> -    }
> -    for (; i < PHB4_PEC_MAX_STACKS; i++) {
> -        object_unparent(OBJECT(&pec->stacks[i]));
>       }
>   
>       /* Initialize the XSCOM regions for the PEC registers */
> @@ -230,7 +202,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>       _FDT((fdt_setprop(fdt, offset, "compatible", pecc->compat,
>                         pecc->compat_size)));
>   
> -    for (i = 0; i < pec->num_stacks; i++) {
> +    for (i = 0; i < pec->num_phbs; i++) {
>           int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
>           int stk_offset;
>   
> @@ -266,11 +238,11 @@ static uint32_t pnv_pec_xscom_nest_base(PnvPhb4PecState *pec)
>   }
>   
>   /*
> - * PEC0 -> 1 stack
> - * PEC1 -> 2 stacks
> - * PEC2 -> 3 stacks
> + * PEC0 -> 1 phb
> + * PEC1 -> 2 phb
> + * PEC2 -> 3 phbs
>    */
> -static const uint32_t pnv_pec_num_stacks[] = { 1, 2, 3 };
> +static const uint32_t pnv_pec_num_phbs[] = { 1, 2, 3 };
>   
>   static void pnv_pec_class_init(ObjectClass *klass, void *data)
>   {
> @@ -295,14 +267,13 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>       pecc->stk_compat = stk_compat;
>       pecc->stk_compat_size = sizeof(stk_compat);
>       pecc->version = PNV_PHB4_VERSION;
> -    pecc->num_stacks = pnv_pec_num_stacks;
> +    pecc->num_phbs = pnv_pec_num_phbs;
>   }
>   
>   static const TypeInfo pnv_pec_type_info = {
>       .name          = TYPE_PNV_PHB4_PEC,
>       .parent        = TYPE_DEVICE,
>       .instance_size = sizeof(PnvPhb4PecState),
> -    .instance_init = pnv_pec_instance_init,
>       .class_init    = pnv_pec_class_init,
>       .class_size    = sizeof(PnvPhb4PecClass),
>       .interfaces    = (InterfaceInfo[]) {
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 90eb4575f8..170de2e752 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -206,10 +206,10 @@ struct PnvPhb4PecState {
>       uint64_t pci_regs[PHB4_PEC_PCI_REGS_COUNT];
>       MemoryRegion pci_regs_mr;
>   
> -    /* Stacks */
> -    #define PHB4_PEC_MAX_STACKS     3
> -    uint32_t num_stacks;
> -    PnvPhb4PecStack stacks[PHB4_PEC_MAX_STACKS];
> +    /* PHBs */
> +    #define PHB4_PEC_MAX_PHBS     3
> +    uint32_t num_phbs;
> +    PnvPHB4 *phbs[PHB4_PEC_MAX_PHBS];
>   
>       PnvChip *chip;
>   };
> @@ -227,7 +227,7 @@ struct PnvPhb4PecClass {
>       const char *stk_compat;
>       int stk_compat_size;
>       uint64_t version;
> -    const uint32_t *num_stacks;
> +    const uint32_t *num_phbs;
>   };
>   
>   #endif /* PCI_HOST_PNV_PHB4_H */
> 


