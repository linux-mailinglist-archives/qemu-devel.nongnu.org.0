Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99020F55C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 15:03:43 +0200 (CEST)
Received: from localhost ([::1]:50486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqFvK-0001Jb-4q
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 09:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jqFuP-0000fG-Tx
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 09:02:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40497
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jqFuK-0000gR-3j
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 09:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593522159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9EOIPV5HEb7Lxc0+AKovLle8DNdiSXzleIXpmLw5JfU=;
 b=JZDXtoo0cKumX9uD4Qx+BayNS3ueRzz9IL0hZx+VBn9TGddjwT7BThdsfP/Zo61hs76cKQ
 Zk7zAxpniiwrEky13qGmNCnfCzPv+5FoborLTCbok9tr1V4rw+sSbjfborMsTOQ9tqOfoA
 xqtKYFnNRKgoaNlJ8H91EsvUn9PvO6o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-Xt-0CUk3PCS2707HaT1CWQ-1; Tue, 30 Jun 2020 09:02:37 -0400
X-MC-Unique: Xt-0CUk3PCS2707HaT1CWQ-1
Received: by mail-wr1-f71.google.com with SMTP id g14so18703839wrp.8
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 06:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9EOIPV5HEb7Lxc0+AKovLle8DNdiSXzleIXpmLw5JfU=;
 b=XXYDuZ8rKy4p/1RG65ppq2BD3GX6W2Tj168We1mn0B3TVUlsY1OwVfnqokI0CjAbsF
 VsS0iRFtlLVO/h4JeUMjaQJ+f/a0Y0fgpEdSGyYRxgKqLLdIWDMBRT+fh/XEwSQnqCN+
 mtJpOof5+5RJzlympvZRy8ShURFPMVO/BZsB4nhyk8TUQe3x/5E9N8krd/5Ixao7P32t
 YW8NwasaWLLUyaanou+NoKg/yilTPu3mYEmxlaIBVCRkODL/aRQ5ZWqHlPIgLCLoF8dY
 iTxpZutu+QNSrHFRmDUt/hBxAAqkC8autE0HHLGXWe0TQXETAdHtrZy/4M4RVjfxULVD
 721Q==
X-Gm-Message-State: AOAM530iTOWkyztpEhB3gb7MjfHS1JIxX1r6lXRltAFPTFKmRXP9mJy7
 ygPeBQtB1bb2+r/6rd1CIsk+xbialx66PZO+5pFZPKtKn/RV1yUmMZ736Q0X2FdhP7AZ9wykTBO
 gRQ7HnpZK38+YZFQ=
X-Received: by 2002:a5d:634e:: with SMTP id b14mr23279808wrw.423.1593522156252; 
 Tue, 30 Jun 2020 06:02:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKgXUJDudflKVNFSycjYG5TpCyMB9B+i9lFdnCL9+tXMF0uM4ihtRxCnM2R1IlInkTIPwQgA==
X-Received: by 2002:a5d:634e:: with SMTP id b14mr23279746wrw.423.1593522155467; 
 Tue, 30 Jun 2020 06:02:35 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 b62sm3440480wmh.38.2020.06.30.06.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 06:02:34 -0700 (PDT)
Date: Tue, 30 Jun 2020 09:02:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH RFC] virtio-fs: force virtio 1.x usage
Message-ID: <20200630074918-mutt-send-email-mst@kernel.org>
References: <20200629102758.421552-1-cohuck@redhat.com>
 <20200629104948-mutt-send-email-mst@kernel.org>
 <20200629173933.35cea40f.cohuck@redhat.com>
 <20200629114515-mutt-send-email-mst@kernel.org>
 <20200630113527.7b27f34f.cohuck@redhat.com>
 <20200630064227-mutt-send-email-mst@kernel.org>
 <20200630133043.2be1d209.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200630133043.2be1d209.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 03:55:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eric Auger <eric.auger@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 30, 2020 at 01:30:43PM +0200, Cornelia Huck wrote:
> On Tue, 30 Jun 2020 06:45:42 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Tue, Jun 30, 2020 at 11:35:27AM +0200, Cornelia Huck wrote:
> > > On Mon, 29 Jun 2020 11:45:35 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >   
> > > > On Mon, Jun 29, 2020 at 05:39:33PM +0200, Cornelia Huck wrote:  
> > > > > On Mon, 29 Jun 2020 10:53:23 -0400
> > > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > >     
> > > > > > On Mon, Jun 29, 2020 at 12:27:58PM +0200, Cornelia Huck wrote:    
> > > > > > > virtio-fs devices are only specified for virtio-1, so it is unclear
> > > > > > > how a legacy or transitional device should behave.
> > > > > > > 
> > > > > > > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > > > > > > ---
> > > > > > > 
> > > > > > > Forcing off legacy now (after the virtio-fs device has already been
> > > > > > > available) may have unintended consequences, therefore RFC.
> > > > > > > 
> > > > > > > By default, a virtio-pci device uses 'AUTO' for disable_legacy, which
> > > > > > > will resolve to different values based upon which bus the device has
> > > > > > > been plugged. Therefore, forcing disable_legacy may result in the same
> > > > > > > device or a quite different one.
> > > > > > > 
> > > > > > > Even though pre-virtio-1 behaviour of virtio-fs devices is simply not
> > > > > > > specified, toggling disable_legacy will have implications for the BAR
> > > > > > > layout, IIRC, and therefore a guest might end up getting a different
> > > > > > > device, even if it always used it with virtio-1 anyway.
> > > > > > > 
> > > > > > > Not sure what the best way to solve this problem is. Adding a compat
> > > > > > > property for disable_legacy=AUTO may be the right thing to do, but I'm
> > > > > > > not quite clear if there are any further implications here.     
> > > 
> > > Hnm, I'm a bit confused where to actually set this property...  
> > 
> > 
> > Not a property, just some flag that I'd set in the core,
> > and then teach all transports to take that into account.
> 
> I was thinking about compat handling for the disable-legacy property
> (struggling a bit with it).

