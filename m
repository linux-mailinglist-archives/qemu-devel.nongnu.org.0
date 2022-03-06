Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2DF4CEA79
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 11:17:26 +0100 (CET)
Received: from localhost ([::1]:60424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQnx7-0001MK-H4
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 05:17:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQnvO-0000fC-TY
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:15:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQnvJ-0005rW-Bq
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646561731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zmUHZ5i4cVhD0z2YRWNnqjLiAsF59wNXaxMOjR70RtE=;
 b=guRe+wvBunl/Jeu1erVVSBw2ELSeBbMQpw4wq4/8bpwSdzBa49elF8/PhleJbdvi4ulCtu
 uqhuMFDsHuVg21GFdaCoekWqi2ej96ENrLpiOVzhzW/PziK9uaPquC96Pa56kdWtrBEupg
 h9HV5IpuafXSSKN6ubyx8SqT53o2f0w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-ijgGQkNnM1iRaU9WUtqkrQ-1; Sun, 06 Mar 2022 05:15:28 -0500
X-MC-Unique: ijgGQkNnM1iRaU9WUtqkrQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 3-20020a05600c230300b00384e15ceae4so4800762wmo.7
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 02:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zmUHZ5i4cVhD0z2YRWNnqjLiAsF59wNXaxMOjR70RtE=;
 b=mlTv3fuqOUvmE79KQ+NUv46gfBY2hQIh8E5bCO4ycqHidCFmBocrJuVmGK4QDDDUJo
 NlDgkXmLFbd6/W/C7nnfjTYPpTD/SGa294/GthvNyOgUc0rfjiRT6Ab+uGRwD4Jw0iX3
 OZ7XjkTezWiYLqepgoPU5wCIMyxS7DcVr7/xsToASZrAUpxOF9ZrSGEB0TAqmA16z7D6
 pIpm2CCBA3cV7G/7kRiSvEAk00D8FMAF22gGbxk6+Fsi3nmvNWxEg39dYD7F4n2KtrfC
 C/wqdmkIGaPF4/hS6hEIF5ZtwY3O4NQxp1zRV5R36ZSkwyY4rP1nUfYW/t2PKZn9yh7F
 g5Wg==
X-Gm-Message-State: AOAM533Up4uGVRMFPhD/a5OI/bdYbd2QKd0/se3EPwKFqKQAqP9iUZab
 ZTL75vHsyKyPpW0JQPYIZC6wroiGiQhGkRymuBFMEVtWya/mHLttHKoHXRuSKsz1EDr2bz8vth2
 dlnPvVG68wXp2f2E=
X-Received: by 2002:a1c:a382:0:b0:381:cfd:5564 with SMTP id
 m124-20020a1ca382000000b003810cfd5564mr5217237wme.103.1646561726712; 
 Sun, 06 Mar 2022 02:15:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsjGQIas9bOcijhd1eeeBzaZYh+TfFfnotf2ACpfx4ib3aiq5Qw7Jx5+jCXOAWMjZbovBQxA==
X-Received: by 2002:a1c:a382:0:b0:381:cfd:5564 with SMTP id
 m124-20020a1ca382000000b003810cfd5564mr5217212wme.103.1646561726366; 
 Sun, 06 Mar 2022 02:15:26 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 r20-20020adfa154000000b001f0326a23e1sm8603492wrr.88.2022.03.06.02.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 02:15:25 -0800 (PST)
Date: Sun, 6 Mar 2022 05:15:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Message-ID: <20220306051403-mutt-send-email-mst@kernel.org>
References: <20220304162344.539030-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220304162344.539030-1-pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Fri, Mar 04, 2022 at 05:23:44PM +0100, Halil Pasic wrote:
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

I tried to apply this on top of
    virtio: fix the condition for iommu_platform not supported
and it fails.
Can you rebase this on top of my tree pls?

> ---
> v2 -> v2:
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
>  hw/virtio/virtio-bus.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index fbf0dd14b8..d7ec023adf 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -78,16 +78,23 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
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
> +                return;
> +            }
>          }
> -    } else {
> -        vdev->dma_as = &address_space_memory;
>      }
>  }
>  
> 
> base-commit: 01d1ba29d05b992321d9941e8151c52c6845ce3c
> -- 
> 2.32.0


