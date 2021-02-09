Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B413157E3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:45:39 +0100 (CET)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZtC-0004iv-7T
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9Zfs-0004SQ-Ii
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:31:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9Zfp-00027Y-8w
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612902707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Qu9fsQaFsUe0yC0OTIZivB/gFXdBREHhGb6SFotJxQ=;
 b=dx1WX3pFFtpPwbs2oOGSPBf78oZQZnTB6itixhMIRh8cg6y13BUvpedFNY8phXtApVpTr6
 CMax5MnU1WI5vcO88k/WIEKK+67S9iarazXctFimCUTBo1MQRQSK542T/MXClTFc8ghs71
 j/0H23XXsf2HPhUIWKbjrAxjawVh9lU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-_TdE9sTLOlW0BBT0v0utGA-1; Tue, 09 Feb 2021 15:31:45 -0500
X-MC-Unique: _TdE9sTLOlW0BBT0v0utGA-1
Received: by mail-qt1-f200.google.com with SMTP id i19so8512761qtq.21
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 12:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1Qu9fsQaFsUe0yC0OTIZivB/gFXdBREHhGb6SFotJxQ=;
 b=FNy2eyedO/MiJn4weaSrbIe8rrwuGuAIzk5ThLqSWuHRHjYoKHhY/JAtZfBw6TnNFx
 DC+nvGKQCVNcheDXhwSs03/PARbKWynoTSXBvaFLFHmgqIevCyiPr7iIg402p+lmlFLc
 8/QyJNw2SscuZmgwQQhD8pDk7xrPHzIPz1L0+BW8ECxnoCVZofeU595pf/LVMOP7JS5H
 PsyhERDdgcpl2Cj0NhxLfUqmRCf/eSms414Kw66ZgVX0Is9qbW9nJu2xB3EZEXKWWbBj
 g4hxT79CdiQXRGEWHD8TeerTjRfct8Bi68xRHxr+2HiWba1XM2+Wp59/Ee9zNUHH/NeW
 8Mrg==
X-Gm-Message-State: AOAM531wKNo7uOcn69AtnsMBdhGccI4NQcR9hRXIcg01REVIwrXTJHE7
 3G4XED4LwbuJKVa6+faf4WE/fGyPXlDfaxz0mDiJA68Xf2bzcO8CfZzNAOxzcVINjwjQOBkw2LE
 SMaqtxPGcbC6Jp9s=
X-Received: by 2002:a37:a614:: with SMTP id p20mr10420050qke.445.1612902705322; 
 Tue, 09 Feb 2021 12:31:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3a4TX9OF92xOI1mwNcF1IoFhRqXWzv9PWP7kfx6n9PDmfHgIrcLq7ADcEL1RPfEN61C36JA==
X-Received: by 2002:a37:a614:: with SMTP id p20mr10420031qke.445.1612902705062; 
 Tue, 09 Feb 2021 12:31:45 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id f26sm7594267qkh.80.2021.02.09.12.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:31:44 -0800 (PST)
Date: Tue, 9 Feb 2021 15:31:43 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210209203143.GC103365@xz-x1>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
 <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
 <20210209200928.GB103365@xz-x1>
MIME-Version: 1.0
In-Reply-To: <20210209200928.GB103365@xz-x1>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 03:09:28PM -0500, Peter Xu wrote:
> Hi, David, Andrey,
> 
> On Tue, Feb 09, 2021 at 08:06:58PM +0100, David Hildenbrand wrote:
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
> 
> Good catch..  Indeed I overlooked that as well when reviewing the code.
> 
> > > > 
> > > Hi David,
> > > 
> > > I really wonder if such a problem exists.. If we are talking about a
> > 
> > I immediately ran into this issue with my simplest test cases. :)
> > 
> > > write to an unpopulated page, we should get first page fault on
> > > non-present page and populate it with protection bits from respective vma.
> > > For UFFD_WP vma's  page will be populated non-writable. So we'll get
> > > another page fault on present but read-only page and go to handle_userfault.
> 
> The problem is even if the page is read-only, it does not yet have the uffd-wp
> bit set, so it won't really trigger the handle_userfault() path.
> 
> > You might have to register also for MISSING faults and place zero pages.
> 
> So I think what's missing for live snapshot is indeed to register with both
> missing & wp mode.
> 
> Then we'll receive two messages: For wp, we do like before.  For missing, we do
> UFFDIO_ZEROCOPY and at the same time dump this page as a zero page.
> 
> I bet live snapshot didn't encounter this issue simply because normal live
> snapshots would still work, especially when there's the guest OS. Say, the
> worst case is we could have migrated some zero pages with some random data
> filled in along with the snapshot, however all these pages were zero pages and
> not used by the guest OS after all, then when we load a snapshot we won't
> easily notice either..

I'm thinking some way to verify this from live snapshot pov, and I've got an
idea so I just share it out...  Maybe we need a guest application that does
something like below:

  - mmap() a huge lot of memory

  - call mlockall(), so that pages will be provisioned in the guest but without
    data written.  IIUC on the host these pages should be backed by missing
    pages as long as guest app doesn't write.  Then...

  - the app starts to read input from user:

    - If user inputs "dirty" and enter: it'll start to dirty the whole range.
      Write non-zero to the 1st byte of each page would suffice.

    - If user inputs "check" and enter: it'll read the whole memory chunk to
      see whether all the pages are zero pages.  If it reads any non-zero page,
      it should bail out and print error.

With the help of above program, we can do below to verify the live snapshot
worked as expected on zero pages:

  - Guest: start above program, don't input yet (so waiting to read either
    "dirty" or "check" command)

  - Host: start live snapshot

  - Guest: input "dirty" command, so start quickly dirtying the ram

  - Host: live snapshot completes

Then to verify the snapshot image, we do:

  - Host: load the snapshot we've got

  - Guest: (should still be in the state of waiting for cmd) this time we enter
    "check"

Thanks,

-- 
Peter Xu


