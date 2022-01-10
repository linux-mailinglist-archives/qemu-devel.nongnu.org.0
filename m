Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476FC489D02
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:02:22 +0100 (CET)
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6x7l-00079H-4b
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:02:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6x4C-0005hG-Uj
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:58:40 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:58451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6x4A-0004jQ-GP
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:58:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 34F9220CF8;
 Mon, 10 Jan 2022 15:58:36 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:58:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0012654b0da-0de3-460f-a4dc-27cb7bcffd18,
 A9D23E93096AF6ACD837C7DE23AD2D939339D7DC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <604d205b-fe92-a716-79d4-0a81d0bed572@kaod.org>
Date: Mon, 10 Jan 2022 16:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 05/10] pnv_phb4_pec.c: move phb4 properties setup to
 pec_realize()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220110143346.455901-1-danielhb413@gmail.com>
 <20220110143346.455901-6-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110143346.455901-6-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fdf9bd9e-8296-4533-9042-c8788736cecf
X-Ovh-Tracer-Id: 6317424380609006560
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
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

On 1/10/22 15:33, Daniel Henrique Barboza wrote:
> Previous patch added stack->phb->index handling in pec_realize() for
> specific reasons (phb->index is reliant on the stack index in
> pec->stacks[]).
> 
> Move pnv_phb4_set_stack_phb_props() from stk_realize() to pec_realize()
> to have a single spot in which we set PHB4 properties for the default
> created stack->phb. This will give us one less spot to worry about when
> introducing user creatable pnv-phb4s and having to deal with stack->phb
> being NULL depending on -nodefaults being set.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4_pec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 417fac4cef..d2851e8040 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -405,6 +405,7 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>            */
>           object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
>                                   &error_abort);
> +        pnv_phb4_set_stack_phb_props(stack, &stack->phb);

hmm, this is exposing the PHB under the PEC. I am not sure this is useful
anymore. I will think about it.

C.


>   
>           if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
>               return;
> @@ -576,7 +577,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>       pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
>                             &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
>   
> -    pnv_phb4_set_stack_phb_props(stack, &stack->phb);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
>           return;
>       }
> 


