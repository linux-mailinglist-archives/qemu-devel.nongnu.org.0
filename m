Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C17F522F53
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:25:13 +0200 (CEST)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noial-00079K-Sj
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1noi8S-0003HV-S8
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1noi8Q-0003wG-4z
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652259353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DocAcCBWHrbt8W53/pM0bKiOgG5f/ITmMhlEmxAitYo=;
 b=SaffizOoxV+gny0N0mKGC4IhoyL9ayf/AakOHX93+nj2Fc9ISPue2sv3iIf69AoBmXiEpU
 AVjk+9y7lT+MV1Qt1Gjy8AaXeaxh1VRZ63a8Vs2yoP7Mcm1yRscFmD3v6VK5T0FqtUA6b5
 jWi+FYjJ6TFzRmMZi5smm1UU7tB77CU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-TIVgNe7WNyWOG2OmdY7owQ-1; Wed, 11 May 2022 04:55:52 -0400
X-MC-Unique: TIVgNe7WNyWOG2OmdY7owQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 n3-20020ac242c3000000b00473d8af3a0cso545294lfl.21
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 01:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DocAcCBWHrbt8W53/pM0bKiOgG5f/ITmMhlEmxAitYo=;
 b=SfXpoE4uAqCYT9tTHU5SBSwF+2OEFrCWCk1y9mYgx2G8i/usr6/SsVjeSTP9LG0Str
 HSx/4Xeqg4O1NF3umoUqepF+83yb9gEpUIczaZ7NQoH48hzp8ykg4gXhjupyZ+tnECAk
 e1V4SP5BC3GCJ5nFX+LOwZf7WG7zyq6uhYx6eTWDyBnFJp9/YJSL6aGy4TD7rfiiWJlp
 dQwCEZ4s+woP/bABTU3jOJjywag6B2lDJYWL/guWSJR3cH3bnhYn8986JVJbGogJ9aJT
 NqnePvgWePktRSXPCxLyWP+9NMQWiJamDU0H2io/nJCIBVU+QbVXVowRmCDHVoSurOuy
 JYAw==
X-Gm-Message-State: AOAM532wKOvvSd/8Aj0Sot2Hnb18+uHaiMtNVgQPsR3M9uwdJ7FvnGZH
 Sv0D8TeQO2ctxixA8LhEYGR7HfwC/XwPkjiLY6DD3dVy1xDOQ1cysSokNAqOQ1c/2dFVJaVGUu4
 usC+oADTHqDmO5B+djet0wwbdPbl/1rs=
X-Received: by 2002:a2e:9698:0:b0:24f:14da:6a59 with SMTP id
 q24-20020a2e9698000000b0024f14da6a59mr16912689lji.73.1652259350176; 
 Wed, 11 May 2022 01:55:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFWCeAQpHhmfjsAhPnC89mONIsb4C7PXD7h+ZtHTTl8AvDJYJaI1QNTENyqFm5/PiPWx/gSvjBMYzeioGu/No=
X-Received: by 2002:a2e:9698:0:b0:24f:14da:6a59 with SMTP id
 q24-20020a2e9698000000b0024f14da6a59mr16912670lji.73.1652259349868; Wed, 11
 May 2022 01:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220510125834.1815-1-longpeng2@huawei.com>
 <20220510125834.1815-4-longpeng2@huawei.com>
 <CACGkMEsr99zj8kDxK+BY-7cChqThhRESWa9aGP2Mrx=9zuz5YA@mail.gmail.com>
 <86311764-35bb-3173-bd54-e18da7b60abf@huawei.com>
