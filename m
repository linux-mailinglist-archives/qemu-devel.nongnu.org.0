Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7DB5BC5F1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 12:02:24 +0200 (CEST)
Received: from localhost ([::1]:49004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaDbb-00087M-AE
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 06:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaDHD-0003lN-Iv
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 05:41:19 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaDHA-0006TE-HW
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 05:41:19 -0400
Received: by mail-vs1-f42.google.com with SMTP id 67so29313301vsv.2
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 02:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=qVK4jHJ4cxXebqNLUr8uxMe6ACRrt6h42nE2JcteiyE=;
 b=vQMk3gQRbEf908/L6uoVbXtq/KIBw0lELLbzfeazDHO1QwBuO8BYfbGft0xVb3ecj5
 eiItXaFOMwJkDajfxibg1A0ZvCqvDrskS8DDhdA9vkEcSbiBqEgUigZczw5Zw1PRwVmZ
 +N9JIeDkQTcGztj7V+CMvgvYTd7doAledmo/9yaSJWyYeZlMQFUkGflvLsOgQIiS7UDf
 EjE2SSYwTuf/D/+e7wjTwkBROYm49VSBLTAMK8hIXLsnh0753OJL40cMZOAlpJ/+pEGV
 InOg24qIiS2SKZSpT3mtWvaZOAKqsM2hr+wt9uoIrFSxT21JAhKjXEn+Ca1zCoSsnjXy
 rlaQ==
X-Gm-Message-State: ACrzQf2YounKnKHp9mVny7LEMXZjMSeEXh+tbhQmwDii6YyJLJfDBEBj
 eVhOgID71FxrYkhxG1IWdhaQCh8RuqF0NXSLPSc=
X-Google-Smtp-Source: AMsMyM7P5tPpt/PS7YAGfdevkd6Rjzc3M/bK4jaoNhVi+oVICLmWww36PSS4Cw775oEJMVWIyDO0CMBEsQ5wDdgkjt8=
X-Received: by 2002:a67:e085:0:b0:398:30a7:3be5 with SMTP id
 f5-20020a67e085000000b0039830a73be5mr5628174vsl.45.1663580474178; Mon, 19 Sep
 2022 02:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-9-avihaih@nvidia.com>
In-Reply-To: <20220530170739.19072-9-avihaih@nvidia.com>
Date: Mon, 19 Sep 2022 11:41:02 +0200
Message-ID: <CAAdtpL46c+wfZMHSOTQq-D96GJv+2ZtHrN1h-nbw8KzCtYREyg@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] vfio/migration: Remove VFIO migration protocol v1
To: Avihai Horon <avihaih@nvidia.com>, 
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, 
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, 
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, 
 Tarun Gupta <targupta@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.217.42;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f42.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Mon, May 30, 2022 at 7:56 PM Avihai Horon <avihaih@nvidia.com> wrote:
>
> Now that v2 protocol implementation has been added, remove the
> deprecated v1 implementation.

Worth a note in docs/about/deprecated.rst?

> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/common.c              |  19 +-
>  hw/vfio/migration.c           | 698 +---------------------------------
>  hw/vfio/trace-events          |   5 -
>  include/hw/vfio/vfio-common.h |   5 -
>  4 files changed, 24 insertions(+), 703 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 5541133ec9..00c6cb0ffe 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -355,14 +355,7 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>                  return false;
>              }
>
> -            if (!migration->v2 &&
> -                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
> -                (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
> -                return false;
> -            }
> -
> -            if (migration->v2 &&
> -                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
> +            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
>                  (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
>                   migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
>                  return false;
> @@ -393,14 +386,8 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>                  return false;
>              }
>
> -            if (!migration->v2 &&
> -                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
> -                continue;
> -            }
> -
> -            if (migration->v2 &&
> -                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
> -                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
> +            if (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
> +                migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P) {
>                  continue;
>              } else {
>                  return false;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index de68eadb09..852759e6ca 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -121,220 +121,6 @@ static int vfio_migration_set_state(VFIODevice *vbasedev,
>      return 0;
>  }
>
> -static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
> -                                  off_t off, bool iswrite)
> -{
> -    int ret;
> -
> -    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
> -                    pread(vbasedev->fd, val, count, off);
> -    if (ret < count) {
> -        error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
> -                     HWADDR_PRIx", err: %s", iswrite ? "write" : "read", count,
> -                     vbasedev->name, off, strerror(errno));
> -        return (ret < 0) ? ret : -EINVAL;
> -    }
> -    return 0;
> -}
> -
> -static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
> -                       off_t off, bool iswrite)
> -{
> -    int ret, done = 0;
> -    __u8 *tbuf = buf;
> -
> -    while (count) {
> -        int bytes = 0;
> -
> -        if (count >= 8 && !(off % 8)) {
> -            bytes = 8;
> -        } else if (count >= 4 && !(off % 4)) {
> -            bytes = 4;
> -        } else if (count >= 2 && !(off % 2)) {
> -            bytes = 2;
> -        } else {
> -            bytes = 1;
> -        }
> -
> -        ret = vfio_mig_access(vbasedev, tbuf, bytes, off, iswrite);
> -        if (ret) {
> -            return ret;
> -        }
> -
> -        count -= bytes;
> -        done += bytes;
> -        off += bytes;
> -        tbuf += bytes;
> -    }
> -    return done;
> -}
> -
> -#define vfio_mig_read(f, v, c, o)       vfio_mig_rw(f, (__u8 *)v, c, o, false)
> -#define vfio_mig_write(f, v, c, o)      vfio_mig_rw(f, (__u8 *)v, c, o, true)
> -
> -#define VFIO_MIG_STRUCT_OFFSET(f)       \
> -                                 offsetof(struct vfio_device_migration_info, f)
> -/*
> - * Change the device_state register for device @vbasedev. Bits set in @mask
> - * are preserved, bits set in @value are set, and bits not set in either @mask
> - * or @value are cleared in device_state. If the register cannot be accessed,
> - * the resulting state would be invalid, or the device enters an error state,
> - * an error is returned.
> - */
> -
> -static int vfio_migration_v1_set_state(VFIODevice *vbasedev, uint32_t mask,
> -                                       uint32_t value)
> -{
> -    VFIOMigration *migration = vbasedev->migration;
> -    VFIORegion *region = &migration->region;
> -    off_t dev_state_off = region->fd_offset +
> -                          VFIO_MIG_STRUCT_OFFSET(device_state);
> -    uint32_t device_state;
> -    int ret;
> -
> -    ret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
> -                        dev_state_off);
> -    if (ret < 0) {
> -        return ret;
> -    }
> -
> -    device_state = (device_state & mask) | value;
> -
> -    if (!VFIO_DEVICE_STATE_VALID(device_state)) {
> -        return -EINVAL;
> -    }
> -
> -    ret = vfio_mig_write(vbasedev, &device_state, sizeof(device_state),
> -                         dev_state_off);
> -    if (ret < 0) {
> -        int rret;
> -
> -        rret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
> -                             dev_state_off);
> -
> -        if ((rret < 0) || (VFIO_DEVICE_STATE_IS_ERROR(device_state))) {
> -            hw_error("%s: Device in error state 0x%x", vbasedev->name,
> -                     device_state);
> -            return rret ? rret : -EIO;
> -        }
> -        return ret;
> -    }
> -
> -    migration->device_state_v1 = device_state;
> -    trace_vfio_migration_set_state(vbasedev->name, device_state);
> -    return 0;
> -}
> -
> -static void *get_data_section_size(VFIORegion *region, uint64_t data_offset,
> -                                   uint64_t data_size, uint64_t *size)
> -{
> -    void *ptr = NULL;
> -    uint64_t limit = 0;
> -    int i;
> -
> -    if (!region->mmaps) {
> -        if (size) {
> -            *size = MIN(data_size, region->size - data_offset);
> -        }
> -        return ptr;
> -    }
> -
> -    for (i = 0; i < region->nr_mmaps; i++) {
> -        VFIOMmap *map = region->mmaps + i;
> -
> -        if ((data_offset >= map->offset) &&
> -            (data_offset < map->offset + map->size)) {
> -
> -            /* check if data_offset is within sparse mmap areas */
> -            ptr = map->mmap + data_offset - map->offset;
> -            if (size) {
> -                *size = MIN(data_size, map->offset + map->size - data_offset);
> -            }
> -            break;
> -        } else if ((data_offset < map->offset) &&
> -                   (!limit || limit > map->offset)) {
> -            /*
> -             * data_offset is not within sparse mmap areas, find size of
> -             * non-mapped area. Check through all list since region->mmaps list
> -             * is not sorted.
> -             */
> -            limit = map->offset;
> -        }
> -    }
> -
> -    if (!ptr && size) {
> -        *size = limit ? MIN(data_size, limit - data_offset) : data_size;
> -    }
> -    return ptr;
> -}
> -
> -static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
> -{
> -    VFIOMigration *migration = vbasedev->migration;
> -    VFIORegion *region = &migration->region;
> -    uint64_t data_offset = 0, data_size = 0, sz;
> -    int ret;
> -
> -    ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
> -                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
> -    if (ret < 0) {
> -        return ret;
> -    }
> -
> -    ret = vfio_mig_read(vbasedev, &data_size, sizeof(data_size),
> -                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
> -    if (ret < 0) {
> -        return ret;
> -    }
> -
> -    trace_vfio_save_buffer(vbasedev->name, data_offset, data_size,
> -                           migration->pending_bytes);
> -
> -    qemu_put_be64(f, data_size);
> -    sz = data_size;
> -
> -    while (sz) {
> -        void *buf;
> -        uint64_t sec_size;
> -        bool buf_allocated = false;
> -
> -        buf = get_data_section_size(region, data_offset, sz, &sec_size);
> -
> -        if (!buf) {
> -            buf = g_try_malloc(sec_size);
> -            if (!buf) {
> -                error_report("%s: Error allocating buffer ", __func__);
> -                return -ENOMEM;
> -            }
> -            buf_allocated = true;
> -
> -            ret = vfio_mig_read(vbasedev, buf, sec_size,
> -                                region->fd_offset + data_offset);
> -            if (ret < 0) {
> -                g_free(buf);
> -                return ret;
> -            }
> -        }
> -
> -        qemu_put_buffer(f, buf, sec_size);
> -
> -        if (buf_allocated) {
> -            g_free(buf);
> -        }
> -        sz -= sec_size;
> -        data_offset += sec_size;
> -    }
> -
> -    ret = qemu_file_get_error(f);
> -
> -    if (!ret && size) {
> -        *size = data_size;
> -    }
> -
> -    bytes_transferred += data_size;
> -    return ret;
> -}
> -
>  static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>                              uint64_t data_size)
>  {
> @@ -351,96 +137,6 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>      return 0;
>  }
>
> -static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
> -                               uint64_t data_size)
> -{
> -    VFIORegion *region = &vbasedev->migration->region;
> -    uint64_t data_offset = 0, size, report_size;
> -    int ret;
> -
> -    do {
> -        ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
> -                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
> -        if (ret < 0) {
> -            return ret;
> -        }
> -
> -        if (data_offset + data_size > region->size) {
> -            /*
> -             * If data_size is greater than the data section of migration region
> -             * then iterate the write buffer operation. This case can occur if
> -             * size of migration region at destination is smaller than size of
> -             * migration region at source.
> -             */
> -            report_size = size = region->size - data_offset;
> -            data_size -= size;
> -        } else {
> -            report_size = size = data_size;
> -            data_size = 0;
> -        }
> -
> -        trace_vfio_v1_load_state_device_data(vbasedev->name, data_offset, size);
> -
> -        while (size) {
> -            void *buf;
> -            uint64_t sec_size;
> -            bool buf_alloc = false;
> -
> -            buf = get_data_section_size(region, data_offset, size, &sec_size);
> -
> -            if (!buf) {
> -                buf = g_try_malloc(sec_size);
> -                if (!buf) {
> -                    error_report("%s: Error allocating buffer ", __func__);
> -                    return -ENOMEM;
> -                }
> -                buf_alloc = true;
> -            }
> -
> -            qemu_get_buffer(f, buf, sec_size);
> -
> -            if (buf_alloc) {
> -                ret = vfio_mig_write(vbasedev, buf, sec_size,
> -                        region->fd_offset + data_offset);
> -                g_free(buf);
> -
> -                if (ret < 0) {
> -                    return ret;
> -                }
> -            }
> -            size -= sec_size;
> -            data_offset += sec_size;
> -        }
> -
> -        ret = vfio_mig_write(vbasedev, &report_size, sizeof(report_size),
> -                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
> -        if (ret < 0) {
> -            return ret;
> -        }
> -    } while (data_size);
> -
> -    return 0;
> -}
> -
> -static int vfio_update_pending(VFIODevice *vbasedev)
> -{
> -    VFIOMigration *migration = vbasedev->migration;
> -    VFIORegion *region = &migration->region;
> -    uint64_t pending_bytes = 0;
> -    int ret;
> -
> -    ret = vfio_mig_read(vbasedev, &pending_bytes, sizeof(pending_bytes),
> -                    region->fd_offset + VFIO_MIG_STRUCT_OFFSET(pending_bytes));
> -    if (ret < 0) {
> -        migration->pending_bytes = 0;
> -        return ret;
> -    }
> -
> -    migration->pending_bytes = pending_bytes;
> -    trace_vfio_update_pending(vbasedev->name, pending_bytes);
> -    return 0;
> -}
> -
>  static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -493,15 +189,6 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
>      migration->data_fd = -1;
>  }
>
> -static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
> -{
> -    VFIOMigration *migration = vbasedev->migration;
> -
> -    if (migration->region.mmaps) {
> -        vfio_region_unmap(&migration->region);
> -    }
> -}
> -
>  /* ---------------------------------------------------------------------- */
>
>  static int vfio_save_setup(QEMUFile *f, void *opaque)
> @@ -516,49 +203,6 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>      return qemu_file_get_error(f);
>  }
>
> -static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
> -{
> -    VFIODevice *vbasedev = opaque;
> -    VFIOMigration *migration = vbasedev->migration;
> -    int ret;
> -
> -    trace_vfio_save_setup(vbasedev->name);
> -
> -    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
> -
> -    if (migration->region.mmaps) {
> -        /*
> -         * Calling vfio_region_mmap() from migration thread. Memory API called
> -         * from this function require locking the iothread when called from
> -         * outside the main loop thread.
> -         */
> -        qemu_mutex_lock_iothread();
> -        ret = vfio_region_mmap(&migration->region);
> -        qemu_mutex_unlock_iothread();
> -        if (ret) {
> -            error_report("%s: Failed to mmap VFIO migration region: %s",
> -                         vbasedev->name, strerror(-ret));
> -            error_report("%s: Falling back to slow path", vbasedev->name);
> -        }
> -    }
> -
> -    ret = vfio_migration_v1_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
> -                                      VFIO_DEVICE_STATE_V1_SAVING);
> -    if (ret) {
> -        error_report("%s: Failed to set state SAVING", vbasedev->name);
> -        return ret;
> -    }
> -
> -    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> -
> -    ret = qemu_file_get_error(f);
> -    if (ret) {
> -        return ret;
> -    }
> -
> -    return 0;
> -}
> -
>  static void vfio_save_cleanup(void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -567,82 +211,6 @@ static void vfio_save_cleanup(void *opaque)
>      trace_vfio_save_cleanup(vbasedev->name);
>  }
>
> -static void vfio_v1_save_cleanup(void *opaque)
> -{
> -    VFIODevice *vbasedev = opaque;
> -
> -    vfio_migration_v1_cleanup(vbasedev);
> -    trace_vfio_save_cleanup(vbasedev->name);
> -}
> -
> -static void vfio_save_pending(QEMUFile *f, void *opaque,
> -                              uint64_t threshold_size,
> -                              uint64_t *res_precopy_only,
> -                              uint64_t *res_compatible,
> -                              uint64_t *res_postcopy_only)
> -{
> -    VFIODevice *vbasedev = opaque;
> -    VFIOMigration *migration = vbasedev->migration;
> -    int ret;
> -
> -    ret = vfio_update_pending(vbasedev);
> -    if (ret) {
> -        return;
> -    }
> -
> -    *res_precopy_only += migration->pending_bytes;
> -
> -    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
> -                            *res_postcopy_only, *res_compatible);
> -}
> -
> -static int vfio_save_iterate(QEMUFile *f, void *opaque)
> -{
> -    VFIODevice *vbasedev = opaque;
> -    VFIOMigration *migration = vbasedev->migration;
> -    uint64_t data_size;
> -    int ret;
> -
> -    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> -
> -    if (migration->pending_bytes == 0) {
> -        ret = vfio_update_pending(vbasedev);
> -        if (ret) {
> -            return ret;
> -        }
> -
> -        if (migration->pending_bytes == 0) {
> -            qemu_put_be64(f, 0);
> -            qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> -            /* indicates data finished, goto complete phase */
> -            return 1;
> -        }
> -    }
> -
> -    ret = vfio_save_buffer(f, vbasedev, &data_size);
> -    if (ret) {
> -        error_report("%s: vfio_save_buffer failed %s", vbasedev->name,
> -                     strerror(errno));
> -        return ret;
> -    }
> -
> -    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> -
> -    ret = qemu_file_get_error(f);
> -    if (ret) {
> -        return ret;
> -    }
> -
> -    /*
> -     * Reset pending_bytes as .save_live_pending is not called during savevm or
> -     * snapshot case, in such case vfio_update_pending() at the start of this
> -     * function updates pending_bytes.
> -     */
> -    migration->pending_bytes = 0;
> -    trace_vfio_save_iterate(vbasedev->name, data_size);
> -    return 0;
> -}
> -
>  /* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
>  static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>  {
> @@ -706,62 +274,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>      return 0;
>  }
>
> -static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
> -{
> -    VFIODevice *vbasedev = opaque;
> -    VFIOMigration *migration = vbasedev->migration;
> -    uint64_t data_size;
> -    int ret;
> -
> -    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
> -                                      VFIO_DEVICE_STATE_V1_SAVING);
> -    if (ret) {
> -        error_report("%s: Failed to set state STOP and SAVING",
> -                     vbasedev->name);
> -        return ret;
> -    }
> -
> -    ret = vfio_update_pending(vbasedev);
> -    if (ret) {
> -        return ret;
> -    }
> -
> -    while (migration->pending_bytes > 0) {
> -        qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> -        ret = vfio_save_buffer(f, vbasedev, &data_size);
> -        if (ret < 0) {
> -            error_report("%s: Failed to save buffer", vbasedev->name);
> -            return ret;
> -        }
> -
> -        if (data_size == 0) {
> -            break;
> -        }
> -
> -        ret = vfio_update_pending(vbasedev);
> -        if (ret) {
> -            return ret;
> -        }
> -    }
> -
> -    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> -
> -    ret = qemu_file_get_error(f);
> -    if (ret) {
> -        return ret;
> -    }
> -
> -    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
> -                                      0);
> -    if (ret) {
> -        error_report("%s: Failed to set state STOPPED", vbasedev->name);
> -        return ret;
> -    }
> -
> -    trace_vfio_save_complete_precopy(vbasedev->name);
> -    return ret;
> -}
> -
>  static void vfio_save_state(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -783,33 +295,6 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
>                                     vbasedev->migration->device_state);
>  }
>
> -static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
> -{
> -    VFIODevice *vbasedev = opaque;
> -    VFIOMigration *migration = vbasedev->migration;
> -    int ret = 0;
> -
> -    if (migration->region.mmaps) {
> -        ret = vfio_region_mmap(&migration->region);
> -        if (ret) {
> -            error_report("%s: Failed to mmap VFIO migration region %d: %s",
> -                         vbasedev->name, migration->region.nr,
> -                         strerror(-ret));
> -            error_report("%s: Falling back to slow path", vbasedev->name);
> -        }
> -    }
> -
> -    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
> -                                      VFIO_DEVICE_STATE_V1_RESUMING);
> -    if (ret) {
> -        error_report("%s: Failed to set state RESUMING", vbasedev->name);
> -        if (migration->region.mmaps) {
> -            vfio_region_unmap(&migration->region);
> -        }
> -    }
> -    return ret;
> -}
> -
>  static int vfio_load_cleanup(void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -819,15 +304,6 @@ static int vfio_load_cleanup(void *opaque)
>      return 0;
>  }
>
> -static int vfio_v1_load_cleanup(void *opaque)
> -{
> -    VFIODevice *vbasedev = opaque;
> -
> -    vfio_migration_v1_cleanup(vbasedev);
> -    trace_vfio_load_cleanup(vbasedev->name);
> -    return 0;
> -}
> -
>  static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -861,11 +337,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>              uint64_t data_size = qemu_get_be64(f);
>
>              if (data_size) {
> -                if (vbasedev->migration->v2) {
> -                    ret = vfio_load_buffer(f, vbasedev, data_size);
> -                } else {
> -                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
> -                }
> +                ret = vfio_load_buffer(f, vbasedev, data_size);
>                  if (ret < 0) {
>                      return ret;
>                  }
> @@ -896,18 +368,6 @@ static SaveVMHandlers savevm_vfio_handlers = {
>      .load_state = vfio_load_state,
>  };
>
> -static SaveVMHandlers savevm_vfio_v1_handlers = {
> -    .save_setup = vfio_v1_save_setup,
> -    .save_cleanup = vfio_v1_save_cleanup,
> -    .save_live_pending = vfio_save_pending,
> -    .save_live_iterate = vfio_save_iterate,
> -    .save_live_complete_precopy = vfio_v1_save_complete_precopy,
> -    .save_state = vfio_save_state,
> -    .load_setup = vfio_v1_load_setup,
> -    .load_cleanup = vfio_v1_load_cleanup,
> -    .load_state = vfio_load_state,
> -};
> -
>  /* ---------------------------------------------------------------------- */
>
>  static void vfio_vmstate_change(void *opaque, bool running, RunState state)
> @@ -938,70 +398,12 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>                                new_state);
>  }
>
> -static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
> -{
> -    VFIODevice *vbasedev = opaque;
> -    VFIOMigration *migration = vbasedev->migration;
> -    uint32_t value, mask;
> -    int ret;
> -
> -    if (vbasedev->migration->vm_running == running) {
> -        return;
> -    }
> -
> -    if (running) {
> -        /*
> -         * Here device state can have one of _SAVING, _RESUMING or _STOP bit.
> -         * Transition from _SAVING to _RUNNING can happen if there is migration
> -         * failure, in that case clear _SAVING bit.
> -         * Transition from _RESUMING to _RUNNING occurs during resuming
> -         * phase, in that case clear _RESUMING bit.
> -         * In both the above cases, set _RUNNING bit.
> -         */
> -        mask = ~VFIO_DEVICE_STATE_MASK;
> -        value = VFIO_DEVICE_STATE_V1_RUNNING;
> -    } else {
> -        /*
> -         * Here device state could be either _RUNNING or _SAVING|_RUNNING. Reset
> -         * _RUNNING bit
> -         */
> -        mask = ~VFIO_DEVICE_STATE_V1_RUNNING;
> -
> -        /*
> -         * When VM state transition to stop for savevm command, device should
> -         * start saving data.
> -         */
> -        if (state == RUN_STATE_SAVE_VM) {
> -            value = VFIO_DEVICE_STATE_V1_SAVING;
> -        } else {
> -            value = 0;
> -        }
> -    }
> -
> -    ret = vfio_migration_v1_set_state(vbasedev, mask, value);
> -    if (ret) {
> -        /*
> -         * Migration should be aborted in this case, but vm_state_notify()
> -         * currently does not support reporting failures.
> -         */
> -        error_report("%s: Failed to set device state 0x%x", vbasedev->name,
> -                     (migration->device_state_v1 & mask) | value);
> -        if (migrate_get_current()->to_dst_file) {
> -            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> -        }
> -    }
> -    vbasedev->migration->vm_running = running;
> -    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
> -            (migration->device_state_v1 & mask) | value);
> -}
> -
>  static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>  {
>      MigrationState *s = data;
>      VFIOMigration *migration = container_of(notifier, VFIOMigration,
>                                              migration_state);
>      VFIODevice *vbasedev = migration->vbasedev;
> -    int ret;
>
>      trace_vfio_migration_state_notifier(vbasedev->name,
>                                          MigrationStatus_str(s->state));
> @@ -1011,31 +413,14 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>      case MIGRATION_STATUS_CANCELLED:
>      case MIGRATION_STATUS_FAILED:
>          bytes_transferred = 0;
> -        if (migration->v2) {
> -            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
> -                                     VFIO_DEVICE_STATE_ERROR);
> -        } else {
> -            ret = vfio_migration_v1_set_state(vbasedev,
> -                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
> -                                                VFIO_DEVICE_STATE_V1_RESUMING),
> -                                              VFIO_DEVICE_STATE_V1_RUNNING);
> -            if (ret) {
> -                error_report("%s: Failed to set state RUNNING", vbasedev->name);
> -            }
> -        }
> +        vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
> +                                 VFIO_DEVICE_STATE_ERROR);
>      }
>  }
>
>  static void vfio_migration_exit(VFIODevice *vbasedev)
>  {
> -    VFIOMigration *migration = vbasedev->migration;
> -
> -    if (migration->v2) {
> -        g_free(migration->data_buffer);
> -    } else {
> -        vfio_region_exit(&migration->region);
> -        vfio_region_finalize(&migration->region);
> -    }
> +    g_free(vbasedev->migration->data_buffer);
>      g_free(vbasedev->migration);
>      vbasedev->migration = NULL;
>  }
> @@ -1066,7 +451,6 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      VFIOMigration *migration;
>      char id[256] = "";
>      g_autofree char *path = NULL, *oid = NULL;
> -    struct vfio_region_info *info = NULL;
>      uint64_t mig_flags;
>
>      if (!vbasedev->ops->vfio_get_object) {
> @@ -1079,48 +463,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      }
>
>      ret = vfio_migration_query_flags(vbasedev, &mig_flags);
> -    if (!ret) {
> -        /* Migration v2 */
> -        /* Basic migration functionality must be supported */
> -        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
> -            return -EOPNOTSUPP;
> -        }
> -        vbasedev->migration = g_new0(VFIOMigration, 1);
> -        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
> -        vbasedev->migration->data_buffer =
> -            g_malloc0(vbasedev->migration->data_buffer_size);
> -        vbasedev->migration->data_fd = -1;
> -        vbasedev->migration->v2 = true;
> -    } else {
> -        /* Migration v1 */
> -        ret = vfio_get_dev_region_info(vbasedev,
> -                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> -                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> -                                       &info);
> -        if (ret) {
> -            return ret;
> -        }
> -
> -        vbasedev->migration = g_new0(VFIOMigration, 1);
> -
> -        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
> -                                info->index, "migration");
> -        if (ret) {
> -            error_report("%s: Failed to setup VFIO migration region %d: %s",
> -                         vbasedev->name, info->index, strerror(-ret));
> -            goto err;
> -        }
> -
> -        if (!vbasedev->migration->region.size) {
> -            error_report("%s: Invalid zero-sized VFIO migration region %d",
> -                         vbasedev->name, info->index);
> -            ret = -EINVAL;
> -            goto err;
> -        }
> +    if (ret) {
> +        return ret;
> +    }
>
> -        g_free(info);
> +    /* Basic migration functionality must be supported */
> +    if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
> +        return -EOPNOTSUPP;
>      }
>
> +    vbasedev->migration = g_new0(VFIOMigration, 1);
> +    vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
> +    vbasedev->migration->data_buffer =
> +        g_malloc0(vbasedev->migration->data_buffer_size);
> +    vbasedev->migration->data_fd = -1;
>      migration = vbasedev->migration;
>      migration->vbasedev = vbasedev;
>
> @@ -1132,28 +488,16 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      }
>      strpadcpy(id, sizeof(id), path, '\0');
>
> -    if (migration->v2) {
> -        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> -                             &savevm_vfio_handlers, vbasedev);
> -
> -        migration->vm_state = qdev_add_vm_change_state_handler(
> -            vbasedev->dev, vfio_vmstate_change, vbasedev);
> -    } else {
> -        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> -                             &savevm_vfio_v1_handlers, vbasedev);
> -
> -        migration->vm_state = qdev_add_vm_change_state_handler(
> -            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
> -    }
> +    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
> +                         vbasedev);
>
> +    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
> +                                                           vfio_vmstate_change,
> +                                                           vbasedev);
>      migration->migration_state.notify = vfio_migration_state_notifier;
>      add_migration_state_change_notifier(&migration->migration_state);
> -    return 0;
>
> -err:
> -    g_free(info);
> -    vfio_migration_exit(vbasedev);
> -    return ret;
> +    return 0;
>  }
>
>  /* ---------------------------------------------------------------------- */
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 6e8c5958b9..a24ea7d8b0 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -154,15 +154,10 @@ vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t
>  vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
>  vfio_save_setup(const char *name) " (%s)"
>  vfio_save_cleanup(const char *name) " (%s)"
> -vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
> -vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
>  vfio_save_device_config_state(const char *name) " (%s)"
> -vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
> -vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
>  vfio_save_complete_precopy(const char *name) " (%s)"
>  vfio_load_device_config_state(const char *name) " (%s)"
>  vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
> -vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
>  vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
>  vfio_load_cleanup(const char *name) " (%s)"
>  vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 2ec3346fea..76d470178f 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -61,16 +61,11 @@ typedef struct VFIORegion {
>  typedef struct VFIOMigration {
>      struct VFIODevice *vbasedev;
>      VMChangeStateEntry *vm_state;
> -    VFIORegion region;
> -    uint32_t device_state_v1;
> -    int vm_running;
>      Notifier migration_state;
> -    uint64_t pending_bytes;
>      enum vfio_device_mig_state device_state;
>      int data_fd;
>      void *data_buffer;
>      size_t data_buffer_size;
> -    bool v2;
>  } VFIOMigration;
>
>  typedef struct VFIOAddressSpace {
> --
> 2.21.3
>
>

