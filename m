Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9124223E3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 12:48:58 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXi0H-0001cQ-Bs
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 06:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXhyo-000824-B9
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXhym-0005UM-TL
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:47:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633430844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSezvwv3jMKfiJeQ28bxl4IfTF/WIcZedFXvE46Dhao=;
 b=CCX6e+Frm1fjafZNFFi0R2xLyowXnAt+iasL4RTDHOz+b+A/zaogcKlBUAC5wHXsFFSLKA
 z8cKIkCnQu3nviTZvcJrp0B8pYr1Pk2ZFe6v/XMttwgy9biFhKGhJA8mwk0XF35Th310Iv
 1374ZM5ZQwRAJYVOHniHPCu+gFJ7gFg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-LCrXzH1VOku9zBwtaRgskQ-1; Tue, 05 Oct 2021 06:47:23 -0400
X-MC-Unique: LCrXzH1VOku9zBwtaRgskQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 k10-20020a508aca000000b003dad77857f7so4313432edk.22
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 03:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GSezvwv3jMKfiJeQ28bxl4IfTF/WIcZedFXvE46Dhao=;
 b=rM1iTJgeQxODjp5D+nljo3+/lefOIfFzG9pj+/ABMGFG1dtGKzLpO9g2GyfogL5smb
 W24fO7Hv6kBNh0u9S+YhRc6yRGzRcdn1kvCX6Un7JXbjV8hvvyWQ5+HaodGl7S07N91a
 4e1uju8P8slnSR90T3xAgV0DTpUUAiN+/Mq41sBaxDOlAIJW9UHxH95o4rkXhz8/Jtww
 YRLyANlC58QStr2SnUO/+KvEUavdJ0uOQ00Xnc4sUnwckWndXMCqobtQZDMNSKlu9Omg
 OXTqhuWaCVsOu0khYsvLeNXysAPfTOjcNPI5CSx/DZ2jZ+jFj02bSJXupgYTKwsAM0oy
 aQgQ==
X-Gm-Message-State: AOAM531v6SvWns633Pou4cAfDyNbjw9YhE9eFrY8uHyjfuOEGlCg8fBl
 2842LJPjpgcPHseJ4XQFAwSg2/MDiLjyhQJMZiT+fpcvfaXNn3eucdNHLbswuFz9biwQcsHpSaB
 mjbEp4cBCRqrVaDw=
X-Received: by 2002:a17:906:3913:: with SMTP id
 f19mr23783072eje.357.1633430842131; 
 Tue, 05 Oct 2021 03:47:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkHxn46mMyBsHV8Kl5BW5My9PyoVeLFBejtw4h3r5E9unv1gW1akbMUdS120l5EcwJ5CL4Wg==
X-Received: by 2002:a17:906:3913:: with SMTP id
 f19mr23783042eje.357.1633430841821; 
 Tue, 05 Oct 2021 03:47:21 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id x5sm4367335edr.78.2021.10.05.03.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 03:47:21 -0700 (PDT)
Date: Tue, 5 Oct 2021 06:47:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH 2/3] vdpa: Add vhost_vdpa_section_end
Message-ID: <20211005064646-mutt-send-email-mst@kernel.org>
References: <20211005080131.408506-1-eperezma@redhat.com>
 <20211005080131.408506-3-eperezma@redhat.com>
 <20211005041429-mutt-send-email-mst@kernel.org>
 <CAJaqyWfa8DLkLjmcOYd-av1ZsTDFyr++_+1omomtS=-Qq=Y9zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfa8DLkLjmcOYd-av1ZsTDFyr++_+1omomtS=-Qq=Y9zw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Parav Pandit <parav@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 11:52:37AM +0200, Eugenio Perez Martin wrote:
> On Tue, Oct 5, 2021 at 10:15 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Oct 05, 2021 at 10:01:30AM +0200, Eugenio Pérez wrote:
> > > Abstract this operation, that will be reused when validating the region
> > > against the iova range that the device supports.
> > >
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> >
> > Note that as defined end is actually 1 byte beyond end of section.
> > As such it can e.g. overflow if cast to u64.
> > So be careful to use int128 ops with it.
> 
> You are right, but this is only the result of extracting "llend"
> calculation in its own function, since it is going to be used a third
> time in the next commit. This next commit contains a mistake because
> of this, as you pointed out.
> 
> Since "last" would be a very misleading name, do you think we could
> give a better name / type to it?
> 
> > Also - document?
> 
> It will be documented with that ("It returns one byte beyond end of
> section" or similar) too.
> 
> Thanks!

that's how c++ containers work so maybe it's not too bad as long
as we document this carefully.

> >
> > > ---
> > >  hw/virtio/vhost-vdpa.c | 18 +++++++++++-------
> > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index ea1aa71ad8..a1de6c7c9c 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -24,6 +24,15 @@
> > >  #include "trace.h"
> > >  #include "qemu-common.h"
> > >
> > > +static Int128 vhost_vdpa_section_end(const MemoryRegionSection *section)
> > > +{
> > > +    Int128 llend = int128_make64(section->offset_within_address_space);
> > > +    llend = int128_add(llend, section->size);
> > > +    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> > > +
> > > +    return llend;
> > > +}
> > > +
> > >  static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
> > >  {
> > >      return (!memory_region_is_ram(section->mr) &&
> > > @@ -160,10 +169,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > >      }
> > >
> > >      iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
> > > -    llend = int128_make64(section->offset_within_address_space);
> > > -    llend = int128_add(llend, section->size);
> > > -    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> > > -
> > > +    llend = vhost_vdpa_section_end(section);
> > >      if (int128_ge(int128_make64(iova), llend)) {
> > >          return;
> > >      }
> > > @@ -221,9 +227,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
> > >      }
> > >
> > >      iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
> > > -    llend = int128_make64(section->offset_within_address_space);
> > > -    llend = int128_add(llend, section->size);
> > > -    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> > > +    llend = vhost_vdpa_section_end(section);
> > >
> > >      trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
> > >
> > > --
> > > 2.27.0
> >


