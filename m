Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E27C5100F8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:52:19 +0200 (CEST)
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMY6-0004st-9A
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1njMVl-0003pP-HT; Tue, 26 Apr 2022 10:49:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1njMVj-0002la-7U; Tue, 26 Apr 2022 10:49:53 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QEgFBY014584;
 Tue, 26 Apr 2022 14:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=smh1Dw5OKZRQoAeLNUisDjGEfvRsoasdssuZUjIY1oM=;
 b=UDukZOXWxTGQKflDBHlxYqH3zAwsWC0ZzZI6GIWqDJ3SPW/R50fE5zJAivsSxLpy34gK
 QutTBVglVydolGht26EMbHjPZlabgEpA5N41iHCl0+570Oe/PDWP6U6CptSmjCW0iD4w
 M3pJe17LetRWH3LhEPKv6u7eaHaJp0U/ojVNZw/HeHcPxoM7PyHORlhhXYxafUUOS0gO
 LoN5IYUV+8L8txvurt4mrJrwfEIp0IeVdBTMxc6ZRXypqYVRha4DXB8STmBB9NNbq65I
 McXlIBEAUmXdw7mBUQ5iSfKAzZ6JzfDZ/IiYh/vKKb+yk1mG0d0AIY0r4suR5azbKlET dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpjqr85w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 14:49:40 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23QEgGc7014671;
 Tue, 26 Apr 2022 14:49:40 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpjqr85v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 14:49:40 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23QEmcDH005109;
 Tue, 26 Apr 2022 14:49:38 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3fm938uk8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 14:49:37 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23QEnZkB54591792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 14:49:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 507FE11C058;
 Tue, 26 Apr 2022 14:49:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5EDB11C052;
 Tue, 26 Apr 2022 14:49:34 +0000 (GMT)
Received: from [9.145.148.40] (unknown [9.145.148.40])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Apr 2022 14:49:34 +0000 (GMT)
Message-ID: <572f1365-7767-41cf-b8b2-3f17d1eaab7e@linux.ibm.com>
Date: Tue, 26 Apr 2022 16:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] ppc/xive: Save/restore state of the External interrupt
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, danielhb413@gmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220426101125.297064-1-fbarrat@linux.ibm.com>
 <c3277f60-a64e-44a8-fb13-529bdb12cc41@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <c3277f60-a64e-44a8-fb13-529bdb12cc41@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NklS9XUOLs1LoWyKj0vCgbgEkm5Fn8Uj
X-Proofpoint-GUID: QqoOKeUAhJIut6we8EOrpc4uioTEzSu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_04,2022-04-26_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260092
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello Cédric!

Thanks for the detail review!



On 26/04/2022 14:35, Cédric Le Goater wrote:
> Hello Frederic,
> 
> On 4/26/22 12:11, Frederic Barrat wrote:
>> When pulling an OS context from a vcpu, we should lower the External
>> interrupt if it is pending. Otherwise, it may be delivered in the
>> hypervisor context, which is unexpected. It can lead to an infinite
>> loop where the hypervisor catches the External exception, looks for an
>> interrupt, doesn't find any, exits the exception handler, repeat...
> 
> Nice ! I have been chasing this one for a while and couldn't corner it.
> 
> Setting an environment for this scenario is a bit painful. I had a
> pseries disk image including a nested guest for it. Depending on the
> need, I would run the image under KVM (for updates) or under QEMU
> PowerNV for dev/tests.
> 
> I thne switched to a simpler buildroot env.
> 
>> It also means that when pushing a new OS context on a vcpu, we need to
>> always check the restored Interrupt Pending Buffer (IPB), potentially
>> merge it with any escalation interrupt, and re-apply the External
>> interrupt signal if needed.
> 
> See below for a proposal to split this patch in 2 or 3 patches.


Agreed, I will resend splitting it.


>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>
>> Cedric: I'm wondering the reason behind commit
>> 8256870ada9379abfd1f5b2c209ad01092dd0904, which makes the PIPR field
>> of the OS context read-only.
> 
> The comments is related to direct load/store on the TCTX registers.
> When using the magic offsets, the logic is different.


