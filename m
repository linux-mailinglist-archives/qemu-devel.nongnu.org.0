Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688F68F453
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:23:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo9l-0003rd-5p; Wed, 08 Feb 2023 12:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPo9j-0003pW-4g
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPo9g-0004Qw-WF
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LL366kTfz+5BkQ47LznpGHZIZET1JzPPAV38zSApow=;
 b=f6weGUjUP3r5Q5z/D+hA6scIJeNp+sunzKXzaY2YY+n2y+eQShZDS17KMS3BwSaoAVQTfR
 L6UOUQCge+nXs6kHrjqZjnmov00yqoxoVK0X2kY4hR1qhkDYWHDimY1JB+mp/+OflVkrYT
 ud1Cb7qIfVxwPqviviQQQzLs49dDnNw=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-aE2n3KW6PMqyZPkFwqcy8g-1; Wed, 08 Feb 2023 12:22:46 -0500
X-MC-Unique: aE2n3KW6PMqyZPkFwqcy8g-1
Received: by mail-io1-f71.google.com with SMTP id
 d8-20020a6b6e08000000b00722d8d9c432so11591990ioh.19
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LL366kTfz+5BkQ47LznpGHZIZET1JzPPAV38zSApow=;
 b=RpAZmqZPWIc3mLm5oWhEESjkKahgWlhMbh8DPVqkmYnonmZ9y0tvGTosbP7uoLe763
 05VKw/eH5PnANKv2sQyePqKHDR2ZQ8/Dng5wAUNnthqZVmU+iNLhS13I7+O7a/ennIga
 xe1oxg3Bf9MuAHqnWVndozzDHDXfmjA6eYXPEIWvAglV0c3GFIyqWKAnhzzwRiP03QhE
 E+LjhOT1Oe3YqBCwIfnba/pjjhxXXI/UGi1u+I9U7uM3M4g8ArU+fZHpaqbqzmpv+xyI
 eFgOtqaa9RyoM5eHmh2f29R0dfWqoHBZ0SkCyRDvHxOkdOoBbAfeHApr5TGuaK216yGW
 Fq4Q==
X-Gm-Message-State: AO0yUKXpgD+xbOH9rNTTpPyX0LjNqio1Sjyqv9ErANXWCY1qatC3Smkw
 TUV+XMN11Dl0wFdC69F8PKtuyKPqoMPbAuT3PnxF7zxCLGI/tnDhZruVN2i5kHG9PUG96Hl3hae
 HzIMe+ejT3VzL/qc=
X-Received: by 2002:a05:6e02:1649:b0:30c:436d:a6ab with SMTP id
 v9-20020a056e02164900b0030c436da6abmr8673584ilu.12.1675876965875; 
 Wed, 08 Feb 2023 09:22:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/MaoCD3rlj72AkM1nNFIutzn+XYNUPAxAu4APTnZErfuOI+bdbtuq1Gb+GyqMsDDUR29fAGw==
X-Received: by 2002:a05:6e02:1649:b0:30c:436d:a6ab with SMTP id
 v9-20020a056e02164900b0030c436da6abmr8673545ilu.12.1675876965548; 
 Wed, 08 Feb 2023 09:22:45 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d71-20020a0285cd000000b003b02df3521dsm5534035jai.93.2023.02.08.09.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:22:44 -0800 (PST)
Date: Wed, 8 Feb 2023 10:22:42 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng
 <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v9 07/14] vfio/migration: Block multiple devices migration
Message-ID: <20230208102242.5d028021.alex.williamson@redhat.com>
In-Reply-To: <238b17d1-17a3-e5d1-2973-4bda83928d6e@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-8-avihaih@nvidia.com>
 <20230207153454.4e1a0c51.alex.williamson@redhat.com>
 <238b17d1-17a3-e5d1-2973-4bda83928d6e@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 8 Feb 2023 15:08:15 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> On 08/02/2023 0:34, Alex Williamson wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Mon, 6 Feb 2023 14:31:30 +0200
