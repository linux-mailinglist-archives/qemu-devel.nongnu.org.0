Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FDC195386
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 10:05:46 +0100 (CET)
Received: from localhost ([::1]:38754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHkvx-00040s-JJ
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 05:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jHktL-0002RH-G1
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jHktK-0002mX-8i
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:03:03 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:34226 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jHktJ-0002O7-RH
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:03:02 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 316361A179CB7F980197;
 Fri, 27 Mar 2020 17:02:55 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 27 Mar
 2020 17:02:44 +0800
Subject: Re: [PATCH 2/2] virtio-iommu: delete vqs in unrealize to fix memleaks
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20200327035650.2085-1-pannengyuan@huawei.com>
 <20200327035650.2085-3-pannengyuan@huawei.com>
 <20200327085352.ncjwiscl5jvjtvmp@steredhat>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <ca8237c7-0597-6b98-338b-193321b2787e@huawei.com>
Date: Fri, 27 Mar 2020 17:02:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200327085352.ncjwiscl5jvjtvmp@steredhat>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Eric Auger <eric.auger@redhat.com>, zhang.zhanghailiang@huawei.com,
 mst@redhat.com, qemu-devel@nongnu.org, euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/27/2020 4:53 PM, Stefano Garzarella wrote:
> On Fri, Mar 27, 2020 at 11:56:50AM +0800, Pan Nengyuan wrote:
>> req_vq/event_vq forgot to free in unrealize(). Fix that.
>>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> ---
>> Cc: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/virtio/virtio-iommu.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 4cee8083bc..9d2ff0693c 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -696,6 +696,8 @@ static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
>>      g_tree_destroy(s->domains);
>>      g_tree_destroy(s->endpoints);
>>  
>> +    virtio_delete_queue(s->req_vq);
>> +    virtio_delete_queue(s->event_vq);
>>      virtio_cleanup(vdev);
>>  }
> 
> Hi Pan,
> thanks for this fix.
> 
> Since we are here, should we also clean 's->as_by_busptr' hash table?
> 
> Maybe adding this in the unrealize:
> 
>     g_hash_table_destroy(s->as_by_busptr);

Yes, you are right. I will add it.

Thanks.

> 
> Thanks,
> Stefano
> 

