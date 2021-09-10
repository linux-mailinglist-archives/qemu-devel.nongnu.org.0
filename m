Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02912407241
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 22:03:27 +0200 (CEST)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOmk9-00075m-ME
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 16:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmeH-0007ia-0F; Fri, 10 Sep 2021 15:57:21 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:44591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmeF-0007GT-4x; Fri, 10 Sep 2021 15:57:20 -0400
Received: by mail-qt1-x829.google.com with SMTP id r21so2541942qtw.11;
 Fri, 10 Sep 2021 12:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OO9VQQO0aYfO6CGS2HwL6b375HeevYQSUi2vQ1E0gE8=;
 b=EQm8sBwh7wTSFYM3oSk4UnNqNdH8a9QFtrCI9OCsMhUTj35SQmOSQtAuvfluE6pWR3
 FC+5+1Zh7Tmsosr24ZTdegDyvIhtHMarAmNSkKSOJcN/4HsxbE+fyG7gOXejAmW28N2m
 USek49r07DbEmp22dNppuxb8BxCrUhU+Bjg+aiq0Qg8bFd+cA18BlDlXRFFFj/SiRsOn
 p04N0QXQaPzjczhR1K5Z713o206ddomgQDxkJR1+u9DEU7G928lmiDhDjUMyhcvHb3ft
 i17mNlWQgerJnurZQAE4Pm5Wn0iTJaFCmofQQXskdsjgMAPmB5WuZGMWoAt+hO09pb25
 XkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OO9VQQO0aYfO6CGS2HwL6b375HeevYQSUi2vQ1E0gE8=;
 b=gq2CXQrcpGYXU9tB0kZ+/QsWwcuJHPE4vTqA29HWVFffC2Jqa2U9C/jy7nnYG387px
 jJb0TSBGwuJgO7qGOGmI65tk9VxTT5oeulWImk0+krdJyDVO16+6QpKzTkBoY+0LY5ST
 q9UBLtaAk0sEUs0rhV21M3XHOqJgBzEGRGX0JfjX24mC3ckTj+j98M9SDKrIAdwWduTO
 Bp/RniBM19VfJfXoqS+D66o2cIpejg70/ae6o4S4PYkT8jYJSjDkplIXfRH8G0JC9eJG
 3wE44o4XAa5vuo6BJ0w6lbdIdF9garUN/urMDe2QYMg6NsNZIVZ0LWFHJNVE8tAVj/tM
 o4Yw==
X-Gm-Message-State: AOAM532Z1tE5n66Y5R73dvrLS9DPCVkvtx8NNreLYmgRmHutI1N1w7xT
 9LQlI4oen+rgVtmeIHElRcUIQ5rsprk=
X-Google-Smtp-Source: ABdhPJxz8rTUZcVbVfRARzfKIc2GcdrcSIMPCSIBGjcaKZzkNNX+hLAuSOcBoXI12dSNezbPl14r8w==
X-Received: by 2002:ac8:7245:: with SMTP id l5mr9594528qtp.206.1631303837657; 
 Fri, 10 Sep 2021 12:57:17 -0700 (PDT)
Received: from [192.168.10.222] ([191.193.98.206])
 by smtp.gmail.com with ESMTPSA id x8sm3654459qts.69.2021.09.10.12.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 12:57:17 -0700 (PDT)
Subject: Re: [PATCH v5 1/4] spapr: move NUMA associativity init to machine
 reset
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210907002527.412013-1-danielhb413@gmail.com>
 <20210907002527.412013-2-danielhb413@gmail.com> <YTa0RzbdvfSQZy9+@yekko>
 <20210907091013.3882663b@bahia.lan> <YTcvn7qSqz7zaT1d@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <29af2df8-99d1-e5ac-1290-21fe35613c6f@gmail.com>
