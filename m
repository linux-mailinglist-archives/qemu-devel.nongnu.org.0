Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F1511C79
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:01:14 +0200 (CEST)
Received: from localhost ([::1]:60030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njl2P-0007nD-V7
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njkxW-00021V-Mx
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:56:10 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:33775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njkxU-0004wO-Ew
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:56:10 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9459EFAB4314;
 Wed, 27 Apr 2022 18:55:58 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 18:55:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006cca409a7-ecbc-4d55-af56-8b6555aec0cd,
 17BF23367636C0D6DAFD61CED3DAD67CB3096C97) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <29f741e1-ece3-c87a-3347-e63b5a237e09@kaod.org>
Date: Wed, 27 Apr 2022 18:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] ppc/xive: Always recompute the PIPR when pushing an
 OS context
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220427160223.96758-1-fbarrat@linux.ibm.com>
 <20220427160223.96758-2-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220427160223.96758-2-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 795161e1-7799-41ce-b806-c20f34aa3ec3
X-Ovh-Tracer-Id: 8475211552807947171
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
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
Cc: npiggin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 18:02, Frederic Barrat wrote:
> The Post Interrupt Priority Register (PIPR) is not restored like the
> other OS-context related fields of the TIMA when pushing an OS context
> on the CPU. It's not needed because it can be calculated from the
> Interrupt Pending Buffer (IPB), which is saved and restored. The PIPR
> must therefore always be recomputed when pushing an OS context.
> 
> This patch fixes a path on P9 and P10 where it was not done. If there
> was a pending interrupt when the OS context was pulled, the IPB was
> saved correctly. When pushing back the context, the code in
> xive_tctx_need_resend() was checking for a interrupt raised while the
> context was not on the CPU, saved in the NVT. If one was found, then
> it was merged with the saved IPB and the PIPR updated and everything
> was fine. However, if there was no interrupt found in the NVT, then
> xive_tctx_ipb_update() was not being called and the PIPR was not
> updated. This patch fixes it by always calling xive_tctx_ipb_update().
> 
> Note that on P10 (xive2.c) and because of the above, there's no longer
> any need to check the CPPR value so it can go away.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

One small comment below,


> ---
>   hw/intc/xive.c  | 10 +++++++---
>   hw/intc/xive2.c | 15 ++++++++-------
>   2 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index b8e4c7294d..6b62918ea7 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -413,10 +413,14 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
>           /* Reset the NVT value */
>           nvt.w4 = xive_set_field32(NVT_W4_IPB, nvt.w4, 0);
>           xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
> -
> -        /* Merge in current context */
> -        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>       }
> +    /*
> +     * Always call xive_tctx_ipb_update(). Even if there's no
> +     * escalation found in the NVT above, 

The NVT does not contain an escalation. It contains saved state
of the registers, among which the IPB representing the pending
interrupt priorities.

I would say something like:

     Even if there were no escalation triggered, there could be a
     pending interrupt which was saved when the context was pulled and
     that we need to take into account by recalculating the PIPR (which
     is not saved/restored).


Same below.

Thanks,

C.


>         there could be a pending
> +     * interrupt which was saved when the context was pulled and we
> +     * need the recalculate the PIPR (which is not saved/restored).
> +     */
> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>   }
>   
>   /*
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index 3aff42a69e..2c62f68444 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -316,7 +316,6 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>   {
>       Xive2Nvp nvp;
>       uint8_t ipb;
> -    uint8_t cppr = 0;
>   
>       /*
>        * Grab the associated thread interrupt context registers in the
> @@ -337,7 +336,7 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>       /* Automatically restore thread context registers */
>       if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE &&
>           do_restore) {
> -        cppr = xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
> +        xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
>       }
>   
>       ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2);
> @@ -345,11 +344,13 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>           nvp.w2 = xive_set_field32(NVP2_W2_IPB, nvp.w2, 0);
>           xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
>       }
> -
> -    /* An IPB or CPPR change can trigger a resend */
> -    if (ipb || cppr) {
> -        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
> -    }
> +    /*
> +     * Always call xive_tctx_ipb_update(). Even if there's no
> +     * escalation found in the NVT above, there could be a pending
> +     * interrupt which was saved when the context was pulled and we
> +     * need the recalculate the PIPR (which is not saved/restored).
> +     */
> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>   }
>   
>   /*


