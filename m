Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B52E68A63F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 23:34:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO4cr-00034D-37; Fri, 03 Feb 2023 17:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pO4cn-00033z-KF
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:33:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pO4ck-0007iR-QC
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675463617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0FdPZ/X6TQW3Jh2tVfxSXg22hQvhgotlYBNNrvmWho=;
 b=d5EMBRpcOCYrKljx0aqD+qduJ27Y5xj4Mld3sS/esI4YGHZff27C6+awtgIR+HLWPvlJ7i
 909CFj7ZZ77WkNhC5mv5mzhnShbpzmdScL+c2QIh/bZbtVNfAdHeFYaLIaZtx9UXA+Gtce
 ZBzEByGqzkJ3vhQrgCTiCJe9+5Y24GE=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-ZGPu_eFEOjSu2t6r6EsYBQ-1; Fri, 03 Feb 2023 17:33:36 -0500
X-MC-Unique: ZGPu_eFEOjSu2t6r6EsYBQ-1
Received: by mail-io1-f69.google.com with SMTP id
 y22-20020a5d94d6000000b007076e06ba3dso3790485ior.20
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 14:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K0FdPZ/X6TQW3Jh2tVfxSXg22hQvhgotlYBNNrvmWho=;
 b=hfGcT/Gt4kSwSFa6X5rpVp4fgYBbIf6Q7dzz9pnLFwgxsv/1v+0KZOx+uRCsN1S6A2
 VMAY5w93wHLtb96j/HojLWgBBhzwPmsAMhWQuiesD1qJLDy/sc1Ya1Fl6LytyCEOgWp1
 cEofsh9ZHONJpGM34QswAIuXPkTJtLARrhxMAEBIvT4i9RX10aGKSbJB663PSbp+HPEG
 7M9eDoQnCJsY7btt1+2LxvMr0UtW6LkvoXL3Pu0GV5Yb+xA6F+mCPiq48stu9of82Lfe
 P0jXBykIuDQnB90rTD/B7R/9KRAOLY0y1RAD9MrkJDFjJj2lbOUMIeWbcZ3Y4u1MxEIo
 9tlw==
X-Gm-Message-State: AO0yUKUNPEJgSg2WLGxPBL1tGDmkdUamm7nz0llplo5OrP0Xpw4wP95K
 uHIxuQo5ENmhPZBaP6FKtxTxgpRzY47yPtAj00dVBu2tbYMkiiV7tE0IYevYwn4js6NMouITqFU
 r49H58xVspmYxcQo=
X-Received: by 2002:a05:6e02:1b0c:b0:311:ad48:ff1a with SMTP id
 i12-20020a056e021b0c00b00311ad48ff1amr5964524ilv.2.1675463615385; 
 Fri, 03 Feb 2023 14:33:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8FuKPHLFHmnUyVemTnTEGxbP1pE3yAmOPd4wc+aGw71ehIYQs1Hk1c1tyd0DoNXFwixkvdRg==
X-Received: by 2002:a05:6e02:1b0c:b0:311:ad48:ff1a with SMTP id
 i12-20020a056e021b0c00b00311ad48ff1amr5964513ilv.2.1675463615097; 
 Fri, 03 Feb 2023 14:33:35 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h1-20020a0566380f0100b003755a721e98sm1247836jas.107.2023.02.03.14.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 14:33:34 -0800 (PST)
Date: Fri, 3 Feb 2023 15:33:33 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: qemu-devel@nongnu.org, clg@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 03/23] vfio-user: add container IO ops vector
Message-ID: <20230203153333.095b0827.alex.williamson@redhat.com>
In-Reply-To: <20230203152109.60a8cd33.alex.williamson@redhat.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <3648002c52cef9b4473f97d18cb7e2cd62fc3fd5.1675228037.git.john.g.johnson@oracle.com>
 <20230203152109.60a8cd33.alex.williamson@redhat.com>
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

