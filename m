Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F0B3BF090
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:59:17 +0200 (CEST)
Received: from localhost ([::1]:52234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DhU-00027U-4H
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1DgJ-0000pb-70
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:58:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1DgG-0002pC-An
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625687878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F6d8885ce8PGtfhBl1ogGiVS5lvofW4mULjgTk0iFNc=;
 b=hzoz/joymwnrC1iW/opHh5vpBthDY/Hq3DNdbyFfujRExHyKUJI/B1k4jE9hCdoqyBLyRz
 kaVimFQJ9L4tYOj8Tz5MbWvwwKS74pfG5esUKNn9+kWtU26asacDNN8A2fRKd/eKC+dN9L
 2BJr6nzSfUFxSmSX5owaf6lYqeOyt+E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-Qthgi3dBPNW2mD0gQEWSsw-1; Wed, 07 Jul 2021 15:57:57 -0400
X-MC-Unique: Qthgi3dBPNW2mD0gQEWSsw-1
Received: by mail-wm1-f72.google.com with SMTP id
 a13-20020a7bc1cd0000b02902104c012aa3so2612428wmj.9
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 12:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F6d8885ce8PGtfhBl1ogGiVS5lvofW4mULjgTk0iFNc=;
 b=HelY25PfuxTppFEZ65zHEuYROX6YAdvnQnB/egJB+8iz4qhvjQv3N0SirrmTxMmh5I
 EARGNyEfTaYS9jefOndS4LCzsut6U1m4FMYjwlJ1ObXEdAxIOuNGS96BfW3dDb05vYYD
 BjzN0MNvHPBo+GQqM6igVoVldKIAhMklDmSGRr1sNyxOItzJal4wKU8JSndFzSqRdST8
 XrQRUo7QSmwNM6pS9brERQT3VKWqOkB8OGP39yEPLnCnSQfyq0BkDmP7WS+gI6wGfhHd
 vaKPE8VtRBE2KSxd3vDgxCZz6Rz7mzrH5sWuexnME4+l+EMnwPtf2b1Cte0HSl4kX/CB
 yDAQ==
X-Gm-Message-State: AOAM530tRpWpBRNvgSLfGFIXr8X56FKbXgAvbMlP0k7OqLe6Gpg8A4kU
 2YaX/ZrPYRxSXgqEH1py8uNivNLI61fG+HKJEj6m5KGNkPMnbmxLWG28y4EGT/iVDpof2BVk+42
 mm/iobZa3mMiBdMM=
X-Received: by 2002:a05:6000:110:: with SMTP id
 o16mr12904738wrx.284.1625687876349; 
 Wed, 07 Jul 2021 12:57:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAXtS/z9nqd9Mt6/W0j5Pcw9oV5sk9wGpdrlH+c8KiFHlhiiBeXLJwYXp4UjIsI/s41fFO+g==
X-Received: by 2002:a05:6000:110:: with SMTP id
 o16mr12904705wrx.284.1625687876089; 
 Wed, 07 Jul 2021 12:57:56 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id c16sm21319407wru.24.2021.07.07.12.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 12:57:55 -0700 (PDT)
Date: Wed, 7 Jul 2021 15:57:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <20210707155413-mutt-send-email-mst@kernel.org>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com>
 <20210707150038-mutt-send-email-mst@kernel.org>
 <0391e06b-5885-8000-3c58-ae20493e3e65@redhat.com>
 <20210707151459-mutt-send-email-mst@kernel.org>
 <40a148d7-acad-67ee-ac66-e9ad56a23b44@redhat.com>
MIME-Version: 1.0
In-Reply-To: <40a148d7-acad-67ee-ac66-e9ad56a23b44@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>, qemu-stable@nongnu.org,
 Wei Wang <wei.w.wang@intel.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 09:47:31PM +0200, David Hildenbrand wrote:
> On 07.07.21 21:19, Michael S. Tsirkin wrote:
> > On Wed, Jul 07, 2021 at 09:14:00PM +0200, David Hildenbrand wrote:
> > > On 07.07.21 21:05, Michael S. Tsirkin wrote:
> > > > On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
> > > > > Postcopy never worked properly with 'free-page-hint=on', as there are
> > > > > at least two issues:
> > > > > 
> > > > > 1) With postcopy, the guest will never receive a VIRTIO_BALLOON_CMD_ID_DONE
> > > > >      and consequently won't release free pages back to the OS once
> > > > >      migration finishes.
> > > > > 
> > > > >      The issue is that for postcopy, we won't do a final bitmap sync while
> > > > >      the guest is stopped on the source and
> > > > >      virtio_balloon_free_page_hint_notify() will only call
> > > > >      virtio_balloon_free_page_done() on the source during
> > > > >      PRECOPY_NOTIFY_CLEANUP, after the VM state was already migrated to
> > > > >      the destination.
> > > > > 
> > > > > 2) Once the VM touches a page on the destination that has been excluded
> > > > >      from migration on the source via qemu_guest_free_page_hint() while
> > > > >      postcopy is active, that thread will stall until postcopy finishes
> > > > >      and all threads are woken up. (with older Linux kernels that won't
> > > > >      retry faults when woken up via userfaultfd, we might actually get a
> > > > >      SEGFAULT)
> > > > > 
> > > > >      The issue is that the source will refuse to migrate any pages that
> > > > >      are not marked as dirty in the dirty bmap -- for example, because the
> > > > >      page might just have been sent. Consequently, the faulting thread will
> > > > >      stall, waiting for the page to be migrated -- which could take quite
> > > > >      a while and result in guest OS issues.
> > > > 
> > > > OK so if source gets a request for a page which is not dirty
> > > > it does not respond immediately? Why not just teach it to
> > > > respond? It would seem that if destination wants a page we
> > > > should just give it to the destination ...
> > > 
> > > The source does not know if a page has already been sent (e.g., via the
> > > background migration thread that moves all data over) vs. the page has not
> > > been send because the page was hinted. This is the part where we'd need
> > > additional tracking on the source to actually know that.
> > > 
> > > We must not send a page twice, otherwise bad things can happen when placing
> > > pages that already have been migrated, because that scenario can easily
> > > happen with ordinary postcopy (page has already been sent and we're dealing
> > > with a stale request from the destination).
> > 
> > OK let me get this straight
> > 
> > A. source sends page
> > B. destination requests page
> > C. destination changes page
> > D. source sends page
> > E. destination overwrites page
> > 
> > this is what you are worried about right?
> 
> IIRC E. is with recent kernels:
> 
> E. placing the page fails with -EEXIST and postcopy migration fails
> 
> However, the man page (man ioctl_userfaultfd) doesn't describe what is
> actually supposed to happen when double-placing. Could be that it's
> "undefined behavior".
> 
> I did not try, though.
> 
> 
> This is how it works today:
> 
> A. source sends page and marks it clean
> B. destination requests page
> C. destination receives page and places it
> D. source ignores request as page is clean

