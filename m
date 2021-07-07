Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16C43BF028
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:20:30 +0200 (CEST)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1D5y-0002xb-0O
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1D4q-0001ec-O8
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:19:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1D4o-0005WU-RQ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625685558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NewGue3Sn0vGzqMXCIlKCZSvTeFmHJD4PXrKCTJPfZs=;
 b=MO2Gf1wi7JUSXIZWeWmyEu0ssugydMMn15pnjSArzPcWrKtJN3AzJzelZq89Cu4YHQQuMj
 Q5hOZuqbTulekOMbh0Vcadm4sksd3JP8yoWd+ilLPkmOzgWrrrbzfAQw8CKhTyRfTg5fu1
 2NDMXvr3BADiXaGrZg/6bolpGNxdiqg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-UdSPr_FyNj6SnE29geicuw-1; Wed, 07 Jul 2021 15:19:17 -0400
X-MC-Unique: UdSPr_FyNj6SnE29geicuw-1
Received: by mail-wm1-f70.google.com with SMTP id
 d16-20020a1c73100000b02901f2d21e46efso1370617wmb.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 12:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NewGue3Sn0vGzqMXCIlKCZSvTeFmHJD4PXrKCTJPfZs=;
 b=qyXKTCSB4BIdPPgLlSy6Xc0T6AziVlOzivn0I2xmXEMCub+EOnJGljqPcW4fkCBZq2
 L5nNhqx2tPX4lU9oYwSYGY2J4qQPDV3Pr2DxzApIz8Tfl/PcSzPSQj1m7Ijhm8RtWc9G
 PO307P67bUMcbe4/qIbP57K9fA8Jw9ho/nC380LiAIS/cppmgYu/pywb+16OnSi3sKka
 QIGJReL3OcDcDoTJYrYXL1P3rJbEhYmedTSmRXTmOfSikpPxEGhtNt5IjKoC/9NeMUHo
 Zl1HCv7um8T16RjjnsR+qvmQSg3lHFzbEYGjnHxg0OvRz88/v356EWGCCzvsqANXO5VK
 5PRw==
X-Gm-Message-State: AOAM530j/3aYUXwcQZaVmlgjewfgwKZ7fUuFaTzsyiFyzVed+xtuRkKY
 UxSHdrhQ5x9OgdMbtHEaI2MgeWYJzvP3nuQpaEJ3aL8nsaCKGa5qY8AGZRXkSo9X8uDMP+7G/lk
 o0epQtBvZvI1WcV4=
X-Received: by 2002:a5d:5388:: with SMTP id d8mr29067302wrv.423.1625685555969; 
 Wed, 07 Jul 2021 12:19:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSg/l6o1hkX0WsnPwfWugNJJXp06SGXOwgevnRPHN9Fn5LXcbcd1vb6eUg55tuaNCP3X+q/Q==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr29067271wrv.423.1625685555623; 
 Wed, 07 Jul 2021 12:19:15 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id l13sm7810343wrz.34.2021.07.07.12.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 12:19:14 -0700 (PDT)
Date: Wed, 7 Jul 2021 15:19:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <20210707151459-mutt-send-email-mst@kernel.org>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com>
 <20210707150038-mutt-send-email-mst@kernel.org>
 <0391e06b-5885-8000-3c58-ae20493e3e65@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0391e06b-5885-8000-3c58-ae20493e3e65@redhat.com>
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

