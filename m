Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58B1514337
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 09:23:51 +0200 (CEST)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkKyk-0001Wb-Hy
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 03:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nkKud-0005yO-Hu
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:19:36 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:50057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nkKub-00024s-Nv
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:19:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 51CA620196;
 Fri, 29 Apr 2022 07:19:32 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 29 Apr
 2022 09:19:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001f8583236-0221-42e4-b7aa-5e854bd63020,
 1982172603CD300670E0C9FF2D13DF7DB182EA3E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <da7242c2-25f3-41cd-0d43-f3a3be5b0f31@kaod.org>
Date: Fri, 29 Apr 2022 09:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] ppc/xive: Always recompute the PIPR when pushing
 an OS context
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220429071620.177142-1-fbarrat@linux.ibm.com>
 <20220429071620.177142-2-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220429071620.177142-2-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d7f206e2-d7c6-4315-92e1-296ff22768b5
X-Ovh-Tracer-Id: 10485505833511521187
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudekgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/29/22 09:16, Frederic Barrat wrote:
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

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks for the update,

C.

> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>   hw/intc/xive.c  | 11 ++++++++---
>   hw/intc/xive2.c | 16 +++++++++-------
>   2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index b8e4c7294d..c729f6a478 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -413,10 +413,15 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
>           /* Reset the NVT value */
>           nvt.w4 = xive_set_field32(NVT_W4_IPB, nvt.w4, 0);
>           xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
> -
> -        /* Merge in current context */
> -        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>       }
> +    /*
> +     * Always call xive_tctx_ipb_update(). Even if there were no
> +     * escalation triggered, there could be a pending interrupt which
> +     * was saved when the context was pulled and that we need to take
> +     * into account by recalculating the PIPR (which is not
> +     * saved/restored).
> +     */
> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>   }
>   
>   /*
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index 3aff42a69e..400fd70aa8 100644
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
> @@ -345,11 +344,14 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>           nvp.w2 = xive_set_field32(NVP2_W2_IPB, nvp.w2, 0);
>           xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
>       }
> -
> -    /* An IPB or CPPR change can trigger a resend */
> -    if (ipb || cppr) {
> -        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
> -    }
> +    /*
> +     * Always call xive_tctx_ipb_update(). Even if there were no
> +     * escalation triggered, there could be a pending interrupt which
> +     * was saved when the context was pulled and that we need to take
> +     * into account by recalculating the PIPR (which is not
> +     * saved/restored).
> +     */
> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>   }
>   
>   /*


