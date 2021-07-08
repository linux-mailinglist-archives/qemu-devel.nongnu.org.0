Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835153BF6DA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 10:20:36 +0200 (CEST)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1PGt-0003Jn-JS
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 04:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1PFv-0002fD-Lg
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:19:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1PFs-0008Tu-LB
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625732371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cH+4Yjf2eIz1YyivKEM3vEEzQyX0DbbxxTqKi0dJ8sw=;
 b=MEF5/CacrPAZR8zJncvPOQW7iWI+GlbYYUhUg0ZRhsxR1Juz6B6UqLLge+TjHhhSNxJ0wL
 CTmoUjMpFibI2Yh1RjXVDX43Wq/l7PmjNoM2f05Zp5ZV/b3eVSLg0jqVkX1/cxHhLlC1V0
 X6Djq4EWWIOz4a4uzjgfNY60GWkLZu0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-e3Xd660LOi6rBmCVG_YREg-1; Thu, 08 Jul 2021 04:19:30 -0400
X-MC-Unique: e3Xd660LOi6rBmCVG_YREg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so853558wmj.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 01:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cH+4Yjf2eIz1YyivKEM3vEEzQyX0DbbxxTqKi0dJ8sw=;
 b=AmU823Bd7q3aFYyK1yICjar1imXwrmf73yDB+gp7MMWyGy74Ust+hq/OV38og4aMZ8
 qFaeawE+uwTvtRiieV+cFySv+QPm4cUZq4LW9IvXmdjosIHRqL6DfPWDYRaylsb7phbD
 Y4RAO5JaEW6jHcgzaL62CMDu9U2ZOnYg9T3u9GChaYyj8Cq4xzI8nAqEh8wkIclioDBa
 +3b+4OmqNMdPZSY7x7kYlmxVBIVxRwBXn1m2DNXvWp2fXXfpQ03o48DxYS/Cyl0uRIoC
 iLTnHBgIhqYp05NORvNOhCE8n2yZN5GN7yBKgtxOUnWeKpzJSUTblxQZuVTqeq6M4QR3
 wnSQ==
X-Gm-Message-State: AOAM530ZvVwkzUF+VZJmeKuRbnOM6n4P+GHUz5D9GR/hg3jrh7G4hhEC
 LNkbz8fmQHw4fQh2br0OiRyiCUqosPxxSxuYAIP2gR59mXjNll9aULHKuTKy4gp6ENdNpI1XMMh
 qFCLqzn1Gp/M7OhU=
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr3832105wmh.5.1625732368832;
 Thu, 08 Jul 2021 01:19:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4QWnsRfTIdMhm+3L6pXCALpbfKrDCUqW9Yn8b/3TVD3yiFfjnMYDnoRD9Fo4oH4khM+PSpw==
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr3832083wmh.5.1625732368526;
 Thu, 08 Jul 2021 01:19:28 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23cf9.dip0.t-ipconnect.de. [79.242.60.249])
 by smtp.gmail.com with ESMTPSA id j12sm1028737wrq.83.2021.07.08.01.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 01:19:28 -0700 (PDT)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com>
 <20210707150038-mutt-send-email-mst@kernel.org>
 <0391e06b-5885-8000-3c58-ae20493e3e65@redhat.com>
 <20210707151459-mutt-send-email-mst@kernel.org>
 <40a148d7-acad-67ee-ac66-e9ad56a23b44@redhat.com>
 <20210707155413-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <e79fd18c-aa62-c1d8-c7f3-ba3fc2c25fc8@redhat.com>
Date: Thu, 8 Jul 2021 10:19:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707155413-mutt-send-email-mst@kernel.org>
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>, qemu-stable@nongnu.org,
 Wei Wang <wei.w.wang@intel.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.07.21 21:57, Michael S. Tsirkin wrote:
