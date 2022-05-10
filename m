Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339175211BF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:07:33 +0200 (CEST)
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMmC-00020r-9w
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1noMNa-0004jD-Qk; Tue, 10 May 2022 05:42:08 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1noMNX-0003NJ-G3; Tue, 10 May 2022 05:42:06 -0400
Received: by mail-pl1-x633.google.com with SMTP id c11so16248083plg.13;
 Tue, 10 May 2022 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=m90pEvk5ytLURIvx3iC3LZ1tXnd/dAM+3a0dRgslfjk=;
 b=aaiJwkk9nFRk8TztUF4/NxIeLGO/2Se8mtsBXyGNlqQ/n3MlJIYrxYwavDCeKaiQB+
 Y2z2pHv72bFQqRiJrHWyqyXiGtx/4UKVvO5YhTtPSX02Lch9vJoTqs7OMvDYY+9h2EHi
 wAOqGQMY6AUPKE6Dz/HI9mpyMrDD1s1XizVZcsDmSKtITyZAMij86VPuatDreaNHNqnp
 cYE2IztSBonDsExohHcVMiQ19znEc2b0tHesjfci0+mw3gjTEgi3nqeuudqhH7+ZgbfE
 uGlhyysMkbTxh3qvvSd4rwbxCdxBA3oEUcS/ack3QcwH/wrF3y1d+70RYBKrF+8J+tws
 sW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=m90pEvk5ytLURIvx3iC3LZ1tXnd/dAM+3a0dRgslfjk=;
 b=b1tlo/4Aae/Foyw0mvqcRNHvlePam/nVxjF4wqManPsACPg6+q308GplxT+X3Ledkv
 fQ6vA7FsihrZ95ZkSWMKOdnWpfKc6cCgmTH6w8ccyhvQGvxAC0XC79WGSgY35hUyvxzY
 RfWnlGR9SCoWzwu+7uYjtMq1pjAR+VcaYsiyuULR7pW6fFhBPgmEG3IfT20wc2pGnr89
 D+JsSMxOJE+lrEKJ1x648fP2kC/l9uZ32vsVl9dlmzjcOo5pbsr4hEqVC6xL9DSin8vS
 g09Dj6/euC3aqxpPt+TN4dksaBY6K0/8Qp3JePS6D64+JXARvZ8DeSHh7wxDs8MEZ9si
 pUMg==
X-Gm-Message-State: AOAM531SwtMK20Vj/49EmjVRvo8R53AbD0ng0IDvueKeKVg67TTkbJQj
 pzOeL6cgXG9drSompttDdhc=
X-Google-Smtp-Source: ABdhPJyijCdMEY1cN7NItDhfNT0/FVbZlsuWMu4meLhNOqdx+d33hTxOaedk7uQyTR6CqpmEHNThkQ==
X-Received: by 2002:a17:90a:bf0a:b0:1db:d98d:7ce9 with SMTP id
 c10-20020a17090abf0a00b001dbd98d7ce9mr22124862pjs.155.1652175714457; 
 Tue, 10 May 2022 02:41:54 -0700 (PDT)
Received: from localhost (193-116-127-232.tpgi.com.au. [193.116.127.232])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f54200b0015e8d4eb264sm1548586plf.174.2022.05.10.02.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 02:41:53 -0700 (PDT)
Date: Tue, 10 May 2022 19:41:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, Fabiano Rosas
 <farosas@linux.ibm.com>, Leandro Lupori <leandro.lupori@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, pbonzini@redhat.com, richard.henderson@linaro.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
 <33285ea7-8dba-3e24-d241-0ff541a83b12@eldorado.org.br>
 <1650503031.93xsvzlip3.astroid@bobo.none>
 <1651115246.n474cs6g92.astroid@bobo.none> <87pmkuaa48.fsf@linux.ibm.com>
