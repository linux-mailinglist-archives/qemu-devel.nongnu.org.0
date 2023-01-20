Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD367613D
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 00:08:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJ0Tb-0000il-0G; Fri, 20 Jan 2023 18:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pJ0TY-0000iA-Jw
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 18:07:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pJ0TV-00075f-FW
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 18:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674256028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugpPS3EzWrcbNA/RRbjbYgLisMh29d0Bi2a1sGJXelA=;
 b=iyCMJmMVSxK9Af9C9FzzcnVo7sfNOnAnpEaRkXqGj8RigFNOon0WfSu5i6XGIz1SxmkhQr
 h/NsJe3/MOW+gxdR+3OM8Mfk3Uw/3CIGnpZuNzJTk0Wr4pAeS1Th3KYEVP3Z9GR1AyxkHx
 3g6zkRYDbz1vj/LvQBYqUdZnMlMEUJc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-G0ztthPFPs6X0L73LAlJjQ-1; Fri, 20 Jan 2023 18:07:07 -0500
X-MC-Unique: G0ztthPFPs6X0L73LAlJjQ-1
Received: by mail-il1-f200.google.com with SMTP id
 g1-20020a92cda1000000b0030c45d93884so4724032ild.16
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 15:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ugpPS3EzWrcbNA/RRbjbYgLisMh29d0Bi2a1sGJXelA=;
 b=qA9TYABgdy6hUjH65ijB3fmjGd2mnZCSB/XyV6NdPNM8ckuN9SSK0efBMVzcEw33AQ
 dX4HEKSZbpQyqo9iy4WACdXOsBuPiTV9KtYJz2GGJhgoP4b8V87XObJ4e47pgDyFrdqU
 IW6pddxLsHUoG1FLul19MjZd5vTkdzWE5ga7oJ2vcqHv5JoimIS/R5NRVxQhcJdMxj/D
 ExJwCjumMS+Xo7DgWwqfQ99MevgG1/rTBoyngF1UkUNOzwW24tDwCiWAerzHrHyjxK0P
 DB289LpXrxIRQlKfLj+uGa689txetx9+SzW9XHsuqgHzaIE7Igcosd021Fl0+1n07ozZ
 MPJw==
X-Gm-Message-State: AFqh2krTj68Q9uqPox/hzdQfguz6/Rh+3SMULnusH1EHD3AgG8OK/1Bb
 23y+DGW/ZWxIhMaZy6iSpPOE0e0lBSjMy3EYHOFf6JcHG8orqMQPqIJrL/ub9IOW4qpdWhoZOuY
 LCf5/QphQPMjozZA=
X-Received: by 2002:a6b:6505:0:b0:704:bef9:e7d0 with SMTP id
 z5-20020a6b6505000000b00704bef9e7d0mr10950642iob.19.1674256026557; 
 Fri, 20 Jan 2023 15:07:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcw8ZgRTjTZTm+HkV2yde9LLkIbs06nn2yPS5JlSSiRdEnLf8u/XuEuTsXt4g/6K1lFFWnBQ==
X-Received: by 2002:a6b:6505:0:b0:704:bef9:e7d0 with SMTP id
 z5-20020a6b6505000000b00704bef9e7d0mr10950612iob.19.1674256026132; 
 Fri, 20 Jan 2023 15:07:06 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i13-20020a0566022c8d00b00704d3db650bsm3356869iow.46.2023.01.20.15.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 15:07:05 -0800 (PST)
Date: Fri, 20 Jan 2023 16:07:04 -0700
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
Subject: Re: [PATCH v8 09/13] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20230120160704.0b1ee01c.alex.williamson@redhat.com>
In-Reply-To: <20230116141135.12021-10-avihaih@nvidia.com>
References: <20230116141135.12021-1-avihaih@nvidia.com>
 <20230116141135.12021-10-avihaih@nvidia.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 16 Jan 2023 16:11:31 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Implement the basic mandatory part of VFIO migration protocol v2.
