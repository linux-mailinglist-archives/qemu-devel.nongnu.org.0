Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C73B91D0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 14:53:01 +0200 (CEST)
Received: from localhost ([::1]:33752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lywBg-00016k-4i
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 08:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lywAD-0000O8-FI
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:51:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lywAA-00025J-5t
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625143883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5nDVERT5WxM5wKOLviWpSRlGAVWZWYkiFNNTgza6KXQ=;
 b=OXtWd2MiajX3WYUjMmBvbsmkkGHezx7jvRWIQEjH86O0vh6AGQ89gOnPOtTPo5ZRWAM/Lw
 ksqAYYwyVKd1/vsbzDs/sZbJjPQHDb6Z3oq/F5vSuw3sr1xXDDPGSiTTC3XwXduJIN8dgN
 H09uKPU8PAxGzxGHE4n9IlSKztHVXDY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-0jhDheNvN2eRPVDdiioFuA-1; Thu, 01 Jul 2021 08:51:22 -0400
X-MC-Unique: 0jhDheNvN2eRPVDdiioFuA-1
Received: by mail-qk1-f199.google.com with SMTP id
 r190-20020a375dc70000b02903acea04c19fso4157854qkb.8
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 05:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5nDVERT5WxM5wKOLviWpSRlGAVWZWYkiFNNTgza6KXQ=;
 b=V5x0t3YJls6TkFhnmrtYArKG5g8WAc6gQAF0HXxSNCEkflTvA8cPJG9Y5X7htNte3k
 8cUND+eq/KD8kyufDy3aVn2FJPbT10tkDSX1emoL44bXnWxOCVxuL4FKZEXPQb4+08Vu
 cuf9eouuYzhfmIbJRVHNvn2GsHVQSdi6ZszBrFi9rpDhtD2AVieI+HhbaZIaHhFz9q3q
 5JKr+ouwom7W/8xBqt80FNpyrP01Be3MHxRcmGWcfh8NsVfgGlOqSBTgIsa/84vSyRYd
 EgYF0IuT6hkgkclGXo1hkeCuVipNsTxU8eJhy9zXkSHKeZLNyJ5Szef39O/0h9lpgEt0
 y4ow==
X-Gm-Message-State: AOAM533WvpplzL1GPMU+hOlbobKiuKVet4oRSbQtEQV7e40vXjyV/Y9U
 YKIrk9n1cpqXk0Zs/rcNluR6+2NTs0ftOMXqilEnG35WBN2KMcgVXD666eiHpJcu+ij4Y2a470O
 1gfAmhyaGWfIXtXc=
X-Received: by 2002:a37:7841:: with SMTP id t62mr41970470qkc.412.1625143882454; 
 Thu, 01 Jul 2021 05:51:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGjJdBKKgXF6Y1ZeH2aQ4sw3jwMMqxc4nMQQKqL8iKcRbB6H8J3excgOiyNBUpxntP1GBV5A==
X-Received: by 2002:a37:7841:: with SMTP id t62mr41970449qkc.412.1625143882260; 
 Thu, 01 Jul 2021 05:51:22 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j13sm15798626qko.9.2021.07.01.05.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 05:51:21 -0700 (PDT)
Date: Thu, 1 Jul 2021 08:51:20 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YN26SDxZS1aShbHi@t490s>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
MIME-Version: 1.0
In-Reply-To: <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 01, 2021 at 04:42:38AM +0000, Wang, Wei W wrote:
> On Thursday, July 1, 2021 4:08 AM, Peter Xu wrote:
> > Taking the mutex every time for each dirty bit to clear is too slow, especially we'll
> > take/release even if the dirty bit is cleared.  So far it's only used to sync with
> > special cases with qemu_guest_free_page_hint() against migration thread,
> > nothing really that serious yet.  Let's move the lock to be upper.
> > 
> > There're two callers of migration_bitmap_clear_dirty().
> > 
> > For migration, move it into ram_save_iterate().  With the help of MAX_WAIT
> > logic, we'll only run ram_save_iterate() for no more than 50ms-ish time, so taking
> > the lock once there at the entry.  It also means any call sites to
> > qemu_guest_free_page_hint() can be delayed; but it should be very rare, only
> > during migration, and I don't see a problem with it.
> > 
> > For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot to take
> > that lock even when calling ramblock_sync_dirty_bitmap(), where another
> > example is migration_bitmap_sync() who took it right.  So let the mutex cover
> > both the
> > ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls.
> > 
> > It's even possible to drop the lock so we use atomic operations upon rb->bmap
> > and the variable migration_dirty_pages.  I didn't do it just to still be safe, also
> > not predictable whether the frequent atomic ops could bring overhead too e.g.
> > on huge vms when it happens very often.  When that really comes, we can
> > keep a local counter and periodically call atomic ops.  Keep it simple for now.
> > 
> 
> If free page opt is enabled, 50ms waiting time might be too long for handling just one hint (via qemu_guest_free_page_hint)?
> How about making the lock conditionally?
> e.g.
> #define QEMU_LOCK_GUARD_COND (lock, cond) {
> 	if (cond)
> 		QEMU_LOCK_GUARD(lock);
> }
> Then in migration_bitmap_clear_dirty:
> QEMU_LOCK_GUARD_COND(&rs->bitmap_mutex, rs->fpo_enabled);

Yeah that's indeed some kind of comment I'd like to get from either you or
David when I add the cc list.. :)

I was curious how that would affect the guest when the free page hint helper
can stuck for a while.  Per my understanding it's fully async as the blocked
thread here is asynchronously with the guest since both virtio-balloon and
virtio-mem are fully async. If so, would it really affect the guest a lot?  Is
it still tolerable if it only happens during migration?

Taking that mutex for each dirty bit is still an overkill to me, irrelevant of
whether it's "conditional" or not.  If I'm the cloud admin, I would more prefer
migration finishes earlier, imho, rather than freeing some more pages on the
host (after migration all pages will be gone!).  If it still blocks the guest
in some unhealthy way I still prefer to take the lock here, however maybe make
it shorter than 50ms.

Thanks,

-- 
Peter Xu