OK and to summarize our discussion on this: the PIPR field is read-only 
because that is what the hardware says. Which means we need to make sure 
we *always* re-compute the PIPR when pushing an OS context, since it is 
not restored the same way as the other registers (mostly CPPR, IPB). 
More on that below.



>> The comment says it is re-evaluated from
>> the IPB when pushing a context, but I don't think it's true on P9
>> if there's no escalation. It's not a problem on P10 because we always
>> re-evaluate the PIPR if CPPR>0.
>> In any case, it's no longer an issue with this patch, but I'm
>> curious as to why restoring the PIPR was a problem in the first place.
>>
>>
>>   hw/intc/xive.c        | 26 +++++++++++++++++++++++---
>>   hw/intc/xive2.c       | 14 ++++++++------
>>   include/hw/ppc/xive.h |  1 +
>>   3 files changed, 32 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
>> index b8e4c7294d..8430db687f 100644
>> --- a/hw/intc/xive.c
>> +++ b/hw/intc/xive.c
>> @@ -114,6 +114,21 @@ static void xive_tctx_notify(XiveTCTX *tctx, 
>> uint8_t ring)
>>       }
>>   }
>> +void xive_tctx_eval_ext_signal(XiveTCTX *tctx)
> 
> I would call it xive_tctx_reset_os_signal()


OK


>> +{
>> +    uint8_t *regs = &tctx->regs[TM_QW1_OS];
>> +
>> +    /*
>> +     * Used when pulling an OS context.
>> +     * Lower the External interrupt if it's pending. It is necessary
>> +     * to avoid catching it in the hypervisor context. It should be
>> +     * raised again when re-pushing the OS context.
>> +     */
>> +    if (regs[TM_PIPR] < regs[TM_CPPR]) {
> 
> This seems useless. Since we want the signal down always.


Agreed the test is ugly though it works and avoid calling 
qemu_irq_lower() when it's not needed. I'll check whether qemu offers a 
way to test the state of a signal (which is what we really want) 
otherwise I'll always lower the signal unconditionnaly.


>> +        qemu_irq_lower(xive_tctx_output(tctx, TM_QW1_OS));
>> +    }
>> +}
>> +
>>   static void xive_tctx_set_cppr(XiveTCTX *tctx, uint8_t ring, uint8_t 
>> cppr)
>>   {
>>       uint8_t *regs = &tctx->regs[ring];
>> @@ -388,6 +403,8 @@ static uint64_t xive_tm_pull_os_ctx(XivePresenter 
>> *xptr, XiveTCTX *tctx,
>>       /* Invalidate CAM line */
>>       qw1w2_new = xive_set_field32(TM_QW1W2_VO, qw1w2, 0);
>>       xive_tctx_set_os_cam(tctx, qw1w2_new);
>> +
>> +    xive_tctx_eval_ext_signal(tctx);
> 
> 
> These change forcing the signal down when the OS context is pulled
> should be in its own patch.


OK


>>       return qw1w2;
>>   }
>> @@ -413,10 +430,13 @@ static void xive_tctx_need_resend(XiveRouter 
>> *xrtr, XiveTCTX *tctx,
>>           /* Reset the NVT value */
>>           nvt.w4 = xive_set_field32(NVT_W4_IPB, nvt.w4, 0);
>>           xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
>> -
>> -        /* Merge in current context */
>> -        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>>       }
>> +    /*
>> +     * Always merge in current context. Even if there's no escalation,
>> +     * it will check with the IPB value restored before pushing the OS
>> +     * context and set the External interrupt signal if needed.
>> +     */
>> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
> 
> That's another patch and I am not sure it is needed.
> 
> An IPB value is recorded in the NVT when an interrupt is delivered
> while a vCPU is not dispatched. With this change, you would force
> the update in any case when the context is pushed.
> 
> Is that to close a potential race window on an interrupt being
> delivered to a vCPU just before it is dispatched by the HV ?


Not quite, there's no race involved. Consider the following the scenario 
that I can hit fairly easily:

1. an External interrupt is raised while the guest is on the CPU. We now 
have IPB!=0 and PIPR!=0

2. the guest enters the interrupt handler but before it can ack the 
interrupt (special mmio read "TM_SPC_ACK_OS_REG"), another hypervisor 
interrupt is raised. For example the Hypervisor Decrementer (but I've 
also hit it with others). The hypervisor interrupt is delivered 
immediately in that case and forces a guest exit, so that the hypervisor 
can process the hypervisor interrupt. So we leave the guest and pull the 
OS context with IPB and PIPR!=0. That's the state which is saved, either 
by KVM (P9)) or by the hw (P10 with vp-save-restore).