> This includes all functionality that is necessary to support
> VFIO_MIGRATION_STOP_COPY part of the v2 protocol.
>=20
> The two protocols, v1 and v2, will co-exist and in the following patches
> v1 protocol code will be removed.
>=20
> There are several main differences between v1 and v2 protocols:
> - VFIO device state is now represented as a finite state machine instead
>   of a bitmap.
>=20
> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>   ioctl and normal read() and write() instead of the migration region.
>=20
> - Pre-copy is made optional in v2 protocol. Support for pre-copy will be
>   added later on.
>=20
> Detailed information about VFIO migration protocol v2 and its difference
> compared to v1 protocol can be found here [1].
>=20
> [1]
> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>=20
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  include/hw/vfio/vfio-common.h |   5 +
>  hw/vfio/common.c              |  19 +-
>  hw/vfio/migration.c           | 455 +++++++++++++++++++++++++++++++---
>  hw/vfio/trace-events          |   7 +
>  4 files changed, 447 insertions(+), 39 deletions(-)
>=20
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index bbaf72ba00..6d7d850bfe 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
>      int vm_running;
>      Notifier migration_state;
>      uint64_t pending_bytes;
> +    uint32_t device_state;
> +    int data_fd;
> +    void *data_buffer;
> +    size_t data_buffer_size;
> +    bool v2;
>  } VFIOMigration;
> =20
>  typedef struct VFIOAddressSpace {
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 550b2d7ded..dcaa77d2a8 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -355,10 +355,18 @@ static bool vfio_devices_all_dirty_tracking(VFIOCon=
tainer *container)
>                  return false;
>              }
> =20
> -            if ((vbasedev->pre_copy_dirty_page_tracking =3D=3D ON_OFF_AU=
TO_OFF) &&
> +            if (!migration->v2 &&
> +                (vbasedev->pre_copy_dirty_page_tracking =3D=3D ON_OFF_AU=
TO_OFF) &&
>                  (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNI=
NG)) {
>                  return false;
>              }
> +
> +            if (migration->v2 &&
> +                (vbasedev->pre_copy_dirty_page_tracking =3D=3D ON_OFF_AU=
TO_OFF) &&
> +                (migration->device_state =3D=3D VFIO_DEVICE_STATE_RUNNIN=
G ||
> +                 migration->device_state =3D=3D VFIO_DEVICE_STATE_RUNNIN=
G_P2P)) {
> +                return false;
> +            }
>          }
>      }
>      return true;
> @@ -385,7 +393,14 @@ static bool vfio_devices_all_running_and_mig_active(=
VFIOContainer *container)
>                  return false;
>              }
> =20
> -            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNIN=
G) {
> +            if (!migration->v2 &&
> +                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNIN=
G) {
> +                continue;
> +            }
> +
> +            if (migration->v2 &&
> +                (migration->device_state =3D=3D VFIO_DEVICE_STATE_RUNNIN=
G ||
> +                 migration->device_state =3D=3D VFIO_DEVICE_STATE_RUNNIN=
G_P2P)) {
>                  continue;
>              } else {
>                  return false;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 9df859f4d3..f19ada0f4f 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -10,6 +10,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/cutils.h"
> +#include "qemu/units.h"
>  #include <linux/vfio.h>
>  #include <sys/ioctl.h>
> =20
> @@ -44,8 +45,103 @@
>  #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
>  #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
> =20
> +/*
> + * This is an arbitrary size based on migration of mlx5 devices, where t=
ypically
> + * total device migration size is on the order of 100s of MB. Testing wi=
th
> + * larger values, e.g. 128MB and 1GB, did not show a performance improve=
ment.
> + */
> +#define VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE (1 * MiB)
> +
>  static int64_t bytes_transferred;
> =20
> +static const char *mig_state_to_str(enum vfio_device_mig_state state)
> +{
> +    switch (state) {
> +    case VFIO_DEVICE_STATE_ERROR:
> +        return "ERROR";
> +    case VFIO_DEVICE_STATE_STOP:
> +        return "STOP";
> +    case VFIO_DEVICE_STATE_RUNNING:
> +        return "RUNNING";
> +    case VFIO_DEVICE_STATE_STOP_COPY:
> +        return "STOP_COPY";
> +    case VFIO_DEVICE_STATE_RESUMING:
> +        return "RESUMING";
> +    case VFIO_DEVICE_STATE_RUNNING_P2P:
> +        return "RUNNING_P2P";
> +    default:
> +        return "UNKNOWN STATE";
> +    }
> +}
> +
> +static int vfio_migration_set_state(VFIODevice *vbasedev,
> +                                    enum vfio_device_mig_state new_state,
> +                                    enum vfio_device_mig_state recover_s=
tate)
> +{
> +    VFIOMigration *migration =3D vbasedev->migration;
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                              sizeof(struct vfio_device_feature_mig_stat=
e),
> +                              sizeof(uint64_t))] =3D {};
> +    struct vfio_device_feature *feature =3D (struct vfio_device_feature =
*)buf;
> +    struct vfio_device_feature_mig_state *mig_state =3D
> +        (struct vfio_device_feature_mig_state *)feature->data;
> +
> +    feature->argsz =3D sizeof(buf);
> +    feature->flags =3D
> +        VFIO_DEVICE_FEATURE_SET | VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE;
> +    mig_state->device_state =3D new_state;
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        /* Try to set the device in some good state */
> +        int err =3D -errno;
> +
> +        error_report(
> +            "%s: Failed setting device state to %s, err: %s. Setting dev=
ice in recover state %s",
> +                     vbasedev->name, mig_state_to_str(new_state),
> +                     strerror(errno), mig_state_to_str(recover_state));
> +
> +        mig_state->device_state =3D recover_state;
> +        if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +            err =3D -errno;
> +            error_report(
> +                "%s: Failed setting device in recover state, err: %s. Re=
setting device",
> +                         vbasedev->name, strerror(errno));
> +
> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
> +                hw_error("%s: Failed resetting device, err: %s", vbasede=
v->name,
> +                         strerror(errno));
> +            }
> +
> +            migration->device_state =3D VFIO_DEVICE_STATE_RUNNING;
> +
> +            return err;
> +        }
> +
> +        migration->device_state =3D recover_state;
> +
> +        return err;
> +    }
> +
> +    migration->device_state =3D new_state;
> +    if (mig_state->data_fd !=3D -1) {
> +        if (migration->data_fd !=3D -1) {
> +            /*
> +             * This can happen if the device is asynchronously reset and
> +             * terminates a data transfer.
> +             */
> +            error_report("%s: data_fd out of sync", vbasedev->name);
> +            close(mig_state->data_fd);
> +
> +            return -EBADF;
> +        }
> +
> +        migration->data_fd =3D mig_state->data_fd;
> +    }
> +
> +    trace_vfio_migration_set_state(vbasedev->name, mig_state_to_str(new_=
state));
> +
> +    return 0;
> +}
> +
>  static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int c=
ount,
>                                    off_t off, bool iswrite)
>  {
> @@ -260,6 +356,18 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice =
*vbasedev, uint64_t *size)
>      return ret;
>  }
> =20
> +static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
> +                            uint64_t data_size)
> +{
> +    VFIOMigration *migration =3D vbasedev->migration;
> +    int ret;
> +
> +    ret =3D qemu_file_get_to_fd(f, migration->data_fd, data_size);
> +    trace_vfio_load_state_device_data(vbasedev->name, data_size, ret);
> +
> +    return ret;
> +}
> +
>  static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>                                 uint64_t data_size)
>  {
> @@ -394,6 +502,14 @@ static int vfio_load_device_config_state(QEMUFile *f=
, void *opaque)
>      return qemu_file_get_error(f);
>  }
> =20
> +static void vfio_migration_cleanup(VFIODevice *vbasedev)
> +{
> +    VFIOMigration *migration =3D vbasedev->migration;
> +
> +    close(migration->data_fd);
> +    migration->data_fd =3D -1;
> +}
> +
>  static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>  {
>      VFIOMigration *migration =3D vbasedev->migration;
> @@ -403,8 +519,80 @@ static void vfio_migration_v1_cleanup(VFIODevice *vb=
asedev)
>      }
>  }
> =20
> +static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
> +                                     uint64_t *stop_copy_size)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                              sizeof(struct vfio_device_feature_mig_data=
_size),
> +                              sizeof(uint64_t))] =3D {};
> +    struct vfio_device_feature *feature =3D (struct vfio_device_feature =
*)buf;
> +    struct vfio_device_feature_mig_data_size *mig_data_size =3D
> +        (struct vfio_device_feature_mig_data_size *)feature->data;
> +
> +    feature->argsz =3D sizeof(buf);
> +    feature->flags =3D
> +        VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIG_DATA_SIZE;
> +
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        return -errno;
> +    }
> +
> +    *stop_copy_size =3D mig_data_size->stop_copy_length;
> +
> +    return 0;
> +}
> +
> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error=
 */


