Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B7B16FBDF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 11:19:20 +0100 (CET)
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6tmh-0001Al-9E
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 05:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47485)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j6tlT-0000Zw-Kt
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:18:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j6tlS-0000Tp-GD
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:18:03 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52916
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j6tlS-0000TD-Bs
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582712281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cz7pXOIkDFC5sGtysBOBc/kSfB3RR1nCZ6xj0o75WtY=;
 b=NtK2Fplu/7lSqfel41pR6M7Puvga8+uijM5a0dPo22K3CeVnyz9oy/MptdwkWwIv5XxKBA
 vofdCbLm+FCxUwSf6l3G1HxpeSYasFJuP3+pZ8NvQOFKaSgAdQhRcEQxMCQqpAJ13wL18K
 GrILdCUxf0gDlb2DpSAimMt3r7oBAk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-pXsgcyoENAmVHMxhcpFAsQ-1; Wed, 26 Feb 2020 05:17:58 -0500
X-MC-Unique: pXsgcyoENAmVHMxhcpFAsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C7A91005514;
 Wed, 26 Feb 2020 10:17:57 +0000 (UTC)
Received: from [10.72.13.217] (ovpn-13-217.pek2.redhat.com [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDE5D60BE1;
 Wed, 26 Feb 2020 10:17:38 +0000 (UTC)
Subject: Re: [PATCH V2] vhost: correctly turn on VIRTIO_F_IOMMU_PLATFORM
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200226094357.25061-1-jasowang@redhat.com>
 <20200226045128-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bd592433-71b9-773f-97ef-f5da87734b05@redhat.com>
Date: Wed, 26 Feb 2020 18:17:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200226045128-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: pasic@linux.ibm.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/2/26 =E4=B8=8B=E5=8D=885:53, Michael S. Tsirkin wrote:
> On Wed, Feb 26, 2020 at 05:43:57PM +0800, Jason Wang wrote:
>> We turn on device IOTLB via VIRTIO_F_IOMMU_PLATFORM unconditionally on
>> platform without IOMMU support. This can lead unnecessary IOTLB
>> transactions which will damage the performance.
>>
>> Fixing this by check whether the device is backed by IOMMU and disable
>> device IOTLB.
>>
>> Reported-by: Halil Pasic <pasic@linux.ibm.com>
>> Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
> Well it's just an optimization, isn't it?


Kind of, or a fix for the performance.


> I don't think it's justified to push this to everyone using
> vhost with IOTLB, is it?


My understanding is that the function should be equivalent to IOTLB in=20
this case.

Since no IOMMU is used and device may only see GPA.

Another possible direction is to qemu to update memory table via device=20
IOTLB API, this seems less straightforward.


> If you disagree, could you comment a bit on which configurations where te=
sted?


I just do dirty shortcut to emulate the platform without get_dma_as wth=20
IOMMU_PLATFORM set.

Thanks


>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Halil could you test this pls? Does this help your performance issue?
>
>> ---
>> Changes from V1:
>> - do not check acked_features
>> - reuse vhost_dev_has_iommu()
>> ---
>>   hw/virtio/vhost.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index 9edfadc81d..9182a00495 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -290,7 +290,14 @@ static int vhost_dev_has_iommu(struct vhost_dev *de=
v)
>>   {
>>       VirtIODevice *vdev =3D dev->vdev;
>>  =20
>> -    return virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>> +    /*
>> +     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
>> +     * incremental memory mapping API via IOTLB API. For platform that
>> +     * does not have IOMMU, there's no need to enable this feature
>> +     * which may cause unnecessary IOTLB miss/update trnasactions.
>> +     */
>> +    return vdev->dma_as !=3D &address_space_memory &&
>> +           virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>   }
>>  =20
>>   static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
>> @@ -765,6 +772,9 @@ static int vhost_dev_set_features(struct vhost_dev *=
dev,
>>       if (enable_log) {
>>           features |=3D 0x1ULL << VHOST_F_LOG_ALL;
>>       }
>> +    if (!vhost_dev_has_iommu(dev)) {
>> +        features &=3D ~(0x1ULL << VIRTIO_F_IOMMU_PLATFORM);
>> +    }
>>       r =3D dev->vhost_ops->vhost_set_features(dev, features);
>>       if (r < 0) {
>>           VHOST_OPS_DEBUG("vhost_set_features failed");
>> --=20
>> 2.19.1


