Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E64A6C5E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 08:32:54 +0100 (CET)
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFA8D-0003B4-9X
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 02:32:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nF9im-0007Q1-MZ
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 02:06:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nF9ii-00072Y-Qd
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 02:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643785581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CyFcgqiAbqR7SXHOMKvTa4RcV+Fwn7uGY7WA8M5JNSI=;
 b=P6sGx/kyGun3fw6bQNxXiaVx1jk3CI7pRT+4/12JPDSDociJejMZD2PogeHcxQ/Ee9lYhV
 wB3YcMjf2zdaNohZQayGEm1exxRFe7Z0STy/vpqqPQ9XrUk6Wsay6OC5zziCnTzRGpA8Bl
 Es8NzbRcRpET+hxxn5CTyD7+jXGaxFY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-ShPU47OnP8KY96NkhmpiYg-1; Wed, 02 Feb 2022 02:06:18 -0500
X-MC-Unique: ShPU47OnP8KY96NkhmpiYg-1
Received: by mail-ed1-f70.google.com with SMTP id
 ed6-20020a056402294600b004090fd8a936so9930895edb.23
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 23:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CyFcgqiAbqR7SXHOMKvTa4RcV+Fwn7uGY7WA8M5JNSI=;
 b=HV96LRNBPmxZQ2TLYR/Hap/aXaYi905GAjxkiD3l24YcNKkcP53wktmcJuXztpKpK4
 WM4Cg5ixeEKqlE6CVmfzFC9CBa/hdNs6aQRSTTFwQNtXDj4KKkeELnDQwRJAoQcFKAAp
 HG/MfM3hUFLW72/zLhbLLS0B5IGmigJm4O/LPQjzQISneWnVqOl7nDwEMcF7n7HjO6FC
 badcog+nD2vi4CJ8VnH+i9QHoKoVVo88aWCOKI1oNwm2voPcpkqbbuCLeJAM1AIc/8pr
 EVwny4evkbeZpnwQNHBFuSaGPRgcdGwt5XTQOoOqGsQ+WqGAc0Trp1L1YehPwuzIrioj
 +uzQ==
X-Gm-Message-State: AOAM531+3Le+tmk5pptaWBqNRg/D88v/384I3X54qeZplu2OIxSMQRn3
 8cUOSDxuMb5LiSinTf1qLZvHiuM31bPKsut76czySvsNGkmbKWCDl4BDdKBVkBi+U6Bren3aoy3
 RqxICKROqZS3fGhE=
X-Received: by 2002:a17:907:6e0d:: with SMTP id
 sd13mr18556508ejc.582.1643785577189; 
 Tue, 01 Feb 2022 23:06:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJeb9vKIACMN6xMe/z/tVXOLQXwcPbzTtykOcjJBVJsdue2pigI8n+9KcuMS+5LmfCWYIIxw==
X-Received: by 2002:a17:907:6e0d:: with SMTP id
 sd13mr18556469ejc.582.1643785576853; 
 Tue, 01 Feb 2022 23:06:16 -0800 (PST)
Received: from redhat.com ([2.52.5.34])
 by smtp.gmail.com with ESMTPSA id lt12sm15237350ejb.166.2022.02.01.23.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 23:06:16 -0800 (PST)
Date: Wed, 2 Feb 2022 02:06:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220202020543-mutt-send-email-mst@kernel.org>
References: <20220201133915.3764972-1-pasic@linux.ibm.com>
 <f12eeebf-6c9a-d40f-09de-10eb86dd3c26@linux.ibm.com>
 <20220201193309.7da86258.pasic@linux.ibm.com>
 <365305e3-4224-965d-2cb6-496a95802f0e@gmail.com>
 <20220202021547.20dc65c9.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220202021547.20dc65c9.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Jakob Naucke <Jakob.Naucke@ibm.com>, qemu-stable@nongnu.org,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 02, 2022 at 02:15:47AM +0100, Halil Pasic wrote:
