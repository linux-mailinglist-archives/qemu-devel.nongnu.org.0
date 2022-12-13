Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8164B37D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 11:46:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p52mf-0003fv-Ej; Tue, 13 Dec 2022 05:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p52mc-0003fm-N9
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 05:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p52mY-0008WD-Vx
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 05:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670928305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiAbV75WXVd3rL+wEJL/NzISo8tzUjc+8DgvAaGGkcY=;
 b=YbAdDx8Z9G9qbmJNPMkYTckPfknW9XTlb1WAKohsoEkRDBAZAx1FTMgyRNpDfDKjXyIKKX
 ZUmZ5sTIHTwaNUKj8pUwRtbGpF9bYNRqflipqCwAOOYJOGEGL5S7oni3B0T2+C8TV4vGKI
 DmdWsP2ouR5Y7x+jGRYOD85rBEtOBto=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-166-IXsfhf6nM8W6lAlipN45YA-1; Tue, 13 Dec 2022 05:45:03 -0500
X-MC-Unique: IXsfhf6nM8W6lAlipN45YA-1
Received: by mail-wr1-f70.google.com with SMTP id
 r6-20020adfbb06000000b002455227c5c5so2796434wrg.20
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 02:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iiAbV75WXVd3rL+wEJL/NzISo8tzUjc+8DgvAaGGkcY=;
 b=zkXOew+b/hMhYP2/62csUAZyq7U9xgW6AsQKMdtpN7LBW06XAbZ7a4UfiNkh/fSF+8
 WTOb7M5zbC4HRtBh1q5Vt5x3mMMmnZ5pb1rq24dbiGxKFVcoLJy2k6LHZB5Uk4ulkj4C
 2MQz9fG3m/QtYwKmYG9bgYM0RKuW3QHHLXT3MfwVwVY4Y63xk30JgTYNRnFx96Q9Dmnq
 +tXN9yVQkzZtm1LNqmSeQv8TKMEjnnbF5wbnUXqTmJFRHQn6mPqB3NNobp7+6fL4/dIT
 uM/U6EL2kVoWIFvVp27/2tqMBvQiyXE7LiYfAVL6EfFARCuyZehlcAyav7KKsw6gEimU
 itxg==
X-Gm-Message-State: ANoB5pm/e76dy4sM5nslTV3oLNcdBqHjMG1b65y5+vLvpDP5sxxUoS7M
 WxcOrziPKioVhlVArcgcIPErebmiYy0EdTGYL/skOwSz8laYwMBpUf5uFtrkgycaqeHiGcprQcM
 i3LGFtXyl6Kt8bEI=
X-Received: by 2002:adf:f902:0:b0:232:be5b:a22f with SMTP id
 b2-20020adff902000000b00232be5ba22fmr10829795wrr.59.1670928302459; 
 Tue, 13 Dec 2022 02:45:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5EKP189MAdluJgnhjYjli0y5xHc2+OyhURlullLpB8tuGZ0W2Alo1YcooeQTVILXFWuDsuDQ==
X-Received: by 2002:adf:f902:0:b0:232:be5b:a22f with SMTP id
 b2-20020adff902000000b00232be5ba22fmr10829781wrr.59.1670928302024; 
 Tue, 13 Dec 2022 02:45:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4b84000000b00236c1f2cecesm13700516wrt.81.2022.12.13.02.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 02:45:01 -0800 (PST)
