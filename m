Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AD48E894
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:51:07 +0100 (CET)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KAl-0002Z8-1E
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:51:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K21-0001eI-2Y
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:42:05 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:55869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8K1x-0008CT-Nw
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:42:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.108])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E79DB2195A;
 Fri, 14 Jan 2022 10:41:54 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 11:41:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0063c6a274e-480c-49b5-835c-2d827fd84f21,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7245b1c9-fcf6-215c-a40e-bc79ce53fb5f@kaod.org>
Date: Fri, 14 Jan 2022 11:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 08/17] ppc/pnv: change pnv_pec_stk_update_map() to use
 PnvPHB4
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-9-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220113192952.911188-9-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2b722ad9-f3fd-409e-a67a-64a8372e9543
X-Ovh-Tracer-Id: 6012868453405658080
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
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
> stack->nest_regs_mr wasn't migrated to PnvPHB4 together with phb->nest_regs[] in
> the previous patch. We were unable to cleanly convert its write MemoryRegionOps,
> pnv_pec_stk_nest_xscom_write(), to use PnvPHB4 instead of PnvPhb4PecStack due to
> pnv_pec_stk_update_map() using a stack. Thing is, we're now able to convert
> pnv_pec_stk_update_map() because of what the did in previous patch.
> 
> The need for this intermediate step is a good example of the interconnected
> relationship between stack and phb that we aim to cleanup.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 916a7a3cf0..0f4464ec67 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -893,10 +893,10 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
>       pnv_phb4_check_all_mbt(phb);
>   }
>   
> -static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
> +static void pnv_pec_stk_update_map(PnvPHB4 *phb)
>   {
> +    PnvPhb4PecStack *stack = phb->stack;
>       PnvPhb4PecState *pec = stack->pec;
> -    PnvPHB4 *phb = stack->phb;
>       MemoryRegion *sysmem = get_system_memory();
>       uint64_t bar_en = phb->nest_regs[PEC_NEST_STK_BAR_EN];
>       uint64_t bar, mask, size;
> @@ -1046,7 +1046,7 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
>           break;
>       case PEC_NEST_STK_BAR_EN:
>           phb->nest_regs[reg] = val & 0xf000000000000000ull;
> -        pnv_pec_stk_update_map(stack);
> +        pnv_pec_stk_update_map(phb);
>           break;
>       case PEC_NEST_STK_DATA_FRZ_TYPE:
>       case PEC_NEST_STK_PBCQ_TUN_BAR:
> 