Nit, actually returns -errno on error.


> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
> +{
> +    ssize_t data_size;
> +
> +    data_size =3D read(migration->data_fd, migration->data_buffer,
> +                     migration->data_buffer_size);
> +    if (data_size < 0) {
> +        return -errno;
> +    }
> +    if (data_size =3D=3D 0) {
> +        return 1;
> +    }
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> +    qemu_put_be64(f, data_size);
> +    qemu_put_buffer(f, migration->data_buffer, data_size);
> +    bytes_transferred +=3D data_size;
> +
> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
> +
> +    return qemu_file_get_error(f);
> +}
> +
>  /* ---------------------------------------------------------------------=
- */
> =20
> +static int vfio_save_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev =3D opaque;
> +    VFIOMigration *migration =3D vbasedev->migration;
> +    uint64_t stop_copy_size =3D VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
> +
> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
> +    migration->data_buffer_size =3D MIN(VFIO_MIG_DEFAULT_DATA_BUFFER_SIZ=
E,
> +                                      stop_copy_size);
> +    migration->data_buffer =3D g_try_malloc0(migration->data_buffer_size=
);
> +    if (!migration->data_buffer) {
> +        error_report("%s: Failed to allocate migration data buffer",
> +                     vbasedev->name);
> +        return -ENOMEM;
> +    }
> +
> +    trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);


