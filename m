Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9864A528C18
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:36:32 +0200 (CEST)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqedz-0008I7-84
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nqdEr-0006nm-QF
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:06:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nqdEm-00056N-Ni
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652717183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=amKtMvj8jEDUU0CnK4XSUgF1Oe+Awr04h/gyWpg5IF0=;
 b=Ao/TFX4DvAZAPHbXu2UNZYRDtdoIOJRU4VZ9dRVli9/lJ2qW49oPff49PjpdYnSw3kFBbP
 PwDEKhf7IHVcbA4Xm9EfV3pC08qI8A8zMjQiHQWSjuC4ZIh8QgEU0dfGiP8EA9mru0RNlU
 fQ00Y9ancuBUTOiTZdvuYMH9pOLA5e0=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-jJCdOU4OOf6sBC147YMBPA-1; Mon, 16 May 2022 12:06:21 -0400
X-MC-Unique: jJCdOU4OOf6sBC147YMBPA-1
Received: by mail-io1-f70.google.com with SMTP id
 l9-20020a0566022dc900b0065df0aa8372so4778376iow.6
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 09:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=amKtMvj8jEDUU0CnK4XSUgF1Oe+Awr04h/gyWpg5IF0=;
 b=x/CUJuNDkfc5D269KNxbi6xL65FPPOV1S8o7YNLu39IPDziwoNgnN27FOQv7pvrs+K
 uEfMjBb90WDDKhhCjMCsRD6tG3BWIl+Xxwlw3zPQljRrjZYcXgjE+R7Fs6//E/LNqUGJ
 N770h18/iB2fDUGpp/Lvnu/o4SahbAXW+XBikrQBS28CD1sPtVnTxTfNfFkvvuXoY3AU
 05YtRotQbFm/2rU2jyEIFuFWCzzYb7+lzokLgKkFkDK2P0qnkX64VK7PUFXaZVixegnz
 NZS9xanh3kopnmcoRWAx933zldjIvNTtm7MdweYYBw9u1Nno5S1fd4QEpV0R2sIAL5+C
 Xv2Q==
X-Gm-Message-State: AOAM532QHs73u/GsGnAQwTjgIeNoTl2CyFLABS/AEOkNeP0aBRBkGyTT
 H709v+GGLzRmNPb9p2VO3yUdpfU3XSHTnAnVy+w/6lQ5N33ro/mOSaMDhvqrXrWkWXac7fXA7f9
 4Kvi8HnQIU64EA4E=
X-Received: by 2002:a05:6638:3f11:b0:32b:dc28:697b with SMTP id
 ck17-20020a0566383f1100b0032bdc28697bmr9882901jab.274.1652717180262; 
 Mon, 16 May 2022 09:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+00g4IhRu6pHKu4BazY8kkAdhDlQR1zkWLCRnCSkb/hfJ1NRf/9uzWZ20BYvyJTQah5yvQg==
X-Received: by 2002:a05:6638:3f11:b0:32b:dc28:697b with SMTP id
 ck17-20020a0566383f1100b0032bdc28697bmr9882879jab.274.1652717180022; 
 Mon, 16 May 2022 09:06:20 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a02ac17000000b0032e168fa56fsm1774646jao.83.2022.05.16.09.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:06:19 -0700 (PDT)
Date: Mon, 16 May 2022 12:06:18 -0400
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 00/21] migration: Postcopy Preemption
Message-ID: <YoJ2emlc16yfW4Po@xz-m1.local>
References: <20220425233847.10393-1-peterx@redhat.com>
 <aba2c7dc-2266-f594-45f4-15f8559cb370@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aba2c7dc-2266-f594-45f4-15f8559cb370@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 16, 2022 at 08:55:50PM +0530, manish.mishra wrote:
