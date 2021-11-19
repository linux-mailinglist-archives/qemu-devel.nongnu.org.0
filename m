Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5944578F4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:45:07 +0100 (CET)
Received: from localhost ([::1]:34272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCd0-0000mK-0r
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:45:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb6-0006hF-SW
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb3-0002JO-42
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5NSpwAiKU/GrU/f+S4ufjM767ueC2pPsTaXdp4SKtk=;
 b=gHdOmPW49fFmhem0saCtsn8F8Cisp2GRxHoaeDeDqlkrqstaLFeQVLmBstPZpW6/d8/Jag
 thdrFaeLrXKsHmi3Dk3F+vo8yxSR0qWyFI5ot9eJDTiOper4jGbt0VGP2baszloUVQ9qzn
 HXyjQK9+jdzEzFkRsPeYi2WNhtA6xdY=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-hyKNjmhVMbWADpd9oEhEhQ-1; Fri, 19 Nov 2021 17:43:02 -0500
X-MC-Unique: hyKNjmhVMbWADpd9oEhEhQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 w19-20020a4ae093000000b002bce39fb0d2so6997706oos.6
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5NSpwAiKU/GrU/f+S4ufjM767ueC2pPsTaXdp4SKtk=;
 b=6TSXoHFQVxRYojCqp9XtiRIwt/FIYcXiBxphzkiHjBsXI3teKRcafCpozNhqTPcG1E
 +S0nHPognEigI95lbS/DQ9xb0gX8cjBFeGDNYcZ3TV2S6iXoGR9pKOtNYgmZBrKqyMTS
 AD0wnRx+YuguHksmCSxBYdaZiWkA2ZFEKnSnFBsxjBZmgFjrqKyIUSenyQLBoEr09PsH
 PCaAmRjZIt17dD306jDezL8RbE4m2E8MSiP/tDcxEfxnN44KXBrMNTIaZZw2C0eQ1tjP
 RmcfeHZqthXt8HM85uVw8gyqy/QUsDBEr68cQzN2onfKN86DJeoB9f7xFVBJaRaZeqit
 ddtQ==
X-Gm-Message-State: AOAM5321ypUDfEJnSikQc3Ahrmw8M2lKPxeWTMEkhBCCkIxG0trd9d5q
 CVrnpjpNMvcOi+oOcRJgr8zDgTIiFRriJa0iKz8JwmLwiHPCUlYZ1+0WyBOr9F1T3XwQPsKgN9w
 zKMDDqBgSzbqD6Hw=
X-Received: by 2002:a54:4482:: with SMTP id v2mr3135053oiv.61.1637361781106;
 Fri, 19 Nov 2021 14:43:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEymmuP0w4P+MQeXBFoYGWEAGd1Jbj69Jrf8KfXwg9/WDsKfrGmCe+tW469xl1/tCo/CzENg==
X-Received: by 2002:a54:4482:: with SMTP id v2mr3135018oiv.61.1637361780799;
 Fri, 19 Nov 2021 14:43:00 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:00 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:28 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 12/19] vfio-user: region read/write
Message-ID: <20211119154228.551293fc.alex.williamson@redhat.com>
In-Reply-To: <fec3b2318fe49e39d026a18fdccdb2737226aafc.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <fec3b2318fe49e39d026a18fdccdb2737226aafc.1636057885.git.john.g.johnson@oracle.com>
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

