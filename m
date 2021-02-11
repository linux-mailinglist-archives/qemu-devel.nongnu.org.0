Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9E3193FB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:10:52 +0100 (CET)
Received: from localhost ([::1]:35764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIId-0000qt-Am
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAHXA-0006KR-Vq
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:21:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAHX9-0004hs-5T
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613071306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNVlzPIdldsfc4ntQqcTOg+kscp0sxuQYpZK5hICgig=;
 b=iU9vglFkWShNLszwH/+LmE0PJt5k1GuGTtXWDGl66cYvXjk0XYQVfLCVHd4REI5AHd2FcS
 n+IpJKkRGIRIn68W9tgdupthpzPuqUEsaonoikfwJkqu2JhJwYWZV2+FMHtSti5FOcDM6M
 IOy6zOvd7cuyT4TklFftkKcl/RCO5oY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-fHY28AvENV6Ed7xceD4TSg-1; Thu, 11 Feb 2021 14:21:44 -0500
X-MC-Unique: fHY28AvENV6Ed7xceD4TSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE80D10082F5;
 Thu, 11 Feb 2021 19:21:42 +0000 (UTC)
Received: from [10.36.112.31] (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45FB06E505;
 Thu, 11 Feb 2021 19:21:35 +0000 (UTC)
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <8efe21c6-475d-2538-01c1-659f9d44491e@redhat.com>
Date: Thu, 11 Feb 2021 20:21:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.02.21 19:38, Andrey Gruzdev wrote:
> On 09.02.2021 15:37, David Hildenbrand wrote:
>> On 21.01.21 16:24, andrey.gruzdev--- via wrote:
>>> This patch series is a kind of 'rethinking' of Denis Plotnikov's
>>> ideas he's
>>> implemented in his series '[PATCH v0 0/4] migration: add background
>>> snapshot'.
>>>
>>> Currently the only way to make (external) live VM snapshot is using
>>> existing
>>> dirty page logging migration mechanism. The main problem is that it
>>> tends to
>>> produce a lot of page duplicates while running VM goes on updating
>>> already
>>> saved pages. That leads to the fact that vmstate image size is
>>> commonly several
>>> times bigger then non-zero part of virtual machine's RSS. Time
>>> required to
>>> converge RAM migration and the size of snapshot image severely depend
>>> on the
>>> guest memory write rate, sometimes resulting in unacceptably long
>>> snapshot
>>> creation time and huge image size.
>>>
>>> This series propose a way to solve the aforementioned problems. This
>>> is done
>>> by using different RAM migration mechanism based on UFFD write
>>> protection
>>> management introduced in v5.7 kernel. The migration strategy is to
>>> 'freeze'
>>> guest RAM content using write-protection and iteratively release
>>> protection
>>> for memory ranges that have already been saved to the migration stream.
>>> At the same time we read in pending UFFD write fault events and save
>>> those
>>> pages out-of-order with higher priority.
>>>
>>
>> Hi,
>>
>> just stumbled over this, quick question:
>>
>> I recently played with UFFD_WP and notices that write protection is
>> only effective on pages/ranges that have already pages populated (IOW:
>> !pte_none() in the kernel).
>>
>> In case memory was never populated (or was discarded using e.g.,
>> madvice(DONTNEED)), write-protection will be skipped silently and you
>> won't get WP events for applicable pages.
>>
>> So if someone writes to a yet unpoupulated page ("zero"), you won't
>> get WP events.
>>
>> I can spot that you do a single uffd_change_protection() on the whole
>> RAMBlock.
>>
>> How are you handling that scenario, or why don't you have to handle
>> that scenario?
>>
> Hi David,
> 
> I really wonder if such a problem exists.. If we are talking about a
> write to an unpopulated page, we should get first page fault on
> non-present page and populate it with protection bits from respective vma.
> For UFFD_WP vma's  page will be populated non-writable. So we'll get
> another page fault on present but read-only page and go to handle_userfault.
> 

Hi,

here is another fun issue.

Assume you

1. Have a populated page, with some valuable content
2. WP protected the page
3. madvise(DONTNEED) that page
4. Write to the page

On write access, you won't get a WP event!

Instead, you will get a UFFD_EVENT_REMOVE during 3. But you cannot stop 
that event (dont wake), so you cannot simply defer as you can do with WP 
events.


So if the guest inflates the balloon (including balloon page migration 
in Linux) or free-page-reporting reports a free page while snapshotting 
is active, you won't be able to save the old content before it is zapped 
and your snapshot misses pages with actual content.

Something similar would happen with virtio-mem when unplugging blocks, 
however, it does not discard any pages while migration is active.


Snapshotting seems to be incompatible with concurrent discards via 
virtio-balloon. You might want to inhibit ballooning while snapshotting 
is active in

hw/virtio/virtio-balloon.c:virtio_balloon_inhibited() just as we do for 
postcopy.


-- 
Thanks,

David / dhildenb


