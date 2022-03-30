Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F484EBE3F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:02:43 +0200 (CEST)
Received: from localhost ([::1]:35986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVA1-00081S-Qv
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:02:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZUvi-0004Tc-1o
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZUvf-0001F5-7j
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648633670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uejn+RaLs2yPBzAH4a8sTIxrbg8yej/Nd+b8LtTVaog=;
 b=f6tOLNow8L+T0P8MRWN7j/NGY1eKNNAd8RX3HaFb4OBb4zoGwHuYw0X/2lRR+wdxj+WRsi
 OWFHfhMWSjy++5tB2x9ebsEdMfsoGPvPot3XkxfGPXF3Iy5JL5QI/i+suinkKHyCNzNymb
 HiseG0C9oKUXvkMfjVL2O23HO+QGjbs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-MuVX8tWsPhiFfjnqlghCkg-1; Wed, 30 Mar 2022 05:47:49 -0400
X-MC-Unique: MuVX8tWsPhiFfjnqlghCkg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h127-20020a1c2185000000b0038c6f7e22a4so856580wmh.9
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 02:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uejn+RaLs2yPBzAH4a8sTIxrbg8yej/Nd+b8LtTVaog=;
 b=Hc0eFO4SPiHk1NMkm9jmMBHeAB8Mk9a9Yysg476mCzvENT4tktz6TmmeQFTFkwNdBQ
 Bb3HKvFH/LrmcyhRv3YM640AnMKlTkkhRbnr/yWcf80246nks5FMKYmld6NNvDvrShdH
 MrV/ZlNFryGsZykq7l+Zxno1JqI7522wpv2E+dw3Jt2Fh2szNEybiUx2tAAzjI14/lOk
 F1XxNu0kABCy31NzMlMPQmf5Wozei3oC1Lpg7BOr3Hypvv5X/B1q1F8upekS314R4LOb
 UXOHzblYT52q6FHAkOKmDyA8XUDR6HoN2gFydMT+HrmADfYFLZj0//n0NU/D99kTZnNo
 DMlA==
X-Gm-Message-State: AOAM533IAd8BMKe0+rhcJanrtYBse4MT/i9cfvMbi27TIn7P1eq+afTW
 sLwf4tmkYGb94EskrvWNaDZccP7yJiyps5HF54NjPHDv3aIERBfqj5FHaev7eSaSfDQrL93zZfX
 J+DojF2sXZgjzdzI=
X-Received: by 2002:a05:6000:2a6:b0:203:ebe1:2900 with SMTP id
 l6-20020a05600002a600b00203ebe12900mr35918787wry.423.1648633668299; 
 Wed, 30 Mar 2022 02:47:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJNOKF0zAeIYZlxM3wsblPMm/0PpxnJwy3Jj5hPZp23HqA5STUvQvVu5P9ZNmGiQzELnlleg==
X-Received: by 2002:a05:6000:2a6:b0:203:ebe1:2900 with SMTP id
 l6-20020a05600002a600b00203ebe12900mr35918768wry.423.1648633668046; 
 Wed, 30 Mar 2022 02:47:48 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2200:178b:7244:2a1f:b5d8?
 (p200300cbc7052200178b72442a1fb5d8.dip0.t-ipconnect.de.
 [2003:cb:c705:2200:178b:7244:2a1f:b5d8])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a05600018af00b002057c72d45fsm21372992wri.77.2022.03.30.02.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 02:47:47 -0700 (PDT)
Message-ID: <5930e000-35d2-64ec-e301-9305fa09db39@redhat.com>
Date: Wed, 30 Mar 2022 11:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] target/s390x: Fix determination of overflow condition
 code after addition
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220323162621.139313-1-thuth@redhat.com>
 <20220323162621.139313-2-thuth@redhat.com>
 <2b82de5e-a259-576c-5ea5-eb5c10e6bbeb@redhat.com>
 <36106411-4cf1-5eaf-b63f-c331380e087b@redhat.com>
 <6c73160b-787c-0f64-aabc-25bd943d8ffd@redhat.com>
 <e65e17f4-ef4c-9dfb-a9c6-a05dbc4cf671@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <e65e17f4-ef4c-9dfb-a9c6-a05dbc4cf671@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-s390x@nongnu.org, Bruno Haible <bruno@clisp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.22 11:42, Thomas Huth wrote:
