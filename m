Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811DF69FD4D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:00:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwC2-0002kU-1W; Wed, 22 Feb 2023 15:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUwBw-0002kC-H6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUwBt-0000jC-Ti
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677099496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAiEGJv8/FR+znOfw/+7eL9OoSl9Dy87a++16z4yd1Y=;
 b=cHgyST+PKJgxQ9X9FoT8mJ9pWJGs/X0LMaevZtPnuy4VKm9hqvqUMmYQ+PSMxN4ZYYslIx
 pa3gPWUqBg0+9c66N4Gtqh+YD43AigPUsTg0xOCMViCcHXVZ0U5bNIsAQMaZXQF5zkessf
 U0ecFlPpWFcVerPLTYG8UGPA9Cc7zyA=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352--7waxUoSODujIlOlnh640A-1; Wed, 22 Feb 2023 15:58:15 -0500
X-MC-Unique: -7waxUoSODujIlOlnh640A-1
Received: by mail-io1-f71.google.com with SMTP id
 p188-20020a6b8dc5000000b0074c96ca271bso1463765iod.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAiEGJv8/FR+znOfw/+7eL9OoSl9Dy87a++16z4yd1Y=;
 b=VNKRvSByc+6srGhoVs4t5jVtq3ro/YEkUQOCULsdiVJkTVTy7L1u/wHYNB+LiBAJPK
 Vs9GF3m0PJiDken5e3A1AyaKM8TGuR5AVDbzs7MTyiQo7a4/hT23/AijlfCQmJHhMGFG
 rezsAjVCDzrj1pU5AHO9hxeKhqC08QysxNvyys2XwEgjBKLS0cd8dXeIsUrtPAmAJlFe
 0la5o8j4PvgpSsafvYV6sVhEJTPNoTB2QXjp5+0NLw7o3ZXba3UluiaSdc2JYN5mD+PR
 R3Wi6fDITDPEQ+2lpLTmPWMB65cjUg57FChRqpsDUpsn7nhKJO9AVlXOtGtrMzpdxZrw
 lC6g==
X-Gm-Message-State: AO0yUKUOvxBi0+xAUOPbPGB4ET80jRYwg/s7XL5awnRCPKMWMa4+//n3
 CBdhRHSRt4L+DHfIVcs3GOL6qWsrjLM5RlJJm6csgtzD8MOsCByvBZmebwHVXVEw+/eaVm26snE
 BxXAb8bz42J4mhuk=
X-Received: by 2002:a05:6e02:b21:b0:313:ee3f:2b2b with SMTP id
 e1-20020a056e020b2100b00313ee3f2b2bmr7393058ilu.8.1677099494398; 
 Wed, 22 Feb 2023 12:58:14 -0800 (PST)
X-Google-Smtp-Source: AK7set8j0C2t2B2OCNiEwXt6irUGGIhtNgKEeolsFs6vNYYkcUiL+5VE7VyA2BOqt0cTnvmjSIsgRg==
X-Received: by 2002:a05:6e02:b21:b0:313:ee3f:2b2b with SMTP id
 e1-20020a056e020b2100b00313ee3f2b2bmr7393027ilu.8.1677099493974; 
 Wed, 22 Feb 2023 12:58:13 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 l21-20020a02a895000000b003a951542b10sm2357044jam.60.2023.02.22.12.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 12:58:13 -0800 (PST)
Date: Wed, 22 Feb 2023 13:58:11 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Jason Wang" <jasowang@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "David Hildenbrand"
 <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 03/20] vfio/migration: Add VFIO migration pre-copy
 support
Message-ID: <20230222135811.705b85b7.alex.williamson@redhat.com>
In-Reply-To: <20230222174915.5647-4-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-4-avihaih@nvidia.com>
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

