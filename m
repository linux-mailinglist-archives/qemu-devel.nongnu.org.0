Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A970A3C19C9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:26:21 +0200 (CEST)
Received: from localhost ([::1]:40508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZfA-0000w5-IT
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m1ZNL-0001EI-JY
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:07:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m1ZNF-0004CL-TS
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625771269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ak/F/kndEDCjI1BckAzDVn5XSafye85nA4YVY8X6fU0=;
 b=RIOh4rsVOcba2FXN3ByNMmZmwbtIzxzou2xlNS+oKS0KQEID4uzHDYq2esMuhr2MfdBsJa
 SnxsmaGEEKpw8Ps8EFqRzS6berdvp97Y43pxB5sw/+3bl1320HC6HRf8sPvUH59X/0MOIJ
 2nN4YOflsE9ZAPNGnB42Db3Y2K73Cxw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-6qpkfQt6PR6wEQNRnJu1kA-1; Thu, 08 Jul 2021 15:07:48 -0400
X-MC-Unique: 6qpkfQt6PR6wEQNRnJu1kA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m6-20020a05600c4f46b0290205f5e73b37so2804881wmq.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ak/F/kndEDCjI1BckAzDVn5XSafye85nA4YVY8X6fU0=;
 b=MU4qHXLACZyXZIXpFWF0nST+cUxWBZNtLast9oKNjjT/t+54qAcEuzYxg+NtggxaHn
 BoYL+8e8Mze/l9gEDdzoWUV3rM59Df4l/7+a9SqmAMsji6lwauFdLStYJbTkNRk6y2xM
 DfMHEeKJ3rE3lFoyyeVjEN6MjeuL2JoWahS9wf20vvxS5InyB/JCHQqbP8OoxddO8a7t
 MjF7HrJK9Elw1wPBn1gNsYV/+nADZJ1DZqqxVZml0lBkQP2K6wjdFbZI4kuACT0y/035
 F15UP7LiIXoZt9XRNHilEBJt5bNQGMUpUuoW0bbznpbOJt3X/cF6gvuKVMqQMC74AkDg
 c5NQ==
X-Gm-Message-State: AOAM530o7BLhCUe3XeTd+Ob3MrNmLSDot/dCkxfwGX1/wPQu0eGFrjUF
 lOIEZFFHYgZf+j59Yc2KLrQxoRwahR2fQwfPDkuapBZ40RWbIXqD+QZrVnVDJfSqjY0wBQwNf/s
 D/JmMORfgXKuCDPA=
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr31755983wrs.2.1625771267172; 
 Thu, 08 Jul 2021 12:07:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJzYqcr+x1zEV0LLDwjO1C5xfP+/dC1mI+iFteGgjD7YxM1MjmU1nIdJHV/pLl52e4/76hVQ==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr31755970wrs.2.1625771267057; 
 Thu, 08 Jul 2021 12:07:47 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id k5sm3022824wmk.11.2021.07.08.12.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:07:46 -0700 (PDT)
Date: Thu, 8 Jul 2021 20:07:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <YOdNAMoAKkiSyuqR@work-vm>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com>
 <20210707150038-mutt-send-email-mst@kernel.org>
 <0391e06b-5885-8000-3c58-ae20493e3e65@redhat.com>
 <20210707151459-mutt-send-email-mst@kernel.org>
 <40a148d7-acad-67ee-ac66-e9ad56a23b44@redhat.com>
 <20210707155413-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210707155413-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-stable@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 qemu-devel@nongnu.org, Wei Wang <wei.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Wed, Jul 07, 2021 at 09:47:31PM +0200, David Hildenbrand wrote:
> > On 07.07.21 21:19, Michael S. Tsirkin wrote:
> > > On Wed, Jul 07, 2021 at 09:14:00PM +0200, David Hildenbrand wrote:
> > > > On 07.07.21 21:05, Michael S. Tsirkin wrote:
> > > > > On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
> > > > > > Postcopy never worked properly with 'free-page-hint=on', as there are
> > > > > > at least two issues:
> > > > > > 
> > > > > > 1) With postcopy, the guest will never receive a VIRTIO_BALLOON_CMD_ID_DONE
> > > > > >      and consequently won't release free pages back to the OS once
> > > > > >      migration finishes.
> > > > > > 
> > > > > >      The issue is that for postcopy, we won't do a final bitmap sync while
> > > > > >      the guest is stopped on the source and
> > > > > >      virtio_balloon_free_page_hint_notify() will only call
> > > > > >      virtio_balloon_free_page_done() on the source during
> > > > > >      PRECOPY_NOTIFY_CLEANUP, after the VM state was already migrated to
> > > > > >      the destination.
> > > > > > 
> > > > > > 2) Once the VM touches a page on the destination that has been excluded
> > > > > >      from migration on the source via qemu_guest_free_page_hint() while
> > > > > >      postcopy is active, that thread will stall until postcopy finishes
> > > > > >      and all threads are woken up. (with older Linux kernels that won't
> > > > > >      retry faults when woken up via userfaultfd, we might actually get a
> > > > > >      SEGFAULT)
> > > > > > 
> > > > > >      The issue is that the source will refuse to migrate any pages that
> > > > > >      are not marked as dirty in the dirty bmap -- for example, because the
> > > > > >      page might just have been sent. Consequently, the faulting thread will
> > > > > >      stall, waiting for the page to be migrated -- which could take quite
> > > > > >      a while and result in guest OS issues.
> > > > > 
> > > > > OK so if source gets a request for a page which is not dirty
> > > > > it does not respond immediately? Why not just teach it to
> > > > > respond? It would seem that if destination wants a page we
> > > > > should just give it to the destination ...
> > > > 
> > > > The source does not know if a page has already been sent (e.g., via the
> > > > background migration thread that moves all data over) vs. the page has not
> > > > been send because the page was hinted. This is the part where we'd need
> > > > additional tracking on the source to actually know that.
> > > > 
> > > > We must not send a page twice, otherwise bad things can happen when placing
> > > > pages that already have been migrated, because that scenario can easily
> > > > happen with ordinary postcopy (page has already been sent and we're dealing
> > > > with a stale request from the destination).
> > > 
> > > OK let me get this straight
> > > 
> > > A. source sends page
> > > B. destination requests page
> > > C. destination changes page
> > > D. source sends page
> > > E. destination overwrites page
> > > 
> > > this is what you are worried about right?
> > 
> > IIRC E. is with recent kernels:
> > 
> > E. placing the page fails with -EEXIST and postcopy migration fails
> > 
> > However, the man page (man ioctl_userfaultfd) doesn't describe what is
> > actually supposed to happen when double-placing. Could be that it's
> > "undefined behavior".
> > 
> > I did not try, though.
> > 
> > 
> > This is how it works today:
> > 
> > A. source sends page and marks it clean
> > B. destination requests page
> > C. destination receives page and places it
> > D. source ignores request as page is clean
> 
> If it's actually -EEXIST then we could just resend it
> and teach destination to ignore -EEXIST errors right?
> 
> Will actually make things a bit more robust: destination
> handles its own consistency instead of relying on source.

