Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C90936E811
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 11:35:41 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc359-0004e1-Sc
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 05:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lc33y-00048H-0o
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 05:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lc33w-0004bZ-3K
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 05:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619688863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6IBHsZRZeQvHcqU1XdkH3vlmn2O3MmRmPLSXcFaBS7g=;
 b=ELD1V464eGKYZFpGE0DcGxowgFabo0I+cbmnpxopeKM6hjB83xee0RBmuwE9whgSJMQK1j
 iPXm9kW15FBuPDP0XGn74HZzIy+yvi5Oa4iVl71P87GTboOXSGydBnpjxtz5oVIwXYjRqu
 zelqjKaUysRRLDxbGLkmuzdcBWWU2Y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-9QofiSR_PsOtWkhbsZNzFg-1; Thu, 29 Apr 2021 05:34:19 -0400
X-MC-Unique: 9QofiSR_PsOtWkhbsZNzFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 137FE107ACCD;
 Thu, 29 Apr 2021 09:34:18 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-217.ams2.redhat.com [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24C735D9C6;
 Thu, 29 Apr 2021 09:34:12 +0000 (UTC)
Date: Thu, 29 Apr 2021 11:34:11 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH 4/5] virtio: Fail if iommu_platform is requested, but
 unsupported
Message-ID: <YIp9k9AC2jwIMnYA@merkur.fritz.box>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-5-kwolf@redhat.com>
 <20210428192431.GC20605@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20210428192431.GC20605@raphael-debian-dev>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.04.2021 um 21:24 hat Raphael Norwitz geschrieben:
> On Thu, Apr 22, 2021 at 07:02:20PM +0200, Kevin Wolf wrote:
> > Commit 2943b53f6 (' virtio: force VIRTIO_F_IOMMU_PLATFORM') made sure
> > that vhost can't just reject VIRTIO_F_IOMMU_PLATFORM when it was
> > requested. However, just adding it back to the negotiated flags isn't
> > right either because it promises support to the guest that the device
> > actually doesn't support. One example of a vhost-user device that
> > doesn't have support for the flag is the vhost-user-blk export of QEMU.
> > 
> > Instead of successfully creating a device that doesn't work, just fail
> > to plug the device when it doesn't support the feature, but it was
> > requested. This results in much clearer error messages.
> > 
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1935031
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  hw/virtio/virtio-bus.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > index d6332d45c3..859978d248 100644
> > --- a/hw/virtio/virtio-bus.c
> > +++ b/hw/virtio/virtio-bus.c
> > @@ -69,6 +69,11 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >          return;
> >      }
> >
> 
> Can you explain this check a little more?
> 
> Above we have:
> bool has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);

If I underdstand the code correctly, at this point this is still the
unchanged value of the iommu_platform=on|off qdev property as given by
the user.

> and then we get the host features from the bckend:
> vdev->host_features = vdc->get_features(vdev, vdev->host_features

Yes, and now a flag is only set if the user had requested it and the
backend also supports it.

> So as is this is catching the case where vdev->host_features had
> VIRTIO_F_IOMMU_PLATFORM set before (by default?), but doesn't now that
> the features have been retrieved? 
> 
> Why not just:
>     if (!virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {

We don't want to fail if the user hadn't even requested the feature, but
just if it was requested, but could not be provided.

> > +    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> > +        error_setg(errp, "iommu_platform=true is not supported by the device");
> > +        return;
> > +    }
> > +
> >      if (klass->device_plugged != NULL) {
> >          klass->device_plugged(qbus->parent, &local_err);
> >      }

Kevin