On Wed, 22 Feb 2023 19:48:58 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Pre-copy support allows the VFIO device data to be transferred while the
> VM is running. This helps to accommodate VFIO devices that have a large
> amount of data that needs to be transferred, and it can reduce migration
> downtime.
> 
> Pre-copy support is optional in VFIO migration protocol v2.
> Implement pre-copy of VFIO migration protocol v2 and use it for devices
> that support it. Full description of it can be found here [1].
> 
> [1]
> https://lore.kernel.org/kvm/20221206083438.37807-3-yishaih@nvidia.com/
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  docs/devel/vfio-migration.rst |  35 +++++--
>  include/hw/vfio/vfio-common.h |   3 +
>  hw/vfio/common.c              |   6 +-
>  hw/vfio/migration.c           | 175 ++++++++++++++++++++++++++++++++--
>  hw/vfio/trace-events          |   4 +-
>  5 files changed, 201 insertions(+), 22 deletions(-)
> 
> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> index c214c73e28..ba80b9150d 100644
> --- a/docs/devel/vfio-migration.rst
> +++ b/docs/devel/vfio-migration.rst
> @@ -7,12 +7,14 @@ the guest is running on source host and restoring this saved state on the
>  destination host. This document details how saving and restoring of VFIO
>  devices is done in QEMU.
>  
> -Migration of VFIO devices currently consists of a single stop-and-copy phase.
> -During the stop-and-copy phase the guest is stopped and the entire VFIO device
> -data is transferred to the destination.
> -
> -The pre-copy phase of migration is currently not supported for VFIO devices.
> -Support for VFIO pre-copy will be added later on.
> +Migration of VFIO devices consists of two phases: the optional pre-copy phase,
> +and the stop-and-copy phase. The pre-copy phase is iterative and allows to
> +accommodate VFIO devices that have a large amount of data that needs to be
> +transferred. The iterative pre-copy phase of migration allows for the guest to
> +continue whilst the VFIO device state is transferred to the destination, this
> +helps to reduce the total downtime of the VM. VFIO devices can choose to skip
> +the pre-copy phase of migration by not reporting the VFIO_MIGRATION_PRE_COPY
> +flag in VFIO_DEVICE_FEATURE_MIGRATION ioctl.

Or alternatively for the last sentence,

  VFIO devices opt-in to pre-copy support by reporting the
  VFIO_MIGRATION_PRE_COPY flag in the VFIO_DEVICE_FEATURE_MIGRATION
  ioctl.


>  Note that currently VFIO migration is supported only for a single device. This
>  is due to VFIO migration's lack of P2P support. However, P2P support is planned
> @@ -29,10 +31,20 @@ VFIO implements the device hooks for the iterative approach as follows:
>  * A ``load_setup`` function that sets the VFIO device on the destination in
>    _RESUMING state.
>  
> +* A ``state_pending_estimate`` function that reports an estimate of the
> +  remaining pre-copy data that the vendor driver has yet to save for the VFIO
> +  device.
> +
>  * A ``state_pending_exact`` function that reads pending_bytes from the vendor
>    driver, which indicates the amount of data that the vendor driver has yet to
>    save for the VFIO device.
>  
> +* An ``is_active_iterate`` function that indicates ``save_live_iterate`` is
> +  active only when the VFIO device is in pre-copy states.
> +
> +* A ``save_live_iterate`` function that reads the VFIO device's data from the
> +  vendor driver during iterative pre-copy phase.
> +
>  * A ``save_state`` function to save the device config space if it is present.
>  
>  * A ``save_live_complete_precopy`` function that sets the VFIO device in
> @@ -95,8 +107,10 @@ Flow of state changes during Live migration
>  ===========================================
>  
>  Below is the flow of state change during live migration.
> -The values in the brackets represent the VM state, the migration state, and
> +The values in the parentheses represent the VM state, the migration state, and
>  the VFIO device state, respectively.
> +The text in the square brackets represents the flow if the VFIO device supports
> +pre-copy.
>  
>  Live migration save path
>  ------------------------
> @@ -108,11 +122,12 @@ Live migration save path
>                                    |
>                       migrate_init spawns migration_thread
>                  Migration thread then calls each device's .save_setup()
> -                       (RUNNING, _SETUP, _RUNNING)
> +                  (RUNNING, _SETUP, _RUNNING [_PRE_COPY])
>                                    |
> -                      (RUNNING, _ACTIVE, _RUNNING)
> -             If device is active, get pending_bytes by .state_pending_exact()
> +                  (RUNNING, _ACTIVE, _RUNNING [_PRE_COPY])
> +      If device is active, get pending_bytes by .state_pending_{estimate,exact}()
>            If total pending_bytes >= threshold_size, call .save_live_iterate()
> +                  [Data of VFIO device for pre-copy phase is copied]
>          Iterate till total pending bytes converge and are less than threshold
>                                    |
>    On migration completion, vCPU stops and calls .save_live_complete_precopy for
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 87524c64a4..ee55d442b4 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -66,6 +66,9 @@ typedef struct VFIOMigration {
>      int data_fd;
>      void *data_buffer;
>      size_t data_buffer_size;
> +    uint64_t precopy_init_size;
> +    uint64_t precopy_dirty_size;

size_t?

> +    uint64_t mig_flags;
>  } VFIOMigration;
>  
>  typedef struct VFIOAddressSpace {
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index bab83c0e55..6f5afe9f5a 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -409,7 +409,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>              }
>  
>              if (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF &&
> -                migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
> +                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
> +                 migration->device_state == VFIO_DEVICE_STATE_PRE_COPY)) {
>                  return false;
>              }
>          }
> @@ -438,7 +439,8 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>                  return false;
>              }
>  
> -            if (migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
> +            if (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
> +                migration->device_state == VFIO_DEVICE_STATE_PRE_COPY) {
>                  continue;
>              } else {
>                  return false;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 94a4df73d0..307983d57d 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -67,6 +67,8 @@ static const char *mig_state_to_str(enum vfio_device_mig_state state)
>          return "STOP_COPY";
>      case VFIO_DEVICE_STATE_RESUMING:
>          return "RESUMING";
> +    case VFIO_DEVICE_STATE_PRE_COPY:
> +        return "PRE_COPY";
>      default:
>          return "UNKNOWN STATE";
>      }
> @@ -240,6 +242,23 @@ static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
>      return 0;
>  }
>  
> +static int vfio_query_precopy_size(VFIOMigration *migration,
> +                                   uint64_t *init_size, uint64_t *dirty_size)

