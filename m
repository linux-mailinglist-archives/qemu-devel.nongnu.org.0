Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76F4735B7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 21:19:02 +0100 (CET)
Received: from localhost ([::1]:56688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwrmn-00062k-CN
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 15:19:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mwrkV-0004KG-C1; Mon, 13 Dec 2021 15:16:40 -0500
Received: from [201.28.113.2] (port=62557 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mwrkT-000685-P9; Mon, 13 Dec 2021 15:16:39 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 13 Dec 2021 17:15:29 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 97211800A5A;
 Mon, 13 Dec 2021 17:15:29 -0300 (-03)
Subject: Re: [RFC PATCH] target/ppc: do not silence snan in xscvspdpn
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211213121320.947362-1-matheus.ferst@eldorado.org.br>
 <e5c3273a-8438-e7cc-6856-796fa1639786@amsat.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <32d0bb0d-3ad0-6f9e-eec5-97fce795ee24@eldorado.org.br>
Date: Mon, 13 Dec 2021 17:15:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e5c3273a-8438-e7cc-6856-796fa1639786@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Dec 2021 20:15:29.0914 (UTC)
 FILETIME=[2CC0BDA0:01D7F05E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.093,
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
Cc: peter.maydell@linaro.org, danielhb413@gmail.com, groug@kaod.org,
 clg@kaod.org, alex.bennee@linaro.org, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/12/2021 09:36, Philippe Mathieu-Daudé wrote:
> On 12/13/21 13:13, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> The non-signalling versions of VSX scalar convert to shorter/longer
>> precision insns doesn't silence SNaNs in the hardware. We are currently
>> honoring this behavior in xscvdpspn, since helper_xscvdpspn handles the
>> conversion with extracts/deposits/etc. OTOH, xscvspdpn uses
>> float32_to_float64 that calls parts_float_to_float, which uses
>> parts_return_nan that finally calls parts_silence_nan if the input is an
>> SNaN.
>>
>> To address this problem, this patch adds a new float_status flag
>> (return_snan) to avoid the call to parts_silence_nan in the
>> float_class_snan case of parts_return_nan.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>> This behavior was observed in a Power9 and can be reproduced with the
>> following code:
>>
>> int main(void)
>> {
>>      __uint128_t t, b = 0x7f80000200000000;
>>
>>      asm("xscvspdpn %x0, %x1\n\t"
>>          : "=wa" (t)
>>          : "wa" (b << 64));
>>      printf("0x%016" PRIx64 "%016" PRIx64 "\n",
>>             (uint64_t)(t >> 64), (uint64_t)t);
>>
>>      b = 0x7ff0000000000002;
>>      asm("xscvdpspn %x0, %x1\n\t"
>>          : "=wa" (t)
>>          : "wa" (b << 64));
>>      printf("0x%016" PRIx64 "%016" PRIx64 "\n",
>>             (uint64_t)(t >> 64), (uint64_t)t);
>>
>>      return 0;
>> }
> 
> Why not add this test in tests/tcg/ppc64le/ ?

I'll add it in v2. Is it ok to use __uint128_t in tests?

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

