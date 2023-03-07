Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16636AE89F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:17:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZawF-0001cA-BO; Tue, 07 Mar 2023 12:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZawB-0001bj-Aq
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:17:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZaw6-0007LQ-Nw
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678209433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ER4qvU4Y4hq6DSBzg/vtM7MEQGEsZEw+3ZjDKD+BOc=;
 b=YeOG8f4ZYEB6LIYyhIQrvIAQrSFRQwdIrBRXQC8JTFlHXjEbwuXGmI+RsFWfqPSIoEOuWz
 q8k7vml8jK5xy8II51uFa3EPnFiXGUgBRMvbuACGraAJ3VcXfgIyj02kVJnBo+AAbdQY5R
 Rmw5SVvee7FTHHjOc8lbXshL0aIcNwk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-Lx56OtkoP2Ca9fiNd8s-zA-1; Tue, 07 Mar 2023 12:17:10 -0500
X-MC-Unique: Lx56OtkoP2Ca9fiNd8s-zA-1
Received: by mail-qv1-f69.google.com with SMTP id
 jh21-20020a0562141fd500b0053c23b938a0so7813556qvb.17
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678209428;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ER4qvU4Y4hq6DSBzg/vtM7MEQGEsZEw+3ZjDKD+BOc=;
 b=0vcCVbimu06FrKzmhhCXpIz2s3daA227eWbkVr7WFuwm5qxmPwfSRBe9BcgZ1+ArQ3
 32OvmaIox+PrWiyLVKtgDUYktJzJ3j7PDb5UHbSfcI3OimrnFFaLqEmRAlppXYVXCOiY
 ZjaphpKhDZ6uQ9CCIS7S9dZVFkGKAYHjKizxOaquCZcc8S3isuTE+mR+1v+nGW+goZRm
 aPv2NfoNbQCPqbvb//Y3N6I0v1qSJf/ki/JM3LMuWJYylSKco5Z3EDSLjqlnpqAoDqgA
 4kDIQuxEZb8msWWGk0lUAwblDyX08C+khCcb0CFVCDg1pfiWC7JObdwMOeDQAx8fco9Z
 X39Q==
X-Gm-Message-State: AO0yUKVD0HXhP6W4hOhpEsflalkNIAB/7/3OYCUbz7mz0oXLFxPw29+K
 VeOhVEzgDz3IPo9msL44/7HxkPzbGXAiWusRnvq3dEGzrit6/s4G1V4tlI8YHVHSoTEM2i5Rbz4
 ZCOGt0rLAMf/TJ0Q=
X-Received: by 2002:a05:6214:250d:b0:56e:ab08:670d with SMTP id
 gf13-20020a056214250d00b0056eab08670dmr26624194qvb.42.1678209428467; 
 Tue, 07 Mar 2023 09:17:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8YoSQd8vTBvwSN1q9nsRHoDPo7f5rdYX5DEDZVtqQiSKm2te4+86g3XVKjGbdZ0la90IBqpQ==
X-Received: by 2002:a05:6214:250d:b0:56e:ab08:670d with SMTP id
 gf13-20020a056214250d00b0056eab08670dmr26624160qvb.42.1678209428132; 
 Tue, 07 Mar 2023 09:17:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a05620a280800b0074269db4699sm9955804qkp.46.2023.03.07.09.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 09:17:07 -0800 (PST)
Message-ID: <5d527fcb-6b66-226b-e5ff-a5814c8f5d7a@redhat.com>
Date: Tue, 7 Mar 2023 18:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] vfio/migration: Rename entry points
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: yishaih@nvidia.com, jgg@nvidia.com, joao.m.martins@oracle.com,
 avihaih@nvidia.com
References: <167820819129.603802.2574672058630378188.stgit@omen>
 <167820912978.606734.12740287349119694623.stgit@omen>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <167820912978.606734.12740287349119694623.stgit@omen>
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

