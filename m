Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEAB31D309
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 00:38:15 +0100 (CET)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC9v3-0003d9-HQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 18:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lC9sp-0002Yc-Rj
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 18:35:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lC9sn-0002D1-6B
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 18:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613518550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8giB20Gk23mIbKbwKhtWB+7GaMAACLb+ALePoaseKo=;
 b=EjM6OkvPogTiMIlOveUULjMsgnPYeD8LfFXaQxu3E5DRuVbuSztNRn5Twy50lwcucaA9lA
 w/bEmE/MYOXqi1Q1/P85hfmPdFNIh2NgHw1l4aTj5THI+Lza9umj60pLWWgEMPE8yQNouk
 cG61rGQ4Ph5DQpHq+tDGo/vDlnA6WNQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-ngoUOuX6OcCwssFqG5ngcw-1; Tue, 16 Feb 2021 18:35:49 -0500
X-MC-Unique: ngoUOuX6OcCwssFqG5ngcw-1
Received: by mail-qt1-f198.google.com with SMTP id o20so8858274qtx.22
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 15:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=C8giB20Gk23mIbKbwKhtWB+7GaMAACLb+ALePoaseKo=;
 b=YV59CsEOXQPCghBLqsuKyd1mXkYB7iVkkTbSP73poQZkkpyzPV8Dx5V16+PsQxxxdo
 6EM7isIxytdsI9dEIDB/czPXuk3dayzRYCNb1IVe3DeP+bAr80LnKsQJ4X4t5X3JvYIR
 ZojpeFdvfccOkxtcFCEqY55oURnVk0uyysL2Dlt+0Vcj859E6EC6iM8oog9eOe2WWiWG
 iWjSIWKSi3bf9PpZ5MC1RP5k2m6XqRA2zQhtHrgxdkqXZPhVcfNTz5hxO/ToYFhrZ2fD
 Xuz8nkhk4VK2pBpqjbjUl3vBCzI/qWtnFKuIewNrgOi50AgRTeFu2YSB9O7us8E4ITL5
 nKqA==
X-Gm-Message-State: AOAM532sPhLvduQwKrMJGoJk623rxuHp9JzWgXcxon4SegZtgoUANXRT
 V9nBqjoKq4UqJXjbKrYaEoN6Iv2hmzNEw1QWL9V1LvjYaxJJNcvb7vjxjgMMsoeecsKQmAJKq4v
 tZ1WCOlYbzErfSns=
X-Received: by 2002:ac8:1094:: with SMTP id a20mr21004979qtj.248.1613518548542; 
 Tue, 16 Feb 2021 15:35:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNpjUu8DpZcKtAhsAcS+8mLFltNU7w/lapPCblVBmiblRVji/glNTa+S/QYN5KjVv9hqnp/g==
X-Received: by 2002:ac8:1094:: with SMTP id a20mr21004961qtj.248.1613518548314; 
 Tue, 16 Feb 2021 15:35:48 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id m5sm348022qke.134.2021.02.16.15.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 15:35:47 -0800 (PST)
Date: Tue, 16 Feb 2021 18:35:45 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210216233545.GD91264@xz-x1>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
 <20210212030621.GF157159@xz-x1>
 <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
 <20210212161125.GH157159@xz-x1>
 <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Andrey,

