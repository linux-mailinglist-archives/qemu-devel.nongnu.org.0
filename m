Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220EF655FA7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 05:11:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9eob-00035c-0T; Sun, 25 Dec 2022 23:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p9eoX-00035P-Qq
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 23:10:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p9eoT-0003ds-Jo
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 23:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672027806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JXpwUJOgicfAduF6Tid9E3GSpzYYEKxYXgDZ/RF9z6I=;
 b=IWhjIVODsXbqxV1KtrxBkBTcOztc0LvXDe24ObdhHS/As/sHE2a7Z2PgS8vZh8ZL8q45qD
 eFJjK+G0E/mUMUQISlwU/7ovhEg4kaFz74F/X+FjM915tdg4cL+znwstMdQbN5ITYLx35j
 mmLKFg69L9+rmAJrWYQopwYp/iWDQ+E=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-LFrliQYlNQKD3ywSD4lahg-1; Sun, 25 Dec 2022 23:10:04 -0500
X-MC-Unique: LFrliQYlNQKD3ywSD4lahg-1
Received: by mail-ot1-f69.google.com with SMTP id
 cj4-20020a056830640400b0066dee63bd77so5803911otb.9
 for <qemu-devel@nongnu.org>; Sun, 25 Dec 2022 20:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JXpwUJOgicfAduF6Tid9E3GSpzYYEKxYXgDZ/RF9z6I=;
 b=6Rsg8qkqQa9dcKHNdgq5F9yAae9+GogOiFKy8mkalrlOY65tPncMCMvdNxVJHPaMix
 bxBMjK9BnqoyxVah8JVg+Re7gt6uxlI1BDeQidEOne3fAGoiLV9yxH/fvPdHUBxlsm9j
 TEERXR5Sewzecx2pXugHgxeUOeIF8n4o2gwh0q6Wecn1fVJIhaCBAfgn3d2pAee4UaOq
 HJQb9CqRL/K2XWDTlKpOjcjgP4uNLm2un+aKNHJWXZ+hSZnQNBL9w4LXmTv0CXjB493Y
 K6Mt0u7yFxGPnxhn9wWkdSQ75R9c/D3V+LBCL9Kfenft4dJR8JA4Wt+nHyNClWfNatAi
 VX6g==
X-Gm-Message-State: AFqh2kp0o1CtTPWjnUUtNXKYl84KI3zxmwzC2bPjSR7qT+heoAUGIj5L
 5Mp1cTCivlZ0ReGXjXru5sQcnIHa0RsTzMxr60BoZmLPzBACU0+DYWIo4gH4As9+I9vUdKJbJ/m
 8dula1ZBWImI3Zr+e75fLltJM3voyEAY=
X-Received: by 2002:a9d:7843:0:b0:678:1eb4:3406 with SMTP id
 c3-20020a9d7843000000b006781eb43406mr1077933otm.237.1672027804033; 
 Sun, 25 Dec 2022 20:10:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu6KIRopCh5+DJBE8i9xg+gVP8xXYjbSKXfVmmQx6NYBRtKRWZsgSYUdamGqYEKO80XpWfXyVWSiUl6hjlu3RQ=
X-Received: by 2002:a9d:7843:0:b0:678:1eb4:3406 with SMTP id
 c3-20020a9d7843000000b006781eb43406mr1077930otm.237.1672027803787; Sun, 25
 Dec 2022 20:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20221206221348.396020-1-peterx@redhat.com>
 <CACGkMEtK8w2OkeZR=Ebp3t8t6bfaJusTRyC0eB3BGyA7KuX5-g@mail.gmail.com>
 <Y6XWy9XPHqhK8BMh@x1n>
