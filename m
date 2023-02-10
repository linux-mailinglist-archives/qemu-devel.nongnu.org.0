Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8669204E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:57:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTtP-0000S1-Qu; Fri, 10 Feb 2023 08:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pQTtN-0000Rm-K7
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:56:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pQTtL-0002k3-9U
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676037401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LucMmKE4XksXHsTLKZC0+azeVGWKRERw2IwykuuJ1HA=;
 b=WO9iyOcejUP6TEsBu6PxvblXPvAq6MVY1vrHXqN1o/g/fzaZ25aywiiPNBCaCo9aUWKA6o
 RYtxZnN+oKLUCzES+sA6r8jdd1VGD7Edsnumv60Xvr+6CWdDQ65a7evhtYCQoRW3pLfKQH
 52ovZ6vGQR8QfHdZ+teC5jhYWm6udOs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-eoKt2tUSP3600ouo3WoWjw-1; Fri, 10 Feb 2023 08:56:38 -0500
X-MC-Unique: eoKt2tUSP3600ouo3WoWjw-1
Received: by mail-qk1-f198.google.com with SMTP id
 s7-20020a05620a0bc700b006e08208eb31so3309815qki.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LucMmKE4XksXHsTLKZC0+azeVGWKRERw2IwykuuJ1HA=;
 b=jzy61hW3nRtQ1kM2lezxWoLjHDOO1qaYF/mb17KhSuMdNiEMDIUyi+zJT/SNaWyHpd
 yn5EeWeOAH7iBUUKD/XEycdbDhf4Rx7Gf9VE2KekHAo8YlxFM2RagbybBJT1GPVo6jsm
 Nk75Yegc4Y3Io52QuRTEJPwis+a2XppCUAGG1tNrdY6wrLqaUzYG2ntqo6uwep8OeyIf
 KaTY32flE9vZa0J4AmaXzBQlJvWWbQsjREHRYrG4gzLTFkVI6G3H5DhnU3tT/G29qRF6
 9x8iP6LPcTb8r16eZFBgFo+Hd98HlDNejSgdU8AlSlXXNc8EWBWF65BI2csv9u6toQXN
 EBYg==
X-Gm-Message-State: AO0yUKXYlUDuJPUS6F2Rsr71yXLUiI5qwKhqGwBh/lmvFf7JmC8wKwg0
 kaAAhswuyrEqrUab4cvBSbq4tqYsFmUt+1FxOdDFKQfkFUhePt/tYILAb2Y0jDNCPDcQSvwYeOR
 hj2OajKtVwMoZ7fA=
X-Received: by 2002:ac8:5b90:0:b0:3b8:251f:4cda with SMTP id
 a16-20020ac85b90000000b003b8251f4cdamr24890420qta.58.1676037398462; 
 Fri, 10 Feb 2023 05:56:38 -0800 (PST)
X-Google-Smtp-Source: AK7set9X/SJHDsPJsuoYUwaHqzVIw8MntjF/HsOWh+sN/hmVBs5rF1HzVhzpjzHluJxAVxBatRBrLw==
X-Received: by 2002:ac8:5b90:0:b0:3b8:251f:4cda with SMTP id
 a16-20020ac85b90000000b003b8251f4cdamr24890391qta.58.1676037398220; 
 Fri, 10 Feb 2023 05:56:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 y10-20020ac8128a000000b003b68ea3d5c8sm3392334qti.41.2023.02.10.05.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:56:37 -0800 (PST)
Message-ID: <9a7cd8d9-6aaa-2591-9cda-c9e1e6e2e5dd@redhat.com>
Date: Fri, 10 Feb 2023 14:56:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 06/12] vfio/migration: Block multiple devices migration
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-7-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230209192043.14885-7-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/9/23 20:20, Avihai Horon wrote:
> Currently VFIO migration doesn't implement some kind of intermediate
> quiescent state in which P2P DMAs are quiesced before stopping or
> running the device. This can cause problems in multi-device migration
> where the devices are doing P2P DMAs, since the devices are not stopped
> together at the same time.
> 
> Until such support is added, block migration of multiple devices.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/vfio/vfio-common.h |  2 ++
>   hw/vfio/common.c              | 53 +++++++++++++++++++++++++++++++++++
>   hw/vfio/migration.c           |  6 ++++
>   3 files changed, 61 insertions(+)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index e573f5a9f1..56b1683824 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -218,6 +218,8 @@ typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>   extern VFIOGroupList vfio_group_list;
>   
>   bool vfio_mig_active(void);
> +int vfio_block_multiple_devices_migration(Error **errp);
> +void vfio_unblock_multiple_devices_migration(void);
>   int64_t vfio_mig_bytes_transferred(void);
>   
>   #ifdef CONFIG_LINUX
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 3a35f4afad..fe80ccf914 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -41,6 +41,7 @@
>   #include "qapi/error.h"
>   #include "migration/migration.h"
>   #include "migration/misc.h"
> +#include "migration/blocker.h"
>   #include "sysemu/tpm.h"
>   
>   VFIOGroupList vfio_group_list =
> @@ -337,6 +338,58 @@ bool vfio_mig_active(void)
>       return true;
>   }
>   
> +static Error *multiple_devices_migration_blocker;
> +
> +static unsigned int vfio_migratable_device_num(void)
> +{
> +    VFIOGroup *group;
> +    VFIODevice *vbasedev;
> +    unsigned int device_num = 0;
> +
> +    QLIST_FOREACH(group, &vfio_group_list, next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            if (vbasedev->migration) {
> +                device_num++;
> +            }
> +        }
> +    }
> +
> +    return device_num;
> +}
> +
> +int vfio_block_multiple_devices_migration(Error **errp)
> +{
> +    int ret;
> +
> +    if (multiple_devices_migration_blocker ||
> +        vfio_migratable_device_num() <= 1) {
> +        return 0;
> +    }
> +
> +    error_setg(&multiple_devices_migration_blocker,
> +               "Migration is currently not supported with multiple "
> +               "VFIO devices");
> +    ret = migrate_add_blocker(multiple_devices_migration_blocker, errp);
> +    if (ret < 0) {
> +        error_free(multiple_devices_migration_blocker);
> +        multiple_devices_migration_blocker = NULL;
> +    }
> +
> +    return ret;
> +}
> +
> +void vfio_unblock_multiple_devices_migration(void)
> +{
> +    if (!multiple_devices_migration_blocker ||
> +        vfio_migratable_device_num() > 1) {
> +        return;
> +    }
> +
> +    migrate_del_blocker(multiple_devices_migration_blocker);
> +    error_free(multiple_devices_migration_blocker);
> +    multiple_devices_migration_blocker = NULL;
> +}
> +
>   static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>   {
>       VFIOGroup *group;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index c9f3117986..5dafa0a558 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -881,6 +881,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>           goto add_blocker;
>       }
>   
> +    ret = vfio_block_multiple_devices_migration(errp);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       trace_vfio_migration_probe(vbasedev->name, info->index);
>       g_free(info);
>       return 0;
> @@ -907,6 +912,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>           qemu_del_vm_change_state_handler(migration->vm_state);
>           unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
>           vfio_migration_exit(vbasedev);
> +        vfio_unblock_multiple_devices_migration();
>       }
>   
>       if (vbasedev->migration_blocker) {