On 3/7/23 18:13, Alex Williamson wrote:
> Pick names that align with the section drivers should use them from,
> avoiding the confusion of calling a _finalize() function from _exit()
> and generalizing the actual _finalize() to handle removing the viommu
> blocker.
> 
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
> 
> v2: ...but there's already a vfio_migration_exit(), it should really
>      just be inlined, but for minimally invasive change, just rename to
>      vfio_migration_free().

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> 
>   hw/vfio/common.c              |    2 +-
>   hw/vfio/migration.c           |    8 ++++----
>   hw/vfio/pci.c                 |    6 +++---
>   include/hw/vfio/vfio-common.h |    6 +++---
>   4 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 2b9bcf70aa36..dddd7a8e40f8 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -447,7 +447,7 @@ int vfio_block_giommu_migration(Error **errp)
>       return ret;
>   }
>   
> -void vfio_unblock_giommu_migration(void)
> +void vfio_migration_finalize(void)
>   {
>       if (!giommu_migration_blocker ||
>           vfio_viommu_preset()) {
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 5d1e66f69194..1a1a8659c859 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -521,7 +521,7 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>       }
>   }
>   
> -static void vfio_migration_exit(VFIODevice *vbasedev)
> +static void vfio_migration_free(VFIODevice *vbasedev)
>   {
>       g_free(vbasedev->migration);
>       vbasedev->migration = NULL;
> @@ -631,7 +631,7 @@ int64_t vfio_mig_bytes_transferred(void)
>       return bytes_transferred;
>   }
>   
> -int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
> +int vfio_migration_realize(VFIODevice *vbasedev, Error **errp)
>   {
>       int ret = -ENOTSUP;
>   
> @@ -669,7 +669,7 @@ add_blocker:
>       return ret;
>   }
>   
> -void vfio_migration_finalize(VFIODevice *vbasedev)
> +void vfio_migration_exit(VFIODevice *vbasedev)
>   {
>       if (vbasedev->migration) {
>           VFIOMigration *migration = vbasedev->migration;
> @@ -677,7 +677,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>           remove_migration_state_change_notifier(&migration->migration_state);
>           qemu_del_vm_change_state_handler(migration->vm_state);
>           unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
> -        vfio_migration_exit(vbasedev);
> +        vfio_migration_free(vbasedev);
>           vfio_unblock_multiple_devices_migration();
>       }
>   
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 30a271eab38c..ec9a854361ac 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3145,7 +3145,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>       }
>   
>       if (!pdev->failover_pair_id) {
> -        ret = vfio_migration_probe(vbasedev, errp);
> +        ret = vfio_migration_realize(vbasedev, errp);
>           if (ret) {
>               error_report("%s: Migration disabled", vbasedev->name);
>           }
> @@ -3185,7 +3185,7 @@ static void vfio_instance_finalize(Object *obj)
>        */
>       vfio_put_device(vdev);
>       vfio_put_group(group);
> -    vfio_unblock_giommu_migration();
> +    vfio_migration_finalize();
>   }
>   
>   static void vfio_exitfn(PCIDevice *pdev)
> @@ -3204,7 +3204,7 @@ static void vfio_exitfn(PCIDevice *pdev)
>       }
>       vfio_teardown_msi(vdev);
>       vfio_bars_exit(vdev);
> -    vfio_migration_finalize(&vdev->vbasedev);
> +    vfio_migration_exit(&vdev->vbasedev);
>   }
>   
>   static void vfio_pci_reset(DeviceState *dev)
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 009bec34c4bc..eed244f25f34 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -223,7 +223,6 @@ bool vfio_mig_active(void);
>   int vfio_block_multiple_devices_migration(Error **errp);
>   void vfio_unblock_multiple_devices_migration(void);
>   int vfio_block_giommu_migration(Error **errp);
> -void vfio_unblock_giommu_migration(void);
>   int64_t vfio_mig_bytes_transferred(void);
>   
>   #ifdef CONFIG_LINUX
> @@ -247,7 +246,8 @@ int vfio_spapr_create_window(VFIOContainer *container,
>   int vfio_spapr_remove_window(VFIOContainer *container,
>                                hwaddr offset_within_address_space);
>   
> -int vfio_migration_probe(VFIODevice *vbasedev, Error **errp);
> -void vfio_migration_finalize(VFIODevice *vbasedev);
> +int vfio_migration_realize(VFIODevice *vbasedev, Error **errp);
> +void vfio_migration_exit(VFIODevice *vbasedev);
> +void vfio_migration_finalize(void);
>   
>   #endif /* HW_VFIO_VFIO_COMMON_H */
> 
> 