In-Reply-To: <Y6XWy9XPHqhK8BMh@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Dec 2022 12:09:52 +0800
Message-ID: <CACGkMEu6OC7eCyR-ztBXGMe-mtWHfLMHPVJrGWO6Rpx3bHTCPQ@mail.gmail.com>
Subject: Re: [PATCH v3] intel-iommu: Document iova_tree
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Dec 24, 2022 at 12:26 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Dec 23, 2022 at 03:48:01PM +0800, Jason Wang wrote:
> > On Wed, Dec 7, 2022 at 6:13 AM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > It seems not super clear on when iova_tree is used, and why.  Add a rich
> > > comment above iova_tree to track why we needed the iova_tree, and when we
> > > need it.
> > >
> > > Also comment for the map/unmap messages, on how they're used and
> > > implications (e.g. unmap can be larger than the mapped ranges).
> > >
> > > Suggested-by: Jason Wang <jasowang@redhat.com>
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > > v3:
> > > - Adjust according to Eric's comment
> > > ---
> > >  include/exec/memory.h         | 28 ++++++++++++++++++++++++++
> > >  include/hw/i386/intel_iommu.h | 38 ++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 65 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > index 91f8a2395a..269ecb873b 100644
> > > --- a/include/exec/memory.h
> > > +++ b/include/exec/memory.h
> > > @@ -129,6 +129,34 @@ struct IOMMUTLBEntry {
> > >  /*
> > >   * Bitmap for different IOMMUNotifier capabilities. Each notifier can
> > >   * register with one or multiple IOMMU Notifier capability bit(s).
> > > + *
> > > + * Normally there're two use cases for the notifiers:
> > > + *
> > > + *   (1) When the device needs accurate synchronizations of the vIOMMU page
> > > + *       tables, it needs to register with both MAP|UNMAP notifies (which
> > > + *       is defined as IOMMU_NOTIFIER_IOTLB_EVENTS below).
> > > + *
> > > + *       Regarding to accurate synchronization, it's when the notified
> > > + *       device maintains a shadow page table and must be notified on each
> > > + *       guest MAP (page table entry creation) and UNMAP (invalidation)
> > > + *       events (e.g. VFIO). Both notifications must be accurate so that
> > > + *       the shadow page table is fully in sync with the guest view.
> > > + *
> > > + *   (2) When the device doesn't need accurate synchronizations of the
> > > + *       vIOMMU page tables, it needs to register only with UNMAP or
> > > + *       DEVIOTLB_UNMAP notifies.
> > > + *
> > > + *       It's when the device maintains a cache of IOMMU translations
> > > + *       (IOTLB) and is able to fill that cache by requesting translations
> > > + *       from the vIOMMU through a protocol similar to ATS (Address
> > > + *       Translation Service).
> > > + *
> > > + *       Note that in this mode the vIOMMU will not maintain a shadowed
> > > + *       page table for the address space, and the UNMAP messages can be
> > > + *       actually larger than the real invalidations (just like how the
> > > + *       Linux IOMMU driver normally works, where an invalidation can be
> > > + *       enlarged as long as it still covers the target range).  The IOMMU
> >
> > Just spot this when testing your fix for DSI:
> >
> >         assert(entry->iova >= notifier->start && entry_end <= notifier->end);
> >
> > Do we need to remove this (but it seems a partial revert of
> > 03c7140c1a0336af3d4fca768de791b9c0e2b128)?
>
> Replied in the othe thread.
>
> I assume this documentation patch is still correct, am I right?  It's
> talking about the possibility of enlarged invalidation range sent from the
> guest and vIOMMU.  That should still not be bigger than the registered
> range in iommu notifiers (even if bigger than the actual unmapped range).

Adding Eugenio.

So I think we need to evaluate the possible side effects to all the
current nmap notifiers. For example the vfio_iommu_map_notify().

And in another thread, if we crop the size, it basically means the
notifier itself will still assume the range is valid, which is not
what is documented in this patch.

What's more interesting I see smmu had:

/* Unmap the whole notifier's range */
static void smmu_unmap_notifier_range(IOMMUNotifier *n)
{
    IOMMUTLBEvent event;

    event.type = IOMMU_NOTIFIER_UNMAP;
    event.entry.target_as = &address_space_memory;
    event.entry.iova = n->start;
    event.entry.perm = IOMMU_NONE;
    event.entry.addr_mask = n->end - n->start;

    memory_region_notify_iommu_one(n, &event);
}

So it looks to me it's more safe to do something similar for vtd first.

Btw, I forgot the reason why we need to crop the size in the case of
device IOTLB, Eguenio do you know that?

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


