Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F731948B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:35:05 +0100 (CET)
Received: from localhost ([::1]:51300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIg3-00048k-3i
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAIcY-00022L-FU
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:31:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAIcV-0005da-17
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613075480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OXyhHzx/+yLQYFpgyE4QaLdbidbt0hnX5IuoTkbquo8=;
 b=MMYrvESH46VVU6vtGPXVFo36nDyv0SuS6zcD8p1dMUDKlHwkZzTZw7xnuRWc2+J680VR2W
 DD0Y9JNYighI5nrbbPlHW1D0JKfUmEZhElccQx8X3wVxW9sSpS7V6y7+hc1+cP9Dnq/K66
 cC6Z8vEoEy0vmAKXH6tfrzgiacW01AU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-Oww3gyyBPh2SFSspaabg_A-1; Thu, 11 Feb 2021 15:31:18 -0500
X-MC-Unique: Oww3gyyBPh2SFSspaabg_A-1
Received: by mail-qk1-f199.google.com with SMTP id p185so5398685qkc.9
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OXyhHzx/+yLQYFpgyE4QaLdbidbt0hnX5IuoTkbquo8=;
 b=NGCxe9BGzTxFUa4xfQ/MpFQmaAvl1D8uLjtWl+yshRLNEtMcwRzkmetWGxMQmi9AY2
 Lkv4EvjIXUKQyIt4K5DwX6cYmBbqlpc1XnNTpi0C1Q0AhukMBAn9kXZc219TEfpwlr5N
 ZMMw24kpmX0l1d4ebZcthWm5Smk+B3oQ7otCgvYHYiZ4dmmVW5FtINGDcATyqE3Ozq62
 c/Sny3ePuYi0W3OzqWuQvkSYjZls8iW/h8c2ey3lTzLKuLdK71hrmObIu0Oxp3U0yPuV
 sbAsTQKC8UIq0QjjSq81nSltXQMxD6jk6BIjTEvbt8tEarKcLsfJxVqSZ7Ds+BadTNBW
 wkMw==
X-Gm-Message-State: AOAM533cxyFsgahLnf5YSrm745uWBcub1Z4KOnd9sqDSHDE878aIwfN1
 vShch2HgpGrzsBRY3REEiumAbig2f7GMkYOVJTXSF2UV+fggp16WkkMVbRAqIjhZg/KVPbH6quv
 FD8jzNYpjgQxMa20=
X-Received: by 2002:a37:9003:: with SMTP id s3mr10176806qkd.117.1613075477475; 
 Thu, 11 Feb 2021 12:31:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV1nd2MTxj+LSSb+Wc6tqt3h6uM4urKQeuYDpHayM6vaBikZQmq/OwUPXFz2JfflvgLz7sFQ==
X-Received: by 2002:a37:9003:: with SMTP id s3mr10176772qkd.117.1613075477148; 
 Thu, 11 Feb 2021 12:31:17 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id f78sm4801575qke.71.2021.02.11.12.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 12:31:16 -0800 (PST)
Date: Thu, 11 Feb 2021 15:31:15 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210211203115.GD157159@xz-x1>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
 <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
 <d7dcfbf8-8f33-065b-47a9-802952732218@virtuozzo.com>
 <20210211173215.GC157159@xz-x1>
 <13142aee-fc4f-372c-d216-8b38484ba8e8@virtuozzo.com>
 <be380197-559f-4b76-2632-34ea4cf3d55b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <be380197-559f-4b76-2632-34ea4cf3d55b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 08:01:29PM +0100, David Hildenbrand wrote:
> On 11.02.21 19:28, Andrey Gruzdev wrote:
> > On 11.02.2021 20:32, Peter Xu wrote:
> > > On Thu, Feb 11, 2021 at 07:19:47PM +0300, Andrey Gruzdev wrote:
> > > > On 09.02.2021 22:06, David Hildenbrand wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > just stumbled over this, quick question:
> > > > > > > 
> > > > > > > I recently played with UFFD_WP and notices that write protection is
> > > > > > > only effective on pages/ranges that have already pages populated (IOW:
> > > > > > > !pte_none() in the kernel).
> > > > > > > 
> > > > > > > In case memory was never populated (or was discarded using e.g.,
> > > > > > > madvice(DONTNEED)), write-protection will be skipped silently and you
> > > > > > > won't get WP events for applicable pages.
> > > > > > > 
> > > > > > > So if someone writes to a yet unpoupulated page ("zero"), you won't
> > > > > > > get WP events.
> > > > > > > 
> > > > > > > I can spot that you do a single uffd_change_protection() on the whole
> > > > > > > RAMBlock.
> > > > > > > 
> > > > > > > How are you handling that scenario, or why don't you have to handle
> > > > > > > that scenario?
> > > > > > > 
> > > > > > Hi David,
> > > > > > 
> > > > > > I really wonder if such a problem exists.. If we are talking about a
> > > > > I immediately ran into this issue with my simplest test cases. :)
> > > > > 
> > > > > > write to an unpopulated page, we should get first page fault on
> > > > > > non-present page and populate it with protection bits from
> > > > > > respective vma.
> > > > > > For UFFD_WP vma's  page will be populated non-writable. So we'll get
> > > > > > another page fault on present but read-only page and go to
> > > > > > handle_userfault.
> > > > > See the attached test program. Triggers for me on 5.11.0-rc6+ and
> > > > > 5.9.13-200.fc33
> > > > > 
> > > > > gcc -lpthread uffdio_wp.c -o uffdio_wp
> > > > > ./uffdio_wp
> > > > > WP did not fire
> > > > > 
> > > > > Uncomment the placement of the zeropage just before registering to make
> > > > > the WP actually trigger. If there is no PTE, there is nothing to
> > > > > protect.
> > > > > 
> > > > > 
> > > > > And it makes sense: How should the fault handler know which ranges you
> > > > > wp-ed, if there is no place to store that information (the PTEs!). The
> > > > > VMA cannot tell that story, it only knows that someone registered
> > > > > UFFD_WP to selectively wp some parts.
> > > > > 
> > > > > You might have to register also for MISSING faults and place zero pages.
> > > > > 
> > > > Looked at the kernel code, agree that we miss WP events for unpopulated
> > > > pages, UFFD_WP softbit won't be set in this case. But it doesn't make saved
> > > > snapshot inconsistent or introduce security issues. The only side effect is
> > > > that we may save updated page instead of zeroed, just increasing snapshot
> > > > size. However this guest-physical page has never been touched from the point
> > > > of view of saved vCPU/device state and is not a concern.
> > > Oh I just remembered one thing, that Linux should be zeroing pages when
> > > allocating, so even if the page has legacy content it'll be cleared with
> > > __GFP_ZERO allocations.  So yeah it would be harder to have issue at least with
> > > a sensible OS.  I'm not sure about Windows or others, but it could be a common
> > > case.  Then the only overhead is the extra pages we kept in the live snapshot,
> > > which takes some more disk space.
> > > 
> > > Or there could be firmware running without OS at all, but it should really not
> > > read unallocated pages assuming there must be zero.  It's not a sane behavior
> > > even for a firmware.
> > > 
> > > > Often (at least on desktop Windows guests) only a small part of RAM has ever
> > > > been allocated by guest. Migration code needs to read each guest-physical
> > > > page, so we'll have a lot of additional UFFD events, much more MISSING
> > > > events then WP-faults.
> > > > 
> > > > And the main problem is that adding MISSING handler is impossible in current
> > > > single-threaded snapshot code. We'll get an immediate deadlock on iterative
> > > > page read.
> > > Right.  We'll need to rework the design but just for saving a bunch of snapshot
> > > image disk size.  So now I agree with you, let's keep this in mind, but maybe
> > > it isn't worth a fix for now, at least until we figure something really broken.
> > > 
> > > Andrey, do you think we should still mention this issue into the todo list of
> > > the wiki page of live snapshot?
> > > 
> > > Thanks,
> > > 
> > Yes, even if the page happens to be overwritten, it's overwritten by the same VM so
> > no security boundaries are crossed. And no machine code can assume that RAM content
> > is zeroed on power-on or reset so our snapshot state stays quite consistent.
> > 
> > Agree we should keep it in mind, but IMHO adding MISSING handler and running separate
> > thread would make performance worse.. So I doubt it's worth adding this to TODO list..
> > 
> 
> So, here is what happens: your snapshot will contain garbage at places where
> it should contain zero.
> 
> This happens when your guest starts using an unpopulated page after
> snapshotting started and the page has not been copied to the snapshot yet.
> You won't get a WP event, therefore you cannot copy "zero" to the snapshot
> before content gets overridden.
> 
> If you load your snapshot, it contains garbage at places that are supposed
> to contain zero.
> 
> 
> There is a feature in virtio-balloon that *depends* on previously discarded
> pages from staying unmodified in some cases: free page reporting.
> 
> The guest will report pages (that might have been initialized to zero) to
> the hypervisor). The hypervisor will discard page content if the content was
> initialized to zero. After that, the guest is free to reuse the pages
> anytime with the guarantee that content has not been modified (-> still is
> zero).
> 
> 
> See QEMU hw/virtio/virtio-balloon.c: virtio_balloon_handle_report()
> 
> "When we discard the page it has the effect of removing the page from the
> hypervisor itself and causing it to be zeroed when it is returned to us. So
> we must not discard the page [...] if the guest is expecting it to retain a
> non-zero value."
> 
> And Linux drivers/virtio/virtio_balloon.c: virtballoon_validate()
> 
> "Inform the hypervisor that our pages are poisoned or initialized. If we
> cannot do that then we should disable page reporting as it could potentially
> change the contents of our free pages."
> 
> 
> It's as simple as having a Linux guest with init_on_free and
> free-page-reporting active via virtio-balloon.
> 
> Long story short, your feature might break guests (when continuing the
> snapshot) when free page reporting is active. I agree that MISSING events
> might be too heavy, so you should disable snapshots if free page reporting
> is active.

When the page is reported with poison_val set, it is written already by the
guest, right (either all zeros, or some special marks)?  If so, why it won't be
wr-protected by uffd?  Thanks,

-- 
Peter Xu


