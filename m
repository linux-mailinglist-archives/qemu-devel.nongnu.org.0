Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04AE4AF9C1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 19:16:41 +0100 (CET)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHrWC-0000uI-Ri
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 13:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nHqig-00066O-DU
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:25:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nHqic-0005Mp-3R
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644427524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2WAVAlUd6yyGbEjbC9kTkk4nXMqvf0VxSndU9KT1QjQ=;
 b=jOcL/apvoAphfqnRVkKHCG6lpCTaQlnnteaAEeSLjf4v7KhOb1qyBmKc5CFKAk+V3ti55V
 +62IjTVc/tiGlHyNR8hYoD0Aevh1Tf+DvgXXaq/Y36xCndFnjq1iznxvj5+8ZHXRjNCNk3
 ASxX45MwZ4jlJfzbgAIQJKvnqnyj23M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-v8hjgmeQOBWHmGdfHLIVLQ-1; Wed, 09 Feb 2022 12:25:22 -0500
X-MC-Unique: v8hjgmeQOBWHmGdfHLIVLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD4498144E9;
 Wed,  9 Feb 2022 17:25:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5AAC84A36;
 Wed,  9 Feb 2022 17:24:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
In-Reply-To: <20220209124534.1206993-1-pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20220209124534.1206993-1-pasic@linux.ibm.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Wed, 09 Feb 2022 18:24:56 +0100
Message-ID: <87leykt0k7.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 09 2022, Halil Pasic <pasic@linux.ibm.com> wrote:

> Unlike most virtio features ACCESS_PLATFORM is considered mandatory by
> QEMU, i.e. the driver must accept it if offered by the device. The
> virtio specification says that the driver SHOULD accept the
> ACCESS_PLATFORM feature if offered, and that the device MAY fail to
> operate if ACCESS_PLATFORM was offered but not negotiated.

Maybe add

(see the "{Driver,Device} Requirements: Reserved Feature Bits" sections
in the virtio spec)

?

>
> While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
> the device when the driver fences ACCESS_PLATFORM. With commit
> 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM") we already made the
> decision to do so whenever the get_dma_as() callback is implemented (by
> the bus), which in practice means for the entirety of virtio-pci.
>
> That means, if the device needs to translate I/O addresses, then
> ACCESS_PLATFORM is mandatory. The aforementioned commit tells us in the
> commit message that this is for security reasons. More precisely if we
> were to allow a less then trusted driver (e.g. an user-space driver, or
> a nested guest) to make the device bypass the IOMMU by not negotiating
> ACCESS_PLATFORM, then the guest kernel would have no ability to
> control/police (by programming the IOMMU) what pieces of guest memory
> the driver may manipulate using the device. Which would break security
> assumptions within the guest.
>
> If ACCESS_PLATFORM is offered not because we want the device to utilize
> an IOMMU and do address translation, but because the device does not
> have access to the entire guest RAM, and needs the driver to grant
> access to the bits it needs access to (e.g. confidential guest support),
> we still require the guest to have the corresponding logic and to accept
> ACCESS_PLATFORM. If the driver does not accept ACCESS_PLATFORM, then
> things are bound to go wrong, and we may see failures much less graceful
> than failing the device because the driver didn't negotiate
> ACCESS_PLATFORM.
>
> So let us make ACCESS_PLATFORM mandatory for the driver regardless
> of whether the get_dma_as() callback is implemented or not.
>
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Fixes: 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM")
>
> ---
>
> RFC -> v1:
> * Tweaked the commit message and fixed typos (Connie)
> * Added two sentences discussing the security implications (Michael)
>
> This patch is based on:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg866199.html
>
> During the review of "virtio: fix the condition for iommu_platform not
> supported" Daniel raised the question why do we "force IOMMU_PLATFORM"
> iff has_iommu && !!klass->get_dma_as. My answer to that was, that
> this logic ain't right.
>
> While at it I used the opportunity to re-organize the code a little
> and provide an explanatory comment.
> ---
>  hw/virtio/virtio-bus.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index fbf0dd14b8..359430eb1c 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -78,16 +78,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
>  
> -    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> -    if (klass->get_dma_as != NULL && has_iommu) {
> +    vdev->dma_as = &address_space_memory;
> +    if (has_iommu) {
> +        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +        /* Fail FEATURE_OK if the device tries to drop IOMMU_PLATFORM */

I must admit that the more I stare at this code, the more confused I
get. We run this function during device realization, and the reason that
the feature bit might have gotten lost is that the ->get_features()
device callback dropped it. This happens before the driver is actually
involved; the check whether the *driver* dropped the feature is done
during feature validation, which is another code path. So what we do
here is failing device realization if a backend doesn't support
IOMMU_PLATFORM, isn't it?

>          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> -        vdev->dma_as = klass->get_dma_as(qbus->parent);
> -        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> -            error_setg(errp,
> +        if (klass->get_dma_as) {
> +            vdev->dma_as = klass->get_dma_as(qbus->parent);
> +            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> +                error_setg(errp,
>                         "iommu_platform=true is not supported by the device");
> +                return;
> +            }
>          }
> -    } else {
> -        vdev->dma_as = &address_space_memory;
>      }
>  }
>  


