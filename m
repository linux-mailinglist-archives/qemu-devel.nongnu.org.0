Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0AB3BF61E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 09:16:38 +0200 (CEST)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1OGz-00025E-7A
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 03:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1OFJ-0000ZX-BZ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:14:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1OFG-00054G-Iv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625728489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SvnYOp7N9dSi1lskfdj2KpQOHcR4DLJqCdMPgdf0yp0=;
 b=hoM92oQ+ipLgTdYiV/y32X/C9rfpjsySrMPyEEpNnpQYRDAh4zwYrfJJBaMzlH6QVW1voL
 RHIePBJyHo2PXUdGO2hemeMX6zV+pr57//kL44ZQFAZPvLljderAcXeis2DuDWR/Km6jY0
 WIz8V8ZQn7m6uJAD0NeVpQFFkQ2Acbc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-qooJAebRMEGehPWYEU1EdA-1; Thu, 08 Jul 2021 03:14:48 -0400
X-MC-Unique: qooJAebRMEGehPWYEU1EdA-1
Received: by mail-wr1-f71.google.com with SMTP id
 l12-20020a5d410c0000b029012b4f055c9bso1624557wrp.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 00:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SvnYOp7N9dSi1lskfdj2KpQOHcR4DLJqCdMPgdf0yp0=;
 b=dWDrNblIazpj7jS8+J/CQxilzvGnRTgV2twH1b+RcUDoQYnL6Aim4xoQHYAgiLF5zg
 A2yWJLf26B3MFttlJ96+5DOfBAp+Tvy2fOYcove5oJUOGBKuYklf2vSPZCl3tMC/qqRJ
 Ecs/JhVUpzR2kG6AQu9PSqbkSt3AIXkCnW13HvsIrRvJlrgX5mHcvOPcmfYTRHauZ/wo
 6b8ZfToTAw5ZFHan3Sr3WE8RjCbwwAZbdf+4fmyxhuWmQPyRYWrTcYiphDniabJ20p/E
 ajmihaxAZ/wVkVwC8OAMk7BUIdoUZVI9xC2iRbADx12LTL/RtMZ8O+pn7tqEf4qVL29N
 aw0w==
X-Gm-Message-State: AOAM531X+KihWcPg9R/eC3BAi0sXf9Wr+CJmx6m3b+1FFI9TImwGAJOz
 iHEEPWiMuwF89PKo551pozpS0OT22kPcgHoYtNcIek2nQANopbtGZCDibEZQ/iToViNuuwkMmXX
 n8J5gpx6RadC2Oj8=
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr7059816wmh.173.1625728486958; 
 Thu, 08 Jul 2021 00:14:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya8PaPJmddJICa48OjlqIskCfH9uy9URFxU3vLqxr30T8zxXjQq9hJSb8jwfmqFU0ezy7Gyg==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr7059788wmh.173.1625728486705; 
 Thu, 08 Jul 2021 00:14:46 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23cf9.dip0.t-ipconnect.de. [79.242.60.249])
 by smtp.gmail.com with ESMTPSA id f18sm1315853wru.53.2021.07.08.00.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 00:14:46 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, Alexander Duyck <alexander.duyck@gmail.com>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com> <YOXsTQoq6eeIR8B5@t490s>
 <5f5dd7f3-ce09-53d6-db48-1a333119205d@redhat.com> <YOYJsMUfx1XHFk6G@t490s>
 <CAKgT0Ucp60nxvk4ysydE29RPXUEFUU2f4+=3XMaXFagMef+hbA@mail.gmail.com>
 <YOYtZVM74cx7aRL5@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <06249318-9ef6-e309-308b-53b51d4f6d6d@redhat.com>
Date: Thu, 8 Jul 2021 09:14:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOYtZVM74cx7aRL5@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, Wei Wang <wei.w.wang@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.07.21 00:40, Peter Xu wrote:
> On Wed, Jul 07, 2021 at 02:22:32PM -0700, Alexander Duyck wrote:
>> On Wed, Jul 7, 2021 at 1:08 PM Peter Xu <peterx@redhat.com> wrote:
>>>
>>> On Wed, Jul 07, 2021 at 08:57:29PM +0200, David Hildenbrand wrote:
>>>> On 07.07.21 20:02, Peter Xu wrote:
>>>>> On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
>>>>>> As it never worked properly, let's disable it via the postcopy notifier on
>>>>>> the destination. Trying to set "migrate_set_capability postcopy-ram on"
>>>>>> on the destination now results in "virtio-balloon: 'free-page-hint' does
>>>>>> not support postcopy Error: Postcopy is not supported".
>>>>>
>>>>> Would it be possible to do this in reversed order?  Say, dynamically disable
>>>>> free-page-hinting if postcopy capability is set when migration starts? Perhaps
>>>>> it can also be re-enabled automatically when migration completes?
>>>>
>>>> I remember that this might be quite racy. We would have to make sure that no
>>>> hinting happens before we enable the capability.
>>>>
>>>> As soon as we messed with the dirty bitmap (during precopy), postcopy is no
>>>> longer safe. As noted in the patch, the only runtime alternative is to
>>>> disable postcopy as soon as we actually do clear a bit. Alternatively, we
>>>> could ignore any hints if the postcopy capability was enabled.
>>>
>>> Logically migration capabilities are applied at VM starts, and these
>>> capabilities should be constant during migration (I didn't check if there's a
>>> hard requirement; easy to add that if we want to assure it), and in most cases
>>> for the lifecycle of the vm.
>>
>> Would it make sense to maybe just look at adding a postcopy value to
>> the PrecopyNotifyData that you could populate with
>> migration_in_postcopy() in precopy_notify()?
> 
> Should we check migrate_postcopy_ram() rather than migration_in_postcopy()?
Right, we care about the source only -- if postcopy could be started.

> 
>>
>> Then all you would need to do is check for that value and if it is set
>> you shut down the page hinting or don't start it since I suspect it
>> wouldn't likely add any value anyway since I would think flagging
>> unused pages doesn't add much value in a postcopy environment anyway.
>>

We'd have to never kick it off right from the start as I explained 
previously. As soon as you messed with the bitmaps it's problematic.

>>>>
>>>> Whatever we do, we have to make sure that a user cannot trick the system
>>>> into an inconsistent state. Like enabling hinting, starting migration, then
>>>> enabling the postcopy capability and kicking of postcopy. I did not check if
>>>> we allow for that, though.
>>>
>>> We could turn free page hinting off when migration starts with postcopy-ram=on,
>>> then re-enable it after migration finishes.  That looks very safe to me.  And I
>>> don't even worry on user trying to mess it up - as that only put their own VM
>>> at risk; that's mostly fine to me.
>>
>> We wouldn't necessarily even need to really turn it off, just don't
>> start it. I wonder if we couldn't just get away with adding a check to
>> the existing virtio_balloon_free_page_hint_notify to see if we are in
>> the postcopy state there and just shut things down or not start them.
> 
> This makes me wonder whether qemu_guest_free_page_hint() should be called at
> all on destination host when incoming postcopy migration is in progress.

It really shouldn't. And if it would currently happen, it would be due 
to issue 1. described in the patch description that will be fixed 
independently, such that hinting is completely done once running on the 
destination.

> 
> Right now the check migration_is_setup_or_active() should return true on
> destination host, however I am not sure if that's necessary as we don't track
> dirty at all there.

migration_is_setup_or_active(s->state) uses migrate_get_current(), which 
gives us the outgoing state (source) not the incoming state (destination).

-- 
Thanks,

David / dhildenb


