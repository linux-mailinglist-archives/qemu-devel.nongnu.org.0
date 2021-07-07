Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5635E3BF229
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 00:41:53 +0200 (CEST)
Received: from localhost ([::1]:37914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1GEp-0004Hm-TN
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 18:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1GDl-00038i-E5
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 18:40:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1GDi-00079I-6X
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 18:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625697640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c5jjtdzXoJ8ixCUydUJAcneqRApUOr2AVXzvNeBmd9M=;
 b=Jr1YgHnG/cBpn1P4FnvDH3n3mNZp0TfMiI+NFKVXxDdVe0pTDbaVLk8x+pg05a1UFLOwqP
 w+9smde9VeBSAsOd7BjF0eeDKVz2WVTEUoerOsIFbP8U4XSXYWgmReBkchnxWgN0sTclMt
 +72Ftr/rzcO4zBIPXYatiCF100BE0WA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-3IgfVYdZMziJAqlFJemVPQ-1; Wed, 07 Jul 2021 18:40:39 -0400
X-MC-Unique: 3IgfVYdZMziJAqlFJemVPQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 r190-20020a375dc70000b02903acea04c19fso2542578qkb.8
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 15:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c5jjtdzXoJ8ixCUydUJAcneqRApUOr2AVXzvNeBmd9M=;
 b=AW1c74bi4BZfWaWnuV/3h9l3wvQCeB8jMwTBKencaqgBgTGPNtIgo6tsD/ObUBa1BT
 yhnc+PaWOhhZWygkEZTy6nkGTThili7GxiduJ+2kQxosaxE4+C1Jox5GC9ORfCWbJqNd
 GQKR87ClGQOE4lmLJRXTh7nOcwVtPtrQ6qtA2SHD9XCJxvbb2z//Pj4yj0ecwjzVOwmW
 BWurcbe4C3Krt6MrPcJ68OFOqVqDY0k7WbdZUIDpN5MTiz2iTMK84SxKGrrJQSIY6Msl
 AQuWy2yiq9QHZ2k2J4MYHZ8Omlq3VHCCCEgmsbAjXl5nS03F43QJn4EO7uXrkpC+qLF4
 VAGQ==
X-Gm-Message-State: AOAM533DMORIrcWy0AgKauQH67cZhe5S2qeEndJlbNneh20PtsyYGuXJ
 leNXKB3VtievNbmswJAqOXOsRsNIvQ1egBaunza+n4aM1XlM1TbOT1Z8JnyKWJ6IaC+YVQgbXyU
 9+4dmiioHYRNpoGk=
X-Received: by 2002:ad4:4774:: with SMTP id d20mr26288580qvx.38.1625697639431; 
 Wed, 07 Jul 2021 15:40:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMa5EhIBbWpqgvJXEmdx6ucub9keY4wDVCTQFWKA3NBQZZTAD4erEWbQzV5orUdrlnBuiUjQ==
X-Received: by 2002:ad4:4774:: with SMTP id d20mr26288561qvx.38.1625697639196; 
 Wed, 07 Jul 2021 15:40:39 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id g15sm157204qkl.104.2021.07.07.15.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 15:40:38 -0700 (PDT)
Date: Wed, 7 Jul 2021 18:40:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <YOYtZVM74cx7aRL5@t490s>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com> <YOXsTQoq6eeIR8B5@t490s>
 <5f5dd7f3-ce09-53d6-db48-1a333119205d@redhat.com>
 <YOYJsMUfx1XHFk6G@t490s>
 <CAKgT0Ucp60nxvk4ysydE29RPXUEFUU2f4+=3XMaXFagMef+hbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKgT0Ucp60nxvk4ysydE29RPXUEFUU2f4+=3XMaXFagMef+hbA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Wei Wang <wei.w.wang@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 02:22:32PM -0700, Alexander Duyck wrote:
> On Wed, Jul 7, 2021 at 1:08 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Wed, Jul 07, 2021 at 08:57:29PM +0200, David Hildenbrand wrote:
> > > On 07.07.21 20:02, Peter Xu wrote:
> > > > On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
> > > > > As it never worked properly, let's disable it via the postcopy notifier on
> > > > > the destination. Trying to set "migrate_set_capability postcopy-ram on"
> > > > > on the destination now results in "virtio-balloon: 'free-page-hint' does
> > > > > not support postcopy Error: Postcopy is not supported".
> > > >
> > > > Would it be possible to do this in reversed order?  Say, dynamically disable
> > > > free-page-hinting if postcopy capability is set when migration starts? Perhaps
> > > > it can also be re-enabled automatically when migration completes?
> > >
> > > I remember that this might be quite racy. We would have to make sure that no
> > > hinting happens before we enable the capability.
> > >
> > > As soon as we messed with the dirty bitmap (during precopy), postcopy is no
> > > longer safe. As noted in the patch, the only runtime alternative is to
> > > disable postcopy as soon as we actually do clear a bit. Alternatively, we
> > > could ignore any hints if the postcopy capability was enabled.
> >
> > Logically migration capabilities are applied at VM starts, and these
> > capabilities should be constant during migration (I didn't check if there's a
> > hard requirement; easy to add that if we want to assure it), and in most cases
> > for the lifecycle of the vm.
> 
> Would it make sense to maybe just look at adding a postcopy value to
> the PrecopyNotifyData that you could populate with
> migration_in_postcopy() in precopy_notify()?

Should we check migrate_postcopy_ram() rather than migration_in_postcopy()?
It's the precopy phase that's dropping the dirty bits and can potentially hang
a postcopy vcpu, afaiu.

> 
> Then all you would need to do is check for that value and if it is set
> you shut down the page hinting or don't start it since I suspect it
> wouldn't likely add any value anyway since I would think flagging
> unused pages doesn't add much value in a postcopy environment anyway.
> 
> > >
> > > Whatever we do, we have to make sure that a user cannot trick the system
> > > into an inconsistent state. Like enabling hinting, starting migration, then
> > > enabling the postcopy capability and kicking of postcopy. I did not check if
> > > we allow for that, though.
> >
> > We could turn free page hinting off when migration starts with postcopy-ram=on,
> > then re-enable it after migration finishes.  That looks very safe to me.  And I
> > don't even worry on user trying to mess it up - as that only put their own VM
> > at risk; that's mostly fine to me.
> 
> We wouldn't necessarily even need to really turn it off, just don't
> start it. I wonder if we couldn't just get away with adding a check to
> the existing virtio_balloon_free_page_hint_notify to see if we are in
> the postcopy state there and just shut things down or not start them.

This makes me wonder whether qemu_guest_free_page_hint() should be called at
all on destination host when incoming postcopy migration is in progress.

Right now the check migration_is_setup_or_active() should return true on
destination host, however I am not sure if that's necessary as we don't track
dirty at all there.

-- 
Peter Xu


