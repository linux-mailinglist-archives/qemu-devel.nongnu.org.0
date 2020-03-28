Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1558E196286
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 01:33:05 +0100 (CET)
Received: from localhost ([::1]:48656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHzPL-0000gj-SC
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 20:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jHzOF-0008P9-Q0
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jHzOD-0004AI-S4
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:31:55 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3216 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jHzOD-00043o-88
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:31:53 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8C232DF06FD4D6B8809F;
 Sat, 28 Mar 2020 08:31:47 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 28 Mar
 2020 08:31:37 +0800
Subject: Re: [PATCH v3 2/2] virtio-iommu: delete vqs in unrealize to fix
 memleak
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20200327095642.18424-1-pannengyuan@huawei.com>
 <20200327095642.18424-3-pannengyuan@huawei.com>
 <20200327162612.ic2ymmpfvyt5xbnp@steredhat>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <5269cc9b-5144-4059-9a1d-99e0b2134819@huawei.com>
Date: Sat, 28 Mar 2020 08:31:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200327162612.ic2ymmpfvyt5xbnp@steredhat>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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



On 3/28/2020 12:26 AM, Stefano Garzarella wrote:
> On Fri, Mar 27, 2020 at 05:56:42PM +0800, Pan Nengyuan wrote:
>> req_vq/event_vq forgot to free in unrealize. Fix that.
>> And aslo do clean 's->as_by_busptr' hash table in unrealize to fix another leak.
> 
> s/aslo/also
> 
> Maybe we can also update the subject in something like this:
> "virtio-iommu: avoid memleak in the unrealize"

OK.

> 
>>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> Acked-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> Cc: Eric Auger <eric.auger@redhat.com>
>> ---
>> v3->v1/v2:
>> - Aslo clean 's->as_by_busptr' hash table in unrealize.(Suggested by Stefano Garzarella)
>> ---
>>  hw/virtio/virtio-iommu.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 4cee8083bc..694698fa0f 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -696,7 +696,10 @@ static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
>>      g_tree_destroy(s->domains);
>>      g_tree_destroy(s->endpoints);
>>  
>> +    virtio_delete_queue(s->req_vq);
>> +    virtio_delete_queue(s->event_vq);
>>      virtio_cleanup(vdev);
>> +    g_hash_table_destroy(s->as_by_busptr);
> 
> If you need to respin, you could move g_hash_table_destroy()
> at the beggining of unrealize(), just to follow a reverse order of
> realize().

OK.

Thanks.

> 
> Thanks,
> Stefano
> 
>>  }
>>  
>>  static void virtio_iommu_device_reset(VirtIODevice *vdev)
>> -- 
>> 2.18.2
>>
>>
> 

