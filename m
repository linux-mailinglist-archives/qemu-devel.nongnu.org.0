Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E14762F6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:16:10 +0100 (CET)
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxah6-0005ab-PK
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:16:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mxaTi-0006TV-Lr; Wed, 15 Dec 2021 15:02:18 -0500
Received: from [201.28.113.2] (port=14217 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mxaTf-0004cH-PN; Wed, 15 Dec 2021 15:02:18 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 15 Dec 2021 17:01:39 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 4C9588009F6;
 Wed, 15 Dec 2021 17:01:39 -0300 (-03)
Subject: Re: [RFC PATCH] target/ppc: do not silence snan in xscvspdpn
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20211213121320.947362-1-matheus.ferst@eldorado.org.br>
 <e5c3273a-8438-e7cc-6856-796fa1639786@amsat.org>
 <32d0bb0d-3ad0-6f9e-eec5-97fce795ee24@eldorado.org.br>
 <02d2318e-f857-60d2-27f8-da7992193008@amsat.org> <87ee6dg8in.fsf@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <d9c2ff97-b8d5-81b9-008b-87a6c20dea73@eldorado.org.br>
Date: Wed, 15 Dec 2021 17:01:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87ee6dg8in.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Dec 2021 20:01:39.0629 (UTC)
 FILETIME=[92B0CDD0:01D7F1EE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, danielhb413@gmail.com, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2021 12:55, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> On 12/13/21 21:15, Matheus K. Ferst wrote:
>>> On 13/12/2021 09:36, Philippe Mathieu-Daudé wrote:
>>>> On 12/13/21 13:13, matheus.ferst@eldorado.org.br wrote:
>>>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>>>
>>>>> The non-signalling versions of VSX scalar convert to shorter/longer
>>>>> precision insns doesn't silence SNaNs in the hardware. We are currently
>>>>> honoring this behavior in xscvdpspn, since helper_xscvdpspn handles the
>>>>> conversion with extracts/deposits/etc. OTOH, xscvspdpn uses
>>>>> float32_to_float64 that calls parts_float_to_float, which uses
>>>>> parts_return_nan that finally calls parts_silence_nan if the input is an
>>>>> SNaN.
>>>>>
>>>>> To address this problem, this patch adds a new float_status flag
>>>>> (return_snan) to avoid the call to parts_silence_nan in the
>>>>> float_class_snan case of parts_return_nan.
>>>>>
>>>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>>> ---
>>>>> This behavior was observed in a Power9 and can be reproduced with the
>>>>> following code:
>>>>>
>>>>> int main(void)
>>>>> {
>>>>>       __uint128_t t, b = 0x7f80000200000000;
>>>>>
>>>>>       asm("xscvspdpn %x0, %x1\n\t"
>>>>>           : "=wa" (t)
>>>>>           : "wa" (b << 64));
>>>>>       printf("0x%016" PRIx64 "%016" PRIx64 "\n",
>>>>>              (uint64_t)(t >> 64), (uint64_t)t);
>>>>>
>>>>>       b = 0x7ff0000000000002;
>>>>>       asm("xscvdpspn %x0, %x1\n\t"
>>>>>           : "=wa" (t)
>>>>>           : "wa" (b << 64));
>>>>>       printf("0x%016" PRIx64 "%016" PRIx64 "\n",
>>>>>              (uint64_t)(t >> 64), (uint64_t)t);
>>>>>
>>>>>       return 0;
>>>>> }
>>>>
>>>> Why not add this test in tests/tcg/ppc64le/ ?
>>>
>>> I'll add it in v2. Is it ok to use __uint128_t in tests?
>>
>> What about:
>>
>>    int main(void)
>>    {
>>    #ifndef __SIZEOF_INT128__
>>        printf("uint128_t not available, skipping...\n");
>>    #else
>>        ...
>>    #endif
>>        return 0;
>>    }
> 
> We have a tests/tcg/configure.sh which does feature tests although it is
> mainly testing for the presence of compiler target flags.  We do this
> because while the docker compilers are all pretty modern the user might
> be using their own cross compiler.
> 
> I'm generally not keen on the tests silently skipping because it gives a
> false impression things have been tested. If it is possible to avoid
> INT128 shenanigans to load the values into the inline assembler lets do
> that, otherwise lets feature test and ifdef a skip-test in the makefile.
> 
> --
> Alex Bennée
> 

I think we can pass the value via register and use mtvsrd/mfvsrd to 
avoid the INT128 part.

There was a v2 of this patch, but I messed up the CC and only included 
get_maintainer.pl result and Philippe. The patch is now applied, so I'll 
send this change as a follow-up.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

