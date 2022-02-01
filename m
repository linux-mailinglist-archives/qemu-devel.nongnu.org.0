Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D64A659A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:23:04 +0100 (CET)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzg7-00063U-BB
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:23:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nEwJZ-0007mG-LA
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:47:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nEwJW-0002RG-JI
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643734049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CJ1VFBZPTwby5b2KJSBg+ppc3kbbrtaeXa/r/avIcOg=;
 b=MwfjdpsHhv2nCLxL7JZoiJInQbVTNY+al4SOo6tUDE4AW7Uq/zC0PjHVU5CwTwGKilafXg
 cBSCNjI4S2nsg2y4VXv6sG5+KnB12+5Xqljy6uQmd18c9R54JicWWTn6b6fKCHSLZZutCU
 xisJtkTtHxrJEoSjyYHZxiE6mQqOG5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-lYnd7FJoM2mfkxtyxGnEyg-1; Tue, 01 Feb 2022 11:47:28 -0500
X-MC-Unique: lYnd7FJoM2mfkxtyxGnEyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A386983DEA6;
 Tue,  1 Feb 2022 16:47:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30DEA2C1B6;
 Tue,  1 Feb 2022 16:47:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
In-Reply-To: <20220201133915.3764972-1-pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Tue, 01 Feb 2022 17:47:24 +0100
Message-ID: <87h79iy1nn.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-stable@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01 2022, Halil Pasic <pasic@linux.ibm.com> wrote:

> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> unsupported") claims to fail the device hotplug when iommu_platform
> is requested, but not supported by the (vhost) device. On the first
> glance the condition for detecting that situation looks perfect, but
> because a certain peculiarity of virtio_platform it ain't.
>
> In fact the aforementioned commit introduces a regression. It breaks
> virtio-fs support for Secure Execution, and most likely also for AMD SEV
> or any other confidential guest scenario that relies encrypted guest
> memory.  The same also applies to any other vhost device that does not
> support _F_ACCESS_PLATFORM.
>
> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> "device can not access all of the guest RAM" and "iova != gpa, thus
> device needs to translate iova".
>
> Confidential guest technologies currently rely on the device/hypervisor
> offering _F_ACCESS_PLATFORM, so that, after the feature has been
> negotiated, the guest  grants access to the portions of memory the
> device needs to see. So in for confidential guests, generally,
> _F_ACCESS_PLATFORM is about the restricted access to memory, but not
> about the addresses used being something else than guest physical
> addresses.
>
> This is the very reason for which commit f7ef7e6e3b ("vhost: correctly
> turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM

s/for, which //

> form the vhost device that does not need it, because on the vhost

s/form/from/

> interface it only means "I/O address translation is needed".
>
> This patch takes inspiration from f7ef7e6e3b ("vhost: correctly turn on
> VIRTIO_F_IOMMU_PLATFORM"), and uses the same condition for detecting the
> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> by the device, and thus no device capability is needed. In this
> situation claiming that the device does not support iommu_plattform=on
> is counter-productive. So let us stop doing that!
>
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> unsupported")
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: qemu-stable@nongnu.org
>
> ---
>
> v2->v3:
> * Caught a bug: I tired to check if vdev has the feature
>    ACCESS_PLATFORM after we have forced it. Moved the check
>    to a better place
> v1->v2:
> * Commit message tweaks. Most notably fixed commit SHA (Michael)
>
> ---
> ---
>  hw/virtio/virtio-bus.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index d23db98c56..34f5a0a664 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -48,6 +48,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>      VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
>      VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
>      bool has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +    bool vdev_has_iommu = false;

Isn't vdev_has_iommu set unconditionally before you try to use it?

>      Error *local_err = NULL;
>  
>      DPRINTF("%s: plug device.\n", qbus->name);
> @@ -69,11 +70,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
>  
> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> -        error_setg(errp, "iommu_platform=true is not supported by the device");
> -        return;
> -    }
> -
>      if (klass->device_plugged != NULL) {
>          klass->device_plugged(qbus->parent, &local_err);
>      }
> @@ -82,9 +78,14 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
>  
> +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>      if (klass->get_dma_as != NULL && has_iommu) {
>          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>          vdev->dma_as = klass->get_dma_as(qbus->parent);
> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> +            error_setg(errp,
> +                       "iommu_platform=true is not supported by the device");
> +        }
>      } else {

I agree that a short comment would be nice here, but this is preexisting
code anyway...

>          vdev->dma_as = &address_space_memory;
>      }
>
> base-commit: 6621441db50d5bae7e34dbd04bf3c57a27a71b32

...so (with or without fixing the nits):

Acked-by: Cornelia Huck <cohuck@redhat.com>

(i.e. looks sane, but I didn't follow all the paths)


