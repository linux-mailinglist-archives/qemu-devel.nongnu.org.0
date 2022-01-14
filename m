Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDBB48E8DA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:07:19 +0100 (CET)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KQQ-0000g8-60
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:07:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K92-0001ri-Tz
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:49:21 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:50025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K90-0000mS-2C
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:49:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DE7CED7B97AF;
 Fri, 14 Jan 2022 11:49:16 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:49:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0064078567e-fa16-402e-b3a1-12de7c38b9be,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fd4cc88d-7f7d-840e-fab5-05407247158a@kaod.org>
Date: Fri, 14 Jan 2022 11:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 14/17] ppc/pnv: move default_phb_realize() to pec_realize()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-15-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-15-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 603a36f9-7d3a-44f3-9a5a-e6836b76bf3e
X-Ovh-Tracer-Id: 6137280393350515680
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> This is the last step before making the PEC device uses PHB4s directly.
> Move the current pnv_pec_stk_default_phb_realize() call to
> pec_realize(), renaming the function to pnv_pec_default_phb_realize(),
> and set the PHB attributes using the PEC object directly.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4_pec.c | 67 ++++++++++++++++++++------------------
>   1 file changed, 35 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 1de0eb9adc..3339e0ea3d 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -112,6 +112,32 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
>       .endianness = DEVICE_BIG_ENDIAN,
>   };
>   
> +static void pnv_pec_default_phb_realize(PnvPhb4PecStack *stack,
> +                                        int phb_number,
> +                                        Error **errp)
> +{
> +    PnvPhb4PecState *pec = stack->pec;
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    int phb_id = pnv_phb4_pec_get_phb_id(pec, phb_number);
> +
> +    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
> +
> +    object_property_set_int(OBJECT(stack->phb), "phb-number", phb_number,
> +                            &error_abort);
> +    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
> +                             &error_abort);
> +    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
> +                            &error_fatal);
> +    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
> +                            &error_fatal);
> +    object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
> +                            &error_fatal);
> +
> +    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
> +        return;
> +    }
> +}
> +
>   static void pnv_pec_instance_init(Object *obj)
>   {
>       PnvPhb4PecState *pec = PNV_PHB4_PEC(obj);
> @@ -144,6 +170,15 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>   
>           object_property_set_int(stk_obj, "stack-no", i, &error_abort);
>           object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
> +
> +        if (defaults_enabled()) {
> +            pnv_pec_default_phb_realize(stack, i, errp);
> +        }
> +
> +        /*
> +         * qdev gets angry if we don't realize 'stack' here, even
> +         * if stk_realize() is now empty.
> +         */
>           if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
>               return;
>           }
> @@ -276,40 +311,8 @@ static const TypeInfo pnv_pec_type_info = {
>       }
>   };
>   
> -static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
> -                                            Error **errp)
> -{
> -    PnvPhb4PecState *pec = stack->pec;
> -    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> -    int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
> -
> -    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
> -
> -    object_property_set_int(OBJECT(stack->phb), "phb-number", stack->stack_no,
> -                            &error_abort);
> -    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
> -                             &error_abort);
> -    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
> -                            &error_fatal);
> -    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
> -                            &error_fatal);
> -    object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
> -                            &error_fatal);
> -
> -    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
> -        return;
> -    }
> -}
> -
>   static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>   {
> -    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
> -
> -    if (!defaults_enabled()) {
> -        return;
> -    }
> -
> -    pnv_pec_stk_default_phb_realize(stack, errp);
>   }
>   
>   static Property pnv_pec_stk_properties[] = {
> 


