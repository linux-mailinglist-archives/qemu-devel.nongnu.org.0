Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366A67C142
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 01:02:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKpgx-0007gO-TQ; Wed, 25 Jan 2023 19:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pKpgn-0007aa-EU
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 19:00:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pKpgj-0003Le-NG
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 19:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674691219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQWv+MAOxsKmVkL0papy23cEAfh1ybC7NLheKliou+8=;
 b=PuG+RmqZei4Kud3LDIiku9KMfJ46pRhYLye0iRpAdkTyMWcPKfDCTbq/iL3djryLp6jaci
 IEMHl4UwCwz5+JXWKip6A+S0dAV+MCYdaE6MrgI3cneBXqHTlqYY6VVxMpqyQr6K2SBmaX
 Ud6xtKRvlG5FWee+ISASv3+2WUH3WnA=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-56-yzC6uV3MPqqzcHHWW0C9bQ-1; Wed, 25 Jan 2023 19:00:18 -0500
X-MC-Unique: yzC6uV3MPqqzcHHWW0C9bQ-1
Received: by mail-io1-f69.google.com with SMTP id
 11-20020a5ea50b000000b00704d9039115so36771iog.22
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 16:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQWv+MAOxsKmVkL0papy23cEAfh1ybC7NLheKliou+8=;
 b=H8ZeaWpkb9ezK9mJjdD6xEMDNMZ8U9dv6sGgenylO6sN5DIE3s1hjxeut+bR+FKLqC
 YRdcJ0dKXVk5GtJ1wrrbXQ89edbx6m0jaRgQYJgrf+5deHgAtpn1KRnP2ulT8e5HNAoO
 YLuIUaFRY4hNv4iPJujFhg3Sk4SQIR4fKLdizHHOA3IwVU6E4TBQIhNl9qN3XZB9kurw
 dnrbDyXtG4I4msFgylm+hnlxBCuC1SHJ8AAoXYcxyC0nDtGVs8rKGEYaQNSsIesUVaKt
 /xflHGj9DoUOsPloq/Zb+OGhzCU7wlAIVu2/jINguGElg+nMywK5YTTdLrEmaz2S8jwH
 K4gQ==
X-Gm-Message-State: AO0yUKWGJ9scykSTzPHfdkQ01n4GE/EAg8/Bt4Xgmw+FJM+co3cyW7f9
 /nGlkJuFSQp/sKBTsOv/ikzizSXpxwmQQYu6dFtvmAMmtV1JY/VkOTA9Bk6e1PnYHst9/A1b+z0
 wUsyhglaZ8I4yTxk=
X-Received: by 2002:a92:cda2:0:b0:310:ac47:82de with SMTP id
 g2-20020a92cda2000000b00310ac4782demr1909235ild.2.1674691217076; 
 Wed, 25 Jan 2023 16:00:17 -0800 (PST)
X-Google-Smtp-Source: AK7set9DlCa4jS08YxZN3aZ6sUv5L1ZaUqciI9g4SnT2q6t/d78R0Rzw12n31p7NGyv/Z/0yHrP+9A==
X-Received: by 2002:a92:cda2:0:b0:310:ac47:82de with SMTP id
 g2-20020a92cda2000000b00310ac4782demr1909191ild.2.1674691216539; 
 Wed, 25 Jan 2023 16:00:16 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 bq9-20020a056638468900b003a7cb4337c4sm1993159jab.137.2023.01.25.16.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 16:00:15 -0800 (PST)
Date: Wed, 25 Jan 2023 17:00:13 -0700
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
Subject: Re: [PATCH v8 09/13] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20230125170013.7563c434.alex.williamson@redhat.com>
In-Reply-To: <927e3f87-95e0-f996-475b-15f506e8f346@nvidia.com>
References: <20230116141135.12021-1-avihaih@nvidia.com>
 <20230116141135.12021-10-avihaih@nvidia.com>
 <20230120160704.0b1ee01c.alex.williamson@redhat.com>
 <927e3f87-95e0-f996-475b-15f506e8f346@nvidia.com>
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

