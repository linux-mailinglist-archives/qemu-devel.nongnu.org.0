Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38FE257D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 23:36:03 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNOIT-0002dj-Df
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 17:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iNOBB-0003nd-TC
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 17:28:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iNOB9-0005IG-7x
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 17:28:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42650)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iNOB8-0005G5-Ux
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 17:28:27 -0400
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 940BFC04FFE0
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 21:28:24 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id q54so20341503qtk.15
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 14:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=od17pniYLBMiYdAfzkmJjP+f7cN1U2fFN25NYaxFelU=;
 b=Y4HkFuvEwgFl/q3hh56XC5HzZSuNGPgqMpFNbqqaVnLr1rnOi2bBHj0xJOJDRKXK1E
 fiEL/Mc0/Ng9UiNJvqPoZUF7T2C1lGZShWt6g7kKTGkmpizo4iIjmOQ7rl9W1fxetC7m
 ZMS/knmaqXHiksFS8wBrXbKdDvBIsWrf9Z+7iyejSyP+axZeKvoyB5dzb4zdgTlGI+CL
 WAJ7nEgRbBfFw9XzOxjkOuxTPWs+bonbWG1gm/aekEaDZAFd7eEr9Lbb+8SXTBGAHsCP
 XI/lP9zZUMcJ2RIym/2mE4xKFQkgx8tY0zYEUM/tAHKM16suSLadTunh543WGDkhEaQ3
 GUVA==
X-Gm-Message-State: APjAAAUduBj6M2VKs52j19tprVpOOslTZzyVQPfcEcZ0dC8ectyRlXiR
 K2LmNRX5iJPQ1jEM53YZg0zZvQW83Qmt+hDfHCw17WBego3NiBa8wJaexCvNl+fWFB8VA6Pm1xk
 sIv0zYwMwRkuiEIk=
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr11535680qvb.42.1571866103750; 
 Wed, 23 Oct 2019 14:28:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxyTJRYRR3xxJM5YAJhs9O/7Dn0PT0TxRpSnntDKpwDg4BepiTTcQTkzCvmKY2WSmW//3tnFw==
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr11535663qvb.42.1571866103443; 
 Wed, 23 Oct 2019 14:28:23 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 m15sm10078957qka.104.2019.10.23.14.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 14:28:22 -0700 (PDT)
Date: Wed, 23 Oct 2019 17:28:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>
Subject: Re: [PATCH] virtio: fix IO request length in virtio SCSI/block
 #PSBM-78839
Message-ID: <20191023172005-mutt-send-email-mst@kernel.org>
References: <20191018115547.19299-1-dplotnikov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018115547.19299-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, den@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 18, 2019 at 02:55:47PM +0300, Denis Plotnikov wrote:
> From: "Denis V. Lunev" <den@openvz.org>
> 
> Linux guests submit IO requests no longer than PAGE_SIZE * max_seg
> field reported by SCSI controler. Thus typical sequential read with
> 1 MB size results in the following pattern of the IO from the guest:
>   8,16   1    15754     2.766095122  2071  D   R 2095104 + 1008 [dd]
>   8,16   1    15755     2.766108785  2071  D   R 2096112 + 1008 [dd]
>   8,16   1    15756     2.766113486  2071  D   R 2097120 + 32 [dd]
>   8,16   1    15757     2.767668961     0  C   R 2095104 + 1008 [0]
>   8,16   1    15758     2.768534315     0  C   R 2096112 + 1008 [0]
>   8,16   1    15759     2.768539782     0  C   R 2097120 + 32 [0]
> The IO was generated by
>   dd if=/dev/sda of=/dev/null bs=1024 iflag=direct
> 
> This effectively means that on rotational disks we will observe 3 IOPS
> for each 2 MBs processed. This definitely negatively affects both
> guest and host IO performance.
> 
> The cure is relatively simple - we should report lengthy scatter-gather
> ability of the SCSI controller. Fortunately the situation here is very
> good. VirtIO transport layer can accomodate 1024 items in one request
> while we are using only 128. This situation is present since almost
> very beginning. 2 items are dedicated for request metadata thus we
> should publish VIRTQUEUE_MAX_SIZE - 2 as max_seg.
> 
> The following pattern is observed after the patch:
>   8,16   1     9921     2.662721340  2063  D   R 2095104 + 1024 [dd]
>   8,16   1     9922     2.662737585  2063  D   R 2096128 + 1024 [dd]
>   8,16   1     9923     2.665188167     0  C   R 2095104 + 1024 [0]
>   8,16   1     9924     2.665198777     0  C   R 2096128 + 1024 [0]
> which is much better.
> 
> The dark side of this patch is that we are tweaking guest visible
> parameter, though this should be relatively safe as above transport
> layer support is present in QEMU/host Linux for a very long time.
> The patch adds configurable property for VirtIO SCSI with a new default
> and hardcode option for VirtBlock which does not provide good
> configurable framework.
> 
> Unfortunately the commit can not be applied as is. For the real cure we
> need guest to be fixed to accomodate that queue length, which is done
> only in the latest 4.14 kernel. Thus we are going to expose the property
> and tweak it on machine type level.
> 
> The problem with the old kernels is that they have
> max_segments <= virtqueue_size restriction which cause the guest
> crashing in the case of violation.

This isn't just in the guests: virtio spec also seems to imply this,
or at least be vague on this point.

So I think it'll need a feature bit.
Doing that in a safe way will also allow being compatible with old guests.

The only downside is it's a bit more work as we need to
spec this out and add guest support.

