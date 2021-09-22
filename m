Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFCA41499B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:49:26 +0200 (CEST)
Received: from localhost ([::1]:49246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1gj-00074R-GI
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mT1dD-0004Ka-CN
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:45:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mT1d8-0002E4-IU
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632314740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Hr12uIVIGuRGIipdmTDfM4S/Wjxx3R2l7hlwcsNYQA=;
 b=Bmiobx1HarxxDacqqmIJYjdFORX8Sbdbrm/u4MrRtJKxb2bpwdt7DFWoIBkP1RlEO6OLV/
 +c9mCItp9dLx1Axk6eqHptZfDzwVNDLu9ZyQS7AiPVJgYTrQx3ADV4M0jk1/v29ftCrcgc
 vJYzWPVhEPL1b3hGwp1i/V5l0kPDTQk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-2NUl-Am8O360Sn9g5ug00g-1; Wed, 22 Sep 2021 08:45:39 -0400
X-MC-Unique: 2NUl-Am8O360Sn9g5ug00g-1
Received: by mail-wr1-f72.google.com with SMTP id
 e1-20020adfa741000000b0015e424fdd01so2044603wrd.11
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 05:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5Hr12uIVIGuRGIipdmTDfM4S/Wjxx3R2l7hlwcsNYQA=;
 b=eUB4pEM11gS2Dii6L9hCxTC+rH4ojrQtaujDFt3liuuX1eYnPSuUTTE9XkguOIOEg3
 cDK5/eF/U26ej73sVaeG3lklGQbliVEAgfxnV9Y5IidZMwgOnPTwyKLsWzw8MDYzTKhF
 vEwFk9X5dPRn8FA3Z/XJ/wyGm7CiwrBVCkk0ap7fS2/d8X5/njbgKc10oqTG6bTpd2Iw
 fUYBJX75FMJ5TQ51kCfUHUHRiTQsSMBGbv1nu51a1zV/SLx6flfqkiA6vCtE+2fNoEDx
 upkcJArIpMnmXR0Th8VfwjlEZB31NsRwJW8XR9MxCqRxAb7bZx6B5460sgOT+9NhHjkP
 AQWg==
X-Gm-Message-State: AOAM532JMxXhs5FWPvAqWFyqya32YPgAqAxXMMWUE4kKEk7O2GnwxzzX
 J9nv2ETgnmYSohuRD5oTLxBWfjJp5UIcv4BQO6a/Uo2loRuh/1Nw0sO1kR3BPxLsosS9w+iS++F
 PzVo2qnEnUImBahI=
X-Received: by 2002:adf:8b19:: with SMTP id n25mr44464195wra.216.1632314738288; 
 Wed, 22 Sep 2021 05:45:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1UgqVKqqv+OwmlG9EsBmZZaBnsdYjUqeDqD6xwYrLDUaZEwEzLX6h98DnqtS4Lkbyb2pcPQ==
X-Received: by 2002:adf:8b19:: with SMTP id n25mr44464170wra.216.1632314738050; 
 Wed, 22 Sep 2021 05:45:38 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64dd.dip0.t-ipconnect.de. [91.12.100.221])
 by smtp.gmail.com with ESMTPSA id s15sm2169384wrb.22.2021.09.22.05.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 05:45:37 -0700 (PDT)
Subject: Re: [PATCH v1] monitor: Consider "id" when rate-limiting
 MEMORY_DEVICE_SIZE_CHANGE qapi events
From: David Hildenbrand <david@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
References: <20210921102434.24273-1-david@redhat.com>
 <878rzolsim.fsf@dusky.pond.sub.org>
 <3f70fe6d-d7b3-5a51-df5f-b4cd3efa7a36@redhat.com>
Organization: Red Hat
Message-ID: <13509a92-7be0-ae59-fa0e-1d45ca4fc0ff@redhat.com>
Date: Wed, 22 Sep 2021 14:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3f70fe6d-d7b3-5a51-df5f-b4cd3efa7a36@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 22.09.21 14:20, David Hildenbrand wrote:
> On 22.09.21 14:11, Markus Armbruster wrote:
>> David Hildenbrand <david@redhat.com> writes:
>>
>>> We have to consider the device id, otherwise we'll lose some events for
>>> unrelated devices. If the device does not have a device id (very unlikely),
>>> the target of the notifications has to update the size of all devices
>>> manually either way.
>>>
>>> This was noticed by starting a VM with two virtio-mem devices that each
>>> have a requested size > 0. The Linux guest will initialize both devices
>>> in parallel, resulting in losing MEMORY_DEVICE_SIZE_CHANGE events for
>>> one of the devices.
>>
>> Fascinating.
>>
>> Event rate limiting works as follows.
>>
>> An event is rate-limited when monitor_qapi_event_conf[event].rate != 0.
>>
>> When such an event arrives, it is held in a bucket until a timer
>> associated with the bucket expires.  Putting an event in an empty bucket
>> starts its timer.  Putting an event in a non-empty bucket replaces its
>> old contents.
>>
>> The bucket to use for an event depends on its event type, and for some
>> events also on certain event arguments.
>>
>> This patch solves the "MEMORY_DEVICE_SIZE_CHANGE events from different
>> devices eat each other" by splitting the event's bucket.
> 
> Right, that's how it's getting used in libvirt where we noticed it.
> 
>>
>> The split is imperfect: each device with a qdev ID gets its own bucket,
>> all devices without ID have to share a bucket.
> 
> Yes, it's far from perfect. Fortunately upper layers (libvirt) barely do
> that.
> 
>>
>> This is actually a flaw in the event's design: you can't distinguish
>> events from different devices without IDs.
>>
>> To fix that flaw, add the QOM path to the event.
> 
> So the idea would be to extend the event by an optional QOM path
> (because it's an existing event), but always setting it internally?
> 

Thinking about it, not optional, because we always have a QOM path and 
extending an event with something not optional should just work AFAIKT.

Just implemented it, seems to work just fine. Will send a v2 -- thanks!

-- 
Thanks,

David / dhildenb


