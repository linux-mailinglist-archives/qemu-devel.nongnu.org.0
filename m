Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2724F457911
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:48:41 +0100 (CET)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCgR-0006jv-VM
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:48:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbB-0006kz-Cp
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb5-0002c1-VM
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+vgmUsOc1Hl+n1HCS/FACr8/tP+N3atqx/MPiPYeWw=;
 b=BUgRMEbGmr/uYHibAdz+8pgA52KlF+nmY180fMiedvccLA0Lpo0VjHylOG7VDy3osKBXNW
 G2vEB3u0/2T2nveKDQyIYrx7oSBdg08i+snycOJNExiTFsCSDHU6MFt9ldli6b+Zi9zMjD
 4jGhtiDDwBaOQkLc3hejS4bsdTx09d8=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-200-W0_ySaY_MiK-tLUC53Fzng-1; Fri, 19 Nov 2021 17:43:06 -0500
X-MC-Unique: W0_ySaY_MiK-tLUC53Fzng-1
Received: by mail-oo1-f69.google.com with SMTP id
 x23-20020a4a4117000000b002c263f22601so7015580ooa.19
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/zLVrDi6+/DHx8QLo5kmPVbmqSpy3rypmwwa3z+Th4=;
 b=ezGopLYgQLJl4c8FiaF7W54HYDhLohLflPnqpQ0PzrNUbsWseMV37z8bON08Ee3c/U
 EoRGmpwgO9QzNQqkTWKBMxiLh31aqlFEefYttFVppmw2late0vQPUOaOrmZzB7BFWnX6
 iYc3bj8LsSbo7hpk5ovdByVl6e5SlPMpAyn4db9TBNkqWtdJ4uEjIbNlU9jqDR8oBM5g
 Faj1hNb8cuVktxBGc2SWJgqx5sq5MFArSRDCSqyuN2wCYFRl5FFwG72N/KCjq5Gb1jf4
 vfXY7DmnoleeTSWlC5T6t/6tcMfw+v/HslvRRRyuSjC3BTqWjBN4C8Ib4+prBPZUqcJj
 0CJg==
X-Gm-Message-State: AOAM5318Tujh5LQcoNf3Vwymvb2uCW2yFh1hEYjqZwBHJ6OTgYwAgUoS
 i3wIFevZML9iZMbMBGwezVp7+SBPo50O9S+uzmwpTxvaILiM1gFJbnJ5jBkeTwVWi9Sfgp7Oygl
 R2y0/7WO2MXHbGyY=
X-Received: by 2002:aca:eb53:: with SMTP id j80mr3088465oih.85.1637361785336; 
 Fri, 19 Nov 2021 14:43:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1bgxoDzM+InFJSrxAqAGeFXKBdiXSKh+vtMO7r+yOOXXW+Od3MMYd6K7h6x7HdwcWrzZV3g==
X-Received: by 2002:aca:eb53:: with SMTP id j80mr3088439oih.85.1637361785085; 
 Fri, 19 Nov 2021 14:43:05 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:04 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:23 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 07/19] vfio-user: connect vfio proxy to remote server
