Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BB46DBCF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 20:08:35 +0100 (CET)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv2Is-0000Cy-4R
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 14:08:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mv2Fm-0007ZV-Ts
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 14:05:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mv2Fj-0005EQ-8C
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 14:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638990318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ZYxPn9Y8T0pM044EB0I6CEWbXWPrzIEQGH3yPzYZ6k=;
 b=fE6FxM/108RBH3NiV3pMofUztcuyLwUrq50vaIIBkihbwJPrbB6bOIf8/HPCkpu1io5txx
 4LDAry/PDKyKhA4oPpptcOQZHOEIs04yQlybqXjAHqivkJ5XibZ6oEFJE9jb1MD5KvrZWF
 aV/nkB12OwTty+lSohbMXZren925/qU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-qqVbPm_yNwOXGXCTpL8REQ-1; Wed, 08 Dec 2021 14:05:16 -0500
X-MC-Unique: qqVbPm_yNwOXGXCTpL8REQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso3512199wmb.0
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 11:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1ZYxPn9Y8T0pM044EB0I6CEWbXWPrzIEQGH3yPzYZ6k=;
 b=c4mZEBn5ithE5EgUzSGRlb7WBc4jczdM5fpKzefPMVucESMVQelNqhLflvDX014Dy/
 Zo4DTVtoQd2uZU+S1VoVlYMcgDPaJNYhCtX+qs9/87E07j/hLRrkJOqJoKChdgbxPvVq
 HXZJO/PBjLceT1ggoyvyztdLYKAG8LYcTHIBNCrBMyrUs80MX71e6x7UUoe0PahkkvHk
 jvG1rqbXfC8QTn5mBVX160p3TZDyXYPbFO6lomPkhWzGvxVxJpDNybJaUaPh5Cfqz6zQ
 85YpXcshBzUA0dpIPo1Ddd1qNp/6DXG5R67tGlZNXH4wIJ3GK9CfTbp/rys/LS0+qcIc
 4W1A==
X-Gm-Message-State: AOAM532NiBPPuxKu2bdKNm831BaoHT6U8nooFU3Nu4qUGZqDMmiBfPoo
 UF7KVetttKXOhBmA98NBmSBMFyOCzHWGdBwIM3JJOrjKumVePpfgQqt31MjQiRyfD0T6GKmlNIA
 o8xwkyS4a2B/ctwU=
X-Received: by 2002:adf:f551:: with SMTP id j17mr672452wrp.392.1638990314402; 
 Wed, 08 Dec 2021 11:05:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1rIAR5FzQki6HPgvicqtwzMaKn/G7ddzthxAmaNWKYoHdrRb0g7NrXonZtX1Y94P7yzELdQ==
X-Received: by 2002:adf:f551:: with SMTP id j17mr672401wrp.392.1638990314033; 
 Wed, 08 Dec 2021 11:05:14 -0800 (PST)
Received: from redhat.com ([2.55.18.120])
 by smtp.gmail.com with ESMTPSA id w2sm3421615wrn.67.2021.12.08.11.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 11:05:13 -0800 (PST)
Date: Wed, 8 Dec 2021 14:05:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <20211208135852-mutt-send-email-mst@kernel.org>
References: <20211208052010.1719-1-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20211208052010.1719-1-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, yechuan@huawei.com,
 xieyongji@bytedance.com, arei.gonglei@huawei.com, parav@nvidia.com,
 stefanha@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> Hi guys,
> 
> This patch introduces vhost-vdpa-net device, which is inspired
> by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
> 
> I've tested this patch on Huawei's offload card:
> ./x86_64-softmmu/qemu-system-x86_64 \
>     -device vhost-vdpa-net-pci,vdpa-dev=/dev/vhost-vdpa-0
> 
> For virtio hardware offloading, the most important requirement for us
> is to support live migration between offloading cards from different
> vendors, the combination of netdev and virtio-net seems too heavy, we
> prefer a lightweight way.

Did not look at the patch in depth yet.
Is this already supported with this patch? Or is that just the plan?

> Maybe we could support both in the future ? Such as:
> 
> * Lightweight
>  Net: vhost-vdpa-net
>  Storage: vhost-vdpa-blk
> 
> * Heavy but more powerful
>  Net: netdev + virtio-net + vhost-vdpa
>  Storage: bdrv + virtio-blk + vhost-vdpa