On Sat, Feb 13, 2021 at 12:34:07PM +0300, Andrey Gruzdev wrote:
> On 12.02.2021 19:11, Peter Xu wrote:
> > On Fri, Feb 12, 2021 at 09:52:52AM +0100, David Hildenbrand wrote:
> > > On 12.02.21 04:06, Peter Xu wrote:
> > > > On Thu, Feb 11, 2021 at 10:09:58PM +0100, David Hildenbrand wrote:
> > > > > The issue is when the discard happened before starting the snapshot. Write-protection won‘t work and the zeroed content won‘t be retained in the snapshot.
> > > > I see what you mean now, and iiuc it will only be a problem if init_on_free=1.
> > > > I think CONFIG_INIT_ON_FREE_DEFAULT_ON should be off for most distros, so the
> > > Yes, some distros seem to enable init_on_alloc instead. Looking at the
> > > introducing commit 6471384af2a6 ("mm: security: introduce init_on_alloc=1
> > > and init_on_free=1 boot options") there are security use cases and it might
> > > become important with memory tagging.
> > > 
> > > Note that in Linux, there was also the option to poison pages with 0,
> > > removed via f289041ed4cf ("mm, page_poison: remove
> > > CONFIG_PAGE_POISONING_ZERO"), available in some kernels that supported free
> > > page reporting.
> > > 
> > > It got removed and use cases got told to use init_on_free.
> 
> I think we talk about init_on_free()/init_on_alloc() on guest side, right?

Right.  IIUC it's the init_on_free() that matters.

We'll have no issue if init_on_alloc=1 && init_on_free=0, since in that case
all pages will be zeroed after all before the new page returned to the caller
to allocate the page. Then we're safe, I think.

> Still can't get how it relates to host's unpopulated pages..
> Try to look from hardware side. Untouched SDRAM in hardware is required to contain zeroes somehow? No.
> These 'trash' pages in migration stream are like never written physical memory pages, they are really
> not needed in snapshot but they don't do any harm as well as there's no harm in that never-written physical
> page is full of garbage.
> 
> Do these 'trash' pages in snapshot contain sensitive information not allowed to be accessed by the same VM?
> I think no. Or we need a good example how it can be potentially exploited.
> 
> The only issue that I see is madvise(MADV_DONTNEED) for RAM blocks during snapshotting. And free page reporting
> or memory balloon is secondary - the point is that UFFD_WP snapshot is incompatible with madvise(MADV_DONTNEED) on
> hypervisor side. No matter which guest functionality can induce it.

I think the problem is if with init_on_free=1, the kernel will assume that
all the pages that got freed has been zeroed before-hand so it thinks that it's
a waste of time to zero it again when the page is reused/reallocated.  As a
reference see kernel prep_new_page() where there's:

	if (!free_pages_prezeroed() && want_init_on_alloc(gfp_flags))
		kernel_init_free_pages(page, 1 << order);

In this case I believe free_pages_prezeroed() will return true, then we don't
even need to check want_init_on_alloc() at all. Note that it'll cover all the
cases where kernel allocates with __GFP_ZERO: it means it could happen that
even the guest kernel tries to alloc_page(__GFP_ZERO) it may got a page with
random data after the live snapshot is loaded.  So it's not about any hardware,
it's the optimization of guest kernel instead.  It is actually reasonable and
efficient since if we *know* that page is zero page then we shouldn't bother
zeroing it again.  However it brought us a bit of trouble on live snapshot that
the current solution might not work for all guest OS configurations.

> 
> > > > impact should be small, I think.  I thought about it, but indeed I didn't see a
> > > > good way to fix this if without fixing the zero page copy for live snapshot.
> > > We should really document this (unexpected) behavior of snapshotting.
> > > Otherwise, the next feature comes around that relies on pages that were
> > > discarded to remain zeroed (I even have one in mind ;) ) and forgets to
> > > disable snapshots.
> > Agreed.  I'll see whether Andrey would have any idea to workaround this, or
> > further comment.  Or I can draft a patch to document this next week (or unless
> > Andrey would beat me to it :).
> > 
> Really better to document this specific behaviour but also clarify that the saved state remains
> consistent and secure, off course if you agree with my arguments.

Yes, no rush on anything yet, let's reach a consensus on understanding the
problem before trying to even document anything.  If you agree with above, feel
free to draft a documentation update patch if you'd like, that could also
contain the code to prohibit virtio-balloon page reporting when live snapshot.

IMHO if above issue exists, it'll be indeed better to implement the MISSING
tracking as well with UFFDIO_ZEROCOPY - it's still not optimized to keep trash
pages in the live snapshot, since for a high dirty rate guest the number of
trash pages could still be huge.  It would definitely be more challenging than
only do wr-protect so we may need multi-threading at least, but it'll be a pity
that live snapshot randomly fails some guests, even if it's rare.  The thing is
host cannot easily detect that guest config, so we can't simply block some
users taking snapshots even if at last the snapshot could be silently broken.

Thanks,

-- 
Peter Xu


