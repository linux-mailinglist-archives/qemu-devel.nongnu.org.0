Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA73BF019
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:15:00 +0200 (CEST)
Received: from localhost ([::1]:57456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1D0d-0005tU-4q
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1Czn-00053N-JH
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1Czl-0004yA-3i
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625685244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsmhZQbhieDND7EelZWzeL+gwaZkwwmR1U8RNvnx6qM=;
 b=RdOffT0EIwhhDGrrMEoI4Vy+3vnOYmC0TgtQQ0iYYilXX60VFO9fmMCtK5dlgqiZ0PJ6g+
 8zQRu/DYoh9w7CQZABKwjlMozpVT69wkpIkoQVAmqGRaCuFlP2HM3MX1rPUYnuRVSvgymR
 PU0YIHHtfli0MPjWmnuSRmWG4gsAfEs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-porSAdNJNf2rLtDgA9ToHg-1; Wed, 07 Jul 2021 15:14:03 -0400
X-MC-Unique: porSAdNJNf2rLtDgA9ToHg-1
Received: by mail-wm1-f71.google.com with SMTP id
 i3-20020a05600c3543b02902075ed92710so2859678wmq.0
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 12:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lsmhZQbhieDND7EelZWzeL+gwaZkwwmR1U8RNvnx6qM=;
 b=me+aAzpPR8hgIXbel6Gx4l/tGUKl945xoICkqF+T03liTu01GFGduWBUtYYXW6fge9
 Ufl+B66VPrXHFFc9g8qP13R9QtxTUM3PPmdseNCqGri1rhJoCWeM2//VqFdGyU7B+82p
 skBpp7n7BLDezjN0YQYJNhI1u4+vOu+Hxmuui5DiyE0kQy5QXZy2rl688AY89p4ZKftO
 37JUoklKbxzxPZNnP7WhLzMAdt3PARshUjTzPotvVUH1Zsbvjg0nZBpscE0GGa9jbBDD
 3dfhp3ZRyUpZV15HERqEka5TZfEgtOzJtj8LM+eSCHggYjRfVJMeiZT6Vz+A0TL5eJBU
 2gZg==
X-Gm-Message-State: AOAM532/x6i9l7zD7aUPrQQJnBXemHSODlMu4EYguQQ+lpYpRlycru05
 CwgTJzfY+VqCtKo9gLdhcZdixx9VsQgYNRcKx6L1CGm801iy33/KhPXkGWsrQtLIuBZivTutBkz
 A4ihNiCotaKqVI+k=
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr27451654wmq.105.1625685242175; 
 Wed, 07 Jul 2021 12:14:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0zJopyWSmS/Or25EZ090kCyCjVxZGDOduCLyS7SN7bpAI4uYdlKAA9J+f83JncY5gnMZ3Qw==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr27451617wmq.105.1625685241812; 
 Wed, 07 Jul 2021 12:14:01 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23579.dip0.t-ipconnect.de. [79.242.53.121])
 by smtp.gmail.com with ESMTPSA id a9sm20546443wrv.37.2021.07.07.12.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 12:14:01 -0700 (PDT)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com>
 <20210707150038-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <0391e06b-5885-8000-3c58-ae20493e3e65@redhat.com>
Date: Wed, 7 Jul 2021 21:14:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707150038-mutt-send-email-mst@kernel.org>
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

On 07.07.21 21:05, Michael S. Tsirkin wrote:
> On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
>> Postcopy never worked properly with 'free-page-hint=on', as there are
>> at least two issues:
>>
>> 1) With postcopy, the guest will never receive a VIRTIO_BALLOON_CMD_ID_DONE
>>     and consequently won't release free pages back to the OS once
>>     migration finishes.
>>
>>     The issue is that for postcopy, we won't do a final bitmap sync while
>>     the guest is stopped on the source and
>>     virtio_balloon_free_page_hint_notify() will only call
>>     virtio_balloon_free_page_done() on the source during
>>     PRECOPY_NOTIFY_CLEANUP, after the VM state was already migrated to
>>     the destination.
>>
>> 2) Once the VM touches a page on the destination that has been excluded
>>     from migration on the source via qemu_guest_free_page_hint() while
>>     postcopy is active, that thread will stall until postcopy finishes
>>     and all threads are woken up. (with older Linux kernels that won't
>>     retry faults when woken up via userfaultfd, we might actually get a
>>     SEGFAULT)
>>
>>     The issue is that the source will refuse to migrate any pages that
>>     are not marked as dirty in the dirty bmap -- for example, because the
>>     page might just have been sent. Consequently, the faulting thread will
>>     stall, waiting for the page to be migrated -- which could take quite
>>     a while and result in guest OS issues.
> 
> OK so if source gets a request for a page which is not dirty
> it does not respond immediately? Why not just teach it to
> respond? It would seem that if destination wants a page we
> should just give it to the destination ...

The source does not know if a page has already been sent (e.g., via the 
background migration thread that moves all data over) vs. the page has 
not been send because the page was hinted. This is the part where we'd 
need additional tracking on the source to actually know that.

We must not send a page twice, otherwise bad things can happen when 
placing pages that already have been migrated, because that scenario can 
easily happen with ordinary postcopy (page has already been sent and 
we're dealing with a stale request from the destination).

> 
> 
>>
>> While we could fix 1), for example, by calling
>> virtio_balloon_free_page_done() via pre_save callbacks of the
>> vmstate, 2) is mostly impossible to fix without additional tracking,
>> such that we can actually identify these hinted pages and handle
>> them accordingly.
>> As it never worked properly, let's disable it via the postcopy notifier on
>> the destination. Trying to set "migrate_set_capability postcopy-ram on"
>> on the destination now results in "virtio-balloon: 'free-page-hint' does
>> not support postcopy Error: Postcopy is not supported".
>> Note 1: We could let qemu_guest_free_page_hint() mark postcopy
>>          as broken once actually clearing bits on the source. However, it's
>>          harder to realize as we can race with users starting postcopy
>>          and we cannot produce an expressive error message easily.
> 
> 
> How about the reverse? Ignore qemu_guest_free_page_hint if postcopy
> started?  Seems better than making it user/guest visible ..

Might be an option, but we let the user configure something that does 
not work in combination ... essentially ignoring one of both user 
settings. Also not perfect IMHO.

> 
>> Note 2: virtio-mem has similar issues, however, access to "unplugged"
>>          memory by the guest is very rare and we would have to be very
>>          lucky for it to happen during migration. The spec states
>>          "The driver SHOULD NOT read from unplugged memory blocks ..."
>>          and "The driver MUST NOT write to unplugged memory blocks".
>>          virtio-mem will move away from virtio_balloon_free_page_done()
>>          soon and handle this case explicitly on the destination.
>>
>> Fixes: c13c4153f76d ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> 
> OK it's not too bad, but I wonder whether above aideas have been
> explored.

TBH, it's been broken all along and I'd rather have a simple fix. If 
somebody ever cares about this, we could investigate making it work (or 
making postcopy overrule free page hinting). But I'm open for suggestions.

-- 
Thanks,

David / dhildenb


