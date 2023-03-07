Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97696AE79F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:59:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZads-0004vG-1J; Tue, 07 Mar 2023 11:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZadq-0004uf-B8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZado-000210-QD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678208300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0diYV6H/tPg+PYDa17ivi6KdAzqgnuP2Z4lVzUJHdsQ=;
 b=YXhowiHgzpJFRSYnK+gAyPEhGIpTKF/KvCQ9t4mLLmNl4adrySfxz34necKkQI+hRtaYpC
 QAxy7R/1ThobxA6r2TG2dIxg18Qs5+DHpj/KZh0qO8P1iMtkpJXh8Hiietj3owgsjHDHa/
 cDT96UU5SgpYubrV9Gbvm/52UzzhXlc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-VFsW9MQDNgmtUrRk2ZwhmA-1; Tue, 07 Mar 2023 11:58:18 -0500
X-MC-Unique: VFsW9MQDNgmtUrRk2ZwhmA-1
Received: by mail-qk1-f198.google.com with SMTP id
 ea22-20020a05620a489600b00742cec04043so7798032qkb.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0diYV6H/tPg+PYDa17ivi6KdAzqgnuP2Z4lVzUJHdsQ=;
 b=cRbPs1juezmtm2zorptTbtt9RA+vswbivZDcxKo9W3lXEo3GvNF4g3SlHsa+j7jtvY
 vW3FLU0vjvf6MARS3BLQ0YzAuRuN1CvVqOo3zuqJqxMKZHw37xPtfTvsq/9prIXiAydn
 BuT+rKNOlTxVFsbm0AoTKszvsaFflW8fiYnUnqedz5RLTU3Vhc8RLug7NeFI5yTWIp/W
 OkqWlXn3wEeMpFLgQTOSlpPisSLqLn4x0v4JPak6ne2F35zqxfjjJdctB/eW4DYRaH0/
 /p45t0B99sUz9ugLTl5suAt42zehtfrjf7ha64THxHcd/MLUpa7VGViH1tB4SbBHRSOO
 mBng==
X-Gm-Message-State: AO0yUKVzdCzQNwjiNJD+Jg7QBBsPwVB3VEdmdlgsKmCOZ/U6Ohi1jxf8
 TV243PtvkUfOA6JlXCmNFX6ky40YvKuS2v5k+1oPSwCvsj9gFs3dxxlFFKTMGIVDy1a4RPRu3gx
 Mq3V7ajkB19Ee4z0=
X-Received: by 2002:a05:622a:1d1:b0:3c0:14ec:bfb2 with SMTP id
 t17-20020a05622a01d100b003c014ecbfb2mr25543471qtw.20.1678208298095; 
 Tue, 07 Mar 2023 08:58:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+dgHm6KSXVgofBAnxx9SfaQRESN2rrGxpXSX3WUE0SvFrdmd+8jP8EpLdWy426PJREQ3HIiQ==
X-Received: by 2002:a05:622a:1d1:b0:3c0:14ec:bfb2 with SMTP id
 t17-20020a05622a01d100b003c014ecbfb2mr25543446qtw.20.1678208297825; 
 Tue, 07 Mar 2023 08:58:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 t22-20020ac85316000000b003b9b8ec742csm9848991qtn.14.2023.03.07.08.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:58:17 -0800 (PST)
Message-ID: <2ea1ca0c-008f-5ea2-e0cd-e09bf432415b@redhat.com>
Date: Tue, 7 Mar 2023 17:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] vfio/migration: Rename entry points
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: yishaih@nvidia.com, jgg@nvidia.com, joao.m.martins@oracle.com,
 avihaih@nvidia.com
References: <167820819129.603802.2574672058630378188.stgit@omen>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <167820819129.603802.2574672058630378188.stgit@omen>
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

On 3/7/23 17:57, Alex Williamson wrote:
> Pick names that align with the section drivers should use them from,
> avoiding the confusion of calling a _finalize() function from _exit()
> and generalizing the actual _finalize() to handle removing the viommu
> blocker.
> 
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

LGTM !

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
> 
> A minor follow-up to Joao's v5 series.
> 
>   hw/vfio/common.c              |    2 +-
>   hw/vfio/migration.c           |    4 ++--
>   hw/vfio/pci.c                 |    6 +++---
>   include/hw/vfio/vfio-common.h |    6 +++---
>   4 files changed, 9 insertions(+), 9 deletions(-)
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
> index 5d1e66f69194..40f5f3d0b194 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
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


