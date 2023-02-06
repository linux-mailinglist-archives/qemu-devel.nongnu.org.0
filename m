Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055668C672
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 20:09:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6qS-0004ks-3p; Mon, 06 Feb 2023 14:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pP6q3-0004iG-H6
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:07:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pP6px-0007sM-Ch
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675710448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvrgGWnJVkmeiUY2/ytCG2tAWeKz7JFCLxaerqKhAU8=;
 b=ST/IR/CR4NB4NdKv/aDE2/sg+yQrb0MC7iL2diKs1lhg+pmV3kyZTRDvaTWjjuI1Vwhr/3
 Eokjdxt5U75eO1cIhjWl/33r9rg+84JkzdU0nZCoNFWj5q4xlNEDMDsNWXVbzihV7D6Sah
 XcuMj+ioHU7oeRWxEIhr5hnsfjpuRIk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-tQdcyXgjMdGZoMfACTj3wQ-1; Mon, 06 Feb 2023 14:07:27 -0500
X-MC-Unique: tQdcyXgjMdGZoMfACTj3wQ-1
Received: by mail-il1-f200.google.com with SMTP id
 g1-20020a92cda1000000b0030c45d93884so8817582ild.16
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvrgGWnJVkmeiUY2/ytCG2tAWeKz7JFCLxaerqKhAU8=;
 b=KPRsMvT4cQNdWyNTJwzoq6ctwd577LJFJ0XtXyiIcg5G13Y2rC6721Dgh7qjf0WcvK
 DGn7cYJ0r4HO2bCnvWBcm4JOL7/PFAK15NvNyQQS58JZNQ2rfsTk1xIdseRKX1AYFB7f
 i8FF+3mBj/+RQEOzfj+w+3FqR7eoq3knnYxFN9/JAH3oNXCmh/edZEWADrnWkdZvfqZ8
 7A9t1OV/M2GBMQzHfhioy4rhGaVS2c5MMihKFbfNzaqxyOB5jrtcoKrJEJMRWY18mY4N
 DBtjfzNGUeFmJhIRAV3ao/lzNBNlrefRKNARmCKsCErumLPkd7HnLu5fwaEuFZtoHOJS
 ljCg==
X-Gm-Message-State: AO0yUKVX3OeUkrmD1+c6mJMADuE8T15lk0+OLmxALiOdJFFsF6LS98np
 Y+pW1pbhafMHRozpkTIOvn6x5ZIL4T+l8uISyKirV/NTR1GsA9bDCucbiMADuPwWLY15umWXT+X
 rcqhTg+UnKMXPNsY=
X-Received: by 2002:a92:cd83:0:b0:310:ce1f:44fd with SMTP id
 r3-20020a92cd83000000b00310ce1f44fdmr354890ilb.3.1675710446580; 
 Mon, 06 Feb 2023 11:07:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/dEaADKHfPH0KlrxrfuOlZGQqucw/GG8jBC8Vz2rk/BPKppVJhduxp0YuER03K5WkzNb71ZA==
X-Received: by 2002:a92:cd83:0:b0:310:ce1f:44fd with SMTP id
 r3-20020a92cd83000000b00310ce1f44fdmr354869ilb.3.1675710446202; 
 Mon, 06 Feb 2023 11:07:26 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r22-20020a02c6d6000000b0039e68e9988csm3636687jan.56.2023.02.06.11.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 11:07:25 -0800 (PST)
Date: Mon, 6 Feb 2023 12:07:24 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org, clg@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 12/23] vfio-user: region read/write
Message-ID: <20230206120724.065199c4.alex.williamson@redhat.com>
In-Reply-To: <83ec17255d41c90eb3950364dd853b240398705b.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <83ec17255d41c90eb3950364dd853b240398705b.1675228037.git.john.g.johnson@oracle.com>
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

