Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441FA3B9370
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 16:36:21 +0200 (CEST)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyxng-0003Ur-8J
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 10:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lyxZd-0006Xu-KX
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lyxZX-0000w4-9F
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625149301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BztXKt/q9dLmwXDbdv/kDvMsaXjmgjQ+U88RUIEgikI=;
 b=ajwtptpMqlslROkSHL/Kg2JICk7oq6y6IlwVygE1h7UvXb8QlVR1w299/UwIBWEhQXwQfM
 n4qSvL7aPwtAV3Ma/2RDsl3QULkfm/seMcrvmPi5ySzJmPxvpFJlqzJCVjar4rLjwEZ4Xg
 8p/KAp7xXRUsPa5NmprOG5Wo8/4FvKk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-NoU6chu8N7iNaXoZ6MojOg-1; Thu, 01 Jul 2021 10:21:40 -0400
X-MC-Unique: NoU6chu8N7iNaXoZ6MojOg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j18-20020a05600c1c12b02901dce930b374so2139846wms.2
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 07:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BztXKt/q9dLmwXDbdv/kDvMsaXjmgjQ+U88RUIEgikI=;
 b=ruW/koUX23SCeWHhAxTxlAXAEJsPjEZ21dgWqk4UxPSsjn9MLsyCoa1v9JMfGifg7d
 ce3kYpD3SES5JvVNo47Wbg9vIJUy6ZBuyP40WhMS3e8oHMFMUaMq3eXuLXHpqEvTJsVB
 8p25U4op+NK4vC+sqSzGp609NNlrarFFrP/bGgZ18m91fSi9y+WUZzpwpKye116zB/Ma
 Won8dC1DCNetxEwgqH3bqEA266Hz9z672CtAZhGAQ3EyINjcy3R9cGZdUu4C3kXnceQw
 KTfv0gIVUwI+gEQUtDOhBSzDNAwUInKgsEBk/7bWukSwh4EG9aPfJ9RXE2Ct5yWMj7CC
 IiSw==
X-Gm-Message-State: AOAM533mLe87HUAqTjv8SmyStfD54p+CZFRloiEWVxE6o3CgJBaUkcSi
 8sr1/Y8cWMUgAN0els6kyVT2mydgFoCR43lCI7F1S8fHinLrCzC+QDThstIFN9pQkZtQbZb0y0g
 oa9k7XOc/33DNpKc=
X-Received: by 2002:adf:c843:: with SMTP id e3mr46884745wrh.25.1625149299613; 
 Thu, 01 Jul 2021 07:21:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJHksmV5owWTxeEyFuwxkkPkFs4YTdEmM3SkUU3YqaBjXdIL9W9h3q30Ne5gjqQZPUI+yjJA==
X-Received: by 2002:adf:c843:: with SMTP id e3mr46884718wrh.25.1625149299431; 
 Thu, 01 Jul 2021 07:21:39 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bca.dip0.t-ipconnect.de. [79.242.59.202])
 by smtp.gmail.com with ESMTPSA id h8sm39324wrt.85.2021.07.01.07.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 07:21:39 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, "Wang, Wei W" <wei.w.wang@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com> <YN26SDxZS1aShbHi@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
Date: Thu, 1 Jul 2021 16:21:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YN26SDxZS1aShbHi@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.07.21 14:51, Peter Xu wrote:
> On Thu, Jul 01, 2021 at 04:42:38AM +0000, Wang, Wei W wrote:
>> On Thursday, July 1, 2021 4:08 AM, Peter Xu wrote:
>>> Taking the mutex every time for each dirty bit to clear is too slow, especially we'll
>>> take/release even if the dirty bit is cleared.  So far it's only used to sync with
>>> special cases with qemu_guest_free_page_hint() against migration thread,
>>> nothing really that serious yet.  Let's move the lock to be upper.
>>>
>>> There're two callers of migration_bitmap_clear_dirty().
>>>
>>> For migration, move it into ram_save_iterate().  With the help of MAX_WAIT
>>> logic, we'll only run ram_save_iterate() for no more than 50ms-ish time, so taking
>>> the lock once there at the entry.  It also means any call sites to
>>> qemu_guest_free_page_hint() can be delayed; but it should be very rare, only
>>> during migration, and I don't see a problem with it.
>>>
>>> For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot to take
>>> that lock even when calling ramblock_sync_dirty_bitmap(), where another
>>> example is migration_bitmap_sync() who took it right.  So let the mutex cover
>>> both the
>>> ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls.
>>>
>>> It's even possible to drop the lock so we use atomic operations upon rb->bmap
>>> and the variable migration_dirty_pages.  I didn't do it just to still be safe, also
>>> not predictable whether the frequent atomic ops could bring overhead too e.g.
>>> on huge vms when it happens very often.  When that really comes, we can
>>> keep a local counter and periodically call atomic ops.  Keep it simple for now.
>>>
>>
>> If free page opt is enabled, 50ms waiting time might be too long for handling just one hint (via qemu_guest_free_page_hint)?
>> How about making the lock conditionally?
>> e.g.
>> #define QEMU_LOCK_GUARD_COND (lock, cond) {
>> 	if (cond)
>> 		QEMU_LOCK_GUARD(lock);
>> }
>> Then in migration_bitmap_clear_dirty:
>> QEMU_LOCK_GUARD_COND(&rs->bitmap_mutex, rs->fpo_enabled);
> 
> Yeah that's indeed some kind of comment I'd like to get from either you or
> David when I add the cc list.. :)
> 
> I was curious how that would affect the guest when the free page hint helper
> can stuck for a while.  Per my understanding it's fully async as the blocked
> thread here is asynchronously with the guest since both virtio-balloon and
> virtio-mem are fully async. If so, would it really affect the guest a lot?  Is
> it still tolerable if it only happens during migration?

For virtio-mem, we call qemu_guest_free_page_hint() synchronously from 
the migration thread, directly via the precopy notifier. I recently sent 
patches that stop using qemu_guest_free_page_hint() from virtio-mem 
code. Until then, virtio-mem shouldn't care too much about that change 
here I guess, as it doesn't interact with guest reqests.

https://lkml.kernel.org/r/20210616162940.28630-1-david@redhat.com

For virtio-balloon, it's called via the (asynchronous) iothread.

> 
> Taking that mutex for each dirty bit is still an overkill to me, irrelevant of
> whether it's "conditional" or not.  If I'm the cloud admin, I would more prefer
> migration finishes earlier, imho, rather than freeing some more pages on the
> host (after migration all pages will be gone!).  If it still blocks the guest
> in some unhealthy way I still prefer to take the lock here, however maybe make
> it shorter than 50ms.

Spoiler alert: the introduction of clean bitmaps partially broke free 
page hinting already (as clearing happens deferred -- and might never 
happen if we don't migrate *any* page within a clean bitmap chunk, so 
pages actually remain dirty ...). "broke" here means that pages still 
get migrated even though they were reported by the guest. We'd actually 
not want to use clean bmaps with free page hinting ... long story short, 
free page hinting is a very fragile beast already and some of the hints 
are basically ignored and pure overhead ...


-- 
Thanks,

David / dhildenb