> > Avihai Horon <avihaih@nvidia.com> wrote:
> > =20
> >> Currently VFIO migration doesn't implement some kind of intermediate
> >> quiescent state in which P2P DMAs are quiesced before stopping or
> >> running the device. This can cause problems in multi-device migration
> >> where the devices are doing P2P DMAs, since the devices are not stopped
> >> together at the same time.
> >>
> >> Until such support is added, block migration of multiple devices.
> >>
> >> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> >> ---
> >>   include/hw/vfio/vfio-common.h |  2 ++
> >>   hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++=
++
> >>   hw/vfio/migration.c           |  6 +++++
> >>   3 files changed, 59 insertions(+)
> >>
> >> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-comm=
on.h
> >> index e573f5a9f1..56b1683824 100644
> >> --- a/include/hw/vfio/vfio-common.h
> >> +++ b/include/hw/vfio/vfio-common.h
> >> @@ -218,6 +218,8 @@ typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOG=
roupList;
> >>   extern VFIOGroupList vfio_group_list;
> >>
> >>   bool vfio_mig_active(void);
> >> +int vfio_block_multiple_devices_migration(Error **errp);
> >> +void vfio_unblock_multiple_devices_migration(void);
> >>   int64_t vfio_mig_bytes_transferred(void);
> >>
> >>   #ifdef CONFIG_LINUX
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index 3a35f4afad..01db41b735 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -41,6 +41,7 @@
> >>   #include "qapi/error.h"
> >>   #include "migration/migration.h"
> >>   #include "migration/misc.h"
> >> +#include "migration/blocker.h"
> >>   #include "sysemu/tpm.h"
> >>
> >>   VFIOGroupList vfio_group_list =3D
> >> @@ -337,6 +338,56 @@ bool vfio_mig_active(void)
> >>       return true;
> >>   }
> >>
> >> +Error *multiple_devices_migration_blocker;
> >> +
> >> +static unsigned int vfio_migratable_device_num(void)
> >> +{
> >> +    VFIOGroup *group;
> >> +    VFIODevice *vbasedev;
> >> +    unsigned int device_num =3D 0;
> >> +
> >> +    QLIST_FOREACH(group, &vfio_group_list, next) {
> >> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> >> +            if (vbasedev->migration) {
> >> +                device_num++;
> >> +            }
> >> +        }
> >> +    }
> >> +
> >> +    return device_num;
> >> +}
> >> +
> >> +int vfio_block_multiple_devices_migration(Error **errp)
> >> +{
> >> +    int ret;
> >> +
> >> +    if (vfio_migratable_device_num() !=3D 2) {
> >> +        return 0;
> >> +    }
> >> +
> >> +    error_setg(&multiple_devices_migration_blocker,
> >> +               "Migration is currently not supported with multiple "
> >> +               "VFIO devices");
> >> +    ret =3D migrate_add_blocker(multiple_devices_migration_blocker, e=
rrp);
> >> +    if (ret < 0) {
> >> +        error_free(multiple_devices_migration_blocker);
> >> +        multiple_devices_migration_blocker =3D NULL;
> >> +    }
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +void vfio_unblock_multiple_devices_migration(void)
> >> +{
> >> +    if (vfio_migratable_device_num() !=3D 2) {
> >> +        return;
> >> +    }
> >> +
> >> +    migrate_del_blocker(multiple_devices_migration_blocker);
> >> +    error_free(multiple_devices_migration_blocker);
> >> +    multiple_devices_migration_blocker =3D NULL;
> >> +} =20
> > A couple awkward things here.  First I wish we could do something
> > cleaner or more intuitive than the !=3D 2 test.  I get that we're trying
> > to do this on the addition of the 2nd device supporting migration, or
> > the removal of the next to last device independent of all other devices,
> > but I wonder if it wouldn't be better to remove the multiple-device
> > blocker after migration is torn down for the device so we can test
> > device >1 or =3D=3D1 in combination with whether
> > multiple_devices_migration_blocker is NULL.
> >
> > Which comes to the second awkwardness, if we fail to add the blocker we
> > free and clear the blocker, but when we tear down the device due to that
> > failure we'll remove the blocker that doesn't exist, free NULL, and
> > clear it again.  Thanks to the glib slist the migration blocker is
> > using, I think that all works, but I'd rather not be dependent on that
> > implementation to avoid a segfault here.  Incorporating a test of
> > multiple_devices_migration_blocker as above would avoid this too. =20
>=20
> You mean something like this?
>=20
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 3a35f4afad..f3e08eff58 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
>=20
> [...]
>=20
> +int vfio_block_multiple_devices_migration(Error **errp)
> +{
> +=C2=A0=C2=A0=C2=A0 int ret;
> +
> +=C2=A0=C2=A0=C2=A0 if (vfio_migratable_device_num() <=3D 1 ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 multiple_devices_migration_bl=
ocker) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> +=C2=A0=C2=A0=C2=A0 }

Nit, I'd reverse the order of the test here and below, otherwise yes,
this is what I was thinking of.

> +
> +=C2=A0=C2=A0=C2=A0 error_setg(&multiple_devices_migration_blocker,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "Migration is currently not supported with multiple "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "VFIO devices");
> +=C2=A0=C2=A0=C2=A0 ret =3D migrate_add_blocker(multiple_devices_migratio=
n_blocker, errp);
> +=C2=A0=C2=A0=C2=A0 if (ret < 0) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_free(multiple_devices_m=
igration_blocker);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 multiple_devices_migration_bl=
ocker =3D NULL;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return ret;
> +}
> +
> +void vfio_unblock_multiple_devices_migration(void)
> +{
> +=C2=A0=C2=A0=C2=A0 if (vfio_migratable_device_num() > 1 ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !multiple_devices_migration_b=
locker) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 migrate_del_blocker(multiple_devices_migration_blocke=
r);
> +=C2=A0=C2=A0=C2=A0 error_free(multiple_devices_migration_blocker);
> +=C2=A0=C2=A0=C2=A0 multiple_devices_migration_blocker =3D NULL;
> +}
> +
>  =C2=A0static bool vfio_devices_all_dirty_tracking(VFIOContainer *contain=
er)
>  =C2=A0{
>  =C2=A0=C2=A0=C2=A0=C2=A0 VFIOGroup *group;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 552c2313b2..15b446c0ec 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -880,6 +880,11 @@ int vfio_migration_probe(VFIODevice *vbasedev,=20
> Error **errp)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto add_blocker;
>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> +=C2=A0=C2=A0=C2=A0 ret =3D vfio_block_multiple_devices_migration(errp);
> +=C2=A0=C2=A0=C2=A0 if (ret) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> +=C2=A0=C2=A0=C2=A0 }
> +
>  =C2=A0=C2=A0=C2=A0=C2=A0 trace_vfio_migration_probe(vbasedev->name, info=
->index);
>  =C2=A0=C2=A0=C2=A0=C2=A0 g_free(info);
>  =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> @@ -906,6 +911,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_del_vm_change_stat=
e_handler(migration->vm_state);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unregister_savevm(VMSTA=
TE_IF(vbasedev->dev), "vfio", vbasedev);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vfio_migration_exit(vba=
sedev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vfio_unblock_multiple_devices=
_migration();
>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 if (vbasedev->migration_blocker) {
>=20
>=20
> Maybe also negate the if conditions and put the add/remove blocker code=20
> inside it? Is it more readable this way?

I think the previous aligns more with the success oriented flow that
Jason like to promote.  Thanks,

Alex

> E.g.:
>=20
> +int vfio_block_multiple_devices_migration(Error **errp)
> +{
> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
> +
> +=C2=A0=C2=A0=C2=A0 if (vfio_migratable_device_num() > 1 &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !multiple_devices_migration_b=
locker) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(&multiple_devices_=
migration_blocker,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Migration is currently not supported =
with multiple "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "VFIO devices");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D migrate_add_blocker(m=
ultiple_devices_migration_blocker,=20
> errp);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error=
_free(multiple_devices_migration_blocker);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 multi=
ple_devices_migration_blocker =3D NULL;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return ret;
> +}
> +
> +void vfio_unblock_multiple_devices_migration(void)
> +{
> +=C2=A0=C2=A0=C2=A0 if (vfio_migratable_device_num() <=3D 1 &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 multiple_devices_migration_bl=
ocker) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migrate_del_blocker(multiple_=
devices_migration_blocker);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_free(multiple_devices_m=
igration_blocker);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 multiple_devices_migration_bl=
ocker =3D NULL;
> +=C2=A0=C2=A0=C2=A0 }
> +}
>=20
> Thanks.
>=20