On Wed,  1 Feb 2023 21:55:48 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Add support for posted writes on remote devices
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/user-protocol.h       |  12 +++++
>  hw/vfio/user.h                |   1 +
>  include/hw/vfio/vfio-common.h |   3 +-
>  hw/vfio/common.c              |  23 ++++++---
>  hw/vfio/pci.c                 |   5 +-
>  hw/vfio/user-pci.c            |   5 ++
>  hw/vfio/user.c                | 112 ++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events          |   1 +
>  8 files changed, 154 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index 6f70a48..6987435 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -139,4 +139,16 @@ typedef struct {
>      uint64_t offset;
>  } VFIOUserRegionInfo;
>  
> +/*
> + * VFIO_USER_REGION_READ
> + * VFIO_USER_REGION_WRITE
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint64_t offset;
> +    uint32_t region;
> +    uint32_t count;
> +    char data[];
> +} VFIOUserRegionRW;
> +
>  #endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index e6485dc..3012a86 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -84,6 +84,7 @@ typedef struct VFIOUserProxy {
>  /* VFIOProxy flags */
>  #define VFIO_PROXY_CLIENT        0x1
>  #define VFIO_PROXY_FORCE_QUEUED  0x4
> +#define VFIO_PROXY_NO_POST       0x8
>  
>  VFIOUserProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
>  void vfio_user_disconnect(VFIOUserProxy *proxy);
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 9fb4c80..bbc4b15 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -57,6 +57,7 @@ typedef struct VFIORegion {
>      VFIOMmap *mmaps;
>      uint8_t nr; /* cache the region number for debug */
>      int fd; /* fd to mmap() region */
> +    bool post_wr; /* writes can be posted */
>  } VFIORegion;
>  
>  typedef struct VFIOMigration {
> @@ -180,7 +181,7 @@ struct VFIODeviceIO {
>      int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
>                         void *data);
>      int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
> -                        void *data);
> +                        void *data, bool post);
>  };
>  
>  struct VFIOContainerIO {
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index d26b325..de64e53 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -215,6 +215,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
>          uint32_t dword;
>          uint64_t qword;
>      } buf;
> +    bool post = region->post_wr;
>      int ret;
>  
>      switch (size) {
> @@ -235,12 +236,19 @@ void vfio_region_write(void *opaque, hwaddr addr,
>          break;
>      }
>  
> -    ret = vbasedev->io->region_write(vbasedev, region->nr, addr, size, &buf);
> +    /* read-after-write hazard if guest can directly access region */
> +    if (region->nr_mmaps) {
> +        post = false;
> +    }
> +    ret = vbasedev->io->region_write(vbasedev, region->nr, addr, size, &buf,
> +                                     post);
>      if (ret != size) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short write";
> +
>          error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
> -                     ",%d) failed: %m",
> +                     ",%d) failed: %s",
>                       __func__, vbasedev->name, region->nr,
> -                     addr, data, size);
> +                     addr, data, size, err);
>      }
>      trace_vfio_region_write(vbasedev->name, region->nr, addr, data, size);
>  
> @@ -271,9 +279,11 @@ uint64_t vfio_region_read(void *opaque,
>  
>      ret = vbasedev->io->region_read(vbasedev, region->nr, addr, size, &buf);
>      if (ret != size) {
> -        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m",
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %s",
>                       __func__, vbasedev->name, region->nr,
> -                     addr, size);
> +                     addr, size, err);
>          return (uint64_t)-1;
>      }
>  
> @@ -1584,6 +1594,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
>      region->size = info->size;
>      region->fd_offset = info->offset;
>      region->nr = index;
> +    region->post_wr = false;
>      if (vbasedev->regfds != NULL) {
>          region->fd = vbasedev->regfds[index];
>      } else {
> @@ -2711,7 +2722,7 @@ static int vfio_io_region_read(VFIODevice *vbasedev, uint8_t index, off_t off,
>  }
>  
>  static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, off_t off,
> -                                uint32_t size, void *data)
> +                                uint32_t size, void *data, bool post)
>  {

This is all a bit confusing as a non-posted write on bare metal would
require a follow-up read to flush the write, but in the kernel case we
rely on both the bus protocols and the userspace driver to perform such
actions to enforce coherency.  The read-after-write hazard comment above
suggests the issue is split access between mmap and read/write across
the region, where the mmap access bypasses the socket protocol.  But
isn't this actually across the whole device?  For example, PCI doesn't
care which BAR a write targets, reads to another BAR cannot bypass the
write, aiui.  IOW, couldn't a write to a BAR that doesn't support mmap
affect the behavior of a BAR that does support mmap, and therefore
there should be no posted writes for the entire device if any region
supports mmap access?

I wonder if a better approach wouldn't be to make all writes operations
synchronous and avoid read-after-write hazard by performing writes
through the mmap when available, ie. make use of the same bypass to
avoid the hazard.

In any case, I think this deserves more comments, both why vfio-user
needs it and why vfio-kernel doesn't, and ideally the initial
read/write implementation would be entirely synchronous with posted
write support added as a separate patch with full explanation and
justification.  Thanks,

Alex


