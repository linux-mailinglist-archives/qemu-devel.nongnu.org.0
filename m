Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8D64AC045
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 14:57:18 +0100 (CET)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH4W5-0001BO-Ha
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 08:57:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nH4HU-0005IF-L7
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:42:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nH4HO-0005of-5Z
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:42:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644241324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W3pboVatOTu2NCpZPJp3DUdcBFsMQ19ATdvhBUJDWC0=;
 b=EgXXTpPKIZHxChifkGVsvl6cjxeGrjstDJRo2DLE5s3tGI/hUmzxKGDt0AjD0shtPs/nAq
 mAl+qDFt4RtWpIratvjq1E6B09hSzJ0TlO3QlfNiaJsquSnp+Yadb7GaMsxwX6XCiGlOY9
 t8xD7iS/3PnjbkNne3nyfb55zpvldCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-Fz1obaJgOL-lAUtKNkvC6A-1; Mon, 07 Feb 2022 08:42:02 -0500
X-MC-Unique: Fz1obaJgOL-lAUtKNkvC6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB287107B280;
 Mon,  7 Feb 2022 13:42:00 +0000 (UTC)
Received: from localhost (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49CF772436;
 Mon,  7 Feb 2022 13:42:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Halil Pasic
 <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 1/1] virtio: fix feature negotiation for
 ACCESS_PLATFORM
In-Reply-To: <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
Organization: Red Hat GmbH
References: <20220203164556.2666565-1-pasic@linux.ibm.com>
 <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Mon, 07 Feb 2022 14:41:58 +0100
Message-ID: <874k5ax07t.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Jason Wang <jasowang@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07 2022, Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> On 2/3/22 13:45, Halil Pasic wrote:
>> Unlike most virtio features ACCESS_PATFORM is considered mandatory, i.e.

s/ACCESS_PATFORM/ACCESS_PLATFORM/

>> the driver must accept it if offered by the device. The virtio
>> specification says that the driver SHOULD accept the ACCESS_PLATFORM
>> feature if offered, and that the device MAY fail to operate if
>> ACCESS_PLATFORM was offered but not negotiated.
>> 
>> While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
>> the device when the driver fences ACCESS_PLATFORM. With commit
>
>
> I believe a link to the virtio specification where this is being mentioned would
> be good to have in the commit message.

It's in section 6.1 "Driver Requirements: Reserved Feature Bits": "A
driver SHOULD accept VIRTIO_F_ACCESS_PLATFORM if it is offered" and
section 6.2 "Device Requirements: Reserved Feature Bits": "A device MAY
fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not accepted."

That said, I'm not sure the wording in the spec translates to
"mandatory"... if the driver fails to accept the bit, the device can
choose to not work with the driver, but it's not forced to. There are
other instances where the device may reject FEATURES_OK (e.g. when the
driver does not accept a feature that is a pre-req for another feature),
I'd say it is up to the device whether something is mandatory or not. If
the device/setup cannot work without it, it certainly is mandatory, but
the driver only knows when FEATURES_OK is rejected without the feature.

OTOH, the decision to make it mandatory is certainly sound, and covered
by the spec. As the driver must be prepared for the device failing to
accept FEATURES_OK, we can make it mandatory here -- we should just not
say that it is considered mandatory from a spec standpoint. The spec
allows to make it mandatory, and we make it mandatory in our
implementation.

>
>
>> 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM") we already made the
>> decision to do so whenever the get_dma_as() callback is implemented (by
>> the bus), which in practice means for the entirety of virtio-pci.
>> 
>> That means, if the device needs to translate I/O addresses, then
>> ACCESS_PLATFORM is mandatory. The aforementioned commit tells us
>> in the commit message that this is for security reasons.
>> 
>> If ACCESS_PLATFORM is offered not we want the device to utilize an
>
> I think you meant "If ACCESS_PLATFORM is offered".

I thought it should be "If ACCESS_PLATFORM is offered not because..." ?

>
>
>> IOMMU and do address translation, but because the device does not have
>> access to the entire guest RAM, and needs the driver to grant access
>> to the bits it needs access to (e.g. confidential guest support), we
>> still require the guest to have the corresponding logic and to accept
>> ACCESS_PLATFORM. If the driver does not accept ACCESS_PLATFORM, then
>> things are bound to go wrong, and we may see failures much less graceful
>> than failing the device because the driver didn't negotiate
>> ACCESS_PLATFORM.
>> 
>> So let us make ACCESS_PLATFORM mandatory for the driver regardless
>> of whether the get_dma_as() callback is implemented or not.
>> 
>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>> Fixes: 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM")
>> 
>> ---
>> This patch is based on:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg866199.html
>> 
>> During the review of "virtio: fix the condition for iommu_platform not
>> supported" Daniel raised the question why do we "force IOMMU_PLATFORM"
>> iff has_iommu && !!klass->get_dma_as. My answer to that was, that
>> this logic ain't right.
>> 
>> While at it I used the opportunity to re-organize the code a little
>> and provide an explanatory comment.
>> ---
>>   hw/virtio/virtio-bus.c | 17 ++++++++++-------
>>   1 file changed, 10 insertions(+), 7 deletions(-)
>> 
>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>> index fbf0dd14b8..359430eb1c 100644
>> --- a/hw/virtio/virtio-bus.c
>> +++ b/hw/virtio/virtio-bus.c
>> @@ -78,16 +78,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>>           return;
>>       }
>>   
>> -    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>> -    if (klass->get_dma_as != NULL && has_iommu) {
>> +    vdev->dma_as = &address_space_memory;
>
> At this point you can also do:
>
>     if (!has_iommu) {
>         return;
>     }
>
> and the rest of the code will have one less indentation level.

It might make it harder to add code at the tail end of the function in
the future, though.

>
>
> Thanks,
>
>
> Daniel
>
>
>
>> +    if (has_iommu) {
>> +        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>> +        /* Fail FEATURE_OK if the device tries to drop IOMMU_PLATFORM */
>>           virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>> -        vdev->dma_as = klass->get_dma_as(qbus->parent);
>> -        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>> -            error_setg(errp,
>> +        if (klass->get_dma_as) {
>> +            vdev->dma_as = klass->get_dma_as(qbus->parent);
>> +            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
>> +                error_setg(errp,
>>                          "iommu_platform=true is not supported by the device");
>> +                return;
>> +            }
>>           }
>> -    } else {
>> -        vdev->dma_as = &address_space_memory;
>>       }
>>   }
>>   
>> 
>> base-commit: da89f242b4b774a25eaa16be125cf3e17299c127


