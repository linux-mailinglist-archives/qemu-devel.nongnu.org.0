Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4974B0A13
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 10:58:31 +0100 (CET)
Received: from localhost ([::1]:33560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI6Dd-0002bT-JA
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 04:58:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nI6Ax-0001YX-8D
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:55:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nI6As-0000nZ-V1
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644486937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nPi5ALkdOEsc6jmoZ203gcg8xGRX/TBrTztI8ekR/8U=;
 b=ap6aE5UQAYOpt8IUc/jaW6Oki7ebs2LTc8iZlW1iZYgLvJR4m/QjfrVI2Bry1JzZMCPBst
 ixHqOdbRnDVzba1VLnUW0/zPkezHYbgtgx3FHtCbWbbKWhwiN2FF6o4NrTQ/NUNhm4Fk+U
 5mRVxaY9FN4vBzkT7mYN25gDYyLIztc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-ZEvVgvlvNZW9BNNf3bztUw-1; Thu, 10 Feb 2022 04:55:29 -0500
X-MC-Unique: ZEvVgvlvNZW9BNNf3bztUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2F95835B8D;
 Thu, 10 Feb 2022 09:55:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C956607CB;
 Thu, 10 Feb 2022 09:55:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
In-Reply-To: <20220209212750.25ddcebe.pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20220209124534.1206993-1-pasic@linux.ibm.com>
 <87leykt0k7.fsf@redhat.com> <20220209212750.25ddcebe.pasic@linux.ibm.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Thu, 10 Feb 2022 10:55:13 +0100
Message-ID: <87fsort5a6.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 09 2022, Halil Pasic <pasic@linux.ibm.com> wrote:

> On Wed, 09 Feb 2022 18:24:56 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
>
>> On Wed, Feb 09 2022, Halil Pasic <pasic@linux.ibm.com> wrote:
>> > @@ -78,16 +78,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>> >          return;
>> >      }
>> >  
>> > -    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>> > -    if (klass->get_dma_as != NULL && has_iommu) {
>> > +    vdev->dma_as = &address_space_memory;
>> > +    if (has_iommu) {
>> > +        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>> > +        /* Fail FEATURE_OK if the device tries to drop IOMMU_PLATFORM */  
>> 
>> I must admit that the more I stare at this code, the more confused I
>> get. We run this function during device realization, and the reason that
>> the feature bit might have gotten lost is that the ->get_features()
>> device callback dropped it. This happens before the driver is actually
>> involved; the check whether the *driver* dropped the feature is done
>> during feature validation, which is another code path. 
> [moved text from here]
>> 
>> >          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM); [Mark 1]
>
>
> Let us have a look at 
> static int virtio_validate_features(VirtIODevice *vdev)                         
> {                                                                               
>     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);                       
>                                                                                 
>     if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&               
>         !virtio_vdev_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {              
>         return -EFAULT;                                                         [Mark 2]                  
>     }                                                                           
> [..]
>
> So were it not of the [Mark 1] we could not hit [Mark 2] if the feature
> bit was lost because the ->get_features() callback dropped it. Yes,
> feature negotiation is another code path, but the two are interdependent
> in a non-trivial way. That is why I added that comment.

Yes, of course we need to offer the bit to the driver in the first
place. My point is that the code here is not what makes us fail
FEATURES_OK; we won't even get to that point because the device will
fail realization.

>
> [moved here]
>> So what we do
>> here is failing device realization if a backend doesn't support
>> IOMMU_PLATFORM, isn't it?
>
> Not really. We fail the device realization if !vdev_has_iommu &&
> vdev->dma_as != &address_space_memory, that is the device does not
> support address translation, but we need it to support address
> translation because ->dma_as != &address_space memory. If however
> ->dma_as == &address_space memory we carry on happily even if ->get_features() dropped
> IOMMU_PLATFORM, because we don't actually need an iova -> gpa
> translation. This is the case with virtiofs confidential guests for
> example.
>

Well yes, that's what I meant, I just did not spell out all of the
conditions...

> But we still don't want the guest dropping ACCESS_PLATFORM, because it is
> still mandatory, because the device won't operate correctly unless the
> driver grants access to the pieces of memory that the device needs to
> access. The underlying mechanism of granting access may not have
> anything to do with an IOMMU though.
>
> Does it make sense now?

The code yes, the comment no. What we are actually doing is failing
realization so we don't end up offering a device without IOMMU_PLATFORM
that would need it. The code that fails FEATURES_OK if the driver
dropped it is already in place.

I'd suggest a comment like

/* make sure that the device did not drop a required IOMMU_PLATFORM */

or so.


>
>> > -        vdev->dma_as = klass->get_dma_as(qbus->parent);
>> > -        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>> > -            error_setg(errp,
>> > +        if (klass->get_dma_as) {
>> > +            vdev->dma_as = klass->get_dma_as(qbus->parent);
>> > +            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>> > +                error_setg(errp,
>> >                         "iommu_platform=true is not supported by the device");
>> > +                return;
>> > +            }
>> >          }
>> > -    } else {
>> > -        vdev->dma_as = &address_space_memory;
>> >      }
>> >  }
>> >    
>> 
>> 