What's the purpose of including this empty
VFIO_MIG_FLAG_DEV_SETUP_STATE delimiter?  Is this just an opportunity
to insert a fault in the migration data stream?  But if so, isn't it
sufficient that the caller does qemu_file_set_error() on an error
return?

> +
> +    return qemu_file_get_error(f);
> +}
> +
>  static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev =3D opaque;
> @@ -448,6 +636,17 @@ static int vfio_v1_save_setup(QEMUFile *f, void *opa=
que)
>      return 0;
>  }
> =20
> +static void vfio_save_cleanup(void *opaque)
> +{
> +    VFIODevice *vbasedev =3D opaque;
> +    VFIOMigration *migration =3D vbasedev->migration;
> +
> +    g_free(migration->data_buffer);
> +    migration->data_buffer =3D NULL;
> +    vfio_migration_cleanup(vbasedev);
> +    trace_vfio_save_cleanup(vbasedev->name);
> +}
> +
>  static void vfio_v1_save_cleanup(void *opaque)
>  {
>      VFIODevice *vbasedev =3D opaque;
> @@ -456,6 +655,31 @@ static void vfio_v1_save_cleanup(void *opaque)
>      trace_vfio_save_cleanup(vbasedev->name);
>  }
> =20
> +/*
> + * Migration size of VFIO devices can be as little as a few KBs or as bi=
g as
> + * many GBs. This value should be big enough to cover the worst case.
> + */
> +#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
> +static void vfio_save_pending(void *opaque, uint64_t threshold_size,
> +                              uint64_t *res_precopy_only,
> +                              uint64_t *res_compatible,
> +                              uint64_t *res_postcopy_only)
> +{
> +    VFIODevice *vbasedev =3D opaque;
> +    uint64_t stop_copy_size =3D VFIO_MIG_STOP_COPY_SIZE;
> +
> +    /*
> +     * If getting pending migration size fails, VFIO_MIG_STOP_COPY_SIZE =
is
> +     * reported so downtime limit won't be violated.
> +     */
> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
> +    *res_precopy_only +=3D stop_copy_size;
> +
> +    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
> +                            *res_postcopy_only, *res_compatible,
> +                            stop_copy_size);
> +}
> +
>  static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
>                                   uint64_t *res_precopy_only,
>                                   uint64_t *res_compatible,
> @@ -523,6 +747,41 @@ static int vfio_save_iterate(QEMUFile *f, void *opaq=
ue)
>      return 0;
>  }
> =20
> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev =3D opaque;
> +    enum vfio_device_mig_state recover_state;
> +    int ret;
> +
> +    /* We reach here with device state STOP only */
> +    recover_state =3D VFIO_DEVICE_STATE_STOP;
> +    ret =3D vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_CO=
PY,
> +                                   recover_state);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    do {
> +        ret =3D vfio_save_block(f, vbasedev->migration);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    } while (!ret);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +    ret =3D qemu_file_get_error(f);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    recover_state =3D VFIO_DEVICE_STATE_ERROR;
> +    ret =3D vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
> +                                   recover_state);
> +    trace_vfio_save_complete_precopy(vbasedev->name, ret);
> +
> +    return ret;
> +}
> +
>  static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev =3D opaque;
> @@ -592,6 +851,14 @@ static void vfio_save_state(QEMUFile *f, void *opaqu=
e)
>      }
>  }
> =20
> +static int vfio_load_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev =3D opaque;
> +
> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
> +                                   vbasedev->migration->device_state);
> +}
> +
>  static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev =3D opaque;
> @@ -619,6 +886,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opa=
que)
>      return ret;
>  }
> =20
> +static int vfio_load_cleanup(void *opaque)
> +{
> +    VFIODevice *vbasedev =3D opaque;
> +
> +    vfio_migration_cleanup(vbasedev);
> +    trace_vfio_load_cleanup(vbasedev->name);
> +
> +    return 0;
> +}
> +
>  static int vfio_v1_load_cleanup(void *opaque)
>  {
>      VFIODevice *vbasedev =3D opaque;
> @@ -661,7 +938,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque=
, int version_id)
>              uint64_t data_size =3D qemu_get_be64(f);
> =20
>              if (data_size) {
> -                ret =3D vfio_v1_load_buffer(f, vbasedev, data_size);
> +                if (vbasedev->migration->v2) {
> +                    ret =3D vfio_load_buffer(f, vbasedev, data_size);
> +                } else {
> +                    ret =3D vfio_v1_load_buffer(f, vbasedev, data_size);
> +                }
>                  if (ret < 0) {
>                      return ret;
>                  }
> @@ -682,6 +963,17 @@ static int vfio_load_state(QEMUFile *f, void *opaque=
, int version_id)
>      return ret;
>  }
> =20
> +static const SaveVMHandlers savevm_vfio_handlers =3D {
> +    .save_setup =3D vfio_save_setup,
> +    .save_cleanup =3D vfio_save_cleanup,
> +    .save_live_pending =3D vfio_save_pending,
> +    .save_live_complete_precopy =3D vfio_save_complete_precopy,
> +    .save_state =3D vfio_save_state,
> +    .load_setup =3D vfio_load_setup,
> +    .load_cleanup =3D vfio_load_cleanup,
> +    .load_state =3D vfio_load_state,
> +};
> +
>  static SaveVMHandlers savevm_vfio_v1_handlers =3D {
>      .save_setup =3D vfio_v1_save_setup,
>      .save_cleanup =3D vfio_v1_save_cleanup,
> @@ -696,6 +988,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers =3D {
> =20
>  /* ---------------------------------------------------------------------=
- */
> =20
> +static void vfio_vmstate_change(void *opaque, bool running, RunState sta=
te)
> +{
> +    VFIODevice *vbasedev =3D opaque;
> +    enum vfio_device_mig_state new_state;
> +    int ret;
> +
> +    if (running) {
> +        new_state =3D VFIO_DEVICE_STATE_RUNNING;
> +    } else {
> +        new_state =3D VFIO_DEVICE_STATE_STOP;
> +    }
> +
> +    ret =3D vfio_migration_set_state(vbasedev, new_state,
> +                                   VFIO_DEVICE_STATE_ERROR);
> +    if (ret) {
> +        /*
> +         * Migration should be aborted in this case, but vm_state_notify=
()
> +         * currently does not support reporting failures.
> +         */
> +        if (migrate_get_current()->to_dst_file) {
> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        }
> +    }
> +
> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(stat=
e),
> +                              mig_state_to_str(new_state));
> +}
> +
>  static void vfio_v1_vmstate_change(void *opaque, bool running, RunState =
state)
>  {
>      VFIODevice *vbasedev =3D opaque;
> @@ -769,12 +1089,17 @@ static void vfio_migration_state_notifier(Notifier=
 *notifier, void *data)
>      case MIGRATION_STATUS_CANCELLED:
>      case MIGRATION_STATUS_FAILED:
>          bytes_transferred =3D 0;
> -        ret =3D vfio_migration_v1_set_state(vbasedev,
> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
> -                                            VFIO_DEVICE_STATE_V1_RESUMIN=
G),
> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
> -        if (ret) {
> -            error_report("%s: Failed to set state RUNNING", vbasedev->na=
me);
> +        if (migration->v2) {
> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
> +                                     VFIO_DEVICE_STATE_ERROR);
> +        } else {
> +            ret =3D vfio_migration_v1_set_state(vbasedev,
> +                                              ~(VFIO_DEVICE_STATE_V1_SAV=
ING |
> +                                                VFIO_DEVICE_STATE_V1_RES=
UMING),
> +                                              VFIO_DEVICE_STATE_V1_RUNNI=
NG);
> +            if (ret) {
> +                error_report("%s: Failed to set state RUNNING", vbasedev=
->name);
> +            }
>          }
>      }
>  }
> @@ -783,12 +1108,42 @@ static void vfio_migration_exit(VFIODevice *vbased=
ev)
>  {
>      VFIOMigration *migration =3D vbasedev->migration;
> =20
> -    vfio_region_exit(&migration->region);
> -    vfio_region_finalize(&migration->region);
> +    if (!migration->v2) {
> +        vfio_region_exit(&migration->region);
> +        vfio_region_finalize(&migration->region);
> +    }
>      g_free(vbasedev->migration);
>      vbasedev->migration =3D NULL;
>  }
> =20
> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mi=
g_flags)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                                  sizeof(struct vfio_device_feature_migr=
ation),
> +                              sizeof(uint64_t))] =3D {};
> +    struct vfio_device_feature *feature =3D (struct vfio_device_feature =
*)buf;
> +    struct vfio_device_feature_migration *mig =3D
> +        (struct vfio_device_feature_migration *)feature->data;
> +
> +    feature->argsz =3D sizeof(buf);
> +    feature->flags =3D VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIG=
RATION;
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        if (errno =3D=3D ENOTTY) {
> +            error_report("%s: VFIO migration is not supported in kernel",
> +                         vbasedev->name);
> +        } else {
> +            error_report("%s: Failed to query VFIO migration support, er=
r: %s",
> +                         vbasedev->name, strerror(errno));
> +        }


