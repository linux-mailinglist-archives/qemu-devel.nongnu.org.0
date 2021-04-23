Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353C369226
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 14:32:13 +0200 (CEST)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZuyi-0003jJ-Gm
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 08:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZuwS-0003Ci-CX
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZuwP-0006KO-Ck
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619180988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tN6xOUm87cKjfHmqHX7ZXT9uL6EwxU9i4gWPDc80hAs=;
 b=YhERn+pFy6ucYd2BV03t7gszzUzshqIplXGuWDx6IJ9wcMxFTCzoVVtfwrcY15ZW5mU97F
 n7bCO/MYk2MD3v52pUx3/jEAxKjI0/IlvFCUcS9hL7DtloDKDBPUTVqeqaPyq0e/bYBb/i
 Yp45lnxkD8GfjMpyMgOI62Drj1x04fg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-PDMwG7SpMhS0KOXaPWvUyw-1; Fri, 23 Apr 2021 08:29:46 -0400
X-MC-Unique: PDMwG7SpMhS0KOXaPWvUyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 a71-20020a1c984a0000b029013841a43c3dso605232wme.3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 05:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tN6xOUm87cKjfHmqHX7ZXT9uL6EwxU9i4gWPDc80hAs=;
 b=hnVeMZjtRPdvA64SdyJ5CH4PcOuIRuuS5v1KSoFaYBLwJWFyWjFwL7QVs+drlg+haL
 5cT6hB01Wy8h+skzIW+LufoVVrRI3JZUZJnyisJTV82lHbZvGHr4NWLPr+YhnLQkptMf
 IgzYGa/x//X38paXTtwfTtEjpfR/97ERO440Ltr9EUNBlfgN6uhTzfD83+6B/H3xbAeJ
 7U9oOSSql77DayFyuhBnKVTTJ9S+7JztJONAx/Kepmz0AB7LLjENVBQwmJFp5lhcJ78Q
 j7bPsgkg74STZr+PywL1Sc7Itj2CJ+faVeqZKo+Qz5092m5yukUI+fPDyRkRzY/Dupq9
 gtaQ==
X-Gm-Message-State: AOAM533blxv3QcuNkM032/mif0F5+oh7gN5zAf5zONOE/vA71h0/j10I
 zqg6joGqSjOKOIzmMInMocAVhT5oYTfTNpyL/NrDC8hwWlLNnxdkDhw/rSx7Ey79+E0xJHWgYlX
 3ytgotL/piW4/whQ=
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr4339334wrx.188.1619180985278; 
 Fri, 23 Apr 2021 05:29:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyULlV2PRuh6cc9c1HkGuUn6fJSFLdnXZJ5JMM7maZrjFb5xOGsgBe1+fiJTNe3PUtjiM/8Yg==
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr4339307wrx.188.1619180985053; 
 Fri, 23 Apr 2021 05:29:45 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6365.dip0.t-ipconnect.de. [91.12.99.101])
 by smtp.gmail.com with ESMTPSA id
 h9sm7783736wmb.35.2021.04.23.05.29.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 05:29:44 -0700 (PDT)
Subject: Re: [PATCH v6 14/15] qmp: Include "reserve" property of memory
 backends
To: Markus Armbruster <armbru@redhat.com>
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-15-david@redhat.com>
 <87im4di7u9.fsf@dusky.pond.sub.org>
 <190f173c-b3f9-6c70-42bb-27f50a5f9380@redhat.com>
 <87h7jxgsa0.fsf@dusky.pond.sub.org>
 <79cdbd39-cf5c-a8ab-b2c9-68d8e4ab2333@redhat.com>
 <87zgxpfbbu.fsf@dusky.pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <33b6b3b5-47a6-94b8-1e2a-143e3cdf33b6@redhat.com>
Date: Fri, 23 Apr 2021 14:29:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87zgxpfbbu.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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

