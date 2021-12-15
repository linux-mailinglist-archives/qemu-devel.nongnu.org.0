Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD302475CC0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:08:57 +0100 (CET)
Received: from localhost ([::1]:57556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWps-0005kq-Ow
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:08:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxWkx-00027m-R8
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:03:51 -0500
Received: from [2a00:1450:4864:20::42c] (port=37843
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxWku-0001Hw-Ol
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:03:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t26so2719437wrb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0e5HBNbHyEqvOL12iqzoCrjH59Hx+1Hy5p/tNz+Wepg=;
 b=qryD3tJHy7w52WKKyAgHuxNEFZ+3ogxZKE4Jba6dDZDdKAHLdy30Ewg8EMvHPLFlBV
 5Bxhl7g9eM1YcyfOMAdIdXuJ1oohT2j9iD4bvviJK9RtKwtWTsHXf6IZn6EasEgLqlTt
 5+Sq/4MjjHKUeVA34sImj52+S3T8IPoaDqUcAD2Uffq/3zZh8QZOA9x+NWKzAG8qNi/N
 pD2D1zZ++5haZRT72YgCfEXqj3W9xDQxctOg2pTE6nRQWeDJV3bs3NXECLw2E7FQF+cb
 CxJ8PH84Z+aseGOX0586W4P4+ldFSRKp88uaAshY1GvD7oz+Ceak5SB8PSokhwjkk9Dr
 VqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0e5HBNbHyEqvOL12iqzoCrjH59Hx+1Hy5p/tNz+Wepg=;
 b=K6Hb4ItppbZzCBG1p5lbNWqYajbBM5i8gDKJKV4GtpKDWRKNFLamRJTeiNBm7be3Yl
 23QXes0HzaK+qFqfBKNOlqTAPS3rx0OtuNGa6Rm/dlamicNCarJqwqYad0LI/y2yv948
 4R7oU1D/u2bR+xaJoyW3b6x2EBNQSXPFyRkHLa0qKiksCJgGCz+8SMW5W277wo1VqkXJ
 lRXPmKP7mEqg9ojUSiAHcHMimGpZuGgPHqwCoSKTy5e0wdGDE0JSi8aEdlMnc4Z6/LRI
 rD7xVSrwkTWejZovoscAU+6pG8bFY7WhwjMIAnNJvLWVsFa+tyuhKC21TufgJQwfyHwc
 44Tg==
X-Gm-Message-State: AOAM531jF+7Stxl/Jr0GwCYzSH/dgmQAIx1VA+PAkMW5kfftfwu9nTi1
 Jl6/HLXIsIBeF1VUcJlgE4PFNQ==
X-Google-Smtp-Source: ABdhPJyE2EdLAbyB3zialxWU/e2A3RBX8T7/DfwYXRvgTyTHG3eEXH77OOlseZo8vP1v1W8CVQjkTw==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr4944702wri.406.1639584226757; 
 Wed, 15 Dec 2021 08:03:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h16sm2783763wrm.27.2021.12.15.08.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:03:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CADDD1FF96;
 Wed, 15 Dec 2021 16:03:44 +0000 (GMT)
References: <20211213121320.947362-1-matheus.ferst@eldorado.org.br>
 <e5c3273a-8438-e7cc-6856-796fa1639786@amsat.org>
 <32d0bb0d-3ad0-6f9e-eec5-97fce795ee24@eldorado.org.br>
 <02d2318e-f857-60d2-27f8-da7992193008@amsat.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH] target/ppc: do not silence snan in xscvspdpn
Date: Wed, 15 Dec 2021 15:55:08 +0000
In-reply-to: <02d2318e-f857-60d2-27f8-da7992193008@amsat.org>
Message-ID: <87ee6dg8in.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, danielhb413@gmail.com, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 12/13/21 21:15, Matheus K. Ferst wrote:
>> On 13/12/2021 09:36, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 12/13/21 13:13, matheus.ferst@eldorado.org.br wrote:
>>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>>
>>>> The non-signalling versions of VSX scalar convert to shorter/longer
>>>> precision insns doesn't silence SNaNs in the hardware. We are currently
>>>> honoring this behavior in xscvdpspn, since helper_xscvdpspn handles the
>>>> conversion with extracts/deposits/etc. OTOH, xscvspdpn uses
>>>> float32_to_float64 that calls parts_float_to_float, which uses
>>>> parts_return_nan that finally calls parts_silence_nan if the input is =
an
>>>> SNaN.
>>>>
>>>> To address this problem, this patch adds a new float_status flag
>>>> (return_snan) to avoid the call to parts_silence_nan in the
>>>> float_class_snan case of parts_return_nan.
>>>>
>>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>> ---
>>>> This behavior was observed in a Power9 and can be reproduced with the
>>>> following code:
>>>>
>>>> int main(void)
>>>> {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 __uint128_t t, b =3D 0x7f80000200000000;
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 asm("xscvspdpn %x0, %x1\n\t"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dwa" (t)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "wa" (b << 64));
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 printf("0x%016" PRIx64 "%016" PRIx64 "\n",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ui=
nt64_t)(t >> 64), (uint64_t)t);
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 b =3D 0x7ff0000000000002;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 asm("xscvdpspn %x0, %x1\n\t"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dwa" (t)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "wa" (b << 64));
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 printf("0x%016" PRIx64 "%016" PRIx64 "\n",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ui=
nt64_t)(t >> 64), (uint64_t)t);
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> }
>>>
>>> Why not add this test in tests/tcg/ppc64le/ ?
>>=20
>> I'll add it in v2. Is it ok to use __uint128_t in tests?
>
> What about:
>
>   int main(void)
>   {
>   #ifndef __SIZEOF_INT128__
>       printf("uint128_t not available, skipping...\n");
>   #else
>       ...
>   #endif
>       return 0;
>   }

We have a tests/tcg/configure.sh which does feature tests although it is
mainly testing for the presence of compiler target flags.  We do this
because while the docker compilers are all pretty modern the user might
be using their own cross compiler.

I'm generally not keen on the tests silently skipping because it gives a
false impression things have been tested. If it is possible to avoid
INT128 shenanigans to load the values into the inline assembler lets do
that, otherwise lets feature test and ifdef a skip-test in the makefile.

--=20
Alex Benn=C3=A9e