On Wed, Jul 07, 2021 at 09:14:00PM +0200, David Hildenbrand wrote:
> On 07.07.21 21:05, Michael S. Tsirkin wrote:
> > On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
> > > Postcopy never worked properly with 'free-page-hint=on', as there are
> > > at least two issues:
> > > 
> > > 1) With postcopy, the guest will never receive a VIRTIO_BALLOON_CMD_ID_DONE
> > >     and consequently won't release free pages back to the OS once
> > >     migration finishes.
> > > 
> > >     The issue is that for postcopy, we won't do a final bitmap sync while
> > >     the guest is stopped on the source and
> > >     virtio_balloon_free_page_hint_notify() will only call
> > >     virtio_balloon_free_page_done() on the source during
> > >     PRECOPY_NOTIFY_CLEANUP, after the VM state was already migrated to
> > >     the destination.
> > > 
> > > 2) Once the VM touches a page on the destination that has been excluded
> > >     from migration on the source via qemu_guest_free_page_hint() while
> > >     postcopy is active, that thread will stall until postcopy finishes
> > >     and all threads are woken up. (with older Linux kernels that won't
> > >     retry faults when woken up via userfaultfd, we might actually get a
> > >     SEGFAULT)
> > > 
> > >     The issue is that the source will refuse to migrate any pages that
> > >     are not marked as dirty in the dirty bmap -- for example, because the
> > >     page might just have been sent. Consequently, the faulting thread will
> > >     stall, waiting for the page to be migrated -- which could take quite
> > >     a while and result in guest OS issues.
> > 
> > OK so if source gets a request for a page which is not dirty
> > it does not respond immediately? Why not just teach it to
> > respond? It would seem that if destination wants a page we
> > should just give it to the destination ...
> 
> The source does not know if a page has already been sent (e.g., via the
> background migration thread that moves all data over) vs. the page has not
> been send because the page was hinted. This is the part where we'd need
> additional tracking on the source to actually know that.
> 
> We must not send a page twice, otherwise bad things can happen when placing
> pages that already have been migrated, because that scenario can easily
> happen with ordinary postcopy (page has already been sent and we're dealing
> with a stale request from the destination).

OK let me get this straight

A. source sends page
B. destination requests page
C. destination changes page
D. source sends page
E. destination overwrites page

this is what you are worried about right?

the fix is to mark page clean in A.
then in D to not send page if it's clean?

And the problem with hinting is this:

A. page is marked clean
B. destination requests page
C. destination changes page
D. source sends page <- does not happen, page is clean!
E. destination overwrites page


did I get it right?


> > 
> > 
> > > 
> > > While we could fix 1), for example, by calling
> > > virtio_balloon_free_page_done() via pre_save callbacks of the
> > > vmstate, 2) is mostly impossible to fix without additional tracking,
> > > such that we can actually identify these hinted pages and handle
> > > them accordingly.
> > > As it never worked properly, let's disable it via the postcopy notifier on
> > > the destination. Trying to set "migrate_set_capability postcopy-ram on"
> > > on the destination now results in "virtio-balloon: 'free-page-hint' does
> > > not support postcopy Error: Postcopy is not supported".
> > > Note 1: We could let qemu_guest_free_page_hint() mark postcopy
> > >          as broken once actually clearing bits on the source. However, it's
> > >          harder to realize as we can race with users starting postcopy
> > >          and we cannot produce an expressive error message easily.
> > 
> > 
> > How about the reverse? Ignore qemu_guest_free_page_hint if postcopy
> > started?  Seems better than making it user/guest visible ..
> 
> Might be an option, but we let the user configure something that does not
> work in combination ... essentially ignoring one of both user settings. Also
> not perfect IMHO.
> 
> > 
> > > Note 2: virtio-mem has similar issues, however, access to "unplugged"
> > >          memory by the guest is very rare and we would have to be very
> > >          lucky for it to happen during migration. The spec states
> > >          "The driver SHOULD NOT read from unplugged memory blocks ..."
> > >          and "The driver MUST NOT write to unplugged memory blocks".
> > >          virtio-mem will move away from virtio_balloon_free_page_done()
> > >          soon and handle this case explicitly on the destination.
> > > 
> > > Fixes: c13c4153f76d ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> > 
> > OK it's not too bad, but I wonder whether above aideas have been
> > explored.
> 
> TBH, it's been broken all along and I'd rather have a simple fix. If
> somebody ever cares about this, we could investigate making it work (or
> making postcopy overrule free page hinting). But I'm open for suggestions.
> 
> -- 
> Thanks,
> 
> David / dhildenb


