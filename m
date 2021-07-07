Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7313BF0A1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 22:09:27 +0200 (CEST)
Received: from localhost ([::1]:60282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DrK-0008Be-7j
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 16:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1DqK-0007Ln-Se
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 16:08:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1DqH-0004HG-Hi
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 16:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625688500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WSfC7JM8c4ofRC7dSY4airnMbWYY65nsSS95ROPxoKY=;
 b=KUByEX2wD+nKx4hdM7hfv9lJmDStt8yBkPFKA15rtO/7TYPkDV8qOpDG01SslNTGGspSA0
 +0S/UMSZRXXRkzW61C1g2tCsbZ7JlTBQh9yswcVGjKavEOtG28y/O3KihC7tmLtftugCxi
 kHXv+B6UrYUCIVUL8DoIdjXsvqt3jbc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-8q5zNvakMgqMvmIskNzcHQ-1; Wed, 07 Jul 2021 16:08:19 -0400
X-MC-Unique: 8q5zNvakMgqMvmIskNzcHQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 q2-20020ad45ca20000b02902b1554c2318so2441759qvh.11
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 13:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WSfC7JM8c4ofRC7dSY4airnMbWYY65nsSS95ROPxoKY=;
 b=Ren+J6qnJIrYUawRWZgK3WJjonJ7DrYF1AwlIWx09VliZKkneoFz24UV0aDpqkXoyK
 YxB0lST2yS70ClVePfMBo7Q7PWvfAAQztue4tjNvqc7hIN57+L5/NANT/jDdFf/p+wYt
 5mEJszansau3gq1dxazZ+72FHpFZSjpZ6M3E12HBh/Q83i0LKXhcL7ip9XGKD+om4gku
 Lx2gm262ez4kRDhASKuhOjwI29nV34Bz+U18+uuqvRebFfFnhiZShdecY6j2oqDSvn8j
 6F4xrk2pSVrMFQ0EJvo/QY4ieg8iokyLZWo9jSjx7V4fLeVRRslbIHQI2VZjK2/fYQWa
 ZgmQ==
X-Gm-Message-State: AOAM5307SgqQjghL9+2hsdIaqtfKxPENYBEEY51UPSORlb926soUmORn
 cDwxeOnwyfOpwS4gLl4IftoPz40WMqVVM06BE01WbnlqVvs9tJ4lKUuIA3iRKclONkSMbeoS5Xt
 nHMvVwLgrqJRvmf0=
X-Received: by 2002:ad4:40c1:: with SMTP id x1mr25824933qvp.33.1625688498976; 
 Wed, 07 Jul 2021 13:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzswpqEFM3E7ml5P22W+9i7H0i649sWL5seu3ptEfAzQg3aH7iR2211OLrHN2cso9W0k0+nKw==
X-Received: by 2002:ad4:40c1:: with SMTP id x1mr25824913qvp.33.1625688498702; 
 Wed, 07 Jul 2021 13:08:18 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id w2sm6342298qkm.65.2021.07.07.13.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 13:08:17 -0700 (PDT)
Date: Wed, 7 Jul 2021 16:08:16 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <YOYJsMUfx1XHFk6G@t490s>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com> <YOXsTQoq6eeIR8B5@t490s>
 <5f5dd7f3-ce09-53d6-db48-1a333119205d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5f5dd7f3-ce09-53d6-db48-1a333119205d@redhat.com>
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 qemu-stable@nongnu.org, Wei Wang <wei.w.wang@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
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

Logically migration capabilities are applied at VM starts, and these
capabilities should be constant during migration (I didn't check if there's a
hard requirement; easy to add that if we want to assure it), and in most cases
for the lifecycle of the vm.

> 
> Whatever we do, we have to make sure that a user cannot trick the system
> into an inconsistent state. Like enabling hinting, starting migration, then
> enabling the postcopy capability and kicking of postcopy. I did not check if
> we allow for that, though.

We could turn free page hinting off when migration starts with postcopy-ram=on,
then re-enable it after migration finishes.  That looks very safe to me.  And I
don't even worry on user trying to mess it up - as that only put their own VM
at risk; that's mostly fine to me.

Thanks,

-- 
Peter Xu