On 23.04.21 14:13, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 23.04.21 13:21, Markus Armbruster wrote:
>>> David Hildenbrand <david@redhat.com> writes:
>>>
>>>> On 23.04.21 13:00, Markus Armbruster wrote:
>>>>> David Hildenbrand <david@redhat.com> writes:
>>>>>
>>>>>> Let's include the new property.
>>>>>>
>>>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>> Cc: Eric Blake <eblake@redhat.com>
>>>>>> Cc: Markus Armbruster <armbru@redhat.com>
>>>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>>> ---
>>>>>>     hw/core/machine-qmp-cmds.c | 1 +
>>>>>>     qapi/machine.json          | 4 ++++
>>>>>>     2 files changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
>>>>>> index d41db5b93b..2d135ecdd0 100644
>>>>>> --- a/hw/core/machine-qmp-cmds.c
>>>>>> +++ b/hw/core/machine-qmp-cmds.c
>>>>>> @@ -175,6 +175,7 @@ static int query_memdev(Object *obj, void *opaque)
>>>>>>             m->dump = object_property_get_bool(obj, "dump", &error_abort);
>>>>>>             m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
>>>>>>             m->share = object_property_get_bool(obj, "share", &error_abort);
>>>>>> +        m->reserve = object_property_get_bool(obj, "reserve", &error_abort);
>>>>>>             m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
>>>>>>                                                  &error_abort);
>>>>>>             host_nodes = object_property_get_qobject(obj,
>>>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>>>> index 32650bfe9e..5932139d20 100644
>>>>>> --- a/qapi/machine.json
>>>>>> +++ b/qapi/machine.json
>>>>>> @@ -798,6 +798,9 @@
>>>>>>     #
>>>>>>     # @share: whether memory is private to QEMU or shared (since 6.1)
>>>>>>     #
>>>>>> +# @reserve: whether swap space (or huge pages) was reserved if applicable
>>>>>> +#           (since 6.1)
>>>>>> +#
>>>>>>     # @host-nodes: host nodes for its memory policy
>>>>>>     #
>>>>>>     # @policy: memory policy of memory backend
>>>>>> @@ -812,6 +815,7 @@
>>>>>>         'dump':       'bool',
>>>>>>         'prealloc':   'bool',
>>>>>>         'share':      'bool',
>>>>>> +    'reserve':    'bool',
>>>>>>         'host-nodes': ['uint16'],
>>>>>>         'policy':     'HostMemPolicy' }}
>>>>>
>>>>> Double-checking: true means definitely reserved, and false means
>>>>> definitely not reserved.  Correct?
>>>>
>>>> True means "reserved if applicable" which means "not reserved if not
>>>> applicable". False means "definitely not reserved".
>>>>
>>>> (any recommendation how to rephrase are appreciated; I tried my best --
>>>> this interface here makes it especially hard -- it's easier for the
>>>> property itself)
>>>
>>> When is it "applicable"?
>>
>> When the OS supports it for the memory type and it hasn't been disabled.
>>
>> Linux handling as described in
>>    [PATCH v6 09/15] util/mmap-alloc: Support RAM_NORESERVE via
>>    MAP_NORESERVE under Linux
>> and
>>
>>    https://www.kernel.org/doc/Documentation/vm/overcommit-accounting
>>
>> Summary *without* MAP_NORESERVE:
>>
>> a) !Hugetlbfs with Memory overcommit disabled via
>>      ("/proc/sys/vm/overcommit_memory == 2"): never
>>
>> b) !Hugetlbfs with Memory overcommit enabled
>>    1) Shared mappings on files: never
>>
>>    2) Private mappings on files: only when writable (for us always)
>>
>>    3) Shared anonymous memory: always
>>
>>    4) Private anonymous memory: only when writable (for us always)
>>
>> c) Hugetlbfs: Always
>>
>>
>> Under Windows: always. On other POSIX besides Linux -- don't know.
> 
> Would working some of this into the doc comment help users of the
> interface?  Up to you.
> 

I'll give it a thought. Most people will only care about explicitly 
disabling it, where we'll bail out if that doesn't work. Otherwise, they 
just use the OS default (== reserve if supported/applicable/not 
explicitly disabled).

Thanks!

-- 
Thanks,

David / dhildenb


