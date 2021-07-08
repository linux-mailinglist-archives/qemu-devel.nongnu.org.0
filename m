Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F3E3C1999
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:07:45 +0200 (CEST)
Received: from localhost ([::1]:44864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZN9-0007ND-IV
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Z7z-00088k-5p
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Z7x-0007wP-FT
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625770320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xf6OO79+mMpwvnAccaQtU7okGnYFJxE+HSIVzmXsFEM=;
 b=RrR92OhtFH9oDIwn9ezyHADLIWLrQMx5YbjmjrzlJRMRZ+90ISlXSjy0QwrYsHnw/BSAmZ
 8KdX1mEy45c1X2UsnnI/CKF6v0pVYNuMc+g0FDBZEwq+08TQbdw/FjIfVULGoZGaVPtlOp
 m1OaDmw4DTxzplsVW54kJu+ol7LEzmI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-JYXiaa8-MoeLtYMTmfQFyw-1; Thu, 08 Jul 2021 14:51:57 -0400
X-MC-Unique: JYXiaa8-MoeLtYMTmfQFyw-1
Received: by mail-qt1-f197.google.com with SMTP id
 d8-20020ac866880000b0290251ed4135d5so4119722qtp.20
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xf6OO79+mMpwvnAccaQtU7okGnYFJxE+HSIVzmXsFEM=;
 b=pwh9fjkNfc7gkipizoiXbtswKN8UrnRB7sd/xxVIVSUFVG7FT7Bs9Z+PiC8XRqwhw0
 Be4GZLYI0thTyyp+jRujpNHalfupX6qJR5uKR7cfjP1okXc/Oc0wbB0xSB2iECFlyIiS
 yi80QoQA+gYZLuZkRL+AzgDraYP0HtMWGbIQQATgW4QBVjzcLhQfzjWgDH0K//lFd4d1
 IcuBkSEIw9M9Xp2gzco1M3RbbW/wlQZVU2wEX6/sI7v5RQzWA9LPZlyvnaYTg5Kag1LI
 M4/LwdeJEsczlWLbByNbgrMqsXckXgVl8MhOyzB7sj94b6atgI5zcPK3kPqoHT/rNEQU
 Ip5A==
X-Gm-Message-State: AOAM533i3pn6g9pdjOMvLmPN2nkpGe/RB0KNwr5n8lM7pkjR7gdbo4JH
 E4x8L97MJlLkIyb37/GxUa7FSt+QL6haWUGFDiY+YGyRjeF1b+iYVVv79dcAXkk4cI8ap0/y18j
 Z5Lj8YhmwMy/v3sU=
X-Received: by 2002:ac8:7f07:: with SMTP id f7mr28892551qtk.120.1625770317049; 
 Thu, 08 Jul 2021 11:51:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz90lF9Kp7oJXcaJAG7wv2M1IZka7Z6qSmLsK18d2kTJEWg2Sc/yFi7bzZEmsYUAcrObr2GHg==
X-Received: by 2002:ac8:7f07:: with SMTP id f7mr28892532qtk.120.1625770316863; 
 Thu, 08 Jul 2021 11:51:56 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 207sm1431914qki.63.2021.07.08.11.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 11:51:56 -0700 (PDT)
Date: Thu, 8 Jul 2021 14:51:55 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 1/2] virtio-balloon: don't start free page hinting if
 postcopy is possible
Message-ID: <YOdJS8kJBqRdbdmE@t490s>
References: <20210708095339.20274-1-david@redhat.com>
 <20210708095339.20274-2-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708095339.20274-2-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 qemu-stable@nongnu.org, Wei Wang <wei.w.wang@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 11:53:38AM +0200, David Hildenbrand wrote:
> Postcopy never worked properly with 'free-page-hint=on', as there are
> at least two issues:
> 
> 1) With postcopy, the guest will never receive a VIRTIO_BALLOON_CMD_ID_DONE
>    and consequently won't release free pages back to the OS once
>    migration finishes.
> 
>    The issue is that for postcopy, we won't do a final bitmap sync while
>    the guest is stopped on the source and
>    virtio_balloon_free_page_hint_notify() will only call
>    virtio_balloon_free_page_done() on the source during
>    PRECOPY_NOTIFY_CLEANUP, after the VM state was already migrated to
>    the destination.
> 
> 2) Once the VM touches a page on the destination that has been excluded
>    from migration on the source via qemu_guest_free_page_hint() while
>    postcopy is active, that thread will stall until postcopy finishes
>    and all threads are woken up. (with older Linux kernels that won't
>    retry faults when woken up via userfaultfd, we might actually get a
>    SEGFAULT)
> 
>    The issue is that the source will refuse to migrate any pages that
>    are not marked as dirty in the dirty bmap -- for example, because the
>    page might just have been sent. Consequently, the faulting thread will
>    stall, waiting for the page to be migrated -- which could take quite
>    a while and result in guest OS issues.
> 
> While we could fix 1) comparatively easily, 2) is harder to get right and
> might require more involved RAM migration changes on source and destination
> [1].
> 
> As it never worked properly, let's not start free page hinting in the
> precopy notifier if the postcopy migration capability was enabled to fix
> it easily. Capabilities cannot be enabled once migration is already
> running.
> 
> Note 1: in the future we might either adjust migration code on the source
>         to track pages that have actually been sent or adjust
>         migration code on source and destination  to eventually send
>         pages multiple times from the source and and deal with pages
>         that are sent multiple times on the destination.
> 
> Note 2: virtio-mem has similar issues, however, access to "unplugged"
>         memory by the guest is very rare and we would have to be very
>         lucky for it to happen during migration. The spec states
>         "The driver SHOULD NOT read from unplugged memory blocks ..."
>         and "The driver MUST NOT write to unplugged memory blocks".
>         virtio-mem will move away from virtio_balloon_free_page_done()
>         soon and handle this case explicitly on the destination.
> 
> [1] https://lkml.kernel.org/r/e79fd18c-aa62-c1d8-c7f3-ba3fc2c25fc8@redhat.com
> 
> Fixes: c13c4153f76d ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> Cc: qemu-stable@nongnu.org
> Cc: Wei Wang <wei.w.wang@intel.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Alexander Duyck <alexander.duyck@gmail.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks, David.

-- 
Peter Xu


