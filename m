Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18D83709CA
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 06:04:28 +0200 (CEST)
Received: from localhost ([::1]:53384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld3LH-00015L-EI
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 00:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ld3K4-0000fS-C2
 for qemu-devel@nongnu.org; Sun, 02 May 2021 00:03:12 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:36701
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ld3K2-00047e-Af
 for qemu-devel@nongnu.org; Sun, 02 May 2021 00:03:12 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4FXsvR3hgnz8PbN;
 Sun,  2 May 2021 00:05:07 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=QpnoGrpVz
 smc1GIxI9VZYmKt+QA=; b=VXuPPSkzWYIslGn54KtBpYewIOqbccI98Z0ww2rTb
 bC1hV/UW+nCoSGmuQJRYhHS1hAckEsFXMJJja+HjVxNH6DNKUv/g2qe4uRn9GyHY
 du1xRh5Cq+QaqwtU1ZtU1eTpxG7VJJSDpeM27UJUPtUajx0Iy2R60hb5m8MDHWI7
 io=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=FPh
 VpXZ2Jot679U6zVH6dEHV800dWGCIzPLtkfi999oH56GpSPLZBdgAE6Nl38PdG5q
 GDl53s9kX5FnGPIjUASlexxUlwmaCabwsgMWYw3urAQVCI7FyAvRobx4VqmpQCPK
 fa+j0/xGO7WzqfE4cCP9nkqgj69AuoJPMUVWghAE=
Received: from [192.168.3.42]
 (bras-base-toroon2719w-grc-49-142-114-9-241.dsl.bell.ca [142.114.9.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4FXsvR2tNWz8PbK;
 Sun,  2 May 2021 00:05:07 -0400 (EDT)
Message-ID: <f64963a3-6c13-a8b8-9591-2080dfd9f7ed@comstyle.com>
Date: Sun, 2 May 2021 00:02:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH] tcg/ppc: Fix building with Clang
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <YH98WLDMQ5c0Zf5E@humpty.home.comstyle.com>
 <CAFEAcA995L--csz+fX4MqkSPTPxQ7Nx=q-Lh70bi_zQGoj54mw@mail.gmail.com>
 <1ebc5a66-2763-1379-24e0-774739f2edbe@linaro.org>
 <CAFEAcA9TaxkByWscOa2WC=o6fXAxaqAUt30CUsmA24jZ6HEYEA@mail.gmail.com>
 <4b7a580a-d701-f545-a8c2-5d18ea25a187@linaro.org>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <4b7a580a-d701-f545-a8c2-5d18ea25a187@linaro.org>
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

On 4/22/2021 11:39 AM, Richard Henderson wrote:
> On 4/22/21 2:20 AM, Peter Maydell wrote:
>> On Thu, 22 Apr 2021 at 06:18, Richard Henderson
>>> I'm thinking something like
>>>
>>> #if !defined(_CALL_SYSV) && \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !defined(_CALL_DARWIN) && \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !defined(_CALL_AIX) && \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !defined(_CALL_ELF)
>>> # if defined(__APPLE__)
>>> #=C2=A0 define _CALL_DARWIN
>>> # elif defined(__ELF__) && TCG_TARGET_REG_BITS =3D=3D 32
>>> #=C2=A0 define _CALL_SYSV
>>> # else
>>> #=C2=A0 error "Unknown ABI"
>>> # endif
>>> #endif
>>
>> Doesn't this also need some case that handles "64bit ppc clang which=20
>> doesn't
>> define _CALL_anything" ?
>
> Clang does define _CALL_ELF for ppc64:
>
> =C2=A0// ABI options.
> =C2=A0if (ABI =3D=3D "elfv1")
> =C2=A0=C2=A0 Builder.defineMacro("_CALL_ELF", "1");
> =C2=A0if (ABI =3D=3D "elfv2")
> =C2=A0=C2=A0 Builder.defineMacro("_CALL_ELF", "2");
>

Able to spin up a patch that you think is appropriate?