size_t?  Seems like a concern throughout.

> +{
> +    struct vfio_precopy_info precopy = {
> +        .argsz = sizeof(precopy),
> +    };
> +
> +    if (ioctl(migration->data_fd, VFIO_MIG_GET_PRECOPY_INFO, &precopy)) {
> +        return -errno;
> +    }
> +
> +    *init_size = precopy.initial_bytes;
> +    *dirty_size = precopy.dirty_bytes;
> +
> +    return 0;
> +}
> +
>  /* Returns the size of saved data on success and -errno on error */
>  static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>  {
> @@ -248,6 +267,11 @@ static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>      data_size = read(migration->data_fd, migration->data_buffer,
>                       migration->data_buffer_size);
>      if (data_size < 0) {
> +        /* Pre-copy emptied all the device state for now */
> +        if (errno == ENOMSG) {
> +            return 0;
> +        }
> +
>          return -errno;
>      }
>      if (data_size == 0) {
> @@ -264,6 +288,31 @@ static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>      return qemu_file_get_error(f) ?: data_size;
>  }
>  
> +static void vfio_update_estimated_pending_data(VFIOMigration *migration,
> +                                               uint64_t data_size)
> +{
> +    if (!data_size) {
> +        /*
> +         * Pre-copy emptied all the device state for now, update estimated sizes
> +         * accordingly.
> +         */
> +        migration->precopy_init_size = 0;
> +        migration->precopy_dirty_size = 0;
> +
> +        return;
> +    }
> +
> +    if (migration->precopy_init_size) {
> +        uint64_t init_size = MIN(migration->precopy_init_size, data_size);
> +
> +        migration->precopy_init_size -= init_size;
> +        data_size -= init_size;
> +    }
> +
> +    migration->precopy_dirty_size -= MIN(migration->precopy_dirty_size,
> +                                         data_size);
> +}
> +
>  /* ---------------------------------------------------------------------- */
>  
>  static int vfio_save_setup(QEMUFile *f, void *opaque)
> @@ -284,6 +333,35 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>          return -ENOMEM;
>      }
>  
> +    if (migration->mig_flags & VFIO_MIGRATION_PRE_COPY) {
> +        uint64_t init_size = 0, dirty_size = 0;
> +        int ret;
> +
> +        switch (migration->device_state) {
> +        case VFIO_DEVICE_STATE_RUNNING:
> +            ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_PRE_COPY,
> +                                           VFIO_DEVICE_STATE_RUNNING);
> +            if (ret) {
> +                return ret;
> +            }
> +
> +            vfio_query_precopy_size(migration, &init_size, &dirty_size);
> +            migration->precopy_init_size = init_size;
> +            migration->precopy_dirty_size = dirty_size;

Seems like we could do away with {init,dirty}_size, initialize
migration->precopy_{init,dirty}_size before the switch, pass them
directly to vfio_query_precopy_size() and remove all but the break from
the case below.  But then that also suggests we could redefine
vfio_query_precopy_size() to

static int vfio_update_precopy_info(VFIOMigration *migration)

which sets the fields directly since this is the only way it's used.

> +
> +            break;
> +        case VFIO_DEVICE_STATE_STOP:
> +            /* vfio_save_complete_precopy() will go to STOP_COPY */
> +
> +            migration->precopy_init_size = 0;
> +            migration->precopy_dirty_size = 0;
> +
> +            break;
> +        default:
> +            return -EINVAL;
> +        }
> +    }
> +
>      trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size);
>  
>      qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> @@ -302,23 +380,44 @@ static void vfio_save_cleanup(void *opaque)
>      trace_vfio_save_cleanup(vbasedev->name);
>  }
>  
> +static void vfio_state_pending_estimate(void *opaque, uint64_t threshold_size,
> +                                        uint64_t *must_precopy,
> +                                        uint64_t *can_postcopy)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +
> +    if (migration->device_state != VFIO_DEVICE_STATE_PRE_COPY) {
> +        return;
> +    }
> +
> +    /*
> +     * Initial size should be transferred during pre-copy phase so stop-copy
> +     * phase will not be slowed down. Report threshold_size to force another
> +     * pre-copy iteration.
> +     */
> +    *must_precopy += migration->precopy_init_size ?
> +                         threshold_size :
> +                         migration->precopy_dirty_size;

