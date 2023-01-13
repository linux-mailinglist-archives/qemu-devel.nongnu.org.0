Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A478669EE5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMh8-00022H-Oa; Fri, 13 Jan 2023 11:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pGMgw-0001xe-8X
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:14:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pGMgp-00043D-Gr
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673626438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uNA5dbwsEuitj/nNFFyuT5C7TeuUT0aiXVmLHt0eICc=;
 b=CylLGZaFD+6Jswi0Q3775ekmR56dca5s1TWBoADgxAgsLOBmACPmzTb+SyfdbOJbaGeV7b
 k/i47GvkH6Lr6KIm9Hx9tuJaFaBdIUcbqqgHnoZFdgp4A7FKSilzcENL2dHtf3nkNCYhar
 2T3WRIQ/MaDdBxMVAYABL0DLFAz8ddk=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-Z03b2DGqN6OwGfDh_9qHFg-1; Fri, 13 Jan 2023 11:13:57 -0500
X-MC-Unique: Z03b2DGqN6OwGfDh_9qHFg-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-4cddba76f55so170032897b3.23
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 08:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uNA5dbwsEuitj/nNFFyuT5C7TeuUT0aiXVmLHt0eICc=;
 b=EN/FD1wqE7+dJ7LMIzhSUsW1GKnfF/Yc5nXwRMZzZ0TV0QJ49jMEs0PK5tLGShQADw
 kHjngTV/HbwScUWCouPj9QxiOQxJZ46S5cbRTI2BOO7GV8uwhM2TydkQKDkjvpM2rIjz
 r6El6OfpSdFTP3CGdQLDrm5+3BxiBnTb8W1j/HphdGMuOau1K6YYhUyT6bej5MJNMDgT
 +9Mn8J/YmNJXd5t7q5/ZgV6l/DL9SY2P6/kbAnM0EBummhqAH7o5MOzDiNuZnjdRaZY7
 PgEXXarziJZ06VNkOB9ryzwt+l5fITQCHSEyUm49CFywIsPHNy0LW6a/isivMuCjlOoC
 TSmg==
X-Gm-Message-State: AFqh2kpNLFcvfdScMZ+KAFq44HKjt0z2YSjIsfBN/dFx7g0rz/c0GZGm
 sNA9qgAIuAJB21wiEyPlC3cecFjn7/xGboFLOhxwqKhy5h5cNDWc6bEt203sm4a6QiidEurKyjI
 P6c3G1y+N30z9Lc0=
X-Received: by 2002:a81:a1ca:0:b0:4d3:52f5:7724 with SMTP id
 y193-20020a81a1ca000000b004d352f57724mr10438820ywg.45.1673626437044; 
 Fri, 13 Jan 2023 08:13:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsvaf4OO9PXVOFDOvKaxcgFHLcY9ICRdIyD93iYIQK7hIDqaLqN0hRHNpckZu17dE/o2ziWTA==
X-Received: by 2002:a81:a1ca:0:b0:4d3:52f5:7724 with SMTP id
 y193-20020a81a1ca000000b004d352f57724mr10438783ywg.45.1673626436662; 
 Fri, 13 Jan 2023 08:13:56 -0800 (PST)
Received: from [192.168.124.101] (149.37.22.93.rev.sfr.net. [93.22.37.149])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05620a29ca00b006fcb77f3bd6sm12981023qkp.98.2023.01.13.08.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 08:13:56 -0800 (PST)
Message-ID: <de4cb446-c3e4-4141-0bbd-04d5be46f2ec@redhat.com>
Date: Fri, 13 Jan 2023 17:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 09/13] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
 <20230112085020.15866-10-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230112085020.15866-10-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/12/23 09:50, Avihai Horon wrote:
> Implement the basic mandatory part of VFIO migration protocol v2.
> This includes all functionality that is necessary to support
> VFIO_MIGRATION_STOP_COPY part of the v2 protocol.
> 
> The two protocols, v1 and v2, will co-exist and in the following patches
> v1 protocol code will be removed.
> 
> There are several main differences between v1 and v2 protocols:
> - VFIO device state is now represented as a finite state machine instead
>    of a bitmap.
> 
> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>    ioctl and normal read() and write() instead of the migration region.
> 
> - Pre-copy is made optional in v2 protocol. Support for pre-copy will be
>    added later on.
> 
> Detailed information about VFIO migration protocol v2 and its difference
> compared to v1 protocol can be found here [1].
> 
> [1]
> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>


