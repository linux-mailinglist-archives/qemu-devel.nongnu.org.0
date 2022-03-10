Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B84D4CA2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:11:19 +0100 (CET)
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSKRi-0001H8-2e
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:11:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nSKQD-0000YX-LY
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:09:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nSKQ9-00081i-Kp
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:09:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646924980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HhrTbJWhVGGGc4ro0PgblOKa9C4xez8T9EAKx6oMdow=;
 b=FP4binWSF+VziJVcjeLL01ixECQeVi8oM342Xo2iQQRbf+WzCDAdnqyRbKuAqGMlMqUPew
 GShixYZKg+DFfLxvr2VzaaJEQ8zKOKQsJF8nia59JZhnqCIhnvInyxIIp/LnojJifZE1oB
 AzgfLh3soOvZaLl2WTSezMODXRZ0tZ0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-DRwT1OYQMLKj6uPJekdNVQ-1; Thu, 10 Mar 2022 10:09:38 -0500
X-MC-Unique: DRwT1OYQMLKj6uPJekdNVQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so1789314wrh.16
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 07:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HhrTbJWhVGGGc4ro0PgblOKa9C4xez8T9EAKx6oMdow=;
 b=2ch63OA5DIhk70EyUw/52udADmNh2HEw/cTv9dxLIrIbJ1oPSLjau8gK/0AD6qBsfJ
 NvJQPLZcJmnthU4Z8hWk0tsI+mcKwX1w6MC7weEO6zHvay1KuShSveQYGXNT5BsfO88I
 HTrN0PR23RYqx8Kk7VsA81Sub4jiqD99pmocmQGF3OdkQIHVu+KtFXk+59WN4+nwvC15
 oECcgeow9GXT++blwfHzCaKX6wOj7ZDHwRWlbU07kNweCUd8MwcXKFt1suWsmXSQQ0o6
 tafFB/rg1iiD19cKXpzrxkMkVS4n/qgNwiGMrJW5P+jXUc1cQiJT84OHGwv+lfxyMDSV
 q62w==
X-Gm-Message-State: AOAM53215bvBSjKA3ajVngXbPPxMUGk+NmS4Vw0FACzudrWFpS7+0Rvc
 svMmTnem9ttnccxx4ANtIWvYwRIvCdBIyCxwRKg5UiOrd/i4NrzJTlwI73cFW41H5cyuFE/zSxu
 aBcD0qWSqdM11+Lo=
X-Received: by 2002:a05:600c:3515:b0:389:dfc0:5991 with SMTP id
 h21-20020a05600c351500b00389dfc05991mr2538819wmq.197.1646924977554; 
 Thu, 10 Mar 2022 07:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUAtDuOoH46LcWB+ChIwsr4lgNFAlMGL9Ly+LcaddarOw8dHUhw+9IBzk4ylbSBDvTZa/JQQ==
X-Received: by 2002:a05:600c:3515:b0:389:dfc0:5991 with SMTP id
 h21-20020a05600c351500b00389dfc05991mr2538799wmq.197.1646924977159; 
 Thu, 10 Mar 2022 07:09:37 -0800 (PST)
Received: from redhat.com ([2.53.27.107]) by smtp.gmail.com with ESMTPSA id
 q16-20020a056000137000b001f046a21afcsm4494086wrz.15.2022.03.10.07.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 07:09:36 -0800 (PST)
Date: Thu, 10 Mar 2022 10:09:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Message-ID: <20220310100903-mutt-send-email-mst@kernel.org>
References: <20220307112939.2780117-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220307112939.2780117-1-pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 12:29:39PM +0100, Halil Pasic wrote:
> Unlike most virtio features ACCESS_PLATFORM is considered mandatory by
> QEMU, i.e. the driver must accept it if offered by the device. The
> virtio specification says that the driver SHOULD accept the
> ACCESS_PLATFORM feature if offered, and that the device MAY fail to
> operate if ACCESS_PLATFORM was offered but not negotiated.
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

It looks good but I'd like to have Cornelia's ack on the
comment text.

> ---
> v2 -> v3:
> * Rebased onto the next branch of the git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
>   repository
> v1 -> v2:
> * Change comment: reflect that this is not about the verify
>   but also about the device features as seen by the driver (Connie)
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
>  hw/virtio/virtio-bus.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index 0f69d1c742..d7ec023adf 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -78,17 +78,23 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
>  
> -    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> -    if (klass->get_dma_as != NULL && has_iommu) {
> +    vdev->dma_as = &address_space_memory;
> +    if (has_iommu) {
> +        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +        /*
> +         * Present IOMMU_PLATFORM to the driver iff iommu_plattform=on and
> +         * device operational. If the driver does not accept IOMMU_PLATFORM
> +         * we fail the device.
> +         */
>          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> -        vdev->dma_as = klass->get_dma_as(qbus->parent);
> -        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> -            error_setg(errp,
> +        if (klass->get_dma_as) {
> +            vdev->dma_as = klass->get_dma_as(qbus->parent);
> +            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> +                error_setg(errp,
>                         "iommu_platform=true is not supported by the device");
> -            return;
> +                return;
> +            }
>          }
> -    } else {
> -        vdev->dma_as = &address_space_memory;
>      }
>  }
>  
> 
> base-commit: 41d137fc631bd9315ff84727d780757d25054c58
> -- 
> 2.32.0


