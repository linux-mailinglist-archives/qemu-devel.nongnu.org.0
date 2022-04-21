Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF9B5097B2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:35:07 +0200 (CEST)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQPA-0001He-Iu
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nhQCR-0001f8-PE
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:21:57 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nhQCO-0005j9-Oz
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:21:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5C22022927;
 Thu, 21 Apr 2022 06:21:48 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Apr
 2022 08:21:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0029ebe9ab1-996a-4700-a097-793a5da38074,
 FFC778467988C6DD564F10F4CBD504D71298CE84) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ce881a8c-4026-1cbc-a4d7-02bedbd4b030@kaod.org>
Date: Thu, 21 Apr 2022 08:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
 <33285ea7-8dba-3e24-d241-0ff541a83b12@eldorado.org.br>
 <1650503031.93xsvzlip3.astroid@bobo.none>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1650503031.93xsvzlip3.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ee51de90-3d21-438a-876b-d19f3b9c50dc
X-Ovh-Tracer-Id: 17869157422388382642
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrtddugddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 04:04, Nicholas Piggin wrote:
> Excerpts from Leandro Lupori's message of April 21, 2022 4:09 am:
>> On 4/18/22 17:22, Cédric Le Goater wrote:
>>> On 4/18/22 21:10, Leandro Lupori wrote:
>>>> Add semihosting support for PPC64. This implementation is
>>>> based on the standard for ARM semihosting version 2.0, as
>>>> implemented by QEMU and documented in
>>>>
>>>>       https://github.com/ARM-software/abi-aa/releases
>>>>
>>>> The PPC64 specific differences are the following:
>>>>
>>>> Semihosting Trap Instruction: sc 7
>>>> Operation Number Register: r3
>>>> Parameter Register: r4
>>>> Return Register: r3
>>>> Data block field size: 64 bits
>>>
>>> 'sc' is a good way to implement semi hosting but we should make sure
>>> that it is not colliding with future extensions, at least with the
>>> next POWERPC processor. Is that the case ? if not, then the lev could
>>> be reserved.
>>>
>>
>> Power ISA 3.1B says that LEV values greater that 2 are reserved.
>> Level 2 is the ultravisor, so I assumed that level 7 was far enough from
>> current max level. I don't know if POWER11 will introduce new privilege
>> levels. Is this info publicly available somewhere? Or do you have a
>> better level in mind to use instead?
> 
> It's not available but there are no plans to use LEV=7.
> 
> It would be fine in practice I think, but it's kind of ugly and not
> great precedent -- how would we find out all the projects which use
> reserved instructions or values for something? Nominally the onus is on
> the software to accept breakage, but in reality important software that
> breaks causes a headache for the ISA.
> 
> IBM's systemsim emulator actually has an instruction to call out to the
> emulator to do various things like IO. It uses the opcode
> 
>    .long 0x000eaeb0
> 
> That is the primary op 0 reserved space, and there is actually another
> op 'attn' or 'sp_attn' there which IBM CPUs implement, it is similar in
> spirit (it calls out to the service processor and/or chip error handling
> system to deal with a condition out-of-band). You don't want to use attn
> here because the core under emulation might implement it, I'm just
> noting the precedent with similar functionality under this primary
> opcode.
> 
> So I think the systemsim emulator instruction should be a good choice.

yeah. It's not a major change.

> But it should really be documented. I will bring this up at the Open
> Power ISA working group meeting next week and see what the options are
> with getting it formally allocated for semihosting emulators (or what
> the alternatives are).

It would be nice to invite Leandro to this meeting since he started
implementing.

Thanks,

C.