Message-ID: <e4201593-a13a-56a2-ac9b-e6f46cc90509@redhat.com>
Date: Tue, 13 Dec 2022 11:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 08/24] vfio-user: define socket receive functions
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <297c4b40b5f99c26ad78c7d2a729db436951b5f9.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <297c4b40b5f99c26ad78c7d2a729db436951b5f9.1667542066.git.john.g.johnson@oracle.com>
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
> Add infrastructure needed to receive incoming messages
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   MAINTAINERS             |   1 +
>   hw/vfio/pci.c           |  11 ++
>   hw/vfio/user-protocol.h |  54 +++++++
>   hw/vfio/user.c          | 399 ++++++++++++++++++++++++++++++++++++++++++++++++
>   hw/vfio/user.h          |   8 +
>   5 files changed, 473 insertions(+)
>   create mode 100644 hw/vfio/user-protocol.h>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d64d02..b6c186b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1993,6 +1993,7 @@ S: Supported
>   F: docs/devel/vfio-user.rst
>   F: hw/vfio/user.c
>   F: hw/vfio/user.h
> +F: hw/vfio/user-protocol.h
>   
>   vhost
>   M: Michael S. Tsirkin <mst@redhat.com>
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index e5f2413..f086235 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3432,6 +3432,16 @@ type_init(register_vfio_pci_dev_type)
>    */
>   
>   /*
> + * Incoming request message callback.
> + *
> + * Runs off main loop, so BQL held.
> + */
> +static void vfio_user_pci_process_req(void *opaque, VFIOUserMsg *msg)
> +{
> +
> +}
> +
> +/*
>    * Emulated devices don't use host hot reset
>    */
>   static void vfio_user_compute_needs_reset(VFIODevice *vbasedev)
> @@ -3477,6 +3487,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>           return;
>       }
>       vbasedev->proxy = proxy;
> +    vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
>   
>       vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
>       vbasedev->ops = &vfio_user_pci_ops;
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> new file mode 100644
> index 0000000..d23877c
> --- /dev/null
> +++ b/hw/vfio/user-protocol.h
> @@ -0,0 +1,54 @@
> +#ifndef VFIO_USER_PROTOCOL_H
> +#define VFIO_USER_PROTOCOL_H
> +
> +/*
> + * vfio protocol over a UNIX socket.
> + *
> + * Copyright © 2018, 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Each message has a standard header that describes the command
> + * being sent, which is almost always a VFIO ioctl().
> + *
> + * The header may be followed by command-specific data, such as the
> + * region and offset info for read and write commands.
> + */
> +
> +typedef struct {
> +    uint16_t id;
> +    uint16_t command;
> +    uint32_t size;
> +    uint32_t flags;
> +    uint32_t error_reply;
> +} VFIOUserHdr;
> +
> +/* VFIOUserHdr commands */
> +enum vfio_user_command {
> +    VFIO_USER_VERSION                   = 1,
> +    VFIO_USER_DMA_MAP                   = 2,
> +    VFIO_USER_DMA_UNMAP                 = 3,
> +    VFIO_USER_DEVICE_GET_INFO           = 4,
> +    VFIO_USER_DEVICE_GET_REGION_INFO    = 5,
> +    VFIO_USER_DEVICE_GET_REGION_IO_FDS  = 6,
> +    VFIO_USER_DEVICE_GET_IRQ_INFO       = 7,
> +    VFIO_USER_DEVICE_SET_IRQS           = 8,
> +    VFIO_USER_REGION_READ               = 9,
> +    VFIO_USER_REGION_WRITE              = 10,
> +    VFIO_USER_DMA_READ                  = 11,
> +    VFIO_USER_DMA_WRITE                 = 12,
> +    VFIO_USER_DEVICE_RESET              = 13,
> +    VFIO_USER_DIRTY_PAGES               = 14,
> +    VFIO_USER_MAX,
> +};
> +
> +/* VFIOUserHdr flags */
> +#define VFIO_USER_REQUEST       0x0
> +#define VFIO_USER_REPLY         0x1
> +#define VFIO_USER_TYPE          0xF
> +
> +#define VFIO_USER_NO_REPLY      0x10
> +#define VFIO_USER_ERROR         0x20
> +
> +#endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 4f09060..ffd69b9 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -28,7 +28,22 @@
>   static IOThread *vfio_user_iothread;
>   
>   static void vfio_user_shutdown(VFIOProxy *proxy);
> +static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                     VFIOUserFDs *fds);
> +static VFIOUserFDs *vfio_user_getfds(int numfds);
> +static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg);
>   
> +static void vfio_user_recv(void *opaque);
> +static int vfio_user_recv_one(VFIOProxy *proxy);
> +static void vfio_user_cb(void *opaque);
> +
> +static void vfio_user_request(void *opaque);
> +
> +static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
> +{
> +    hdr->flags |= VFIO_USER_ERROR;
> +    hdr->error_reply = err;
> +}
>   
>   /*
>    * Functions called by main, CPU, or iothread threads
> @@ -40,10 +55,334 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
>       qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
>   }
>   
> +static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
> +                                     VFIOUserFDs *fds)
> +{
> +    VFIOUserMsg *msg;
> +
> +    msg = QTAILQ_FIRST(&proxy->free);
> +    if (msg != NULL) {
> +        QTAILQ_REMOVE(&proxy->free, msg, next);
> +    } else {
> +        msg = g_malloc0(sizeof(*msg));
> +        qemu_cond_init(&msg->cv);
> +    }
> +
> +    msg->hdr = hdr;
> +    msg->fds = fds;
> +    return msg;
> +}
> +
> +/*
> + * Recycle a message list entry to the free list.
> + */
> +static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg)
> +{
> +    if (msg->type == VFIO_MSG_NONE) {
> +        error_printf("vfio_user_recycle - freeing free msg\n");
> +        return;
> +    }
> +
> +    /* free msg buffer if no one is waiting to consume the reply */
> +    if (msg->type == VFIO_MSG_NOWAIT || msg->type == VFIO_MSG_ASYNC) {
> +        g_free(msg->hdr);
> +        if (msg->fds != NULL) {
> +            g_free(msg->fds);
> +        }
> +    }
> +
> +    msg->type = VFIO_MSG_NONE;
> +    msg->hdr = NULL;
> +    msg->fds = NULL;
> +    msg->complete = false;
> +    QTAILQ_INSERT_HEAD(&proxy->free, msg, next);
> +}
> +
> +static VFIOUserFDs *vfio_user_getfds(int numfds)
> +{
> +    VFIOUserFDs *fds = g_malloc0(sizeof(*fds) + (numfds * sizeof(int)));
> +
> +    fds->fds = (int *)((char *)fds + sizeof(*fds));

may be change the fds field of VFIOUserFDs struct to fds[];

> +
> +    return fds;
> +}
> +
>   /*
>    * Functions only called by iothread
>    */
>   
> +/*
> + * Process a received message.
> + */
> +static void vfio_user_process(VFIOProxy *proxy, VFIOUserMsg *msg, bool isreply)
> +{
> +
> +    /*
> +     * Replies signal a waiter, if none just check for errors
> +     * and free the message buffer.
> +     *
> +     * Requests get queued for the BH.
> +     */
> +    if (isreply) {
> +        msg->complete = true;
> +        if (msg->type == VFIO_MSG_WAIT) {
> +            qemu_cond_signal(&msg->cv);
> +        } else {
> +            if (msg->hdr->flags & VFIO_USER_ERROR) {
> +                error_printf("vfio_user_rcv:  error reply on async request ");
> +                error_printf("command %x error %s\n", msg->hdr->command,
> +                             strerror(msg->hdr->error_reply));
> +            }
> +            /* youngest nowait msg has been ack'd */
> +            if (proxy->last_nowait == msg) {
> +                proxy->last_nowait = NULL;
> +            }
> +            vfio_user_recycle(proxy, msg);
> +        }
> +    } else {
> +        QTAILQ_INSERT_TAIL(&proxy->incoming, msg, next);
> +        qemu_bh_schedule(proxy->req_bh);
> +    }
> +}
> +
> +/*
> + * Complete a partial message read
> + */
> +static int vfio_user_complete(VFIOProxy *proxy, Error **errp)
> +{
> +    VFIOUserMsg *msg = proxy->part_recv;
> +    size_t msgleft = proxy->recv_left;
> +    bool isreply;
> +    char *data;
> +    int ret;
> +
> +    data = (char *)msg->hdr + (msg->hdr->size - msgleft);
> +    while (msgleft > 0) {
> +        ret = qio_channel_read(proxy->ioc, data, msgleft, errp);
> +
> +        /* error or would block */
> +        if (ret <= 0) {
> +            /* try for rest on next iternation */
> +            if (ret == QIO_CHANNEL_ERR_BLOCK) {
> +                proxy->recv_left = msgleft;
> +            }
> +            return ret;
> +        }
> +
> +        msgleft -= ret;
> +        data += ret;
> +    }
> +
> +    /*
> +     * Read complete message, process it.
> +     */
> +    proxy->part_recv = NULL;
> +    proxy->recv_left = 0;
> +    isreply = (msg->hdr->flags & VFIO_USER_TYPE) == VFIO_USER_REPLY;
> +    vfio_user_process(proxy, msg, isreply);
> +
> +    /* return positive value */
> +    return 1;
> +}
> +
> +static void vfio_user_recv(void *opaque)
> +{
> +    VFIOProxy *proxy = opaque;
> +
> +    QEMU_LOCK_GUARD(&proxy->lock);
> +
> +    if (proxy->state == VFIO_PROXY_CONNECTED) {
> +        while (vfio_user_recv_one(proxy) == 0) {
> +            ;
> +        }
> +    }
> +}
> +
> +/*
> + * Receive and process one incoming message.
> + *
> + * For replies, find matching outgoing request and wake any waiters.
> + * For requests, queue in incoming list and run request BH.
> + */
> +static int vfio_user_recv_one(VFIOProxy *proxy)
> +{
> +    VFIOUserMsg *msg = NULL;
> +    g_autofree int *fdp = NULL;
> +    VFIOUserFDs *reqfds;
> +    VFIOUserHdr hdr;
> +    struct iovec iov = {
> +        .iov_base = &hdr,
> +        .iov_len = sizeof(hdr),
> +    };
> +    bool isreply = false;
> +    int i, ret;
> +    size_t msgleft, numfds = 0;
> +    char *data = NULL;
> +    char *buf = NULL;
> +    Error *local_err = NULL;
> +
> +    /*
> +     * Complete any partial reads
> +     */
> +    if (proxy->part_recv != NULL) {
> +        ret = vfio_user_complete(proxy, &local_err);
> +
> +        /* still not complete, try later */
> +        if (ret == QIO_CHANNEL_ERR_BLOCK) {
> +            return ret;
> +        }
> +
> +        if (ret <= 0) {
> +            goto fatal;
> +        }
> +        /* else fall into reading another msg */
> +    }
> +
> +    /*
> +     * Read header
> +     */
> +    ret = qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds,
> +                                 &local_err);
> +    if (ret == QIO_CHANNEL_ERR_BLOCK) {
> +        return ret;
> +    }
> +
> +    /* read error or other side closed connection */
> +    if (ret <= 0) {
> +        goto fatal;
> +    }
> +
> +    if (ret < sizeof(msg)) {
> +        error_setg(&local_err, "short read of header");
> +        goto fatal;
> +    }
> +
> +    /*
> +     * Validate header
> +     */
> +    if (hdr.size < sizeof(VFIOUserHdr)) {
> +        error_setg(&local_err, "bad header size");
> +        goto fatal;
> +    }
> +    switch (hdr.flags & VFIO_USER_TYPE) {
> +    case VFIO_USER_REQUEST:
> +        isreply = false;
> +        break;
> +    case VFIO_USER_REPLY:
> +        isreply = true;
> +        break;
> +    default:
> +        error_setg(&local_err, "unknown message type");
> +        goto fatal;
> +    }
> +
> +    /*
> +     * For replies, find the matching pending request.
> +     * For requests, reap incoming FDs.
> +     */
> +    if (isreply) {
> +        QTAILQ_FOREACH(msg, &proxy->pending, next) {
> +            if (hdr.id == msg->id) {
> +                break;
> +            }
> +        }
> +        if (msg == NULL) {
> +            error_setg(&local_err, "unexpected reply");
> +            goto err;
> +        }
> +        QTAILQ_REMOVE(&proxy->pending, msg, next);
> +
> +        /*
> +         * Process any received FDs
> +         */
> +        if (numfds != 0) {
> +            if (msg->fds == NULL || msg->fds->recv_fds < numfds) {
> +                error_setg(&local_err, "unexpected FDs");
> +                goto err;
> +            }
> +            msg->fds->recv_fds = numfds;
> +            memcpy(msg->fds->fds, fdp, numfds * sizeof(int));
> +        }
> +    } else {
> +        if (numfds != 0) {
> +            reqfds = vfio_user_getfds(numfds);
> +            memcpy(reqfds->fds, fdp, numfds * sizeof(int));
> +        } else {
> +            reqfds = NULL;
> +        }
> +    }

