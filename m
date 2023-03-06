Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550296ACE53
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:43:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGjB-0004Eo-7d; Mon, 06 Mar 2023 14:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZGj5-00049d-Ct
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:42:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZGj3-0003Qb-0A
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678131743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnjCF/fMpmbj8JDZJS4fqGGX7hlApQEtMlSHGJBTSvg=;
 b=Je8IfEGvbhjB3wOaOe612kiaUHLYM6IgCnPmffrrIKAHl8wVOdxW9qRJ9iYE73N73xeyne
 Nm4opBtr7x9vvSzh5tzeSxUcrN80gDtl81J8VyvAnVUXiKxup/7Ql1iHLtQQcG3braynLZ
 d3FJg99YniIbnvDQOdbp5npJL8uL9bo=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-KvDw5fNOOkqbkBXvR6IYbQ-1; Mon, 06 Mar 2023 14:42:21 -0500
X-MC-Unique: KvDw5fNOOkqbkBXvR6IYbQ-1
Received: by mail-il1-f200.google.com with SMTP id
 y2-20020a929502000000b0031707c6b348so5841389ilh.8
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 11:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678131741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mnjCF/fMpmbj8JDZJS4fqGGX7hlApQEtMlSHGJBTSvg=;
 b=WcfGSPePKk8jTn7NPOQovyRiiN7cSQlEXcKCOdRzEqFCGf2dPPJ0gSDESTN0PYfGHp
 gkBzFEqmWJhGijrEkl2LHmVy0pzJFTUyYdb3LXb7SH3E7irvC5RDh7HYPZhdOYf9RDOC
 Kfj2GXfW/CLGdK0Y1P6RGPpUlRPl8tMDHb3qlZZexu6hlqqb05l9cN0EBsadKFt4NqHk
 LQLJUULmlOfWhkXeW8d8IoFpni4oOvfH7A68XBM6Zxk0WguomJXawUbq3DxE0E2nXuPU
 0S6IXn5fucRpLN8m8Eg89Gw6clNLW3D9rNG10csCsh2DXSPlZ8V2PNWCu8+VuZBVE0xL
 0irw==
X-Gm-Message-State: AO0yUKUcdrr0PQ07NEQfFlGmzMK5PrcT5HEahthlrdd6qlNQMP7w4QJ+
 17/7YdeaOy5ffaE1a1/dBD9Gw2fE62qAn/9F72pVrYKfvjhaABPGxuF8z0dQ2jxC5sVAWJS/VhA
 TixHKdjXY10XD3d4=
X-Received: by 2002:a05:6e02:20e6:b0:318:abd1:da42 with SMTP id
 q6-20020a056e0220e600b00318abd1da42mr10088105ilv.12.1678131741219; 
 Mon, 06 Mar 2023 11:42:21 -0800 (PST)
X-Google-Smtp-Source: AK7set+wn3sMXac2Rri8T4XA6yoD8G5bcKqtXQqzrCIubR1vy4qLMpVU+3UGnT4DxnVbgjxKuJJhXg==
X-Received: by 2002:a05:6e02:20e6:b0:318:abd1:da42 with SMTP id
 q6-20020a056e0220e600b00318abd1da42mr10088092ilv.12.1678131740895; 
 Mon, 06 Mar 2023 11:42:20 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u10-20020a02cb8a000000b003ea1dbd00d6sm3422701jap.70.2023.03.06.11.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 11:42:20 -0800 (PST)
Date: Mon, 6 Mar 2023 12:42:19 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>
Subject: Re: [PATCH v3 11/13] vfio/migration: Block migration with vIOMMU
Message-ID: <20230306124219.3ad325aa.alex.williamson@redhat.com>
In-Reply-To: <20230304014343.33646-12-joao.m.martins@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-12-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
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

On Sat,  4 Mar 2023 01:43:41 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> Migrating with vIOMMU will require either tracking maximum
> IOMMU supported address space (e.g. 39/48 address width on Intel)
> or range-track current mappings and dirty track the new ones
> post starting dirty tracking. This will be done as a separate
> series, so add a live migration blocker until that is fixed.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++++
>  hw/vfio/migration.c           |  6 +++++
>  include/hw/vfio/vfio-common.h |  2 ++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 5b8456975e97..9b909f856722 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -365,6 +365,7 @@ bool vfio_mig_active(void)
>  }
>  
>  static Error *multiple_devices_migration_blocker;
> +static Error *giommu_migration_blocker;
>  
>  static unsigned int vfio_migratable_device_num(void)
>  {
> @@ -416,6 +417,56 @@ void vfio_unblock_multiple_devices_migration(void)
>      multiple_devices_migration_blocker = NULL;
>  }
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
> +                device_num++;
> +            }
> +        }
> +    }
> +
> +    return device_num;
> +}

I'm not sure why we're counting devices since nobody uses that data,
but couldn't this be even more simple and efficient by walking the
vfio_address_spaces list?

static bool vfio_viommu_preset(void)
{
    VFIOAddressSpace *space;

    QLIST_FOREACH(space, &vfio_address_spaces, list) {
        if (space->as != &address_space_memory) {
            return true;
        }
    }

    return false;
}

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
>  static void vfio_set_migration_error(int err)
>  {
>      MigrationState *ms = migrate_get_current();
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index a2c3d9bade7f..3e75868ae7a9 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -634,6 +634,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>          return ret;
>      }
>  
> +    ret = vfio_block_giommu_migration(errp);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      trace_vfio_migration_probe(vbasedev->name);
>      return 0;
>  
> @@ -659,6 +664,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>          unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
>          vfio_migration_exit(vbasedev);
>          vfio_unblock_multiple_devices_migration();
> +        vfio_unblock_giommu_migration();

Hmm, this actually gets called from vfio_exitfn(), doesn't all the
group, device, address space unlinking happen in
vfio_instance_finalize()?  Has this actually been tested to remove the
blocker?  And why is this a _finalize() function when it's called from
an exit callback?  Thanks,

Alex

>      }
>  
>      if (vbasedev->migration_blocker) {
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 1cbbccd91e11..38e44258925b 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -233,6 +233,8 @@ extern VFIOGroupList vfio_group_list;
>  bool vfio_mig_active(void);
>  int vfio_block_multiple_devices_migration(Error **errp);
>  void vfio_unblock_multiple_devices_migration(void);
> +int vfio_block_giommu_migration(Error **errp);
> +void vfio_unblock_giommu_migration(void);
>  int64_t vfio_mig_bytes_transferred(void);
>  
>  #ifdef CONFIG_LINUX


