Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE4B1E6299
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 15:45:02 +0200 (CEST)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeIqD-00018P-Ql
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 09:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jeImk-0003ot-Km
 for qemu-devel@nongnu.org; Thu, 28 May 2020 09:41:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20927
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jeImj-0000B0-LD
 for qemu-devel@nongnu.org; Thu, 28 May 2020 09:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590673284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jgPn5/3SiL/BCQPNp12ubi6VF4npbAkeKNN8iWkmpwM=;
 b=hGJQRw525hfpHz5pnnT1eqTRtST/v6MfPgHbXhHqZfB8+kVLiE7z5fYREghKRzjtWUoJAG
 xb9K5GzA7cWgXyZhcyWmoJV/EdJREdkPXf8iYB4HqWanmfw/bxRzU/WFyY9si1t0vhZ09W
 xVQz4npi0wyHQFSJc7tcMkybxk6NrxI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Y1fAQSAlNkmYSUnWpJ2SFg-1; Thu, 28 May 2020 09:41:22 -0400
X-MC-Unique: Y1fAQSAlNkmYSUnWpJ2SFg-1
Received: by mail-wm1-f71.google.com with SMTP id k185so978683wme.8
 for <qemu-devel@nongnu.org>; Thu, 28 May 2020 06:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jgPn5/3SiL/BCQPNp12ubi6VF4npbAkeKNN8iWkmpwM=;
 b=nFtmwpC6f4aT8iki9YLStelUQTzGw4JZLJvrBoH7hFOVM+1fzcviEXJjs9gTHUMB/A
 CzUq4F6pp+++EkTozCPj6gdnwz0MdhzymO8Cp/XBX0PAe4Q1pbVV1i6xAqOalKgv/pqz
 Np6J9iOI/ufmmdF4Xzo9tkIctFKLBGtPOTebzumGMaJpZMr9V5+/gJsRN+6ajCExt1Dq
 zrmV8NS+3X7UpmdEw07CE3u4urcQdAtgGI6QE7zqHgeLXO73dGZ9fbCD/ngXonK04FTd
 1ykf8YCt7ZPUkNdcVwPAWhrVtunle8VdSSt7bfjav3KqISUc6tcX7tTQTCLlywcrmKCM
 qQ5Q==
X-Gm-Message-State: AOAM533UE9FQBdnX7zGv3eS0WA1gizb9oqaUuetS7ZNZDZ6K0qPDzvXt
 XWQY+uqJfcKd3gSVGyCR30NtHZZWYm1tsmEgfRSHu1vIww7RZF06hb5MuoS1nJPXv9eLVuzpnF7
 yW5+CjGGU2I1L9fY=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr3265439wmc.167.1590673281441; 
 Thu, 28 May 2020 06:41:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLNHeGKXfXiKHPipF3uxvDPGQYppfKN06c5ZTuiUH/EiQaA9araHxHXW98hAplgKuQc93HQA==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr3265421wmc.167.1590673281219; 
 Thu, 28 May 2020 06:41:21 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id d6sm6278328wrj.90.2020.05.28.06.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 06:41:20 -0700 (PDT)
Subject: Re: [PATCH v2] fpu/softfloat: Silent 'bitwise negation of a boolean
 expression' warning
To: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20200528084833.9531-1-philmd@redhat.com>
 <288fd554-67e2-bfd9-4b51-ac03e565161f@redhat.com>
 <fb5c69f1-af4c-2f6e-b47a-3b964675318a@redhat.com>
 <1809e3cf-5750-e21e-88bf-d27f9d1fb3c3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <1c6f1813-afc4-95e1-65c6-a6ae68b54690@redhat.com>
Date: Thu, 28 May 2020 15:41:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1809e3cf-5750-e21e-88bf-d27f9d1fb3c3@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 03:11:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/28/20 3:37 PM, Eric Blake wrote:
> On 5/28/20 4:00 AM, Philippe Mathieu-Daudé wrote:
>> On 5/28/20 10:57 AM, Thomas Huth wrote:
>>> On 28/05/2020 10.48, Philippe Mathieu-Daudé wrote:
>>>> When building with clang version 10.0.0-4ubuntu1, we get:
> 
> In the subject, I'd suggest s/Silent/Silence/

Don't fit... 73 chars :S I'll use 'Avoid' (or 'Remove'?) instead.

> 
>>>>
>>>>      CC      lm32-softmmu/fpu/softfloat.o
>>>>    fpu/softfloat.c:3365:13: error: bitwise negation of a boolean
>>>> expression; did you mean logical negation? [-Werror,-Wbool-operation]
>>>>        absZ &= ~ ( ( ( roundBits ^ 0x40 ) == 0 ) & roundNearestEven );
>>>>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>
>>>>    fpu/softfloat.c:3423:18: error: bitwise negation of a boolean
>>>> expression; did you mean logical negation? [-Werror,-Wbool-operation]
>>>>            absZ0 &= ~ ( ( (uint64_t) ( absZ1<<1 ) == 0 ) &
>>>> roundNearestEven );
>>>>                    
>>>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>
> 
> Also, do you need to list all errors, or will just one or two
> representative errors be sufficient?

Fair :)

> 
>>>>
>>>> Fix by rewriting the fishy bitwise AND of two bools as an int.
>>>>
>>>> Suggested-by: Eric Blake <eblake@redhat.com>
>>>> Buglink: https://bugs.launchpad.net/bugs/1881004
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
> 
>>>> +++ b/fpu/softfloat.c
>>>> @@ -3362,7 +3362,9 @@ static int32_t roundAndPackInt32(bool zSign,
>>>> uint64_t absZ,
>>>>       }
>>>>       roundBits = absZ & 0x7F;
>>>>       absZ = ( absZ + roundIncrement )>>7;
>>>> -    absZ &= ~ ( ( ( roundBits ^ 0x40 ) == 0 ) & roundNearestEven );
>>>> +    if (((roundBits ^ 0x40) == 0) && roundNearestEven) {
>>>> +        absZ &= ~1;
>>>> +    }
>>>
>>> You could get rid of some more parentheses now:
>>>
>>>     if ((roundBits ^ 0x40) == 0 && roundNearestEven)
>>>
>>> ... also in the other hunks.
>>
>> I first wrote
>>
>>      if (!(roundBits ^ 0x40) && roundNearestEven)
>>
>> But then thought this would diverge from Eric suggestion, so I kept what
>> he wrote (which is a bit closer to the style of rest of this file).
> 
> I don't mind the patch as-is for minimizing churn and matching existing
> style, but I also would not be opposed if you wanted to elide
> unnecessary ().

OK, thanks for the review!

> 
>>
>>>
>>> Anyway:
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>
>> Thanks!
>>
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