> To fix the case described above in the old kernels we can increase
> virtqueue_size to 256 and max_segments to 254. The pitfall here is
> that seabios allows the virtqueue_size-s < 128, however, the seabios
> patch extending that value to 256 is pending.


And the fix here is just to limit large vq size to virtio 1.0.
In that mode it's fine I think:


   /* check if the queue is available */
   if (vp->use_modern) {
       num = vp_read(&vp->common, virtio_pci_common_cfg, queue_size);
       if (num > MAX_QUEUE_NUM) {
           vp_write(&vp->common, virtio_pci_common_cfg, queue_size,
                    MAX_QUEUE_NUM);
           num = vp_read(&vp->common, virtio_pci_common_cfg, queue_size);
       }
   } else {
       num = vp_read(&vp->legacy, virtio_pci_legacy, queue_num);
   }





> CC: "Michael S. Tsirkin" <mst@redhat.com>
> CC: Stefan Hajnoczi <stefanha@redhat.com>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Max Reitz <mreitz@redhat.com>
> CC: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
> ---
>  hw/block/virtio-blk.c           | 3 ++-
>  hw/scsi/vhost-scsi.c            | 2 ++
>  hw/scsi/virtio-scsi.c           | 4 +++-
>  include/hw/virtio/virtio-blk.h  | 1 +
>  include/hw/virtio/virtio-scsi.h | 1 +
>  5 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 06e57a4d39..b2eaeeaf67 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -903,7 +903,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>      blk_get_geometry(s->blk, &capacity);
>      memset(&blkcfg, 0, sizeof(blkcfg));
>      virtio_stq_p(vdev, &blkcfg.capacity, capacity);
> -    virtio_stl_p(vdev, &blkcfg.seg_max, 128 - 2);
> +    virtio_stl_p(vdev, &blkcfg.seg_max, s->conf.max_segments);
>      virtio_stw_p(vdev, &blkcfg.geometry.cylinders, conf->cyls);
>      virtio_stl_p(vdev, &blkcfg.blk_size, blk_size);
>      virtio_stw_p(vdev, &blkcfg.min_io_size, conf->min_io_size / blk_size);
> @@ -1240,6 +1240,7 @@ static Property virtio_blk_properties[] = {
>                         conf.max_discard_sectors, BDRV_REQUEST_MAX_SECTORS),
>      DEFINE_PROP_UINT32("max-write-zeroes-sectors", VirtIOBlock,
>                         conf.max_write_zeroes_sectors, BDRV_REQUEST_MAX_SECTORS),
> +    DEFINE_PROP_UINT32("max_segments", VirtIOBlock, conf.max_segments, 126),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  


I'd worry that it's too easy to create a broken config with this
parameter.


> diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
> index 61e2e57da9..fa3b377807 100644
> --- a/hw/scsi/vhost-scsi.c
> +++ b/hw/scsi/vhost-scsi.c
> @@ -242,6 +242,8 @@ static Property vhost_scsi_properties[] = {
>      DEFINE_PROP_BIT64("t10_pi", VHostSCSICommon, host_features,
>                                                   VIRTIO_SCSI_F_T10_PI,
>                                                   false),
> +    DEFINE_PROP_UINT32("max_segments", VirtIOSCSICommon, conf.max_segments,
> +                       126),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 839f120256..8b070ddeed 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -650,7 +650,7 @@ static void virtio_scsi_get_config(VirtIODevice *vdev,
>      VirtIOSCSICommon *s = VIRTIO_SCSI_COMMON(vdev);
>  
>      virtio_stl_p(vdev, &scsiconf->num_queues, s->conf.num_queues);
> -    virtio_stl_p(vdev, &scsiconf->seg_max, 128 - 2);
> +    virtio_stl_p(vdev, &scsiconf->seg_max, s->conf.max_segments);
>      virtio_stl_p(vdev, &scsiconf->max_sectors, s->conf.max_sectors);
>      virtio_stl_p(vdev, &scsiconf->cmd_per_lun, s->conf.cmd_per_lun);
>      virtio_stl_p(vdev, &scsiconf->event_info_size, sizeof(VirtIOSCSIEvent));
> @@ -948,6 +948,8 @@ static Property virtio_scsi_properties[] = {
>                                                  VIRTIO_SCSI_F_CHANGE, true),
>      DEFINE_PROP_LINK("iothread", VirtIOSCSI, parent_obj.conf.iothread,
>                       TYPE_IOTHREAD, IOThread *),
> +    DEFINE_PROP_UINT32("max_segments", VirtIOSCSI, parent_obj.conf.max_segments,
> +                       126),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
> index cddcfbebe9..22da23a4a3 100644
> --- a/include/hw/virtio/virtio-blk.h
> +++ b/include/hw/virtio/virtio-blk.h
> @@ -40,6 +40,7 @@ struct VirtIOBlkConf
>      uint16_t queue_size;
>      uint32_t max_discard_sectors;
>      uint32_t max_write_zeroes_sectors;
> +    uint32_t max_segments;
>  };
>  
>  struct VirtIOBlockDataPlane;
> diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
> index 4c0bcdb788..1e5805eec4 100644
> --- a/include/hw/virtio/virtio-scsi.h
> +++ b/include/hw/virtio/virtio-scsi.h
> @@ -49,6 +49,7 @@ struct VirtIOSCSIConf {
>      uint32_t num_queues;
>      uint32_t virtqueue_size;
>      uint32_t max_sectors;
> +    uint32_t max_segments;
>      uint32_t cmd_per_lun;
>  #ifdef CONFIG_VHOST_SCSI
>      char *vhostfd;
> -- 
> 2.17.0