In-Reply-To: <87pmkuaa48.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1652174779.gy1afa2hre.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Fabiano Rosas's message of May 4, 2022 1:50 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Excerpts from Nicholas Piggin's message of April 21, 2022 12:04 pm:
>>> Excerpts from Leandro Lupori's message of April 21, 2022 4:09 am:
>>>> On 4/18/22 17:22, C=C3=A9dric Le Goater wrote:
>>>>> On 4/18/22 21:10, Leandro Lupori wrote:
>>>>>> Add semihosting support for PPC64. This implementation is
>>>>>> based on the standard for ARM semihosting version 2.0, as
>>>>>> implemented by QEMU and documented in
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 https://github.com/ARM-software/abi-aa/rele=
ases
>>>>>>
>>>>>> The PPC64 specific differences are the following:
>>>>>>
>>>>>> Semihosting Trap Instruction: sc 7
>>>>>> Operation Number Register: r3
>>>>>> Parameter Register: r4
>>>>>> Return Register: r3
>>>>>> Data block field size: 64 bits
>>>>>=20
>>>>> 'sc' is a good way to implement semi hosting but we should make sure
>>>>> that it is not colliding with future extensions, at least with the
>>>>> next POWERPC processor. Is that the case ? if not, then the lev could
>>>>> be reserved.
>>>>>=20
>>>>=20
>>>> Power ISA 3.1B says that LEV values greater that 2 are reserved.
>>>> Level 2 is the ultravisor, so I assumed that level 7 was far enough fr=
om=20
>>>> current max level. I don't know if POWER11 will introduce new privileg=
e=20
>>>> levels. Is this info publicly available somewhere? Or do you have a=20
>>>> better level in mind to use instead?
>>>=20
>>> It's not available but there are no plans to use LEV=3D7.
>>>=20
>>> It would be fine in practice I think, but it's kind of ugly and not=20
>>> great precedent -- how would we find out all the projects which use=20
>>> reserved instructions or values for something? Nominally the onus is on=
=20
>>> the software to accept breakage, but in reality important software that
>>> breaks causes a headache for the ISA.
>>>=20
>>> IBM's systemsim emulator actually has an instruction to call out to the=
=20
>>> emulator to do various things like IO. It uses the opcode
>>>=20
>>>   .long 0x000eaeb0
>>>=20
>>> That is the primary op 0 reserved space, and there is actually another=20
>>> op 'attn' or 'sp_attn' there which IBM CPUs implement, it is similar in=
=20
>>> spirit (it calls out to the service processor and/or chip error handlin=
g=20
>>> system to deal with a condition out-of-band). You don't want to use att=
n=20
>>> here because the core under emulation might implement it, I'm just=20
>>> noting the precedent with similar functionality under this primary=20
>>> opcode.
>>>=20
>>> So I think the systemsim emulator instruction should be a good choice.=20
>>> But it should really be documented. I will bring this up at the Open=20
>>> Power ISA working group meeting next week and see what the options are=20
>>> with getting it formally allocated for semihosting emulators (or what=20
>>> the alternatives are).
>>
>> Update on the ISA TWG meeting
>>
>> Semihosting was well received, the idea is not so new so I think it was
>> easily understood by attendees.
>>
>> There were no objections to allocating a new opcode for this purpose.
>> The preference was a new opcode rather than using a reserved sc LEV
>> value.
>>
>> The primary opcode 0 space is possibly unsuitable because it is said
>> to be "allocated to specific purposes that are outside the scope of the
>> Power ISA." whereas I think we want a first class instruction for this,
>> it may have implementation-dependent behaviour but on processors that
>> do not implement it, we would like it to have well-defined behaviour.
>>
>> So we can probably just pick an opcode and submit a patch RFC to the
>> ISA (I can try help with that). First, there are a few questions to
>> resolve:
>>
>> - What behaviour do we want for CPUs which do not implement it or
>>   disable it? E.g., no-op or illegal instruction interrupt. Ideally
>>   we would choose an opcode such that the architecture is compatible
>>   with existing CPUs.
>=20
> I think that since semihosting is not a one-shot thing it would be
> better to have it trap so that the "host" could remediate in some
> way. Or even carry on with servicing the semihosting anyway.

Yeah I think I agree, and semihosting code that is intended to compile
away or be dynamically disableable can implement that itself if
needed.

>=20
>> - Would it be useful for KVM to implement semihosting support for
>>   guests on hard processors?
>=20
> Are there any undesirable implications to using an instruction that
> traps to the HV? I'd say let's get it if we can but otherwise it's not a
> big deal.
>=20
> I had two use-cases in mind:
>=20
> 1) Improving our interactions with gdbstub and having the guest use
>    sys_exit to report some debugging events like watchpoints or
>    singlestep;
>=20
> 2) Bootstrapping with KVM. We had instances in the past of needing to
>    write guest code from scratch and having to rely solely in GDB for a
>    while before setting up the console.
>=20
> But I realise that these use-cases conflate semihosting with general
> debugging and regular PAPR features, respectively. So it might be a
> stretch.

I don't see downsides actually. A userspace can already induce some HV
interrupts.

So we can use any unallocated opcode, and in the specification we can=20
say processors which do not support the semihosting facility
should treat it as an illegal instruction. That means the spec is=20
backward compatible. It also gives you the trap to HV with HEAI=20
interrupt on existing processors so KVM can implement it for guests.

Maybe it's as simple as that?

>=20
>> - Is there value in an endian-agnostic instruction? (Assuming we can
>>   find one). This question only comes to me because our BMC gdbserver
>>   for debugging the host CPUs implements breakpoints by inserting an
>>   'attn' instruction in the host code, and that does not work if the
>>   host switches endian. Any possibility the semihosting instruction
>>   would ever be injected out-of-band? Seems not so likely.
>=20
> Semihosting requires some sort of register setup, I don't think having
> it done out-of-band would be practical. So we possibly don't need an
> endian-agnostic instruction.

Okay.

Thanks,
Nick