Message-ID: <20211119154223.5e9bdf19.alex.williamson@redhat.com>
In-Reply-To: <69d83c41ca7fe9b010f73dc15fe6a7783fce5620.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <69d83c41ca7fe9b010f73dc15fe6a7783fce5620.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon,  8 Nov 2021 16:46:35 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/user.h                |  78 +++++++++++++++++++
>  include/hw/vfio/vfio-common.h |   2 +
>  hw/vfio/pci.c                 |  20 +++++
>  hw/vfio/user.c                | 170 ++++++++++++++++++++++++++++++++++++=
++++++
>  MAINTAINERS                   |   4 +
>  hw/vfio/meson.build           |   1 +
>  6 files changed, 275 insertions(+)
>  create mode 100644 hw/vfio/user.h
>  create mode 100644 hw/vfio/user.c
>=20
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> new file mode 100644
> index 0000000..301ef6a
> --- /dev/null
> +++ b/hw/vfio/user.h
> @@ -0,0 +1,78 @@
> +#ifndef VFIO_USER_H
> +#define VFIO_USER_H
> +
> +/*
> + * vfio protocol over a UNIX socket.
> + *
> + * Copyright =C2=A9 2018, 2021 Oracle and/or its affiliates.
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
> +    VFIO_PROXY_CONNECTED =3D 1,
> +    VFIO_PROXY_ERROR =3D 2,
> +    VFIO_PROXY_CLOSING =3D 3,
> +    VFIO_PROXY_CLOSED =3D 4,
> +};
> +
> +typedef QTAILQ_HEAD(VFIOUserMsgQ, VFIOUserMsg) VFIOUserMsgQ;
> +
> +typedef struct VFIOProxy {
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
> +#define VFIO_PROXY_CLIENT       0x1
> +
> +VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
> +void vfio_user_disconnect(VFIOProxy *proxy);
> +
> +#endif /* VFIO_USER_H */
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.=
h
> index c0dbbfb..224dbf8 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -76,6 +76,7 @@ typedef struct VFIOAddressSpace {
> =20
>  struct VFIOGroup;
>  typedef struct VFIOContIO VFIOContIO;
> +typedef struct VFIOProxy VFIOProxy;
> =20
>  typedef struct VFIOContainer {
>      VFIOAddressSpace *space;
> @@ -150,6 +151,7 @@ typedef struct VFIODevice {
>      Error *migration_blocker;
>      OnOffAuto pre_copy_dirty_page_tracking;
>      struct vfio_region_info **regions;
> +    VFIOProxy *proxy;
>  } VFIODevice;
> =20
>  struct VFIODeviceOps {
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index fa3e028..ebfabb1 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -43,6 +43,7 @@
>  #include "qapi/error.h"
>  #include "migration/blocker.h"
>  #include "migration/qemu-file.h"
> +#include "hw/vfio/user.h"
> =20
>  #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> =20
> @@ -3476,6 +3477,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, =
Error **errp)
>      VFIOUserPCIDevice *udev =3D VFIO_USER_PCI(pdev);
>      VFIOPCIDevice *vdev =3D VFIO_PCI_BASE(pdev);
>      VFIODevice *vbasedev =3D &vdev->vbasedev;
> +    SocketAddress addr;
> +    VFIOProxy *proxy;
> +    Error *err =3D NULL;
> =20
>      /*
>       * TODO: make option parser understand SocketAddress
> @@ -3488,6 +3492,16 @@ static void vfio_user_pci_realize(PCIDevice *pdev,=
 Error **errp)
>          return;
>      }
> =20
> +    memset(&addr, 0, sizeof(addr));
> +    addr.type =3D SOCKET_ADDRESS_TYPE_UNIX;
> +    addr.u.q_unix.path =3D udev->sock_name;
> +    proxy =3D vfio_user_connect_dev(&addr, &err);
> +    if (!proxy) {
> +        error_setg(errp, "Remote proxy not found");
> +        return;
> +    }
> +    vbasedev->proxy =3D proxy;
> +
>      vbasedev->name =3D g_strdup_printf("VFIO user <%s>", udev->sock_name=
);
>      vbasedev->dev =3D DEVICE(vdev);
>      vbasedev->fd =3D -1;
> @@ -3500,6 +3514,12 @@ static void vfio_user_pci_realize(PCIDevice *pdev,=
 Error **errp)
> =20
>  static void vfio_user_instance_finalize(Object *obj)
>  {
> +    VFIOPCIDevice *vdev =3D VFIO_PCI_BASE(obj);
> +    VFIODevice *vbasedev =3D &vdev->vbasedev;
> +
> +    vfio_put_device(vdev);

This looks suspiciously like the initial function in the previous patch
should not have been empty.  Thanks,

Alex

> +
> +    vfio_user_disconnect(vbasedev->proxy);
>  }
> =20
>  static Property vfio_user_pci_dev_properties[] =3D {
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> new file mode 100644
> index 0000000..92d4e03
> --- /dev/null
> +++ b/hw/vfio/user.c
> @@ -0,0 +1,170 @@
> +/*
> + * vfio protocol over a UNIX socket.
> + *
> + * Copyright =C2=A9 2018, 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
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
> +    qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, N=
ULL);
> +}
> +
> +
> +/*
> + * Functions only called by iothread
> + */
> +
> +static void vfio_user_cb(void *opaque)
> +{
> +    VFIOProxy *proxy =3D opaque;
> +
> +    QEMU_LOCK_GUARD(&proxy->lock);
> +
> +    proxy->state =3D VFIO_PROXY_CLOSED;
> +    qemu_cond_signal(&proxy->close_cv);
> +}
> +
> +
> +/*
> + * Functions called by main or CPU threads
> + */
> +
> +static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =3D
> +    QLIST_HEAD_INITIALIZER(vfio_user_sockets);
> +
> +VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
> +{
> +    VFIOProxy *proxy;
> +    QIOChannelSocket *sioc;
> +    QIOChannel *ioc;
> +    char *sockname;
> +
> +    if (addr->type !=3D SOCKET_ADDRESS_TYPE_UNIX) {
> +        error_setg(errp, "vfio_user_connect - bad address family");
> +        return NULL;
> +    }
> +    sockname =3D addr->u.q_unix.path;
> +
> +    sioc =3D qio_channel_socket_new();
> +    ioc =3D QIO_CHANNEL(sioc);
> +    if (qio_channel_socket_connect_sync(sioc, addr, errp)) {
> +        object_unref(OBJECT(ioc));
> +        return NULL;
> +    }
> +    qio_channel_set_blocking(ioc, false, NULL);
> +
> +    proxy =3D g_malloc0(sizeof(VFIOProxy));
> +    proxy->sockname =3D g_strdup_printf("unix:%s", sockname);
> +    proxy->ioc =3D ioc;
> +    proxy->flags =3D VFIO_PROXY_CLIENT;
> +    proxy->state =3D VFIO_PROXY_CONNECTED;
> +
> +    qemu_mutex_init(&proxy->lock);
> +    qemu_cond_init(&proxy->close_cv);
> +
> +    if (vfio_user_iothread =3D=3D NULL) {
> +        vfio_user_iothread =3D iothread_create("VFIO user", errp);
> +    }
> +
> +    proxy->ctx =3D iothread_get_aio_context(vfio_user_iothread);
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
> +    if (proxy->state =3D=3D VFIO_PROXY_CONNECTED) {
> +        vfio_user_shutdown(proxy);
> +        if (!QTAILQ_EMPTY(&proxy->pending)) {
> +            error_printf("vfio_user_disconnect: outstanding requests\n")=
;
> +        }
> +    }
> +    object_unref(OBJECT(proxy->ioc));
> +    proxy->ioc =3D NULL;
> +
> +    proxy->state =3D VFIO_PROXY_CLOSING;
> +    QTAILQ_FOREACH_SAFE(r1, &proxy->outgoing, next, r2) {
> +        qemu_cond_destroy(&r1->cv);
> +        QTAILQ_REMOVE(&proxy->pending, r1, next);
> +        g_free(r1);
> +    }
> +    QTAILQ_FOREACH_SAFE(r1, &proxy->incoming, next, r2) {
> +        qemu_cond_destroy(&r1->cv);
> +        QTAILQ_REMOVE(&proxy->pending, r1, next);
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
> +        vfio_user_iothread =3D NULL;
> +    }
> +
> +    g_free(proxy->sockname);
> +    g_free(proxy);
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d838b9e..f429bab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1882,8 +1882,12 @@ L: qemu-s390x@nongnu.org
>  vfio-user
>  M: John G Johnson <john.g.johnson@oracle.com>
>  M: Thanos Makatos <thanos.makatos@nutanix.com>
> +M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> +M: Jagannathan Raman <jag.raman@oracle.com>
>  S: Supported
>  F: docs/devel/vfio-user.rst
> +F: hw/vfio/user.c
> +F: hw/vfio/user.h
> =20
>  vhost
>  M: Michael S. Tsirkin <mst@redhat.com>
> diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
> index da9af29..2f86f72 100644
> --- a/hw/vfio/meson.build
> +++ b/hw/vfio/meson.build
> @@ -9,6 +9,7 @@ vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
>    'pci-quirks.c',
>    'pci.c',
>  ))
> +vfio_ss.add(when: 'CONFIG_VFIO_USER', if_true: files('user.c'))
>  vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
>  vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))
>  vfio_ss.add(when: 'CONFIG_VFIO_XGMAC', if_true: files('calxeda-xgmac.c')=
)


