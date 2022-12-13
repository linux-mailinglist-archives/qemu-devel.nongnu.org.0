Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70564B95F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:15:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57uf-0002Kl-8U; Tue, 13 Dec 2022 11:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p57uX-0002Ca-UD
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:13:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p57uV-0001uR-Ct
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:13:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670948004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NFfZstMREY9a22dx+gcQEX0Z/iwP7AFfvbBuDdPn2Q=;
 b=O1RM1+Yn6cR4hy1VJK8J9z5IJnPTZAn5IbkKqHkKm4tkQxBZPc9SRGohMfI+MeG3GvIhJH
 fnFy7hvSMys3Pn7URkbQczWeA4amjCTwTYWprGsaLTNPLPwDaHT2PsO5KVtOkDVuDl8a2K
 OXmiUSNn5NkuHNvWHKc13xZ7SxbFfrE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-E_SSikrvOoCbtpP7WkIZNg-1; Tue, 13 Dec 2022 11:13:23 -0500
X-MC-Unique: E_SSikrvOoCbtpP7WkIZNg-1
Received: by mail-wr1-f71.google.com with SMTP id
 i25-20020adfaad9000000b002426945fa63so2988784wrc.6
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7NFfZstMREY9a22dx+gcQEX0Z/iwP7AFfvbBuDdPn2Q=;
 b=jWpApJD254Pww6PSEKexAv2A+Od33m10BjTV6DSbUnqnzTyOh8WSeaZTGOhNroZ5bd
 MIANjRgcCChhJcQGnZMAXRNSaBbHnb8wYi01495EvhS8vjgw5+H3qRWTwueZzU1TcVOL
 GZLf17xwj8pUyTGr/MRM1JEKtiDCoGgzeuOwmJ9KM52ruI5HrNwJvh6jBRQHZKT400Uy
 DTxPDSAzMJJcZTcSn8T8ol7O6SpcxwySROcvwHGySPWhBCzo8RLN8wWI9+8YYpIdxaeo
 2oFHyD823dA3ja1jVUGv9KWpWL1eF8gCsEWqEdqjJe9D0DBfaiaOVBlpuCv9p10AE9nT
 7D4Q==
X-Gm-Message-State: ANoB5plm7+WST+XadkF3McClA75f9+6DU9zFCW6auKr6kPvGkS3rRpqL
 JpdvJTIK/rOmJLF98nBtBjo3uZg28qfZeIljtv7roIDkJRqJBBbyfxZlmzHU6ZtQk/CR4j43CGB
 MhWC21a7Gt+i19yE=
X-Received: by 2002:a05:600c:1c23:b0:3d2:3376:6f2e with SMTP id
 j35-20020a05600c1c2300b003d233766f2emr2231405wms.9.1670948000385; 
 Tue, 13 Dec 2022 08:13:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf665goh+dGf4attVG63Vo/XagLspwQ1ei0syWeCKKX5RrsgBE67JrxzZS4eKKQW/OkScs1jBg==
X-Received: by 2002:a05:600c:1c23:b0:3d2:3376:6f2e with SMTP id
 j35-20020a05600c1c2300b003d233766f2emr2231385wms.9.1670948000018; 
 Tue, 13 Dec 2022 08:13:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c1c9200b003d22528decesm9923847wms.43.2022.12.13.08.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 08:13:19 -0800 (PST)
