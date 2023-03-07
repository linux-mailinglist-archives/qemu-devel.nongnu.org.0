Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982E6AE6D9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:39:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaLD-0000FJ-69; Tue, 07 Mar 2023 11:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZaLB-0000EO-8U
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:39:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZaL9-0003ul-Du
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678207141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWMrJp7S9zli1NVRsxNGT/VVEekAWEpWklQv46v7Su4=;
 b=eFzhYIJixiPAjBhCeSaNAGr9wn6fQD46wFwuAqUV478KMI6AICrv+TKzhA1k7IYewoQjLM
 YvWYc/Ao7REsTNA9rS74BUqvGBQQYdVkJ+oD/0Qb+nhaxvNk4L6wnG10ghTJu0abfOJW1V
 3LIJ74PgvyUCBtHk46D8micKKxC3bAI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-LRIEP-nBNiKuNNppwxL8Fw-1; Tue, 07 Mar 2023 11:38:59 -0500
X-MC-Unique: LRIEP-nBNiKuNNppwxL8Fw-1
Received: by mail-il1-f197.google.com with SMTP id
 j9-20020a056e02220900b0031d93dba5a9so4823361ilf.17
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678207134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWMrJp7S9zli1NVRsxNGT/VVEekAWEpWklQv46v7Su4=;
 b=EXo8FMzqnDV4o7FXdDXZQ3VvL8BOlbx5pgdH3epVsyYwaaWJP2cgwkWGLfNl0yaHd/
 OdLgZL1YGP4YUARAK0LMfRJbAw7z2fH91o3+rkM13D3YMsgver0KsL70Z66WeCujm60h
 nEgi0U5L5IpcYrhZK5PhycfAQB0nBdtTVn5eDC8nGOYT8+AKwuIljqN939yFDZ+EC7D7
 9mrNu4TRCBpWcThh14qNj/08ZdLYD/CBWencOceRlnQ/CTO2u0vxWOEZEs8Ax2UA5r20
 PYbZjSK1/if1g+l4e94PDUwSm2MjVD+famVnRUMZeXYXEPBqk4Y4xc4lqBB1dQZm9reG
 0/5Q==
X-Gm-Message-State: AO0yUKU/FDKXVUugEIiK/Ue1Otu6U2jQEyL3nmWIZkS5bDAe8dnyT9jQ
 E9Nr3iWZpWJZH6RYnpnOhz4QkQ5KBU3U4skVkq3jUv802QkAy3CQ4Xytln/t5tATDa8RZraYzyX
 wJC3OTt4NFR2Sc8Q=
X-Received: by 2002:a05:6e02:de7:b0:315:4a48:aaf with SMTP id
 m7-20020a056e020de700b003154a480aafmr10978690ilj.14.1678207134522; 
 Tue, 07 Mar 2023 08:38:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+maYVm5cekpTU1nTwOV14RDeGKMTMGggaPBWBW6g+WGaMng3ATOAFkIHwmhIGOZhd9TQGVLQ==
X-Received: by 2002:a05:6e02:de7:b0:315:4a48:aaf with SMTP id
 m7-20020a056e020de700b003154a480aafmr10978676ilj.14.1678207134218; 
 Tue, 07 Mar 2023 08:38:54 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h21-20020a02c735000000b003b7d56593d6sm4231108jao.160.2023.03.07.08.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 08:38:53 -0800 (PST)
Date: Tue, 7 Mar 2023 09:38:51 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
Subject: Re: [PATCH v5 13/15] vfio/migration: Block migration with vIOMMU
Message-ID: <20230307093851.2d820df0.alex.williamson@redhat.com>
In-Reply-To: <20230307125450.62409-14-joao.m.martins@oracle.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
 <20230307125450.62409-14-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue,  7 Mar 2023 12:54:48 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> Migrating with vIOMMU will require either tracking maximum
> IOMMU supported address space (e.g. 39/48 address width on Intel)
> or range-track current mappings and dirty track the new ones
> post starting dirty tracking. This will be done as a separate
> series, so add a live migration blocker until that is fixed.
>=20
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  hw/vfio/common.c              | 46 +++++++++++++++++++++++++++++++++++
>  hw/vfio/migration.c           |  5 ++++
>  hw/vfio/pci.c                 |  1 +
>  include/hw/vfio/vfio-common.h |  2 ++
>  4 files changed, 54 insertions(+)
>=20
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 2639b393a781..2b9bcf70aa36 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -362,6 +362,7 @@ bool vfio_mig_active(void)
>  }
> =20
>  static Error *multiple_devices_migration_blocker;
> +static Error *giommu_migration_blocker;
> =20
>  static unsigned int vfio_migratable_device_num(void)
>  {
> @@ -413,6 +414,51 @@ void vfio_unblock_multiple_devices_migration(void)
>      multiple_devices_migration_blocker =3D NULL;
>  }
> =20
> +static bool vfio_viommu_preset(void)
> +{
> +    VFIOAddressSpace *space;
> +
> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
> +        if (space->as !=3D &address_space_memory) {
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
> +               "Migration is currently not supported with vIOMMU enabled=
");
> +    ret =3D migrate_add_blocker(giommu_migration_blocker, errp);
> +    if (ret < 0) {
> +        error_free(giommu_migration_blocker);
> +        giommu_migration_blocker =3D NULL;
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
> +    giommu_migration_blocker =3D NULL;
> +}
> +
>  static void vfio_set_migration_error(int err)
>  {
>      MigrationState *ms =3D migrate_get_current();
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index a2c3d9bade7f..776fd2d7cdf3 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -634,6 +634,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error=
 **errp)
>          return ret;
>      }
> =20
> +    ret =3D vfio_block_giommu_migration(errp);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      trace_vfio_migration_probe(vbasedev->name);
>      return 0;
> =20
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3d4a9e..30a271eab38c 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3185,6 +3185,7 @@ static void vfio_instance_finalize(Object *obj)
>       */
>      vfio_put_device(vdev);
>      vfio_put_group(group);
> +    vfio_unblock_giommu_migration();
>  }

Hmm, doesn't this mean we're adding the viommu migration blocker in
common code but only removing it in pci code?  Granted that only PCI
devices currently have IOMMUs, but ick.  Thanks,

Alex


