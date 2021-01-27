Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D130611D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:37:16 +0100 (CET)
Received: from localhost ([::1]:53946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4noh-0005XY-0Y
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l4nmI-0004jY-Oq
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:34:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l4nmE-0000o8-2H
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611765280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1U36xJeUtEiV3Jzt0lCZdp2oSyYv8wNcXBerRhhUsdQ=;
 b=Khca1VGHHBTma5qLhq1hFyNJBmImf/U+xL9YDrIIpXoMXuXXvslr+kHFfTm+iCec9U9Vx3
 yHf+bXkuZAV1l6a2b357roOC06sOFHtl9/vOun/ukkVePfM3PFbR7vE+kZiKzWdQ8YlO7p
 TWzrQyHK7p+w3W/6A3qfHPPVA/gsyDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-5mLHxU5sM2atZ90C9K3JpQ-1; Wed, 27 Jan 2021 11:34:38 -0500
X-MC-Unique: 5mLHxU5sM2atZ90C9K3JpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45C94107ACE4;
 Wed, 27 Jan 2021 16:34:37 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33A0619716;
 Wed, 27 Jan 2021 16:34:25 +0000 (UTC)
Date: Wed, 27 Jan 2021 16:34:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: lagarcia@br.ibm.com
Subject: Re: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
Message-ID: <20210127163423.GI3052@work-vm>
References: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
 <20210127111938.GH299797@stefanha-x1.localdomain>
 <cb16f58f-471f-4bf9-8cee-437feeba8750@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <cb16f58f-471f-4bf9-8cee-437feeba8750@linux.ibm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: maxime.coquelin@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Leonardo Augusto Guimarães Garcia (lagarcia@linux.ibm.com) wrote:
> On 1/27/21 8:19 AM, Stefan Hajnoczi wrote:
> > On Tue, Jan 26, 2021 at 03:23:38PM -0300, lagarcia@linux.ibm.com wrote:
> > > From: Leonardo Garcia <lagarcia@br.ibm.com>
> > > 
> > > Currently, as IOMMU and ATS are not supported, if a user mistakenly set
> > > any of them and tries to mount the vhost-user filesystem inside the
> > > guest, whenever the user tries to access the mount point, the system
> > > will hang forever.
> > > 
> > > Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> > > ---
> > >   hw/virtio/vhost-user-fs-pci.c | 7 +++++++
> > >   hw/virtio/vhost-user-fs.c     | 5 +++++
> > >   2 files changed, 12 insertions(+)
> > > 
> > > diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
> > > index 2ed8492b3f..564d1fd108 100644
> > > --- a/hw/virtio/vhost-user-fs-pci.c
> > > +++ b/hw/virtio/vhost-user-fs-pci.c
> > > @@ -11,6 +11,8 @@
> > >    * top-level directory.
> > >    */
> > > +#include "qemu/osdep.h"
> > > +#include "qapi/error.h"
> > >   #include "qemu/osdep.h"
> > >   #include "hw/qdev-properties.h"
> > >   #include "hw/virtio/vhost-user-fs.h"
> > > @@ -45,6 +47,11 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> > >           vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 2;
> > >       }
> > > +    if (vpci_dev->flags & VIRTIO_PCI_FLAG_ATS) {
> > > +        error_setg(errp, "ATS is currently not supported with vhost-user-fs-pci");
> > > +        return;
> > > +    }
> > Why is this check needed in addition to VIRTIO_F_IOMMU_PLATFORM?
> > 
> > What needs to be added to support ATS?
> > 
> > > +
> > >       qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > >   }
> > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > index ac4fc34b36..914d68b3ee 100644
> > > --- a/hw/virtio/vhost-user-fs.c
> > > +++ b/hw/virtio/vhost-user-fs.c
> > > @@ -203,6 +203,11 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
> > >           return;
> > >       }
> > > +    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> > > +        error_setg(errp, "IOMMU is currently not supported with vhost-user-fs");
> > > +        return;
> > > +    }
> > > +
> > >       if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {
> > I thought IOMMU support depends on the vhost-user device backend (e.g.
> > virtiofsd), so the vhost-user backend should participate in advertising
> > this feature.
> > 
> > Perhaps the check should be:
> > 
> >      ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
> >                           VHOST_BACKEND_TYPE_USER, 0);
> >      if (ret < 0) {
> >          error_setg_errno(errp, -ret, "vhost_dev_init failed");
> >          goto err_virtio;
> >      }
> > +
> > +   if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&
> > +       !(fs->vhost_dev.hdev_features & (1ull << VIRTIO_F_IOMMU_PLATFORM))) {
> > +       error_setg(errp, "IOMMU is not supported by the vhost-user device backend");
> > +       goto err_iommu_needed;
> > +   }
> > 
> > Also, can this logic be made generic for all vhost-user devices? It's
> > not really specific to vhost-user-fs.
> 
> Further analyzing this, on vhost-user.c, I see:
> 
>         if (virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM) &&
>                 !(virtio_has_feature(dev->protocol_features,
>                     VHOST_USER_PROTOCOL_F_SLAVE_REQ) &&
>                  virtio_has_feature(dev->protocol_features,
>                     VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
>             error_report("IOMMU support requires reply-ack and "
>                          "slave-req protocol features.");
>             return -1;
>         }
> 
> This code was included by commit 6dcdd06. It included support for
> VIRTIO_F_IOMMU_PLATFORM with vhost_net devices. So, the restriction is not
> generic for all vhost-user devices.

That test is a slightly different test; that's checking that the
vhost-user device has two underlying features that are needed to make
iommu work; it's not a full test though; it doesn't actually check the
vhost-user device also wants to do iommu.

Dave

> Cheers,
> 
> Leo
> 
> > 
> > Stefan
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


