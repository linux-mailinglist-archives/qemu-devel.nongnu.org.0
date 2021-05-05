Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB2374862
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:03:02 +0200 (CEST)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leMnV-000850-Ca
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leMl7-0007Sw-JP
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leMkv-0001Qw-BZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620241218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kSOm2f7rze3k4zuSm8dKptt6vTgghW4uljmpy5XoQgE=;
 b=aorVuiF1MpXY7V0x9zh7d9mk/pIfeNXv/WZ4J8RUB5wIuYvk4TWxUsEnUjAuTv00YkpziY
 8N4Iy7ytrmzHuv6rDYCkcPwECoJ6ltvn6qclOTosEC9yCtWIrFYrvLIzcHxaFo49nDbYvq
 Z3xagdb6lVN5sbQeMZxKANsfSbwW2wQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-N0GxtNJlOcuSDH4H9gX6Nw-1; Wed, 05 May 2021 15:00:15 -0400
X-MC-Unique: N0GxtNJlOcuSDH4H9gX6Nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F2CE107ACF9;
 Wed,  5 May 2021 19:00:14 +0000 (UTC)
Received: from work-vm (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CA2B60C17;
 Wed,  5 May 2021 18:59:48 +0000 (UTC)
Date: Wed, 5 May 2021 19:59:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 08/26] DAX: virtio-fs: Add cache BAR
Message-ID: <YJLrIW4ifEaePnPa@work-vm>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-9-dgilbert@redhat.com>
 <YJKLkQA2s6sgF587@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJKLkQA2s6sgF587@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Apr 28, 2021 at 12:00:42PM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Add a cache BAR into which files will be directly mapped.
> > The size can be set with the cache-size= property, e.g.
> >    -device vhost-user-fs-pci,chardev=char0,tag=myfs,cache-size=16G
> > 
> > The default is no cache.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > with PPC fixes by:
> > Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> > ---
> >  hw/virtio/vhost-user-fs-pci.c     | 32 +++++++++++++++++++++++++++++++
> >  hw/virtio/vhost-user-fs.c         | 32 +++++++++++++++++++++++++++++++
> >  include/hw/virtio/vhost-user-fs.h |  2 ++
> >  3 files changed, 66 insertions(+)
> > 
> > diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
> > index 2ed8492b3f..20e447631f 100644
> > --- a/hw/virtio/vhost-user-fs-pci.c
> > +++ b/hw/virtio/vhost-user-fs-pci.c
> > @@ -12,14 +12,19 @@
> >   */
> >  
> >  #include "qemu/osdep.h"
> > +#include "qapi/error.h"
> >  #include "hw/qdev-properties.h"
> >  #include "hw/virtio/vhost-user-fs.h"
> >  #include "virtio-pci.h"
> >  #include "qom/object.h"
> > +#include "standard-headers/linux/virtio_fs.h"
> > +
> > +#define VIRTIO_FS_PCI_CACHE_BAR 2
> >  
> >  struct VHostUserFSPCI {
> >      VirtIOPCIProxy parent_obj;
> >      VHostUserFS vdev;
> > +    MemoryRegion cachebar;
> >  };
> >  
> >  typedef struct VHostUserFSPCI VHostUserFSPCI;
> > @@ -38,7 +43,9 @@ static Property vhost_user_fs_pci_properties[] = {
> >  static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >  {
> >      VHostUserFSPCI *dev = VHOST_USER_FS_PCI(vpci_dev);
> > +    bool modern_pio = vpci_dev->flags & VIRTIO_PCI_FLAG_MODERN_PIO_NOTIFY;
> >      DeviceState *vdev = DEVICE(&dev->vdev);
> > +    uint64_t cachesize;
> >  
> >      if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> >          /* Also reserve config change and hiprio queue vectors */
> > @@ -46,6 +53,31 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >      }
> >  
> >      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > +    cachesize = dev->vdev.conf.cache_size;
> > +
> > +    if (cachesize && modern_pio) {
> > +        error_setg(errp, "DAX Cache can not be used together with modern_pio");
> 
> It's not necessary to respin but it would help to capture the reason for
> this limitation either in the error message or at least in a comment.
> 
> The problem is that PCI BARs are limited resources and enabling modern
> PIO notify conflicts with the DAX Window BAR usage.

OK, I've added that as a comment:

    if (cachesize && modern_pio) {
        /*
         * We've not got enough BARs for the one used by the DAX cache
         * and also the one used by modern_pio
         */
        error_setg(errp, "DAX Cache can not be used together with modern_pio");
        return;
    }

> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks.

Dave


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