I'd like to better understand what is in and out of scope for
this device. Which features would be "more powerful" and belong
in virtio-net, and which in vhost-vdpa-net?

> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/net/meson.build                 |   1 +
>  hw/net/vhost-vdpa-net.c            | 338 +++++++++++++++++++++++++++++++++++++
>  hw/virtio/Kconfig                  |   5 +
>  hw/virtio/meson.build              |   1 +
>  hw/virtio/vhost-vdpa-net-pci.c     | 118 +++++++++++++
>  include/hw/virtio/vhost-vdpa-net.h |  31 ++++
>  include/net/vhost-vdpa.h           |   2 +
>  net/vhost-vdpa.c                   |   2 +-
>  8 files changed, 497 insertions(+), 1 deletion(-)
>  create mode 100644 hw/net/vhost-vdpa-net.c
>  create mode 100644 hw/virtio/vhost-vdpa-net-pci.c
>  create mode 100644 include/hw/virtio/vhost-vdpa-net.h
> 
> diff --git a/hw/net/meson.build b/hw/net/meson.build
> index bdf71f1..139ebc4 100644
> --- a/hw/net/meson.build
> +++ b/hw/net/meson.build
> @@ -44,6 +44,7 @@ specific_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'
>  
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c'))
>  specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
> +specific_ss.add(when: 'CONFIG_VHOST_VDPA_NET', if_true: files('vhost-vdpa-net.c'))
>  
>  softmmu_ss.add(when: ['CONFIG_VIRTIO_NET', 'CONFIG_VHOST_NET'], if_true: files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost_net-stub.c'))
> diff --git a/hw/net/vhost-vdpa-net.c b/hw/net/vhost-vdpa-net.c
> new file mode 100644
> index 0000000..48b99f9
> --- /dev/null
> +++ b/hw/net/vhost-vdpa-net.c
> @@ -0,0 +1,338 @@
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/cutils.h"
> +#include "hw/qdev-core.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "hw/virtio/vhost.h"
> +#include "hw/virtio/vhost-vdpa-net.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/virtio-bus.h"
> +#include "hw/virtio/virtio-access.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/runstate.h"
> +#include "net/vhost-vdpa.h"
> +
> +static void vhost_vdpa_net_get_config(VirtIODevice *vdev, uint8_t *config)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +
> +    memcpy(config, &s->netcfg, sizeof(struct virtio_net_config));
> +}
> +
> +static void vhost_vdpa_net_set_config(VirtIODevice *vdev, const uint8_t *config)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    struct virtio_net_config *netcfg = (struct virtio_net_config *)config;
> +    int ret;
> +
> +    ret = vhost_dev_set_config(&s->dev, (uint8_t *)netcfg, 0, sizeof(*netcfg),
> +                               VHOST_SET_CONFIG_TYPE_MASTER);
> +    if (ret) {
> +        error_report("set device config space failed");
> +        return;
> +    }
> +}
> +
> +static uint64_t vhost_vdpa_net_get_features(VirtIODevice *vdev,
> +                                            uint64_t features,
> +                                            Error **errp)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +
> +    virtio_add_feature(&features, VIRTIO_NET_F_CSUM);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_CSUM);
> +    virtio_add_feature(&features, VIRTIO_NET_F_MAC);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GSO);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_TSO4);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_TSO6);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_ECN);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_UFO);
> +    virtio_add_feature(&features, VIRTIO_NET_F_GUEST_ANNOUNCE);
> +    virtio_add_feature(&features, VIRTIO_NET_F_HOST_TSO4);
> +    virtio_add_feature(&features, VIRTIO_NET_F_HOST_TSO6);
> +    virtio_add_feature(&features, VIRTIO_NET_F_HOST_ECN);
> +    virtio_add_feature(&features, VIRTIO_NET_F_HOST_UFO);
> +    virtio_add_feature(&features, VIRTIO_NET_F_MRG_RXBUF);
> +    virtio_add_feature(&features, VIRTIO_NET_F_STATUS);
> +    virtio_add_feature(&features, VIRTIO_NET_F_CTRL_VQ);
> +    virtio_add_feature(&features, VIRTIO_NET_F_CTRL_RX);
> +    virtio_add_feature(&features, VIRTIO_NET_F_CTRL_VLAN);
> +    virtio_add_feature(&features, VIRTIO_NET_F_CTRL_RX_EXTRA);
> +    virtio_add_feature(&features, VIRTIO_NET_F_CTRL_MAC_ADDR);
> +    virtio_add_feature(&features, VIRTIO_NET_F_MQ);
> +
> +    return vhost_get_features(&s->dev, vdpa_feature_bits, features);
> +}
> +
> +static int vhost_vdpa_net_start(VirtIODevice *vdev, Error **errp)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> +    int i, ret;
> +
> +    if (!k->set_guest_notifiers) {
> +        error_setg(errp, "binding does not support guest notifiers");
> +        return -ENOSYS;
> +    }
> +
> +    ret = vhost_dev_enable_notifiers(&s->dev, vdev);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "Error enabling host notifiers");
> +        return ret;
> +    }
> +
> +    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "Error binding guest notifier");
> +        goto err_host_notifiers;
> +    }
> +
> +    s->dev.acked_features = vdev->guest_features;
> +
> +    ret = vhost_dev_start(&s->dev, vdev);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "Error starting vhost");
> +        goto err_guest_notifiers;
> +    }
> +    s->started = true;
> +
> +    /* guest_notifier_mask/pending not used yet, so just unmask
> +     * everything here. virtio-pci will do the right thing by
> +     * enabling/disabling irqfd.
> +     */
> +    for (i = 0; i < s->dev.nvqs; i++) {
> +        vhost_virtqueue_mask(&s->dev, vdev, i, false);
> +    }
> +
> +    return ret;
> +
> +err_guest_notifiers:
> +    k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> +err_host_notifiers:
> +    vhost_dev_disable_notifiers(&s->dev, vdev);
> +    return ret;
> +}
> +
> +static void vhost_vdpa_net_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    Error *local_err = NULL;
> +    int i, ret;
> +
> +    if (!vdev->start_on_kick) {
> +        return;
> +    }
> +
> +    if (s->dev.started) {
> +        return;
> +    }
> +
> +    /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so start
> +     * vhost here instead of waiting for .set_status().
> +     */
> +    ret = vhost_vdpa_net_start(vdev, &local_err);
> +    if (ret < 0) {
> +        error_reportf_err(local_err, "vhost-vdpa-net: start failed: ");
> +        return;
> +    }
> +
> +    /* Kick right away to begin processing requests already in vring */
> +    for (i = 0; i < s->dev.nvqs; i++) {
> +        VirtQueue *kick_vq = virtio_get_queue(vdev, i);
> +
> +        if (!virtio_queue_get_desc_addr(vdev, i)) {
> +            continue;
> +        }
> +        event_notifier_set(virtio_queue_get_host_notifier(kick_vq));
> +    }
> +}
> +
> +static void vhost_vdpa_net_stop(VirtIODevice *vdev)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
> +    int ret;
> +
> +    if (!s->started) {
> +        return;
> +    }
> +    s->started = false;
> +
> +    if (!k->set_guest_notifiers) {
> +        return;
> +    }
> +
> +    vhost_dev_stop(&s->dev, vdev);
> +
> +    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> +    if (ret < 0) {
> +        error_report("vhost guest notifier cleanup failed: %d", ret);
> +        return;
> +    }
> +
> +    vhost_dev_disable_notifiers(&s->dev, vdev);
> +}
> +
> +static void vhost_vdpa_net_set_status(VirtIODevice *vdev, uint8_t status)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    bool should_start = virtio_device_started(vdev, status);
> +    Error *local_err = NULL;
> +    int ret;
> +
> +    if (!vdev->vm_running) {
> +        should_start = false;
> +    }
> +
> +    if (s->started == should_start) {
> +        return;
> +    }
> +
> +    if (should_start) {
> +        ret = vhost_vdpa_net_start(vdev, &local_err);
> +        if (ret < 0) {
> +            error_reportf_err(local_err, "vhost-vdpa-net: start failed: ");
> +        }
> +    } else {
> +        vhost_vdpa_net_stop(vdev);
> +    }
> +}
> +
> +static void vhost_vdpa_net_unrealize(VHostVdpaNet *s)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(s);
> +    int i;
> +
> +    for (i = 0; i < s->queue_pairs * 2; i++) {
> +        virtio_delete_queue(s->virtqs[i]);
> +    }
> +    /* ctrl vq */
> +    virtio_delete_queue(s->virtqs[i]);
> +
> +    g_free(s->virtqs);
> +    virtio_cleanup(vdev);
> +}
> +
> +static void vhost_vdpa_net_device_realize(DeviceState *dev, Error **errp)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +    int i, ret;
> +
> +    s->vdpa.device_fd = qemu_open_old(s->vdpa_dev, O_RDWR);
> +    if (s->vdpa.device_fd == -1) {
> +        error_setg(errp, "vhost-vdpa-net: open %s failed: %s",
> +                   s->vdpa_dev, strerror(errno));
> +        return;
> +    }
> +
> +    virtio_init(vdev, "virtio-net", VIRTIO_ID_NET,
> +                sizeof(struct virtio_net_config));
> +
> +    s->dev.nvqs = s->queue_pairs * 2 + 1;
> +    s->dev.vqs = g_new0(struct vhost_virtqueue, s->dev.nvqs);
> +    s->dev.vq_index = 0;
> +    s->dev.vq_index_end = s->dev.nvqs;
> +    s->dev.backend_features = 0;
> +    s->started = false;
> +
> +    s->virtqs = g_new0(VirtQueue *, s->dev.nvqs);
> +    for (i = 0; i < s->dev.nvqs; i++) {
> +        s->virtqs[i] = virtio_add_queue(vdev, s->queue_size,
> +                                        vhost_vdpa_net_handle_output);
> +    }
> +
> +    ret = vhost_dev_init(&s->dev, &s->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-vdpa-net: vhost initialization failed: %s",
> +                   strerror(-ret));
> +        goto init_err;
> +    }
> +
> +    ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->netcfg,
> +                               sizeof(struct virtio_net_config), NULL);
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-vdpa-net: get network config failed");
> +        goto config_err;
> +    }
> +
> +    return;
> +config_err:
> +    vhost_dev_cleanup(&s->dev);
> +init_err:
> +    vhost_vdpa_net_unrealize(s);
> +    close(s->vdpa.device_fd);
> +}
> +
> +static void vhost_vdpa_net_device_unrealize(DeviceState *dev)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VHostVdpaNet *s = VHOST_VDPA_NET(vdev);
> +
> +    virtio_set_status(vdev, 0);
> +    vhost_dev_cleanup(&s->dev);
> +    vhost_vdpa_net_unrealize(s);
> +    close(s->vdpa.device_fd);
> +}
> +
> +static const VMStateDescription vmstate_vhost_vdpa_net = {
> +    .name = "vhost-vdpa-net",
> +    .minimum_version_id = 1,
> +    .version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +

Not a lot of state here compared to virtio net.
I didn't look at the code deeply so I don't know -
how is the rest of the state migrated?


> +static void vhost_vdpa_net_instance_init(Object *obj)
> +{
> +    VHostVdpaNet *s = VHOST_VDPA_NET(obj);
> +
> +    device_add_bootindex_property(obj, &s->bootindex, "bootindex",
> +                                  "/ethernet-phy@0,0", DEVICE(obj));
> +}
> +
> +static Property vhost_vdpa_net_properties[] = {
> +    DEFINE_PROP_STRING("vdpa-dev", VHostVdpaNet, vdpa_dev),
> +    DEFINE_PROP_UINT16("queue-pairs", VHostVdpaNet, queue_pairs,
> +                       VHOST_VDPA_NET_AUTO_QUEUE_PAIRS),
> +    DEFINE_PROP_UINT32("queue-size", VHostVdpaNet, queue_size,
> +                       VHOST_VDPA_NET_QUEUE_DEFAULT_SIZE),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vhost_vdpa_net_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, vhost_vdpa_net_properties);
> +    dc->vmsd = &vmstate_vhost_vdpa_net;
> +    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
> +    vdc->realize = vhost_vdpa_net_device_realize;
> +    vdc->unrealize = vhost_vdpa_net_device_unrealize;
> +    vdc->get_config = vhost_vdpa_net_get_config;
> +    vdc->set_config = vhost_vdpa_net_set_config;
> +    vdc->get_features = vhost_vdpa_net_get_features;
> +    vdc->set_status = vhost_vdpa_net_set_status;
> +}
> +
> +static const TypeInfo vhost_vdpa_net_info = {
> +    .name = TYPE_VHOST_VDPA_NET,
> +    .parent = TYPE_VIRTIO_DEVICE,
> +    .instance_size = sizeof(VHostVdpaNet),
> +    .instance_init = vhost_vdpa_net_instance_init,
> +    .class_init = vhost_vdpa_net_class_init,
> +};
> +
> +static void virtio_register_types(void)
> +{
> +    type_register_static(&vhost_vdpa_net_info);
> +}
> +
> +type_init(virtio_register_types)
> diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
> index c144d42..50dba2e 100644
> --- a/hw/virtio/Kconfig
> +++ b/hw/virtio/Kconfig
> @@ -68,3 +68,8 @@ config VHOST_USER_RNG
>      bool
>      default y
>      depends on VIRTIO && VHOST_USER
> +
> +config VHOST_VDPA_NET
> +    bool
> +    default y if VIRTIO_PCI
> +    depends on VIRTIO && VHOST_VDPA && LINUX
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 521f7d6..3089222 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -34,6 +34,7 @@ virtio_pci_ss = ss.source_set()
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk-pci.c'))
> +virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_NET', if_true: files('vhost-vdpa-net-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files('vhost-user-input-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-user-scsi-pci.c'))
>  virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-pci.c'))
> diff --git a/hw/virtio/vhost-vdpa-net-pci.c b/hw/virtio/vhost-vdpa-net-pci.c
> new file mode 100644
> index 0000000..84199a8
> --- /dev/null
> +++ b/hw/virtio/vhost-vdpa-net-pci.c
> @@ -0,0 +1,118 @@
> +#include "qemu/osdep.h"
> +#include "standard-headers/linux/virtio_pci.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost-vdpa-net.h"
> +#include "hw/pci/pci.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/module.h"
> +#include "virtio-pci.h"
> +#include "qom/object.h"
> +#include "net/vhost-vdpa.h"
> +
> +typedef struct VHostVdpaNetPCI VHostVdpaNetPCI;
> +
> +#define TYPE_VHOST_VDPA_NET_PCI "vhost-vdpa-net-pci-base"
> +DECLARE_INSTANCE_CHECKER(VHostVdpaNetPCI, VHOST_VDPA_NET_PCI,
> +                         TYPE_VHOST_VDPA_NET_PCI)
> +
> +struct VHostVdpaNetPCI {
> +    VirtIOPCIProxy parent_obj;
> +    VHostVdpaNet vdev;
> +};
> +
> +static Property vhost_vdpa_net_pci_properties[] = {
> +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> +                       DEV_NVECTORS_UNSPECIFIED),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static int vhost_vdpa_net_get_queue_pairs(VHostVdpaNetPCI *dev, Error **errp)
> +{
> +    int device_fd, queue_pairs;
> +    int has_cvq;
> +
> +    device_fd = qemu_open_old(dev->vdev.vdpa_dev, O_RDWR);
> +    if (device_fd == -1) {
> +        error_setg(errp, "vhost-vdpa-net: open %s failed: %s",
> +                   dev->vdev.vdpa_dev, strerror(errno));
> +        return -1;
> +    }
> +
> +    queue_pairs = vhost_vdpa_get_max_queue_pairs(device_fd, &has_cvq, errp);
> +    if (queue_pairs < 0) {
> +        error_setg(errp, "vhost-vdpa-net: get queue pairs failed: %s",
> +                   strerror(errno));
> +        goto out;
> +    }
> +
> +    if (!has_cvq) {
> +        error_setg(errp, "vhost-vdpa-net: not support ctrl vq");
> +    }
> +
> +out:
> +    close(device_fd);
> +    return queue_pairs;
> +}
> +
> +static void vhost_vdpa_net_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> +{
> +    VHostVdpaNetPCI *dev = VHOST_VDPA_NET_PCI(vpci_dev);
> +    DeviceState *vdev = DEVICE(&dev->vdev);
> +
> +    if (dev->vdev.queue_pairs == VHOST_VDPA_NET_AUTO_QUEUE_PAIRS) {
> +        dev->vdev.queue_pairs = vhost_vdpa_net_get_queue_pairs(dev, errp);
> +        if (*errp) {
> +            return;
> +        }
> +    }
> +
> +    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> +        vpci_dev->nvectors = dev->vdev.queue_pairs * 2 + 1;
> +    }
> +
> +    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> +}
> +
> +static void vhost_vdpa_net_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
> +    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
> +    device_class_set_props(dc, vhost_vdpa_net_pci_properties);
> +    k->realize = vhost_vdpa_net_pci_realize;
> +    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> +    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_NET;
> +    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> +    pcidev_k->class_id = PCI_CLASS_NETWORK_ETHERNET;
> +}
> +
> +static void vhost_vdpa_net_pci_instance_init(Object *obj)
> +{
> +    VHostVdpaNetPCI *dev = VHOST_VDPA_NET_PCI(obj);
> +
> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> +                                TYPE_VHOST_VDPA_NET);
> +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> +                              "bootindex");
> +}
> +
> +static const VirtioPCIDeviceTypeInfo vhost_vdpa_net_pci_info = {
> +    .base_name               = TYPE_VHOST_VDPA_NET_PCI,
> +    .generic_name            = "vhost-vdpa-net-pci",
> +    .transitional_name       = "vhost-vdpa-net-pci-transitional",
> +    .non_transitional_name   = "vhost-vdpa-net-pci-non-transitional",
> +    .instance_size  = sizeof(VHostVdpaNetPCI),
> +    .instance_init  = vhost_vdpa_net_pci_instance_init,
> +    .class_init     = vhost_vdpa_net_pci_class_init,
> +};
> +
> +static void vhost_vdpa_net_pci_register(void)
> +{
> +    virtio_pci_types_register(&vhost_vdpa_net_pci_info);
> +}
> +
> +type_init(vhost_vdpa_net_pci_register)
> diff --git a/include/hw/virtio/vhost-vdpa-net.h b/include/hw/virtio/vhost-vdpa-net.h
> new file mode 100644
> index 0000000..63bf3a6
> --- /dev/null
> +++ b/include/hw/virtio/vhost-vdpa-net.h
> @@ -0,0 +1,31 @@
> +#ifndef VHOST_VDPA_NET_H
> +#define VHOST_VDPA_NET_H
> +
> +#include "standard-headers/linux/virtio_blk.h"
> +#include "hw/block/block.h"
> +#include "chardev/char-fe.h"
> +#include "hw/virtio/vhost.h"
> +#include "hw/virtio/vhost-vdpa.h"
> +#include "hw/virtio/virtio-net.h"
> +#include "qom/object.h"
> +
> +#define TYPE_VHOST_VDPA_NET "vhost-vdpa-net"
> +OBJECT_DECLARE_SIMPLE_TYPE(VHostVdpaNet, VHOST_VDPA_NET)
> +
> +struct VHostVdpaNet {
> +    VirtIODevice parent_obj;
> +    int32_t bootindex;
> +    struct virtio_net_config netcfg;
> +    uint16_t queue_pairs;
> +    uint32_t queue_size;
> +    struct vhost_dev dev;
> +    VirtQueue **virtqs;
> +    struct vhost_vdpa vdpa;
> +    char *vdpa_dev;
> +    bool started;
> +};
> +
> +#define VHOST_VDPA_NET_AUTO_QUEUE_PAIRS     UINT16_MAX
> +#define VHOST_VDPA_NET_QUEUE_DEFAULT_SIZE   256
> +
> +#endif
> diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
> index b81f9a6..f029972 100644
> --- a/include/net/vhost-vdpa.h
> +++ b/include/net/vhost-vdpa.h
> @@ -18,4 +18,6 @@ struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
>  
>  extern const int vdpa_feature_bits[];
>  
> +int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp);
> +
>  #endif /* VHOST_VDPA_H */
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 25dd6dd..8ee6ba5 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -219,7 +219,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>      return nc;
>  }
>  
> -static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
> +int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
>  {
>      unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
>      g_autofree struct vhost_vdpa_config *config = NULL;
> -- 
> 1.8.3.1


