Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B2B6ADBB9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:22:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUSo-0008Az-C2; Tue, 07 Mar 2023 05:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZUSm-0008Ap-Aw
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:22:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZUSk-0003NL-On
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678184549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DW2D1/aBXWTpmLnwQOe+2wehdDz/TPGaTcJyz2J0Y8Q=;
 b=AF5nO/JzURjLudRwSLFcAxD70bkaBa4drPqi8PVy2gwCBP4Tu8v7K0Y41EpWR/WjjVH2hs
 z/S7d6wFuSrvwfoV0WNHWi7Lyr8yS9ngYUC2KgW5F5N9afWkDVVZpDGxT/sku7GZCVDKss
 4HVN0alDpFppzUhriE60lqF6sd8JCDE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-LZPpt4egOMC_XT1Wgj-D7g-1; Tue, 07 Mar 2023 05:22:28 -0500
X-MC-Unique: LZPpt4egOMC_XT1Wgj-D7g-1
Received: by mail-qv1-f71.google.com with SMTP id
 s18-20020a0cf792000000b00572c04240f1so7176796qvn.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:22:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184548;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DW2D1/aBXWTpmLnwQOe+2wehdDz/TPGaTcJyz2J0Y8Q=;
 b=ppABdkgPVfOzMsu9wVQurvThHPozTKk782eeVvBDdcSdVVbf9wlcFsEfDiYemKLJMX
 wOoU7QyCtTeGhWzHgQ67Dq0Aw7BZWyRFg1ItkNwk6DRR89yEaMVOUN3daHr7ZfFSRFdJ
 0fTPI2OEdr+Nr71/cnlRpqOFARco8Pte1Ljs+j6ngXifJkyUE/IoiGjPYrX1aFZj53Ir
 2EKbdjk8LGmDe815DtK7USWDJO9ruAhkdJBUzQA7P9XA3qcdeix7THPtl8k4QdpZCFqN
 pjz1JR8A0exyK3ieV0vkTJN/qfUFIXP0BO2nU2qk7a0DDJpnDT+C80aw6xRW3FIHk3v/
 7wvw==
X-Gm-Message-State: AO0yUKUNpzT9NeLvhlGa4Ccn0zM8UhTly203/lRQ6ZvXfAsW9caunfUq
 msgeYMWSsRhkAu4DofTxJGTOupysFLHjposUUQx/0sPxOMtK2n7ekiTkgAtbZMHe4wNcAs1iElA
 60VDWp4sMfPPu9DM=
X-Received: by 2002:ac8:5cc7:0:b0:3bf:bc48:b0bd with SMTP id
 s7-20020ac85cc7000000b003bfbc48b0bdmr21968535qta.63.1678184548026; 
 Tue, 07 Mar 2023 02:22:28 -0800 (PST)
X-Google-Smtp-Source: AK7set95md/lKczDSQgESTrSx/W7o444Q7KUo+AQUyKJJzgJATP78vjaDnrprQA2TOMdL8rYHEKtOQ==
X-Received: by 2002:ac8:5cc7:0:b0:3bf:bc48:b0bd with SMTP id
 s7-20020ac85cc7000000b003bfbc48b0bdmr21968519qta.63.1678184547721; 
 Tue, 07 Mar 2023 02:22:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 f13-20020ac87f0d000000b003b9b48cdbe8sm5851714qtk.58.2023.03.07.02.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:22:27 -0800 (PST)
Message-ID: <9b2257dd-bdba-5a03-86db-49936693547a@redhat.com>
Date: Tue, 7 Mar 2023 11:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 12/14] vfio/migration: Block migration with vIOMMU
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-13-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230307020258.58215-13-joao.m.martins@oracle.com>
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

On 3/7/23 03:02, Joao Martins wrote:
> Migrating with vIOMMU will require either tracking maximum
> IOMMU supported address space (e.g. 39/48 address width on Intel)
> or range-track current mappings and dirty track the new ones
> post starting dirty tracking. This will be done as a separate
> series, so add a live migration blocker until that is fixed.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/common.c              | 46 +++++++++++++++++++++++++++++++++++
>   hw/vfio/migration.c           |  5 ++++
>   hw/vfio/pci.c                 |  1 +
>   include/hw/vfio/vfio-common.h |  2 ++
>   4 files changed, 54 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 75b4902bbcc9..7278baa82f7d 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -362,6 +362,7 @@ bool vfio_mig_active(void)
>   }
>   
>   static Error *multiple_devices_migration_blocker;
> +static Error *giommu_migration_blocker;
>   
>   static unsigned int vfio_migratable_device_num(void)
>   {
> @@ -413,6 +414,51 @@ void vfio_unblock_multiple_devices_migration(void)
>       multiple_devices_migration_blocker = NULL;
>   }
>   
> +static bool vfio_viommu_preset(void)
> +{
> +    VFIOAddressSpace *space;
> +
> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
> +        if (space->as != &address_space_memory) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +int vfio_block_giommu_migration(Error **errp)
> +{
> +    int ret;
> +
> +    if (giommu_migration_blocker ||
> +        !vfio_viommu_preset()) {
> +        return 0;
> +    }
> +
> +    error_setg(&giommu_migration_blocker,
> +               "Migration is currently not supported with vIOMMU enabled");
> +    ret = migrate_add_blocker(giommu_migration_blocker, errp);
> +    if (ret < 0) {
> +        error_free(giommu_migration_blocker);
> +        giommu_migration_blocker = NULL;
> +    }
> +
> +    return ret;
> +}
> +
> +void vfio_unblock_giommu_migration(void)
> +{
> +    if (!giommu_migration_blocker ||
> +        vfio_viommu_preset()) {
> +        return;
> +    }
> +
> +    migrate_del_blocker(giommu_migration_blocker);
> +    error_free(giommu_migration_blocker);
> +    giommu_migration_blocker = NULL;
> +}
> +
>   static void vfio_set_migration_error(int err)
>   {
>       MigrationState *ms = migrate_get_current();
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index a2c3d9bade7f..776fd2d7cdf3 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -634,6 +634,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>           return ret;
>       }
>   
> +    ret = vfio_block_giommu_migration(errp);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       trace_vfio_migration_probe(vbasedev->name);
>       return 0;
>   
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3d4a9e..30a271eab38c 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3185,6 +3185,7 @@ static void vfio_instance_finalize(Object *obj)
>        */
>       vfio_put_device(vdev);
>       vfio_put_group(group);
> +    vfio_unblock_giommu_migration();
>   }
>   
>   static void vfio_exitfn(PCIDevice *pdev)
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 7817ca7d8706..63f93ab54811 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -235,6 +235,8 @@ extern VFIOGroupList vfio_group_list;
>   bool vfio_mig_active(void);
>   int vfio_block_multiple_devices_migration(Error **errp);
>   void vfio_unblock_multiple_devices_migration(void);
> +int vfio_block_giommu_migration(Error **errp);
> +void vfio_unblock_giommu_migration(void);
>   int64_t vfio_mig_bytes_transferred(void);
>   
>   #ifdef CONFIG_LINUX


