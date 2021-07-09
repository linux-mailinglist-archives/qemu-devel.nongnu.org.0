Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1813C22F1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:36:56 +0200 (CEST)
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ooR-0006Q3-I0
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1ofX-0007EV-F6
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1ofR-0000sH-Cd
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625830056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pc3IM995+4b4bTCS1N72o8rPE0tS1fIlAp5j7BTH0A8=;
 b=EIZ0lL1AwN+y/Dc/AcB3lfA8HwAkECQPCm3i7wO6PwoyYwvJpg+d32D+eLz5/HPPxW4/CN
 8jkLb2Gn5+pY0qw4pYFwn2m9rtPRxIVMzIGc19AzZAAG3qZNfNDaTTAmZqFCjDdAXJyfuS
 KE68EO+dg7FL3A7QmoIHTIOLQjtJpkg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-Ba4a5qioNF2nR3FiZS7zcQ-1; Fri, 09 Jul 2021 07:27:35 -0400
X-MC-Unique: Ba4a5qioNF2nR3FiZS7zcQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k1-20020a05600c1c81b029021649539a4aso1224162wms.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pc3IM995+4b4bTCS1N72o8rPE0tS1fIlAp5j7BTH0A8=;
 b=CR9vb9PHbKT7NE207NqX9y8wwo/BeMxQUosvQWTxWFQIzNOC0eJw/va/K2gBc6qVh+
 8ox5EZEK/5Ru8AMUP3SgnRlJKlwHQ5hUeWbJWdsKh9sgJUT7FrkKHnI0/+dHXnYvEgWM
 TcsP0VZvK4w9kmcpsLKy2yQWKkbMBvi9vnSBQhtMUvqKnZ2iNkN+IXSq5JA4OUq0gYr6
 v4lt7BvtLvOW+IbunjCoAxYweWsDpkMtkoLb9bqCxz8Pxnyck9WK6LfrbNxFiaYijD9Y
 aKX1XmRSEnP83H8c3wFbp4090oEJ3N1MH4AQELzd5qAfnJhx7BCeOAvEPB2XGPYmffpi
 UVVw==
X-Gm-Message-State: AOAM532i9YVdmXWE9pzIA64GOdNap2Uw+sazJbrkFVC/i5x+jKVXTbQx
 pWJYrI3gtMM84vzCT3w9Dr+0D8g2MVf/hfhhhjBjrWmFWQxjJZEl4u/yzWrnG3AAbMyQI8/df+h
 BAgW9TsBECcDwagM=
X-Received: by 2002:a5d:6984:: with SMTP id g4mr9967681wru.381.1625830054299; 
 Fri, 09 Jul 2021 04:27:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4Wz+/pFbe4yNJ3c54Y4yVCtk5AqSY1NYKiE9Jhpwegj/4apwgQMkzO+xgu7Sm7nwHivA9vw==
X-Received: by 2002:a5d:6984:: with SMTP id g4mr9967648wru.381.1625830054008; 
 Fri, 09 Jul 2021 04:27:34 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id f2sm4956595wrq.69.2021.07.09.04.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 04:27:33 -0700 (PDT)
Date: Fri, 9 Jul 2021 07:27:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <20210709072635-mutt-send-email-mst@kernel.org>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com>
 <20210707150038-mutt-send-email-mst@kernel.org>
 <0391e06b-5885-8000-3c58-ae20493e3e65@redhat.com>
 <20210707151459-mutt-send-email-mst@kernel.org>
 <40a148d7-acad-67ee-ac66-e9ad56a23b44@redhat.com>
 <20210707155413-mutt-send-email-mst@kernel.org>
 <YOdNAMoAKkiSyuqR@work-vm>
MIME-Version: 1.0
In-Reply-To: <YOdNAMoAKkiSyuqR@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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

