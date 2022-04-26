Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7F25101DE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:26:01 +0200 (CEST)
Received: from localhost ([::1]:51338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njN4i-0006RS-Tj
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njN33-0005Yx-Ub
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:24:17 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:49943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njN2z-0000LV-TD
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:24:15 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.102])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A9B4FFA49B5B;
 Tue, 26 Apr 2022 17:24:10 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 26 Apr
 2022 17:24:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0057003acb9-19d8-4d9d-9252-47a98b118add,
 3FBBB1319C2D251FFC8CAEB6A5358CF0CB11FF25) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a033e970-a226-3d13-3c55-b443e43a1d06@kaod.org>
Date: Tue, 26 Apr 2022 17:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ppc/xive: Save/restore state of the External interrupt
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220426101125.297064-1-fbarrat@linux.ibm.com>
 <c3277f60-a64e-44a8-fb13-529bdb12cc41@kaod.org>
 <572f1365-7767-41cf-b8b2-3f17d1eaab7e@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <572f1365-7767-41cf-b8b2-3f17d1eaab7e@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e4c87983-6f1f-4714-9385-1257e5657f86
X-Ovh-Tracer-Id: 1052153465977998243
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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

>>> +{
>>> +    uint8_t *regs = &tctx->regs[TM_QW1_OS];
>>> +
>>> +    /*
>>> +     * Used when pulling an OS context.
>>> +     * Lower the External interrupt if it's pending. It is necessary
>>> +     * to avoid catching it in the hypervisor context. It should be
>>> +     * raised again when re-pushing the OS context.
>>> +     */
>>> +    if (regs[TM_PIPR] < regs[TM_CPPR]) {
>>
>> This seems useless. Since we want the signal down always.
> 
> Agreed the test is ugly though it works and avoid calling qemu_irq_lower() when it's not needed. I'll check whether qemu offers a way to test the state of a signal (which is what we really want) otherwise I'll always lower the signal unconditionnaly.

Not really, it's a function call. or test the NSR may be ?

Just lower it, I guess. I don't think this will impact much performance.

[ ... ]

>>>       return qw1w2;
>>>   }
>>> @@ -413,10 +430,13 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
>>>           /* Reset the NVT value */
>>>           nvt.w4 = xive_set_field32(NVT_W4_IPB, nvt.w4, 0);
>>>           xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
>>> -
>>> -        /* Merge in current context */
>>> -        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>>>       }
>>> +    /*
>>> +     * Always merge in current context. Even if there's no escalation,
>>> +     * it will check with the IPB value restored before pushing the OS
>>> +     * context and set the External interrupt signal if needed.
>>> +     */
>>> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>>
>> That's another patch and I am not sure it is needed.
>>
>> An IPB value is recorded in the NVT when an interrupt is delivered
>> while a vCPU is not dispatched. With this change, you would force
>> the update in any case when the context is pushed.
>>
>> Is that to close a potential race window on an interrupt being
>> delivered to a vCPU just before it is dispatched by the HV ?
> 
> 
> Not quite, there's no race involved. Consider the following the scenario that I can hit fairly easily:
> 
> 1. an External interrupt is raised while the guest is on the CPU. We now have IPB!=0 and PIPR!=0
> 
> 2. the guest enters the interrupt handler but before it can ack the interrupt (special mmio read "TM_SPC_ACK_OS_REG"), another hypervisor interrupt is raised. For example the Hypervisor Decrementer (but I've also hit it with others). The hypervisor interrupt is delivered immediately in that case and forces a guest exit, so that the hypervisor can process the hypervisor interrupt. So we leave the guest and pull the OS context with IPB and PIPR!=0. 
>
> That's the state which is saved, either by KVM (P9)) 

yes.

> or by the hw (P10 with vp-save-restore).

yes.
  
> 3. Some time later, we enter the guest again and restore the interrupt state, either from KVM (P9) or automatically (P10). So we call:
> 
> xive_tm_push_os_ctx()
>    --> xive_tctx_need_resend()
> 
> In xive_tctx_need_resend(), we check the NVT to see if we had an escalation. If we do, then we update the IPB and PIPR and we are fine.
> But if we don't have an escalation, we don't call xive_tctx_ipb_update(). The IPB value will be correct because it was just restored, but we won't recompute the PIPR register.

Indeed.

> So it seems to me that irrespective of the separate issue of lowering/raising the External interrupt signal when pulling/pushing an OS context, we already need to always go through xive_tctx_ipb_update() to recompute the PIPR (and it's agreed that's a reason enough to be a separate patch).

I think you just wrote the commit log :)

> Now, if on top of that, we add the fact that we may need to raise the External interrupt signal when pushing an OS context, then calling xive_tctx_ipb_update() is our natural way of doing that. So that's a second reason where it helps.

I would be interested to know if you can start an emulated QEMU PowerNV
system (2cpus) with a KVM guest (1 vcpu) and sustain some network load
host<->guest with a ping -f for instance.

Thanks,

C.


> 
>>
>>>   }
>>>   /*
>>> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
>>> index 3aff42a69e..b7f1917cd2 100644
>>> --- a/hw/intc/xive2.c
>>> +++ b/hw/intc/xive2.c
>>> @@ -269,6 +269,7 @@ uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
>>>           xive2_tctx_save_os_ctx(xrtr, tctx, nvp_blk, nvp_idx);
>>>       }
>>> +    xive_tctx_eval_ext_signal(tctx);
>>>       return qw1w2;
>>>   }
>>> @@ -316,7 +317,6 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>>>   {
>>>       Xive2Nvp nvp;
>>>       uint8_t ipb;
>>> -    uint8_t cppr = 0;
>>>       /*
>>>        * Grab the associated thread interrupt context registers in the
>>> @@ -337,7 +337,7 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>>>       /* Automatically restore thread context registers */
>>>       if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE &&
>>>           do_restore) {
>>> -        cppr = xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
>>> +        xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
>>>       }
>>>       ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2);
>>> @@ -346,10 +346,12 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>>>           xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
>>>       }
>>> -    /* An IPB or CPPR change can trigger a resend */
>>> -    if (ipb || cppr) {
>>> -        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>>> -    }
>>> +    /*
>>> +     * Always merge in current context. Even if there's no escalation,
>>> +     * it will check with the IPB value restored and set the External
>>> +     * interrupt signal if needed.
>>> +     */
>>> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>>
>>
>> I guess this fine. The test on the cppr is just an optimisation, if I am
>> correct. But it needs to be in another patch.
>>
>> Same previous comment for ibp.
> 
> 
> The scenario I described above still stands on P10. In which case checking the CPPR value becomes a moot point if we always call xive_tctx_ipb_update(). And the compiler yells if it's unused.
> Thanks!
> 
>    Fred
> 
> 
>>
>> Thanks,
>>
>> C.
>>
>>>   }
>>>   /*
>>> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
>>> index 126e4e2c3a..91512ed5e6 100644
>>> --- a/include/hw/ppc/xive.h
>>> +++ b/include/hw/ppc/xive.h
>>> @@ -527,6 +527,7 @@ Object *xive_tctx_create(Object *cpu, XivePresenter *xptr, Error **errp);
>>>   void xive_tctx_reset(XiveTCTX *tctx);
>>>   void xive_tctx_destroy(XiveTCTX *tctx);
>>>   void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb);
>>> +void xive_tctx_eval_ext_signal(XiveTCTX *tctx);
>>>   /*
>>>    * KVM XIVE device helpers
>>