> On Wed, Jul 07, 2021 at 09:47:31PM +0200, David Hildenbrand wrote:
>> On 07.07.21 21:19, Michael S. Tsirkin wrote:
>>> On Wed, Jul 07, 2021 at 09:14:00PM +0200, David Hildenbrand wrote:
>>>> On 07.07.21 21:05, Michael S. Tsirkin wrote:
>>>>> On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
>>>>>> Postcopy never worked properly with 'free-page-hint=on', as there are
>>>>>> at least two issues:
>>>>>>
>>>>>> 1) With postcopy, the guest will never receive a VIRTIO_BALLOON_CMD_ID_DONE
>>>>>>       and consequently won't release free pages back to the OS once
>>>>>>       migration finishes.
>>>>>>
>>>>>>       The issue is that for postcopy, we won't do a final bitmap sync while
>>>>>>       the guest is stopped on the source and
>>>>>>       virtio_balloon_free_page_hint_notify() will only call
>>>>>>       virtio_balloon_free_page_done() on the source during
>>>>>>       PRECOPY_NOTIFY_CLEANUP, after the VM state was already migrated to
>>>>>>       the destination.
>>>>>>
>>>>>> 2) Once the VM touches a page on the destination that has been excluded
>>>>>>       from migration on the source via qemu_guest_free_page_hint() while
>>>>>>       postcopy is active, that thread will stall until postcopy finishes
>>>>>>       and all threads are woken up. (with older Linux kernels that won't
>>>>>>       retry faults when woken up via userfaultfd, we might actually get a
>>>>>>       SEGFAULT)
>>>>>>
>>>>>>       The issue is that the source will refuse to migrate any pages that
>>>>>>       are not marked as dirty in the dirty bmap -- for example, because the
>>>>>>       page might just have been sent. Consequently, the faulting thread will
>>>>>>       stall, waiting for the page to be migrated -- which could take quite
>>>>>>       a while and result in guest OS issues.
>>>>>
>>>>> OK so if source gets a request for a page which is not dirty
>>>>> it does not respond immediately? Why not just teach it to
>>>>> respond? It would seem that if destination wants a page we
>>>>> should just give it to the destination ...
>>>>
>>>> The source does not know if a page has already been sent (e.g., via the
>>>> background migration thread that moves all data over) vs. the page has not
>>>> been send because the page was hinted. This is the part where we'd need
>>>> additional tracking on the source to actually know that.
>>>>
>>>> We must not send a page twice, otherwise bad things can happen when placing
>>>> pages that already have been migrated, because that scenario can easily
>>>> happen with ordinary postcopy (page has already been sent and we're dealing
>>>> with a stale request from the destination).
>>>
>>> OK let me get this straight
>>>
>>> A. source sends page
>>> B. destination requests page
>>> C. destination changes page
>>> D. source sends page
>>> E. destination overwrites page
>>>
>>> this is what you are worried about right?
>>
>> IIRC E. is with recent kernels:
>>
>> E. placing the page fails with -EEXIST and postcopy migration fails
>>
>> However, the man page (man ioctl_userfaultfd) doesn't describe what is
>> actually supposed to happen when double-placing. Could be that it's
>> "undefined behavior".
>>
>> I did not try, though.
>>
>>
>> This is how it works today:
>>
>> A. source sends page and marks it clean
>> B. destination requests page
>> C. destination receives page and places it
>> D. source ignores request as page is clean
> 
> If it's actually -EEXIST then we could just resend it
> and teach destination to ignore -EEXIST errors right?

I think checking the received bitmap would be more robust.

> 
> Will actually make things a bit more robust: destination
> handles its own consistency instead of relying on source.

TBH, I don't think having multiple copies of the same page in flight is 
neither a very good design, nor robust.

In an idea world, the destination would make sure to send a page only 
once and the source would expect to receive a page only once. This is 
currently the case except for free page hinting, where a page might not 
be sent as we're relying on the dirty bitmap to also track what has been 
already sent.

The destination does handle consistently right now by bailing out if it 
receives the page twice (e.g., -EEXIST). In addition, we could consult 
the received bitmap to make sure we really only receive stuff once 
instead of relying on undocumented userfaultfd behavior. On the source, 
we'd ideally have a "sent bitmap", but I'll really avoid introducing new 
bitmaps because that can't be the ultimate solution (dirty, clean, 
received, ...).


I just found the comment that describes the current design: 
migration/ram.c:get_queued_page()

"We're sending this page, and since it's postcopy nothing else will 
dirty it, and we must make sure it doesn't get sent again even if this 
queue request was received after the background search already sent it."

> 
>>>
>>> the fix is to mark page clean in A.
>>> then in D to not send page if it's clean?
>>>
>>> And the problem with hinting is this:
>>>
>>> A. page is marked clean
>>> B. destination requests page
>>> C. destination changes page
>>> D. source sends page <- does not happen, page is clean!
>>> E. destination overwrites page
>>
>> Simplified it's
>>
>> A. page is marked clean by hinting code
>> B. destination requests page
>> D. source ignores request as page is clean
>> E. destination stalls until postcopy unregisters uffd
>>
>>
>> Some thoughts
>>
>> 1. We do have a a recv bitmap where we track received pages on the
>> destination (e.g., ramblock_recv_bitmap_test()), however we only use it to
>> avoid sending duplicate requests to the hypervisor AFAIKs, and don't check
>> it when placing pages.
>>
>> 2. Changing the migration behavior unconditionally on the source will break
>> migration to old QEMU binaries that cannot handle this change.
> 
> We can always make this depend on new machine types.

Yes, we could if we want to go down that path.

> 
> 
>> 3. I think the current behavior is in place to make debugging easier. If
>> only a single instance of a page will ever be migrated from source to
>> destination, there cannot be silent data corruption. Further, we avoid
>> migrating unnecessarily pages twice.
>>
> 
> Likely does not matter much for performance, it seems unlikely that
> the race is all that common.

I cannot really tell, I'd guess it can happen but shouldn't happen too 
often.


For now I'm going to keep it simple and ignore free page hints while 
postcopy has been enabled as suggested in the other discussion. That 
should be the easy fix and if someone wants to optimize this scenarios, 
we can think about a proper way to make it fly (as I said, nobody seemed 
to really have cared in the past as it's mostly broken right now).

Thanks for the helpful discussion!

-- 
Thanks,

David / dhildenb