On Sun, 22 Jan 2023 12:31:33 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> On 21/01/2023 1:07, Alex Williamson wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Mon, 16 Jan 2023 16:11:31 +0200
> > Avihai Horon <avihaih@nvidia.com> wrote:
> > =20
> >> Implement the basic mandatory part of VFIO migration protocol v2.
> >> This includes all functionality that is necessary to support
> >> VFIO_MIGRATION_STOP_COPY part of the v2 protocol.
> >>
> >> The two protocols, v1 and v2, will co-exist and in the following patch=
es
> >> v1 protocol code will be removed.
> >>
> >> There are several main differences between v1 and v2 protocols:
> >> - VFIO device state is now represented as a finite state machine inste=
ad
> >>    of a bitmap.
> >>
> >> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
> >>    ioctl and normal read() and write() instead of the migration region.
> >>
> >> - Pre-copy is made optional in v2 protocol. Support for pre-copy will =
be
> >>    added later on.
> >>
> >> Detailed information about VFIO migration protocol v2 and its differen=
ce
> >> compared to v1 protocol can be found here [1].
> >>
> >> [1]
> >> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.co=
m/
> >>
> >> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> >> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
> >> ---
> >>   include/hw/vfio/vfio-common.h |   5 +
> >>   hw/vfio/common.c              |  19 +-
> >>   hw/vfio/migration.c           | 455 +++++++++++++++++++++++++++++++-=
--
> >>   hw/vfio/trace-events          |   7 +
> >>   4 files changed, 447 insertions(+), 39 deletions(-)
> >>
> >> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-comm=
on.h
> >> index bbaf72ba00..6d7d850bfe 100644
> >> --- a/include/hw/vfio/vfio-common.h
> >> +++ b/include/hw/vfio/vfio-common.h
> >> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
> >>       int vm_running;
> >>       Notifier migration_state;
> >>       uint64_t pending_bytes;
> >> +    uint32_t device_state;
> >> +    int data_fd;
> >> +    void *data_buffer;
> >> +    size_t data_buffer_size;
> >> +    bool v2;
> >>   } VFIOMigration;
> >>
> >>   typedef struct VFIOAddressSpace {
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index 550b2d7ded..dcaa77d2a8 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -355,10 +355,18 @@ static bool vfio_devices_all_dirty_tracking(VFIO=
Container *container)
> >>                   return false;
> >>               }
> >>
> >> -            if ((vbasedev->pre_copy_dirty_page_tracking =3D=3D ON_OFF=
_AUTO_OFF) &&
> >> +            if (!migration->v2 &&
> >> +                (vbasedev->pre_copy_dirty_page_tracking =3D=3D ON_OFF=
_AUTO_OFF) &&
> >>                   (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_R=
UNNING)) {
> >>                   return false;
> >>               }
> >> +
> >> +            if (migration->v2 &&
> >> +                (vbasedev->pre_copy_dirty_page_tracking =3D=3D ON_OFF=
_AUTO_OFF) &&
> >> +                (migration->device_state =3D=3D VFIO_DEVICE_STATE_RUN=
NING ||
> >> +                 migration->device_state =3D=3D VFIO_DEVICE_STATE_RUN=
NING_P2P)) {
> >> +                return false;
> >> +            }
> >>           }
> >>       }
> >>       return true;
> >> @@ -385,7 +393,14 @@ static bool vfio_devices_all_running_and_mig_acti=
ve(VFIOContainer *container)
> >>                   return false;
> >>               }
> >>
> >> -            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUN=
NING) {
> >> +            if (!migration->v2 &&
> >> +                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUN=
NING) {
> >> +                continue;
> >> +            }
> >> +
> >> +            if (migration->v2 &&
> >> +                (migration->device_state =3D=3D VFIO_DEVICE_STATE_RUN=
NING ||
> >> +                 migration->device_state =3D=3D VFIO_DEVICE_STATE_RUN=
NING_P2P)) {
> >>                   continue;
> >>               } else {
> >>                   return false;
> >> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> >> index 9df859f4d3..f19ada0f4f 100644
> >> --- a/hw/vfio/migration.c
> >> +++ b/hw/vfio/migration.c
> >> @@ -10,6 +10,7 @@
> >>   #include "qemu/osdep.h"
> >>   #include "qemu/main-loop.h"
> >>   #include "qemu/cutils.h"
> >> +#include "qemu/units.h"
> >>   #include <linux/vfio.h>
> >>   #include <sys/ioctl.h>
> >>
> >> @@ -44,8 +45,103 @@
> >>   #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
> >>   #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
> >>
> >> +/*
> >> + * This is an arbitrary size based on migration of mlx5 devices, wher=
e typically
> >> + * total device migration size is on the order of 100s of MB. Testing=
 with
> >> + * larger values, e.g. 128MB and 1GB, did not show a performance impr=
ovement.
> >> + */
> >> +#define VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE (1 * MiB)
> >> +
> >>   static int64_t bytes_transferred;
> >>
> >> +static const char *mig_state_to_str(enum vfio_device_mig_state state)
> >> +{
> >> +    switch (state) {
> >> +    case VFIO_DEVICE_STATE_ERROR:
> >> +        return "ERROR";
> >> +    case VFIO_DEVICE_STATE_STOP:
> >> +        return "STOP";
> >> +    case VFIO_DEVICE_STATE_RUNNING:
> >> +        return "RUNNING";
> >> +    case VFIO_DEVICE_STATE_STOP_COPY:
> >> +        return "STOP_COPY";
> >> +    case VFIO_DEVICE_STATE_RESUMING:
> >> +        return "RESUMING";
> >> +    case VFIO_DEVICE_STATE_RUNNING_P2P:
> >> +        return "RUNNING_P2P";
> >> +    default:
> >> +        return "UNKNOWN STATE";
> >> +    }
> >> +}
> >> +
> >> +static int vfio_migration_set_state(VFIODevice *vbasedev,
> >> +                                    enum vfio_device_mig_state new_st=
ate,
> >> +                                    enum vfio_device_mig_state recove=
r_state)
> >> +{
> >> +    VFIOMigration *migration =3D vbasedev->migration;
> >> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> >> +                              sizeof(struct vfio_device_feature_mig_s=
tate),
> >> +                              sizeof(uint64_t))] =3D {};
> >> +    struct vfio_device_feature *feature =3D (struct vfio_device_featu=
re *)buf;
> >> +    struct vfio_device_feature_mig_state *mig_state =3D
> >> +        (struct vfio_device_feature_mig_state *)feature->data;
> >> +
> >> +    feature->argsz =3D sizeof(buf);
> >> +    feature->flags =3D
> >> +        VFIO_DEVICE_FEATURE_SET | VFIO_DEVICE_FEATURE_MIG_DEVICE_STAT=
E;
> >> +    mig_state->device_state =3D new_state;
> >> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> >> +        /* Try to set the device in some good state */
> >> +        int err =3D -errno;
> >> +
> >> +        error_report(
> >> +            "%s: Failed setting device state to %s, err: %s. Setting =
device in recover state %s",
> >> +                     vbasedev->name, mig_state_to_str(new_state),
> >> +                     strerror(errno), mig_state_to_str(recover_state)=
);
> >> +
> >> +        mig_state->device_state =3D recover_state;
> >> +        if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> >> +            err =3D -errno;
> >> +            error_report(
> >> +                "%s: Failed setting device in recover state, err: %s.=
 Resetting device",
> >> +                         vbasedev->name, strerror(errno));
> >> +
> >> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
> >> +                hw_error("%s: Failed resetting device, err: %s", vbas=
edev->name,
> >> +                         strerror(errno));
> >> +            }
> >> +
> >> +            migration->device_state =3D VFIO_DEVICE_STATE_RUNNING;
> >> +
> >> +            return err;
> >> +        }
> >> +
> >> +        migration->device_state =3D recover_state;
> >> +
> >> +        return err;
> >> +    }
> >> +
> >> +    migration->device_state =3D new_state;
> >> +    if (mig_state->data_fd !=3D -1) {
> >> +        if (migration->data_fd !=3D -1) {
> >> +            /*
> >> +             * This can happen if the device is asynchronously reset =
and
> >> +             * terminates a data transfer.
> >> +             */
> >> +            error_report("%s: data_fd out of sync", vbasedev->name);
> >> +            close(mig_state->data_fd);
> >> +
> >> +            return -EBADF;
> >> +        }
> >> +
> >> +        migration->data_fd =3D mig_state->data_fd;
> >> +    }
> >> +
> >> +    trace_vfio_migration_set_state(vbasedev->name, mig_state_to_str(n=
ew_state));
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, i=
nt count,
> >>                                     off_t off, bool iswrite)
> >>   {
> >> @@ -260,6 +356,18 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevi=
ce *vbasedev, uint64_t *size)
> >>       return ret;
> >>   }
> >>
> >> +static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
> >> +                            uint64_t data_size)
> >> +{
> >> +    VFIOMigration *migration =3D vbasedev->migration;
> >> +    int ret;
> >> +
> >> +    ret =3D qemu_file_get_to_fd(f, migration->data_fd, data_size);
> >> +    trace_vfio_load_state_device_data(vbasedev->name, data_size, ret);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>   static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
> >>                                  uint64_t data_size)
> >>   {
> >> @@ -394,6 +502,14 @@ static int vfio_load_device_config_state(QEMUFile=
 *f, void *opaque)
> >>       return qemu_file_get_error(f);
> >>   }
> >>
> >> +static void vfio_migration_cleanup(VFIODevice *vbasedev)
> >> +{
> >> +    VFIOMigration *migration =3D vbasedev->migration;
> >> +
> >> +    close(migration->data_fd);
> >> +    migration->data_fd =3D -1;
> >> +}
> >> +
> >>   static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
> >>   {
> >>       VFIOMigration *migration =3D vbasedev->migration;
> >> @@ -403,8 +519,80 @@ static void vfio_migration_v1_cleanup(VFIODevice =
*vbasedev)
> >>       }
> >>   }
> >>
> >> +static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
> >> +                                     uint64_t *stop_copy_size)
> >> +{
> >> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> >> +                              sizeof(struct vfio_device_feature_mig_d=
ata_size),
> >> +                              sizeof(uint64_t))] =3D {};
> >> +    struct vfio_device_feature *feature =3D (struct vfio_device_featu=
re *)buf;
> >> +    struct vfio_device_feature_mig_data_size *mig_data_size =3D
> >> +        (struct vfio_device_feature_mig_data_size *)feature->data;
> >> +
> >> +    feature->argsz =3D sizeof(buf);
> >> +    feature->flags =3D
> >> +        VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIG_DATA_SIZE;
> >> +
> >> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> >> +        return -errno;
> >> +    }
> >> +
> >> +    *stop_copy_size =3D mig_data_size->stop_copy_length;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if er=
ror */ =20
> >
> > Nit, actually returns -errno on error. =20
>=20
> Oh, right. Will change.
>=20
> > =20
> >> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
> >> +{
> >> +    ssize_t data_size;
> >> +
> >> +    data_size =3D read(migration->data_fd, migration->data_buffer,
> >> +                     migration->data_buffer_size);
> >> +    if (data_size < 0) {
> >> +        return -errno;
> >> +    }
> >> +    if (data_size =3D=3D 0) {
> >> +        return 1;
> >> +    }
> >> +
> >> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> >> +    qemu_put_be64(f, data_size);
> >> +    qemu_put_buffer(f, migration->data_buffer, data_size);
> >> +    bytes_transferred +=3D data_size;
> >> +
> >> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
> >> +
> >> +    return qemu_file_get_error(f);
> >> +}
> >> +
> >>   /* -----------------------------------------------------------------=
----- */
> >>
> >> +static int vfio_save_setup(QEMUFile *f, void *opaque)
> >> +{
> >> +    VFIODevice *vbasedev =3D opaque;
> >> +    VFIOMigration *migration =3D vbasedev->migration;
> >> +    uint64_t stop_copy_size =3D VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
> >> +
> >> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
> >> +
> >> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
> >> +    migration->data_buffer_size =3D MIN(VFIO_MIG_DEFAULT_DATA_BUFFER_=
SIZE,
> >> +                                      stop_copy_size);
> >> +    migration->data_buffer =3D g_try_malloc0(migration->data_buffer_s=
ize);
> >> +    if (!migration->data_buffer) {
> >> +        error_report("%s: Failed to allocate migration data buffer",
> >> +                     vbasedev->name);
> >> +        return -ENOMEM;
> >> +    }
> >> +
> >> +    trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size=
);
> >> +
> >> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE); =20
> >
> > What's the purpose of including this empty
> > VFIO_MIG_FLAG_DEV_SETUP_STATE delimiter?  Is this just an opportunity
> > to insert a fault in the migration data stream?  But if so, isn't it
> > sufficient that the caller does qemu_file_set_error() on an error
> > return? =20
>=20
> Upper migration layer wraps the vfio_save_setup() call with=20
> QEMU_VM_SECTION_START and QEMU_VM_SECTION_FOOTER tags.
> These tags are sent to target and target consumes them and calls=20
> vfio_load_state().
> Therefore, at the very least source must send VFIO_MIG_FLAG_END_OF_STATE=
=20
> in vfio_save_setup() so target vfio_load_state() can consume it and move =
on.
>=20
> Sending only VFIO_MIG_FLAG_END_OF_STATE in vfio_save_setup() seems kind=20
> of odd and incomplete to me, so I tend to leave it as is.
> What do you think?

