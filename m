Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E06AC922
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:05:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEE1-0003wI-Kn; Mon, 06 Mar 2023 12:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZEDJ-0003R7-6a
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:01:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZECu-0001Ww-Pc
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678122063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w562JrjUc2pRm+KBe5ktu7tLKi3KC8SuHiLPYAKfZ+w=;
 b=Sw2Gtc4VgW/mXNpThaycT3m/WH8ADEA6MDOLdhRaHGSxQ1k3bsgsi1bRJ31i0PF7/2mxXJ
 kCA2yTbwduI7V4jaDONmJtYfVr4eKKs2pf7K0XJZe8k0tyL/MV0i2PULPfvKRmvz+2aQw8
 N+xM+5BtTC65rAspQ7kun51mW85wIWI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-ff-PDzl_NA6_C8WkJExkYA-1; Mon, 06 Mar 2023 12:01:01 -0500
X-MC-Unique: ff-PDzl_NA6_C8WkJExkYA-1
Received: by mail-oo1-f69.google.com with SMTP id
 y140-20020a4a4592000000b0052540059057so2986641ooa.6
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 09:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678122061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w562JrjUc2pRm+KBe5ktu7tLKi3KC8SuHiLPYAKfZ+w=;
 b=hcRRwq/lUyPRXLZEq8glyn/PJlK2NFWLX6RlHClxalHJ6HMeId3xlqcgChtSjugL19
 lnRZ0KB6oNUIIlk2CfDddsVKWvySfDrL3GHOqrAN3AL9kaY273E522Ny9hDM76UmztLS
 HWtxPIE1WX0XB6OtsHZBHWxoHWREalrQKotK3Je5a7R0yOWYTOLjz0XDHjy4Me0z6kCJ
 z0m8YTBehUGxEtc+2d2UTNMvprg92QdOZ2p6Yju8ukM8TWfBZyHGtrjSn49J/N6Egs+I
 r0ivZ5rdc3OZy/a/Q3ciqJ6MT/Clt6rUtkTWFyDMwYNggdKi4rN9ft5L8fnDA0vmQZWJ
 GBhw==
X-Gm-Message-State: AO0yUKVAu0AHbp5ysAcCR3dgGLH6PRFo7ulEkUZdewNiv+GyZRBNmcrz
 /o+6R7hgs1hXrcprSVDkzZLV2LAAmxRoEnoohpHsIDQZtuZFhyTFbxAKLsAbPFJfegQaaviRj11
 g/3wlaUk9H/kIfAY=
X-Received: by 2002:a05:6808:1d6:b0:378:974b:4fe1 with SMTP id
 x22-20020a05680801d600b00378974b4fe1mr5448271oic.29.1678122060858; 
 Mon, 06 Mar 2023 09:01:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8A7dtnM3eXNlAn3M0NYZakJ1V110MKt4pgUTZKFDuQBfItCdo/ZEm/5YYeiITwah6S+DNnjg==
X-Received: by 2002:a05:6808:1d6:b0:378:974b:4fe1 with SMTP id
 x22-20020a05680801d600b00378974b4fe1mr5448215oic.29.1678122059914; 
 Mon, 06 Mar 2023 09:00:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a37b902000000b0074231ac1723sm7878940qkf.28.2023.03.06.09.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:00:59 -0800 (PST)
Message-ID: <fed2d4f0-ee67-9cc6-9294-28c81cb2bef7@redhat.com>
Date: Mon, 6 Mar 2023 18:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 11/13] vfio/migration: Block migration with vIOMMU
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-12-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230304014343.33646-12-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
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

On 3/4/23 02:43, Joao Martins wrote:
> Migrating with vIOMMU will require either tracking maximum
> IOMMU supported address space (e.g. 39/48 address width on Intel)
> or range-track current mappings and dirty track the new ones
> post starting dirty tracking. This will be done as a separate
> series, so add a live migration blocker until that is fixed.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>   hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++++
>   hw/vfio/migration.c           |  6 +++++
>   include/hw/vfio/vfio-common.h |  2 ++
>   3 files changed, 59 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 5b8456975e97..9b909f856722 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -365,6 +365,7 @@ bool vfio_mig_active(void)
>   }
>   
>   static Error *multiple_devices_migration_blocker;
> +static Error *giommu_migration_blocker;
>   
>   static unsigned int vfio_migratable_device_num(void)
>   {
> @@ -416,6 +417,56 @@ void vfio_unblock_multiple_devices_migration(void)
>       multiple_devices_migration_blocker = NULL;
>   }
>   
> +static unsigned int vfio_use_iommu_device_num(void)
> +{
> +    VFIOGroup *group;
> +    VFIODevice *vbasedev;
> +    unsigned int device_num = 0;
> +
> +    QLIST_FOREACH(group, &vfio_group_list, next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            if (vbasedev->group->container->space->as !=
> +                                    &address_space_memory) {

Can't we avoid the second loop and test directly :

   group->container->space->as

?


The rest looks good. So,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> +                device_num++;
> +            }
> +        }
> +    }
> +
> +    return device_num;
> +}
> +
> +int vfio_block_giommu_migration(Error **errp)
> +{
> +    int ret;
> +
> +    if (giommu_migration_blocker ||
> +        !vfio_use_iommu_device_num()) {
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
> +        vfio_use_iommu_device_num()) {
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
> index a2c3d9bade7f..3e75868ae7a9 100644
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
> @@ -659,6 +664,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>           unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
>           vfio_migration_exit(vbasedev);
>           vfio_unblock_multiple_devices_migration();
> +        vfio_unblock_giommu_migration();
>       }
>   
>       if (vbasedev->migration_blocker) {
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 1cbbccd91e11..38e44258925b 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -233,6 +233,8 @@ extern VFIOGroupList vfio_group_list;
>   bool vfio_mig_active(void);
>   int vfio_block_multiple_devices_migration(Error **errp);
>   void vfio_unblock_multiple_devices_migration(void);
> +int vfio_block_giommu_migration(Error **errp);
> +void vfio_unblock_giommu_migration(void);
>   int64_t vfio_mig_bytes_transferred(void);
>   
>   #ifdef CONFIG_LINUX


