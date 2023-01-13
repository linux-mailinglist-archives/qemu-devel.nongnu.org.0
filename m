Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1C6669DFF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:28:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMaN-0006Eq-6b; Fri, 13 Jan 2023 11:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pGMZ5-0005UE-U6
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:06:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pGMZ1-0002CM-2V
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:05:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673625948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtQHIJhiE5RFTr8BA1xgTgBjjPmy1RAhDwBMclnFIBs=;
 b=ZQg7IivXK7MyVjy6dYHLfzJvC8TORCWoEKjQJC/HCgDbqYx5ybDRYxIKcPZQO8OmM0FT9L
 mSW1lohoNR5Af3Acg6/76pP6VqJQH3cHvrOlJJA4qsodo8z+jWwzIK9AsogJcA+1KS01rw
 MColGC0dE9VT5mC/N8zPVaBk33YRW98=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-ZXk-ljbSPkS5bFFnewFfMw-1; Fri, 13 Jan 2023 11:05:47 -0500
X-MC-Unique: ZXk-ljbSPkS5bFFnewFfMw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m8-20020a05600c3b0800b003d96bdce12fso11104114wms.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 08:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QtQHIJhiE5RFTr8BA1xgTgBjjPmy1RAhDwBMclnFIBs=;
 b=FHKRXCUwuocNeBwLgZHT4TYoVWKFsusrlsqTFfpnO5/Dx39VuxNNUYewoJLgghR0zd
 4KqFSDRDb4kXPM0u3i15StM247ZxkhWDHTiQjSnmfW0UqMqSzK35WpnhwARKYcItpG1G
 th/Z1c42Be4rKsUW3E80FlmoY50b671oNyYCItMzf93L+O4j3UfR5kIcsm1HBbajJCSM
 JN4C0HKjN/FE2uRf0fAHlln7anso1g/3rQQaXddASbVMD7yarYgGjz0VoqPou8UVkck9
 nxVxGR6g1uYZFRDJF4hiVXHU4vY3P+mrKZC5oz7pEQr/UQ5VcGBBrcvGxpEBdiHG32qv
 HowA==
X-Gm-Message-State: AFqh2kqVj1+eGHHEWi7m4UqTW7XC0OmEMzc/K5ydqH2ikUZpGBP+rQJ1
 nkTKERRiGoweHXNC6HcFBZYVejLUP3pjRSz8EGdGevLgQJQQrinZO7Gn+vKilwzMDOnpxqnjUgE
 WQ50XAf5zxhdYoi4=
X-Received: by 2002:a05:600c:1c85:b0:3d3:4b18:27c6 with SMTP id
 k5-20020a05600c1c8500b003d34b1827c6mr57881664wms.11.1673625946084; 
 Fri, 13 Jan 2023 08:05:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3pGWV9s4wl9iTIvp46VlQW+3SYe66huofSm/egbk70oCOTEQXQ2NzqN8EQJAyKqE4BC3OKw==
X-Received: by 2002:a05:600c:1c85:b0:3d3:4b18:27c6 with SMTP id
 k5-20020a05600c1c8500b003d34b1827c6mr57881604wms.11.1673625945677; 
 Fri, 13 Jan 2023 08:05:45 -0800 (PST)
Received: from [192.168.124.101] (149.37.22.93.rev.sfr.net. [93.22.37.149])
 by smtp.gmail.com with ESMTPSA id
 k41-20020a05600c1ca900b003da1cfe4c45sm3000021wms.2.2023.01.13.08.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 08:05:45 -0800 (PST)
Message-ID: <bd9a01fe-a7b5-d366-a325-b16baaf2080d@redhat.com>
Date: Fri, 13 Jan 2023 17:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 10/13] vfio/migration: Optimize vfio_save_pending()
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
 <20230112085020.15866-11-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230112085020.15866-11-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/12/23 09:50, Avihai Horon wrote:
> During pre-copy phase of migration vfio_save_pending() is called
> repeatedly and queries the VFIO device for its pending data size.
> 
> As long as pending RAM size is over the threshold, migration can't
> converge and be completed. Therefore, during this time there is no
> point in querying the VFIO device pending data size.
> 
> Avoid these unnecessary queries by issuing them in a RAM pre-copy
> notifier instead of vfio_save_pending().
> 
> This way the VFIO device is queried only when RAM pending data is
> below the threshold, when there is an actual chance for migration to
> converge.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