LGTM,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Still a small issue below,

> ---
>   include/hw/vfio/vfio-common.h |   5 +
>   hw/vfio/common.c              |  19 +-
>   hw/vfio/migration.c           | 455 +++++++++++++++++++++++++++++++---
>   hw/vfio/trace-events          |   7 +
>   4 files changed, 447 insertions(+), 39 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index bbaf72ba00..2ec3346fea 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
>       int vm_running;
>       Notifier migration_state;
>       uint64_t pending_bytes;
> +    enum vfio_device_mig_state device_state;
> +    int data_fd;
> +    void *data_buffer;
> +    size_t data_buffer_size;
> +    bool v2;
>   } VFIOMigration;
>   
>   typedef struct VFIOAddressSpace {
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 550b2d7ded..dcaa77d2a8 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -355,10 +355,18 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>                   return false;
>               }
>   
> -            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
> +            if (!migration->v2 &&
> +                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
>                   (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
>                   return false;
>               }
> +
> +            if (migration->v2 &&
> +                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
> +                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
> +                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
> +                return false;
> +            }
>           }
>       }
>       return true;
> @@ -385,7 +393,14 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>                   return false;
>               }
>   
> -            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
> +            if (!migration->v2 &&
> +                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
> +                continue;
> +            }
> +
> +            if (migration->v2 &&
> +                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
> +                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
>                   continue;
>               } else {
>                   return false;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 9df859f4d3..08f53189fa 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -10,6 +10,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/main-loop.h"
>   #include "qemu/cutils.h"
> +#include "qemu/units.h"
>   #include <linux/vfio.h>
>   #include <sys/ioctl.h>
>   
> @@ -44,8 +45,103 @@
>   #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
>   #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
>   
> +/*
> + * This is an arbitrary size based on migration of mlx5 devices, where typically
> + * total device migration size is on the order of 100s of MB. Testing with
> + * larger values, e.g. 128MB and 1GB, did not show a performance improvement.
> + */
> +#define VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE (1 * MiB)
> +
>   static int64_t bytes_transferred;
>   
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
> +                                    enum vfio_device_mig_state recover_state)
> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                              sizeof(struct vfio_device_feature_mig_state),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> +    struct vfio_device_feature_mig_state *mig_state =
> +        (struct vfio_device_feature_mig_state *)feature->data;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags =
> +        VFIO_DEVICE_FEATURE_SET | VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE;
> +    mig_state->device_state = new_state;
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        /* Try to set the device in some good state */
> +        int err = -errno;
> +
> +        error_report(
> +            "%s: Failed setting device state to %s, err: %s. Setting device in recover state %s",
> +                     vbasedev->name, mig_state_to_str(new_state),
> +                     strerror(errno), mig_state_to_str(recover_state));
> +
> +        mig_state->device_state = recover_state;
> +        if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +            err = -errno;
> +            error_report(
> +                "%s: Failed setting device in recover state, err: %s. Resetting device",
> +                         vbasedev->name, strerror(errno));
> +
> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
> +                hw_error("%s: Failed resetting device, err: %s", vbasedev->name,
> +                         strerror(errno));
> +            }
> +
> +            migration->device_state = VFIO_DEVICE_STATE_RUNNING;
> +
> +            return err;
> +        }
> +
> +        migration->device_state = recover_state;
> +
> +        return err;
> +    }
> +
> +    migration->device_state = new_state;
> +    if (mig_state->data_fd != -1) {
> +        if (migration->data_fd != -1) {
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
> +        migration->data_fd = mig_state->data_fd;
> +    }
> +
> +    trace_vfio_migration_set_state(vbasedev->name, mig_state_to_str(new_state));
> +
> +    return 0;
> +}
> +
>   static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
>                                     off_t off, bool iswrite)
>   {
> @@ -260,6 +356,18 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
>       return ret;
>   }
>   
> +static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
> +                            uint64_t data_size)
> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +    int ret;
> +
> +    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
> +    trace_vfio_load_state_device_data(vbasedev->name, data_size, ret);
> +
> +    return ret;
> +}
> +
>   static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>                                  uint64_t data_size)
>   {
> @@ -394,6 +502,14 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>       return qemu_file_get_error(f);
>   }
>   
> +static void vfio_migration_cleanup(VFIODevice *vbasedev)
> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +
> +    close(migration->data_fd);
> +    migration->data_fd = -1;
> +}
> +
>   static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>   {
>       VFIOMigration *migration = vbasedev->migration;
> @@ -403,8 +519,80 @@ static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>       }
>   }
>   
> +static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
> +                                     uint64_t *stop_copy_size)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                              sizeof(struct vfio_device_feature_mig_data_size),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> +    struct vfio_device_feature_mig_data_size *mig_data_size =
> +        (struct vfio_device_feature_mig_data_size *)feature->data;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags =
> +        VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIG_DATA_SIZE;
> +
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        return -errno;
> +    }
> +
> +    *stop_copy_size = mig_data_size->stop_copy_length;
> +
> +    return 0;
> +}
> +
> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
> +{
> +    ssize_t data_size;
> +
> +    data_size = read(migration->data_fd, migration->data_buffer,
> +                     migration->data_buffer_size);
> +    if (data_size < 0) {
> +        return -errno;
> +    }
> +    if (data_size == 0) {
> +        return 1;
> +    }
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> +    qemu_put_be64(f, data_size);
> +    qemu_put_buffer(f, migration->data_buffer, data_size);
> +    bytes_transferred += data_size;
> +
> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
> +
> +    return qemu_file_get_error(f);
> +}
> +
>   /* ---------------------------------------------------------------------- */
>   
> +static int vfio_save_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +    uint64_t stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
> +
> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
> +    migration->data_buffer_size = MIN(VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE,
> +                                      stop_copy_size);
> +    migration->data_buffer = g_try_malloc0(migration->data_buffer_size);
> +    if (!migration->data_buffer) {
> +        error_report("%s: Failed to allocate migration data buffer",
> +                     vbasedev->name);
> +        return -ENOMEM;
> +    }
> +
> +    trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +
> +    return qemu_file_get_error(f);
> +}
> +
>   static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
> @@ -448,6 +636,17 @@ static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>       return 0;
>   }
>   
> +static void vfio_save_cleanup(void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +
> +    g_free(migration->data_buffer);
> +    migration->data_buffer = NULL;
> +    vfio_migration_cleanup(vbasedev);
> +    trace_vfio_save_cleanup(vbasedev->name);
> +}
> +
>   static void vfio_v1_save_cleanup(void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
> @@ -456,6 +655,31 @@ static void vfio_v1_save_cleanup(void *opaque)
>       trace_vfio_save_cleanup(vbasedev->name);
>   }
>   
> +/*
> + * Migration size of VFIO devices can be as little as a few KBs or as big as
> + * many GBs. This value should be big enough to cover the worst case.
> + */
> +#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
> +static void vfio_save_pending(void *opaque, uint64_t threshold_size,
> +                              uint64_t *res_precopy_only,
> +                              uint64_t *res_compatible,
> +                              uint64_t *res_postcopy_only)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
> +
> +    /*
> +     * If getting pending migration size fails, VFIO_MIG_STOP_COPY_SIZE is
> +     * reported so downtime limit won't be violated.
> +     */
> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
> +    *res_precopy_only += stop_copy_size;
> +
> +    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
> +                            *res_postcopy_only, *res_compatible,
> +                            stop_copy_size);
> +}
> +
>   static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
>                                    uint64_t *res_precopy_only,
>                                    uint64_t *res_compatible,
> @@ -523,6 +747,41 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
>       return 0;
>   }
>   
> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    enum vfio_device_mig_state recover_state;
> +    int ret;
> +
> +    /* We reach here with device state STOP only */
> +    recover_state = VFIO_DEVICE_STATE_STOP;
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
> +                                   recover_state);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    do {
> +        ret = vfio_save_block(f, vbasedev->migration);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    } while (!ret);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +    ret = qemu_file_get_error(f);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    recover_state = VFIO_DEVICE_STATE_ERROR;
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
> +                                   recover_state);
> +    trace_vfio_save_complete_precopy(vbasedev->name, ret);
> +
> +    return ret;
> +}
> +
>   static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
> @@ -592,6 +851,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>       }
>   }
>   
> +static int vfio_load_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
> +                                   vbasedev->migration->device_state);
> +}
> +
>   static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
> @@ -619,6 +886,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>       return ret;
>   }
>   
> +static int vfio_load_cleanup(void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    vfio_migration_cleanup(vbasedev);
> +    trace_vfio_load_cleanup(vbasedev->name);
> +
> +    return 0;
> +}
> +
>   static int vfio_v1_load_cleanup(void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
> @@ -661,7 +938,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>               uint64_t data_size = qemu_get_be64(f);
>   
>               if (data_size) {
> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
> +                if (vbasedev->migration->v2) {
> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
> +                } else {
> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
> +                }
>                   if (ret < 0) {
>                       return ret;
>                   }
> @@ -682,6 +963,17 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>       return ret;
>   }
>   
> +static const SaveVMHandlers savevm_vfio_handlers = {
> +    .save_setup = vfio_save_setup,
> +    .save_cleanup = vfio_save_cleanup,
> +    .save_live_pending = vfio_save_pending,
> +    .save_live_complete_precopy = vfio_save_complete_precopy,
> +    .save_state = vfio_save_state,
> +    .load_setup = vfio_load_setup,
> +    .load_cleanup = vfio_load_cleanup,
> +    .load_state = vfio_load_state,
> +};
> +
>   static SaveVMHandlers savevm_vfio_v1_handlers = {
>       .save_setup = vfio_v1_save_setup,
>       .save_cleanup = vfio_v1_save_cleanup,
> @@ -696,6 +988,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>   
>   /* ---------------------------------------------------------------------- */
>   
> +static void vfio_vmstate_change(void *opaque, bool running, RunState state)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    enum vfio_device_mig_state new_state;
> +    int ret;
> +
> +    if (running) {
> +        new_state = VFIO_DEVICE_STATE_RUNNING;
> +    } else {
> +        new_state = VFIO_DEVICE_STATE_STOP;
> +    }
> +
> +    ret = vfio_migration_set_state(vbasedev, new_state,
> +                                   VFIO_DEVICE_STATE_ERROR);
> +    if (ret) {
> +        /*
> +         * Migration should be aborted in this case, but vm_state_notify()
> +         * currently does not support reporting failures.
> +         */
> +        if (migrate_get_current()->to_dst_file) {
> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        }
> +    }
> +
> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
> +                              mig_state_to_str(new_state));
> +}
> +
>   static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>   {
>       VFIODevice *vbasedev = opaque;
> @@ -769,12 +1089,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>       case MIGRATION_STATUS_CANCELLED:
>       case MIGRATION_STATUS_FAILED:
>           bytes_transferred = 0;
> -        ret = vfio_migration_v1_set_state(vbasedev,
> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
> -        if (ret) {
> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +        if (migration->v2) {
> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
> +                                     VFIO_DEVICE_STATE_ERROR);
> +        } else {
> +            ret = vfio_migration_v1_set_state(vbasedev,
> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
> +            if (ret) {
> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +            }
>           }
>       }
>   }
> @@ -783,12 +1108,42 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>   {
>       VFIOMigration *migration = vbasedev->migration;
>   
> -    vfio_region_exit(&migration->region);
> -    vfio_region_finalize(&migration->region);
> +    if (!migration->v2) {
> +        vfio_region_exit(&migration->region);
> +        vfio_region_finalize(&migration->region);
> +    }
>       g_free(vbasedev->migration);
>       vbasedev->migration = NULL;
>   }
>   
> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                                  sizeof(struct vfio_device_feature_migration),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> +    struct vfio_device_feature_migration *mig =
> +        (struct vfio_device_feature_migration *)feature->data;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        if (errno == ENOTTY) {
> +            error_report("%s: VFIO migration is not supported in kernel",
> +                         vbasedev->name);
> +        } else {
> +            error_report("%s: Failed to query VFIO migration support, err: %s",
> +                         vbasedev->name, strerror(errno));
> +        }
> +
> +        return -errno;
> +    }
> +
> +    *mig_flags = mig->flags;
> +
> +    return 0;
> +}
> +
>   static int vfio_migration_init(VFIODevice *vbasedev)
>   {
>       int ret;
> @@ -797,6 +1152,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>       char id[256] = "";
>       g_autofree char *path = NULL, *oid = NULL;
>       struct vfio_region_info *info;
> +    uint64_t mig_flags;

GCC 12 reports :

   ../hw/vfio/migration.c: In function ‘vfio_migration_init’:
   ../hw/vfio/migration.c:1170:25: error: ‘mig_flags’ may be used uninitialized [-Werror=maybe-uninitialized]
    1170 |         if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
         |              ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../hw/vfio/migration.c:1155:14: note: ‘mig_flags’ was declared here
    1155 |     uint64_t mig_flags;
         |              ^~~~~~~~~
   cc1: all warnings being treated as errors

You will need a little fix for that. May be it can be done at merge time :

-    uint64_t mig_flags;
+    uint64_t mig_flags = 0;

Thanks,

C.

>   
>       if (!vbasedev->ops->vfio_get_object) {
>           return -EINVAL;
> @@ -807,34 +1163,50 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>           return -EINVAL;
>       }
>   
> -    ret = vfio_get_dev_region_info(vbasedev,
> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> -                                   &info);
> -    if (ret) {
> -        return ret;
> -    }
> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
> +    if (!ret) {
> +        /* Migration v2 */
> +        /* Basic migration functionality must be supported */
> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
> +            return -EOPNOTSUPP;
> +        }
> +        vbasedev->migration = g_new0(VFIOMigration, 1);
> +        vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
> +        vbasedev->migration->data_fd = -1;
> +        vbasedev->migration->v2 = true;
> +    } else if (ret == -ENOTTY) {
> +        /* Migration v1 */
> +        ret = vfio_get_dev_region_info(vbasedev,
> +                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> +                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> +                                       &info);
> +        if (ret) {
> +            return ret;
> +        }
>   
> -    vbasedev->migration = g_new0(VFIOMigration, 1);
> -    vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
> -    vbasedev->migration->vm_running = runstate_is_running();
> +        vbasedev->migration = g_new0(VFIOMigration, 1);
> +        vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
> +        vbasedev->migration->vm_running = runstate_is_running();
>   
> -    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
> -                            info->index, "migration");
> -    if (ret) {
> -        error_report("%s: Failed to setup VFIO migration region %d: %s",
> -                     vbasedev->name, info->index, strerror(-ret));
> -        goto err;
> -    }
> +        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
> +                                info->index, "migration");
> +        if (ret) {
> +            error_report("%s: Failed to setup VFIO migration region %d: %s",
> +                         vbasedev->name, info->index, strerror(-ret));
> +            goto err;
> +        }
>   
> -    if (!vbasedev->migration->region.size) {
> -        error_report("%s: Invalid zero-sized VFIO migration region %d",
> -                     vbasedev->name, info->index);
> -        ret = -EINVAL;
> -        goto err;
> -    }
> +        if (!vbasedev->migration->region.size) {
> +            error_report("%s: Invalid zero-sized VFIO migration region %d",
> +                         vbasedev->name, info->index);
> +            ret = -EINVAL;
> +            goto err;
> +        }
>   
> -    g_free(info);
> +        g_free(info);
> +    } else {
> +        return ret;
> +    }
>   
>       migration = vbasedev->migration;
>       migration->vbasedev = vbasedev;
> @@ -847,11 +1219,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>       }
>       strpadcpy(id, sizeof(id), path, '\0');
>   
> -    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> -                         &savevm_vfio_v1_handlers, vbasedev);
> +    if (migration->v2) {
> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                             &savevm_vfio_handlers, vbasedev);
> +
> +        migration->vm_state = qdev_add_vm_change_state_handler(
> +            vbasedev->dev, vfio_vmstate_change, vbasedev);
> +    } else {
> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                             &savevm_vfio_v1_handlers, vbasedev);
> +
> +        migration->vm_state = qdev_add_vm_change_state_handler(
> +            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
> +    }
>   
> -    migration->vm_state = qdev_add_vm_change_state_handler(
> -        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>       migration->migration_state.notify = vfio_migration_state_notifier;
>       add_migration_state_change_notifier(&migration->migration_state);
>       return 0;
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 9eb9aff295..e7b3b4658c 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -149,20 +149,27 @@ vfio_display_edid_write_error(void) ""
>   
>   # migration.c
>   vfio_migration_probe(const char *name) " (%s)"
> +vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
>   vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
> +vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
>   vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>   vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
> +vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
>   vfio_v1_save_setup(const char *name) " (%s)"
>   vfio_save_cleanup(const char *name) " (%s)"
>   vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
>   vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
>   vfio_save_device_config_state(const char *name) " (%s)"
> +vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible, uint64_t stopcopy_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64" stopcopy size 0x%"PRIx64
>   vfio_v1_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
>   vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
> +vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
>   vfio_v1_save_complete_precopy(const char *name) " (%s)"
>   vfio_load_device_config_state(const char *name) " (%s)"
>   vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
>   vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
> +vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
>   vfio_load_cleanup(const char *name) " (%s)"
>   vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
>   vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
> +vfio_save_block(const char *name, int data_size) " (%s) data_size %d"