On Thu, Jul 08, 2021 at 08:07:44PM +0100, Dr. David Alan Gilbert wrote:
> * Michael S. Tsirkin (mst@redhat.com) wrote:
> > On Wed, Jul 07, 2021 at 09:47:31PM +0200, David Hildenbrand wrote:
> > > On 07.07.21 21:19, Michael S. Tsirkin wrote:
> > > > On Wed, Jul 07, 2021 at 09:14:00PM +0200, David Hildenbrand wrote:
> > > > > On 07.07.21 21:05, Michael S. Tsirkin wrote:
> > > > > > On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
> > > > > > > Postcopy never worked properly with 'free-page-hint=on', as there are
> > > > > > > at least two issues:
> > > > > > > 
> > > > > > > 1) With postcopy, the guest will never receive a VIRTIO_BALLOON_CMD_ID_DONE
> > > > > > >      and consequently won't release free pages back to the OS once
> > > > > > >      migration finishes.
> > > > > > > 
> > > > > > >      The issue is that for postcopy, we won't do a final bitmap sync while
> > > > > > >      the guest is stopped on the source and
> > > > > > >      virtio_balloon_free_page_hint_notify() will only call
> > > > > > >      virtio_balloon_free_page_done() on the source during
> > > > > > >      PRECOPY_NOTIFY_CLEANUP, after the VM state was already migrated to
> > > > > > >      the destination.
> > > > > > > 
> > > > > > > 2) Once the VM touches a page on the destination that has been excluded
> > > > > > >      from migration on the source via qemu_guest_free_page_hint() while
> > > > > > >      postcopy is active, that thread will stall until postcopy finishes
> > > > > > >      and all threads are woken up. (with older Linux kernels that won't
> > > > > > >      retry faults when woken up via userfaultfd, we might actually get a
> > > > > > >      SEGFAULT)
> > > > > > > 
> > > > > > >      The issue is that the source will refuse to migrate any pages that
> > > > > > >      are not marked as dirty in the dirty bmap -- for example, because the
> > > > > > >      page might just have been sent. Consequently, the faulting thread will
> > > > > > >      stall, waiting for the page to be migrated -- which could take quite
> > > > > > >      a while and result in guest OS issues.
> > > > > > 
> > > > > > OK so if source gets a request for a page which is not dirty
> > > > > > it does not respond immediately? Why not just teach it to
> > > > > > respond? It would seem that if destination wants a page we
> > > > > > should just give it to the destination ...
> > > > > 
> > > > > The source does not know if a page has already been sent (e.g., via the
> > > > > background migration thread that moves all data over) vs. the page has not
> > > > > been send because the page was hinted. This is the part where we'd need
> > > > > additional tracking on the source to actually know that.
> > > > > 
> > > > > We must not send a page twice, otherwise bad things can happen when placing
> > > > > pages that already have been migrated, because that scenario can easily
> > > > > happen with ordinary postcopy (page has already been sent and we're dealing
> > > > > with a stale request from the destination).
> > > > 
> > > > OK let me get this straight
> > > > 
> > > > A. source sends page
> > > > B. destination requests page
> > > > C. destination changes page
> > > > D. source sends page
> > > > E. destination overwrites page
> > > > 
> > > > this is what you are worried about right?
> > > 
> > > IIRC E. is with recent kernels:
> > > 
> > > E. placing the page fails with -EEXIST and postcopy migration fails
> > > 
> > > However, the man page (man ioctl_userfaultfd) doesn't describe what is
> > > actually supposed to happen when double-placing. Could be that it's
> > > "undefined behavior".
> > > 
> > > I did not try, though.
> > > 
> > > 
> > > This is how it works today:
> > > 
> > > A. source sends page and marks it clean
> > > B. destination requests page
> > > C. destination receives page and places it
> > > D. source ignores request as page is clean
> > 
> > If it's actually -EEXIST then we could just resend it
> > and teach destination to ignore -EEXIST errors right?
> > 
> > Will actually make things a bit more robust: destination
> > handles its own consistency instead of relying on source.
> 
> You have to be careful of a few things;
>   a) If the destination has modified the page, then you must
> definitely not under any circumstances lose those modifications
> and replace them by an old version from the source.
> 
>   b) With postcopy recovery I think there is a bitmap to track some
> of this; but you have to be careful since you don't know whether
> pages that were sent were actually received.
> 
> Dave

what I am trying to say is that userfaultfd already tracks these
things in the kernel for us. Ideally we'd just use that ...

> > 
> > 
> > > > 
> > > > the fix is to mark page clean in A.
> > > > then in D to not send page if it's clean?
> > > > 
> > > > And the problem with hinting is this:
> > > > 
> > > > A. page is marked clean
> > > > B. destination requests page
> > > > C. destination changes page
> > > > D. source sends page <- does not happen, page is clean!
> > > > E. destination overwrites page
> > > 
> > > Simplified it's
> > > 
> > > A. page is marked clean by hinting code
> > > B. destination requests page
> > > D. source ignores request as page is clean
> > > E. destination stalls until postcopy unregisters uffd
> > > 
> > > 
> > > Some thoughts
> > > 
> > > 1. We do have a a recv bitmap where we track received pages on the
> > > destination (e.g., ramblock_recv_bitmap_test()), however we only use it to
> > > avoid sending duplicate requests to the hypervisor AFAIKs, and don't check
> > > it when placing pages.
> > > 
> > > 2. Changing the migration behavior unconditionally on the source will break
> > > migration to old QEMU binaries that cannot handle this change.
> > 
> > We can always make this depend on new machine types.
> > 
> > 
> > > 3. I think the current behavior is in place to make debugging easier. If
> > > only a single instance of a page will ever be migrated from source to
> > > destination, there cannot be silent data corruption. Further, we avoid
> > > migrating unnecessarily pages twice.
> > > 
> > 
> > Likely does not matter much for performance, it seems unlikely that
> > the race is all that common.
> > 
> > > Maybe Dave and Peter can spot any flaws in my understanding.
> > > 
> > > -- 
> > > Thanks,
> > > 
> > > David / dhildenb
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


