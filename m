Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28CC3BDC96
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 20:01:12 +0200 (CEST)
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0pNb-0005L8-Hk
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 14:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m0pMN-0004O8-Ks
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:59:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m0pMK-0005yG-TS
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625594387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKDspksISOhYd9XMgXqRkSW7XCsqd6ok8nd9vjRj+hU=;
 b=Zs10CbYfhL83bwqc/6z+uPoQXHZgmEHNZI3SmUtYIu4yOiaWgh10uh5Wh2WcAxjDp+8CRr
 11ibqqmaM3+w42j/dNem6iguG1q0JEGun86SQG5ISal9V7G6w/82MIFYdl9VKOkr59TJR7
 mPZsoPgLi9f80ulV0tSe2qvtipGjKpg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-x_cJRzJzPHGB8gF8NDrECw-1; Tue, 06 Jul 2021 13:59:46 -0400
X-MC-Unique: x_cJRzJzPHGB8gF8NDrECw-1
Received: by mail-qk1-f198.google.com with SMTP id
 f10-20020a05620a15aab02903b3210e44dcso10595091qkk.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 10:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YKDspksISOhYd9XMgXqRkSW7XCsqd6ok8nd9vjRj+hU=;
 b=DuGbOVjQyFXjJTLM0CPkxa+mdSAdTeHKc0jn5W6qkB33y/JCREKKuh6lv1SDElWYQh
 YMuKpk0CpX4qLvG7DL3dCh8ZdzwzmImzvpOOs3prpu09gnriiyCfabC4wHwUp8sGG28x
 YjKQG+s8s+grrgC1V6AQzqDR9ZbLEL4k+1chbT3vl6ZqAYsnDoLUb30MHEJ5Eosq3YUg
 cDuFFSr3NKDIY0eobpTimLMDzDlIbC1b9o3wagh18rtwGTQdC2Mp3FetGBOe739iVPNV
 /5IGKnmCmsJ4tmlpIXwDtg9TjtpWkSs4ItzoIOri/pFxH59M3dTTzcro/Cwb0WB7lp7t
 CDJA==
X-Gm-Message-State: AOAM530C/smGqtnHM7Zkt32G6ItjRaec8V8Fi+/DNw0OTyE0XvQE8R5J
 C0NGJYznH+XeIwue2XkJ1PU3+l1VioC7JKyaWSnjdJCnH4yyCMNUqZyFHJ7oPmfU480gqJj4M2P
 Wi4EkPpgqAxWjUZ8=
X-Received: by 2002:a05:622a:1349:: with SMTP id
 w9mr18599773qtk.73.1625594385655; 
 Tue, 06 Jul 2021 10:59:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUQfacczsf/wdt2PsGLFXm7r+mGc4h+L7YARGmJYNAh/bJlRGAcxsPfi9VNbXBtUV3lxDIHQ==
X-Received: by 2002:a05:622a:1349:: with SMTP id
 w9mr18599752qtk.73.1625594385435; 
 Tue, 06 Jul 2021 10:59:45 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id h2sm7374865qkf.106.2021.07.06.10.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 10:59:44 -0700 (PDT)
Date: Tue, 6 Jul 2021 13:59:43 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOSaDzCd4ZmcRQHl@t490s>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
 <YN26SDxZS1aShbHi@t490s>
 <27cb8a0141fa493a8d4bb6bb918e8a82@intel.com>
