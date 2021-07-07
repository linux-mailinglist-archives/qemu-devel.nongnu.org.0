Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A373BF00E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:08:46 +0200 (CEST)
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Cub-0002Yz-Ej
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1Ct8-0000vv-72
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:07:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1Ct5-0004Aw-V0
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625684831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ypNvv84iXcVzZehM7AZfSH9krghSc8iJk5sRzmjo2s8=;
 b=BThmFCOh9U1RRG70lEPMqgxBvO1vmvyycZvrfDpuevok1XcJodYHl0/G9BodOmjSaDP1OJ
 jRo4XGfcHrnYryNWxzqT902/eTnQpVtXbULgJBrgG/HJukV9fVxuRamDfbnSdfYAbLPI1s
 B8Aqbrx+DztSsD0WCXVr/eFYhW9nIe0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Bx8hc22DPki7MJx2YVdOvQ-1; Wed, 07 Jul 2021 15:07:07 -0400
X-MC-Unique: Bx8hc22DPki7MJx2YVdOvQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 p19-20020aa7c4d30000b0290394bdda6d9cso1878322edr.21
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 12:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ypNvv84iXcVzZehM7AZfSH9krghSc8iJk5sRzmjo2s8=;
 b=B0jSX4BEiauqXwRXq/gtgCNKvwfCnaEq/FmSXnEoEnrop0Gm3+DqETUcOHsuFTSTM+
 E2E96MmMkK8QhYHKexXW2W80FH3XO+Mc7C/XxtWfED96MuC7UJSxfNNzpPbLmsb7lV19
 Kbcw9BDBxXqz7KuYOry6mve9UcFyHJSkl9J5WzTCYAkRXxmFjWl9zVdtwYV4pPtSKo1M
 U0OWnixY2FgWHrZtokspP8zHMvyTF28UBTjsbJIY2zS0thjpW7T3nX2KBPrjWx3braFx
 gGXTB35l2e2kDVPqmVDh+MaDiHyHfWJm+v1nbR4L4zpllhK5yYa/krtxTTTk08kdQGSY
 cDBg==
X-Gm-Message-State: AOAM5302j4r1kqK1ySMXEMfdnjKJOFteLer//SqbyMf0kL0CH0d6+maw
 cYpsv9PVJIwd2wjh0PqCWhtwWkA855U2irU0DE7savzVqEov0/Fq/yi6F4W7hl3N4e4H9oQLcNK
 iLHrH1/x9FypE8qU=
X-Received: by 2002:a17:907:da7:: with SMTP id
 go39mr26256793ejc.24.1625684826718; 
 Wed, 07 Jul 2021 12:07:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd0JT6NtqFiXmwI6LLOgqrQbCJeQ3SzxV7lKl3bOg3JcSqmyluzbq/HU2+5JKbNtzVvkNnOA==
X-Received: by 2002:a17:907:da7:: with SMTP id
 go39mr26256761ejc.24.1625684826526; 
 Wed, 07 Jul 2021 12:07:06 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id d13sm9349601eds.56.2021.07.07.12.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 12:07:06 -0700 (PDT)
Date: Wed, 7 Jul 2021 15:07:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <20210707150610-mutt-send-email-mst@kernel.org>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com> <YOXsTQoq6eeIR8B5@t490s>
 <5f5dd7f3-ce09-53d6-db48-1a333119205d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5f5dd7f3-ce09-53d6-db48-1a333119205d@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Jul 07, 2021 at 08:57:29PM +0200, David Hildenbrand wrote:
> On 07.07.21 20:02, Peter Xu wrote:
> > On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
> > > As it never worked properly, let's disable it via the postcopy notifier on
> > > the destination. Trying to set "migrate_set_capability postcopy-ram on"
> > > on the destination now results in "virtio-balloon: 'free-page-hint' does
> > > not support postcopy Error: Postcopy is not supported".
> > 
> > Would it be possible to do this in reversed order?  Say, dynamically disable
> > free-page-hinting if postcopy capability is set when migration starts? Perhaps
> > it can also be re-enabled automatically when migration completes?
> 
> I remember that this might be quite racy. We would have to make sure that no
> hinting happens before we enable the capability.
> 
> As soon as we messed with the dirty bitmap (during precopy), postcopy is no
> longer safe. As noted in the patch, the only runtime alternative is to
> disable postcopy as soon as we actually do clear a bit. Alternatively, we
> could ignore any hints if the postcopy capability was enabled.
> 
> Whatever we do, we have to make sure that a user cannot trick the system
> into an inconsistent state. Like enabling hinting, starting migration, then
> enabling the postcopy capability and kicking of postcopy. I did not check if
> we allow for that, though.

What bothers me with limitations like this is we train users about
this lack of orthogonality, it's then very hard to retrain them that
a given feature is safe to use.

> -- 
> Thanks,
> 
> David / dhildenb


