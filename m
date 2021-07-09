Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4892F3C2668
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:57:22 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rwP-0006sb-AC
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1rnZ-0005TL-D3
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1rnV-0004bz-VL
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625842084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWQykk2LrJttz0fC/lj0mdyEofZ3cLngz92vMlETJlw=;
 b=f6HkvcrzPfuVPXkfcGQvedNi6T81nHx+vqQB/Bfs8GlqXlKzjH+MX2hK3OV1CaP1vLdXje
 +oy1WEcFITWtJBTon+iSg7dLFXNlkZ0iT4AgAB23DjQg0UXmHKG8ejuGCvbsrX15HM5jWA
 LK/tPA9N2xOmG1k3HZQepzCXRQYD6mk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-zlLGpC5PP8uFX8fjAE9Fqw-1; Fri, 09 Jul 2021 10:48:03 -0400
X-MC-Unique: zlLGpC5PP8uFX8fjAE9Fqw-1
Received: by mail-qt1-f199.google.com with SMTP id
 c18-20020a05622a0592b0290251fb198592so5922379qtb.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eWQykk2LrJttz0fC/lj0mdyEofZ3cLngz92vMlETJlw=;
 b=uZf0eR3ugk6CPnLKzcUeifmu1PsSKHuNISh6jlloficq0bmZdt6A9wfwzBdPbGerke
 DDetRaZibMcRls3nTGia3tuDI1sMKTUWIIwi1huutm2sWLxyAw3r+IpZJ+tYF6Fruu1S
 e83QRUGlr5yqoJBNyg5yKdNDL1p6jqNIugNVMrYxJngSNPzUZZfuS9oKoo8a5sOYrFUQ
 9u/nIHoGKqbxgfVkSg36oVTJesVfwKxwypKohr/YCMJa8uxykuiY4bPZ3UOAceHp8ylU
 CvXO1Okl0I2r5dCLKfMkzF7eBf2Utp6uU4Nl9KYVmeJ4ZMjXxGYeRTDN9HeslCeCjxbI
 OfeA==
X-Gm-Message-State: AOAM531SpMZc1Z9Mg38QwBaQdLnFsiMoID8s9MACmkyT/QF9QvQHL2tW
 HuHIgL5HXierqCyBJF7Fyoi7bJ4zkUzQ7vCw/vQsCShvFfk9BvvMyO0b53WEU+Q16tUKhbJqi0v
 FU+1zhyvrRjY+n3Y=
X-Received: by 2002:a05:620a:70e:: with SMTP id
 14mr38669886qkc.85.1625842082714; 
 Fri, 09 Jul 2021 07:48:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxoH57POsUdMBfpCsUviIYjGAunrRsaW5KzKwoaBp/YqBeX0vFqAULtTH8Z63E9QDSNJqapA==
X-Received: by 2002:a05:620a:70e:: with SMTP id
 14mr38669864qkc.85.1625842082440; 
 Fri, 09 Jul 2021 07:48:02 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id g8sm1510675qtb.38.2021.07.09.07.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:48:01 -0700 (PDT)
Date: Fri, 9 Jul 2021 10:48:00 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOhhoHJFyiQAEBRZ@t490s>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
 <YN26SDxZS1aShbHi@t490s>
 <27cb8a0141fa493a8d4bb6bb918e8a82@intel.com>
 <YOSaDzCd4ZmcRQHl@t490s>
 <2eb1ccd7105d4823898ea68a614d16f9@intel.com>
 <YOXZ1fzH+qXGJLs1@t490s>
 <e392987d17f345969dd86be513b1702b@intel.com>
 <YOdEVI74aWIao3lU@t490s>
 <b242b77a68c64ae9aa13ae0dc6c081ec@intel.com>
MIME-Version: 1.0
In-Reply-To: <b242b77a68c64ae9aa13ae0dc6c081ec@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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

On Fri, Jul 09, 2021 at 08:58:08AM +0000, Wang, Wei W wrote:
> On Friday, July 9, 2021 2:31 AM, Peter Xu wrote:
> > > > Yes I think this is the place I didn't make myself clear.  It's not
> > > > about sleeping, it's about the cmpxchg being expensive already when the vm
> > is huge.
> > >
> > > OK.
> > > How did you root cause that it's caused by cmpxchg, instead of lock
> > > contention (i.e. syscall and sleep) or some other code inside
> > pthread_mutex_lock(). Do you have cycles about cmpxchg v.s. cycles of
> > pthread_mutex_lock()?
> > 
> > We've got "perf top -g" showing a huge amount of stacks lying in
> > pthread_mutex_lock().
> 
> This only explains pthread_mutex_lock is the cause, not root caused to cmpxchg.

I think that's enough already to prove we can move the lock elsewhere.

It's not really a heavy race between threads; it's the pure overhead we called
it too many times.  So it's not really a problem yet about "what type of lock
we should use" (mutex or spin lock) or "how this lock is implemented" (say,
whether using cmpxchg only or optimize using test + test-and-set, as that
sounds like a good optimization of pure test-and-set spinlocks) because the
lock is not busy at all.

