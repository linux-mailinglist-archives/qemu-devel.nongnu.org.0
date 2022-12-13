Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E90264B698
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 14:50:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p55e4-0007hh-Dv; Tue, 13 Dec 2022 08:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p55e1-0007gs-H7
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:48:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p55dy-0007Tv-Jl
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670939305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8DJc4gXSxrGW+J32i2MG2TT7F2GQs7YoLzAMIQzveo=;
 b=TWYP6Qi3k8Nj9r5uF9b+1E4CBSQKZd8BIzJ0Sy2nq/CLi2Go3aG5h2BnH+N+miFkna2NTD
 XVrTNZlOf/DRg7ocWI1pcmWi7bWk5IY33UI+agpY+MHfyfMCH24lVEgdeEymWjpSEh1PAb
 2nHB+faOqcH+8OsCWPr41tBFqvjsbNw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-311-lRJ0wM08M1CiUnrq56Paqg-1; Tue, 13 Dec 2022 08:48:24 -0500
X-MC-Unique: lRJ0wM08M1CiUnrq56Paqg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r129-20020a1c4487000000b003d153a83d27so4872169wma.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 05:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B8DJc4gXSxrGW+J32i2MG2TT7F2GQs7YoLzAMIQzveo=;
 b=O3kV9VI+yu1fQsf6QtsdmTypPGfEChWIx3c9NzEOPu0jAxpTuBRLQ2HKRSbudeeT6M
 I+Sq4Dh7qUbT9dPc4Ias472Jq2AxPZnYwSvdmp9eHnzePbGsC3y4SPzjMWvirhppndeN
 +NPfmVVnx1p9hLAopy+lBfL6iRqcWIKKqIXK8dGmg2VdjgXTsbaXNoY9acdMuNX4PE4L
 PDsu0rjxnr/etdXPj9gWnl9CkBJ5rT/irdQB1u4UZYmCoP5LrmvmsRrgnOlnE6fEWyWE
 aM+Hjh+GeBdzvg4IbFP0nXfxqZXGe2gIZkAZF84Rav6Xir6S9U8eYQW9jCuA3vBf7Rn3
 t01Q==
X-Gm-Message-State: ANoB5pliisBneFoZkV2UXFceXE8PFvm4OaL4bMJ2IAa2i8zUpIosJfnJ
 9oS8sgbBZb7ukmnVtHPffttPqG//xJfC0XDmE2z//DWtoLrMA+PybVskZKEFdjoK3PnYM8aeiEb
 7LJ6s3MJ5bbo2lQc=
X-Received: by 2002:a05:600c:3584:b0:3d1:bf7c:391c with SMTP id
 p4-20020a05600c358400b003d1bf7c391cmr14955330wmq.4.1670939302860; 
 Tue, 13 Dec 2022 05:48:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6PyX6N/M5viRxldEQSkJUxNYUJX8W4NqPhHVOkUheEPqs8PjFEVfOoUeGa2QenuW8/EQnz9g==
X-Received: by 2002:a05:600c:3584:b0:3d1:bf7c:391c with SMTP id
 p4-20020a05600c358400b003d1bf7c391cmr14955313wmq.4.1670939302418; 
 Tue, 13 Dec 2022 05:48:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a7bc395000000b003d1cc0464a2sm12164832wmj.8.2022.12.13.05.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 05:48:22 -0800 (PST)