> 
> On 26/04/22 5:08 am, Peter Xu wrote:
> > This is v5 of postcopy preempt series.  It can also be found here:
> > 
> >    https://github.com/xzpeter/qemu/tree/postcopy-preempt
> > 
> > RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
> > V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
> > V2:  https://lore.kernel.org/qemu-devel/20220301083925.33483-1-peterx@redhat.com
> > V3:  https://lore.kernel.org/qemu-devel/20220330213908.26608-1-peterx@redhat.com
> > V4:  https://lore.kernel.org/qemu-devel/20220331150857.74406-1-peterx@redhat.com
> > 
> > v4->v5 changelog:
> > - Fixed all checkpatch.pl warnings
> > - Picked up leftover patches from Dan's tls test case series:
> >    https://lore.kernel.org/qemu-devel/20220310171821.3724080-1-berrange@redhat.com/
> > - Rebased to v7.0.0 tag, collected more R-bs from Dave/Dan
> > - In migrate_fd_cleanup(), use g_clear_pointer() for s->hostname [Dan]
> > - Mark postcopy-preempt capability for 7.1 not 7.0 [Dan]
> > - Moved migrate_channel_requires_tls() into tls.[ch] [Dan]
> > - Mention the bug-fixing side effect of patch "migration: Export
> >    tls-[creds|hostname|authz] params to cmdline too" on tls_authz [Dan]
> > - Use g_autoptr where proper [Dan]
> > - Drop a few (probably over-cautious) asserts on local_err being set [Dan]
> > - Quite a few renamings in the qtest in the last few test patches [Dan]
> > 
> > Abstract
> > ========
> > 
> > This series contains two parts now:
> > 
> >    (1) Leftover patches from Dan's tls unit tests v2, which is first half
> >    (2) Leftover patches from my postcopy preempt v4, which is second half
> > 
> > This series added a new migration capability called "postcopy-preempt".  It can
> > be enabled when postcopy is enabled, and it'll simply (but greatly) speed up
> > postcopy page requests handling process.
> > 
> > Below are some initial postcopy page request latency measurements after the
> > new series applied.
> > 
> > For each page size, I measured page request latency for three cases:
> > 
> >    (a) Vanilla:                the old postcopy
> >    (b) Preempt no-break-huge:  preempt enabled, x-postcopy-preempt-break-huge=off
> >    (c) Preempt full:           preempt enabled, x-postcopy-preempt-break-huge=on
> >                                (this is the default option when preempt enabled)
> > 
> > Here x-postcopy-preempt-break-huge parameter is just added in v2 so as to
> > conditionally disable the behavior to break sending a precopy huge page for
> > debugging purpose.  So when it's off, postcopy will not preempt precopy
> > sending a huge page, but still postcopy will use its own channel.
> > 
> > I tested it separately to give a rough idea on which part of the change
> > helped how much of it.  The overall benefit should be the comparison
> > between case (a) and (c).
> > 
> >    |-----------+---------+-----------------------+--------------|
> >    | Page size | Vanilla | Preempt no-break-huge | Preempt full |
> >    |-----------+---------+-----------------------+--------------|
> >    | 4K        |   10.68 |               N/A [*] |         0.57 |
> >    | 2M        |   10.58 |                  5.49 |         5.02 |
> >    | 1G        | 2046.65 |               933.185 |      649.445 |
> >    |-----------+---------+-----------------------+--------------|
> >    [*]: This case is N/A because 4K page does not contain huge page at all
> > 
> > [1] https://github.com/xzpeter/small-stuffs/blob/master/tools/huge_vm/uffd-latency.bpf
> 
> Hi Peter, Just wanted understand what setup was used for these experiments like
> 
> number of vcpu, workload, network bandwidth so that i can make sense of these

40 vcpus, 20GB mem, workload is using mig_mon single thread dirtying
workload:

https://github.com/xzpeter/mig_mon

Network is 10gbps one port.

Another thing to mention is that all these numbers are average page
latencies.

> 
> numbers. Also i could not understand reason for so much difference between preempt
> 
> full and Preempt no-break-huge especially for 1G case, so if you please share little more
> 
> details on this.

The break-huge change is the part where the requested page comes within
sending one huge page in the precopy channel, so we can halt sending that
page and jumps quickly to the postcopy channel for sending that huge page.
When with no-break-huge option we use the separate channel, but we won't
start sending the postcopy page (via postcopy preempt channel) until the
precopy finishes sending the current page.

Please don't trust too much on the 1G use case because the samples are very
much limited (total of 20 pages, and my test memory should be only upon
10+GB which I forgot).

Thanks,

-- 
Peter Xu


