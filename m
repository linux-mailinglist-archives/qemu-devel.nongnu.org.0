Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0953268B9B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 15:01:40 +0200 (CEST)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHo6w-0005qm-FX
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 09:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kHo5t-0005LG-Lr
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 09:00:29 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55653
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kHo5m-0004ky-U6
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 09:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600088420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XzfsYBBR6ql0PejUd9uKdABHbwbkvG9tgQil0vLKZuo=;
 b=XJJ8lAQwLjR6iaTbPiSeOjnXGbjvHK8N9oqrO+rQmeFtG/Imc4zpH+RJTTHA/fIj/PMdu7
 Kciii3yjw80i4+mgA+6BHwdfjr3yqLQs+u/LW56UPPCbJHBqqn49iVdorSvsxhckH3YBIs
 XjXJbfr3TCzR78Xhy3vw2xXr8bDmrU8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-GyyZ0OUkN6CBhGPp-2a-Pg-1; Mon, 14 Sep 2020 09:00:17 -0400
X-MC-Unique: GyyZ0OUkN6CBhGPp-2a-Pg-1
Received: by mail-wm1-f70.google.com with SMTP id w3so2429271wmg.4
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 06:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XzfsYBBR6ql0PejUd9uKdABHbwbkvG9tgQil0vLKZuo=;
 b=ZRzE6YwO+gahMTSlqqxyrIL3AAuAEXVLTz6bVVlx/wtKTGJqQUjw24/1uezc/YZqIC
 WM0Y/b59IKEqPwFJ2q1g9rJOjxiotYS+w7G7sfZkg4zQl5Cp0tQDdWP9mAXz+BASSX4b
 X8IeFsXliHV9ksJhEplcVC5Kx1JJcf9YWdZFEQlYaqaL7VBjT30Rc/J6sP/Na5J+KY7v
 BVVjofwRTEBns2Ew5vfAhSzHlJnmoG5TuFcb4nM8pqXbV8siSDWjLpDfQCt+X/MWDM1t
 P7f5XQWCRSZBQE35hxvWTS9nXYW1fFxTLOvAQV2OWNvq0L8dfx/x04LBJLqJI8ortjxN
 L+Ig==
X-Gm-Message-State: AOAM533XTl/3c9NePldVOcO1mo0itvsYjLHXrWSWZ8kAQAnyKpXmYuue
 UWE9hHi4xy/+9ngZUS6lKigP4PR9syj0hSM6XR7kEbyYtDHPuAUS/pFaOVBnNaNn5OuBa2u61Mh
 eFbZdYgnsLWF72pU=
X-Received: by 2002:a05:600c:2246:: with SMTP id
 a6mr15611884wmm.38.1600088415803; 
 Mon, 14 Sep 2020 06:00:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3nLiIPrySz2EpNFx9XzxSHJHGLZX2HghO3Hs68DFjqGu6z9szEMMpfTtkatDbO/SZbxUzhw==
X-Received: by 2002:a05:600c:2246:: with SMTP id
 a6mr15611852wmm.38.1600088415510; 
 Mon, 14 Sep 2020 06:00:15 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u66sm27186314wme.1.2020.09.14.06.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 06:00:14 -0700 (PDT)
Subject: Re: [PATCH] checkpatch: Detect '%#' or '%0#' in printf-style format
 strings
To: Dov Murik <dovmurik@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20200914060109.69583-1-dovmurik@linux.vnet.ibm.com>
 <cc5a95d7-4efd-a3de-c1a2-0c77cb60c63a@redhat.com>
 <649cd6c5-7825-9373-4da0-7a28c3c97c8b@linux.vnet.ibm.com>
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
Message-ID: <83728898-f305-d6df-f4ed-63580ff87eab@redhat.com>
Date: Mon, 14 Sep 2020 15:00:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <649cd6c5-7825-9373-4da0-7a28c3c97c8b@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:33:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 9/14/20 1:27 PM, Dov Murik wrote:
> On 14/09/2020 9:55, Philippe Mathieu-Daudé wrote:
>> +qemu-perl team
>>
>> On 9/14/20 8:01 AM, Dov Murik wrote:
>>> According to the coding style document, we should use literal '0x'
>>> prefix
>>> instead of printf's '#' flag (which appears as '%#' or '%0#' in the
>>> format
>>> string).  Add a checkpatch rule to enforce that.
>>>
>>> Note that checkpatch already had a similar rule for trace-events files.
>>>
>>> Example usage:
>>>
>>>    $ scripts/checkpatch.pl --file chardev/baum.c
>>>    ...
>>>    ERROR: Don't use '#' flag of printf format ('%#') in format
>>> strings, use '0x' prefix instead
>>>    #366: FILE: chardev/baum.c:366:
>>>    +            DPRINTF("Broken packet %#2x, tossing\n", req); \
>>>    ...
>>>    ERROR: Don't use '#' flag of printf format ('%#') in format
>>> strings, use '0x' prefix instead
>>>    #472: FILE: chardev/baum.c:472:
>>>    +        DPRINTF("unrecognized request %0#2x\n", req);
>>>    ...
>>>
>>> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
>>> ---
>>>   scripts/checkpatch.pl | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index bd3faa154c..6ec2a9f6a1 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -2891,6 +2891,18 @@ sub process {
>>>               }
>>>           }
>>>   +# check for %# or %0# in printf-style format strings
>>> +        while ($line =~ /(?:^|")([X\t]*)(?:"|$)/g) {
>>> +            my $string = substr($rawline, $-[1], $+[1] - $-[1]);
>>> +            $string =~ s/%%/__/g;
>>> +            if ($string =~ /(?<!%)%0?#/) {
>>> +                ERROR("Don't use '#' flag of printf format " .
>>> +                      "('%#') in format strings, use '0x' " .
>>> +                      "prefix instead\n" . $herecurr);
>>> +                last;
>>> +            }
>>> +        }
>>> +
>>>   # QEMU specific tests
>>>           if ($rawline =~ /\b(?:Qemu|QEmu)\b/) {
>>>               ERROR("use QEMU instead of Qemu or QEmu\n" . $herecurr);
>>>
>>
>> Thank you for this patch!
>>
>> What about folding it in the same block?
>>
> 
> That makes sense, except that 'last' statement which will escape the
> loop if one of the bad patterns is found.
> 
> Maybe we can just drop 'last' from both if-then blocks?  We'll get
> multiple alerts if bad patterns are used more than once in the same
> line, which sounds OK to me.

No objection.

> 
> 
>> -- >8 --
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -2880,15 +2880,22 @@ sub process {
>>                                  $herecurr);
>>                  }
>>
>> -# check for %L{u,d,i} in strings
>> +# format strings checks
>>                  my $string;
>>                  while ($line =~ /(?:^|")([X\t]*)(?:"|$)/g) {
>>                          $string = substr($rawline, $-[1], $+[1] -
>> $-[1]);
>>                          $string =~ s/%%/__/g;
>> +                       # check for %L{u,d,i} in strings
>>                          if ($string =~ /(?<!%)%L[udi]/) {
>>                                  ERROR("\%Ld/%Lu are not-standard C, use
>> %lld/%llu\n" . $herecurr);
>>                                  last;
>>                          }
>> +                       if ($string =~ /(?<!%)%0?#/) {
>> +                               ERROR("Don't use '#' flag of printf
>> format " .
>> +                                     "('%#') in format strings, use
>> '0x' " .
>> +                                     "prefix instead\n" . $herecurr);
>> +                               last;
>> +                       }
>>                  }
>>
>>   # QEMU specific tests
>> ---
>>
> 


