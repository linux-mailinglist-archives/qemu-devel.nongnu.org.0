Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED11E68E375
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 23:35:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPWYT-0007Np-RW; Tue, 07 Feb 2023 17:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPWYM-0007N0-14
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:35:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPWYI-0008AM-L7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675809301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3bElMFABkpLafy1Au2cT+Z1nUTukaPlqrE3l9STek/w=;
 b=ED8d9w0QHIqAERINgwl+68QonLxhB27hPRh69IoHUbipqeUGOdyyxCaIvvHui2u2iPTVua
 FFPANT0ybsApamctbHcaKaf84rVsnS6n0YiDiFgvEjRYXNJ6ItP4hkQ3Rz9EQe8gITfFzg
 LN91+mFIYdja3D16r9QO1AxNZdbw8PE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-6UW3vbC8PkufXGFKiDZrfA-1; Tue, 07 Feb 2023 17:34:59 -0500
X-MC-Unique: 6UW3vbC8PkufXGFKiDZrfA-1
Received: by mail-il1-f200.google.com with SMTP id
 s12-20020a92cb0c000000b00313ceced13aso4565337ilo.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 14:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bElMFABkpLafy1Au2cT+Z1nUTukaPlqrE3l9STek/w=;
 b=N+po6ykVCXpEN/ptUiL3bP8qEW6iNWfD1mxkzgekjg0vjTXKyr9uIj93bmPcctACVo
 +2XXcvyps9fbKUqy2uO6wMeG94O3J4FS8OGYREzcGpRiXMom+FJjTllBU860QSEuqvgK
 m7z5J5RlF7qiELRVxpJquzTyh5aqjps/7X8mmc5gS/HR5d66qAVorUMu/hTcg1cdPqhc
 6AIcwYTSRLCDUgfx6wHQroL4rjzv0Byn8O1TnpNFCSMYqmsjuQe6vqE9ZdTaOR8dzDSg
 w4ZzRSX1o1MGcq7/Q4SqNbplMdO6mPdHyduyglw5rAfGgSSc0K1X64OQ54V35HDpabcH
 k16Q==
X-Gm-Message-State: AO0yUKXHOWVvw4nmGOJcVlBwHNaAot7ZbkHhZMOqph6fQ0HqZmA12FlU
 GxRDlCT9La1Zs6JdOnaA2ol8lmnVI8G118PhifN1Vr9HQq2DZe6fJy+pxxopKi5OTJN1xJnfntd
 mlEz114HkgETcU5Q=
X-Received: by 2002:a92:8e4f:0:b0:30f:5f1f:8927 with SMTP id
 k15-20020a928e4f000000b0030f5f1f8927mr3926664ilh.20.1675809298926; 
 Tue, 07 Feb 2023 14:34:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+2R7pzfo7TnzhNQ21UxCsydL0/ptmTPL3Cf5vnRpb8+CdG+jJlCXmHuzq6gggEFGFtw58+0w==
X-Received: by 2002:a92:8e4f:0:b0:30f:5f1f:8927 with SMTP id
 k15-20020a928e4f000000b0030f5f1f8927mr3926644ilh.20.1675809298617; 
 Tue, 07 Feb 2023 14:34:58 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c5-20020a92cf45000000b0030dbef81995sm2924108ilr.57.2023.02.07.14.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 14:34:58 -0800 (PST)
Date: Tue, 7 Feb 2023 15:34:54 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v9 07/14] vfio/migration: Block multiple devices migration
Message-ID: <20230207153454.4e1a0c51.alex.williamson@redhat.com>
In-Reply-To: <20230206123137.31149-8-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-8-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, 6 Feb 2023 14:31:30 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Currently VFIO migration doesn't implement some kind of intermediate
> quiescent state in which P2P DMAs are quiesced before stopping or
> running the device. This can cause problems in multi-device migration
> where the devices are doing P2P DMAs, since the devices are not stopped
> together at the same time.
> 
> Until such support is added, block migration of multiple devices.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  include/hw/vfio/vfio-common.h |  2 ++
>  hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++++
>  hw/vfio/migration.c           |  6 +++++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index e573f5a9f1..56b1683824 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -218,6 +218,8 @@ typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>  extern VFIOGroupList vfio_group_list;
>  
>  bool vfio_mig_active(void);
> +int vfio_block_multiple_devices_migration(Error **errp);
> +void vfio_unblock_multiple_devices_migration(void);
>  int64_t vfio_mig_bytes_transferred(void);
>  
>  #ifdef CONFIG_LINUX
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 3a35f4afad..01db41b735 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -41,6 +41,7 @@
>  #include "qapi/error.h"
>  #include "migration/migration.h"
>  #include "migration/misc.h"
> +#include "migration/blocker.h"
>  #include "sysemu/tpm.h"
>  
>  VFIOGroupList vfio_group_list =
> @@ -337,6 +338,56 @@ bool vfio_mig_active(void)
>      return true;
>  }
>  
> +Error *multiple_devices_migration_blocker;
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
> +    if (vfio_migratable_device_num() != 2) {
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
> +    if (vfio_migratable_device_num() != 2) {
> +        return;
> +    }
> +
> +    migrate_del_blocker(multiple_devices_migration_blocker);
> +    error_free(multiple_devices_migration_blocker);
> +    multiple_devices_migration_blocker = NULL;
> +}

A couple awkward things here.  First I wish we could do something
cleaner or more intuitive than the != 2 test.  I get that we're trying
to do this on the addition of the 2nd device supporting migration, or
the removal of the next to last device independent of all other devices,
but I wonder if it wouldn't be better to remove the multiple-device
blocker after migration is torn down for the device so we can test
device >1 or ==1 in combination with whether
multiple_devices_migration_blocker is NULL.

Which comes to the second awkwardness, if we fail to add the blocker we
free and clear the blocker, but when we tear down the device due to that
failure we'll remove the blocker that doesn't exist, free NULL, and
clear it again.  Thanks to the glib slist the migration blocker is
using, I think that all works, but I'd rather not be dependent on that
implementation to avoid a segfault here.  Incorporating a test of
multiple_devices_migration_blocker as above would avoid this too.  Thanks,

Alex

> +
>  static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>  {
>      VFIOGroup *group;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 552c2313b2..8085a4ff44 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -880,6 +880,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>          goto add_blocker;
>      }
>  
> +    ret = vfio_block_multiple_devices_migration(errp);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      trace_vfio_migration_probe(vbasedev->name, info->index);
>      g_free(info);
>      return 0;
> @@ -902,6 +907,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>      if (vbasedev->migration) {
>          VFIOMigration *migration = vbasedev->migration;
>  
> +        vfio_unblock_multiple_devices_migration();
>          remove_migration_state_change_notifier(&migration->migration_state);
>          qemu_del_vm_change_state_handler(migration->vm_state);
>          unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);


