Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB4331578A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:15:09 +0100 (CET)
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZPg-0002ZZ-Vg
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9ZKL-0004us-5S
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:09:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9ZKI-0000v9-4W
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612901372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COZSIQAgq5rPDxvNlpbqepsSGa3+cf8IR2IQ4Gi8PxI=;
 b=T+0X23Ii5MU3sJcH98VM6gGuWeCB3snxqHSZkFf4ntVwm2++pXgjHXFDNHlpq/OWJgbsp1
 0IbR/x6qiQn51tOBA40uFd3PvEADs001V5/JbSwgZpEFsp/usgtYfljMcBcSf3EHW4Wgy/
 Iu0XDO8aiUDV89YP8bgWmXJz8kJAlwA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-7ebwKJRuNe--hk_A6XG_GQ-1; Tue, 09 Feb 2021 15:09:30 -0500
X-MC-Unique: 7ebwKJRuNe--hk_A6XG_GQ-1
Received: by mail-qt1-f200.google.com with SMTP id d11so629684qth.3
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 12:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=COZSIQAgq5rPDxvNlpbqepsSGa3+cf8IR2IQ4Gi8PxI=;
 b=AokSQfxd00W3HXBJxKSYLIpLz23Q5CR8+x0a2E3HsXdGymbaBSh6F3ixosLR1keLhE
 Pn9gMdNJtoHmlH1KbRhUYeuDsJN9JK/uSNzTbZ0AkReyGQu3saywdKE57a42Ft9Adp9f
 z2qxzQHmzduM5Cq9A1iwsIJJJ/IIl/9a4cuQbBIDyb2XYpMTrjhsCilocVnMSp3buuYl
 lVpcDM14QzMp3zA3IpDDA1PDF8P+ouvQJBuZqXKo1T2hxhIYOdVrv5XBI3/AovjMGI4F
 bNMbPJxWYBevJ8MZmXmrL1KQVrx7FI6NEpck9BEKmjHCDNtTSnTnkxAlRdAyzv9UuxNp
 5LTA==
X-Gm-Message-State: AOAM5317odOzKEwa+BvOwvuT3YwM7h/5gqCSkfeFyMy1cZwGmMFqKzK+
 NPl1Z0tGKlEMwk/QwiOHfbjsPckC5Vb56JSj5QcT/fAdjkzFOwUH23WcHj9wlXfq6ghnLSYRk5k
 NrWT7E/rce8OIXCc=
X-Received: by 2002:a0c:e98f:: with SMTP id z15mr10915589qvn.25.1612901370430; 
 Tue, 09 Feb 2021 12:09:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiv5+QwkeG1GE9baiP5gXDpwl/VkJjz9sCK3FDpHCLI6NxjJqhv5myNnO3772mBlAwuWvGZA==
X-Received: by 2002:a0c:e98f:: with SMTP id z15mr10915577qvn.25.1612901370197; 
 Tue, 09 Feb 2021 12:09:30 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id s14sm4932349qtq.97.2021.02.09.12.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:09:29 -0800 (PST)
Date: Tue, 9 Feb 2021 15:09:28 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210209200928.GB103365@xz-x1>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
 <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, David, Andrey,

On Tue, Feb 09, 2021 at 08:06:58PM +0100, David Hildenbrand wrote:
> > > Hi,
> > > 
> > > just stumbled over this, quick question:
> > > 
> > > I recently played with UFFD_WP and notices that write protection is
> > > only effective on pages/ranges that have already pages populated (IOW:
> > > !pte_none() in the kernel).
> > > 
> > > In case memory was never populated (or was discarded using e.g.,
> > > madvice(DONTNEED)), write-protection will be skipped silently and you
> > > won't get WP events for applicable pages.
> > > 
> > > So if someone writes to a yet unpoupulated page ("zero"), you won't
> > > get WP events.
> > > 
> > > I can spot that you do a single uffd_change_protection() on the whole
> > > RAMBlock.
> > > 
> > > How are you handling that scenario, or why don't you have to handle
> > > that scenario?

Good catch..  Indeed I overlooked that as well when reviewing the code.

> > > 
> > Hi David,
> > 
> > I really wonder if such a problem exists.. If we are talking about a
> 
> I immediately ran into this issue with my simplest test cases. :)
> 
> > write to an unpopulated page, we should get first page fault on
> > non-present page and populate it with protection bits from respective vma.
> > For UFFD_WP vma's  page will be populated non-writable. So we'll get
> > another page fault on present but read-only page and go to handle_userfault.

The problem is even if the page is read-only, it does not yet have the uffd-wp
bit set, so it won't really trigger the handle_userfault() path.

> You might have to register also for MISSING faults and place zero pages.

So I think what's missing for live snapshot is indeed to register with both
missing & wp mode.

Then we'll receive two messages: For wp, we do like before.  For missing, we do
UFFDIO_ZEROCOPY and at the same time dump this page as a zero page.

I bet live snapshot didn't encounter this issue simply because normal live
snapshots would still work, especially when there's the guest OS. Say, the
worst case is we could have migrated some zero pages with some random data
filled in along with the snapshot, however all these pages were zero pages and
not used by the guest OS after all, then when we load a snapshot we won't
easily notice either..

Thanks,

-- 
Peter Xu