If it's actually -EEXIST then we could just resend it
and teach destination to ignore -EEXIST errors right?

Will actually make things a bit more robust: destination
handles its own consistency instead of relying on source.



> > 
> > the fix is to mark page clean in A.
> > then in D to not send page if it's clean?
> > 
> > And the problem with hinting is this:
> > 
> > A. page is marked clean
> > B. destination requests page
> > C. destination changes page
> > D. source sends page <- does not happen, page is clean!
> > E. destination overwrites page
> 
> Simplified it's
> 
> A. page is marked clean by hinting code
> B. destination requests page
> D. source ignores request as page is clean
> E. destination stalls until postcopy unregisters uffd
> 
> 
> Some thoughts
> 
> 1. We do have a a recv bitmap where we track received pages on the
> destination (e.g., ramblock_recv_bitmap_test()), however we only use it to
> avoid sending duplicate requests to the hypervisor AFAIKs, and don't check
> it when placing pages.
> 
> 2. Changing the migration behavior unconditionally on the source will break
> migration to old QEMU binaries that cannot handle this change.

We can always make this depend on new machine types.


> 3. I think the current behavior is in place to make debugging easier. If
> only a single instance of a page will ever be migrated from source to
> destination, there cannot be silent data corruption. Further, we avoid
> migrating unnecessarily pages twice.
> 

Likely does not matter much for performance, it seems unlikely that
the race is all that common.

> Maybe Dave and Peter can spot any flaws in my understanding.
> 
> -- 
> Thanks,
> 
> David / dhildenb