Let's figure out if we actually need it.


> > 
> > > > > > 
> > > > > > Well I notice that this device is not migrateable.
> > > > > > So I think that we can just switch it over and be done with it.    
> > > > > 
> > > > > Oh, that makes things easier. (I'm wondering if libvirt already
> > > > > configures this correctly?)
> > > > >     
> > > > > > 
> > > > > >     
> > > > > > > Whatever we do here, we should make sure that the ccw incarnation of
> > > > > > > this device indeed forces virtio-1.      
> > > > > > 
> > > > > > I agree. I notice that the API virtio_pci_force_virtio_1 turned out
> > > > > > to be too fragile. I propose that instead we have a whitelist of
> > > > > > devices which can be legacy or transitional. Force rest to modern.    
> > > > > 
> > > > > Also, there are further complications because the mechanism is per
> > > > > transport, and therefore easy to miss.
> > > > > 
> > > > > bool virtio_legacy_allowed(VirtIODevice *vdev)
> > > > > {
> > > > >     switch (vdev->device_id) {
> > > > >     case <...>:
> > > > >     <list of legacy-capable devices>
> > > > >         return true;
> > > > >     default:
> > > > >         return false;
> > > > > }
> > > > > 
> > > > > Seems straightforward enough.    
> > > > 
> > > > 
> > > > Agreed. virtio spec has the list.  
> > > 
> > > Ok, I've been staring at this a bit, and it's a bit messy for other
> > > reasons.
> > > 
> > > First, I noticed that virtio-iommu does not force virtio-1, either; I
> > > think it should? Eric?
> > > 
> > > Then, there's the mechanism using different names for transitional and
> > > non-transitional devices. Devices that support both usually define both
> > > names (with disable_legacy and disable_modern set appropriately) and a
> > > base name (where the properties can be set manually for the desired
> > > effect). Most virtio-1 only devices set neither the non-transitional
> > > nor the transitional name and rely on virtio_pci_force_virtio_1() to
> > > disable legacy support. But there are outliers:
> > > 
> > > * this device: it has only a non-transitional name
> > >   ("vhost-user-fs-pci"), which means we automatically get the correct
> > >   configuration; in order to define a transitional/legacy device, you
> > >   would need to use the base name "vhost-user-fs-pci-base" explicitly,
> > >   and it's unlikely that someone has been doing that.
> > > * virtio-iommu (which I *think* is a virtio-1 only device): it defines
> > >   the full set of transitional, non-transitional, and base names.
> > > 
> > > How should we proceed?
> > > * With this patch here, we can fence off the very unlikely possibility
> > >   of somebody configuring a non-modern virtio-fs device for pci. We
> > >   probably should do it, but I don't think we need compat handling.
> > > * For virtio-iommu, we should get an agreement what the desired state
> > >   is. If it really should be modern only, we need compat handling, as
> > >   the device had been added in 5.0. (And we need to figure out how to
> > >   apply that compat handling.)  
> > 
> > 
> > Well I know it's not really used on x86 yet, so no problem there.
> > 
> > Which machines are actually affected?
> 
> I'd suspect ARM, but breaking even a subset is not nice.

OK so MMIO does not have transitional at all right?


> > 
> > 
> > > * What is the preferred way to express 'this virtio-pci device is
> > >   modern only'? Using virtio_pci_force_virtio_1()? Setting the
> > >   non-transitional name to the obvious name? Both?
> > > * We probably still want to have a 'central authority' for whether a
> > >   device is virtio-1 only or not, so all transports can refer to it.
> > > 
> > > Thoughts?  
> > 
> > 
> > I still think that for the above the best approach is a whitelist
> > of legacy virtio IDs.
> 
> I agree, a list of the device types that actually support legacy seems
> like the way to go. Making it accessible at the right point in the
> device instantiation process is the fiddly bit; but maybe I just need a
> break from staring at this.
> 
> > 
> > > >   
> > > > > > 
> > > > > >     
> > > > > > > ---
> > > > > > >  hw/virtio/vhost-user-fs-pci.c | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > 
> > > > > > > diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
> > > > > > > index e11c889d82b3..244205edf765 100644
> > > > > > > --- a/hw/virtio/vhost-user-fs-pci.c
> > > > > > > +++ b/hw/virtio/vhost-user-fs-pci.c
> > > > > > > @@ -44,6 +44,7 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> > > > > > >          vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 2;
> > > > > > >      }
> > > > > > >  
> > > > > > > +    virtio_pci_force_virtio_1(vpci_dev);
> > > > > > >      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > > > > > >  }
> > > > > > >  
> > > > > > > -- 
> > > > > > > 2.25.4      
> > > > > >     
> > > >   
> > 


