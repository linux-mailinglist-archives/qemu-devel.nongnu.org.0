Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA2369479
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 16:14:55 +0200 (CEST)
Received: from localhost ([::1]:58452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZwa6-0005zl-Vp
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 10:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZwZD-0005aE-5J
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZwZ7-000222-KX
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619187233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aI26+ax/h0OlQFWU9jSvYpJgSOsEbZrBf1ukQdjv6EA=;
 b=hoq3m4l7nduBrqlvDb5HvRMWConbHQ/glcNIeY2d1l3Bvsh43olm189cN+7fdDby0DDPw7
 du17iu5J5TLZqR8KiRIvmgFyhN5AHb14IfmJxK3kwYPUc/UXtDZBMw2C/QH1Huwx18nmy2
 WLM2S7UhbNgUtQ0B3x5z8ZeIDjyXkrg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-4CY0myKAOu6IAB4RJxlU2g-1; Fri, 23 Apr 2021 10:13:51 -0400
X-MC-Unique: 4CY0myKAOu6IAB4RJxlU2g-1
Received: by mail-wr1-f72.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so10613372wrl.20
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 07:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aI26+ax/h0OlQFWU9jSvYpJgSOsEbZrBf1ukQdjv6EA=;
 b=rPkR1PAh8kEmcgSv+NuFW1BLm69nFRcMvXv5AKC9Lt7t/2wekKohYcXo1VsIbVVj6V
 d1EA3SEbmWgcOXC0lZ8G4+/pJQt7aq3ts/E6N5ZA1KzssmTpT5/X5WrDqHTQ/+G1IB5X
 JtNNiZCX9ztQGMSfktWW84yDaNOfMRuOMwffa5RjYWSN+3KSuFGz27swrSWRuddrywYY
 jFIdd4flfvwUX6SFTg3Me0fOwRU7gGkmx4YpXznh+R9tRSDTZ7xub7ToZMkrHdmGjqwG
 bXKUHUn5dYDVw4dfgL7bqN8g+q93mEu+uYTd+eDCir9/QAZb6Vf4PtuLWCkL7qk1fKBO
 nLbw==
X-Gm-Message-State: AOAM530JjdrxynV3xv8mHh85a0h2dZaJuPvUV03Yq6eGo+BYfgZSeDqz
 RZfA0WIjVY4mXvzOmSM9O5fSK3lEwKlzXM8DNBcvGs5AH2yEZucQRMwXMg/EubmE0hr7AQ8prZ3
 SM+M3DWP3kJAP0AI=
X-Received: by 2002:a5d:6b85:: with SMTP id n5mr3248494wrx.167.1619187230207; 
 Fri, 23 Apr 2021 07:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWB9/mhuD6ivVMEqqObQMSGEVLTUC/xgA6+dBFf8ksaPjGnS86VUnFuMMKw4p7YQ26ojqaOg==
X-Received: by 2002:a5d:6b85:: with SMTP id n5mr3248460wrx.167.1619187229961; 
 Fri, 23 Apr 2021 07:13:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6365.dip0.t-ipconnect.de. [91.12.99.101])
 by smtp.gmail.com with ESMTPSA id
 g5sm9468400wrq.30.2021.04.23.07.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 07:13:49 -0700 (PDT)
Subject: Re: [PATCH v6 14/15] qmp: Include "reserve" property of memory
 backends
From: David Hildenbrand <david@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-15-david@redhat.com>
 <87im4di7u9.fsf@dusky.pond.sub.org>
 <190f173c-b3f9-6c70-42bb-27f50a5f9380@redhat.com>
 <87h7jxgsa0.fsf@dusky.pond.sub.org>
 <79cdbd39-cf5c-a8ab-b2c9-68d8e4ab2333@redhat.com>
 <87zgxpfbbu.fsf@dusky.pond.sub.org>
 <33b6b3b5-47a6-94b8-1e2a-143e3cdf33b6@redhat.com>
