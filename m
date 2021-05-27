Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B83393736
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 22:33:40 +0200 (CEST)
Received: from localhost ([::1]:40676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmMhH-0006eK-8v
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 16:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lmMg1-0005zS-I4
 for qemu-devel@nongnu.org; Thu, 27 May 2021 16:32:21 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:46804
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lmMg0-0003ES-0O
 for qemu-devel@nongnu.org; Thu, 27 May 2021 16:32:21 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Frfcj6Kt5z8PbN;
 Thu, 27 May 2021 16:32:05 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=b3kw1bBYB
 OTLLTjNALDurybPcY0=; b=L0cQpWr+soaMuru02wnamLlVrClPw08s4H+65jYHF
 Rl1JpBRBuEOCW1vm321Joi1cq7e9awKJnN3trjYo14AxozbdGTaIaIoBkAPlg51C
 WfsNWFmVXbbojzDCm9v2TUstB7bWmjRyWRRKRlEZeb7+Pase0ob8wxZHZzJI5lD9
 lI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=HP9
 2ioSHZvyT6LqUMC+nxng2dB34vnae7s6Ohr3BAsXDNz8IJOw+15qcu8UFxthWf+x
 1yy6R3GYjtiQBqMKZVxoIqJwezCYHbeGNVn0+KFHzBkNrSMmTqQAN1ZUu59qIDmZ
 xr3UDNscKPJF7htKuHAogZekoC/0f0pZT0/8Oq6g=
Received: from [IPV6:2001:470:b0db:100:15c5:739:466:1026] (unknown
 [IPv6:2001:470:b0db:100:15c5:739:466:1026])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Frfcj4bQbz8PbK;
 Thu, 27 May 2021 16:32:05 -0400 (EDT)
Message-ID: <d6bda064-d46d-1188-c30d-c0888abf72d5@comstyle.com>
Date: Thu, 27 May 2021 16:32:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH] tcg/ppc: Fix building with Clang
Content-Language: en-US
From: Brad Smith <brad@comstyle.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <YH98WLDMQ5c0Zf5E@humpty.home.comstyle.com>
 <CAFEAcA995L--csz+fX4MqkSPTPxQ7Nx=q-Lh70bi_zQGoj54mw@mail.gmail.com>
 <1ebc5a66-2763-1379-24e0-774739f2edbe@linaro.org>
 <CAFEAcA9TaxkByWscOa2WC=o6fXAxaqAUt30CUsmA24jZ6HEYEA@mail.gmail.com>
 <4b7a580a-d701-f545-a8c2-5d18ea25a187@linaro.org>
 <f64963a3-6c13-a8b8-9591-2080dfd9f7ed@comstyle.com>
In-Reply-To: <f64963a3-6c13-a8b8-9591-2080dfd9f7ed@comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/2021 12:02 AM, Brad Smith wrote:

> On 4/22/2021 11:39 AM, Richard Henderson wrote:
>> On 4/22/21 2:20 AM, Peter Maydell wrote:
>>> On Thu, 22 Apr 2021 at 06:18, Richard Henderson
>>>> I'm thinking something like
>>>>
>>>> #if !defined(_CALL_SYSV) && \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !defined(_CALL_DARWIN) && \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !defined(_CALL_AIX) && \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !defined(_CALL_ELF)
>>>> # if defined(__APPLE__)
>>>> #=C2=A0 define _CALL_DARWIN
>>>> # elif defined(__ELF__) && TCG_TARGET_REG_BITS =3D=3D 32
>>>> #=C2=A0 define _CALL_SYSV
>>>> # else
>>>> #=C2=A0 error "Unknown ABI"
>>>> # endif
>>>> #endif
>>>
>>> Doesn't this also need some case that handles "64bit ppc clang which=20
>>> doesn't
>>> define _CALL_anything" ?
>>
>> Clang does define _CALL_ELF for ppc64:
>>
>> =C2=A0// ABI options.
>> =C2=A0if (ABI =3D=3D "elfv1")
>> =C2=A0=C2=A0 Builder.defineMacro("_CALL_ELF", "1");
>> =C2=A0if (ABI =3D=3D "elfv2")
>> =C2=A0=C2=A0 Builder.defineMacro("_CALL_ELF", "2");
>>
>
> Able to spin up a patch that you think is appropriate?

ping?