3. Some time later, we enter the guest again and restore the interrupt 
state, either from KVM (P9) or automatically (P10). So we call:

xive_tm_push_os_ctx()
   --> xive_tctx_need_resend()

In xive_tctx_need_resend(), we check the NVT to see if we had an 
escalation. If we do, then we update the IPB and PIPR and we are fine.
But if we don't have an escalation, we don't call 
xive_tctx_ipb_update(). The IPB value will be correct because it was 
just restored, but we won't recompute the PIPR register.

So it seems to me that irrespective of the separate issue of 
lowering/raising the External interrupt signal when pulling/pushing an 
OS context, we already need to always go through xive_tctx_ipb_update() 
to recompute the PIPR (and it's agreed that's a reason enough to be a 
separate patch).

Now, if on top of that, we add the fact that we may need to raise the 
External interrupt signal when pushing an OS context, then calling 
xive_tctx_ipb_update() is our natural way of doing that. So that's a 
second reason where it helps.


> 
>>   }
>>   /*
>> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
>> index 3aff42a69e..b7f1917cd2 100644
>> --- a/hw/intc/xive2.c
>> +++ b/hw/intc/xive2.c
>> @@ -269,6 +269,7 @@ uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, 
>> XiveTCTX *tctx,
>>           xive2_tctx_save_os_ctx(xrtr, tctx, nvp_blk, nvp_idx);
>>       }
>> +    xive_tctx_eval_ext_signal(tctx);
>>       return qw1w2;
>>   }
>> @@ -316,7 +317,6 @@ static void xive2_tctx_need_resend(Xive2Router 
>> *xrtr, XiveTCTX *tctx,
>>   {
>>       Xive2Nvp nvp;
>>       uint8_t ipb;
>> -    uint8_t cppr = 0;
>>       /*
>>        * Grab the associated thread interrupt context registers in the
>> @@ -337,7 +337,7 @@ static void xive2_tctx_need_resend(Xive2Router 
>> *xrtr, XiveTCTX *tctx,
>>       /* Automatically restore thread context registers */
>>       if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE &&
>>           do_restore) {
>> -        cppr = xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, 
>> nvp_idx, &nvp);
>> +        xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
>>       }
>>       ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2);
>> @@ -346,10 +346,12 @@ static void xive2_tctx_need_resend(Xive2Router 
>> *xrtr, XiveTCTX *tctx,
>>           xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
>>       }
>> -    /* An IPB or CPPR change can trigger a resend */
>> -    if (ipb || cppr) {
>> -        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>> -    }
>> +    /*
>> +     * Always merge in current context. Even if there's no escalation,
>> +     * it will check with the IPB value restored and set the External
>> +     * interrupt signal if needed.
>> +     */
>> +    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
> 
> 
> I guess this fine. The test on the cppr is just an optimisation, if I am
> correct. But it needs to be in another patch.
> 
> Same previous comment for ibp.


The scenario I described above still stands on P10. In which case 
checking the CPPR value becomes a moot point if we always call 
xive_tctx_ipb_update(). And the compiler yells if it's unused.
Thanks!

   Fred


> 
> Thanks,
> 
> C.
> 
>>   }
>>   /*
>> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
>> index 126e4e2c3a..91512ed5e6 100644
>> --- a/include/hw/ppc/xive.h
>> +++ b/include/hw/ppc/xive.h
>> @@ -527,6 +527,7 @@ Object *xive_tctx_create(Object *cpu, 
>> XivePresenter *xptr, Error **errp);
>>   void xive_tctx_reset(XiveTCTX *tctx);
>>   void xive_tctx_destroy(XiveTCTX *tctx);
>>   void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb);
>> +void xive_tctx_eval_ext_signal(XiveTCTX *tctx);
>>   /*
>>    * KVM XIVE device helpers
> 

