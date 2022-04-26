Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A350FD3F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:41:16 +0200 (CEST)
Received: from localhost ([::1]:35596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKVF-0005wE-Ar
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njKPm-0002H4-B7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 08:35:34 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:51647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njKPj-00048W-DQ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 08:35:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.68])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5201D253E1;
 Tue, 26 Apr 2022 12:35:27 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 26 Apr
 2022 14:35:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002222b9158-ad7d-47c6-86e9-3ef97fbcc359,
 3FBBB1319C2D251FFC8CAEB6A5358CF0CB11FF25) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c3277f60-a64e-44a8-fb13-529bdb12cc41@kaod.org>
Date: Tue, 26 Apr 2022 14:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ppc/xive: Save/restore state of the External interrupt
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220426101125.297064-1-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220426101125.297064-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 41155a1a-686d-4c8f-a4db-847c3385a3f5
X-Ovh-Tracer-Id: 16649244873284684707
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hello Frederic,

On 4/26/22 12:11, Frederic Barrat wrote:
> When pulling an OS context from a vcpu, we should lower the External
> interrupt if it is pending. Otherwise, it may be delivered in the
> hypervisor context, which is unexpected. It can lead to an infinite
> loop where the hypervisor catches the External exception, looks for an
> interrupt, doesn't find any, exits the exception handler, repeat...

Nice ! I have been chasing this one for a while and couldn't corner it.

Setting an environment for this scenario is a bit painful. I had a
pseries disk image including a nested guest for it. Depending on the
need, I would run the image under KVM (for updates) or under QEMU
PowerNV for dev/tests.

I thne switched to a simpler buildroot env.

> It also means that when pushing a new OS context on a vcpu, we need to
> always check the restored Interrupt Pending Buffer (IPB), potentially
> merge it with any escalation interrupt, and re-apply the External
> interrupt signal if needed.

See below for a proposal to split this patch in 2 or 3 patches.

  
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
> 
> Cedric: I'm wondering the reason behind commit
> 8256870ada9379abfd1f5b2c209ad01092dd0904, which makes the PIPR field
> of the OS context read-only.

The comments is related to direct load/store on the TCTX registers.
When using the magic offsets, the logic is different.


> The comment says it is re-evaluated from
> the IPB when pushing a context, but I don't think it's true on P9
> if there's no escalation. It's not a problem on P10 because we always
> re-evaluate the PIPR if CPPR>0.
> In any case, it's no longer an issue with this patch, but I'm
> curious as to why restoring the PIPR was a problem in the first place.
> 
> 
>   hw/intc/xive.c        | 26 +++++++++++++++++++++++---
>   hw/intc/xive2.c       | 14 ++++++++------
>   include/hw/ppc/xive.h |  1 +
>   3 files changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index b8e4c7294d..8430db687f 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -114,6 +114,21 @@ static void xive_tctx_notify(XiveTCTX *tctx, uint8_t ring)
>       }
>   }
>   
> +void xive_tctx_eval_ext_signal(XiveTCTX *tctx)

I would call it xive_tctx_reset_os_signal()

> +{
> +    uint8_t *regs = &tctx->regs[TM_QW1_OS];
> +
> +    /*
> +     * Used when pulling an OS context.
> +     * Lower the External interrupt if it's pending. It is necessary
> +     * to avoid catching it in the hypervisor context. It should be
> +     * raised again when re-pushing the OS context.
> +     */
> +    if (regs[TM_PIPR] < regs[TM_CPPR]) {

This seems useless. Since we want the signal down always.

> +        qemu_irq_lower(xive_tctx_output(tctx, TM_QW1_OS));
> +    }
> +}
> +
>   static void xive_tctx_set_cppr(XiveTCTX *tctx, uint8_t ring, uint8_t cppr)
>   {
>       uint8_t *regs = &tctx->regs[ring];
> @@ -388,6 +403,8 @@ static uint64_t xive_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
>       /* Invalidate CAM line */
>       qw1w2_new = xive_set_field32(TM_QW1W2_VO, qw1w2, 0);
>       xive_tctx_set_os_cam(tctx, qw1w2_new);
> +
> +    xive_tctx_eval_ext_signal(tctx);


These change forcing the signal down when the OS context is pulled
should be in its own patch.

>       return qw1w2;
>   }
>   
> @@ -413,10 +430,13 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
>           /* Reset the NVT value */
>           nvt.w4 = xive_set_field32(NVT_W4_IPB, nvt.w4, 0);
>           xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
> -
> -        /* Merge in current context */
> -        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>       }
> +    /*
> +     * Always merge in current context. Even if there's no escalation,
> +     * it will check with the IPB value restored before pushing the OS
> +     * context and set the External interrupt signal if needed.
> +     */
> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);

That's another patch and I am not sure it is needed.

An IPB value is recorded in the NVT when an interrupt is delivered
while a vCPU is not dispatched. With this change, you would force
the update in any case when the context is pushed.

Is that to close a potential race window on an interrupt being
delivered to a vCPU just before it is dispatched by the HV ?

>   }
>   
>   /*
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index 3aff42a69e..b7f1917cd2 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -269,6 +269,7 @@ uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
>           xive2_tctx_save_os_ctx(xrtr, tctx, nvp_blk, nvp_idx);
>       }
>   
> +    xive_tctx_eval_ext_signal(tctx);
>       return qw1w2;
>   }
>   
> @@ -316,7 +317,6 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>   {
>       Xive2Nvp nvp;
>       uint8_t ipb;
> -    uint8_t cppr = 0;
>   
>       /*
>        * Grab the associated thread interrupt context registers in the
> @@ -337,7 +337,7 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>       /* Automatically restore thread context registers */
>       if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE &&
>           do_restore) {
> -        cppr = xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
> +        xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
>       }
>   
>       ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2);
> @@ -346,10 +346,12 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>           xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
>       }
>   
> -    /* An IPB or CPPR change can trigger a resend */
> -    if (ipb || cppr) {
> -        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
> -    }
> +    /*
> +     * Always merge in current context. Even if there's no escalation,
> +     * it will check with the IPB value restored and set the External
> +     * interrupt signal if needed.
> +     */
> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);


I guess this fine. The test on the cppr is just an optimisation, if I am
correct. But it needs to be in another patch.

Same previous comment for ibp.

Thanks,

C.

>   }
>   
>   /*
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 126e4e2c3a..91512ed5e6 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -527,6 +527,7 @@ Object *xive_tctx_create(Object *cpu, XivePresenter *xptr, Error **errp);
>   void xive_tctx_reset(XiveTCTX *tctx);
>   void xive_tctx_destroy(XiveTCTX *tctx);
>   void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb);
> +void xive_tctx_eval_ext_signal(XiveTCTX *tctx);
>   
>   /*
>    * KVM XIVE device helpers