Message-ID: <a26a73b7-3c8e-2a4b-6ffc-76847fc1e6e2@redhat.com>
Date: Tue, 13 Dec 2022 14:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 09/24] vfio-user: define socket send functions
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <366a157b3f3f9f94892eb90eee80a7dbf5d8ad12.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <366a157b3f3f9f94892eb90eee80a7dbf5d8ad12.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
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
> Also negotiate protocol version with remote server
> 
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> ---
>   hw/vfio/pci.c           |  15 ++
>   hw/vfio/pci.h           |   1 +
>   hw/vfio/user-protocol.h |  62 ++++++
>   hw/vfio/user.c          | 508 ++++++++++++++++++++++++++++++++++++++++++++++++
>   hw/vfio/user.h          |   9 +
>   5 files changed, 595 insertions(+)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index f086235..b2534b3 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3489,11 +3489,25 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>       vbasedev->proxy = proxy;
>       vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
>   
> +    if (udev->send_queued) {
> +        proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
> +    }
> +
> +    vfio_user_validate_version(proxy, &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        goto error;
> +    }
> +
>       vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
>       vbasedev->ops = &vfio_user_pci_ops;
>       vbasedev->type = VFIO_DEVICE_TYPE_PCI;
>       vbasedev->dev = DEVICE(vdev);
>   
> +    return;
> +
> +error:
> +    error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
>   }
>   
>   static void vfio_user_instance_finalize(Object *obj)
> @@ -3510,6 +3524,7 @@ static void vfio_user_instance_finalize(Object *obj)
>   
>   static Property vfio_user_pci_dev_properties[] = {
>       DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
> +    DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 27db931..c47d2f8 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -195,6 +195,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
>   struct VFIOUserPCIDevice {
>       VFIOPCIDevice device;
>       char *sock_name;
> +    bool send_queued;   /* all sends are queued */
>   };
>   
>   /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index d23877c..5de5b20 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -51,4 +51,66 @@ enum vfio_user_command {
>   #define VFIO_USER_NO_REPLY      0x10
>   #define VFIO_USER_ERROR         0x20
>   
> +
> +/*
> + * VFIO_USER_VERSION
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint16_t major;
> +    uint16_t minor;
> +    char capabilities[];
> +} VFIOUserVersion;
> +
> +#define VFIO_USER_MAJOR_VER     0
> +#define VFIO_USER_MINOR_VER     0
> +
> +#define VFIO_USER_CAP           "capabilities"
> +
> +/* "capabilities" members */
> +#define VFIO_USER_CAP_MAX_FDS   "max_msg_fds"
> +#define VFIO_USER_CAP_MAX_XFER  "max_data_xfer_size"
> +#define VFIO_USER_CAP_PGSIZES   "pgsizes"
> +#define VFIO_USER_CAP_MAP_MAX   "max_dma_maps"
> +#define VFIO_USER_CAP_MIGR      "migration"
> +
> +/* "migration" members */
> +#define VFIO_USER_CAP_PGSIZE            "pgsize"
> +#define VFIO_USER_CAP_MAX_BITMAP        "max_bitmap_size"
> +
> +/*
> + * Max FDs mainly comes into play when a device supports multiple interrupts
> + * where each ones uses an eventfd to inject it into the guest.
> + * It is clamped by the the number of FDs the qio channel supports in a
> + * single message.
> + */
> +#define VFIO_USER_DEF_MAX_FDS   8
> +#define VFIO_USER_MAX_MAX_FDS   16
> +
> +/*
> + * Max transfer limits the amount of data in region and DMA messages.
> + * Region R/W will be very small (limited by how much a single instruction
> + * can process) so just use a reasonable limit here.
> + */
> +#define VFIO_USER_DEF_MAX_XFER  (1024 * 1024)
> +#define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
> +
> +/*
> + * Default pagesizes supported is 4k.
> + */
> +#define VFIO_USER_DEF_PGSIZE    4096
> +
> +/*
> + * Default max number of DMA mappings is stolen from the
> + * linux kernel "dma_entry_limit"
> + */
> +#define VFIO_USER_DEF_MAP_MAX   65535
> +
> +/*
> + * Default max bitmap size is also take from the linux kernel,
> + * where usage of signed ints limits the VA range to 2^31 bytes.
> + * Dividing that by the number of bits per byte yields 256MB
> + */
> +#define VFIO_USER_DEF_MAX_BITMAP (256 * 1024 * 1024)
> +
>   #endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index ffd69b9..31bcc93 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -23,11 +23,19 @@
>   #include "io/channel-socket.h"
>   #include "io/channel-util.h"
>   #include "sysemu/iothread.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qjson.h"
> +#include "qapi/qmp/qnull.h"
> +#include "qapi/qmp/qstring.h"
> +#include "qapi/qmp/qnum.h"
> +#include "qapi/qmp/qbool.h"
>   #include "user.h"
>   
> +static int wait_time = 5000;   /* wait up to 5 sec for busy servers */
>   static IOThread *vfio_user_iothread;
>   
>   static void vfio_user_shutdown(VFIOProxy *proxy);
> +static int vfio_user_send_qio(VFIOProxy *proxy, VFIOUserMsg *msg);
>   static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                        VFIOUserFDs *fds);
>   static VFIOUserFDs *vfio_user_getfds(int numfds);
> @@ -35,9 +43,16 @@ static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg);
>   
>   static void vfio_user_recv(void *opaque);
>   static int vfio_user_recv_one(VFIOProxy *proxy);
> +static void vfio_user_send(void *opaque);
> +static int vfio_user_send_one(VFIOProxy *proxy);
>   static void vfio_user_cb(void *opaque);
>   
>   static void vfio_user_request(void *opaque);
> +static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
> +static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                VFIOUserFDs *fds, int rsize, bool nobql);
> +static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
> +                                  uint32_t size, uint32_t flags);
>   
>   static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
>   {
> @@ -55,6 +70,33 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
>       qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
>   }
>   
> +static int vfio_user_send_qio(VFIOProxy *proxy, VFIOUserMsg *msg)
> +{
> +    VFIOUserFDs *fds =  msg->fds;
> +    struct iovec iov = {
> +        .iov_base = msg->hdr,
> +        .iov_len = msg->hdr->size,
> +    };
> +    size_t numfds = 0;
> +    int ret, *fdp = NULL;
> +    Error *local_err = NULL;
> +
> +    if (fds != NULL && fds->send_fds != 0) {
> +        numfds = fds->send_fds;
> +        fdp = fds->fds;
> +    }
> +
> +    ret = qio_channel_writev_full(proxy->ioc, &iov, 1, fdp, numfds, 0,
> +                                  &local_err);
> +
> +    if (ret == -1) {
> +        vfio_user_set_error(msg->hdr, EIO);
> +        vfio_user_shutdown(proxy);
> +        error_report_err(local_err);
> +    }
> +    return ret;
> +}
> +
>   static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
>                                        VFIOUserFDs *fds)
>   {
> @@ -95,6 +137,7 @@ static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg)
>       msg->hdr = NULL;
>       msg->fds = NULL;
>       msg->complete = false;
> +    msg->pending = false;
>       QTAILQ_INSERT_HEAD(&proxy->free, msg, next);
>   }
>   
> @@ -383,6 +426,54 @@ err:
>       return -1;
>   }
>   
> +/*
> + * Send messages from outgoing queue when the socket buffer has space.
> + * If we deplete 'outgoing', remove ourselves from the poll list.
> + */
> +static void vfio_user_send(void *opaque)
> +{
> +    VFIOProxy *proxy = opaque;
> +
> +    QEMU_LOCK_GUARD(&proxy->lock);
> +
> +    if (proxy->state == VFIO_PROXY_CONNECTED) {
> +        while (!QTAILQ_EMPTY(&proxy->outgoing)) {
> +            if (vfio_user_send_one(proxy) < 0) {
> +                return;
> +            }
> +        }
> +        qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
> +                                       vfio_user_recv, NULL, proxy);
> +    }
> +}
> +
> +/*
> + * Send a single message.
> + *
> + * Sent async messages are freed, others are moved to pending queue.
> + */
> +static int vfio_user_send_one(VFIOProxy *proxy)
> +{
> +    VFIOUserMsg *msg;
> +    int ret;
> +
> +    msg = QTAILQ_FIRST(&proxy->outgoing);
> +    ret = vfio_user_send_qio(proxy, msg);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    QTAILQ_REMOVE(&proxy->outgoing, msg, next);
> +    if (msg->type == VFIO_MSG_ASYNC) {
> +        vfio_user_recycle(proxy, msg);
> +    } else {
> +        QTAILQ_INSERT_TAIL(&proxy->pending, msg, next);
> +        msg->pending = true;
> +    }
> +
> +    return 0;
> +}
> +
>   static void vfio_user_cb(void *opaque)
>   {
>       VFIOProxy *proxy = opaque;
> @@ -443,6 +534,134 @@ static void vfio_user_request(void *opaque)
>       }
>   }
>   
> +/*
> + * Messages are queued onto the proxy's outgoing list.
> + *
> + * It handles 3 types of messages:
> + *
> + * async messages - replies and posted writes
> + *
> + * There will be no reply from the server, so message
> + * buffers are freed after they're sent.
> + *
> + * nowait messages - map/unmap during address space transactions
> + *
> + * These are also sent async, but a reply is expected so that
> + * vfio_wait_reqs() can wait for the youngest nowait request.
> + * They transition from the outgoing list to the pending list
> + * when sent, and are freed when the reply is received.
> + *
> + * wait messages - all other requests
> + *
> + * The reply to these messages is waited for by their caller.
> + * They also transition from outgoing to pending when sent, but
> + * the message buffer is returned to the caller with the reply
> + * contents.  The caller is responsible for freeing these messages.
> + *
> + * As an optimization, if the outgoing list and the socket send
> + * buffer are empty, the message is sent inline instead of being
> + * added to the outgoing list.  The rest of the transitions are
> + * unchanged.
> + *
> + * returns 0 if the message was sent or queued
> + * returns -1 on send error
> + */
> +static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg)
> +{
> +    int ret;
> +
> +    /*
> +     * Unsent outgoing msgs - add to tail
> +     */
> +    if (!QTAILQ_EMPTY(&proxy->outgoing)) {
> +        QTAILQ_INSERT_TAIL(&proxy->outgoing, msg, next);
> +        return 0;
> +    }
> +
> +    /*
> +     * Try inline - if blocked, queue it and kick send poller
> +     */
> +    if (proxy->flags & VFIO_PROXY_FORCE_QUEUED) {
> +        ret = QIO_CHANNEL_ERR_BLOCK;
> +    } else {
> +        ret = vfio_user_send_qio(proxy, msg);
> +    }
> +    if (ret == QIO_CHANNEL_ERR_BLOCK) {
> +        QTAILQ_INSERT_HEAD(&proxy->outgoing, msg, next);
> +        qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
> +                                       vfio_user_recv, vfio_user_send,
> +                                       proxy);
> +        return 0;
> +    }
> +    if (ret == -1) {
> +        return ret;
> +    }
> +
> +    /*
> +     * Sent - free async, add others to pending
> +     */
> +    if (msg->type == VFIO_MSG_ASYNC) {
> +        vfio_user_recycle(proxy, msg);
> +    } else {
> +        QTAILQ_INSERT_TAIL(&proxy->pending, msg, next);
> +        msg->pending = true;
> +    }
> +
> +    return 0;
> +}
> +
> +static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                VFIOUserFDs *fds, int rsize, bool nobql)
> +{
> +    VFIOUserMsg *msg;
> +    bool iolock = false;
> +    int ret;
> +
> +    if (hdr->flags & VFIO_USER_NO_REPLY) {
> +        error_printf("vfio_user_send_wait on async message\n");

Shouldn't there be a vfio_user_set_error() call also ?


> +        return;
> +    }
> +
> +    /*
> +     * We may block later, so use a per-proxy lock and drop
> +     * BQL while we sleep unless 'nobql' says not to.
> +     */
> +    qemu_mutex_lock(&proxy->lock);
> +    if (!nobql) {
> +        iolock = qemu_mutex_iothread_locked();
> +        if (iolock) {
> +            qemu_mutex_unlock_iothread();
> +        }
> +    }
> +
> +    msg = vfio_user_getmsg(proxy, hdr, fds);
> +    msg->id = hdr->id;
> +    msg->rsize = rsize ? rsize : hdr->size;
> +    msg->type = VFIO_MSG_WAIT;
> +
> +    ret = vfio_user_send_queued(proxy, msg);
> +
> +    if (ret == 0) {
> +        while (!msg->complete) {
> +            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
> +                VFIOUserMsgQ *list;
> +
> +                list = msg->pending ? &proxy->pending : &proxy->outgoing;
> +                QTAILQ_REMOVE(list, msg, next);
> +                vfio_user_set_error(hdr, ETIMEDOUT);
> +                break;
> +            }
> +        }
> +    }
> +    vfio_user_recycle(proxy, msg);
> +
> +    /* lock order is BQL->proxy - don't hold proxy when getting BQL */
> +    qemu_mutex_unlock(&proxy->lock);
> +    if (iolock) {
> +        qemu_mutex_lock_iothread();
> +    }
> +}
> +
>   static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
>       QLIST_HEAD_INITIALIZER(vfio_user_sockets);
>   
> @@ -470,6 +689,15 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
>       proxy = g_malloc0(sizeof(VFIOProxy));
>       proxy->sockname = g_strdup_printf("unix:%s", sockname);
>       proxy->ioc = ioc;
> +
> +    /* init defaults */
> +    proxy->max_xfer_size = VFIO_USER_DEF_MAX_XFER;
> +    proxy->max_send_fds = VFIO_USER_DEF_MAX_FDS;
> +    proxy->max_dma = VFIO_USER_DEF_MAP_MAX;
> +    proxy->dma_pgsizes = VFIO_USER_DEF_PGSIZE;
> +    proxy->max_bitmap = VFIO_USER_DEF_MAX_BITMAP;
> +    proxy->migr_pgsize = VFIO_USER_DEF_PGSIZE;
> +
>       proxy->flags = VFIO_PROXY_CLIENT;
>       proxy->state = VFIO_PROXY_CONNECTED;
>   
> @@ -567,3 +795,283 @@ void vfio_user_disconnect(VFIOProxy *proxy)
>       g_free(proxy->sockname);
>       g_free(proxy);
>   }
> +
> +static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
> +                                  uint32_t size, uint32_t flags)
> +{
> +    static uint16_t next_id;
> +
> +    hdr->id = qatomic_fetch_inc(&next_id);
> +    hdr->command = cmd;
> +    hdr->size = size;
> +    hdr->flags = (flags & ~VFIO_USER_TYPE) | VFIO_USER_REQUEST;
> +    hdr->error_reply = 0;
> +}
> +
> +struct cap_entry {
> +    const char *name;
> +    int (*check)(VFIOProxy *proxy, QObject *qobj, Error **errp);
> +};
> +
> +static int caps_parse(VFIOProxy *proxy, QDict *qdict, struct cap_entry caps[],
> +                      Error **errp)
> +{
> +    QObject *qobj;
> +    struct cap_entry *p;
> +
> +    for (p = caps; p->name != NULL; p++) {
> +        qobj = qdict_get(qdict, p->name);
> +        if (qobj != NULL) {
> +            if (p->check(proxy, qobj, errp)) {
> +                return -1;
> +            }
> +            qdict_del(qdict, p->name);
> +        }
> +    }
> +
> +    /* warning, for now */
> +    if (qdict_size(qdict) != 0) {
> +        error_printf("spurious capabilities\n");

May be use warn_report() instead

> +    }
> +    return 0;
> +}
> +
> +static int check_migr_pgsize(VFIOProxy *proxy, QObject *qobj, Error **errp)
> +{
> +    QNum *qn = qobject_to(QNum, qobj);
> +    uint64_t pgsize;
> +
> +    if (qn == NULL || !qnum_get_try_uint(qn, &pgsize)) {
> +        error_setg(errp, "malformed %s", VFIO_USER_CAP_PGSIZE);
> +        return -1;
> +    }
> +
> +    /* must be larger than default */
> +    if (pgsize & (VFIO_USER_DEF_PGSIZE - 1)) {
> +        error_setg(errp, "pgsize 0x%"PRIx64" too small", pgsize);
> +        return -1;
> +    }
> +
> +    proxy->migr_pgsize = pgsize;
> +    return 0;
> +}
> +
> +static int check_bitmap(VFIOProxy *proxy, QObject *qobj, Error **errp)
> +{
> +    QNum *qn = qobject_to(QNum, qobj);
> +    uint64_t bitmap_size;
> +
> +    if (qn == NULL || !qnum_get_try_uint(qn, &bitmap_size)) {
> +        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_BITMAP);
> +        return -1;
> +    }
> +
> +    /* can only lower it */
> +    if (bitmap_size > VFIO_USER_DEF_MAX_BITMAP) {
> +        error_setg(errp, "%s too large", VFIO_USER_CAP_MAX_BITMAP);
> +        return -1;
> +    }
> +
> +    proxy->max_bitmap = bitmap_size;
> +    return 0;
> +}
> +
> +static struct cap_entry caps_migr[] = {
> +    { VFIO_USER_CAP_PGSIZE, check_migr_pgsize },
> +    { VFIO_USER_CAP_MAX_BITMAP, check_bitmap },
> +    { NULL }
> +};
> +
> +static int check_max_fds(VFIOProxy *proxy, QObject *qobj, Error **errp)
> +{
> +    QNum *qn = qobject_to(QNum, qobj);
> +    uint64_t max_send_fds;
> +
> +    if (qn == NULL || !qnum_get_try_uint(qn, &max_send_fds) ||
> +        max_send_fds > VFIO_USER_MAX_MAX_FDS) {
> +        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_FDS);
> +        return -1;
> +    }
> +    proxy->max_send_fds = max_send_fds;
> +    return 0;
> +}
> +
> +static int check_max_xfer(VFIOProxy *proxy, QObject *qobj, Error **errp)
> +{
> +    QNum *qn = qobject_to(QNum, qobj);
> +    uint64_t max_xfer_size;
> +
> +    if (qn == NULL || !qnum_get_try_uint(qn, &max_xfer_size) ||
> +        max_xfer_size > VFIO_USER_MAX_MAX_XFER) {
> +        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_XFER);
> +        return -1;
> +    }
> +    proxy->max_xfer_size = max_xfer_size;
> +    return 0;
> +}
> +
> +static int check_pgsizes(VFIOProxy *proxy, QObject *qobj, Error **errp)
> +{
> +    QNum *qn = qobject_to(QNum, qobj);
> +    uint64_t pgsizes;
> +
> +    if (qn == NULL || !qnum_get_try_uint(qn, &pgsizes)) {
> +        error_setg(errp, "malformed %s", VFIO_USER_CAP_PGSIZES);
> +        return -1;
> +    }
> +
> +    /* must be larger than default */
> +    if (pgsizes & (VFIO_USER_DEF_PGSIZE - 1)) {
> +        error_setg(errp, "pgsize 0x%"PRIx64" too small", pgsizes);
> +        return -1;
> +    }
> +
> +    proxy->dma_pgsizes = pgsizes;
> +    return 0;
> +}
> +
> +static int check_max_dma(VFIOProxy *proxy, QObject *qobj, Error **errp)
> +{
> +    QNum *qn = qobject_to(QNum, qobj);
> +    uint64_t max_dma;
> +
> +    if (qn == NULL || !qnum_get_try_uint(qn, &max_dma)) {
> +        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAP_MAX);
> +        return -1;
> +    }
> +
> +    /* can only lower it */
> +    if (max_dma > VFIO_USER_DEF_MAP_MAX) {
> +        error_setg(errp, "%s too large", VFIO_USER_CAP_MAP_MAX);
> +        return -1;
> +    }
> +
> +    proxy->max_dma = max_dma;
> +    return 0;
> +}
> +
> +static int check_migr(VFIOProxy *proxy, QObject *qobj, Error **errp)
> +{
> +    QDict *qdict = qobject_to(QDict, qobj);
> +
> +    if (qdict == NULL) {
> +        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_FDS);
> +        return -1;
> +    }
> +    return caps_parse(proxy, qdict, caps_migr, errp);
> +}
> +
> +static struct cap_entry caps_cap[] = {
> +    { VFIO_USER_CAP_MAX_FDS, check_max_fds },
> +    { VFIO_USER_CAP_MAX_XFER, check_max_xfer },
> +    { VFIO_USER_CAP_PGSIZES, check_pgsizes },
> +    { VFIO_USER_CAP_MAP_MAX, check_max_dma },
> +    { VFIO_USER_CAP_MIGR, check_migr },
> +    { NULL }
> +};
> +
> +static int check_cap(VFIOProxy *proxy, QObject *qobj, Error **errp)
> +{
> +   QDict *qdict = qobject_to(QDict, qobj);
> +
> +    if (qdict == NULL) {
> +        error_setg(errp, "malformed %s", VFIO_USER_CAP);
> +        return -1;
> +    }
> +    return caps_parse(proxy, qdict, caps_cap, errp);
> +}
> +
> +static struct cap_entry ver_0_0[] = {
> +    { VFIO_USER_CAP, check_cap },
> +    { NULL }
> +};
> +
> +static int caps_check(VFIOProxy *proxy, int minor, const char *caps,

what is the minor parameter for ?

Thanks,

C.

> +                      Error **errp)
> +{
> +    QObject *qobj;
> +    QDict *qdict;
> +    int ret;
> +
> +    qobj = qobject_from_json(caps, NULL);
> +    if (qobj == NULL) {
> +        error_setg(errp, "malformed capabilities %s", caps);
> +        return -1;
> +    }
> +    qdict = qobject_to(QDict, qobj);
> +    if (qdict == NULL) {
> +        error_setg(errp, "capabilities %s not an object", caps);
> +        qobject_unref(qobj);
> +        return -1;
> +    }
> +    ret = caps_parse(proxy, qdict, ver_0_0, errp);
> +
> +    qobject_unref(qobj);
> +    return ret;
> +}
> +
> +static GString *caps_json(void)
> +{
> +    QDict *dict = qdict_new();
> +    QDict *capdict = qdict_new();
> +    QDict *migdict = qdict_new();
> +    GString *str;
> +
> +    qdict_put_int(migdict, VFIO_USER_CAP_PGSIZE, VFIO_USER_DEF_PGSIZE);
> +    qdict_put_int(migdict, VFIO_USER_CAP_MAX_BITMAP, VFIO_USER_DEF_MAX_BITMAP);
> +    qdict_put_obj(capdict, VFIO_USER_CAP_MIGR, QOBJECT(migdict));
> +
> +    qdict_put_int(capdict, VFIO_USER_CAP_MAX_FDS, VFIO_USER_MAX_MAX_FDS);
> +    qdict_put_int(capdict, VFIO_USER_CAP_MAX_XFER, VFIO_USER_DEF_MAX_XFER);
> +    qdict_put_int(capdict, VFIO_USER_CAP_PGSIZES, VFIO_USER_DEF_PGSIZE);
> +    qdict_put_int(capdict, VFIO_USER_CAP_MAP_MAX, VFIO_USER_DEF_MAP_MAX);
> +
> +    qdict_put_obj(dict, VFIO_USER_CAP, QOBJECT(capdict));
> +
> +    str = qobject_to_json(QOBJECT(dict));
> +    qobject_unref(dict);
> +    return str;
> +}
> +
> +int vfio_user_validate_version(VFIOProxy *proxy, Error **errp)
> +{
> +    g_autofree VFIOUserVersion *msgp;
> +    GString *caps;
> +    char *reply;
> +    int size, caplen;
> +
> +    caps = caps_json();
> +    caplen = caps->len + 1;
> +    size = sizeof(*msgp) + caplen;
> +    msgp = g_malloc0(size);
> +
> +    vfio_user_request_msg(&msgp->hdr, VFIO_USER_VERSION, size, 0);
> +    msgp->major = VFIO_USER_MAJOR_VER;
> +    msgp->minor = VFIO_USER_MINOR_VER;
> +    memcpy(&msgp->capabilities, caps->str, caplen);
> +    g_string_free(caps, true);
> +
> +    vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
> +    if (msgp->hdr.flags & VFIO_USER_ERROR) {
> +        error_setg_errno(errp, msgp->hdr.error_reply, "version reply");
> +        return -1;
> +    }
> +
> +    if (msgp->major != VFIO_USER_MAJOR_VER ||
> +        msgp->minor > VFIO_USER_MINOR_VER) {
> +        error_setg(errp, "incompatible server version");
> +        return -1;
> +    }
> +
> +    reply = msgp->capabilities;
> +    if (reply[msgp->hdr.size - sizeof(*msgp) - 1] != '\0') {
> +        error_setg(errp, "corrupt version reply");
> +        return -1;
> +    }
> +
> +    if (caps_check(proxy, msgp->minor, reply, errp) != 0) {
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index 68a1080..8ce3cd9 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -35,6 +35,7 @@ typedef struct VFIOUserMsg {
>       uint32_t id;
>       QemuCond cv;
>       bool complete;
> +    bool pending;
>       enum msg_type type;
>   } VFIOUserMsg;
>   
> @@ -54,6 +55,12 @@ typedef struct VFIOProxy {
>       struct QIOChannel *ioc;
>       void (*request)(void *opaque, VFIOUserMsg *msg);
>       void *req_arg;
> +    uint64_t max_xfer_size;
> +    uint64_t max_send_fds;
> +    uint64_t max_dma;
> +    uint64_t dma_pgsizes;
> +    uint64_t max_bitmap;
> +    uint64_t migr_pgsize;
>       int flags;
>       QemuCond close_cv;
>       AioContext *ctx;
> @@ -76,11 +83,13 @@ typedef struct VFIOProxy {
>   
>   /* VFIOProxy flags */
>   #define VFIO_PROXY_CLIENT        0x1
> +#define VFIO_PROXY_FORCE_QUEUED  0x4
>   
>   VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
>   void vfio_user_disconnect(VFIOProxy *proxy);
>   void vfio_user_set_handler(VFIODevice *vbasedev,
>                              void (*handler)(void *opaque, VFIOUserMsg *msg),
>                              void *reqarg);
> +int vfio_user_validate_version(VFIOProxy *proxy, Error **errp);
>   
>   #endif /* VFIO_USER_H */