This looks like a future TODO, at some point we'll want migration
enabled by default _as_available_ and it would cause problems to
generate error logs when it's not available.  The error_report in
vfio_realize due to vfio_migration_probe() error is troublesome in this
respect as well, but also I'm not sure how we get there without
migrate_add_blocker() propagating an error, so it also seems redundant.
Thanks,

Alex

> +
> +        return -errno;
> +    }
> +
> +    *mig_flags =3D mig->flags;
> +
> +    return 0;
> +}
> +
>  static int vfio_migration_init(VFIODevice *vbasedev)
>  {
>      int ret;
> @@ -797,6 +1152,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      char id[256] =3D "";
>      g_autofree char *path =3D NULL, *oid =3D NULL;
>      struct vfio_region_info *info;
> +    uint64_t mig_flags =3D 0;
> =20
>      if (!vbasedev->ops->vfio_get_object) {
>          return -EINVAL;
> @@ -807,34 +1163,50 @@ static int vfio_migration_init(VFIODevice *vbasede=
v)
>          return -EINVAL;
>      }
> =20
> -    ret =3D vfio_get_dev_region_info(vbasedev,
> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECA=
TED,
> -                                   &info);
> -    if (ret) {
> -        return ret;
> -    }
> +    ret =3D vfio_migration_query_flags(vbasedev, &mig_flags);
> +    if (!ret) {
> +        /* Migration v2 */
> +        /* Basic migration functionality must be supported */
> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
> +            return -EOPNOTSUPP;
> +        }
> +        vbasedev->migration =3D g_new0(VFIOMigration, 1);
> +        vbasedev->migration->device_state =3D VFIO_DEVICE_STATE_RUNNING;
> +        vbasedev->migration->data_fd =3D -1;
> +        vbasedev->migration->v2 =3D true;
> +    } else if (ret =3D=3D -ENOTTY) {
> +        /* Migration v1 */
> +        ret =3D vfio_get_dev_region_info(vbasedev,
> +                                       VFIO_REGION_TYPE_MIGRATION_DEPREC=
ATED,
> +                                       VFIO_REGION_SUBTYPE_MIGRATION_DEP=
RECATED,
> +                                       &info);
> +        if (ret) {
> +            return ret;
> +        }
> =20
> -    vbasedev->migration =3D g_new0(VFIOMigration, 1);
> -    vbasedev->migration->device_state_v1 =3D VFIO_DEVICE_STATE_V1_RUNNIN=
G;
> -    vbasedev->migration->vm_running =3D runstate_is_running();
> +        vbasedev->migration =3D g_new0(VFIOMigration, 1);
> +        vbasedev->migration->device_state_v1 =3D VFIO_DEVICE_STATE_V1_RU=
NNING;
> +        vbasedev->migration->vm_running =3D runstate_is_running();
> =20
> -    ret =3D vfio_region_setup(obj, vbasedev, &vbasedev->migration->regio=
n,
> -                            info->index, "migration");
> -    if (ret) {
> -        error_report("%s: Failed to setup VFIO migration region %d: %s",
> -                     vbasedev->name, info->index, strerror(-ret));
> -        goto err;
> -    }
> +        ret =3D vfio_region_setup(obj, vbasedev, &vbasedev->migration->r=
egion,
> +                                info->index, "migration");
> +        if (ret) {
> +            error_report("%s: Failed to setup VFIO migration region %d: =
%s",
> +                         vbasedev->name, info->index, strerror(-ret));
> +            goto err;
> +        }
> =20
> -    if (!vbasedev->migration->region.size) {
> -        error_report("%s: Invalid zero-sized VFIO migration region %d",
> -                     vbasedev->name, info->index);
> -        ret =3D -EINVAL;
> -        goto err;
> -    }
> +        if (!vbasedev->migration->region.size) {
> +            error_report("%s: Invalid zero-sized VFIO migration region %=
d",
> +                         vbasedev->name, info->index);
> +            ret =3D -EINVAL;
> +            goto err;
> +        }
> =20
> -    g_free(info);
> +        g_free(info);
> +    } else {
> +        return ret;
> +    }
> =20
>      migration =3D vbasedev->migration;
>      migration->vbasedev =3D vbasedev;
> @@ -847,11 +1219,20 @@ static int vfio_migration_init(VFIODevice *vbasede=
v)
>      }
>      strpadcpy(id, sizeof(id), path, '\0');
> =20
> -    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> -                         &savevm_vfio_v1_handlers, vbasedev);
> +    if (migration->v2) {
> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                             &savevm_vfio_handlers, vbasedev);
> +
> +        migration->vm_state =3D qdev_add_vm_change_state_handler(
> +            vbasedev->dev, vfio_vmstate_change, vbasedev);
> +    } else {
> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                             &savevm_vfio_v1_handlers, vbasedev);
> +
> +        migration->vm_state =3D qdev_add_vm_change_state_handler(
> +            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
> +    }
> =20
> -    migration->vm_state =3D qdev_add_vm_change_state_handler(
> -        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>      migration->migration_state.notify =3D vfio_migration_state_notifier;
>      add_migration_state_change_notifier(&migration->migration_state);
>      return 0;
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 9eb9aff295..e7b3b4658c 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -149,20 +149,27 @@ vfio_display_edid_write_error(void) ""
> =20
>  # migration.c
>  vfio_migration_probe(const char *name) " (%s)"
> +vfio_migration_set_state(const char *name, const char *state) " (%s) sta=
te %s"
>  vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) sta=
te %d"
> +vfio_vmstate_change(const char *name, int running, const char *reason, c=
onst char *dev_state) " (%s) running %d reason %s device state %s"
>  vfio_v1_vmstate_change(const char *name, int running, const char *reason=
, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>  vfio_migration_state_notifier(const char *name, const char *state) " (%s=
) state %s"
> +vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data=
 buffer size 0x%"PRIx64
