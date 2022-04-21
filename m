Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45057509CF6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:58:04 +0200 (CEST)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTZb-0001Pq-Df
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nhTXy-0000NM-KM; Thu, 21 Apr 2022 05:56:22 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nhTXw-0005Ia-TF; Thu, 21 Apr 2022 05:56:22 -0400
Received: by mail-pl1-x632.google.com with SMTP id n18so4370933plg.5;
 Thu, 21 Apr 2022 02:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=/RDDa1VSTW4bms+13F+gbhYmzHxttJNSJlHOz7HaMtk=;
 b=Hv1fxBR9YqX+8QMCJgl6Sq5mbOjEeZC9uWb8FAkWlb65N2Lix2wuSm/3Jaf2G5OdEV
 9qiyWhXQ4jq2thnkaH0f4HaibaJpU3YzXqz22Q802coRkq2bUykix5Cp5mx2UIlGnxP1
 qP58ngYMMuvD7dd1KzYhojCpp+ZWNmXKx0nGnjXyCjSxhFlTGzx6FODTLyCNWiIsz2m0
 dZiI6cB7HD9On05MdBF8edmAIxKKT7xG1cH3Sq6oB5ImOISyFf5czspvLnXsUr/ZXCnO
 8ZRT57PrjaQhMm6BPlJvbEZEpEUEB7wLVGtn0In+epCp+tImaPCT/M1Nx4fx9YZO56Hx
 1Njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=/RDDa1VSTW4bms+13F+gbhYmzHxttJNSJlHOz7HaMtk=;
 b=pMyeruYHWfG6atn2X3IIqFQbgdkBSJG5ZiQvJsahh+s/dLZf2i99dfhYl8OLCV4TLa
 LktSPUKOf5h0JzGCnXv/mNYQn7jNV7g94RgqS3EWMcIcRdDUjTAiQ+WuYFZ8hKwbEStQ
 5fDcgNtr5Cab6CE9V34+oIGQtk5FR3i+NI6Pb1gVE17SvrYU99gpuqJNh0HUPArAnvKN
 71ro3c2s43HY6y1N1icfeyBxdKsvJ6sYt9EPc/fR88mvBQHYmxgwcr3EXmYguA9K7SvZ
 2TPyp5ifjWBoCxXvWjr1OyHXJEkoMVdUpDoR7V7unACrYV/vNdu2fEwucVzUqcxq3xFE
 4+3w==
X-Gm-Message-State: AOAM531qUP+enHIB6dHCfbPdWaYjGq+pozslVvtVXd5i35oGGYngFiso
 ojHOso2B9C9VPy2K+ITqStk=
X-Google-Smtp-Source: ABdhPJxUA8qWthBCMZoy2pJozSbfm8qJ9XAqoVRWNNKQSy6+VSHw7/ZvqvKptXAFY/hPniruLteznA==
X-Received: by 2002:a17:90a:fac:b0:1ca:5eb8:f3b2 with SMTP id
 41-20020a17090a0fac00b001ca5eb8f3b2mr9476492pjz.37.1650534979231; 
 Thu, 21 Apr 2022 02:56:19 -0700 (PDT)
Received: from localhost (193-116-116-20.tpgi.com.au. [193.116.116.20])
 by smtp.gmail.com with ESMTPSA id
 k198-20020a633dcf000000b003aa9116ba17sm1564255pga.35.2022.04.21.02.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 02:56:18 -0700 (PDT)
Date: Thu, 21 Apr 2022 19:56:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
 <33285ea7-8dba-3e24-d241-0ff541a83b12@eldorado.org.br>
 <1650503031.93xsvzlip3.astroid@bobo.none>
 <ce881a8c-4026-1cbc-a4d7-02bedbd4b030@kaod.org>
In-Reply-To: <ce881a8c-4026-1cbc-a4d7-02bedbd4b030@kaod.org>
MIME-Version: 1.0
Message-Id: <1650534596.079peivvwl.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x632.google.com
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

Excerpts from C=C3=A9dric Le Goater's message of April 21, 2022 4:21 pm:
> On 4/21/22 04:04, Nicholas Piggin wrote:
>> Excerpts from Leandro Lupori's message of April 21, 2022 4:09 am:
>>> On 4/18/22 17:22, C=C3=A9dric Le Goater wrote:
>>>> On 4/18/22 21:10, Leandro Lupori wrote:
>>>>> Add semihosting support for PPC64. This implementation is
>>>>> based on the standard for ARM semihosting version 2.0, as
>>>>> implemented by QEMU and documented in
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 https://github.com/ARM-software/abi-aa/rele=
ases
>>>>>
>>>>> The PPC64 specific differences are the following:
>>>>>
>>>>> Semihosting Trap Instruction: sc 7
>>>>> Operation Number Register: r3
>>>>> Parameter Register: r4
>>>>> Return Register: r3
>>>>> Data block field size: 64 bits
>>>>
>>>> 'sc' is a good way to implement semi hosting but we should make sure
>>>> that it is not colliding with future extensions, at least with the
>>>> next POWERPC processor. Is that the case ? if not, then the lev could
>>>> be reserved.
>>>>
>>>
>>> Power ISA 3.1B says that LEV values greater that 2 are reserved.
>>> Level 2 is the ultravisor, so I assumed that level 7 was far enough fro=
m
>>> current max level. I don't know if POWER11 will introduce new privilege
>>> levels. Is this info publicly available somewhere? Or do you have a
>>> better level in mind to use instead?
>>=20
>> It's not available but there are no plans to use LEV=3D7.
>>=20
>> It would be fine in practice I think, but it's kind of ugly and not
>> great precedent -- how would we find out all the projects which use
>> reserved instructions or values for something? Nominally the onus is on
>> the software to accept breakage, but in reality important software that
>> breaks causes a headache for the ISA.
>>=20
>> IBM's systemsim emulator actually has an instruction to call out to the
>> emulator to do various things like IO. It uses the opcode
>>=20
>>    .long 0x000eaeb0
>>=20
>> That is the primary op 0 reserved space, and there is actually another
>> op 'attn' or 'sp_attn' there which IBM CPUs implement, it is similar in
>> spirit (it calls out to the service processor and/or chip error handling
>> system to deal with a condition out-of-band). You don't want to use attn
>> here because the core under emulation might implement it, I'm just
>> noting the precedent with similar functionality under this primary
>> opcode.
>>=20
>> So I think the systemsim emulator instruction should be a good choice.
>=20
> yeah. It's not a major change.
>=20
>> But it should really be documented. I will bring this up at the Open
>> Power ISA working group meeting next week and see what the options are
>> with getting it formally allocated for semihosting emulators (or what
>> the alternatives are).
>=20
> It would be nice to invite Leandro to this meeting since he started
> implementing.

Good point. I'll organize with him offline.

Thanks,
Nick

