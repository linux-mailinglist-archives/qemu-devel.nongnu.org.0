Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2888266267B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:07:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pErN3-00067T-7T; Mon, 09 Jan 2023 07:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pErMo-00061q-FO
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:35:11 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pErMl-0001Sc-6m
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:35:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7407B152147EF;
 Mon,  9 Jan 2023 13:34:58 +0100 (CET)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 13:34:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0040bda6a65-fabc-4331-94f9-62628427e2ad,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ef5ffcf2-184e-0ace-3edf-50fef4b3c11b@kaod.org>
Date: Mon, 9 Jan 2023 13:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 08/14] vfio/migration: Move migration v1 logic to
 vfio_migration_init()
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-9-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221229110345.12480-9-avihaih@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f3e8f8e3-8e02-4445-b794-9d8f4a9f70c9
X-Ovh-Tracer-Id: 716635292396391208
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrvhhihhgrihhhsehnvhhiughirgdrtghomhdpkhifrghnkhhhvgguvgesnhhvihguihgrrdgtohhmpdhmrghorhhgsehnvhhiughirgdrtghomhdpjhhgghesnhhvihguihgrrdgtohhmpdihihhshhgrihhhsehnvhhiughirgdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpjhhsnhhofiesrhgvughhrghtrdgtohhmpdhvshgvmhgvnhhtshhovheshigrnhguvgigqdhtvggrmhdrrhhupdgvsghlrg
 hkvgesrhgvughhrghtrdgtohhmpdhfrghmsegvuhhphhhonhdrnhgvthdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghohhhutghksehrvgguhhgrthdrtghomhdpmhhsthesrhgvughhrghtrdgtohhmpdgughhilhgsvghrthesrhgvughhrghtrdgtohhmpdhquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpihhiiheslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgrlhgvgidrfihilhhlihgrmhhsohhnsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpthgrrhhguhhpthgrsehnvhhiughirgdrtghomhdpjhhorghordhmrdhmrghrthhinhhssehorhgrtghlvgdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/29/22 12:03, Avihai Horon wrote:
> Move vfio_dev_get_region_info() logic from vfio_migration_probe() to
> vfio_migration_init(). This logic is specific to v1 protocol and moving
> it will make it easier to add the v2 protocol implementation later.
> No functional changes intended.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



> ---
>   hw/vfio/migration.c  | 30 +++++++++++++++---------------
>   hw/vfio/trace-events |  2 +-
>   2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 552c2313b2..977da64411 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -788,14 +788,14 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>       vbasedev->migration = NULL;
>   }
>   
> -static int vfio_migration_init(VFIODevice *vbasedev,
> -                               struct vfio_region_info *info)
> +static int vfio_migration_init(VFIODevice *vbasedev)
>   {
>       int ret;
>       Object *obj;
>       VFIOMigration *migration;
>       char id[256] = "";
>       g_autofree char *path = NULL, *oid = NULL;
> +    struct vfio_region_info *info;
>   
>       if (!vbasedev->ops->vfio_get_object) {
>           return -EINVAL;
> @@ -806,6 +806,14 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>           return -EINVAL;
>       }
>   
> +    ret = vfio_get_dev_region_info(vbasedev,
> +                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> +                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> +                                   &info);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       vbasedev->migration = g_new0(VFIOMigration, 1);
>       vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
>       vbasedev->migration->vm_running = runstate_is_running();
> @@ -825,6 +833,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>           goto err;
>       }
>   
> +    g_free(info);
> +
>       migration = vbasedev->migration;
>       migration->vbasedev = vbasedev;
>   
> @@ -847,6 +857,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>       return 0;
>   
>   err:
> +    g_free(info);
>       vfio_migration_exit(vbasedev);
>       return ret;
>   }
> @@ -860,34 +871,23 @@ int64_t vfio_mig_bytes_transferred(void)
>   
>   int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>   {
> -    struct vfio_region_info *info = NULL;
>       int ret = -ENOTSUP;
>   
>       if (!vbasedev->enable_migration) {
>           goto add_blocker;
>       }
>   
> -    ret = vfio_get_dev_region_info(vbasedev,
> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> -                                   &info);
> -    if (ret) {
> -        goto add_blocker;
> -    }
> -
> -    ret = vfio_migration_init(vbasedev, info);
> +    ret = vfio_migration_init(vbasedev);
>       if (ret) {
>           goto add_blocker;
>       }
>   
> -    trace_vfio_migration_probe(vbasedev->name, info->index);
> -    g_free(info);
> +    trace_vfio_migration_probe(vbasedev->name);
>       return 0;
>   
>   add_blocker:
>       error_setg(&vbasedev->migration_blocker,
>                  "VFIO device doesn't support migration");
> -    g_free(info);
>   
>       ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
>       if (ret < 0) {
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 73dffe9e00..b259dcc644 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -148,7 +148,7 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
>   vfio_display_edid_write_error(void) ""
>   
>   # migration.c
> -vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
> +vfio_migration_probe(const char *name) " (%s)"
>   vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
>   vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>   vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"


