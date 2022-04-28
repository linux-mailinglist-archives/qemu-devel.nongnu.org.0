Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE93512A44
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 05:58:02 +0200 (CEST)
Received: from localhost ([::1]:46064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njvI2-0003wn-34
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 23:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1njvGI-0002Ye-4L; Wed, 27 Apr 2022 23:56:14 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1njvGG-0005WF-01; Wed, 27 Apr 2022 23:56:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id h12so3236529plf.12;
 Wed, 27 Apr 2022 20:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=j4q+g+6E3SrNK4mbzXa11UeHqPBZSfjSeJzGZAZ4RDs=;
 b=QJuPrRfJYfFP709dS+3fuZYfN1ufV7+gJOrkun54VciQCDS+hOaIgrR8sUTZAWPlVU
 1ZgRBRhX5lYE4zLOCpU4VCUhYfpUYG3/hQTeWXEPSIS5q//R1bFubPi2uD1B2ncWi6I4
 bnWfILkik2cl3RcV4xMZVeQDDZvtHmV3XEvR1dfuQRDUmhY5iKkCFgubBO453GzOvBUn
 3NL75r8zKMgr00VOMG+YHKZC2gEXWFIitwZgjCwKoKSzhhURZE2OhQMtY9Ko57aEGdNm
 Jmkgc+oyNIT//+jYt5kMN0qNUze2QQS7jpLZj5Fetxfneh23lNdfW7W4kec0jBI1sPOG
 JaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=j4q+g+6E3SrNK4mbzXa11UeHqPBZSfjSeJzGZAZ4RDs=;
 b=2UHXFukTnBP8idETd/opXpJ+/XzbwSkrOac1w+iiiXNHOuDuBkh6ogjHtTfcrb0yOH
 xu5yljcRKaZOAVtgQIQDtG5ZJQfOQ31ZGUGrIHA0gOStReIuYdJCG3HcnrhJoFKlMhAW
 pLtWwcLoHcCUDTDKxm3+eNoSnp2olJNxlSbV/m5RRNTKHL1rx2BdLKhXTMsUkX2LIvnm
 rafENuBooRqBYajGupNQIcm1SfXe4GMVwPmK9shBS+HJoyMBQQVEuJrz3QAELrwhxPn7
 9akqxseS9SzXWmtQfDdu1uZ1uKHiFsjQabNeTuQ63gzLsuEh4ZQBny8o8A0xIMgrRVAj
 mqmw==
X-Gm-Message-State: AOAM533ySyMPRoOluSasF6gV/PZFnPg2pJ9x+GkPAouFerEHluKGBnl4
 9BbwBbDWiQHg/WCJbZFnO/I=
X-Google-Smtp-Source: ABdhPJxykmNL0EJt05Pjgk4gJQF2yJQZaZiqPYzLLNg3NVBej6l/Y1UuvRF2Mp8gCN+Pb8jEzV0uHg==
X-Received: by 2002:a17:902:d2c4:b0:15d:391c:5a71 with SMTP id
 n4-20020a170902d2c400b0015d391c5a71mr10913922plc.94.1651118168760; 
 Wed, 27 Apr 2022 20:56:08 -0700 (PDT)
Received: from localhost (193-116-105-54.tpgi.com.au. [193.116.105.54])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a63b553000000b003c14af50616sm828038pgo.46.2022.04.27.20.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 20:56:07 -0700 (PDT)
Date: Thu, 28 Apr 2022 13:56:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
 <33285ea7-8dba-3e24-d241-0ff541a83b12@eldorado.org.br>
 <1650503031.93xsvzlip3.astroid@bobo.none>
In-Reply-To: <1650503031.93xsvzlip3.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1651115246.n474cs6g92.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Nicholas Piggin's message of April 21, 2022 12:04 pm:
> Excerpts from Leandro Lupori's message of April 21, 2022 4:09 am:
>> On 4/18/22 17:22, C=C3=A9dric Le Goater wrote:
>>> On 4/18/22 21:10, Leandro Lupori wrote:
>>>> Add semihosting support for PPC64. This implementation is
>>>> based on the standard for ARM semihosting version 2.0, as
>>>> implemented by QEMU and documented in
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 https://github.com/ARM-software/abi-aa/releas=
es
>>>>
>>>> The PPC64 specific differences are the following:
>>>>
>>>> Semihosting Trap Instruction: sc 7
>>>> Operation Number Register: r3
>>>> Parameter Register: r4
>>>> Return Register: r3
>>>> Data block field size: 64 bits
>>>=20
>>> 'sc' is a good way to implement semi hosting but we should make sure
>>> that it is not colliding with future extensions, at least with the
>>> next POWERPC processor. Is that the case ? if not, then the lev could
>>> be reserved.
>>>=20
>>=20
>> Power ISA 3.1B says that LEV values greater that 2 are reserved.
>> Level 2 is the ultravisor, so I assumed that level 7 was far enough from=
=20
>> current max level. I don't know if POWER11 will introduce new privilege=20
>> levels. Is this info publicly available somewhere? Or do you have a=20
>> better level in mind to use instead?
>=20
> It's not available but there are no plans to use LEV=3D7.
>=20
> It would be fine in practice I think, but it's kind of ugly and not=20
> great precedent -- how would we find out all the projects which use=20
> reserved instructions or values for something? Nominally the onus is on=20
> the software to accept breakage, but in reality important software that
> breaks causes a headache for the ISA.
>=20
> IBM's systemsim emulator actually has an instruction to call out to the=20
> emulator to do various things like IO. It uses the opcode
>=20
>   .long 0x000eaeb0
>=20
> That is the primary op 0 reserved space, and there is actually another=20
> op 'attn' or 'sp_attn' there which IBM CPUs implement, it is similar in=20
> spirit (it calls out to the service processor and/or chip error handling=20
> system to deal with a condition out-of-band). You don't want to use attn=20
> here because the core under emulation might implement it, I'm just=20
> noting the precedent with similar functionality under this primary=20
> opcode.
>=20
> So I think the systemsim emulator instruction should be a good choice.=20
> But it should really be documented. I will bring this up at the Open=20
> Power ISA working group meeting next week and see what the options are=20
> with getting it formally allocated for semihosting emulators (or what=20
> the alternatives are).

Update on the ISA TWG meeting

Semihosting was well received, the idea is not so new so I think it was
easily understood by attendees.

There were no objections to allocating a new opcode for this purpose.
The preference was a new opcode rather than using a reserved sc LEV
value.

The primary opcode 0 space is possibly unsuitable because it is said
to be "allocated to specific purposes that are outside the scope of the
Power ISA." whereas I think we want a first class instruction for this,
it may have implementation-dependent behaviour but on processors that
do not implement it, we would like it to have well-defined behaviour.

So we can probably just pick an opcode and submit a patch RFC to the
ISA (I can try help with that). First, there are a few questions to
resolve:

- What behaviour do we want for CPUs which do not implement it or
  disable it? E.g., no-op or illegal instruction interrupt. Ideally
  we would choose an opcode such that the architecture is compatible
  with existing CPUs.

- Would it be useful for KVM to implement semihosting support for
  guests on hard processors?

- Is there value in an endian-agnostic instruction? (Assuming we can
  find one). This question only comes to me because our BMC gdbserver
  for debugging the host CPUs implements breakpoints by inserting an
  'attn' instruction in the host code, and that does not work if the
  host switches endian. Any possibility the semihosting instruction
  would ever be injected out-of-band? Seems not so likely.

There were also some thoughts about bringing the semihosting spec
under the Open Power group but that's outside the scope of the ISA
group. This may be a possibility we could consider but I think for
now it should be enough to document it like riscv and put it
somewhere (even in the QEMU tree should be okay for now IMO).

Thanks,
Nick

