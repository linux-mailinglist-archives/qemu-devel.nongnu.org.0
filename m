Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26683690D0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 13:05:35 +0200 (CEST)
Received: from localhost ([::1]:45332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZtcs-0005Qv-SX
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 07:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZtbP-00050a-RV
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:04:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZtbI-0006FP-VE
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619175835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wu0zBx09P2kErGwSToto3XrMufavyh6FOP1GISHBg/A=;
 b=DG0gAAyfEx2ii1R9gbZgzqM5oBFMNbR3ikM8nDV1PZ+Hk2SexmqnXJ94pId6+95KcJoEEe
 0rYJ3G4/O55eEK4QqN0SJuooEuTzFrc6jiiWwX51JHHEEUaxVvcQPOh0+fxnblD78WRGN0
 lVkOj7VFbSB+IWr0FikQiuV837aX1Xg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-UvrGi9a-Mte3ZszrETqxpA-1; Fri, 23 Apr 2021 07:03:52 -0400
X-MC-Unique: UvrGi9a-Mte3ZszrETqxpA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v65-20020a1cde440000b029012853a35ee7so526143wmg.2
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 04:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Wu0zBx09P2kErGwSToto3XrMufavyh6FOP1GISHBg/A=;
 b=sDdRiJhSTCkmj0Sgk7D2AWBMUou9zhM4jtnjRJCwoFA8L40eSG5lHdPb2iUgn9+8FE
 ffbPOEsX6fBkFKcpN8NOMN+Jwfu6eKQwq9tFb430l4E55ren/gyM2L+IxBFXQIsdLQTL
 eUxOe6jqLhfWpwnJVhkDmLT62lpUJFk+8OcuQFhKywWnoe5+Mv9/CZWPf3hH1UqW5YHA
 1LN/vpCX/tU0OMOiURjoTjU6DwweiNo8KoED4fuHl/M8eDSvNtP1Mj9NlaRBp0I3hNiY
 SZyjDbicObPRtm4y0gVZI8iKfomCDahgEklTDbPM4H8NmNQoZJhqZnJpl0cbQTGhEQas
 Nd+A==
X-Gm-Message-State: AOAM531z0uH9oM7Rlb5CYnYC7QGatJ7ICAIWCZGj4Djb/dSjyjL5Imn8
 ZsAxVojTfjAt2gRi0yQXyNRUFq5LKv70HXr24yTOsgZUTdcpM3cEogZ8l8uJ1jwK00DaEmcroKd
 xsNE0WWfIiACnqpw=
X-Received: by 2002:adf:e58f:: with SMTP id l15mr3893172wrm.175.1619175830908; 
 Fri, 23 Apr 2021 04:03:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX7kSGToWbWzohBobJ0HkvAD34Immjt45rJaaHQERvqHvvyDwfnDTUKbRcVSUWrUTtEFs1XA==
X-Received: by 2002:adf:e58f:: with SMTP id l15mr3893128wrm.175.1619175830623; 
 Fri, 23 Apr 2021 04:03:50 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6365.dip0.t-ipconnect.de. [91.12.99.101])
 by smtp.gmail.com with ESMTPSA id
 k7sm8618312wrw.64.2021.04.23.04.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 04:03:50 -0700 (PDT)
Subject: Re: [PATCH v6 14/15] qmp: Include "reserve" property of memory
 backends
To: Markus Armbruster <armbru@redhat.com>
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-15-david@redhat.com>
 <87im4di7u9.fsf@dusky.pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <190f173c-b3f9-6c70-42bb-27f50a5f9380@redhat.com>
Date: Fri, 23 Apr 2021 13:03:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im4di7u9.fsf@dusky.pond.sub.org>
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
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.04.21 13:00, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> Let's include the new property.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   hw/core/machine-qmp-cmds.c | 1 +
>>   qapi/machine.json          | 4 ++++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
>> index d41db5b93b..2d135ecdd0 100644
>> --- a/hw/core/machine-qmp-cmds.c
>> +++ b/hw/core/machine-qmp-cmds.c
>> @@ -175,6 +175,7 @@ static int query_memdev(Object *obj, void *opaque)
>>           m->dump = object_property_get_bool(obj, "dump", &error_abort);
>>           m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
>>           m->share = object_property_get_bool(obj, "share", &error_abort);
>> +        m->reserve = object_property_get_bool(obj, "reserve", &error_abort);
>>           m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
>>                                                &error_abort);
>>           host_nodes = object_property_get_qobject(obj,
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 32650bfe9e..5932139d20 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -798,6 +798,9 @@
>>   #
>>   # @share: whether memory is private to QEMU or shared (since 6.1)
>>   #
>> +# @reserve: whether swap space (or huge pages) was reserved if applicable
>> +#           (since 6.1)
>> +#
>>   # @host-nodes: host nodes for its memory policy
>>   #
>>   # @policy: memory policy of memory backend
>> @@ -812,6 +815,7 @@
>>       'dump':       'bool',
>>       'prealloc':   'bool',
>>       'share':      'bool',
>> +    'reserve':    'bool',
>>       'host-nodes': ['uint16'],
>>       'policy':     'HostMemPolicy' }}
> 
> Double-checking: true means definitely reserved, and false means
> definitely not reserved.  Correct?

True means "reserved if applicable" which means "not reserved if not 
applicable". False means "definitely not reserved".

(any recommendation how to rephrase are appreciated; I tried my best -- 
this interface here makes it especially hard -- it's easier for the 
property itself)

-- 
Thanks,

David / dhildenb