Message-ID: <683367b3-c899-5baa-39af-7308dfb75613@redhat.com>
Date: Tue, 13 Dec 2022 17:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 12/24] vfio-user: region read/write
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <e648032dfe45ca29141717dff7c6fb8dfae310e7.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <e648032dfe45ca29141717dff7c6fb8dfae310e7.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 11/9/22 00:13, John Johnson wrote:
> Add support for posted writes on remote devices
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/common.c              |  10 +++-
>   hw/vfio/pci.c                 |   9 +++-
>   hw/vfio/pci.h                 |   1 +
>   hw/vfio/user-protocol.h       |  12 +++++
>   hw/vfio/user.c                | 109 ++++++++++++++++++++++++++++++++++++++++++
>   hw/vfio/user.h                |   1 +
>   include/hw/vfio/vfio-common.h |   7 +--
>   7 files changed, 143 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 87400b3..87cd1d1 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -214,6 +214,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
>           uint32_t dword;
>           uint64_t qword;
>       } buf;
> +    bool post = region->post_wr;
>       int ret;
>   
>       switch (size) {
> @@ -234,7 +235,11 @@ void vfio_region_write(void *opaque, hwaddr addr,
>           break;
>       }
>   
> -    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf);
> +    /* read-after-write hazard if guest can directly access region */
> +    if (region->nr_mmaps) {
> +        post = false;
> +    }
> +    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf, post);
>       if (ret != size) {
>           const char *err = ret < 0 ? strerror(-ret) : "short write";
>   
> @@ -1587,6 +1592,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
>       region->size = info->size;
>       region->fd_offset = info->offset;
>       region->nr = index;
> +    region->post_wr = false;
>       if (vbasedev->regfds != NULL) {
>           region->fd = vbasedev->regfds[index];
>       } else {
> @@ -2721,7 +2727,7 @@ static int vfio_io_region_read(VFIODevice *vbasedev, uint8_t index, off_t off,
>   }
>   
>   static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, off_t off,
> -                                uint32_t size, void *data)
> +                                uint32_t size, void *data, bool post)
>   {
>       struct vfio_region_info *info = vbasedev->regions[index];
>       int ret;
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 2e0e41d..027f9d5 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -51,7 +51,7 @@
>                        (size), (data))
>   #define VDEV_CONFIG_WRITE(vbasedev, off, size, data) \
>       VDEV_REGION_WRITE((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, (off), \
> -                      (size), (data))
> +                      (size), (data), false)
>   
>   #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
>   
> @@ -1704,6 +1704,9 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
>       bar->type = pci_bar & (bar->ioport ? ~PCI_BASE_ADDRESS_IO_MASK :
>                                            ~PCI_BASE_ADDRESS_MEM_MASK);
>       bar->size = bar->region.size;
> +
> +    /* IO regions are sync, memory can be async */
> +    bar->region.post_wr = (bar->ioport == 0);
>   }
>   
>   static void vfio_bars_prepare(VFIOPCIDevice *vdev)
> @@ -3494,6 +3497,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>       if (udev->send_queued) {
>           proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
>       }
> +    if (udev->no_post) {
> +        proxy->flags |= VFIO_PROXY_NO_POST;
> +    }
>   
>       vfio_user_validate_version(proxy, &err);
>       if (err != NULL) {
> @@ -3540,6 +3546,7 @@ static void vfio_user_instance_finalize(Object *obj)
>   static Property vfio_user_pci_dev_properties[] = {
>       DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
>       DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
> +    DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index c47d2f8..ec17f2e 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -196,6 +196,7 @@ struct VFIOUserPCIDevice {
>       VFIOPCIDevice device;
>       char *sock_name;
>       bool send_queued;   /* all sends are queued */
> +    bool no_post;       /* all regions write are sync */
>   };
>   
>   /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index a1b64fe..124340c 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -140,4 +140,16 @@ typedef struct {
>       uint64_t offset;
>   } VFIOUserRegionInfo;
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
>   #endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 69b0fed..1453bb5 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -57,6 +57,8 @@ static void vfio_user_cb(void *opaque);
>   
>   static void vfio_user_request(void *opaque);
>   static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
> +static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                 VFIOUserFDs *fds);
>   static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                   VFIOUserFDs *fds, int rsize, bool nobql);
>   static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
> @@ -618,6 +620,33 @@ static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg)
>       return 0;
>   }
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
> +    if (!(hdr->flags & (VFIO_USER_NO_REPLY | VFIO_USER_REPLY))) {
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
>   static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                   VFIOUserFDs *fds, int rsize, bool nobql)
>   {
> @@ -1135,6 +1164,70 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
>       return 0;
>   }
>   
> +static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
> +                                 uint32_t count, void *data)
> +{
> +    g_autofree VFIOUserRegionRW *msgp = NULL;
> +    int size = sizeof(*msgp) + count;
> +
> +    if (count > proxy->max_xfer_size) {
> +        return -EINVAL;
> +    }
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
> +    if (count > proxy->max_xfer_size) {
> +        return -EINVAL;
> +    }
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
>   /*
>    * Socket-based io_ops
> @@ -1184,8 +1277,24 @@ static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
>       return 0;
>   }
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
>   VFIODevIO vfio_dev_io_sock = {
>       .get_info = vfio_user_io_get_info,
>       .get_region_info = vfio_user_io_get_region_info,
> +    .region_read = vfio_user_io_region_read,
> +    .region_write = vfio_user_io_region_write,
>   };
>   
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index 2547cf6..359a029 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -84,6 +84,7 @@ typedef struct VFIOProxy {
>   /* VFIOProxy flags */
>   #define VFIO_PROXY_CLIENT        0x1
>   #define VFIO_PROXY_FORCE_QUEUED  0x4
> +#define VFIO_PROXY_NO_POST       0x8
>   
>   VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
>   void vfio_user_disconnect(VFIOProxy *proxy);
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 3406e6a..6324132 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -57,6 +57,7 @@ typedef struct VFIORegion {
>       VFIOMmap *mmaps;
>       uint8_t nr; /* cache the region number for debug */
>       int fd; /* fd to mmap() region */
> +    bool post_wr; /* writes can be posted */
>   } VFIORegion;
>   
>   typedef struct VFIOMigration {
> @@ -180,7 +181,7 @@ struct VFIODevIO {
>       int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
>                          void *data);
>       int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
> -                        void *data);
> +                        void *data, bool post);
>   };
>   
>   #define VDEV_GET_INFO(vdev, info) \
> @@ -193,8 +194,8 @@ struct VFIODevIO {
>       ((vdev)->io_ops->set_irqs((vdev), (irqs)))
>   #define VDEV_REGION_READ(vdev, nr, off, size, data) \
>       ((vdev)->io_ops->region_read((vdev), (nr), (off), (size), (data)))
> -#define VDEV_REGION_WRITE(vdev, nr, off, size, data) \
> -    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data)))
> +#define VDEV_REGION_WRITE(vdev, nr, off, size, data, post) \
> +    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data), (post)))
>   
>   struct VFIOContIO {
>       int (*dma_map)(VFIOContainer *container,


