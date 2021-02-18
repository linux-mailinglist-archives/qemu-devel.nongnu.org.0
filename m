Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF47831EDBE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 18:56:56 +0100 (CET)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnXr-0004xa-Jr
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 12:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lCnBJ-0002lK-Ms
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:33:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lCnBF-0003iR-Rw
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613669611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1hckwWT4YVx4Gv07irXPEgZ0i4d/P5ogi2ZUMW1KwPw=;
 b=ZFpwu1BLTZNGQ7VnPeGDiwzgUdQqHe9ptxyhWA3JKk27Z6mmQXYgSW2+/FCAqNPx7tmray
 Y8cwobfl7CExkW9Uzy0WDWAA2lAixWq6s9duFhUCfK+5s7rQJf75WJQS/V3s7LA8Wo0oK2
 xR4BhHc+ak22qVXIvckzHKit0UpuktA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-rLgZ_WD_MWyA-NB0wCqZ_g-1; Thu, 18 Feb 2021 12:33:28 -0500
X-MC-Unique: rLgZ_WD_MWyA-NB0wCqZ_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92C2E804039
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 17:33:27 +0000 (UTC)
Received: from work-vm (ovpn-115-17.ams2.redhat.com [10.36.115.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD395100164C;
 Thu, 18 Feb 2021 17:33:13 +0000 (UTC)
Date: Thu, 18 Feb 2021 17:33:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 06/24] DAX: virtio-fs: Add cache BAR
Message-ID: <YC6k156oLZt9fx5T@work-vm>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-7-dgilbert@redhat.com>
 <20210211102555.GG247031@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210211102555.GG247031@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Tue, Feb 09, 2021 at 07:02:06PM +0000, Dr. David Alan Gilbert (git) wrote:
> > @@ -46,6 +51,26 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >      }
> >  
> >      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > +    cachesize = dev->vdev.conf.cache_size;
> > +
> > +    /*
> > +     * The bar starts with the data/DAX cache
> > +     * Others will be added later.
> > +     */
> > +    memory_region_init(&dev->cachebar, OBJECT(vpci_dev),
> > +                       "vhost-fs-pci-cachebar", cachesize);
> 
> s/vhost-fs/vhost-user-fs/ for consistency. Only worth changing if you
> respin.

Done.

> > +    if (cachesize) {
> > +        memory_region_add_subregion(&dev->cachebar, 0, &dev->vdev.cache);
> > +        virtio_pci_add_shm_cap(vpci_dev, VIRTIO_FS_PCI_CACHE_BAR, 0, cachesize,
> > +                               VIRTIO_FS_SHMCAP_ID_CACHE);
> > +    }
> > +
> > +    /* After 'realized' so the memory region exists */
> > +    pci_register_bar(&vpci_dev->pci_dev, VIRTIO_FS_PCI_CACHE_BAR,
> > +                     PCI_BASE_ADDRESS_SPACE_MEMORY |
> > +                     PCI_BASE_ADDRESS_MEM_PREFETCH |
> > +                     PCI_BASE_ADDRESS_MEM_TYPE_64,
> > +                     &dev->cachebar);
> 
> Please include a comment explainig why it's okay to use BAR 2, which is
> already used for the virtio-pci modern io bar (off by default):
> 
>     /*
>      * virtio pci bar layout used by default.
>      * subclasses can re-arrange things if needed.
>      *
>      *   region 0   --  virtio legacy io bar
>      *   region 1   --  msi-x bar
>      *   region 2   --  virtio modern io bar (off by default)
>      *   region 4+5 --  virtio modern memory (64bit) bar
>      *
>      */
> 
> I guess the idea is that the io bar is available since it's off by
> default. What happens if the io bar is enabled?

We don't have many choices; the only other option would be to extend
the modern memory bar at 4/5.

For now, I've added a check:

qemu-system-x86_64: -device vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs,cache-size=4G,modern-pio-notify=true: Cache can not be used together with modern_pio

> Should this bar registration should be conditional (only when cache size
> is greater than 0)?

Yes, added.

Dave


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


