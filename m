Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCB5EFB77
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:01:38 +0200 (CEST)
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwun-0004xQ-5J
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odw2L-000661-St
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:05:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odw2E-0006Mk-SP
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664467513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKH3ld6QCPV+GiPn+N4tDIKpSO+9MyJoifPvgV6X1Hw=;
 b=LfZlAlp6H4or7gl5j6dk9H7xXn+FkV58ljD6LNkMWntjG+6lTEeuvUym16TMgp3fFkx4is
 P0UGH/OlGgmekz3SNY+A9lXl2yqDaAaTQh3yA1FmC3OwT5duutbE6DXASQONmWWCYBEs+p
 Nx4D4G4X9cY8dMZ0XxaBDgOQpGpmqeA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-497-GaqqJDpjM8GJosjlA2AsyQ-1; Thu, 29 Sep 2022 12:05:12 -0400
X-MC-Unique: GaqqJDpjM8GJosjlA2AsyQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 t1-20020adfba41000000b0022cc6bcd8dbso701474wrg.4
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=mKH3ld6QCPV+GiPn+N4tDIKpSO+9MyJoifPvgV6X1Hw=;
 b=qHmbauEX9H6NhoNENQjJ9cRk8m9Bgy83EfKHpYpNOiBU2icW7jOHPevYcZL94Qfcos
 GU7oChi7Dp1x9DaFcsbIQaKL3ttmf1CjG1kDai3mrDGbe3Gx8zxe75hxKO7abQLaAj99
 hadlX3hS83ol9nOlMhOvMS7VGLGbIS+SiFuSu2bF5N5Q3W59+PM/9roQRwTOb1nHWJnE
 LtwsNFjWpNDcFl30rZ8qHlr5RxNxP5/AgifQ8M49bEUkAVrqLZW5QiWjfs4U0aRryZYe
 AI8lPfH65YlDPg9Udnw7IZTV5h7mduWG0pBhev3CNxQeJWp/MFMecfI/pP8qTh3Hc+R/
 pZPQ==
X-Gm-Message-State: ACrzQf0iqH6LM+6Wf7f5XTYv8dbggt8+j4CEl93NqJCCWJJW46tsPnqs
 592dYTQ8DsEcSiPCoir3L7o7L50OH8+chHQ0Yet010+X+ZsmlhIR3Cdt+YnDcU2NAXcTUOvenTH
 bOisAaJp9VvlMOuk=
X-Received: by 2002:a7b:cc99:0:b0:3b4:76f2:192b with SMTP id
 p25-20020a7bcc99000000b003b476f2192bmr11563207wma.138.1664467510908; 
 Thu, 29 Sep 2022 09:05:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5e3WSyc3rrGTZS+i9wrfvyINPeFPKrs41gdrhxlOHwnWKUaASU/dcX1GDc1luUr1rR22c0RQ==
X-Received: by 2002:a7b:cc99:0:b0:3b4:76f2:192b with SMTP id
 p25-20020a7bcc99000000b003b476f2192bmr11563167wma.138.1664467510474; 
 Thu, 29 Sep 2022 09:05:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:ce00:b5d:2b28:1eb5:9245?
 (p200300cbc705ce000b5d2b281eb59245.dip0.t-ipconnect.de.
 [2003:cb:c705:ce00:b5d:2b28:1eb5:9245])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003b476cabf1csm6535989wms.26.2022.09.29.09.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 09:05:09 -0700 (PDT)
Message-ID: <f4389387-078f-3bad-bc2f-1d03362f59fb@redhat.com>
Date: Thu, 29 Sep 2022 18:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 3/7] util: Introduce ThreadContext user-creatable object
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220928164542.117952-1-david@redhat.com>
 <20220928164542.117952-4-david@redhat.com> <87fsgatowz.fsf@pond.sub.org>
 <27748202-1370-dff7-29da-7bcf4226c227@redhat.com>
 <87wn9mqsdq.fsf@pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87wn9mqsdq.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>> +##
>>>> +# @ThreadContextProperties:
>>>> +#
>>>> +# Properties for thread context objects.
>>>> +#
>>>> +# @cpu-affinity: the CPU affinity for all threads created in the thread
>>>> +#                context (default: QEMU main thread affinity)
>>>> +#
>>>> +# Since: 7.2
>>>> +##
>>>> +{ 'struct': 'ThreadContextProperties',
>>>> +  'data': { '*cpu-affinity': ['uint16'] } }
>>>
>>> I understand this is a list of affinities.  What I poor ignorant me
>>> doesn't understand is the meaning of the list index.  Or in other words,
>>> the list maps some range [0:N] to affinities, but what are the numbers
>>> being mapped there?
>>
>> Assume you have 8 physical CPUs.
>>
>> $ lscpu
>> ...
>>
>> NUMA:
>>    NUMA node(s):          1
>>    NUMA node0 CPU(s):     0-7
>> ...
>>
>> You will provide the CPU IDs here, for example as in patch #7 example:
>>
>> qemu-system-x86_64 -m 1G \
>>   -object thread-context,id=tc1,cpu-affinity=3-4 \
>>   -object memory-backend-ram,id=pc.ram,size=1G,prealloc=on,prealloc-threads=2,prealloc-context=tc1
>> \
>>   -machine memory-backend=pc.ram \
>>   -S -monitor stdio -sandbox enable=on,resourcecontrol=deny
>>
>>
>> Details about CPU affinities in general can be found in the man page of taskset:
>>
>> https://man7.org/linux/man-pages/man1/taskset.1.html
> 
> Is @cpu-affinity a set of CPU numbers?

Yes! For now I added to the description:

...
     General information about CPU affinities can be found in the man page of
     taskset:
         CPU affinity is a scheduler property that "bonds" a process to a given
         set of CPUs on the system. The Linux scheduler will honor the given CPU
         affinity and the process will not run on any other CPUs.
...
     A simple QEMU example to set the CPU affinity to CPU 0,1,6,7 would be:
         qemu-system-x86_64 -S \
           -object thread-context,id=tc1,cpu-affinity=0-1,cpu-affinity=6-7
     
     And we can query it via HMP/QMP:
         (qemu) qom-get tc1 cpu-affinity
         [
             0,
             1,
             6,
             7
         ]
     
     But note that due to dynamic library loading this example will not work
     before we actually make use of thread_context_create_thread() in QEMU
     code, because the type will otherwise not get registered.



> 
>> Please let me know how I can further clarify this, that would help, thanks!
> 
> What happens when you try to create a thread context object with CPU
> affinities on a host system that doesn't support CPU affinities?

qemu_thread_set_affinity() will fail and setting the attribute will result
in a "Setting CPU affinity failed".

Thanks!

-- 
Thanks,

David / dhildenb


