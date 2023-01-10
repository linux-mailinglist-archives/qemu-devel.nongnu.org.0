Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A7664717
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHLl-0001cY-GW; Tue, 10 Jan 2023 11:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pFHLc-0001XM-9q; Tue, 10 Jan 2023 11:19:38 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pFHLa-0008M6-BS; Tue, 10 Jan 2023 11:19:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 24BAE2382E;
 Tue, 10 Jan 2023 16:19:21 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 17:19:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00194e5e507-6c60-43b5-8f07-b0d9f35a20b7,
 554ECA30D764FBE6AECF50F59502266BC4B8CED8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0353ebb8-49cf-d6b7-9bdb-d8124e2a224d@kaod.org>
Date: Tue, 10 Jan 2023 17:19:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 10/14] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
CC: <qemu-devel@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Richard
 Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth
 <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-11-avihaih@nvidia.com>
 <27a868cc-d816-76f1-1ce1-60b6552d791f@kaod.org>
 <5ccd6f67-3ad3-c9dd-634e-d2d0900c429e@nvidia.com>
 <0bb116fa-3609-8b01-0a16-10436ba6cc56@kaod.org> <Y7xex6YisfjZoZvj@nvidia.com>
 <ad2f5ab9-8529-0286-53d6-33e5a63c94b1@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ad2f5ab9-8529-0286-53d6-33e5a63c94b1@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 3309fa0c-ed4b-41be-aea4-5b5f20b74074
X-Ovh-Tracer-Id: 10378545344525601576
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrledvgddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghvihhhrghihhesnhhvihguihgrrdgtohhmpdhkfigrnhhkhhgvuggvsehnvhhiughirgdrtghomhdpmhgrohhrghesnhhvihguihgrrdgtohhmpdihihhshhgrihhhsehnvhhiughirgdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpjhhsnhhofiesrhgvughhrghtrdgtohhmpdhvshgvmhgvnhhtshhovheshigrnhguvgigqdhtvggrmhdrrhhupdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdhfrg
 hmsegvuhhphhhonhdrnhgvthdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghohhhutghksehrvgguhhgrthdrtghomhdpmhhsthesrhgvughhrghtrdgtohhmpdgughhilhgsvghrthesrhgvughhrghtrdgtohhmpdhquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpihhiiheslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgrlhgvgidrfihilhhlihgrmhhsohhnsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpjhhgghesnhhvihguihgrrdgtohhmpdhtrghrghhuphhtrgesnhhvihguihgrrdgtohhmpdhjohgrohdrmhdrmhgrrhhtihhnshesohhrrggtlhgvrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Avihai

On 1/10/23 15:08, Avihai Horon wrote:
> 
> On 09/01/2023 20:36, Jason Gunthorpe wrote:
>> On Mon, Jan 09, 2023 at 06:27:21PM +0100, Cédric Le Goater wrote:
>>> also, in vfio_migration_query_flags() :
>>>
>>>    +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
>>>    +{
>>>    +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>>>    +                                  sizeof(struct vfio_device_feature_migration),
>>>    +                              sizeof(uint64_t))] = {};
>>>    +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>>>    +    struct vfio_device_feature_migration *mig =
>>>    +        (struct vfio_device_feature_migration *)feature->data;
>>>    +
>>>    +    feature->argsz = sizeof(buf);
>>>    +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
>>>    +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>>>    +        return -EOPNOTSUPP;
>>>    +    }
>>>    +
>>>    +    *mig_flags = mig->flags;
>>>    +
>>>    +    return 0;
>>>    +}
>>>
>>>
>>> The code is using any possible error returned by the VFIO_DEVICE_FEATURE
>>> ioctl to distinguish protocol v1 from v2.
>> I'm comfortable with that from a kernel perspective.
>>
>> There is no such thing as this API failing in the kernel but userspace
>> should continue on, no matter what the error code. So always failing
>> here is correct.
>>
>> About the only thing you might want to do is convert anything other
>> than ENOTTY into a hard qemu failure similar to failing to open
>> /dev/vfio or something - it means something has gone really
>> wrong.. But that is pretty obscure stuff
> 
> Hi Cedric,
> 
> With Jason's input, is it ok by you to leave the code as is?
The patchset removes v1 later on, I think we are fine. I was reading it
sequentially and it felt like a weak spot.

All errors are translated in EOPNOTSUPP. That's always true for pre-v6.0
kernels, returning -ENOTTY, and v6.0+ kernels will do the same unless a
mlx5vf device is passthru. I still wonder if we should report some errors
for the ! -ENOTTY case. So the code below could be a good addition.

Thanks,

C.

> 
> if not, would this be fine?
> 
> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                                  sizeof(struct vfio_device_feature_migration),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> +    struct vfio_device_feature_migration *mig =
> +        (struct vfio_device_feature_migration *)feature->data;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        if (errno == ENOTTY) {
> +            error_report("%s: VFIO migration is not supported in kernel",
> +                         vbasedev->name);
> +        } else {
> +            error_report("%s: Failed to query VFIO migration support, err: %s",
> +                         vbasedev->name, strerror(errno));
> +        }
> +
> +        return -errno;
> +    }
> +
> +    *mig_flags = mig->flags;
> +
> +    return 0;
> +}
> +
> 
> and then in vfio_migration_init() prior v1 removal:
> 
> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
> +    if (!ret) {
> +        /* Migration v2 */
> +    } else if (ret == -ENOTTY) {
> +        /* Migration v1 */
> +    } else {
> +        return ret;
> +    }
> 
> and after v1 removal vfio_migration_init() will be:
> 
>      ret = vfio_migration_query_flags(vbasedev, &mig_flags);
>      if (ret) {
>          return ret;
> 
>      }
> 
> Thanks.
> 


