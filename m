Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963E4005BD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:20:47 +0200 (CEST)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEk2-0006LX-E3
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMEeM-00060k-31
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:14:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMEeI-00067V-4V
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630696489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vrvq8jKuQscClk3YfzXWZe7J10kUCXIvpPuT6h9VJuQ=;
 b=LYHYFzVJzIanlpe3s4INBBKmBQk7ymqpN6x8D/Qh/McqgETUpbfcWARUuPXrMe0ZS65zx4
 AOqHXzgay0bPx2hLB4Y8yTqJiPVY1CuqZMUGwRjpbpGXM1Y8l15tiy5O5MWFV/S+loP749
 C+D2FAiM5E8yDuivia4Ki2UaOb6BhWU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-bn_WywydPAGIs1h5cMaFrQ-1; Fri, 03 Sep 2021 15:14:48 -0400
X-MC-Unique: bn_WywydPAGIs1h5cMaFrQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 e14-20020a056214162e00b00375ec21dd99so549863qvw.23
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vrvq8jKuQscClk3YfzXWZe7J10kUCXIvpPuT6h9VJuQ=;
 b=sopAqYXjJqhbaG3NhZ1p2ZwPfd8WKstOE1oUu6sQ8vhMgp5uKFA9W1YoLxrxbvVJd3
 khvL2omAteJ4GlsCO8QviqpEfexfcoT8/vRniB1kdyTmn9lB6ksbTqeIHOePeCf+VAHW
 Flz1A38xA4wCS128ykZqas/QCLN9rmW5aXmGMyAa5E26CvUfv1jWkITTdhD7pJuRAVwg
 TC6naWYjcvwAuvj0puhVpMELM3QazXxSfhn/3n3vPFO9alr8TXxGG5aaEkwXYa1SMahK
 nYurIJ7wEVYQWm+Am/ZLxPlJX5o/lUvQAwgyFDtbzqeECzhlJqFhzuMcf46oTIy8Nw3W
 cIUQ==
X-Gm-Message-State: AOAM530iZvVOz0kYTBAE0pypXyKTKfAhsI9NeCgWPtqhdPhSeSrCqSA7
 LcnsURgHnd6fBXvOKiwlipM0FC79V7NmBgMuRDBgp9HYKO13VxH3Su+WQmD/G2LF9XXMO5JfVPT
 lAGB8ugRQoCd8chA=
X-Received: by 2002:a37:9f15:: with SMTP id i21mr394561qke.16.1630696486391;
 Fri, 03 Sep 2021 12:14:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEKVwbwv+1NGfT/cnYZog/cDTLLYvOGcUtVWNyVwxYSGFsjWLaDi6QvjU83RbgyVACboR0mw==
X-Received: by 2002:a37:9f15:: with SMTP id i21mr394538qke.16.1630696486166;
 Fri, 03 Sep 2021 12:14:46 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id q10sm51811qke.108.2021.09.03.12.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 12:14:45 -0700 (PDT)
Date: Fri, 3 Sep 2021 15:14:43 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 7/9] migration: Simplify alignment and alignment checks
Message-ID: <YTJ0IxZ1UYSYCzCU@t490s>
References: <20210902131432.23103-1-david@redhat.com>
 <20210902131432.23103-8-david@redhat.com> <YTFQ6vzTCFTwK3tz@t490s>
 <8985fca4-e15c-95a7-2c45-74353a3a19fa@redhat.com>
 <2d04741d-94bd-9cd2-4d70-f6505bc8db16@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2d04741d-94bd-9cd2-4d70-f6505bc8db16@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 12:07:20PM +0200, David Hildenbrand wrote:
> On 03.09.21 10:47, David Hildenbrand wrote:
> > On 03.09.21 00:32, Peter Xu wrote:
> > > On Thu, Sep 02, 2021 at 03:14:30PM +0200, David Hildenbrand wrote:
> > > > diff --git a/migration/migration.c b/migration/migration.c
> > > > index bb909781b7..ae97c2c461 100644
> > > > --- a/migration/migration.c
> > > > +++ b/migration/migration.c
> > > > @@ -391,7 +391,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
> > > >    int migrate_send_rp_req_pages(MigrationIncomingState *mis,
> > > >                                  RAMBlock *rb, ram_addr_t start, uint64_t haddr)
> > > >    {
> > > > -    void *aligned = (void *)(uintptr_t)(haddr & (-qemu_ram_pagesize(rb)));
> > > > +    void *aligned = (void *)QEMU_ALIGN_DOWN(haddr, qemu_ram_pagesize(rb));
> > > 
> > > Is uintptr_t still needed?  I thought it would generate a warning otherwise but
> > > not sure.
> > 
> > It doesn't in my setup, but maybe it will on 32bit archs ...
> > 
> > I discussed this with Phil in
> > 
> > https://lkml.kernel.org/r/2c8d80ad-f171-7d5f-3235-92f02fa174b3@redhat.com
> > 
> > Maybe
> > 
> > QEMU_ALIGN_PTR_DOWN((void *)haddr, qemu_ram_pagesize(rb)));
> > 
> > Is really what we want.
> 
> ... but it would suffer the same issue I think. I just ran it trough the
> gitlab pipeline, including "i386-fedora-cross-compile" ... and it seems to
> compile just fine, which is weird, because I'd also expect
> 
> "warning: cast to pointer from integer of different size
> [-Wint-to-pointer-cast]"
> 
> We most certainly need the "(void *)(uintptr_t)" to convert from u64 to a
> pointer.
> 
> Let's just do it cleanly:
> 
> void *unaligned = (void *)(uintptr_t)haddr;
> void *aligned = QEMU_ALIGN_PTR_DOWN(unaligned, qemu_ram_pagesize(rb));
> 
> Thoughts?

---8<---
$ cat a.c
#include <stdio.h>
#include <time.h>
#include <assert.h>

#define ROUND_DOWN(n, d) ((n) & -(0 ? (n) : (d)))
#define QEMU_ALIGN_DOWN(n, m) ((n) / (m) * (m))

unsigned long getns(void)
{
    struct timespec tp;

    clock_gettime(CLOCK_MONOTONIC, &tp);
    return tp.tv_sec * 1000000000 + tp.tv_nsec;
}

void main(void)
{
    int i;
    unsigned long start, end, v1 = 0x1234567890, v2 = 0x1000;

    start = getns();
    for (i = 0; i < 1000000; i++) {
        v1 = ROUND_DOWN(v1, v2);
    }
    end = getns();
    printf("ROUND_DOWN took: \t%ld (us)\n", (end - start) / 1000);

    start = getns();
    for (i = 0; i < 1000000; i++) {
        v1 = QEMU_ALIGN_DOWN(v1, v2);
    }
    end = getns();
    printf("QEMU_ALIGN_DOWN took: \t%ld (us)\n", (end - start) / 1000);
}
$ make a
$ ./a
ROUND_DOWN took:        1445 (us)
QEMU_ALIGN_DOWN took:   9684 (us)
---8<---

So it's ~5 times slower here on the laptop, even if not very stable.  Agree
it's not a big deal. :)

It's just that since we know it's still faster, I then second:

  (uinptr_t)ROUND_DOWN(...);

Thanks,

-- 
Peter Xu


