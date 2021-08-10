Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08573E8650
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 01:09:15 +0200 (CEST)
Received: from localhost ([::1]:42478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDary-000478-Gh
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 19:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDaqy-0003GZ-5O; Tue, 10 Aug 2021 19:08:12 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDaqv-0007xs-PB; Tue, 10 Aug 2021 19:08:11 -0400
Received: by mail-pl1-x632.google.com with SMTP id d1so139813pll.1;
 Tue, 10 Aug 2021 16:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kmkUiixomTfFdsG4zU+t8MZolXDFzvasfN3LWlG447E=;
 b=TVOv7gaareAP9Fjc7nAnlmornFLwkZbvS4kNJecfkprcbnE04HPNUE7sfXb6EJzuR/
 XDONZRWBEK1I0UFOOlrblFM1vzodFkTbmSLmioFqmXtUaY/3MOu+cB1hbCag+jM4rXPx
 pOEuCRFFMEhYzMYcakC6DjxiEiRFfYOHb8zJlICaZ0K/0CO852PVEsH4nwUqODuAHCgk
 inQvd8E7KZChuYLBgs6XwdtNYs6O/sQ7Rv1qQUnRkzvMaOnVq3Hppx8/hr8J02btIOtY
 B4t0xwzo9KfQBSKosY5b6YWfZIR/OY44bXXo1Ix9HiFrJnoDj406CBEHraQTf63uq07Q
 zGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmkUiixomTfFdsG4zU+t8MZolXDFzvasfN3LWlG447E=;
 b=GBmcpZAgqJ5mV+f/W2pzuaARyPXyLYIaHy3cKH2hCFZmpXLYg5xPFHKGJuaMNLH7rw
 k4M0Q6yqGF3D2HeT7bEqeIqmPxOldn5RjkoySS/xwuKvTaIM/MdTHX7h+KL8488j5Gzl
 rya7SVmS15kd+8YB5X3hackxKY/TpIJ4WmDSwDE38q8+8gOD1Oxg7fWEdRVJ25BFvwSc
 oP2urftTM8eW58TwDdED4P1dKGx3Jt9Fl4ICgHruttHkNO9dxS7v0Nt7EN/CDHHwS0ae
 nebwkesZGfLs1zaDt5BOjwqHQiigZ0D5Oy/M3fQG1tTJhwxmeN+yUlJ5oIwQCbUPoh0S
 rbSg==
X-Gm-Message-State: AOAM533WuLvXaq+Wqh9VOJi0R5t4tbjs3BdEiMiNU/x8vCWMzC/5c5mx
 yjebgk1fgdA6cEmDeDm/gqQ=
X-Google-Smtp-Source: ABdhPJzsRHcLAPkfWDCZ+uTfmq836uHodGVXu/DQjxltKpUJEZ0CLCPsLTkb4e5afP57bRfymufGJQ==
X-Received: by 2002:a17:902:db08:b029:12c:4619:c643 with SMTP id
 m8-20020a170902db08b029012c4619c643mr1696329plx.26.1628636887991; 
 Tue, 10 Aug 2021 16:08:07 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id x24sm4160439pjk.43.2021.08.10.16.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 16:08:07 -0700 (PDT)
Subject: Re: [PATCH 06/19] target/ppc/pmu_book3s_helper: enable PMC1-PMC4
 events
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-7-danielhb413@gmail.com> <YRH1j9vNmgs71/Z6@yekko>
 <7a016dad-963c-c1b9-91dd-a383e8e5c743@gmail.com>
Message-ID: <1143001e-21ff-a8da-9e74-2720ff49145c@gmail.com>
Date: Tue, 10 Aug 2021 20:08:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7a016dad-963c-c1b9-91dd-a383e8e5c743@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=danielhb413@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/10/21 12:03 PM, Daniel Henrique Barboza wrote:
> 
> 
> On 8/10/21 12:42 AM, David Gibson wrote:
>> On Mon, Aug 09, 2021 at 10:10:44AM -0300, Daniel Henrique Barboza wrote:
>>> So far the PMU logic was using PMC5 for instruction counting (linux
>>> kernel PM_INST_CMPL) and PMC6 to count cycles (PM_CYC). We aren't using
>>> PMCs 1-4.
>>>
>>> Let's enable all PMCs to count these 2 events we already provide. The
>>> logic used to calculate PMC5 is now being provided by
>>> update_PMC_PM_INST_CMPL() and PMC6 logic is now implemented in
>>> update_PMC_PM_CYC().
>>>
>>> The enablement of these 2 events for all PMUs are done by using the
>>> Linux kernel definition of those events: 0x02 for PM_INST_CMPL and 0x1e
>>> for PM_CYC,
>>
>> I'm confused by this.  Surely the specific values here should be
>> defined by the hardware, not by Linux.
> 
> The hardware/PowerISA defines these events as follows for all counters:
> 
> 00 Disable events. (No events occur.)
> 01-BF Implementation-dependent
> C0-DF Reserved
> 
> And then hardware events defined by the ISA goes from E0 to FF. Each counter
> has a different set of hardware defined events in this range.
> 
> The Linux perf driver defines some events in the 'Implementation-dependent'
> area, allowing for events codes such as '0x02' to count instructions
> completed in PMC1 even though this event is not defined in the ISA for this
> PMC. I am assuming that the real hardware - at least the ones that IBM
> produces - does this mapping internally. I'll ask around to see if I find
> out whether it's the HW or some part of the Perf subsystem that I don't
> comprehend that are doing it.

The kernel guys confirmed that the HW is aware of the implementantion-dependent
Perf event codes that the Linux kernel uses. Also, by reading the kernel code it
is safe to say that this is true since Power7 at least.

What we can do here to play nicer with other non-IBM PowerPC chips, that might
not have the same implementation-dependent Perf events in the hardware, is to make
this mapping only for emulation of IBM processors. That way we can emulate these
events that IBM PMU implements while not making any assumptions for every other
PowerPC chip that implements Book3s.


Thanks,


Daniel


> 
> 
> I am not particularly happy about having to rely on 'implementation-dependent'
> fields that are defined by the Perf subsystem of Linux in the emulator
> code that should be OS-agnostic. Unfortunately, I didn't find any alternative
> to make the kernel operate this PMU implementation other than baking these
> event codes into the PMU logic.
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
>>
>>> all of those defined by specific bits in MMCR1 for each PMC.
>>> PMCs 1-4 relies on the correct event to be defined in MMCR1. PMC5 and
>>> PMC6 will count PM_INST_CMPL and PMC_CYC, respectively, regardless of
>>> MMCR1 setup.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   target/ppc/cpu.h               |  8 +++++
>>>   target/ppc/pmu_book3s_helper.c | 60 ++++++++++++++++++++++++++++++++--
>>>   2 files changed, 65 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>>> index 8cea8f2aca..afd9cd402b 100644
>>> --- a/target/ppc/cpu.h
>>> +++ b/target/ppc/cpu.h
>>> @@ -350,6 +350,14 @@ typedef struct ppc_v3_pate_t {
>>>   #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
>>>   #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
>>> +#define MMCR1_PMC1SEL_SHIFT (63 - 39)
>>> +#define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
>>> +#define MMCR1_PMC2SEL_SHIFT (63 - 47)
>>> +#define MMCR1_PMC2SEL PPC_BITMASK(40, 47)
>>> +#define MMCR1_PMC3SEL_SHIFT (63 - 55)
>>> +#define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
>>> +#define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
>>> +
>>>   /* LPCR bits */
>>>   #define LPCR_VPM0         PPC_BIT(0)
>>>   #define LPCR_VPM1         PPC_BIT(1)
>>> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
>>> index 0994531f65..99e62bd37b 100644
>>> --- a/target/ppc/pmu_book3s_helper.c
>>> +++ b/target/ppc/pmu_book3s_helper.c
>>> @@ -28,6 +28,56 @@ static uint64_t get_cycles(uint64_t insns)
>>>       return insns * 4;
>>>   }
>>> +static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
>>> +                                    uint64_t curr_icount)
>>> +{
>>> +    env->spr[sprn] += curr_icount - env->pmu_base_icount;
>>> +}
>>> +
>>> +static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
>>> +                              uint64_t curr_icount)
>>> +{
>>> +    uint64_t insns = curr_icount - env->pmu_base_icount;
>>> +    env->spr[sprn] += get_cycles(insns);
>>> +}
>>> +
>>> +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
>>> +                                        uint64_t curr_icount)
>>> +{
>>> +    int event;
>>> +
>>> +    switch (sprn) {
>>> +    case SPR_POWER_PMC1:
>>> +        event = MMCR1_PMC1SEL & env->spr[SPR_POWER_MMCR1];
>>> +        event = event >> MMCR1_PMC1SEL_SHIFT;
>>> +        break;
>>> +    case SPR_POWER_PMC2:
>>> +        event = MMCR1_PMC2SEL & env->spr[SPR_POWER_MMCR1];
>>> +        event = event >> MMCR1_PMC2SEL_SHIFT;
>>> +        break;
>>> +    case SPR_POWER_PMC3:
>>> +        event = MMCR1_PMC3SEL & env->spr[SPR_POWER_MMCR1];
>>> +        event = event >> MMCR1_PMC3SEL_SHIFT;
>>> +        break;
>>> +    case SPR_POWER_PMC4:
>>> +        event = MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
>>> +        break;
>>> +    default:
>>> +        return;
>>> +    }
>>> +
>>> +    switch (event) {
>>> +    case 0x2:
>>> +        update_PMC_PM_INST_CMPL(env, sprn, curr_icount);
>>> +        break;
>>> +    case 0x1E:
>>> +        update_PMC_PM_CYC(env, sprn, curr_icount);
>>> +        break;
>>> +    default:
>>> +        return;
>>> +    }
>>> +}
>>> +
>>>   /*
>>>    * Set all PMCs values after a PMU freeze via MMCR0_FC.
>>>    *
>>> @@ -37,10 +87,14 @@ static uint64_t get_cycles(uint64_t insns)
>>>   static void update_PMCs_on_freeze(CPUPPCState *env)
>>>   {
>>>       uint64_t curr_icount = get_insns();
>>> +    int sprn;
>>> +
>>> +    for (sprn = SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
>>> +        update_programmable_PMC_reg(env, sprn, curr_icount);
>>> +    }
>>> -    env->spr[SPR_POWER_PMC5] += curr_icount - env->pmu_base_icount;
>>> -    env->spr[SPR_POWER_PMC6] += get_cycles(curr_icount -
>>> -                                           env->pmu_base_icount);
>>> +    update_PMC_PM_INST_CMPL(env, SPR_POWER_PMC5, curr_icount);
>>> +    update_PMC_PM_CYC(env, SPR_POWER_PMC6, curr_icount);
>>>   }
>>>   void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>>