> On Tue, 1 Feb 2022 16:31:22 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
> > On 2/1/22 15:33, Halil Pasic wrote:
> > > On Tue, 1 Feb 2022 12:36:25 -0300
> > > Daniel Henrique Barboza <danielhb@linux.ibm.com> wrote:
> > >   
> > >>> +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > >>>        if (klass->get_dma_as != NULL && has_iommu) {
> > >>>            virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> > >>>            vdev->dma_as = klass->get_dma_as(qbus->parent);
> > >>> +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> > >>> +            error_setg(errp,
> > >>> +                       "iommu_platform=true is not supported by the device");
> > >>> +        }  
> > >>
> > >>  
> > >>>        } else {
> > >>>            vdev->dma_as = &address_space_memory;
> > >>>        }  
> > >>
> > >>
> > >> I struggled to understand what this 'else' clause was doing and I assumed that it was
> > >> wrong. Searching through the ML I learned that this 'else' clause is intended to handle
> > >> legacy virtio devices that doesn't support the DMA API (introduced in 8607f5c3072caeebb)
> > >> and thus shouldn't set  VIRTIO_F_IOMMU_PLATFORM.
> > >>
> > >>
> > >> My suggestion, if a v4 is required for any other reason, is to add a small comment in this
> > >> 'else' clause explaining that this is the legacy virtio devices condition and those devices
> > >> don't set F_IOMMU_PLATFORM. This would make the code easier to read for a virtio casual like
> > >> myself.  
> > > 
> > > I do not agree that this is about legacy virtio. In my understanding
> > > virtio-ccw simply does not need translation because CCW devices use
> > > guest physical addresses as per architecture. It may be considered
> > > legacy stuff form PCI perspective, but I don't think it is legacy
> > > in general.  
> > 
> > 
> > I wasn't talking about virtio-ccw. I was talking about this piece of code:
> > 
> > 
> >      if (klass->get_dma_as != NULL && has_iommu) {
> >          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >          vdev->dma_as = klass->get_dma_as(qbus->parent);
> >      } else {
> >          vdev->dma_as = &address_space_memory;
> >      }
> > 
> > 
> > I suggested something like this:
> > 
> > 
> > 
> >      if (klass->get_dma_as != NULL && has_iommu) {
> >          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >          vdev->dma_as = klass->get_dma_as(qbus->parent);
> >      } else {
> >          /*
> >           * We don't force VIRTIO_F_IOMMU_PLATFORM for legacy devices, i.e.
> >           * devices that don't implement klass->get_dma_as, regardless of
> >           * 'has_iommu' setting.
> >           */
> >          vdev->dma_as = &address_space_memory;
> >      }
> > 
> > 
> > At least from my reading of commits 8607f5c3072 and 2943b53f682 this seems to be
> > the case. I spent some time thinking that this IF/ELSE was wrong because I wasn't
> > aware of this history.
> 
> With virtio-ccw we take the else branch because we don't implement
> ->get_dma_as(). I don't consider all the virtio-ccw to be legacy.
> 
> IMHO there are two ways to think about this: 
> a) The commit that introduced this needs a fix which implemets
> get_dma_as() for virtio-ccw in a way that it simply returns
> address_space_memory.
> b) The presence of ->get_dma_as() is not indicative of "legacy".
> 
> BTW in virtospeak "legacy" has a special meaning: pre-1.0 virtio. Do you
> mean that legacy. And if I read the virtio-pci code correctly
> ->get_dma_as is set for legacy, transitional and modern devices alike.
> 
> IMHO the important thing to figure out is what impact that
> virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> in the first branch (of the if-else) has. IMHO if one examines the
> commits 8607f5c307 ("virtio: convert to use DMA api") and 2943b53f68
> ("virtio: force VIRTIO_F_IOMMU_PLATFORM") very carefully, one will
> probably reach the conclusion that the objective of the latter, is
> to prevent the guest form not negotiating the IOMMU_PLATFORM feature
> (clearing it as part of the feature negotiation) and trying to use
> the device without that feature. In other words, virtio features are
> usually optional for the guest for the sake of compatibility, but
> IOMMU_PLATFORM is not: for very good reasons. Neither the commit message
> nor the patch does mention legacy anywhere. 
> 
> In my opinion not forcing the guest to negotiate IOMMU_PLATFORM when
> ->get_dma_as() is not set is at least unfortunate. Please observe, that
> virtio-pci is not affected by this omission because for virtio-pci
> devices ->get_dma_as != NULL always holds. And what is the deal for
> devices that don't implement get_dma_as() (and don't need address
> translation)? If iommu_platform=on is justified (no user error) then
> the device does not have access to the entire guest memory. Which
> means it more than likely needs cooperation form the guest (driver).
> So detecting that the guest does not support IOMMU_PLATFORM and failing
> gracefully via virtio_validate_features() instead of carrying on
> in good faith and failing in ugly ways when the host attempts to access
> guest memory to which it does not have access to. If we assume user
> error, that is the host can access at least all the memory it needs
> to access to make that device work, then it is probably still a
> good idea to fail the device and thus help the user correct his
> error.
> 
> IMHO the best course of action is
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index 34f5a0a664..1d0eb16d1c 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -80,7 +80,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>  
>      vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>      if (klass->get_dma_as != NULL && has_iommu) {
> -        virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>          vdev->dma_as = klass->get_dma_as(qbus->parent);
>          if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>              error_setg(errp,
> @@ -89,6 +88,7 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>      } else {
>          vdev->dma_as = &address_space_memory;
>      }
> +    virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>  }
> 
> which would be a separate patch, as this is a separate issue. Jason,
> Michael, Connie, what do you think?

Do you mean just force VIRTIO_F_IOMMU_PLATFORM for everyone?
Or am I misreading the patch?


> Regards,
> Halil