You have to be careful of a few things;
  a) If the destination has modified the page, then you must
definitely not under any circumstances lose those modifications
and replace them by an old version from the source.

  b) With postcopy recovery I think there is a bitmap to track some
of this; but you have to be careful since you don't know whether
pages that were sent were actually received.

Dave

> 
> 
> > > 
> > > the fix is to mark page clean in A.
> > > then in D to not send page if it's clean?
> > > 
> > > And the problem with hinting is this:
> > > 
> > > A. page is marked clean
> > > B. destination requests page
> > > C. destination changes page
> > > D. source sends page <- does not happen, page is clean!
> > > E. destination overwrites page
> > 
> > Simplified it's
> > 
> > A. page is marked clean by hinting code
> > B. destination requests page
> > D. source ignores request as page is clean
> > E. destination stalls until postcopy unregisters uffd
> > 
> > 
> > Some thoughts
> > 
> > 1. We do have a a recv bitmap where we track received pages on the
> > destination (e.g., ramblock_recv_bitmap_test()), however we only use it to
> > avoid sending duplicate requests to the hypervisor AFAIKs, and don't check
> > it when placing pages.
> > 
> > 2. Changing the migration behavior unconditionally on the source will break
> > migration to old QEMU binaries that cannot handle this change.
> 
> We can always make this depend on new machine types.
> 
> 
> > 3. I think the current behavior is in place to make debugging easier. If
> > only a single instance of a page will ever be migrated from source to
> > destination, there cannot be silent data corruption. Further, we avoid
> > migrating unnecessarily pages twice.
> > 
> 
> Likely does not matter much for performance, it seems unlikely that
> the race is all that common.
> 
> > Maybe Dave and Peter can spot any flaws in my understanding.
> > 
> > -- 
> > Thanks,
> > 
> > David / dhildenb
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


