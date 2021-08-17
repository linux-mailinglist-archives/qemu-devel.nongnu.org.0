Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB8F3EEC3B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 14:13:32 +0200 (CEST)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFxyF-0002jN-8W
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 08:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mFxud-00085p-EG; Tue, 17 Aug 2021 08:09:47 -0400
Received: from [201.28.113.2] (port=57099 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mFxua-00046K-81; Tue, 17 Aug 2021 08:09:47 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 17 Aug 2021 09:09:40 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 03DB6800021;
 Tue, 17 Aug 2021 09:09:39 -0300 (-03)
Subject: Re: [PATCH for-6.2 1/2] include/qemu/int128.h: introduce bswap128s
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210816191316.1163622-1-matheus.ferst@eldorado.org.br>
 <20210816191316.1163622-2-matheus.ferst@eldorado.org.br>
 <b5b5ca02-aac5-4bc3-3898-b45c53c8b5a6@redhat.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <a0b41585-27d1-aeaf-be03-f14935c1b8c9@eldorado.org.br>
Date: Tue, 17 Aug 2021 09:09:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b5b5ca02-aac5-4bc3-3898-b45c53c8b5a6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Aug 2021 12:09:40.0453 (UTC)
 FILETIME=[C1937950:01D79360]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_20=-0.001, NICE_REPLY_A=-1.961,
 PDS_HP_HELO_NORDNS=0.825, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/2021 06:27, Philippe Mathieu-Daudé wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 8/16/21 9:13 PM, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> Introduces bswap128s based on bswap128. Since bswap128 is defined using
>> int128_* methods available in either CONFIG_INT128 or !CONFIG_INT128
>> builds, place both outside of #ifdef CONFIG_INT128.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   include/qemu/int128.h | 16 +++++++++++-----
>>   1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/qemu/int128.h b/include/qemu/int128.h
>> index 64500385e3..e0d385628c 100644
>> --- a/include/qemu/int128.h
>> +++ b/include/qemu/int128.h
>> @@ -153,11 +153,6 @@ static inline void int128_subfrom(Int128 *a, Int128 b)
>>       *a -= b;
>>   }
>>
>> -static inline Int128 bswap128(Int128 a)
>> -{
>> -    return int128_make128(bswap64(int128_gethi(a)), bswap64(int128_getlo(a)));
>> -}
> 
> Personally I'd move this one to the other #ifdef side,
> and implement here with __builtin_bswap128().
> 

I saw this builtin, but I couldn't test it on my system. It seems that 
Clang doesn't implement it, and it's only available on GCC 11: 
https://godbolt.org/z/T6vhd5a38 . I think we can use it, but I'd need to 
figure how to add a test for it in the configure script.

>>   #else /* !CONFIG_INT128 */
>>
>>   typedef struct Int128 Int128;
>> @@ -338,4 +333,15 @@ static inline void int128_subfrom(Int128 *a, Int128 b)
>>   }
> 
>> +static inline Int128 bswap128(Int128 a)
>> +{
>> +    return int128_make128(bswap64(int128_gethi(a)), bswap64(int128_getlo(a)));
>> +}
> 
>     #endif /* CONFIG_INT128 */
> 
> And add this generic one here indeed:
> 
>> +static inline void bswap128s(Int128 *s)
>> +{
>> +    *s = bswap128(*s);
>> +}
>> +
>>   #endif /* INT128_H */
>>
> 

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

