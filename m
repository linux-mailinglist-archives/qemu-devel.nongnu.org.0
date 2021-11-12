Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7E744E454
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:06:21 +0100 (CET)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlTRs-0002Zs-Ie
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:06:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlTQN-0001dj-8G
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:04:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlTQK-0006ve-8Q
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636711483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BT9XVXOYZ95+faaoAyDJniYkFAQSnjuX3KrtsEGlyGQ=;
 b=DhmeWByain2w665RMikEx0qIRCU98i8tdlXO5nBvHRAltulaXh6lw0IoHfm0Vfk+VnZRVf
 0gLHpxbzGA28JawpQRlLkfmo+j69mn142EbwVutCaQC4cvNvQ8JWI21MCOUy8oqtIxMotw
 TfmUb0OhBjg2wfVaDr1CjimcCEeGcus=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-FPBPp5wdNg-oeZvnlPIPMw-1; Fri, 12 Nov 2021 05:04:42 -0500
X-MC-Unique: FPBPp5wdNg-oeZvnlPIPMw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w26-20020a056402071a00b003e28a389d04so7819073edx.4
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 02:04:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BT9XVXOYZ95+faaoAyDJniYkFAQSnjuX3KrtsEGlyGQ=;
 b=bkdNbBMXaCo1SFRy27isn4ulq5gR0tFIlc50VJiQ05AXgLdSktbxx9eR7zRkN84XtF
 o4Y52KqQKnmVIYHri1+yGD1F+8PUY9Rqh50lnj3DamlMv3Eupf9ssRLfGQ8X9Jub5XR5
 ujorKMd2lmPW/WJXdUW6/RRHIDXrznK/niW3T6GR1HxYhk/Bf5XI8grwACDZy2wPOAYP
 ySy8mxx1SAuYfykX59OKw6Z5djZyCDi64uC8rxqXzqEjBCvd/HbTVLpQBN+yy4i7+ofD
 5z8eZaCrh6wDGGr8KntICRcLZO4gUewiYtERZhahqpym3Pe9UG7qM0JPPwmdgxvrQvAq
 XMTw==
X-Gm-Message-State: AOAM530CK02xyiIF0pNib/hkbz6no7H9DNIH22doUbuDKpH0AckY2dQV
 Z20oPS/T/hpIY2s3vIrK8Xv4EoiUXseKw+poHTbsMjnUyI5A+ysxXov+b8Cut/m2nH7JG2nk1uw
 8leJiT0Eg273688s=
X-Received: by 2002:a17:906:d187:: with SMTP id
 c7mr3479550ejz.477.1636711480965; 
 Fri, 12 Nov 2021 02:04:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwnqAG58NxrtTiAPgbgKeDq9z/zq3H4CYACjv2iR8nUVnS1+6Xmzs0SWchr7uRaBQFgXTHqQ==
X-Received: by 2002:a17:906:d187:: with SMTP id
 c7mr3479512ejz.477.1636711480727; 
 Fri, 12 Nov 2021 02:04:40 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:ac28:448d:9310:293c:3a8b])
 by smtp.gmail.com with ESMTPSA id e19sm2800922edu.47.2021.11.12.02.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 02:04:39 -0800 (PST)
Date: Fri, 12 Nov 2021 05:04:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/2] virtio: use virtio accessor to access packed
 descriptor flags
Message-ID: <20211112045035-mutt-send-email-mst@kernel.org>
References: <20211111063854.29060-1-jasowang@redhat.com>
 <20211111032649-mutt-send-email-mst@kernel.org>
 <CACGkMEv1LVXBV2Pq00jWCbxnr18Ar=df7Lirw2j973Q-hM2MRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEv1LVXBV2Pq00jWCbxnr18Ar=df7Lirw2j973Q-hM2MRw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: eperezma <eperezma@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 10:23:12AM +0800, Jason Wang wrote:
> On Thu, Nov 11, 2021 at 4:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Nov 11, 2021 at 02:38:53PM +0800, Jason Wang wrote:
> > > We used to access packed descriptor flags via
> > > address_space_{write|read}_cached(). When we hit the cache, memcpy()
> > > is used which is not an atomic operation which may lead a wrong value
> > > is read or wrote.
> >
> > Could you clarify where's the memcpy that you see?
> > Thanks!
> 
> In the address_space_{write|read}_cached it self:
> 
> static inline MemTxResult
> =>dress_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
>                            const void *buf, hwaddr len)
> {
>     assert(addr < cache->len && len <= cache->len - addr);
>     if (likely(cache->ptr)) {
>         memcpy(cache->ptr + addr, buf, len);
>         return MEMTX_OK;
>     } else {
>         return address_space_write_cached_slow(cache, addr, buf, len);
>     }
> }
> 
> Thanks

But that's a copy from the cache, not from guest memory.
I don't see how it can change so I don't see why it needs
to be atomic. Was there an actual issue you observed or
is this theoretical?


> >
> > > So this patch switches to use virito_{stw|lduw}_phys_cached() to make
> > > sure the aceess is atomic.
> > >
> > > Fixes: 86044b24e865f ("virtio: basic packed virtqueue support")
> > > Cc: qemu-stable@nongnu.org
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  hw/virtio/virtio.c | 11 ++++-------
> > >  1 file changed, 4 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > index cc69a9b881..939bcbfeb9 100644
> > > --- a/hw/virtio/virtio.c
> > > +++ b/hw/virtio/virtio.c
> > > @@ -507,11 +507,9 @@ static void vring_packed_desc_read_flags(VirtIODevice *vdev,
> > >                                           MemoryRegionCache *cache,
> > >                                           int i)
> > >  {
> > > -    address_space_read_cached(cache,
> > > -                              i * sizeof(VRingPackedDesc) +
> > > -                              offsetof(VRingPackedDesc, flags),
> > > -                              flags, sizeof(*flags));
> > > -    virtio_tswap16s(vdev, flags);
> > > +    hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
> > > +
> > > +    *flags = virtio_lduw_phys_cached(vdev, cache, off);
> > >  }
> > >
> > >  static void vring_packed_desc_read(VirtIODevice *vdev,
> > > @@ -564,8 +562,7 @@ static void vring_packed_desc_write_flags(VirtIODevice *vdev,
> > >  {
> > >      hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
> > >
> > > -    virtio_tswap16s(vdev, &desc->flags);
> > > -    address_space_write_cached(cache, off, &desc->flags, sizeof(desc->flags));
> > > +    virtio_stw_phys_cached(vdev, cache, off, desc->flags);
> > >      address_space_cache_invalidate(cache, off, sizeof(desc->flags));
> > >  }
> > >
> > > --
> > > 2.25.1
> >


