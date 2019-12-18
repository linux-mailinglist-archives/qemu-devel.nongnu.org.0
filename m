Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6755E123F1B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 06:27:42 +0100 (CET)
Received: from localhost ([::1]:49832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihRs5-0006J9-88
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 00:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44118)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1ihRr7-0005ue-Fp
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 00:26:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1ihRr5-0000mi-56
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 00:26:40 -0500
Received: from mga05.intel.com ([192.55.52.43]:6018)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1ihRr4-0000fQ-D3
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 00:26:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 21:26:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; d="scan'208";a="365640824"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.238])
 ([10.239.196.238])
 by orsmga004.jf.intel.com with ESMTP; 17 Dec 2019 21:26:32 -0800
Subject: Re: [PATCH] util/cutils: Expand do_strtosz parsing precision to 64
 bits
From: Tao Xu <tao3.xu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
References: <20191205021459.29920-1-tao3.xu@intel.com>
 <87a786sse9.fsf@dusky.pond.sub.org>
 <b7c442e3-cc7e-155e-5370-db9a371928a6@intel.com>
 <87y2vbgsf0.fsf@dusky.pond.sub.org>
 <e731445a-4461-3212-c08d-05dc7ad2b742@intel.com>
Message-ID: <52a11f3a-f2c8-26e9-b823-0093cfe91fdc@intel.com>
Date: Wed, 18 Dec 2019 13:26:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e731445a-4461-3212-c08d-05dc7ad2b742@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
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
Cc: "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/2019 9:33 AM, Tao Xu wrote:
> On 12/17/2019 6:25 PM, Markus Armbruster wrote:
>> Tao Xu <tao3.xu@intel.com> writes:
>>
>>> On 12/5/19 11:29 PM, Markus Armbruster wrote:
>>>> Tao Xu <tao3.xu@intel.com> writes:
>>>>
>>>>> Parse input string both as a double and as a uint64_t, then use the
>>>>> method which consumes more characters. Update the related test cases.
>>>>>
>>>>> Signed-off-by: Tao Xu <tao3.xu@intel.com>
>>>>> ---
>>>> [...]
>>>>> diff --git a/util/cutils.c b/util/cutils.c
>>>>> index 77acadc70a..b08058c57c 100644
>>>>> --- a/util/cutils.c
>>>>> +++ b/util/cutils.c
>>>>> @@ -212,24 +212,43 @@ static int do_strtosz(const char *nptr, const 
>>>>> char **end,
>>>>>                          const char default_suffix, int64_t unit,
>>>>>                          uint64_t *result)
>>>>>    {
>>>>> -    int retval;
>>>>> -    const char *endptr;
>>>>> +    int retval, retd, retu;
>>>>> +    const char *suffix, *suffixd, *suffixu;
>>>>>        unsigned char c;
>>>>>        int mul_required = 0;
>>>>> -    double val, mul, integral, fraction;
>>>>> +    bool use_strtod;
>>>>> +    uint64_t valu;
>>>>> +    double vald, mul, integral, fraction;
>>>>
>>>> Note for later: @mul is double.
>>>>
>>>>> +
>>>>> +    retd = qemu_strtod_finite(nptr, &suffixd, &vald);
>>>>> +    retu = qemu_strtou64(nptr, &suffixu, 0, &valu);
>>
>> Note for later: passing 0 to base accepts octal and hexadecimal
>> integers.
>>
>>>>> +    use_strtod = strlen(suffixd) < strlen(suffixu);
>>>>> +
>>>>> +    /*
>>>>> +     * Parse @nptr both as a double and as a uint64_t, then use 
>>>>> the method
>>>>> +     * which consumes more characters.
>>>>> +     */
>>>>
>>>> The comment is in a funny place.  I'd put it right before the
>>>> qemu_strtod_finite() line.
>>>>
>>>>> +    if (use_strtod) {
>>>>> +        suffix = suffixd;
>>>>> +        retval = retd;
>>>>> +    } else {
>>>>> +        suffix = suffixu;
>>>>> +        retval = retu;
>>>>> +    }
>>>>>    -    retval = qemu_strtod_finite(nptr, &endptr, &val);
>>>>>        if (retval) {
>>>>>            goto out;
>>>>>        }
>>>>
>>>> This is even more subtle than it looks.
>>>>
>>>> A close reading of the function contracts leads to three cases for each
>>>> conversion:
>>>>
>>>> * parse error (including infinity and NaN)
>>>>
>>>>     @retu / @retd is -EINVAL
>>>>     @valu / @vald is uninitialized
>>>>     @suffixu / @suffixd is @nptr
>>>>
>>>> * range error
>>>>
>>>>     @retu / @retd is -ERANGE
>>>>     @valu / @vald is our best approximation of the conversion result
>>>>     @suffixu / @suffixd points to the first character not consumed 
>>>> by the
>>>>     conversion.
>>>>
>>>>     Sub-cases:
>>>>
>>>>     - uint64_t overflow
>>>>
>>>>       We know the conversion result exceeds UINT64_MAX.
>>>>
>>>>     - double overflow
>>>>
>>>>       we know the conversion result's magnitude exceeds the largest
>>>>       representable finite double DBL_MAX.
>>>>
>>>>     - double underflow
>>>>
>>>>       we know the conversion result is close to zero (closer than 
>>>> DBL_MIN,
>>>>       the smallest normalized positive double).
>>>>
>>>> * success
>>>>
>>>>     @retu / @retd is 0
>>>>     @valu / @vald is the conversion result
>>>>     @suffixu / @suffixd points to the first character not consumed 
>>>> by the
>>>>     conversion.
>>>>
>>>> This leads to a matrix (parse error, uint64_t overflow, success) x
>>>> (parse error, double overflow, double underflow, success).  We need to
>>>> check the code does what we want for each element of this matrix, and
>>>> document any behavior that's not perfectly obvious.
>>>>
>>>> (success, success): we pick uint64_t if qemu_strtou64() consumed more
>>>> characters than qemu_strtod_finite(), else double.  "More" is important
>>>> here; when they consume the same characters, we *need* to use the
>>>> uint64_t result.  Example: for "18446744073709551615", we need to use
>>>> uint64_t 18446744073709551615, not double 18446744073709551616.0.  But
>>>> for "18446744073709551616.", we need to use the double.  Good.
>>
>> Also fun: for "0123", we use uint64_t 83, not double 123.0.  But for
>> "0123.", we use 123.0, not 83.
>>
>> Do we really want to accept octal and hexadecimal integers?
>>
> 
> Thank you for reminding me. Octal and hexadecimal may bring more 
> confusion. I will use qemu_strtou64(nptr, &suffixu, 10, &valu) and add 
> test for input like "0123".
> 

Hi Markus,

After I use qemu_strtou64(nptr, &suffixu, 10, &valu), it cause another 
question. Because qemu_strtod_finite support hexadecimal input, so in 
this situation, it will parsed as double. It will also let large 
hexadecimal integers be rounded. So there may be two solution:

1: use qemu_strtou64(nptr, &suffixu, 0, &valu) and parse octal as 
decimal. This will keep hexadecimal valid as now.

"0123" --> 123; "0x123" --> 291

2: use qemu_strtou64(nptr, &suffixu, 10, &valu) and reject octal and 
decimal.

"0123" --> Error; "0x123" --> Error