Date: Fri, 10 Sep 2021 16:57:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTcvn7qSqz7zaT1d@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.349,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 6:23 AM, David Gibson wrote:
> On Tue, Sep 07, 2021 at 09:10:13AM +0200, Greg Kurz wrote:
>> On Tue, 7 Sep 2021 10:37:27 +1000
>> David Gibson <david@gibson.dropbear.id.au> wrote:
>>
>>> On Mon, Sep 06, 2021 at 09:25:24PM -0300, Daniel Henrique Barboza wrote:
>>>> At this moment we only support one form of NUMA affinity, FORM1. This
>>>> allows us to init the internal structures during machine_init(), and
>>>> given that NUMA distances won't change during the guest lifetime we
>>>> don't need to bother with that again.
>>>>
>>>> We're about to introduce FORM2, a new NUMA affinity mode for pSeries
>>>> guests. This means that we'll only be certain about the affinity mode
>>>> being used after client architecture support. This also means that the
>>>> guest can switch affinity modes in machine reset.
>>>>
>>>> Let's prepare the ground for the FORM2 support by moving the NUMA
>>>> internal data init from machine_init() to machine_reset(). Change the
>>>> name to spapr_numa_associativity_reset() to make it clearer that this is
>>>> a function that can be called multiple times during the guest lifecycle.
>>>> We're also simplifying its current API since this method will be called
>>>> during CAS time (do_client_architecture_support()) later on and there's no
>>>> MachineState pointer already solved there.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>
>>> Applied to ppc-for-6.2, thanks.
>>>
>>
>> Even if already applied :
>>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Added, thanks.


I'm afraid this patch was deprecated by the new patch series I just posted.


Thanks,


Daniel

> 
>>>> ---
>>>>   hw/ppc/spapr.c              | 6 +++---
>>>>   hw/ppc/spapr_numa.c         | 4 ++--
>>>>   include/hw/ppc/spapr_numa.h | 9 +--------
>>>>   3 files changed, 6 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>>> index d39fd4e644..8e1ff6cd10 100644
>>>> --- a/hw/ppc/spapr.c
>>>> +++ b/hw/ppc/spapr.c
>>>> @@ -1621,6 +1621,9 @@ static void spapr_machine_reset(MachineState *machine)
>>>>        */
>>>>       spapr_irq_reset(spapr, &error_fatal);
>>>>   
>>>> +    /* Reset numa_assoc_array */
>>>> +    spapr_numa_associativity_reset(spapr);
>>>> +
>>>>       /*
>>>>        * There is no CAS under qtest. Simulate one to please the code that
>>>>        * depends on spapr->ov5_cas. This is especially needed to test device
>>>> @@ -2808,9 +2811,6 @@ static void spapr_machine_init(MachineState *machine)
>>>>   
>>>>       spapr->gpu_numa_id = spapr_numa_initial_nvgpu_numa_id(machine);
>>>>   
>>>> -    /* Init numa_assoc_array */
>>>> -    spapr_numa_associativity_init(spapr, machine);
>>>> -
>>>>       if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
>>>>           ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
>>>>                                 spapr->max_compat_pvr)) {
>>>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>>>> index 779f18b994..9ee4b479fe 100644
>>>> --- a/hw/ppc/spapr_numa.c
>>>> +++ b/hw/ppc/spapr_numa.c
>>>> @@ -155,10 +155,10 @@ static void spapr_numa_define_associativity_domains(SpaprMachineState *spapr)
>>>>   
>>>>   }
>>>>   
>>>> -void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>>> -                                   MachineState *machine)
>>>> +void spapr_numa_associativity_reset(SpaprMachineState *spapr)
>>>>   {
>>>>       SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
>>>> +    MachineState *machine = MACHINE(spapr);
>>>>       int nb_numa_nodes = machine->numa_state->num_nodes;
>>>>       int i, j, max_nodes_with_gpus;
>>>>       bool using_legacy_numa = spapr_machine_using_legacy_numa(spapr);
>>>> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
>>>> index 6f9f02d3de..0e457bba57 100644
>>>> --- a/include/hw/ppc/spapr_numa.h
>>>> +++ b/include/hw/ppc/spapr_numa.h
>>>> @@ -16,14 +16,7 @@
>>>>   #include "hw/boards.h"
>>>>   #include "hw/ppc/spapr.h"
>>>>   
>>>> -/*
>>>> - * Having both SpaprMachineState and MachineState as arguments
>>>> - * feels odd, but it will spare a MACHINE() call inside the
>>>> - * function. spapr_machine_init() is the only caller for it, and
>>>> - * it has both pointers resolved already.
>>>> - */
>>>> -void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>>> -                                   MachineState *machine);
>>>
>>> Nice additional cleanup to the signature, thanks.
>>>
>>>> +void spapr_numa_associativity_reset(SpaprMachineState *spapr);
>>>>   void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
>>>>   void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
>>>>                                          int offset, int nodeid);
>>>
>>
> 
> 
> 

