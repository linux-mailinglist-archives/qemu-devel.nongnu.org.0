Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2965A3190E5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:22:28 +0100 (CET)
Received: from localhost ([::1]:36620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFfe-0006H7-Vw
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAFcJ-0004QI-0S
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:19:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAFcC-0004lM-Pm
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613063928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9xKUyAUH0d0Ei+caa8ta7J/YOQYi2c2xaq3RU442cU=;
 b=USP9Pkg+8B39nyf+12dYOlAAG6a8/KcpK7lx6y9PtffX4u9cYEC06dW9gA453P3w1uoZbS
 9mdYP4lEiKsVZfjloCEo4BhgyK7Ppa+T1wRC/smr5zz/g+ss1n8qi+OVwYe0Na7CAAHHuT
 v5eJZIsLJ6D0dTNYJezWl2GC3lURR2M=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-vj2nxfGiNF-_WcwqQhOYQA-1; Thu, 11 Feb 2021 12:18:47 -0500
X-MC-Unique: vj2nxfGiNF-_WcwqQhOYQA-1
Received: by mail-qt1-f199.google.com with SMTP id e3so2937619qtc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=O9xKUyAUH0d0Ei+caa8ta7J/YOQYi2c2xaq3RU442cU=;
 b=Q4YC2McgxV10mpJ7LUDVJXrg9AGy7yBo11JejWo/H0YIyBdfarNEfIYqZEL20EnRah
 sh9hqYN5EZrDXcY4ZaqG0HZuy1eNkhmGwLzRiTJc5wkuTC/CkvhYhIbYKuK7wtmnNf+d
 8827R3Dw7q6HDgRE8bls0IdG0crJTvd+wNyDWc1ZXHBRkH+jWd4XDEq4qlKT6aS6H2sC
 Was5lbCGq8a/ul/3rJ1Jh5p389AXozqo/JH3Hf5XAnMXd3BFoImez+Jsi2NlFpb+6kux
 rqfeEO+Ni1pA4qCH5v1K+gFSjELyPjo6YvhqVnBjbS4ix4peFNwsN6As6j+hmJ4DEqBh
 MR9A==
X-Gm-Message-State: AOAM53263lw/M+f64beYWGAtq3KGDLCwQRDXGzvFuZNncZK/4S1gczkx
 X62jUd6T1xiPIbScZRJPl6gwSXnhREhVbMBYQpOyL/UGjr/SuCcnrVDWNwrRsZ0Fqa6QWvm4vQh
 rgqbxlw1urNtZqKE=
X-Received: by 2002:a37:6116:: with SMTP id v22mr6999963qkb.38.1613063926641; 
 Thu, 11 Feb 2021 09:18:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmM51+6HhLYepjN513o66LM1cNZvo7fPJFHA5eYpEecbDhDuvZoSA4NS0keRZz26WcFn2hVw==
X-Received: by 2002:a37:6116:: with SMTP id v22mr6999932qkb.38.1613063926356; 
 Thu, 11 Feb 2021 09:18:46 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id s14sm3882749qtq.97.2021.02.11.09.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:18:45 -0800 (PST)
Date: Thu, 11 Feb 2021 12:18:44 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210211171844.GB157159@xz-x1>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
 <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
 <20210209200928.GB103365@xz-x1> <20210209203143.GC103365@xz-x1>
 <fa670b07-58c3-f0cc-c358-82c4cbc4deac@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <fa670b07-58c3-f0cc-c358-82c4cbc4deac@virtuozzo.com>
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
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Feb 11, 2021 at 12:21:51PM +0300, Andrey Gruzdev wrote:
> On 09.02.2021 23:31, Peter Xu wrote:
> > On Tue, Feb 09, 2021 at 03:09:28PM -0500, Peter Xu wrote:
> > > Hi, David, Andrey,
> > > 
> > > On Tue, Feb 09, 2021 at 08:06:58PM +0100, David Hildenbrand wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > just stumbled over this, quick question:
> > > > > > 
> > > > > > I recently played with UFFD_WP and notices that write protection is
> > > > > > only effective on pages/ranges that have already pages populated (IOW:
> > > > > > !pte_none() in the kernel).
> > > > > > 
> > > > > > In case memory was never populated (or was discarded using e.g.,
> > > > > > madvice(DONTNEED)), write-protection will be skipped silently and you
> > > > > > won't get WP events for applicable pages.
> > > > > > 
> > > > > > So if someone writes to a yet unpoupulated page ("zero"), you won't
> > > > > > get WP events.
> > > > > > 
> > > > > > I can spot that you do a single uffd_change_protection() on the whole
> > > > > > RAMBlock.
> > > > > > 
> > > > > > How are you handling that scenario, or why don't you have to handle
> > > > > > that scenario?
> > > Good catch..  Indeed I overlooked that as well when reviewing the code.
> > > 
> > > > > Hi David,
> > > > > 
> > > > > I really wonder if such a problem exists.. If we are talking about a
> > > > I immediately ran into this issue with my simplest test cases. :)
> > > > 
> > > > > write to an unpopulated page, we should get first page fault on
> > > > > non-present page and populate it with protection bits from respective vma.
> > > > > For UFFD_WP vma's  page will be populated non-writable. So we'll get
> > > > > another page fault on present but read-only page and go to handle_userfault.
> > > The problem is even if the page is read-only, it does not yet have the uffd-wp
> > > bit set, so it won't really trigger the handle_userfault() path.
> > > 
> > > > You might have to register also for MISSING faults and place zero pages.
> > > So I think what's missing for live snapshot is indeed to register with both
> > > missing & wp mode.
> > > 
> > > Then we'll receive two messages: For wp, we do like before.  For missing, we do
> > > UFFDIO_ZEROCOPY and at the same time dump this page as a zero page.
> > > 
> > > I bet live snapshot didn't encounter this issue simply because normal live
> > > snapshots would still work, especially when there's the guest OS. Say, the
> > > worst case is we could have migrated some zero pages with some random data
> > > filled in along with the snapshot, however all these pages were zero pages and
> > > not used by the guest OS after all, then when we load a snapshot we won't
> > > easily notice either..
> > I'm thinking some way to verify this from live snapshot pov, and I've got an
> > idea so I just share it out...  Maybe we need a guest application that does
> > something like below:
> > 
> >    - mmap() a huge lot of memory
> > 
> >    - call mlockall(), so that pages will be provisioned in the guest but without
> >      data written.  IIUC on the host these pages should be backed by missing
> >      pages as long as guest app doesn't write.  Then...
> > 
> >    - the app starts to read input from user:
> > 
> >      - If user inputs "dirty" and enter: it'll start to dirty the whole range.
> >        Write non-zero to the 1st byte of each page would suffice.
> > 
> >      - If user inputs "check" and enter: it'll read the whole memory chunk to
> >        see whether all the pages are zero pages.  If it reads any non-zero page,
> >        it should bail out and print error.
> > 
> > With the help of above program, we can do below to verify the live snapshot
> > worked as expected on zero pages:
> > 
> >    - Guest: start above program, don't input yet (so waiting to read either
> >      "dirty" or "check" command)
> > 
> >    - Host: start live snapshot
> > 
> >    - Guest: input "dirty" command, so start quickly dirtying the ram
> > 
> >    - Host: live snapshot completes
> > 
> > Then to verify the snapshot image, we do:
> > 
> >    - Host: load the snapshot we've got
> > 
> >    - Guest: (should still be in the state of waiting for cmd) this time we enter
> >      "check"
> > 
> > Thanks,
> > 
> Hi David, Peter,
> 
> A little unexpected behavior, from my point of view, for UFFD write-protection.
> So, that means that UFFD_WP protection/events works only for locked memory?
> I'm now looking at kernel implementation, to understand..

Not really; it definitely works for all memories that we've touched.  My
previous exmaple wanted to let the guest app use a not-yet-allocated page.  I
figured mlockall() might achieve that, hence I proposed such an example
assuming that may verify the zero page issue on live snapshot.  So if my
understanding is correct, if we run above scenario, current live snapshot might
fail that app when we do the "check" command at last, by finding non-zero pages.

Thanks,

-- 
Peter Xu


