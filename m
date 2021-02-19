Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04102320022
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 22:12:25 +0100 (CET)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDD4Z-0004ed-J7
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 16:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lDD3K-0004CQ-BZ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:11:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lDD3E-0008Ci-Ul
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613769058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zaA+76+tUOB4hLW6edWiiM0hj272O6xt5WnKulAThE=;
 b=LXg0r+UQZkjpY/zj+CPDfi2/l9ZGYpV699QVs24iSIkZeqYPsfwCRJRJDOE2zfcygQdYAv
 l6RGPw13thT5leeOy5jFUSur57IueT2ifKtp62M7oUG7Eb7Wr8j0S2TylY3BMvb6VC5FEW
 SoB7CA/fHVQ+oaB4zrASm5NFklt5OXk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-0esgxVUkPBuunPOMUpBtHw-1; Fri, 19 Feb 2021 16:10:56 -0500
X-MC-Unique: 0esgxVUkPBuunPOMUpBtHw-1
Received: by mail-qt1-f199.google.com with SMTP id i19so4112246qtx.6
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 13:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4zaA+76+tUOB4hLW6edWiiM0hj272O6xt5WnKulAThE=;
 b=lcGJYEmZKJIOvnympw4kHEx04NW3MdxCO4rDOu5ejOZaAM/USxu18ee6pnC2kCJIwB
 ok5qZNxqdcHJFNJyv+718Plm7sYr/C4b67IP5AJmIFimFP7dF9erOHlEzoyL8Dchydss
 +Il1VAEKtF/505hdHCuQbZM9vF4yH1mAQ4qF9fsiYBt4KLsUFXW7Gbn/z6jotdYniWTX
 X5rtT2y3boDHnau3RvERK5hZZXhtL1icjm8Fo9gAQHRYUik4bH98kbXPRwE0JIdBCh7c
 PDsu2UqhknQ55gaGuMnGuwjzlzWVlb0paSBpKipocQMbFpKizylySDuRT8FrraS/OjoS
 AUpA==
X-Gm-Message-State: AOAM5301Zqn69YS+GFHreUPQ8FF5ZAv03Lw3A9QqVHdJeKojDivLTgPp
 /OTuAiuncjT0zDn9bBUtQlA92oNYnlYV3g8g7PF87FdzctbT9bUu+uLzSTOCVND2ydGGttKnWYJ
 u3giU7xmYA1I6ft8=
X-Received: by 2002:aed:2d45:: with SMTP id h63mr10441978qtd.239.1613769056316; 
 Fri, 19 Feb 2021 13:10:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkQ3gMozzvIi0Abr0dX/Ea3TaZc22VSDP2tNZJQHlN9XTlIlYYnudg8HkNXKxrviiHl+34+w==
X-Received: by 2002:aed:2d45:: with SMTP id h63mr10441962qtd.239.1613769056098; 
 Fri, 19 Feb 2021 13:10:56 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id y2sm7098466qkj.56.2021.02.19.13.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 13:10:55 -0800 (PST)
Date: Fri, 19 Feb 2021 16:10:54 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210219211054.GL6669@xz-x1>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
 <20210212030621.GF157159@xz-x1>
 <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
 <20210212161125.GH157159@xz-x1>
 <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
 <20210216233545.GD91264@xz-x1>
 <add9a7f7-9e02-5024-4bfd-2597a8920ec5@virtuozzo.com>
 <20210219205052.GK6669@xz-x1>
MIME-Version: 1.0
In-Reply-To: <20210219205052.GK6669@xz-x1>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Fri, Feb 19, 2021 at 03:50:52PM -0500, Peter Xu wrote:
> Andrey,
> 
> On Fri, Feb 19, 2021 at 09:57:37AM +0300, Andrey Gruzdev wrote:
> > For the discards that happen before snapshot is started, I need to dig into Linux and QEMU virtio-baloon
> > code more to get clear with it.
> 
> Yes it's very tricky on how the error could trigger.
> 
> Let's think of below sequence:
> 
>   - Start a guest with init_on_free=1 set and also a virtio-balloon device
> 
>   - Guest frees a page P and zeroed it (since init_on_free=1). Now P contains
>     all zeros.
> 
>   - Virtio-balloon reports this page to host, MADV_DONTNEED sent, then this
>     page is dropped on the host.
> 
>   - Start live snapshot, wr-protect all pages (but not including page P because
>     it's currently missing).  Let's call it $SNAPSHOT1.
> 
>   - Guest does alloc_page(__GFP_ZERO), accidentally fetching this page P and
>     returned
> 
>   - So far, page P is still all zero (which is good!), then guest uses page P
>     and writes data to it (say, now P has data P1 rather than all zeros).
> 
>   - Live snapshot saves page P, which content P1 rather than all zeros.
> 
>   - Live snapshot completed.  Saved as $SNAPSHOT1.
> 
> Then when load snapshot $SNAPSHOT1, we'll have P contains data P1.  After
> snapshot loaded, when guest allocate again with alloc_page(__GFP_ZERO) on this
> page P, since guest kernel "thought" this page is all-zero already so memzero()
> is skipped even if __GFP_ZERO is provided.  Then this page P (with content P1)
> got returned for the alloc_page(__GFP_ZERO) even if __GFP_ZERO set.  That could
> break the caller of alloc_page().
> 
> > Anyhow I'm quite sure that adding global MISSING handler for snapshotting
> > is too heavy and not really needed.
> 
> UFFDIO_ZEROCOPY installs a zero pfn and that should be all of it.  There'll
> definitely be overhead, but it may not be that huge as imagined.  Live snapshot
> is great in that we have point-in-time image of guest without stopping the
> guest, so taking slightly longer time won't be a huge loss to us too.
> 
> Actually we can also think of other ways to work around it.  One way is we can
> pre-fault all guest pages before wr-protect.  Note that we don't need to write
> to the guest page because read would suffice, since uffd-wp would also work
> with zero pfn.  It's just that this workaround won't help on saving snapshot
> disk space, but it seems working.  It would be great if you have other
> workarounds, maybe as you said UFFDIO_ZEROCOPY is not the only route.

Wait.. it actually seems to also solve the disk usage issue.. :)

We should just need to make sure to prohibit balloon before staring to
pre-fault read on all guest ram.  Seems awkward, but also seems working.. Hmm..

-- 
Peter Xu