No, I don't think we should send an end-of-state without a start, a
spurious end could get us out of sync.  The question was more whether
we need to send the pair at all since the loading side does nothing
with it.  I think you're suggesting that would trigger errors elsewhere
or maybe reduce our error handling capabilities if our load function
got an empty buffer?

Also, should it be concerning that we're implementing the load_setup
callback, which is called from a code block noted as "Old style".  I'd
certainly prefer if this received an API review from the QEMU migration
experts.

> >> +
> >> +    return qemu_file_get_error(f);
> >> +}
> >> +
> >>   static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
> >>   {
> >>       VFIODevice *vbasedev =3D opaque;
> >> @@ -448,6 +636,17 @@ static int vfio_v1_save_setup(QEMUFile *f, void *=
opaque)
> >>       return 0;
> >>   }
> >>
> >> +static void vfio_save_cleanup(void *opaque)
> >> +{
> >> +    VFIODevice *vbasedev =3D opaque;
> >> +    VFIOMigration *migration =3D vbasedev->migration;
> >> +
> >> +    g_free(migration->data_buffer);
> >> +    migration->data_buffer =3D NULL;
> >> +    vfio_migration_cleanup(vbasedev);
> >> +    trace_vfio_save_cleanup(vbasedev->name);
> >> +}
> >> +
> >>   static void vfio_v1_save_cleanup(void *opaque)
> >>   {
> >>       VFIODevice *vbasedev =3D opaque;
> >> @@ -456,6 +655,31 @@ static void vfio_v1_save_cleanup(void *opaque)
> >>       trace_vfio_save_cleanup(vbasedev->name);
> >>   }
> >>
> >> +/*
> >> + * Migration size of VFIO devices can be as little as a few KBs or as=
 big as
> >> + * many GBs. This value should be big enough to cover the worst case.
> >> + */
> >> +#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
> >> +static void vfio_save_pending(void *opaque, uint64_t threshold_size,
> >> +                              uint64_t *res_precopy_only,
> >> +                              uint64_t *res_compatible,
> >> +                              uint64_t *res_postcopy_only)
> >> +{
> >> +    VFIODevice *vbasedev =3D opaque;
> >> +    uint64_t stop_copy_size =3D VFIO_MIG_STOP_COPY_SIZE;
> >> +
> >> +    /*
> >> +     * If getting pending migration size fails, VFIO_MIG_STOP_COPY_SI=
ZE is
> >> +     * reported so downtime limit won't be violated.
> >> +     */
> >> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
> >> +    *res_precopy_only +=3D stop_copy_size;
> >> +
> >> +    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
> >> +                            *res_postcopy_only, *res_compatible,
> >> +                            stop_copy_size);
> >> +}
> >> +
> >>   static void vfio_v1_save_pending(void *opaque, uint64_t threshold_si=
ze,
> >>                                    uint64_t *res_precopy_only,
> >>                                    uint64_t *res_compatible,
> >> @@ -523,6 +747,41 @@ static int vfio_save_iterate(QEMUFile *f, void *o=
paque)
> >>       return 0;
> >>   }
> >>
> >> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> >> +{
> >> +    VFIODevice *vbasedev =3D opaque;
> >> +    enum vfio_device_mig_state recover_state;
> >> +    int ret;
> >> +
> >> +    /* We reach here with device state STOP only */
> >> +    recover_state =3D VFIO_DEVICE_STATE_STOP;
> >> +    ret =3D vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP=
_COPY,
> >> +                                   recover_state);
> >> +    if (ret) {
> >> +        return ret;
> >> +    }
> >> +
> >> +    do {
> >> +        ret =3D vfio_save_block(f, vbasedev->migration);
> >> +        if (ret < 0) {
> >> +            return ret;
> >> +        }
> >> +    } while (!ret);
> >> +
> >> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> >> +    ret =3D qemu_file_get_error(f);
> >> +    if (ret) {
> >> +        return ret;
> >> +    }
> >> +
> >> +    recover_state =3D VFIO_DEVICE_STATE_ERROR;
> >> +    ret =3D vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
> >> +                                   recover_state);
> >> +    trace_vfio_save_complete_precopy(vbasedev->name, ret);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>   static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
> >>   {
> >>       VFIODevice *vbasedev =3D opaque;
> >> @@ -592,6 +851,14 @@ static void vfio_save_state(QEMUFile *f, void *op=
aque)
> >>       }
> >>   }
> >>
> >> +static int vfio_load_setup(QEMUFile *f, void *opaque)
> >> +{
> >> +    VFIODevice *vbasedev =3D opaque;
> >> +
> >> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUM=
ING,
> >> +                                   vbasedev->migration->device_state);
> >> +}
> >> +
> >>   static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
> >>   {
> >>       VFIODevice *vbasedev =3D opaque;
> >> @@ -619,6 +886,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void *=
opaque)
> >>       return ret;
> >>   }
> >>
> >> +static int vfio_load_cleanup(void *opaque)
> >> +{
> >> +    VFIODevice *vbasedev =3D opaque;
> >> +
> >> +    vfio_migration_cleanup(vbasedev);
> >> +    trace_vfio_load_cleanup(vbasedev->name);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   static int vfio_v1_load_cleanup(void *opaque)
> >>   {
> >>       VFIODevice *vbasedev =3D opaque;
> >> @@ -661,7 +938,11 @@ static int vfio_load_state(QEMUFile *f, void *opa=
que, int version_id)
> >>               uint64_t data_size =3D qemu_get_be64(f);
> >>
> >>               if (data_size) {
> >> -                ret =3D vfio_v1_load_buffer(f, vbasedev, data_size);
> >> +                if (vbasedev->migration->v2) {
> >> +                    ret =3D vfio_load_buffer(f, vbasedev, data_size);
> >> +                } else {
> >> +                    ret =3D vfio_v1_load_buffer(f, vbasedev, data_siz=
e);
> >> +                }
> >>                   if (ret < 0) {
> >>                       return ret;
> >>                   }
> >> @@ -682,6 +963,17 @@ static int vfio_load_state(QEMUFile *f, void *opa=
que, int version_id)
> >>       return ret;
> >>   }
> >>
> >> +static const SaveVMHandlers savevm_vfio_handlers =3D {
> >> +    .save_setup =3D vfio_save_setup,
> >> +    .save_cleanup =3D vfio_save_cleanup,
> >> +    .save_live_pending =3D vfio_save_pending,
> >> +    .save_live_complete_precopy =3D vfio_save_complete_precopy,
> >> +    .save_state =3D vfio_save_state,
> >> +    .load_setup =3D vfio_load_setup,
> >> +    .load_cleanup =3D vfio_load_cleanup,
> >> +    .load_state =3D vfio_load_state,
> >> +};
> >> +
> >>   static SaveVMHandlers savevm_vfio_v1_handlers =3D {
> >>       .save_setup =3D vfio_v1_save_setup,
> >>       .save_cleanup =3D vfio_v1_save_cleanup,
> >> @@ -696,6 +988,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers =3D=
 {
> >>
> >>   /* -----------------------------------------------------------------=
----- */
> >>
> >> +static void vfio_vmstate_change(void *opaque, bool running, RunState =
state)
> >> +{
> >> +    VFIODevice *vbasedev =3D opaque;
> >> +    enum vfio_device_mig_state new_state;
> >> +    int ret;
> >> +
> >> +    if (running) {
> >> +        new_state =3D VFIO_DEVICE_STATE_RUNNING;
> >> +    } else {
> >> +        new_state =3D VFIO_DEVICE_STATE_STOP;
> >> +    }
> >> +
> >> +    ret =3D vfio_migration_set_state(vbasedev, new_state,
> >> +                                   VFIO_DEVICE_STATE_ERROR);
> >> +    if (ret) {
> >> +        /*
> >> +         * Migration should be aborted in this case, but vm_state_not=
ify()
> >> +         * currently does not support reporting failures.
> >> +         */
> >> +        if (migrate_get_current()->to_dst_file) {
> >> +            qemu_file_set_error(migrate_get_current()->to_dst_file, r=
et);
> >> +        }
> >> +    }
> >> +
> >> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(s=
tate),
> >> +                              mig_state_to_str(new_state));
> >> +}
> >> +
> >>   static void vfio_v1_vmstate_change(void *opaque, bool running, RunSt=
ate state)
> >>   {
> >>       VFIODevice *vbasedev =3D opaque;
> >> @@ -769,12 +1089,17 @@ static void vfio_migration_state_notifier(Notif=
ier *notifier, void *data)
> >>       case MIGRATION_STATUS_CANCELLED:
> >>       case MIGRATION_STATUS_FAILED:
> >>           bytes_transferred =3D 0;
> >> -        ret =3D vfio_migration_v1_set_state(vbasedev,
> >> -                                          ~(VFIO_DEVICE_STATE_V1_SAVI=
NG |
> >> -                                            VFIO_DEVICE_STATE_V1_RESU=
MING),
> >> -                                          VFIO_DEVICE_STATE_V1_RUNNIN=
G);
> >> -        if (ret) {
> >> -            error_report("%s: Failed to set state RUNNING", vbasedev-=
>name);
> >> +        if (migration->v2) {
> >> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNN=
ING,
> >> +                                     VFIO_DEVICE_STATE_ERROR);
> >> +        } else {
> >> +            ret =3D vfio_migration_v1_set_state(vbasedev,
> >> +                                              ~(VFIO_DEVICE_STATE_V1_=
SAVING |
> >> +                                                VFIO_DEVICE_STATE_V1_=
RESUMING),
> >> +                                              VFIO_DEVICE_STATE_V1_RU=
NNING);
> >> +            if (ret) {
> >> +                error_report("%s: Failed to set state RUNNING", vbase=
dev->name);
> >> +            }
> >>           }
> >>       }
> >>   }
> >> @@ -783,12 +1108,42 @@ static void vfio_migration_exit(VFIODevice *vba=
sedev)
> >>   {
> >>       VFIOMigration *migration =3D vbasedev->migration;
> >>
> >> -    vfio_region_exit(&migration->region);
> >> -    vfio_region_finalize(&migration->region);
> >> +    if (!migration->v2) {
> >> +        vfio_region_exit(&migration->region);
> >> +        vfio_region_finalize(&migration->region);
> >> +    }
> >>       g_free(vbasedev->migration);
> >>       vbasedev->migration =3D NULL;
> >>   }
> >>
> >> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t =
*mig_flags)
> >> +{
> >> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> >> +                                  sizeof(struct vfio_device_feature_m=
igration),
> >> +                              sizeof(uint64_t))] =3D {};
> >> +    struct vfio_device_feature *feature =3D (struct vfio_device_featu=
re *)buf;
> >> +    struct vfio_device_feature_migration *mig =3D
> >> +        (struct vfio_device_feature_migration *)feature->data;
> >> +
> >> +    feature->argsz =3D sizeof(buf);
> >> +    feature->flags =3D VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_=
MIGRATION;
> >> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> >> +        if (errno =3D=3D ENOTTY) {
> >> +            error_report("%s: VFIO migration is not supported in kern=
el",
> >> +                         vbasedev->name);
> >> +        } else {
> >> +            error_report("%s: Failed to query VFIO migration support,=
 err: %s",
> >> +                         vbasedev->name, strerror(errno));
> >> +        } =20
> >
> > This looks like a future TODO, at some point we'll want migration
> > enabled by default _as_available_ and it would cause problems to
> > generate error logs when it's not available. =20
>=20
> Do you mean we should add a TODO comment? E.g.:
> /*
>  =C2=A0* TODO: Currently VFIO migration is disabled by default. In the fu=
ture, if
>  =C2=A0* it's changed to be enabled by default as available, generating=20
> errors when
>  =C2=A0* it's not available might cause problems. So, error_report()s sho=
uld be
>  =C2=A0* removed.
>  =C2=A0*/
>=20
> Or should we change it now to warn_report(), or to a=20
> trace_vfio_migration_query_flags(vbasedev, err) for debugging?
> So the user will be notified that migration is not supported even before=
=20
> he tries to do migration and fails?

I don't think we need to do anything now since migration is marked
experimental and I think we only go down this path when the bool arg is
turned on.  It's arguably correct that we should generate error
messages and even fail the device initialization if we're asked to
enable migration and we can't.

But if we're looking at supportable migration, we had a previous
discussion that there wouldn't be a device option to enable it.  It
should automatically be enabled when supported by the device and device
initialization should only fail if the device lacks migration support
if the -only-migratable flag is set.  Along with that, lack of support
for migration by a device is not a condition that should generate any
errors messages unless via the -only-migratable option.  Therefore
eventually we can't have that error_report on -ENOTTY for the migration
feature.

A trace is unlikely to help a user that wants to check migration
support before they attempt it.  AIUI, there's a mechanism to query
whether the VM is migratable, ie. whether there are any registered
migration blockers, and libvirt will check this before attempting a
migration.  Thanks,

Alex


