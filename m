Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D444F4148BB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:23:19 +0200 (CEST)
Received: from localhost ([::1]:47720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1HS-0000rQ-KY
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mT1Ew-0008B6-KE
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mT1Er-0007Zq-IH
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632313232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a9gFlQ0wMbEe/DoUnG8O0pjDNCeBpQpFXfLtWZQmGA4=;
 b=UK7r3rXNMszKDQzk3xe7HCHAllFMYAOUU2XipXMKBx4QzO3nmp5anwP6kz8f5fRkj4J7lO
 BPXUJmHcJBPgXuo/E07pm+td7XK7aQpyTT/f2Edya54V3O09c14AE/+tcoQw23+NEmj0oO
 uYivK0Px9zkYzDwKpFX/k9sI/YCaH/o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-etBLZR1-MFSNGemyUHKnqg-1; Wed, 22 Sep 2021 08:20:31 -0400
X-MC-Unique: etBLZR1-MFSNGemyUHKnqg-1
Received: by mail-wr1-f71.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso2009970wrn.4
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 05:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=a9gFlQ0wMbEe/DoUnG8O0pjDNCeBpQpFXfLtWZQmGA4=;
 b=uYTkmzQd8wMb/KKx+XuT+8pfkp/f5y+0jPise2+VIfKwY5eVllfNX1JSY4UTRby+AB
 j7NZWSA0baq+xbEl1jfSPb8CI1a5XABRKaMLcEpfpIUwxGa6gFktPfwvII38K+1uu3Iy
 EPJhVdrjAiMD4vpSK+7MUg7RwxBrJdWsoxBkTMzOpoSWq/BVY2ppGh8eLrQYUUX3IA3X
 dNo4qHibKis5XPDa9Depws2VCwn6OwV8muNsC7N1693Dd2o2slxOj+LyqmIhgP3lqFNC
 k/zxqQrkRC3fbKTBXpuBjvpdLVwrSF/5nIU+6cxhUo3HlhodxUES0bqwXsOmvzJBKBrE
 kJ8Q==
X-Gm-Message-State: AOAM532VDUkX96v1adAUuukwKmin69YueX47FUBwHKmcJ8LNZ2Kzb5dO
 Zv6GVng+hih7DHDrrcmLuKDTaK1wPooujpeuWXgoEnH7zsnfv5lfFSFCRNJeh6X8lhBigi8248z
 UVmD/lx9ko6h+BAQ=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr10276819wmm.133.1632313229978; 
 Wed, 22 Sep 2021 05:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGailahq/XYB3Nv/l6xV016462kywL53gkBQnj9rDWcs0+OUr8ld+jpxtFc403uI5ocZZuzw==
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr10276784wmm.133.1632313229669; 
 Wed, 22 Sep 2021 05:20:29 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64dd.dip0.t-ipconnect.de. [91.12.100.221])
 by smtp.gmail.com with ESMTPSA id f8sm2036401wrx.15.2021.09.22.05.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 05:20:29 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>
References: <20210921102434.24273-1-david@redhat.com>
 <878rzolsim.fsf@dusky.pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1] monitor: Consider "id" when rate-limiting
 MEMORY_DEVICE_SIZE_CHANGE qapi events
Message-ID: <3f70fe6d-d7b3-5a51-df5f-b4cd3efa7a36@redhat.com>
Date: Wed, 22 Sep 2021 14:20:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <878rzolsim.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.09.21 14:11, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> We have to consider the device id, otherwise we'll lose some events for
>> unrelated devices. If the device does not have a device id (very unlikely),
>> the target of the notifications has to update the size of all devices
>> manually either way.
>>
>> This was noticed by starting a VM with two virtio-mem devices that each
>> have a requested size > 0. The Linux guest will initialize both devices
>> in parallel, resulting in losing MEMORY_DEVICE_SIZE_CHANGE events for
>> one of the devices.
> 
> Fascinating.
> 
> Event rate limiting works as follows.
> 
> An event is rate-limited when monitor_qapi_event_conf[event].rate != 0.
> 
> When such an event arrives, it is held in a bucket until a timer
> associated with the bucket expires.  Putting an event in an empty bucket
> starts its timer.  Putting an event in a non-empty bucket replaces its
> old contents.
> 
> The bucket to use for an event depends on its event type, and for some
> events also on certain event arguments.
> 
> This patch solves the "MEMORY_DEVICE_SIZE_CHANGE events from different
> devices eat each other" by splitting the event's bucket.

Right, that's how it's getting used in libvirt where we noticed it.

> 
> The split is imperfect: each device with a qdev ID gets its own bucket,
> all devices without ID have to share a bucket.

Yes, it's far from perfect. Fortunately upper layers (libvirt) barely do 
that.

> 
> This is actually a flaw in the event's design: you can't distinguish
> events from different devices without IDs.
> 
> To fix that flaw, add the QOM path to the event.

So the idea would be to extend the event by an optional QOM path 
(because it's an existing event), but always setting it internally?

Thanks!

> 
> You can then get a perfect bucket split: use the QOM path instead of
> the qdev ID.
> 
> Related: [PATCH v8 5/7] qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR
> QAPI event
> Message-Id: <20210907004755.424931-6-danielhb413@gmail.com>
> This deprecates MEM_UNPLUG_ERROR, which only provides a qdev ID in
> favour of DEVICE_UNPLUG_GUEST_ERROR, which has a wider scope, and also
> provides a QOM path.
> 
> Different tack: perhaps the rate limiting is too simplistic and overly
> aggressive.  Its purpose is to avoid a flood.  Two events are not a
> flood, even when one follows the other quickly.  Heck, even a dozen
> aren't.
> 
>>
>> Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com> (maintainer:Human Monitor (HMP))
>> Cc: Markus Armbruster <armbru@redhat.com> (supporter:QMP)
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Michal Privoznik <mprivozn@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   monitor/monitor.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/monitor/monitor.c b/monitor/monitor.c
>> index 46a171bca6..05c0b32b67 100644
>> --- a/monitor/monitor.c
>> +++ b/monitor/monitor.c
>> @@ -474,6 +474,11 @@ static unsigned int qapi_event_throttle_hash(const void *key)
>>           hash += g_str_hash(qdict_get_str(evstate->data, "node-name"));
>>       }
>>   
>> +    if (evstate->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE &&
>> +        qdict_get(evstate->data, "id")) {
>> +        hash += g_str_hash(qdict_get_str(evstate->data, "id"));
>> +    }
>> +
>>       return hash;
>>   }
>>   
>> @@ -496,6 +501,20 @@ static gboolean qapi_event_throttle_equal(const void *a, const void *b)
>>                          qdict_get_str(evb->data, "node-name"));
>>       }
>>   
>> +    if (eva->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
>> +        const bool id_a = qdict_get(eva->data, "id");
>> +        const bool id_b = qdict_get(evb->data, "id");
>> +
>> +        if (!id_a && !id_b) {
>> +            return TRUE;
>> +        } else if (id_a ^ id_b) {
>> +            return FALSE;
>> +        }
>> +
>> +        return !strcmp(qdict_get_str(eva->data, "id"),
>> +                       qdict_get_str(evb->data, "id"));
>> +    }
>> +
>>       return TRUE;
>>   }
> 
> Patch looks sane, but I recommend to first add the QOM path to the
> event, then use it instead of the qdev ID.

Yes, let me take a look how easy that will be :)


-- 
Thanks,

David / dhildenb


