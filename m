Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A225457910
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:48:23 +0100 (CET)
Received: from localhost ([::1]:42774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCg8-0006XD-9P
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:48:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbB-0006kt-B9
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb9-0002ja-3h
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAndJNMNK9mXEeJ5wTOrlrde9nqtxilH39xhsCHXuU4=;
 b=Q+XHYOqo+VcK3br0fhT3Ntk+U1//GYN4jrCKAmhMizJJ+a1ZDFrrazJk8xBv7E6IvqMUcR
 1ezavVGmBun0a7kW7AuWEN5WXxo5MHCDMkLNLX2ET8zcNDarn0QzJw+Xfpwrvop9036BHh
 V+Me9uqnQPJHS+lVpRxkFwTTSo5+k94=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-u2ka_b3kNwisfrPZlE_3uw-1; Fri, 19 Nov 2021 17:43:07 -0500
X-MC-Unique: u2ka_b3kNwisfrPZlE_3uw-1
Received: by mail-oi1-f200.google.com with SMTP id
 y20-20020acaaf14000000b002a817a23a1eso7653415oie.23
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NAndJNMNK9mXEeJ5wTOrlrde9nqtxilH39xhsCHXuU4=;
 b=yMZYnLYcxN2GBJUdfSQfcSZeo2fke+rpSYMCGPpO4UHtNQrOGusUPBCWO3xVNyFWwZ
 Napwgzr76oto3WKURwcRbILGHR8H+nhtnidjeZqMEO0t4WRvhmSQ/eFwM5dEYTDG5vtF
 wf3IaBH+RZPNw01iOXdVKcGg78aeHlI1Dn40GIMY+odElB8O+/Dpd3IYdo4kVW5v8Jol
 uAM5g3wdL+VXfGtv8kXUxGUjorLFr+ZQ13le7sahJposEaKFKT87IYm82VSu32gePAr5
 guObHIou13S4jg+PGXVVaXn03oOULWnUK8OL4oNRcsbZQg6lauVAWijyC6A6IkrHeEbB
 bk3Q==
X-Gm-Message-State: AOAM5332p6zqRYFW0i58lKYtLs3uu0WdJDjhgjnWZ6eg+qMhpdXduPDu
 w/92rnsC+5pNRRH1rTRZSN7KGvmm7GX6cZC35ukSHyUr8YvpmeqPipUzz+HptZgIwpOGcI0xTlj
 GczUWUo/DKiGNPW0=
X-Received: by 2002:aca:1202:: with SMTP id 2mr3194950ois.63.1637361786393;
 Fri, 19 Nov 2021 14:43:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6lBRyX1pW3JVpEsCFXiZLCUZHrmChuCozmrhw3thCH3cvqUrRzDDhZ5x95UJFjV/idv8qtw==
X-Received: by 2002:aca:1202:: with SMTP id 2mr3194924ois.63.1637361786080;
 Fri, 19 Nov 2021 14:43:06 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:05 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:33 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 19/19] vfio-user: migration support
Message-ID: <20211119154233.6eb825b2.alex.williamson@redhat.com>
In-Reply-To: <fd19a5e8a491c63edbcc9882994cad22cdff9f55.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <fd19a5e8a491c63edbcc9882994cad22cdff9f55.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Nov 2021 16:46:47 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> bug fix: only set qemu file error if there is a file


I don't understand this commit log.  Is this meant to be a revision
log?  In general it would be nice to have more detailed commit logs for
many of these patches describing any nuances.

Note that the migration uAPI is being reevaluated on the kernel side,
so I expect we'll want to hold off on vfio-user beyond minimal stub
support.  Thanks,

Alex

> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/user-protocol.h | 18 +++++++++++++++++
>  hw/vfio/migration.c     | 34 +++++++++++++++----------------
>  hw/vfio/pci.c           |  7 +++++++
>  hw/vfio/user.c          | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 96 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index c5d9473..bad067a 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -182,6 +182,10 @@ typedef struct {
>      char data[];
>  } VFIOUserDMARW;
>  
> +/*
> + * VFIO_USER_DIRTY_PAGES
> + */
> +
>  /*imported from struct vfio_bitmap */
>  typedef struct {
>      uint64_t pgsize;
> @@ -189,4 +193,18 @@ typedef struct {
>      char data[];
>  } VFIOUserBitmap;
>  
> +/* imported from struct vfio_iommu_type1_dirty_bitmap_get */
> +typedef struct {
> +    uint64_t iova;
> +    uint64_t size;
> +    VFIOUserBitmap bitmap;
> +} VFIOUserBitmapRange;
> +
> +/* imported from struct vfio_iommu_type1_dirty_bitmap */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +} VFIOUserDirtyPages;
> +
>  #endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 82f654a..3d379cb 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -27,6 +27,7 @@
>  #include "pci.h"
>  #include "trace.h"
>  #include "hw/hw.h"
> +#include "user.h"
>  
>  /*
>   * Flags to be used as unique delimiters for VFIO devices in the migration
> @@ -49,11 +50,13 @@ static int64_t bytes_transferred;
>  static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
>                                    off_t off, bool iswrite)
>  {
> +    VFIORegion *region = &vbasedev->migration->region;
>      int ret;
>  
> -    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
> -                    pread(vbasedev->fd, val, count, off);
> -    if (ret < count) {
> +    ret = iswrite ?
> +        VDEV_REGION_WRITE(vbasedev, region->nr, off, count, val, false) :
> +        VDEV_REGION_READ(vbasedev, region->nr, off, count, val);
> +     if (ret < count) {
>          error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
>                       HWADDR_PRIx", err: %s", iswrite ? "write" : "read", count,
>                       vbasedev->name, off, strerror(errno));
> @@ -111,9 +114,7 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
>                                      uint32_t value)
>  {
>      VFIOMigration *migration = vbasedev->migration;
> -    VFIORegion *region = &migration->region;
> -    off_t dev_state_off = region->fd_offset +
> -                          VFIO_MIG_STRUCT_OFFSET(device_state);
> +    off_t dev_state_off = VFIO_MIG_STRUCT_OFFSET(device_state);
>      uint32_t device_state;
>      int ret;
>  
> @@ -201,13 +202,13 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
>      int ret;
>  
>      ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
> -                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
> +                        VFIO_MIG_STRUCT_OFFSET(data_offset));
>      if (ret < 0) {
>          return ret;
>      }
>  
>      ret = vfio_mig_read(vbasedev, &data_size, sizeof(data_size),
> -                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
> +                        VFIO_MIG_STRUCT_OFFSET(data_size));
>      if (ret < 0) {
>          return ret;
>      }
> @@ -233,8 +234,7 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
>              }
>              buf_allocated = true;
>  
> -            ret = vfio_mig_read(vbasedev, buf, sec_size,
> -                                region->fd_offset + data_offset);
> +            ret = vfio_mig_read(vbasedev, buf, sec_size, data_offset);
>              if (ret < 0) {
>                  g_free(buf);
>                  return ret;
> @@ -269,7 +269,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>  
>      do {
>          ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
> -                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
> +                            VFIO_MIG_STRUCT_OFFSET(data_offset));
>          if (ret < 0) {
>              return ret;
>          }
> @@ -309,8 +309,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>              qemu_get_buffer(f, buf, sec_size);
>  
>              if (buf_alloc) {
> -                ret = vfio_mig_write(vbasedev, buf, sec_size,
> -                        region->fd_offset + data_offset);
> +                ret = vfio_mig_write(vbasedev, buf, sec_size, data_offset);
>                  g_free(buf);
>  
>                  if (ret < 0) {
> @@ -322,7 +321,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>          }
>  
>          ret = vfio_mig_write(vbasedev, &report_size, sizeof(report_size),
> -                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
> +                             VFIO_MIG_STRUCT_OFFSET(data_size));
>          if (ret < 0) {
>              return ret;
>          }
> @@ -334,12 +333,11 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>  static int vfio_update_pending(VFIODevice *vbasedev)
>  {
>      VFIOMigration *migration = vbasedev->migration;
> -    VFIORegion *region = &migration->region;
>      uint64_t pending_bytes = 0;
>      int ret;
>  
>      ret = vfio_mig_read(vbasedev, &pending_bytes, sizeof(pending_bytes),
> -                    region->fd_offset + VFIO_MIG_STRUCT_OFFSET(pending_bytes));
> +                        VFIO_MIG_STRUCT_OFFSET(pending_bytes));
>      if (ret < 0) {
>          migration->pending_bytes = 0;
>          return ret;
> @@ -744,7 +742,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>           */
>          error_report("%s: Failed to set device state 0x%x", vbasedev->name,
>                       (migration->device_state & mask) | value);
> -        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        if (value != 0) {
> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        }
>      }
>      vbasedev->migration->vm_running = running;
>      trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index ccb2563..2e3846e 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3754,6 +3754,13 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>          }
>      }
>  
> +    if (!pdev->failover_pair_id) {
> +        ret = vfio_migration_probe(&vdev->vbasedev, errp);
> +        if (ret) {
> +            error_report("%s: Migration disabled", vdev->vbasedev.name);
> +        }
> +    }
> +
>      vfio_register_err_notifier(vdev);
>      vfio_register_req_notifier(vdev);
>  
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 76d0706..460d4e5 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -1398,6 +1398,52 @@ void vfio_user_reset(VFIOProxy *proxy)
>      }
>  }
>  
> +static int vfio_user_dirty_bitmap(VFIOProxy *proxy,
> +                                  struct vfio_iommu_type1_dirty_bitmap *cmd,
> +                                  struct vfio_iommu_type1_dirty_bitmap_get
> +                                  *dbitmap)
> +{
> +    g_autofree struct {
> +        VFIOUserDirtyPages msg;
> +        VFIOUserBitmapRange range;
> +    } *msgp = NULL;
> +    int msize, rsize;
> +
> +    /*
> +     * If just the command is sent, the returned bitmap isn't needed.
> +     * The bitmap structs are different from the ioctl() versions,
> +     * ioctl() returns the bitmap in a local VA
> +     */
> +    if (dbitmap != NULL) {
> +        msize = sizeof(*msgp);
> +        rsize = msize + dbitmap->bitmap.size;
> +        msgp = g_malloc0(rsize);
> +        msgp->range.iova = dbitmap->iova;
> +        msgp->range.size = dbitmap->size;
> +        msgp->range.bitmap.pgsize = dbitmap->bitmap.pgsize;
> +        msgp->range.bitmap.size = dbitmap->bitmap.size;
> +    } else {
> +        msize = rsize = sizeof(VFIOUserDirtyPages);
> +        msgp = g_malloc0(rsize);
> +    }
> +
> +    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DIRTY_PAGES, msize, 0);
> +    msgp->msg.argsz = msize - sizeof(msgp->msg.hdr);
> +    msgp->msg.flags = cmd->flags;
> +
> +    vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, false);
> +    if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
> +        return -msgp->msg.hdr.error_reply;
> +    }
> +
> +    if (dbitmap != NULL) {
> +        memcpy(dbitmap->bitmap.data, &msgp->range.bitmap.data,
> +               dbitmap->bitmap.size);
> +    }
> +
> +    return 0;
> +}
> +
>  
>  /*
>   * Socket-based io_ops
> @@ -1493,6 +1539,13 @@ static int vfio_user_io_dma_unmap(VFIOContainer *container,
>      return vfio_user_dma_unmap(container->proxy, unmap, bitmap, will_commit);
>  }
>  
> +static int vfio_user_io_dirty_bitmap(VFIOContainer *container,
> +                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
> +                        struct vfio_iommu_type1_dirty_bitmap_get *range)
> +{
> +    return vfio_user_dirty_bitmap(container->proxy, bitmap, range);
> +}
> +
>  static void vfio_user_io_wait_commit(VFIOContainer *container)
>  {
>      vfio_user_wait_reqs(container->proxy);
> @@ -1501,5 +1554,6 @@ static void vfio_user_io_wait_commit(VFIOContainer *container)
>  VFIOContIO vfio_cont_io_sock = {
>      .dma_map = vfio_user_io_dma_map,
>      .dma_unmap = vfio_user_io_dma_unmap,
> +    .dirty_bitmap = vfio_user_io_dirty_bitmap,
>      .wait_commit = vfio_user_io_wait_commit,
>  };


