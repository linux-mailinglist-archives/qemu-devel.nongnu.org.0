Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B4464A4BD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:25:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4lby-0000Vm-Nb; Mon, 12 Dec 2022 11:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p4lbw-0000VL-C8
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:25:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p4lbu-0002Cl-42
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670862297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iw8U+eJ2dKXf/FHxcseMsez9K3MU2ePycfnj35q8KY0=;
 b=AKFsysu/epu0kjxq93NlQXl13YLAIP8aeQMP+MuzkOZ4LtK2gKrB+S0J7g1sn9JqJR79KY
 olz87wlHEa2p5Iad/CVyNnGqXWR2nSAR1rxxtVlQpBh0AnJyvePESo1nXQt3ZDfqe/S2GY
 G70c9cOuwhhMhGeiWKXKU3YR64FC+9w=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-k6oTaSEIM4qDJa9gBPO8UA-1; Mon, 12 Dec 2022 11:24:55 -0500
X-MC-Unique: k6oTaSEIM4qDJa9gBPO8UA-1
Received: by mail-qk1-f200.google.com with SMTP id
 w14-20020a05620a424e00b006fc46116f7dso14349369qko.12
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iw8U+eJ2dKXf/FHxcseMsez9K3MU2ePycfnj35q8KY0=;
 b=Quieq5osv7PaScJ0048afI/SKYrZhyFS+B997f3fMrMM8ZvMqYi1B6p93/GzkJ6I/d
 jvDH2k++lIEcc/BOC8YQJIG7Uj+GO4eM9u4OhLD8a95drLWg6cuhE8TBDLurtZ+ebrDg
 pDrwdJb9DYyyJgZ6Meam6QCQtOSHIYfs3DEglZHgjNElsm1KP9VDYGj+FLitSZmjvACI
 soeCC1R7oPkr1GIHtJ3WVzTSHzUIUQ/bgnrG1aTM7fDw9z7Lxb74jRVfa5VcyPhacY45
 Elk1zH7HOPJo5xKjzakdm9LEuRGSTO2UduFPf5ErlQbmdfPRHmShVqewwlpec07IS2V9
 /D1A==
X-Gm-Message-State: ANoB5pllFC4FmhTV9/TScN+/LVjbRPSgcG+YfZwKAMQKURSNtXfSPY6c
 Hs6T8YR1cO0lg6jH/Lw0daYRbqJzDC3qacnAHVXcqqea48p4urNAX9mbszMkPhExRLwuarvKig9
 C1Lkj2KY4K0han3w=
X-Received: by 2002:ac8:5413:0:b0:3a8:7ca:644d with SMTP id
 b19-20020ac85413000000b003a807ca644dmr16958611qtq.68.1670862294981; 
 Mon, 12 Dec 2022 08:24:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7xVhbShFDelPO7hAmgIxsv9SToPjBrGf66PGYsbC4c9isxQr8n0ITihefIFtgAlNlrE3qEXQ==
X-Received: by 2002:ac8:5413:0:b0:3a8:7ca:644d with SMTP id
 b19-20020ac85413000000b003a807ca644dmr16958589qtq.68.1670862294618; 
 Mon, 12 Dec 2022 08:24:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 e3-20020ac81303000000b003a580cd979asm5902233qtj.58.2022.12.12.08.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 08:24:54 -0800 (PST)