> ---
>   include/hw/vfio/vfio-common.h |  2 ++
>   hw/vfio/migration.c           | 56 +++++++++++++++++++++++++++--------
>   hw/vfio/trace-events          |  1 +
>   3 files changed, 46 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 2ec3346fea..113f8d9208 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -65,11 +65,13 @@ typedef struct VFIOMigration {
>       uint32_t device_state_v1;
>       int vm_running;
>       Notifier migration_state;
> +    NotifierWithReturn migration_data;
>       uint64_t pending_bytes;
>       enum vfio_device_mig_state device_state;
>       int data_fd;
>       void *data_buffer;
>       size_t data_buffer_size;
> +    uint64_t stop_copy_size;
>       bool v2;
>   } VFIOMigration;
>   
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 08f53189fa..04f4397212 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -655,29 +655,19 @@ static void vfio_v1_save_cleanup(void *opaque)
>       trace_vfio_save_cleanup(vbasedev->name);
>   }
>   
> -/*
> - * Migration size of VFIO devices can be as little as a few KBs or as big as
> - * many GBs. This value should be big enough to cover the worst case.
> - */
> -#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
>   static void vfio_save_pending(void *opaque, uint64_t threshold_size,
>                                 uint64_t *res_precopy_only,
>                                 uint64_t *res_compatible,
>                                 uint64_t *res_postcopy_only)
>   {
>       VFIODevice *vbasedev = opaque;
> -    uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
> +    VFIOMigration *migration = vbasedev->migration;
>   
> -    /*
> -     * If getting pending migration size fails, VFIO_MIG_STOP_COPY_SIZE is
> -     * reported so downtime limit won't be violated.
> -     */
> -    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
> -    *res_precopy_only += stop_copy_size;
> +    *res_precopy_only += migration->stop_copy_size;
>   
>       trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
>                               *res_postcopy_only, *res_compatible,
> -                            stop_copy_size);
> +                            migration->stop_copy_size);
>   }
>   
>   static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
> @@ -1104,6 +1094,40 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>       }
>   }
>   
> +/*
> + * Migration size of VFIO devices can be as little as a few KBs or as big as
> + * many GBs. This value should be big enough to cover the worst case.
> + */
> +#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
> +static int vfio_migration_data_notifier(NotifierWithReturn *n, void *data)
> +{
> +    VFIOMigration *migration = container_of(n, VFIOMigration, migration_data);
> +    VFIODevice *vbasedev = migration->vbasedev;
> +    PrecopyNotifyData *pnd = data;
> +
> +    if (pnd->reason != PRECOPY_NOTIFY_AFTER_BITMAP_SYNC) {
> +        return 0;
> +    }
> +
> +    /* No need to get pending size when finishing migration */
> +    if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
> +        return 0;
> +    }
> +
> +    if (vfio_query_stop_copy_size(vbasedev, &migration->stop_copy_size)) {
> +        /*
> +         * Failed to get pending migration size. Report big pending size so
> +         * downtime limit won't be violated.
> +         */
> +        migration->stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
> +    }
> +
> +    trace_vfio_migration_data_notifier(vbasedev->name,
> +                                       migration->stop_copy_size);
> +
> +    return 0;
> +}
> +
>   static void vfio_migration_exit(VFIODevice *vbasedev)
>   {
>       VFIOMigration *migration = vbasedev->migration;
> @@ -1225,6 +1249,9 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>   
>           migration->vm_state = qdev_add_vm_change_state_handler(
>               vbasedev->dev, vfio_vmstate_change, vbasedev);
> +
> +        migration->migration_data.notify = vfio_migration_data_notifier;
> +        precopy_add_notifier(&migration->migration_data);
>       } else {
>           register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>                                &savevm_vfio_v1_handlers, vbasedev);
> @@ -1283,6 +1310,9 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>       if (vbasedev->migration) {
>           VFIOMigration *migration = vbasedev->migration;
>   
> +        if (migration->v2) {
> +            precopy_remove_notifier(&migration->migration_data);
> +        }
>           remove_migration_state_change_notifier(&migration->migration_state);
>           qemu_del_vm_change_state_handler(migration->vm_state);
>           unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index e7b3b4658c..a8a64f0627 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -173,3 +173,4 @@ vfio_load_cleanup(const char *name) " (%s)"
>   vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
>   vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
>   vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
> +vfio_migration_data_notifier(const char *name, uint64_t stopcopy_size) " (%s) stopcopy size 0x%"PRIx64


