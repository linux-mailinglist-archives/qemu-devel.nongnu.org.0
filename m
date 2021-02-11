Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B831931E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:31:26 +0100 (CET)
Received: from localhost ([::1]:45670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHgT-0006WH-C3
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAHDn-0006Io-Ma
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:01:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAHDl-0006IC-HK
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FRk7rFBA3CLjMEGNREAt/0gPNOc4VMPKZpBzGw8yoM=;
 b=gPaS5jUW7jr0XH2CvCQooBY8OaxzXSf2ibwMyWVF/Ax2FhvoopZgLzTR6PgsHszyXfyP20
 F4aLItg3RXmPwQ7TBttBcnDYWWS01R8+OzxOtfgaoUEtX7krU76j30z2/T6dJIHcnQBs+I
 /ufKe568Sz+0t8/siNIDGJcSZevoPaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-_g6p9teoMh-Pqbglh2ZVFw-1; Thu, 11 Feb 2021 14:01:40 -0500
X-MC-Unique: _g6p9teoMh-Pqbglh2ZVFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40F49107ACC7;
 Thu, 11 Feb 2021 19:01:39 +0000 (UTC)
Received: from [10.36.112.27] (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65A3D10013D7;
 Thu, 11 Feb 2021 19:01:30 +0000 (UTC)
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, Peter Xu <peterx@redhat.com>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
 <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
 <d7dcfbf8-8f33-065b-47a9-802952732218@virtuozzo.com>
 <20210211173215.GC157159@xz-x1>
 <13142aee-fc4f-372c-d216-8b38484ba8e8@virtuozzo.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <be380197-559f-4b76-2632-34ea4cf3d55b@redhat.com>
Date: Thu, 11 Feb 2021 20:01:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <13142aee-fc4f-372c-d216-8b38484ba8e8@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.02.21 19:28, Andrey Gruzdev wrote:
> On 11.02.2021 20:32, Peter Xu wrote:
>> On Thu, Feb 11, 2021 at 07:19:47PM +0300, Andrey Gruzdev wrote:
>>> On 09.02.2021 22:06, David Hildenbrand wrote:
>>>>>> Hi,
>>>>>>
>>>>>> just stumbled over this, quick question:
>>>>>>
>>>>>> I recently played with UFFD_WP and notices that write protection is
>>>>>> only effective on pages/ranges that have already pages populated (IOW:
>>>>>> !pte_none() in the kernel).
>>>>>>
>>>>>> In case memory was never populated (or was discarded using e.g.,
>>>>>> madvice(DONTNEED)), write-protection will be skipped silently and you
>>>>>> won't get WP events for applicable pages.
>>>>>>
>>>>>> So if someone writes to a yet unpoupulated page ("zero"), you won't
>>>>>> get WP events.
>>>>>>
>>>>>> I can spot that you do a single uffd_change_protection() on the whole
>>>>>> RAMBlock.
>>>>>>
>>>>>> How are you handling that scenario, or why don't you have to handle
>>>>>> that scenario?
>>>>>>
>>>>> Hi David,
>>>>>
>>>>> I really wonder if such a problem exists.. If we are talking about a
>>>> I immediately ran into this issue with my simplest test cases. :)
>>>>
>>>>> write to an unpopulated page, we should get first page fault on
>>>>> non-present page and populate it with protection bits from
>>>>> respective vma.
>>>>> For UFFD_WP vma's  page will be populated non-writable. So we'll get
>>>>> another page fault on present but read-only page and go to
>>>>> handle_userfault.
>>>> See the attached test program. Triggers for me on 5.11.0-rc6+ and
>>>> 5.9.13-200.fc33
>>>>
>>>> gcc -lpthread uffdio_wp.c -o uffdio_wp
>>>> ./uffdio_wp
>>>> WP did not fire
>>>>
>>>> Uncomment the placement of the zeropage just before registering to make
>>>> the WP actually trigger. If there is no PTE, there is nothing to
>>>> protect.
>>>>
>>>>
>>>> And it makes sense: How should the fault handler know which ranges you
>>>> wp-ed, if there is no place to store that information (the PTEs!). The
>>>> VMA cannot tell that story, it only knows that someone registered
>>>> UFFD_WP to selectively wp some parts.
>>>>
>>>> You might have to register also for MISSING faults and place zero pages.
>>>>
>>> Looked at the kernel code, agree that we miss WP events for unpopulated
>>> pages, UFFD_WP softbit won't be set in this case. But it doesn't make saved
>>> snapshot inconsistent or introduce security issues. The only side effect is
>>> that we may save updated page instead of zeroed, just increasing snapshot
>>> size. However this guest-physical page has never been touched from the point
>>> of view of saved vCPU/device state and is not a concern.
>> Oh I just remembered one thing, that Linux should be zeroing pages when
>> allocating, so even if the page has legacy content it'll be cleared with
>> __GFP_ZERO allocations.  So yeah it would be harder to have issue at least with
>> a sensible OS.  I'm not sure about Windows or others, but it could be a common
>> case.  Then the only overhead is the extra pages we kept in the live snapshot,
>> which takes some more disk space.
>>
>> Or there could be firmware running without OS at all, but it should really not
>> read unallocated pages assuming there must be zero.  It's not a sane behavior
>> even for a firmware.
>>
>>> Often (at least on desktop Windows guests) only a small part of RAM has ever
>>> been allocated by guest. Migration code needs to read each guest-physical
>>> page, so we'll have a lot of additional UFFD events, much more MISSING
>>> events then WP-faults.
>>>
>>> And the main problem is that adding MISSING handler is impossible in current
>>> single-threaded snapshot code. We'll get an immediate deadlock on iterative
>>> page read.
>> Right.  We'll need to rework the design but just for saving a bunch of snapshot
>> image disk size.  So now I agree with you, let's keep this in mind, but maybe
>> it isn't worth a fix for now, at least until we figure something really broken.
>>
>> Andrey, do you think we should still mention this issue into the todo list of
>> the wiki page of live snapshot?
>>
>> Thanks,
>>
> Yes, even if the page happens to be overwritten, it's overwritten by the same VM so
> no security boundaries are crossed. And no machine code can assume that RAM content
> is zeroed on power-on or reset so our snapshot state stays quite consistent.
> 
> Agree we should keep it in mind, but IMHO adding MISSING handler and running separate
> thread would make performance worse.. So I doubt it's worth adding this to TODO list..
> 

So, here is what happens: your snapshot will contain garbage at places 
where it should contain zero.

This happens when your guest starts using an unpopulated page after 
snapshotting started and the page has not been copied to the snapshot 
yet. You won't get a WP event, therefore you cannot copy "zero" to the 
snapshot before content gets overridden.

If you load your snapshot, it contains garbage at places that are 
supposed to contain zero.


There is a feature in virtio-balloon that *depends* on previously 
discarded pages from staying unmodified in some cases: free page reporting.

The guest will report pages (that might have been initialized to zero) 
to the hypervisor). The hypervisor will discard page content if the 
content was initialized to zero. After that, the guest is free to reuse 
the pages anytime with the guarantee that content has not been modified 
(-> still is zero).


See QEMU hw/virtio/virtio-balloon.c: virtio_balloon_handle_report()

"When we discard the page it has the effect of removing the page from 
the hypervisor itself and causing it to be zeroed when it is returned to 
us. So we must not discard the page [...] if the guest is expecting it 
to retain a non-zero value."

And Linux drivers/virtio/virtio_balloon.c: virtballoon_validate()

"Inform the hypervisor that our pages are poisoned or initialized. If we 
cannot do that then we should disable page reporting as it could 
potentially change the contents of our free pages."


It's as simple as having a Linux guest with init_on_free and 
free-page-reporting active via virtio-balloon.

Long story short, your feature might break guests (when continuing the 
snapshot) when free page reporting is active. I agree that MISSING 
events might be too heavy, so you should disable snapshots if free page 
reporting is active.

-- 
Thanks,

David / dhildenb