If we have two busy threads contentioning on the lock for real, that'll be
another problem, imho.  It's not yet the case.

> 
> > 
> > >
> > > I check the implementation of pthread_mutex_lock(). The code path for lock
> > acquire is long. QemuSpin looks more efficient.
> > > (probably we also don’t want migration thread to sleep in any case)
> > 
> > I didn't check it, but I really hoped it should be very close to a spinlock version
> > when it's not contended.  We should be careful on using spin locks in userspace,
> > e.g., with that moving clear log into critical section will be too much and actuall
> > close to "wrong", imho, because the kvm memslot lock inside is sleepable.
> 
> OK, that might be a good reason to keep clear_map out of the lock.
> We also don’t want the lock holder to have more chances to go to sleep though it is mutex.

Yes that looks fine to me, but that's really another topic.  It's not a
requirement either before spinlock is justified to be better than mutex here.

> 
> > 
> > I think it's very fine to have migration thread sleep.  IMHO we need explicit
> > justification for each mutex to be converted to a spinlock in userspace.  So far I
> > don't see it yet for this bitmap lock.
> 
> What if the guest gets stopped and then the migration thread goes to sleep?

Isn't the balloon code run in a standalone iothread?  Why guest stopped can
stop migration thread?

> 
> > 
> > Frankly I also don't know how spinlock would work reliably without being able to
> > disable scheduling, then could the thread got scheduled out duing taking the
> > spinlock?  Would another thread trying to take this lock spinning on this sleeping
> > task?
> 
> Yes, and it needs good justification:
> If it's per-page spinlock, the granularity is very small, so it has very little chance that a lock holder gets scheduled out as time slice uses up. Even that happens once, it seems no big issues, just the waiter wastes some CPU cycles, this is better than having the migration thread scheduled out by mutex, I think.

Yes I believe there's good reason when Emilio introduced the lock, I didn't
measure it myself so I can't tell.  It's just that we need more justification
that this mutex is needed to be replaced with a spinlock.

> 
> > 
> > >
> > > I think it's also better to see the comparison of migration throughput data (i.e.
> > pages per second) in the following cases, before we make a decision:
> > > - per-page mutex
> > > - per-page spinlock
> > > - 50-ms mutex
> > 
> > I don't have the machines, so I can't do this.  I also see this as separate issues to
> > solve to use spinlock, as I said before I would prefer some justification first to use
> > it rather than blindly running tests and pick a patch with higher number.
> > 
> > I also hope we can reach a consensus that we fix one issue at a time.  This patch
> > already proves itself with some real workloads, I hope we can merge it first,
> > either with 50ms period or less.
> > 
> > Per-page locking is already against at least my instinction of how this should be
> > done; I just regreted I didn't see that an issue when reviewing the balloon patch
> > as I offered the r-b myself.  However I want to make it work as before then we
> > figure out a better approach on how the lock is taken, and which lock we should
> > use.  I don't see it a must to do all things in one patch.
> 
> Sorry, it wasn't my intention to be a barrier to merging your patch.

No problem, and I appreciate for all the discussions.  It's just that as you
see I still prefer to keep it like this first.

free-page-hint is a great feature, though if we grep it in libvirt we found
that it's not yet enabled anywhere.  It means it's not used as a majority, yet.
Meanwhile the code path this patch changes happen for each migration that qemu
started.  What I'm afraid is we worry too much on what most people are not
using, during which we didn't really make the majority works better.

From what I learned in the past few years, funnily "speed of migration" is
normally not what people care the most.  Issues are mostly with convergence and
being transparent to users using the VMs so they aren't even aware.

I admit this patch may not be the perfect one, but that's the reason I wanted
to do it in two steps as spinlock definitely needs more justification here,
which I can't provide myself, while this patch is verified to help.

> Just try to come up with better solutions if possible.
> - Option1 QemuSpin lock would reduce the lock acquiring overhead, but need to test if that migration could converge;
> - Option2 conditional lock. We haven't see the test results if turning on free page optimization with that per-page lock could still make your 2TB guest migration converge.

Yes after I checked libvirt I am more confident it's not with free-page-hint,
and as I said I wonder why you think free-page-hint could help a heavy memory
usage guest at all, as I mentioned most memories are used.

If we want to further optimize it, I don't think it'll make sense to chooise
either option 1 or 2 but only to take them all, but it'll be great when it
comes who proposed that new change also compare that with current patch 50ms
even if sleepable, so I'm wondering whether that'll really make a measurable
difference, especially if we can also shrink that 50ms period too, which is
what I asked initially.

> 
> Seems we lack resources for those tests right now. If you are urgent for a decision to have it work first, I'm also OK with you to merge it.

No I can't merge it myself as I'm not the maintainer. :) I haven't received any
ack yet, so at least I'll need to see how Dave and Juan think.  It's just that
I don't think qemuspin could help much in this case, and I don't want to mess
up the issue too.

Thanks for being considerate.

-- 
Peter Xu


