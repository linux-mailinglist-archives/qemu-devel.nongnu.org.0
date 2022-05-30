Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32A53792A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 12:38:03 +0200 (CEST)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvcmg-00035s-GO
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 06:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvcjv-0002BL-LH
 for qemu-devel@nongnu.org; Mon, 30 May 2022 06:35:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvcjr-00064E-Bt
 for qemu-devel@nongnu.org; Mon, 30 May 2022 06:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653906905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PZ6IXQnkCfKjyyr/C1V9ghicKUfV8TewF7+VE/fmcA=;
 b=fpqFnUb5zrM5I2gwWRin96XdfUOLQ5sDgY9Pj5vmEWf5WGfS5cmlQ8gqgU2fWeTcchhzxy
 sanSJQx2juQD768fMdgiqSOhFD1Y9yiMyGl7fu7bdpgfIPHGW5s+IoRYPOrwqoivkhXylC
 FHqke1EcIyklKpEU7NckzsmrrsCKY+Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-0mGzLMpKMp6EI6Vg8VEa0w-1; Mon, 30 May 2022 06:35:04 -0400
X-MC-Unique: 0mGzLMpKMp6EI6Vg8VEa0w-1
Received: by mail-wm1-f71.google.com with SMTP id
 v126-20020a1cac84000000b00396fe5959d2so4362987wme.8
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 03:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=1PZ6IXQnkCfKjyyr/C1V9ghicKUfV8TewF7+VE/fmcA=;
 b=dCyyFXJuZhddFbkLO8ebdX6cutPlLQJA9mFNe/uPKfVu8ZQcUcr/U7BIrXjET+Ckx1
 c+/GPHBqgql9i8xsMvh4kXwe3QMCQFMBDHa1eXw3yFdS7d7acN6SPGlQg6ahYidVLX9S
 Xe4cgXGXiQJCQ81bXZ++K2RpLQDAy632+cUUBhUhCMTEVySeFQL7Dz+k3t6zBQhqknl7
 HE3Vnw41BwdU09FT8p8RmhFgyR7S3TV3rxW0Eb2XnxOdqevlIGgi2AqrHM2DbDoFj+f/
 0dD6S/feXkEjRZaAW8laAb5b1pBQPymXwLS0TpjjcIa9sCHYewAdAu/QSjagq7SMobJW
 1fPA==
X-Gm-Message-State: AOAM531ILcYXyojO8bl0S0mPm58A1G2W2B8LwfxztOFQuZojpEUZF4Yw
 TXgQFVqQg4dIHcHeFSlNMofnLNGRYKm/811Dnqqv5DUf6mKBVX++7kJFjtkJCosMRGRmq8nsTqd
 o7PMXuNDZfnOV69g=
X-Received: by 2002:a05:600c:35c1:b0:394:8621:a1d5 with SMTP id
 r1-20020a05600c35c100b003948621a1d5mr18484098wmq.196.1653906903432; 
 Mon, 30 May 2022 03:35:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzAO4jT6g+nXLKju8C4fVM3jNPhsFbyH5jZpdbZV9bWD53dRUXye0oiGTzQZihAbFlt9yWrQ==
X-Received: by 2002:a05:600c:35c1:b0:394:8621:a1d5 with SMTP id
 r1-20020a05600c35c100b003948621a1d5mr18484072wmq.196.1653906903187; 
 Mon, 30 May 2022 03:35:03 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b00397342bcfb7sm10782368wmq.46.2022.05.30.03.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 03:35:02 -0700 (PDT)
Message-ID: <65ab5613-7fe8-038b-b011-eb16b8728a2c@redhat.com>
Date: Mon, 30 May 2022 12:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 Gautam Agrawal <gautamnagrawal@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com, richard.henderson@linaro.org
References: <20220527101104.26679-1-gautamnagrawal@gmail.com>
 <9337daf2-57bf-d2ee-6731-8f10251fbf17@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/tcg/s390x: Test overflow conditions
In-Reply-To: <9337daf2-57bf-d2ee-6731-8f10251fbf17@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi!

On 30/05/2022 11.50, David Hildenbrand wrote:
> On 27.05.22 12:11, Gautam Agrawal wrote:
>> Add a test to check for overflow conditions in s390x.
>> This patch is based on the following patches :
>> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5a2e67a691501
>> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=fc6e0d0f2db51
>>   
>> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
>> ---
>>   tests/tcg/s390x/Makefile.target |  1 +
>>   tests/tcg/s390x/overflow.c      | 58 +++++++++++++++++++++++++++++++++
>>   2 files changed, 59 insertions(+)
>>   create mode 100644 tests/tcg/s390x/overflow.c
>>
>> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
>> index 3124172736..7f86de85b9 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -16,6 +16,7 @@ TESTS+=shift
>>   TESTS+=trap
>>   TESTS+=signals-s390x
>>   TESTS+=branch-relative-long
>> +TESTS+=overflow
>>   
>>   VECTOR_TESTS=vxeh2_vs
>>   VECTOR_TESTS+=vxeh2_vcvt
>> diff --git a/tests/tcg/s390x/overflow.c b/tests/tcg/s390x/overflow.c
>> new file mode 100644
>> index 0000000000..ea8a410b1a
>> --- /dev/null
>> +++ b/tests/tcg/s390x/overflow.c
>> @@ -0,0 +1,58 @@
>> +#include <stdio.h>
>> +
>> +int overflow_add_32(int x, int y)
>> +{
>> +    int sum;
>> +    return __builtin_add_overflow(x, y, &sum);
>> +}
>> +
>> +int overflow_add_64(long long x, long long y)
>> +{
>> +    long sum;
> 
> Just wondering, why "long long" in input and "long" in output?

It's been like this in the original test program that has been supplied in 
https://gitlab.com/qemu-project/qemu/-/issues/616 and .../618 - but I agree 
it likely makes more sense to use the same type everywhere (i.e. switch sum 
from long to long long).

>> +    return __builtin_add_overflow(x, y, &sum);
>> +}
>> +
>> +int overflow_sub_32(int x, int y)
>> +{
>> +    int sum;
>> +    return __builtin_sub_overflow(x, y, &sum);
>> +}
>> +
>> +int overflow_sub_64(long long x, long long y)
>> +{
>> +    long sum;
>> +    return __builtin_sub_overflow(x, y, &sum);
> 
> nit: I'd call all local variables "ret" or "res".

Well, "sum" is not the return value here, so "ret" could be confusing, too. 
"res" or "diff" might be a good choice here, though. Gautam, what do you think?

  Thomas