In-Reply-To: <86311764-35bb-3173-bd54-e18da7b60abf@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 May 2022 16:55:38 +0800
Message-ID: <CACGkMEsPg9OpUqEQ2YweoA_tRH-4YyqZ7C+bPvoDTa2vO862kA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] vdpa: add vdpa-dev support
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, mst <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 pbonzini <pbonzini@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>, 
 Huangzhichao <huangzhichao@huawei.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 2:10 PM Longpeng (Mike, Cloud Infrastructure
Service Product Dept.) <longpeng2@huawei.com> wrote:
>
>
>
> =E5=9C=A8 2022/5/11 10:56, Jason Wang =E5=86=99=E9=81=93:
> > On Tue, May 10, 2022 at 8:59 PM Longpeng(Mike) <longpeng2@huawei.com> w=
rote:
> >>
> >> From: Longpeng <longpeng2@huawei.com>
> >>
> >> Supports vdpa-dev.
> >>
> >> Signed-off-by: Longpeng <longpeng2@huawei.com>
> >> ---
> >>   hw/virtio/Kconfig            |   5 +
> >>   hw/virtio/meson.build        |   1 +
> >>   hw/virtio/vdpa-dev.c         | 385 +++++++++++++++++++++++++++++++++=
++
> >>   include/hw/virtio/vdpa-dev.h |  43 ++++
> >>   4 files changed, 434 insertions(+)
> >>   create mode 100644 hw/virtio/vdpa-dev.c
> >>   create mode 100644 include/hw/virtio/vdpa-dev.h
> >>
> >> diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
> >> index c144d42f9b..2723283382 100644
> >> --- a/hw/virtio/Kconfig
> >> +++ b/hw/virtio/Kconfig
> >> @@ -68,3 +68,8 @@ config VHOST_USER_RNG
> >>       bool
> >>       default y
> >>       depends on VIRTIO && VHOST_USER
> >> +
> >> +config VHOST_VDPA_DEV
> >> +    bool
> >> +    default y if VIRTIO_PCI
> >
> > Do we have the plan to add VIRTIO_MMIO support?
> >
> There is currently no plan. Maybe we can try to support it in the next st=
ep.

That would be better, allowing MMIO on top of vhost-vDPA is considered
to be one of the important advantages.

