Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0375431912E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:36:42 +0100 (CET)
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFtR-0004cF-2S
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAFpH-0000Rg-SE
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:32:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAFpF-0001wB-Qh
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613064740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6Ui75g51+KlyrY0jyJ+tQtBp5u8yI5SSfvevJSVDtA=;
 b=Be6VEhkeTyRyE/EZPTXVI1MBN7uziOlNElFm2TaAUDHbF0m6XkQTEoer2zNIUqhA4Z01wc
 iG0CqYqQ4ALpXpmKsfR5uQDx0IU2NKkaHkDwiH6w4BtZ8h+p1KvGaQVOBzWwHhmcdUoO7F
 kxSFAKLmMfltUuJZF7Mo21QTjsfrRtk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-dVTQCyRbMEKfYNSr5sm8LQ-1; Thu, 11 Feb 2021 12:32:18 -0500
X-MC-Unique: dVTQCyRbMEKfYNSr5sm8LQ-1
Received: by mail-qv1-f69.google.com with SMTP id z28so4410749qva.15
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B6Ui75g51+KlyrY0jyJ+tQtBp5u8yI5SSfvevJSVDtA=;
 b=rKrpZiBWw0H6Oi5cn4OJp0l1nvw6edd1T/db3xdhJ+aK5D0cgj4JhnGW59zaKa5f7j
 872bqKWLuTqL8fhrUlj/WL/+kLK3EGq41FH/NnlRawdN8BX4Si8tUy6/MEmcoaJqyTlZ
 Mnlu/zhlFhFT+YZKGnbiodFcJFtO5c3cycVUQgoqCQvwVuusgl0xuBkXblxpsx+/UIHS
 fSpkjCAf6yUN5D2zohc0OowupW8r1LbHlgwJS2rWgnJaKcL/aWuH9cDMaC+/F6+6f2gn
 ogoiZmvG0HRjt4H65DDUtCANw2Jf76H/10+9+TSOQv3Zc/PFh1wTLCsAArEZ7Hqb7Em3
 tTHQ==
X-Gm-Message-State: AOAM533975QmVNjHqbXJBGTtkbKYGatj9tWb457P/NlTUFWD3Pliebrx
 78bHQWUAgxzVsdVC99Omkv/K4FJzXLJGkO0t5bNTRokvauyra4FSmfCSE/oW+SoKfZJN7Ns3ls+
 sXJJOjKx1zE5YOfw=
X-Received: by 2002:a37:9fc6:: with SMTP id i189mr3668811qke.368.1613064737873; 
 Thu, 11 Feb 2021 09:32:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjxrIhfJEfCMMEM1IrezaPpJk0CBdddPi5Mg0veR3q3X9brFXIUvz3trE71gkEqnA6xStr6w==
X-Received: by 2002:a37:9fc6:: with SMTP id i189mr3668783qke.368.1613064737635; 
 Thu, 11 Feb 2021 09:32:17 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id m2sm3955063qtn.31.2021.02.11.09.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:32:17 -0800 (PST)
Date: Thu, 11 Feb 2021 12:32:15 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210211173215.GC157159@xz-x1>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
 <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
 <d7dcfbf8-8f33-065b-47a9-802952732218@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d7dcfbf8-8f33-065b-47a9-802952732218@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Den Lunev <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 07:19:47PM +0300, Andrey Gruzdev wrote:
> On 09.02.2021 22:06, David Hildenbrand wrote:
> > > > Hi,
> > > > 
> > > > just stumbled over this, quick question:
> > > > 
> > > > I recently played with UFFD_WP and notices that write protection is
> > > > only effective on pages/ranges that have already pages populated (IOW:
> > > > !pte_none() in the kernel).
> > > > 
> > > > In case memory was never populated (or was discarded using e.g.,
> > > > madvice(DONTNEED)), write-protection will be skipped silently and you
> > > > won't get WP events for applicable pages.
> > > > 
> > > > So if someone writes to a yet unpoupulated page ("zero"), you won't
> > > > get WP events.
> > > > 
> > > > I can spot that you do a single uffd_change_protection() on the whole
> > > > RAMBlock.
> > > > 
> > > > How are you handling that scenario, or why don't you have to handle
> > > > that scenario?
> > > > 
> > > Hi David,
> > > 
> > > I really wonder if such a problem exists.. If we are talking about a
> > 
> > I immediately ran into this issue with my simplest test cases. :)
> > 
> > > write to an unpopulated page, we should get first page fault on
> > > non-present page and populate it with protection bits from
> > > respective vma.
> > > For UFFD_WP vma's  page will be populated non-writable. So we'll get
> > > another page fault on present but read-only page and go to
> > > handle_userfault.
> > 
> > See the attached test program. Triggers for me on 5.11.0-rc6+ and
> > 5.9.13-200.fc33
> > 
> > gcc -lpthread uffdio_wp.c -o uffdio_wp
> > ./uffdio_wp
> > WP did not fire
> > 
> > Uncomment the placement of the zeropage just before registering to make
> > the WP actually trigger. If there is no PTE, there is nothing to
> > protect.
> > 
> > 
> > And it makes sense: How should the fault handler know which ranges you
> > wp-ed, if there is no place to store that information (the PTEs!). The
> > VMA cannot tell that story, it only knows that someone registered
> > UFFD_WP to selectively wp some parts.
> > 
> > You might have to register also for MISSING faults and place zero pages.
> > 
> Looked at the kernel code, agree that we miss WP events for unpopulated
> pages, UFFD_WP softbit won't be set in this case. But it doesn't make saved
> snapshot inconsistent or introduce security issues. The only side effect is
> that we may save updated page instead of zeroed, just increasing snapshot
> size. However this guest-physical page has never been touched from the point
> of view of saved vCPU/device state and is not a concern.

Oh I just remembered one thing, that Linux should be zeroing pages when
allocating, so even if the page has legacy content it'll be cleared with
__GFP_ZERO allocations.  So yeah it would be harder to have issue at least with
a sensible OS.  I'm not sure about Windows or others, but it could be a common
case.  Then the only overhead is the extra pages we kept in the live snapshot,
which takes some more disk space.

Or there could be firmware running without OS at all, but it should really not
read unallocated pages assuming there must be zero.  It's not a sane behavior
even for a firmware.

> 
> Often (at least on desktop Windows guests) only a small part of RAM has ever
> been allocated by guest. Migration code needs to read each guest-physical
> page, so we'll have a lot of additional UFFD events, much more MISSING
> events then WP-faults.
> 
> And the main problem is that adding MISSING handler is impossible in current
> single-threaded snapshot code. We'll get an immediate deadlock on iterative
> page read.

Right.  We'll need to rework the design but just for saving a bunch of snapshot
image disk size.  So now I agree with you, let's keep this in mind, but maybe
it isn't worth a fix for now, at least until we figure something really broken.

Andrey, do you think we should still mention this issue into the todo list of
the wiki page of live snapshot?

Thanks,

-- 
Peter Xu