On Mon,  8 Nov 2021 16:46:40 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/pci.h                 |   1 +
>  hw/vfio/user-protocol.h       |  12 +++++
>  hw/vfio/user.h                |   1 +
>  include/hw/vfio/vfio-common.h |   1 +
>  hw/vfio/common.c              |   7 ++-
>  hw/vfio/pci.c                 |   7 +++
>  hw/vfio/user.c                | 101 ++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 129 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index ec9f345..643ff75 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -194,6 +194,7 @@ struct VFIOUserPCIDevice {
>      VFIOPCIDevice device;
>      char *sock_name;
>      bool send_queued;   /* all sends are queued */
> +    bool no_post;       /* all regions write are sync */
>  };
>  
>  /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index 104bf4f..56904cf 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -109,4 +109,16 @@ typedef struct {
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
> index 19edd84..f2098f2 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -75,6 +75,7 @@ typedef struct VFIOProxy {
>  /* VFIOProxy flags */
>  #define VFIO_PROXY_CLIENT        0x1
>  #define VFIO_PROXY_FORCE_QUEUED  0x4
> +#define VFIO_PROXY_NO_POST       0x8
>  
>  VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
>  void vfio_user_disconnect(VFIOProxy *proxy);
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index e2d7ee1..b498964 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -56,6 +56,7 @@ typedef struct VFIORegion {
>      uint32_t nr_mmaps;
>      VFIOMmap *mmaps;
>      uint8_t nr; /* cache the region number for debug */
> +    bool post_wr; /* writes can be posted */

As with the fd in the previous patch, this is where the concept of
posted writes should be introduced throughout.  Or maybe even better
would be to introduce write support without posting and the next patch
could expose posted writes.  Thanks,

Alex

>      int remfd; /* fd if exported from remote process */
>  } VFIORegion;
>  
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 47ec28f..e19f321 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -213,6 +213,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
>          uint32_t dword;
>          uint64_t qword;
>      } buf;
> +    bool post = region->post_wr;
>      int ret;
>  
>      switch (size) {
> @@ -233,7 +234,11 @@ void vfio_region_write(void *opaque, hwaddr addr,
>          break;
>      }
>  
> -    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf, false);
> +    /* read-after-write hazard if guest can directly access region */
> +    if (region->nr_mmaps) {
> +        post = false;
> +    }
> +    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf, post);
>      if (ret != size) {
>          const char *err = ret < 0 ? strerror(-ret) : "short write";
>  
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 40eb9e6..d5f9987 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1665,6 +1665,9 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
>      bar->type = pci_bar & (bar->ioport ? ~PCI_BASE_ADDRESS_IO_MASK :
>                                           ~PCI_BASE_ADDRESS_MEM_MASK);
>      bar->size = bar->region.size;
> +
> +    /* IO regions are sync, memory can be async */
> +    bar->region.post_wr = (bar->ioport == 0);
>  }
>  
>  static void vfio_bars_prepare(VFIOPCIDevice *vdev)
> @@ -3513,6 +3516,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>      if (udev->send_queued) {
>          proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
>      }
> +    if (udev->no_post) {
> +        proxy->flags |= VFIO_PROXY_NO_POST;
> +    }
>  
>      vfio_user_validate_version(vbasedev, &err);
>      if (err != NULL) {
> @@ -3565,6 +3571,7 @@ static void vfio_user_instance_finalize(Object *obj)
>  static Property vfio_user_pci_dev_properties[] = {
>      DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
>      DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
> +    DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index b40c4ed..781cbfd 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -50,6 +50,8 @@ static void vfio_user_cb(void *opaque);
>  
>  static void vfio_user_request(void *opaque);
>  static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
> +static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                 VFIOUserFDs *fds);
>  static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                  VFIOUserFDs *fds, int rsize, bool nobql);
>  static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
> @@ -533,6 +535,33 @@ static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg)
>      return 0;
>  }
>  
> +/*
> + * async send - msg can be queued, but will be freed when sent
> + */
> +static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                 VFIOUserFDs *fds)
> +{
> +    VFIOUserMsg *msg;
> +    int ret;
> +
> +    if (!(hdr->flags & (VFIO_USER_NO_REPLY|VFIO_USER_REPLY))) {
> +        error_printf("vfio_user_send_async on sync message\n");
> +        return;
> +    }
> +
> +    QEMU_LOCK_GUARD(&proxy->lock);
> +
> +    msg = vfio_user_getmsg(proxy, hdr, fds);
> +    msg->id = hdr->id;
> +    msg->rsize = 0;
> +    msg->type = VFIO_MSG_ASYNC;
> +
> +    ret = vfio_user_send_queued(proxy, msg);
> +    if (ret < 0) {
> +        vfio_user_recycle(proxy, msg);
> +    }
> +}
> +
>  static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                  VFIOUserFDs *fds, int rsize, bool nobql)
>  {
> @@ -957,6 +986,62 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
>      return 0;
>  }
>  
> +static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
> +                                 uint32_t count, void *data)
> +{
> +    g_autofree VFIOUserRegionRW *msgp = NULL;
> +    int size = sizeof(*msgp) + count;
> +
> +    msgp = g_malloc0(size);
> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_READ, sizeof(*msgp), 0);
> +    msgp->offset = offset;
> +    msgp->region = index;
> +    msgp->count = count;
> +
> +    vfio_user_send_wait(proxy, &msgp->hdr, NULL, size, false);
> +    if (msgp->hdr.flags & VFIO_USER_ERROR) {
> +        return -msgp->hdr.error_reply;
> +    } else if (msgp->count > count) {
> +        return -E2BIG;
> +    } else {
> +        memcpy(data, &msgp->data, msgp->count);
> +    }
> +
> +    return msgp->count;
> +}
> +
> +static int vfio_user_region_write(VFIOProxy *proxy, uint8_t index, off_t offset,
> +                                  uint32_t count, void *data, bool post)
> +{
> +    VFIOUserRegionRW *msgp = NULL;
> +    int flags = post ? VFIO_USER_NO_REPLY : 0;
> +    int size = sizeof(*msgp) + count;
> +    int ret;
> +
> +    msgp = g_malloc0(size);
> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_WRITE, size, flags);
> +    msgp->offset = offset;
> +    msgp->region = index;
> +    msgp->count = count;
> +    memcpy(&msgp->data, data, count);
> +
> +    /* async send will free msg after it's sent */
> +    if (post && !(proxy->flags & VFIO_PROXY_NO_POST)) {
> +        vfio_user_send_async(proxy, &msgp->hdr, NULL);
> +        return count;
> +    }
> +
> +    vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
> +    if (msgp->hdr.flags & VFIO_USER_ERROR) {
> +        ret = -msgp->hdr.error_reply;
> +    } else {
> +        ret = count;
> +    }
> +
> +    g_free(msgp);
> +    return ret;
> +}
> +
>  
>  /*
>   * Socket-based io_ops
> @@ -990,8 +1075,24 @@ static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
>      return VDEV_VALID_REGION_INFO(vbasedev, info, fd);
>  }
>  
> +static int vfio_user_io_region_read(VFIODevice *vbasedev, uint8_t index,
> +                                    off_t off, uint32_t size, void *data)
> +{
> +    return vfio_user_region_read(vbasedev->proxy, index, off, size, data);
> +}
> +
> +static int vfio_user_io_region_write(VFIODevice *vbasedev, uint8_t index,
> +                                     off_t off, unsigned size, void *data,
> +                                     bool post)
> +{
> +    return vfio_user_region_write(vbasedev->proxy, index, off, size, data,
> +                                  post);
> +}
> +
>  VFIODevIO vfio_dev_io_sock = {
>      .get_info = vfio_user_io_get_info,
>      .get_region_info = vfio_user_io_get_region_info,
> +    .region_read = vfio_user_io_region_read,
> +    .region_write = vfio_user_io_region_write,
>  };
>  