MIME-Version: 1.0
In-Reply-To: <27cb8a0141fa493a8d4bb6bb918e8a82@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02, 2021 at 02:29:41AM +0000, Wang, Wei W wrote:
> On Thursday, July 1, 2021 8:51 PM, Peter Xu wrote:
> > On Thu, Jul 01, 2021 at 04:42:38AM +0000, Wang, Wei W wrote:
> > > On Thursday, July 1, 2021 4:08 AM, Peter Xu wrote:
> > > > Taking the mutex every time for each dirty bit to clear is too slow,
> > > > especially we'll take/release even if the dirty bit is cleared.  So
> > > > far it's only used to sync with special cases with
> > > > qemu_guest_free_page_hint() against migration thread, nothing really that
> > serious yet.  Let's move the lock to be upper.
> > > >
> > > > There're two callers of migration_bitmap_clear_dirty().
> > > >
> > > > For migration, move it into ram_save_iterate().  With the help of
> > > > MAX_WAIT logic, we'll only run ram_save_iterate() for no more than
> > > > 50ms-ish time, so taking the lock once there at the entry.  It also
> > > > means any call sites to
> > > > qemu_guest_free_page_hint() can be delayed; but it should be very
> > > > rare, only during migration, and I don't see a problem with it.
> > > >
> > > > For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot
> > > > to take that lock even when calling ramblock_sync_dirty_bitmap(),
> > > > where another example is migration_bitmap_sync() who took it right.
> > > > So let the mutex cover both the
> > > > ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls.
> > > >
> > > > It's even possible to drop the lock so we use atomic operations upon
> > > > rb->bmap and the variable migration_dirty_pages.  I didn't do it
> > > > just to still be safe, also not predictable whether the frequent atomic ops
> > could bring overhead too e.g.
> > > > on huge vms when it happens very often.  When that really comes, we
> > > > can keep a local counter and periodically call atomic ops.  Keep it simple for
> > now.
> > > >
> > >
> > > If free page opt is enabled, 50ms waiting time might be too long for handling
> > just one hint (via qemu_guest_free_page_hint)?
> > > How about making the lock conditionally?
> > > e.g.
> > > #define QEMU_LOCK_GUARD_COND (lock, cond) {
> > > 	if (cond)
> > > 		QEMU_LOCK_GUARD(lock);
> > > }
> > > Then in migration_bitmap_clear_dirty:
> > > QEMU_LOCK_GUARD_COND(&rs->bitmap_mutex, rs->fpo_enabled);
> > 
> > Yeah that's indeed some kind of comment I'd like to get from either you or David
> > when I add the cc list.. :)
> > 
> > I was curious how that would affect the guest when the free page hint helper can
> > stuck for a while.  Per my understanding it's fully async as the blocked thread
> > here is asynchronously with the guest since both virtio-balloon and virtio-mem
> > are fully async. If so, would it really affect the guest a lot?  Is it still tolerable if it
> > only happens during migration?
> 
> Yes, it is async and won't block the guest. But it will make the optimization doesn’t run as expected.
> The intention is to have the migration thread skip the transfer of the free pages, but now the migration
> thread is kind of using the 50ms lock to prevent the clearing of free pages while it is likely just sending free pages inside the lock.
> (the reported free pages are better to be cleared in the bitmap in time in case they have already sent)

Yes it would be great of the page can be hinted for clean.  However I think
that's an tradeoff - the migration thread is not less important from that pov.
50ms is not some random number I chose, it's something existed there so I don't
even to bother with thinking a saner period. :) However if there's a known good
suggested number from any balloon developers I'd be love to cooperate.

> 
> > 
> > Taking that mutex for each dirty bit is still an overkill to me, irrelevant of whether
> > it's "conditional" or not.  
> 
> With that, if free page opt is off, the mutex is skipped, isn't it?

Yes, but when free page is on, it'll check once per page.  As I mentioned I
still don't think it's the right thing to do.

We encountered this problem when migrating a 3tb vm and the mutex spins and
eats tons of cpu resources.  It shouldn't happen with/without balloon, imho.

Not to mention the hard migration issues are mostly with non-idle guest, in
that case having the balloon in the guest will be disastrous from this pov
since it'll start to take mutex for each page, while balloon would hardly
report anything valid since most guest pages are being used.

> 
> > If I'm the cloud admin, I would more prefer migration
> > finishes earlier, imho, rather than freeing some more pages on the host (after
> > migration all pages will be gone!).  If it still blocks the guest in some unhealthy
> > way I still prefer to take the lock here, however maybe make it shorter than
> > 50ms.
> > 
> 
> Yes, with the optimization, migration will be finished earlier.
> Why it needs to free pages on the host?
> (just skip sending the page)

However again I would still think lock once per page is too much.  If 50ms is
not acceptable, do you have a best interval number?

Or it would be great if we can start with 50ms interval because that introduces
the least changes, so we separate the problems, on: (1) resolving the mutex
spinning issue with this patch, and (2) finding a suitable period for migration
thread to release the mutex so balloon can perform the best.

Thanks,

-- 
Peter Xu


