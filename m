Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F1A5EF4F9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:10:01 +0200 (CEST)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsMY-0004Kb-2l
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odrZA-0000ah-TE
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:18:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odrZ7-0004zL-RO
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664450332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9v2NtlGMOjVY3S9DF6BVyMjXK/Uz1Vq2Y66cSxvPog=;
 b=jUiwho+mpUVsAutlMJbg4WBU0IIEvmEQRfhnys9D04pQvhZneD0ZOo4+hj5KuceoW4WZjJ
 shxDgdzCNiWen09FNurWzoZ16RR+JQNuqpHWw+WJfueyeShyunuUydMCCo1b5/NDTZirax
 zxrOtKHuRdkjOaFwlIzQWgKH1B7lCNE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-i3OGp3UHOeWQIAVjYTxTPA-1; Thu, 29 Sep 2022 07:18:51 -0400
X-MC-Unique: i3OGp3UHOeWQIAVjYTxTPA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c3-20020a7bc843000000b003b486fc6a40so336239wml.7
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=Q9v2NtlGMOjVY3S9DF6BVyMjXK/Uz1Vq2Y66cSxvPog=;
 b=Swpod93AYmtJVym5EGc5nfTCY3ZT+mpBmZxqsYJ2SZWgBq7x70TH/vk7OArOdxOV90
 eKYUhHCd/Iki/5RBBr1icMEN3xIF4oviekboVcPCqkzKtN8cWHvtYRjVcKKUXFlVxnpB
 W+yD8jPXmzbmrpj/uQB0qtl3zQzkysTS2LCY+yTOo8gcsEKKzXp9uKw7pa2Eb4ICmuFT
 vXlVDOEMy5bCQqKQUQPpUjT9O28QULdSSlkFV3dvYoegHrXV/O2y6d/xlFRW63XbF04k
 3GJaaTS6CNGkEcD4MxwYxoHHuQVLIEyW3vVe8DkSwSlZfvtpoMputUy4iQ8ddny2RJuQ
 Ln5g==
X-Gm-Message-State: ACrzQf2hUiooKxvtedRLlM4mK21yoa3YCZZO0Z5d7wdgQvKogayJnFL4
 MtbemR63ngDkRlFMPLnMo1JWrILXraEEE+mlwnNb6zO2153fNu4MNxfIi5+LuSdLAFFbYpIkL0Q
 g6yE/KYR64+e+gzM=
X-Received: by 2002:a5d:6d82:0:b0:22b:b9f:d7fb with SMTP id
 l2-20020a5d6d82000000b0022b0b9fd7fbmr1835336wrs.580.1664450330528; 
 Thu, 29 Sep 2022 04:18:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4DNES22EqSMeDJYuBj7cmSEvstbFLReuPKWKyHxOtTy6+PAYoAZVHVk0icX493BQGARBMLag==
X-Received: by 2002:a5d:6d82:0:b0:22b:b9f:d7fb with SMTP id
 l2-20020a5d6d82000000b0022b0b9fd7fbmr1835313wrs.580.1664450330118; 
 Thu, 29 Sep 2022 04:18:50 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:ce00:b5d:2b28:1eb5:9245?
 (p200300cbc705ce000b5d2b281eb59245.dip0.t-ipconnect.de.
 [2003:cb:c705:ce00:b5d:2b28:1eb5:9245])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c214d00b003b505d26776sm4012498wml.5.2022.09.29.04.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 04:18:49 -0700 (PDT)
Message-ID: <27748202-1370-dff7-29da-7bcf4226c227@redhat.com>
Date: Thu, 29 Sep 2022 13:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 3/7] util: Introduce ThreadContext user-creatable object
In-Reply-To: <87fsgatowz.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 29.09.22 13:12, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> Setting the CPU affinity of QEMU threads is a bit problematic, because
>> QEMU doesn't always have permissions to set the CPU affinity itself,
>> for example, with seccomp after initialized by QEMU:
>>      -sandbox enable=on,resourcecontrol=deny
>>
>> While upper layers are already aware how to handl;e CPU affinities for
> 
> Typo in handle.

Thanks!

> 
>> long-lived threads like iothreads or vcpu threads, especially short-lived
>> threads, as used for memory-backend preallocation, are more involved to
>> handle. These threads are created on demand and upper layers are not even
>> able to identify and configure them.
>>
>> Introduce the concept of a ThreadContext, that is essentially a thread
>> used for creating new threads. All threads created via that context
>> thread inherit the configured CPU affinity. Consequently, it's
>> sufficient to create a ThreadContext and configure it once, and have all
>> threads created via that ThreadContext inherit the same CPU affinity.
>>
>> The CPU affinity of a ThreadContext can be configured two ways:
>>
>> (1) Obtaining the thread id via the "thread-id" property and setting the
>>      CPU affinity manually.
>>
>> (2) Setting the "cpu-affinity" property and letting QEMU try set the
>>      CPU affinity itself. This will fail if QEMU doesn't have permissions
>>      to do so anymore after seccomp was initialized.
> 
> Could you provide usage examples?

Patch #7 and the cover letter contain examples. I can add another 
example here.

>> +##
>> +# @ThreadContextProperties:
>> +#
>> +# Properties for thread context objects.
>> +#
>> +# @cpu-affinity: the CPU affinity for all threads created in the thread
>> +#                context (default: QEMU main thread affinity)
>> +#
>> +# Since: 7.2
>> +##
>> +{ 'struct': 'ThreadContextProperties',
>> +  'data': { '*cpu-affinity': ['uint16'] } }
> 
> I understand this is a list of affinities.  What I poor ignorant me
> doesn't understand is the meaning of the list index.  Or in other words,
> the list maps some range [0:N] to affinities, but what are the numbers
> being mapped there?

Assume you have 8 physical CPUs.

$ lscpu
...

NUMA:
   NUMA node(s):          1
   NUMA node0 CPU(s):     0-7
...

You will provide the CPU IDs here, for example as in patch #7 example:

qemu-system-x86_64 -m 1G \
  -object thread-context,id=tc1,cpu-affinity=3-4 \
  -object 
memory-backend-ram,id=pc.ram,size=1G,prealloc=on,prealloc-threads=2,prealloc-context=tc1 
\
  -machine memory-backend=pc.ram \
  -S -monitor stdio -sandbox enable=on,resourcecontrol=deny


Details about CPU affinities in general can be found in the man page of 
taskset:

https://man7.org/linux/man-pages/man1/taskset.1.html


Please let me know how I can further clarify this, that would help, thanks!

-- 
Thanks,

David / dhildenb