>
> >> +    depends on VIRTIO && VHOST_VDPA && LINUX
> >> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> >> index 67dc77e00f..8f6f86db71 100644
> >> --- a/hw/virtio/meson.build
> >> +++ b/hw/virtio/meson.build
> >> @@ -29,6 +29,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true=
: files('vhost-user-i2c.c'))
> >>   virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], =
if_true: files('vhost-user-i2c-pci.c'))
> >>   virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-u=
ser-rng.c'))
> >>   virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], =
if_true: files('vhost-user-rng-pci.c'))
> >> +virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev=
.c'))
> >>
> >>   virtio_pci_ss =3D ss.source_set()
> >>   virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-=
vsock-pci.c'))
> >> diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> >> new file mode 100644
> >> index 0000000000..543b5b4b81
> >> --- /dev/null
> >> +++ b/hw/virtio/vdpa-dev.c
> >> @@ -0,0 +1,385 @@
> >> +/*
> >> + * Vhost Vdpa Device
> >> + *
> >> + * Copyright (c) Huawei Technologies Co., Ltd. 2022. All Rights Reser=
ved.
> >> + *
> >> + * Authors:
> >> + *   Longpeng <longpeng2@huawei.com>
> >> + *
> >> + * Largely based on the "vhost-user-blk-pci.c" and "vhost-user-blk.c"=
 implemented by:
> >> + *   Changpeng Liu <changpeng.liu@intel.com>
> >> + *
> >> + * This work is licensed under the terms of the GNU LGPL, version 2 o=
r later.
> >> + * See the COPYING.LIB file in the top-level directory.
> >> + */
> >> +#include "qemu/osdep.h"
> >> +#include <sys/ioctl.h>
> >> +#include <linux/vhost.h>
> >> +#include "qapi/error.h"
> >> +#include "qemu/error-report.h"
> >> +#include "qemu/cutils.h"
> >> +#include "hw/qdev-core.h"
> >> +#include "hw/qdev-properties.h"
> >> +#include "hw/qdev-properties-system.h"
> >> +#include "hw/virtio/vhost.h"
> >> +#include "hw/virtio/virtio.h"
> >> +#include "hw/virtio/virtio-bus.h"
> >> +#include "hw/virtio/virtio-access.h"
> >> +#include "hw/virtio/vdpa-dev.h"
> >> +#include "sysemu/sysemu.h"
> >> +#include "sysemu/runstate.h"
> >> +
> >> +static void
> >> +vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *=
vq)
> >> +{
> >> +    /* Nothing to do */
> >> +}
> >> +
> >> +static uint32_t
> >> +vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp=
)
> >> +{
> >> +    uint32_t val =3D (uint32_t)-1;
> >> +
> >> +    if (ioctl(fd, cmd, &val) < 0) {
> >> +        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %s",
> >> +                   cmd, strerror(errno));
> >> +    }
> >> +
> >> +    return val;
> >> +}
> >> +
> >> +static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
> >> +{
> >> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >> +    VhostVdpaDevice *v =3D VHOST_VDPA_DEVICE(vdev);
> >> +    uint16_t max_queue_size;
> >> +    struct vhost_virtqueue *vqs;
> >> +    int i, ret;
> >> +
> >> +    if (!v->vhostdev && v->vhostfd =3D=3D -1) {
> >> +        error_setg(errp, "both vhostdev and vhostfd are missing");
> >> +        return;
> >> +    }
> >> +
> >> +    if (v->vhostdev && v->vhostfd !=3D -1) {
> >> +        error_setg(errp, "both vhostdev and vhostfd are set");
> >> +        return;
> >> +    }
> >> +
> >> +    if (v->vhostfd =3D=3D -1) {
> >> +        v->vhostfd =3D qemu_open(v->vhostdev, O_RDWR, errp);
> >> +        if (*errp) {
> >
> > Is this better to set error messages for all the possible failures
> > during realization?
> >
> I think the error messages already set in *errp, right?

Oh right.

>
> >> +            return;
> >> +        }
> >> +    }
> >> +    v->vdpa.device_fd =3D v->vhostfd;
> >> +
> >> +    v->vdev_id =3D vhost_vdpa_device_get_u32(v->vhostfd,
> >> +                                           VHOST_VDPA_GET_DEVICE_ID, =
errp);
> >> +    if (*errp) {
> >> +        goto out;
> >> +    }
> >> +
> >> +    max_queue_size =3D vhost_vdpa_device_get_u32(v->vhostfd,
> >> +                                               VHOST_VDPA_GET_VRING_N=
UM, errp);
> >> +    if (*errp) {
> >> +        goto out;
> >> +    }
> >> +
> >> +    if (v->queue_size > max_queue_size) {
> >> +        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %u (=
max:%u)",
> >> +                   v->queue_size, max_queue_size);
> >> +        goto out;
> >> +    } else if (!v->queue_size) {
> >> +        v->queue_size =3D max_queue_size;
> >> +    }
> >> +
> >> +    v->num_queues =3D vhost_vdpa_device_get_u32(v->vhostfd,
> >> +                                              VHOST_VDPA_GET_VQS_COUN=
T, errp);
> >> +    if (*errp) {
> >> +        goto out;
> >> +    }
> >> +
> >> +    if (!v->num_queues || v->num_queues > VIRTIO_QUEUE_MAX) {
> >> +        error_setg(errp, "invalid number of virtqueues: %u (max:%u)",
> >> +                   v->num_queues, VIRTIO_QUEUE_MAX);
> >> +        goto out;
> >> +    }
> >> +
> >> +    v->dev.nvqs =3D v->num_queues;
> >> +    vqs =3D g_new0(struct vhost_virtqueue, v->dev.nvqs);
> >> +    v->dev.vqs =3D vqs;
> >> +    v->dev.vq_index =3D 0;
> >> +    v->dev.vq_index_end =3D v->dev.nvqs;
> >> +    v->dev.backend_features =3D 0;
> >> +    v->started =3D false;
> >> +
> >> +    ret =3D vhost_dev_init(&v->dev, &v->vdpa, VHOST_BACKEND_TYPE_VDPA=
, 0, NULL);
> >> +    if (ret < 0) {
> >> +        error_setg(errp, "vhost-vdpa-device: vhost initialization fai=
led: %s",
> >> +                   strerror(-ret));
> >> +        goto free_vqs;
> >> +    }
> >> +
> >> +    v->config_size =3D vhost_vdpa_device_get_u32(v->vhostfd,
> >> +                                               VHOST_VDPA_GET_CONFIG_=
SIZE, errp);
> >> +    if (*errp) {
> >> +        goto vhost_cleanup;
> >> +    }
> >> +
> >> +    if (v->post_init && v->post_init(v, errp) < 0) {
> >> +        goto free_virtio;
> >> +    }
> >> +
> >> +    v->config =3D g_malloc0(v->config_size);
> >> +
> >> +    ret =3D vhost_dev_get_config(&v->dev, v->config, v->config_size, =
NULL);
> >> +    if (ret < 0) {
> >> +        error_setg(errp, "vhost-vdpa-device: get config failed");
> >> +        goto free_config;
> >> +    }
> >> +
> >> +    virtio_init(vdev, "vhost-vdpa", v->vdev_id, v->config_size);
> >> +
> >> +    v->virtqs =3D g_new0(VirtQueue *, v->dev.nvqs);
> >> +    for (i =3D 0; i < v->dev.nvqs; i++) {
> >> +        v->virtqs[i] =3D virtio_add_queue(vdev, v->queue_size,
> >> +                                        vhost_vdpa_device_dummy_handl=
e_output);
> >> +    }
> >> +
> >> +    return;
> >> +
> >> +free_virtio:
> >> +    for (i =3D 0; i < v->num_queues; i++) {
> >> +        virtio_delete_queue(v->virtqs[i]);
> >> +    }
> >> +    g_free(v->virtqs);
> >> +    virtio_cleanup(vdev);
> >> +free_config:
> >> +    g_free(v->config);
> >> +vhost_cleanup:
> >> +    vhost_dev_cleanup(&v->dev);
> >> +free_vqs:
> >> +    g_free(vqs);
> >> +out:
> >> +    qemu_close(v->vhostfd);
> >> +    v->vhostfd =3D -1;
> >> +}
> >> +
> >> +static void vhost_vdpa_device_unrealize(DeviceState *dev)
> >> +{
> >> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >> +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >> +    int i;
> >> +
> >> +    virtio_set_status(vdev, 0);
> >> +
> >> +    for (i =3D 0; i < s->num_queues; i++) {
> >> +        virtio_delete_queue(s->virtqs[i]);
> >> +    }
> >> +    g_free(s->virtqs);
> >> +    virtio_cleanup(vdev);
> >> +
> >> +    g_free(s->config);
> >> +    g_free(s->dev.vqs);
> >> +    vhost_dev_cleanup(&s->dev);
> >> +    qemu_close(s->vhostfd);
> >> +    s->vhostfd =3D -1;
> >> +}
> >> +
> >> +static void
> >> +vhost_vdpa_device_get_config(VirtIODevice *vdev, uint8_t *config)
> >> +{
> >> +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >> +
> >> +    memcpy(config, s->config, s->config_size);
> >> +}
> >> +
> >> +static void
> >> +vhost_vdpa_device_set_config(VirtIODevice *vdev, const uint8_t *confi=
g)
> >> +{
> >> +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >> +    int ret;
> >> +
> >> +    ret =3D vhost_dev_set_config(&s->dev, s->config, 0, s->config_siz=
e,
> >> +                               VHOST_SET_CONFIG_TYPE_MASTER);
> >> +    if (ret) {
> >> +        error_report("set device config space failed");
> >> +        return;
> >> +    }
> >> +}
> >> +
> >> +static uint64_t vhost_vdpa_device_get_features(VirtIODevice *vdev,
> >> +                                               uint64_t features,
> >> +                                               Error **errp)
> >> +{
> >> +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >> +    uint64_t backend_features =3D s->dev.features;
> >> +
> >> +    if (!virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM)) {
> >> +        virtio_clear_feature(&backend_features, VIRTIO_F_IOMMU_PLATFO=
RM);
> >> +    }
> >> +
> >> +    return backend_features;
> >> +}
> >> +
> >> +static int vhost_vdpa_device_start(VirtIODevice *vdev, Error **errp)
> >> +{
> >> +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >> +    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> >> +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
> >> +    int i, ret;
> >> +
> >> +    if (!k->set_guest_notifiers) {
> >> +        error_setg(errp, "binding does not support guest notifiers");
> >> +        return -ENOSYS;
> >> +    }
> >> +
> >> +    ret =3D vhost_dev_enable_notifiers(&s->dev, vdev);
> >> +    if (ret < 0) {
> >> +        error_setg_errno(errp, -ret, "Error enabling host notifiers")=
;
> >> +        return ret;
> >> +    }
> >> +
> >> +    ret =3D k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
> >> +    if (ret < 0) {
> >> +        error_setg_errno(errp, -ret, "Error binding guest notifier");
> >> +        goto err_host_notifiers;
> >> +    }
> >> +
> >> +    s->dev.acked_features =3D vdev->guest_features;
> >> +
> >> +    ret =3D vhost_dev_start(&s->dev, vdev);
> >> +    if (ret < 0) {
> >> +        error_setg_errno(errp, -ret, "Error starting vhost");
> >> +        goto err_guest_notifiers;
> >> +    }
> >> +    s->started =3D true;
> >> +
> >> +    /*
> >> +     * guest_notifier_mask/pending not used yet, so just unmask
> >> +     * everything here. virtio-pci will do the right thing by
> >> +     * enabling/disabling irqfd.
> >> +     */
> >> +    for (i =3D 0; i < s->dev.nvqs; i++) {
> >> +        vhost_virtqueue_mask(&s->dev, vdev, i, false);
> >> +    }
> >> +
> >> +    return ret;
> >> +
> >> +err_guest_notifiers:
> >> +    k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> >> +err_host_notifiers:
> >> +    vhost_dev_disable_notifiers(&s->dev, vdev);
> >> +    return ret;
> >> +}
> >> +
> >> +static void vhost_vdpa_device_stop(VirtIODevice *vdev)
> >> +{
> >> +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >> +    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> >> +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
> >> +    int ret;
> >> +
> >> +    if (!s->started) {
> >> +        return;
> >> +    }
> >> +    s->started =3D false;
> >> +
> >> +    if (!k->set_guest_notifiers) {
> >> +        return;
> >> +    }
> >> +
> >> +    vhost_dev_stop(&s->dev, vdev);
> >> +
> >> +    ret =3D k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> >> +    if (ret < 0) {
> >> +        error_report("vhost guest notifier cleanup failed: %d", ret);
> >> +        return;
> >> +    }
> >> +
> >> +    vhost_dev_disable_notifiers(&s->dev, vdev);
> >> +}
> >> +
> >> +static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t =
status)
> >> +{
> >> +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >> +    bool should_start =3D virtio_device_started(vdev, status);
> >> +    Error *local_err =3D NULL;
> >> +    int ret;
> >> +
> >> +    if (!vdev->vm_running) {
> >> +        should_start =3D false;
> >> +    }
> >> +
> >> +    if (s->started =3D=3D should_start) {
> >> +        return;
> >> +    }
> >> +
> >> +    if (should_start) {
> >> +        ret =3D vhost_vdpa_device_start(vdev, &local_err);
> >> +        if (ret < 0) {
> >> +            error_reportf_err(local_err, "vhost-vdpa-device: start fa=
iled: ");
> >> +        }
> >> +    } else {
> >> +        vhost_vdpa_device_stop(vdev);
> >> +    }
> >> +}
> >> +
> >> +static Property vhost_vdpa_device_properties[] =3D {
> >> +    DEFINE_PROP_STRING("vhostdev", VhostVdpaDevice, vhostdev),
> >> +    DEFINE_PROP_INT32("vhostfd", VhostVdpaDevice, vhostfd, -1),
> >
> > This is probably not needed since we can "abuse" /dev/fd/X for vhostdev=
.
> >
> It seems "vhostdev" is enough. I prefer to remove "vhostfd" if there is
> no objection.

Yes, it is the way the current vhost-vDPA networking backend did.

Thanks

>
> Thanks.
>
> > Thanks
> >
> >> +    DEFINE_PROP_UINT16("queue-size", VhostVdpaDevice, queue_size, 0),
> >> +    DEFINE_PROP_END_OF_LIST(),
> >> +};
> >> +
> >> +static const VMStateDescription vmstate_vhost_vdpa_device =3D {
> >> +    .name =3D "vhost-vdpa-device",
> >> +    .unmigratable =3D 1,
> >> +    .minimum_version_id =3D 1,
> >> +    .version_id =3D 1,
> >> +    .fields =3D (VMStateField[]) {
> >> +        VMSTATE_VIRTIO_DEVICE,
> >> +        VMSTATE_END_OF_LIST()
> >> +    },
> >> +};
> >> +
> >> +static void vhost_vdpa_device_class_init(ObjectClass *klass, void *da=
ta)
> >> +{
> >> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >> +    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> >> +
> >> +    device_class_set_props(dc, vhost_vdpa_device_properties);
> >> +    dc->desc =3D "VDPA-based generic device assignment";
> >> +    dc->vmsd =3D &vmstate_vhost_vdpa_device;
> >> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >> +    vdc->realize =3D vhost_vdpa_device_realize;
> >> +    vdc->unrealize =3D vhost_vdpa_device_unrealize;
> >> +    vdc->get_config =3D vhost_vdpa_device_get_config;
> >> +    vdc->set_config =3D vhost_vdpa_device_set_config;
> >> +    vdc->get_features =3D vhost_vdpa_device_get_features;
> >> +    vdc->set_status =3D vhost_vdpa_device_set_status;
> >> +}
> >> +
> >> +static void vhost_vdpa_device_instance_init(Object *obj)
> >> +{
> >> +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(obj);
> >> +
> >> +    device_add_bootindex_property(obj, &s->bootindex, "bootindex",
> >> +                                  NULL, DEVICE(obj));
> >> +}
> >> +
> >> +static const TypeInfo vhost_vdpa_device_info =3D {
> >> +    .name =3D TYPE_VHOST_VDPA_DEVICE,
> >> +    .parent =3D TYPE_VIRTIO_DEVICE,
> >> +    .instance_size =3D sizeof(VhostVdpaDevice),
> >> +    .class_init =3D vhost_vdpa_device_class_init,
> >> +    .instance_init =3D vhost_vdpa_device_instance_init,
> >> +};
> >> +
> >> +static void register_vhost_vdpa_device_type(void)
> >> +{
> >> +    type_register_static(&vhost_vdpa_device_info);
> >> +}
> >> +
> >> +type_init(register_vhost_vdpa_device_type);
> >> diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev=
.h
> >> new file mode 100644
> >> index 0000000000..4dbf98195c
> >> --- /dev/null
> >> +++ b/include/hw/virtio/vdpa-dev.h
> >> @@ -0,0 +1,43 @@
> >> +/*
> >> + * Vhost Vdpa Device
> >> + *
> >> + * Copyright (c) Huawei Technologies Co., Ltd. 2022. All Rights Reser=
ved.
> >> + *
> >> + * Authors:
> >> + *   Longpeng <longpeng2@huawei.com>
> >> + *
> >> + * Largely based on the "vhost-user-blk.h" implemented by:
> >> + *   Changpeng Liu <changpeng.liu@intel.com>
> >> + *
> >> + * This work is licensed under the terms of the GNU LGPL, version 2 o=
r later.
> >> + * See the COPYING.LIB file in the top-level directory.
> >> + */
> >> +#ifndef _VHOST_VDPA_DEVICE_H
> >> +#define _VHOST_VDPA_DEVICE_H
> >> +
> >> +#include "hw/virtio/vhost.h"
> >> +#include "hw/virtio/vhost-vdpa.h"
> >> +#include "qom/object.h"
> >> +
> >> +
> >> +#define TYPE_VHOST_VDPA_DEVICE "vhost-vdpa-device"
> >> +OBJECT_DECLARE_SIMPLE_TYPE(VhostVdpaDevice, VHOST_VDPA_DEVICE)
> >> +
> >> +struct VhostVdpaDevice {
> >> +    VirtIODevice parent_obj;
> >> +    char *vhostdev;
> >> +    int vhostfd;
> >> +    int32_t bootindex;
> >> +    uint32_t vdev_id;
> >> +    uint32_t num_queues;
> >> +    struct vhost_dev dev;
> >> +    struct vhost_vdpa vdpa;
> >> +    VirtQueue **virtqs;
> >> +    uint8_t *config;
> >> +    int config_size;
> >> +    uint16_t queue_size;
> >> +    bool started;
> >> +    int (*post_init)(VhostVdpaDevice *v, Error **errp);
> >> +};
> >> +
> >> +#endif
> >> --
> >> 2.23.0
> >>
> >
> > .
>