>  vfio_v1_save_setup(const char *name) " (%s)"
>  vfio_save_cleanup(const char *name) " (%s)"
>  vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_s=
ize, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0=
x%"PRIx64
>  vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0=
x%"PRIx64
>  vfio_save_device_config_state(const char *name) " (%s)"
> +vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy,=
 uint64_t compatible, uint64_t stopcopy_size) " (%s) precopy 0x%"PRIx64" po=
stcopy 0x%"PRIx64" compatible 0x%"PRIx64" stopcopy size 0x%"PRIx64
>  vfio_v1_save_pending(const char *name, uint64_t precopy, uint64_t postco=
py, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" co=
mpatible 0x%"PRIx64
>  vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
> +vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
>  vfio_v1_save_complete_precopy(const char *name) " (%s)"
>  vfio_load_device_config_state(const char *name) " (%s)"
>  vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
>  vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, u=
int64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
> +vfio_load_state_device_data(const char *name, uint64_t data_size, int re=
t) " (%s) size 0x%"PRIx64" ret %d"
>  vfio_load_cleanup(const char *name) " (%s)"
>  vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bit=
map_size, uint64_t start) "container fd=3D%d, iova=3D0x%"PRIx64" size=3D 0x=
%"PRIx64" bitmap_size=3D0x%"PRIx64" start=3D0x%"PRIx64
>  vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iom=
mu dirty @ 0x%"PRIx64" - 0x%"PRIx64
> +vfio_save_block(const char *name, int data_size) " (%s) data_size %d"