On Fri, 3 Feb 2023 15:21:09 -0700
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Wed,  1 Feb 2023 21:55:39 -0800
> John Johnson <john.g.johnson@oracle.com> wrote:
> 
> > Used for communication with VFIO driver
> > (prep work for vfio-user, which will communicate over a socket)
> > 
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > ---
> >  include/hw/vfio/vfio-common.h |  24 ++++++++
> >  hw/vfio/common.c              | 128 ++++++++++++++++++++++++++++--------------
> >  2 files changed, 110 insertions(+), 42 deletions(-)
> > 
> > diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> > index e573f5a..953bc0f 100644
> > --- a/include/hw/vfio/vfio-common.h
> > +++ b/include/hw/vfio/vfio-common.h
> > @@ -75,6 +75,7 @@ typedef struct VFIOAddressSpace {
> >  } VFIOAddressSpace;
> >  
> >  struct VFIOGroup;
> > +typedef struct VFIOContainerIO VFIOContainerIO;
> >  
> >  typedef struct VFIOContainer {
> >      VFIOAddressSpace *space;
> > @@ -83,6 +84,7 @@ typedef struct VFIOContainer {
> >      MemoryListener prereg_listener;
> >      unsigned iommu_type;
> >      Error *error;
> > +    VFIOContainerIO *io;
> >      bool initialized;
> >      bool dirty_pages_supported;
> >      uint64_t dirty_pgsizes;
> > @@ -154,6 +156,28 @@ struct VFIODeviceOps {
> >      int (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
> >  };
> >  
> > +#ifdef CONFIG_LINUX
> > +
> > +/*
> > + * The next 2 ops vectors are how Devices and Containers
> > + * communicate with the server.  The default option is
> > + * through ioctl() to the kernel VFIO driver, but vfio-user
> > + * can use a socket to a remote process.
> > + */
> > +
> > +struct VFIOContainerIO {
> > +    int (*dma_map)(VFIOContainer *container,
> > +                   struct vfio_iommu_type1_dma_map *map);
> > +    int (*dma_unmap)(VFIOContainer *container,
> > +                     struct vfio_iommu_type1_dma_unmap *unmap,
> > +                     struct vfio_bitmap *bitmap);
> > +    int (*dirty_bitmap)(VFIOContainer *container,
> > +                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
> > +                        struct vfio_iommu_type1_dirty_bitmap_get *range);
> > +};
> > +
> > +#endif /* CONFIG_LINUX */
> > +
> >  typedef struct VFIOGroup {
> >      int fd;
> >      int groupid;
> > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > index ace9562..9310a7f 100644
> > --- a/hw/vfio/common.c
> > +++ b/hw/vfio/common.c
> > @@ -58,6 +58,8 @@ static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
> >  static int vfio_kvm_device_fd = -1;
> >  #endif
> >  
> > +static VFIOContainerIO vfio_cont_io_ioctl;
> > +
> >  /*
> >   * Common VFIO interrupt disable
> >   */
> > @@ -432,12 +434,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
> >          goto unmap_exit;
> >      }
> >  
> > -    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
> > +    ret = container->io->dma_unmap(container, unmap, bitmap);  
> 
> The bitmap arg doesn't make a lot of sense here, its use doesn't come
> around until vfio_user_dma_unmap() is added, but even then, it's
> readily available at &unmap->data with validity determined by
> unmap->flags.  The eventual sanity test in vfio_user_dma_unmap() really
> only seems to prove the arg is unnecessary.  Thanks,


The same comment really applies to .dirty_bitmap() with respect to the
range arg, but I think it's also important to note that both of these
are all but deprecated interfaces for the kernel.  The migration
series[1] is pre-enabling these kernel interfaces to be removed by
adding support to QEMU to dirty all pages when support isn't present,
then we replace it with what we expect to be a longer term solution
with device dirty tracking support[2].  All the more reason not to make
these part of the internal API shared by kernel and user versions.
Thanks,

Alex

[1]https://lore.kernel.org/all/20230116141135.12021-1-avihaih@nvidia.com/
[2]https://lore.kernel.org/all/20230126184948.10478-1-avihaih@nvidia.com/