This sure feels like we're feeding false data back to the iterator to
spoof it to run another iteration, when the vfio migration protocol
only recommends that initial_bytes reaches zero before proceeding to
stop-copy, it's not a requirement.  What benefit is actually observed
from this?  Why is this required for initial pre-copy support?  It
seems devious.

> +
> +    trace_vfio_state_pending_estimate(vbasedev->name, *must_precopy,
> +                                      *can_postcopy,
> +                                      migration->precopy_init_size,
> +                                      migration->precopy_dirty_size);
> +}
> +
>  /*
>   * Migration size of VFIO devices can be as little as a few KBs or as big as
>   * many GBs. This value should be big enough to cover the worst case.
>   */
>  #define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
>  
> -/*
> - * Only exact function is implemented and not estimate function. The reason is
> - * that during pre-copy phase of migration the estimate function is called
> - * repeatedly while pending RAM size is over the threshold, thus migration
> - * can't converge and querying the VFIO device pending data size is useless.
> - */
>  static void vfio_state_pending_exact(void *opaque, uint64_t threshold_size,
>                                       uint64_t *must_precopy,
>                                       uint64_t *can_postcopy)
>  {
>      VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
>      uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
>  
>      /*
> @@ -328,8 +427,57 @@ static void vfio_state_pending_exact(void *opaque, uint64_t threshold_size,
>      vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
>      *must_precopy += stop_copy_size;
>  
> +    if (migration->device_state == VFIO_DEVICE_STATE_PRE_COPY) {
> +        uint64_t init_size = 0, dirty_size = 0;
> +
> +        vfio_query_precopy_size(migration, &init_size, &dirty_size);
> +        migration->precopy_init_size = init_size;
> +        migration->precopy_dirty_size = dirty_size;

This is the only other caller of vfio_query_precopy_size(), following
the same pattern that could be simplified if the function filled the
migration fields itself.

> +
> +        /*
> +         * Initial size should be transferred during pre-copy phase so
> +         * stop-copy phase will not be slowed down. Report threshold_size
> +         * to force another pre-copy iteration.
> +         */
> +        *must_precopy += migration->precopy_init_size ?
> +                             threshold_size :
> +                             migration->precopy_dirty_size;
> +    }

