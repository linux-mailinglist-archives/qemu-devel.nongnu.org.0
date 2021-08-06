Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236FE3E2348
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:32:10 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtOr-0005RQ-7h
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBtNt-0004iK-VD
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBtNq-0005CJ-9j
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628231464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sT7R7qOZDKGn7ut71nY6bBcqF1DDCLGMpH1+ropbz9k=;
 b=hBWolNVwV3AJ4xkDrWF9QBEwepWj+GoAkE3bXsqnbF1xkSWBBhV6TGofC1lTl5foOWkPmr
 gie6syEG9LHwrpY4YjdQ9Gla2aNRxAj4cQdWIcPWW2gGS/oN307eguuMVlvRaKxqZ0qDl6
 SgAdis0EAhmKSs3ygXPI6i0UzA4ej0Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-16DBZtSEPe6VR3YdO6YM3A-1; Fri, 06 Aug 2021 02:31:03 -0400
X-MC-Unique: 16DBZtSEPe6VR3YdO6YM3A-1
Received: by mail-wr1-f70.google.com with SMTP id
 l7-20020a5d48070000b0290153b1557952so2814069wrq.16
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 23:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=sT7R7qOZDKGn7ut71nY6bBcqF1DDCLGMpH1+ropbz9k=;
 b=qRQp2a0zQ0Y1K6CLxEF6z/OOHKXjFhy3yPDTFG9IlwFrEUy4Fvld/raPWN/YHYllpa
 H7uuhwqP8q/feAn3uXyqsQRC4gXIH/vPp0x48SlT72+3rIqdgdRH2oo4TXx4h7B/zzfT
 ySPMgj5jL+VJ9PazhrcoQMCO7An938tE2Oqbhr1ayQSTbkuxl2lUu3KiLs5QP0H8YtV1
 Xq75FEHb6MCahpmRlQa+qO5aNtTqriACHzvyGW+U7UylZU9rggM1rKn2MmjtWSXiTTsU
 G817HBYoIyYm15NH6bPbRxadQikb5IXozyV4PnEHiUzUqokghPKOYeU6HM8/F29KiRGD
 hrcg==
X-Gm-Message-State: AOAM531PD31d09s+qzD9+fU1E5FIL5UbeK0or9Suo/L7ZiQ/EgALFGMH
 lhtqclOm4jxUvqp6XQ1glomL8is5ANjlchWRviFbr66MmolsOshXDtnFwZ75FFQVwFaV8xctgk2
 1xIl8B7tmFnWUSj4=
X-Received: by 2002:adf:eac7:: with SMTP id o7mr8878055wrn.52.1628231462164;
 Thu, 05 Aug 2021 23:31:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqaAIn98KxIezzDalWpMnRbVsQN+n/nOgLl9l9PL5EXGC6ObNkH41jGHDxM9dbaKqOO00DUw==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr8878028wrn.52.1628231461894;
 Thu, 05 Aug 2021 23:31:01 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id x16sm8555795wru.40.2021.08.05.23.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 23:31:01 -0700 (PDT)
Subject: Re: [PATCH v1 02/12] s390x/tcg: fix ignoring bit 63 when setting the
 storage key in SSKE
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-3-david@redhat.com>
 <1aa00053-4923-423e-5a7d-d81b203d3eb2@redhat.com>
 <c9cf9879-8a09-5d23-a3b2-50a534acafbf@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <31e90168-a002-9264-9123-f854d20b99b7@redhat.com>
Date: Fri, 6 Aug 2021 08:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c9cf9879-8a09-5d23-a3b2-50a534acafbf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 08:25, Thomas Huth wrote:
> On 06/08/2021 08.19, Thomas Huth wrote:
>> On 05/08/2021 17.27, David Hildenbrand wrote:
>>> The last bit has to be ignored.
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>    target/s390x/tcg/mem_helper.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
>>> index e0befd0f03..3c0820dd74 100644
>>> --- a/target/s390x/tcg/mem_helper.c
>>> +++ b/target/s390x/tcg/mem_helper.c
>>> @@ -2210,7 +2210,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1,
>>> uint64_t r2)
>>>            skeyclass = S390_SKEYS_GET_CLASS(ss);
>>>        }
>>> -    key = (uint8_t) r1;
>>> +    key = r1 & 0xfe;
>>
>> I'm not sure about this one ... could you cite a sentence in the PoP where
>> this is declared? For me it rather sounds like SSKE always sets the whole
>> storage key...
> 
> Ah, never mind, I missed that the rightmost bit is undefined and thus this
> is likely ok. Did you check this on a real CPU, though?

The storage key is always 7 bit, never 8 bit:

10-134:

"The new seven-bit storage-key value, or selected bits
thereof, is obtained from bit positions 56-62 of general
register R1 ."

Similarly, ISKE gives you only 7 bit:

10-31:

"The seven-bit storage key is inserted in bit positions
56-62 of general register R 1 , and bit 63 is set to zero."


Right now we could SSKE 8 bit and extract again via ISKE 8 bit, which is 
against the architecture definition.


Also have a look at arch/s390/kvm/kvm-s390.c:kvm_s390_set_skeys() where 
we reject setting a key if the last bit is set, because storage keys are 
7 bit.

-- 
Thanks,

David / dhildenb