Organization: Red Hat
Message-ID: <4c1fd7c5-3667-aef7-db09-dbfac26532b4@redhat.com>
Date: Fri, 23 Apr 2021 16:13:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <33b6b3b5-47a6-94b8-1e2a-143e3cdf33b6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.04.21 14:29, David Hildenbrand wrote:
> On 23.04.21 14:13, Markus Armbruster wrote:
>> David Hildenbrand <david@redhat.com> writes:
>>
>>> On 23.04.21 13:21, Markus Armbruster wrote:
>>>> David Hildenbrand <david@redhat.com> writes:
>>>>
>>>>> On 23.04.21 13:00, Markus Armbruster wrote:
>>>>>> David Hildenbrand <david@redhat.com> writes:
>>>>>>
>>>>>>> Let's include the new property.
>>>>>>>
>>>>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>>> Cc: Eric Blake <eblake@redhat.com>
>>>>>>> Cc: Markus Armbruster <armbru@redhat.com>
>>>>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>>>> ---
>>>>>>>      hw/core/machine-qmp-cmds.c | 1 +
>>>>>>>      qapi/machine.json          | 4 ++++
>>>>>>>      2 files changed, 5 insertions(+)
>>>>>>>
>>>>>>> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
>>>>>>> index d41db5b93b..2d135ecdd0 100644
>>>>>>> --- a/hw/core/machine-qmp-cmds.c
>>>>>>> +++ b/hw/core/machine-qmp-cmds.c
>>>>>>> @@ -175,6 +175,7 @@ static int query_memdev(Object *obj, void *opaque)
>>>>>>>              m->dump = object_property_get_bool(obj, "dump", &error_abort);
>>>>>>>              m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
>>>>>>>              m->share = object_property_get_bool(obj, "share", &error_abort);
>>>>>>> +        m->reserve = object_property_get_bool(obj, "reserve", &error_abort);
>>>>>>>              m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
>>>>>>>                                                   &error_abort);
>>>>>>>              host_nodes = object_property_get_qobject(obj,
>>>>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>>>>> index 32650bfe9e..5932139d20 100644
>>>>>>> --- a/qapi/machine.json
>>>>>>> +++ b/qapi/machine.json
>>>>>>> @@ -798,6 +798,9 @@
>>>>>>>      #
>>>>>>>      # @share: whether memory is private to QEMU or shared (since 6.1)
>>>>>>>      #
>>>>>>> +# @reserve: whether swap space (or huge pages) was reserved if applicable
>>>>>>> +#           (since 6.1)
>>>>>>> +#
>>>>>>>      # @host-nodes: host nodes for its memory policy
>>>>>>>      #
>>>>>>>      # @policy: memory policy of memory backend
>>>>>>> @@ -812,6 +815,7 @@
>>>>>>>          'dump':       'bool',
>>>>>>>          'prealloc':   'bool',
>>>>>>>          'share':      'bool',
>>>>>>> +    'reserve':    'bool',
>>>>>>>          'host-nodes': ['uint16'],
>>>>>>>          'policy':     'HostMemPolicy' }}
>>>>>>
>>>>>> Double-checking: true means definitely reserved, and false means
>>>>>> definitely not reserved.  Correct?
>>>>>
>>>>> True means "reserved if applicable" which means "not reserved if not
>>>>> applicable". False means "definitely not reserved".
>>>>>
>>>>> (any recommendation how to rephrase are appreciated; I tried my best --
>>>>> this interface here makes it especially hard -- it's easier for the
>>>>> property itself)
>>>>
>>>> When is it "applicable"?
>>>
>>> When the OS supports it for the memory type and it hasn't been disabled.
>>>
>>> Linux handling as described in
>>>     [PATCH v6 09/15] util/mmap-alloc: Support RAM_NORESERVE via
>>>     MAP_NORESERVE under Linux
>>> and
>>>
>>>     https://www.kernel.org/doc/Documentation/vm/overcommit-accounting
>>>
>>> Summary *without* MAP_NORESERVE:
>>>
>>> a) !Hugetlbfs with Memory overcommit disabled via
>>>       ("/proc/sys/vm/overcommit_memory == 2"): never
>>>
>>> b) !Hugetlbfs with Memory overcommit enabled
>>>     1) Shared mappings on files: never
>>>
>>>     2) Private mappings on files: only when writable (for us always)
>>>
>>>     3) Shared anonymous memory: always
>>>
>>>     4) Private anonymous memory: only when writable (for us always)
>>>
>>> c) Hugetlbfs: Always

Actually, it's a bit simpler in our case (writable mappings). The more complex part is the MAP_NORESERVE handling.

a) !Hugetlbfs
	1) Shared mappings on files: never reserve swap space

	2) Other mappings: always reserve swap space

b) Hugetlbfs: Always reserve huge pages.

>>>
>>>
>>> Under Windows: always. On other POSIX besides Linux -- don't know.
>>
>> Would working some of this into the doc comment help users of the
>> interface?  Up to you.
>>
> 
> I'll give it a thought. Most people will only care about explicitly
> disabling it, where we'll bail out if that doesn't work. Otherwise, they
> just use the OS default (== reserve if supported/applicable/not
> explicitly disabled).

I think something like the following might make sense:

# @reserve: whether swap space (or huge pages) was reserved if applicable.
#           This corresponds to the user configuration and not the actual
#           behavior implemented in the OS to perform a reservation;
#           For example, Linux will never reserve swap space for shared
#           file mappings. (since 6.1)

Thanks!

-- 
Thanks,

David / dhildenb