Just as sketchy as above.  Thanks,

Alex

> +
>      trace_vfio_state_pending_exact(vbasedev->name, *must_precopy, *can_postcopy,
> -                                   stop_copy_size);
> +                                   stop_copy_size, migration->precopy_init_size,
> +                                   migration->precopy_dirty_size);
> +}
> +
> +static bool vfio_is_active_iterate(void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +
> +    return migration->device_state == VFIO_DEVICE_STATE_PRE_COPY;
> +}
> +
> +static int vfio_save_iterate(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +    ssize_t data_size;
> +
> +    data_size = vfio_save_block(f, migration);
> +    if (data_size < 0) {
> +        return data_size;
> +    }
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +
> +    vfio_update_estimated_pending_data(migration, data_size);
> +
> +    trace_vfio_save_iterate(vbasedev->name);
> +
> +    /*
> +     * A VFIO device's pre-copy dirty_bytes is not guaranteed to reach zero.
> +     * Return 1 so following handlers will not be potentially blocked.
> +     */
> +    return 1;
>  }
>  
>  static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> @@ -338,7 +486,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>      ssize_t data_size;
>      int ret;
>  
> -    /* We reach here with device state STOP only */
> +    /* We reach here with device state STOP or STOP_COPY only */
>      ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
>                                     VFIO_DEVICE_STATE_STOP);
>      if (ret) {
> @@ -457,7 +605,10 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>  static const SaveVMHandlers savevm_vfio_handlers = {
>      .save_setup = vfio_save_setup,
>      .save_cleanup = vfio_save_cleanup,
> +    .state_pending_estimate = vfio_state_pending_estimate,
>      .state_pending_exact = vfio_state_pending_exact,
> +    .is_active_iterate = vfio_is_active_iterate,
> +    .save_live_iterate = vfio_save_iterate,
>      .save_live_complete_precopy = vfio_save_complete_precopy,
>      .save_state = vfio_save_state,
>      .load_setup = vfio_load_setup,
> @@ -470,13 +621,18 @@ static const SaveVMHandlers savevm_vfio_handlers = {
>  static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>  {
>      VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
>      enum vfio_device_mig_state new_state;
>      int ret;
>  
>      if (running) {
>          new_state = VFIO_DEVICE_STATE_RUNNING;
>      } else {
> -        new_state = VFIO_DEVICE_STATE_STOP;
> +        new_state =
> +            (migration->device_state == VFIO_DEVICE_STATE_PRE_COPY &&
> +             (state == RUN_STATE_FINISH_MIGRATE || state == RUN_STATE_PAUSED)) ?
> +                VFIO_DEVICE_STATE_STOP_COPY :
> +                VFIO_DEVICE_STATE_STOP;
>      }
>  
>      /*
> @@ -590,6 +746,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      migration->vbasedev = vbasedev;
>      migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>      migration->data_fd = -1;
> +    migration->mig_flags = mig_flags;
>  
>      oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
>      if (oid) {
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 669d9fe07c..51613e02e6 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -161,6 +161,8 @@ vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
>  vfio_save_cleanup(const char *name) " (%s)"
>  vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
>  vfio_save_device_config_state(const char *name) " (%s)"
> +vfio_save_iterate(const char *name) " (%s)"
>  vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
> -vfio_state_pending_exact(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t stopcopy_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" stopcopy size 0x%"PRIx64
> +vfio_state_pending_estimate(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t precopy_init_size, uint64_t precopy_dirty_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" precopy initial size 0x%"PRIx64" precopy dirty size 0x%"PRIx64
> +vfio_state_pending_exact(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t stopcopy_size, uint64_t precopy_init_size, uint64_t precopy_dirty_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" stopcopy size 0x%"PRIx64" precopy initial size 0x%"PRIx64" precopy dirty size 0x%"PRIx64
>  vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"