Message-ID: <7bb5cc2a-44bf-3dee-22f3-1d422e265272@redhat.com>
Date: Mon, 12 Dec 2022 17:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 07/24] vfio-user: connect vfio proxy to remote server
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <4160c1d364dc64f9e70445a905b2cc5ba3ba9c5b.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <4160c1d364dc64f9e70445a905b2cc5ba3ba9c5b.1667542066.git.john.g.johnson@oracle.com>
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
> add user.c & user.h files for vfio-user code
> add proxy struct to handle comms with remote server
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   MAINTAINERS                   |   4 +
>   hw/vfio/meson.build           |   1 +
>   hw/vfio/pci.c                 |  19 +++++
>   hw/vfio/user.c                | 170 ++++++++++++++++++++++++++++++++++++++++++
>   hw/vfio/user.h                |  78 +++++++++++++++++++
>   include/hw/vfio/vfio-common.h |   2 +
>   6 files changed, 274 insertions(+)
>   create mode 100644 hw/vfio/user.c
>   create mode 100644 hw/vfio/user.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 999340d..5d64d02 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1987,8 +1987,12 @@ L: qemu-s390x@nongnu.org
>   vfio-user
>   M: John G Johnson <john.g.johnson@oracle.com>
>   M: Thanos Makatos <thanos.makatos@nutanix.com>
> +M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> +M: Jagannathan Raman <jag.raman@oracle.com>
>   S: Supported
>   F: docs/devel/vfio-user.rst
> +F: hw/vfio/user.c
> +F: hw/vfio/user.h
>   
>   vhost
>   M: Michael S. Tsirkin <mst@redhat.com>
> diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
> index da9af29..2f86f72 100644
> --- a/hw/vfio/meson.build
> +++ b/hw/vfio/meson.build
> @@ -9,6 +9,7 @@ vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
>     'pci-quirks.c',
>     'pci.c',
>   ))
> +vfio_ss.add(when: 'CONFIG_VFIO_USER', if_true: files('user.c'))
>   vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
>   vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))
>   vfio_ss.add(when: 'CONFIG_VFIO_XGMAC', if_true: files('calxeda-xgmac.c'))
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index dc19869..e5f2413 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -43,6 +43,7 @@
>   #include "qapi/error.h"
>   #include "migration/blocker.h"
>   #include "migration/qemu-file.h"
> +#include "hw/vfio/user.h"
>   
>   /* convenience macros for PCI config space */
>   #define VDEV_CONFIG_READ(vbasedev, off, size, data) \
> @@ -3452,6 +3453,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>       VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
>       VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>       VFIODevice *vbasedev = &vdev->vbasedev;
> +    SocketAddress addr;
> +    VFIOProxy *proxy;
> +    Error *err = NULL;
>   
>       /*
>        * TODO: make option parser understand SocketAddress
> @@ -3464,6 +3468,16 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>           return;
>       }
>   
> +    memset(&addr, 0, sizeof(addr));
> +    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
> +    addr.u.q_unix.path = udev->sock_name;
> +    proxy = vfio_user_connect_dev(&addr, &err);
> +    if (!proxy) {

The underlying error of vfio_user_connect_dev() should be propagated.

> +        error_setg(errp, "Remote proxy not found");
> +        return;
> +    }
> +    vbasedev->proxy = proxy;
> +
>       vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
>       vbasedev->ops = &vfio_user_pci_ops;
>       vbasedev->type = VFIO_DEVICE_TYPE_PCI;
> @@ -3474,8 +3488,13 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>   static void vfio_user_instance_finalize(Object *obj)
>   {
>       VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>   
>       vfio_put_device(vdev);
> +
> +    if (vbasedev->proxy != NULL) {

could be an assert ?

> +        vfio_user_disconnect(vbasedev->proxy);
> +    }
>   }
>   
>   static Property vfio_user_pci_dev_properties[] = {
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> new file mode 100644
> index 0000000..4f09060
> --- /dev/null
> +++ b/hw/vfio/user.c
> @@ -0,0 +1,170 @@
> +/*
> + * vfio protocol over a UNIX socket.
> + *
> + * Copyright © 2018, 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include <linux/vfio.h>
> +#include <sys/ioctl.h>
> +
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
> +#include "qemu/main-loop.h"
> +#include "hw/hw.h"
> +#include "hw/vfio/vfio-common.h"
> +#include "hw/vfio/vfio.h"
> +#include "qemu/sockets.h"
> +#include "io/channel.h"
> +#include "io/channel-socket.h"
> +#include "io/channel-util.h"
> +#include "sysemu/iothread.h"
> +#include "user.h"
> +
> +static IOThread *vfio_user_iothread;
> +
> +static void vfio_user_shutdown(VFIOProxy *proxy);
> +
> +
> +/*
> + * Functions called by main, CPU, or iothread threads
> + */
> +
> +static void vfio_user_shutdown(VFIOProxy *proxy)
> +{
> +    qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
> +    qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
> +}
> +
> +/*
> + * Functions only called by iothread
> + */
> +
> +static void vfio_user_cb(void *opaque)
> +{
> +    VFIOProxy *proxy = opaque;
> +
> +    QEMU_LOCK_GUARD(&proxy->lock);
> +
> +    proxy->state = VFIO_PROXY_CLOSED;
> +    qemu_cond_signal(&proxy->close_cv);
> +}
> +
> +
> +/*
> + * Functions called by main or CPU threads
> + */
> +
> +static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
> +    QLIST_HEAD_INITIALIZER(vfio_user_sockets);
> +
> +VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
> +{
> +    VFIOProxy *proxy;
> +    QIOChannelSocket *sioc;
> +    QIOChannel *ioc;
> +    char *sockname;
> +
> +    if (addr->type != SOCKET_ADDRESS_TYPE_UNIX) {
> +        error_setg(errp, "vfio_user_connect - bad address family");
> +        return NULL;
> +    }
> +    sockname = addr->u.q_unix.path;
> +
> +    sioc = qio_channel_socket_new();
> +    ioc = QIO_CHANNEL(sioc);
> +    if (qio_channel_socket_connect_sync(sioc, addr, errp)) {
> +        object_unref(OBJECT(ioc));
> +        return NULL;
> +    }
> +    qio_channel_set_blocking(ioc, false, NULL);
> +
> +    proxy = g_malloc0(sizeof(VFIOProxy));
> +    proxy->sockname = g_strdup_printf("unix:%s", sockname);
> +    proxy->ioc = ioc;
> +    proxy->flags = VFIO_PROXY_CLIENT;
> +    proxy->state = VFIO_PROXY_CONNECTED;
> +
> +    qemu_mutex_init(&proxy->lock);
> +    qemu_cond_init(&proxy->close_cv);
> +
> +    if (vfio_user_iothread == NULL) {
> +        vfio_user_iothread = iothread_create("VFIO user", errp);
> +    }
> +
> +    proxy->ctx = iothread_get_aio_context(vfio_user_iothread);
> +
> +    QTAILQ_INIT(&proxy->outgoing);
> +    QTAILQ_INIT(&proxy->incoming);
> +    QTAILQ_INIT(&proxy->free);
> +    QTAILQ_INIT(&proxy->pending);
> +    QLIST_INSERT_HEAD(&vfio_user_sockets, proxy, next);
> +
> +    return proxy;
> +}
> +
> +void vfio_user_disconnect(VFIOProxy *proxy)
> +{
> +    VFIOUserMsg *r1, *r2;
> +
> +    qemu_mutex_lock(&proxy->lock);
> +
> +    /* our side is quitting */
> +    if (proxy->state == VFIO_PROXY_CONNECTED) {
> +        vfio_user_shutdown(proxy);
> +        if (!QTAILQ_EMPTY(&proxy->pending)) {
> +            error_printf("vfio_user_disconnect: outstanding requests\n");
> +        }
> +    }
> +    object_unref(OBJECT(proxy->ioc));
> +    proxy->ioc = NULL;
> +
> +    proxy->state = VFIO_PROXY_CLOSING;
> +    QTAILQ_FOREACH_SAFE(r1, &proxy->outgoing, next, r2) {
> +        qemu_cond_destroy(&r1->cv);
> +        QTAILQ_REMOVE(&proxy->pending, r1, next);
> +        g_free(r1);
> +    }
> +    QTAILQ_FOREACH_SAFE(r1, &proxy->incoming, next, r2) {
> +        qemu_cond_destroy(&r1->cv);
> +        QTAILQ_REMOVE(&proxy->incoming, r1, next);
> +        g_free(r1);
> +    }
> +    QTAILQ_FOREACH_SAFE(r1, &proxy->pending, next, r2) {
> +        qemu_cond_destroy(&r1->cv);
> +        QTAILQ_REMOVE(&proxy->pending, r1, next);
> +        g_free(r1);
> +    }
> +    QTAILQ_FOREACH_SAFE(r1, &proxy->free, next, r2) {
> +        qemu_cond_destroy(&r1->cv);
> +        QTAILQ_REMOVE(&proxy->free, r1, next);
> +        g_free(r1);
> +    }
> +
> +    /*
> +     * Make sure the iothread isn't blocking anywhere
> +     * with a ref to this proxy by waiting for a BH
> +     * handler to run after the proxy fd handlers were
> +     * deleted above.
> +     */
> +    aio_bh_schedule_oneshot(proxy->ctx, vfio_user_cb, proxy);
> +    qemu_cond_wait(&proxy->close_cv, &proxy->lock);
> +
> +    /* we now hold the only ref to proxy */
> +    qemu_mutex_unlock(&proxy->lock);
> +    qemu_cond_destroy(&proxy->close_cv);
> +    qemu_mutex_destroy(&proxy->lock);
> +
> +    QLIST_REMOVE(proxy, next);
> +    if (QLIST_EMPTY(&vfio_user_sockets)) {
> +        iothread_destroy(vfio_user_iothread);
> +        vfio_user_iothread = NULL;
> +    }
> +
> +    g_free(proxy->sockname);
> +    g_free(proxy);
> +}
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> new file mode 100644
> index 0000000..da92862
> --- /dev/null
> +++ b/hw/vfio/user.h
> @@ -0,0 +1,78 @@
> +#ifndef VFIO_USER_H
> +#define VFIO_USER_H
> +
> +/*
> + * vfio protocol over a UNIX socket.
> + *
> + * Copyright © 2018, 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +typedef struct {
> +    int send_fds;
> +    int recv_fds;
> +    int *fds;
> +} VFIOUserFDs;
> +
> +enum msg_type {
> +    VFIO_MSG_NONE,
> +    VFIO_MSG_ASYNC,
> +    VFIO_MSG_WAIT,
> +    VFIO_MSG_NOWAIT,
> +    VFIO_MSG_REQ,
> +};
> +
> +typedef struct VFIOUserMsg {
> +    QTAILQ_ENTRY(VFIOUserMsg) next;
> +    VFIOUserFDs *fds;
> +    uint32_t rsize;
> +    uint32_t id;
> +    QemuCond cv;
> +    bool complete;
> +    enum msg_type type;
> +} VFIOUserMsg;
> +
> +
> +enum proxy_state {
> +    VFIO_PROXY_CONNECTED = 1,
> +    VFIO_PROXY_ERROR = 2,
> +    VFIO_PROXY_CLOSING = 3,
> +    VFIO_PROXY_CLOSED = 4,
> +};
> +
> +typedef QTAILQ_HEAD(VFIOUserMsgQ, VFIOUserMsg) VFIOUserMsgQ;
> +
> +typedef struct VFIOProxy {

VFIOUserProxy ? to be consistent with the namespace.

Thanks,

C.

> +    QLIST_ENTRY(VFIOProxy) next;
> +    char *sockname;
> +    struct QIOChannel *ioc;
> +    void (*request)(void *opaque, VFIOUserMsg *msg);
> +    void *req_arg;
> +    int flags;
> +    QemuCond close_cv;
> +    AioContext *ctx;
> +    QEMUBH *req_bh;
> +
> +    /*
> +     * above only changed when BQL is held
> +     * below are protected by per-proxy lock
> +     */
> +    QemuMutex lock;
> +    VFIOUserMsgQ free;
> +    VFIOUserMsgQ pending;
> +    VFIOUserMsgQ incoming;
> +    VFIOUserMsgQ outgoing;
> +    VFIOUserMsg *last_nowait;
> +    enum proxy_state state;
> +} VFIOProxy;
> +
> +/* VFIOProxy flags */
> +#define VFIO_PROXY_CLIENT        0x1
> +
> +VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
> +void vfio_user_disconnect(VFIOProxy *proxy);
> +
> +#endif /* VFIO_USER_H */
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 7713d98..fb7d865 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -76,6 +76,7 @@ typedef struct VFIOAddressSpace {
>   
>   struct VFIOGroup;
>   typedef struct VFIOContIO VFIOContIO;
> +typedef struct VFIOProxy VFIOProxy;
>   
>   typedef struct VFIOContainer {
>       VFIOAddressSpace *space;
> @@ -147,6 +148,7 @@ typedef struct VFIODevice {
>       VFIOMigration *migration;
>       Error *migration_blocker;
>       OnOffAuto pre_copy_dirty_page_tracking;
> +    VFIOProxy *proxy;
>       struct vfio_region_info **regions;
>   } VFIODevice;
>   