Looks good. Pity we can not use the chardev/char-socket.c code.

Thanks,

C.

> +    /*
> +     * Put the whole message into a single buffer.
> +     */
> +    if (isreply) {
> +        if (hdr.size > msg->rsize) {
> +            error_setg(&local_err, "reply larger than recv buffer");
> +            goto err;
> +        }
> +        *msg->hdr = hdr;
> +        data = (char *)msg->hdr + sizeof(hdr);
> +    } else {
> +        buf = g_malloc0(hdr.size);
> +        memcpy(buf, &hdr, sizeof(hdr));
> +        data = buf + sizeof(hdr);
> +        msg = vfio_user_getmsg(proxy, (VFIOUserHdr *)buf, reqfds);
> +        msg->type = VFIO_MSG_REQ;
> +    }
> +
> +    /*
> +     * Read rest of message.
> +     */
> +    msgleft = hdr.size - sizeof(hdr);
> +    while (msgleft > 0) {
> +        ret = qio_channel_read(proxy->ioc, data, msgleft, &local_err);
> +
> +        /* prepare to complete read on next iternation */
> +        if (ret == QIO_CHANNEL_ERR_BLOCK) {
> +            proxy->part_recv = msg;
> +            proxy->recv_left = msgleft;
> +            return ret;
> +        }
> +
> +        if (ret <= 0) {
> +            goto fatal;
> +        }
> +
> +        msgleft -= ret;
> +        data += ret;
> +    }
> +
> +    vfio_user_process(proxy, msg, isreply);
> +    return 0;
> +
> +    /*
> +     * fatal means the other side closed or we don't trust the stream
> +     * err means this message is corrupt
> +     */
> +fatal:
> +    vfio_user_shutdown(proxy);
> +    proxy->state = VFIO_PROXY_ERROR;
> +
> +    /* set error if server side closed */
> +    if (ret == 0) {
> +        error_setg(&local_err, "server closed socket");
> +    }
> +
> +err:
> +    for (i = 0; i < numfds; i++) {
> +        close(fdp[i]);
> +    }
> +    if (isreply && msg != NULL) {
> +        /* force an error to keep sending thread from hanging */
> +        vfio_user_set_error(msg->hdr, EINVAL);
> +        msg->complete = true;
> +        qemu_cond_signal(&msg->cv);
> +    }
> +    error_prepend(&local_err, "vfio_user_recv: ");
> +    error_report_err(local_err);
> +    return -1;
> +}
> +
>   static void vfio_user_cb(void *opaque)
>   {
>       VFIOProxy *proxy = opaque;
> @@ -59,6 +398,51 @@ static void vfio_user_cb(void *opaque)
>    * Functions called by main or CPU threads
>    */
>   
> +/*
> + * Process incoming requests.
> + *
> + * The bus-specific callback has the form:
> + *    request(opaque, msg)
> + * where 'opaque' was specified in vfio_user_set_handler
> + * and 'msg' is the inbound message.
> + *
> + * The callback is responsible for disposing of the message buffer,
> + * usually by re-using it when calling vfio_send_reply or vfio_send_error,
> + * both of which free their message buffer when the reply is sent.
> + *
> + * If the callback uses a new buffer, it needs to free the old one.
> + */
> +static void vfio_user_request(void *opaque)
> +{
> +    VFIOProxy *proxy = opaque;
> +    VFIOUserMsgQ new, free;
> +    VFIOUserMsg *msg, *m1;
> +
> +    /* reap all incoming */
> +    QTAILQ_INIT(&new);
> +    WITH_QEMU_LOCK_GUARD(&proxy->lock) {
> +        QTAILQ_FOREACH_SAFE(msg, &proxy->incoming, next, m1) {
> +            QTAILQ_REMOVE(&proxy->incoming, msg, next);
> +            QTAILQ_INSERT_TAIL(&new, msg, next);
> +        }
> +    }
> +
> +    /* process list */
> +    QTAILQ_INIT(&free);
> +    QTAILQ_FOREACH_SAFE(msg, &new, next, m1) {
> +        QTAILQ_REMOVE(&new, msg, next);
> +        proxy->request(proxy->req_arg, msg);
> +        QTAILQ_INSERT_HEAD(&free, msg, next);
> +    }
> +
> +    /* free list */
> +    WITH_QEMU_LOCK_GUARD(&proxy->lock) {
> +        QTAILQ_FOREACH_SAFE(msg, &free, next, m1) {
> +            vfio_user_recycle(proxy, msg);
> +        }
> +    }
> +}
> +
>   static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
>       QLIST_HEAD_INITIALIZER(vfio_user_sockets);
>   
> @@ -97,6 +481,7 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
>       }
>   
>       proxy->ctx = iothread_get_aio_context(vfio_user_iothread);
> +    proxy->req_bh = qemu_bh_new(vfio_user_request, proxy);
>   
>       QTAILQ_INIT(&proxy->outgoing);
>       QTAILQ_INIT(&proxy->incoming);
> @@ -107,6 +492,18 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
>       return proxy;
>   }
>   
> +void vfio_user_set_handler(VFIODevice *vbasedev,
> +                           void (*handler)(void *opaque, VFIOUserMsg *msg),
> +                           void *req_arg)
> +{
> +    VFIOProxy *proxy = vbasedev->proxy;
> +
> +    proxy->request = handler;
> +    proxy->req_arg = req_arg;
> +    qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
> +                                   vfio_user_recv, NULL, proxy);
> +}
> +
>   void vfio_user_disconnect(VFIOProxy *proxy)
>   {
>       VFIOUserMsg *r1, *r2;
> @@ -122,6 +519,8 @@ void vfio_user_disconnect(VFIOProxy *proxy)
>       }
>       object_unref(OBJECT(proxy->ioc));
>       proxy->ioc = NULL;
> +    qemu_bh_delete(proxy->req_bh);
> +    proxy->req_bh = NULL;
>   
>       proxy->state = VFIO_PROXY_CLOSING;
>       QTAILQ_FOREACH_SAFE(r1, &proxy->outgoing, next, r2) {
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index da92862..68a1080 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -11,6 +11,8 @@
>    *
>    */
>   
> +#include "user-protocol.h"
> +
>   typedef struct {
>       int send_fds;
>       int recv_fds;
> @@ -27,6 +29,7 @@ enum msg_type {
>   
>   typedef struct VFIOUserMsg {
>       QTAILQ_ENTRY(VFIOUserMsg) next;
> +    VFIOUserHdr *hdr;
>       VFIOUserFDs *fds;
>       uint32_t rsize;
>       uint32_t id;
> @@ -66,6 +69,8 @@ typedef struct VFIOProxy {
>       VFIOUserMsgQ incoming;
>       VFIOUserMsgQ outgoing;
>       VFIOUserMsg *last_nowait;
> +    VFIOUserMsg *part_recv;
> +    size_t recv_left;
>       enum proxy_state state;
>   } VFIOProxy;
>   
> @@ -74,5 +79,8 @@ typedef struct VFIOProxy {
>   
>   VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
>   void vfio_user_disconnect(VFIOProxy *proxy);
> +void vfio_user_set_handler(VFIODevice *vbasedev,
> +                           void (*handler)(void *opaque, VFIOUserMsg *msg),
> +                           void *reqarg);
>   
>   #endif /* VFIO_USER_H */