> On 30/03/2022 11.34, David Hildenbrand wrote:
>> On 30.03.22 11:29, Thomas Huth wrote:
>>> On 30/03/2022 10.52, David Hildenbrand wrote:
>>>> On 23.03.22 17:26, Thomas Huth wrote:
>>>>> This program currently prints different results when run with TCG instead
>>>>> of running on real s390x hardware:
>>>>>
>>>>>    #include <stdio.h>
>>>>>
>>>>>    int overflow_32 (int x, int y)
>>>>>    {
>>>>>      int sum;
>>>>>      return ! __builtin_add_overflow (x, y, &sum);
>>>>>    }
>>>>>
>>>>>    int overflow_64 (long long x, long long y)
>>>>>    {
>>>>>      long sum;
>>>>>      return ! __builtin_add_overflow (x, y, &sum);
>>>>>    }
>>>>>
>>>>>    int a1 = -2147483648;
>>>>>    int b1 = -2147483648;
>>>>>    long long a2 = -9223372036854775808L;
>>>>>    long long b2 = -9223372036854775808L;
>>>>>
>>>>>    int main ()
>>>>>    {
>>>>>      {
>>>>>        int a = a1;
>>>>>        int b = b1;
>>>>>        printf ("a = 0x%x, b = 0x%x\n", a, b);
>>>>>        printf ("no_overflow = %d\n", overflow_32 (a, b));
>>>>>      }
>>>>>      {
>>>>>        long long a = a2;
>>>>>        long long b = b2;
>>>>>        printf ("a = 0x%llx, b = 0x%llx\n", a, b);
>>>>>        printf ("no_overflow = %d\n", overflow_64 (a, b));
>>>>>      }
>>>>>    }
>>>>>
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/616
>>>>> Suggested-by: Bruno Haible <bruno@clisp.org>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>    target/s390x/tcg/cc_helper.c | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
>>>>> index 8d04097f78..e11cdb745d 100644
>>>>> --- a/target/s390x/tcg/cc_helper.c
>>>>> +++ b/target/s390x/tcg/cc_helper.c
>>>>> @@ -136,7 +136,7 @@ static uint32_t cc_calc_subu(uint64_t borrow_out, uint64_t result)
>>>>>    
>>>>>    static uint32_t cc_calc_add_64(int64_t a1, int64_t a2, int64_t ar)
>>>>>    {
>>>>> -    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar > 0)) {
>>>>> +    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar >= 0)) {
>>>>
>>>>
>>>> Intuitively, I'd have checked for any overflow/underflow by comparing
>>>> with one of the input variables:
>>>>
>>>> a) Both numbers are positive
>>>>
>>>> Adding to positive numbers has to result in something that's bigger than
>>>> the input parameters.
>>>>
>>>> "a1 > 0 && a2 > 0 && ar < a1"
>>>
>>> I think it doesn't really matter whether we compare ar with a1 or 0 here. If
>>> an overflow happens, what's the biggest number that we can get? AFAICT it's
>>> with a1 = 0x7fffffffffffffff and a2 = 0x7fffffffffffffff. You then get:
>>>
>>>    0x7fffffffffffffff + 0x7fffffffffffffff = 0xFFFFFFFFFFFFFFFE
>>>
>>> and that's still < 0 if treated as a signed value. I don't see a way where
>>> ar could be in the range between 0 and a1.
>>>
>>> (OTOH, checking for ar < a1 instead of ar < 0 wouldn't hurt either, I guess).
>>>
>>>> b) Both numbers are negative
>>>>
>>>> Adding to negative numbers has to result in something that's smaller
>>>> than the input parameters.
>>>>
>>>> "a1 < 0 && a2 < 0 && ar > a1"
>>>
>>> What about if the uppermost bit gets lost in 64-bit mode:
>>>
>>>    0x8000000000000000 + 0x8000000000000000 = 0x0000000000000000
>>>
>>> ar > a1 does not work here anymore, does it?
>>
>>
>> 0 > -9223372036854775808, no?
> 
> current coffe level < correct coffee level
> 
> ... sorry, never mind, you're right of course.
> 
> Anyway, 0 is the lowest number we can get for an underflow, so comparing 
> with >= 0 should be fine (but comparing with a1 wouldn't hurt either).

At least for me it takes more brainpower to understand that than
comparing against one of both parameters as we usually do, e.g., for
unsigned values in

include/qemu/range.h:range_init()

if (lob + size < lob) {
	return -ERANGE;
}


Having that said, I haven't checked all corner cases in your example but
I assume it's fine.

-- 
Thanks,

David / dhildenb


