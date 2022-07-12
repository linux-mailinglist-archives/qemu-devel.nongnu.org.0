Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E9E57132D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:33:07 +0200 (CEST)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAOG-00012O-4U
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBA9x-0007fk-DB
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:18:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBA9t-0006az-6O
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657610291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7FV+uojoVxnomsLNXsCAx/07fu/w02nHIi6EIMaCfL8=;
 b=efvo7zGUzMqcn7GMiEtpxePucWrZ6JAcOb5uF7/CAmnoikPz3fbPLB/B5zx/n0oD/8kT8I
 xi3eCoR5lBYfQ3gc622DYSTBtwkLmbihDyXUAVQHrH7fDXBNxZVYN9FTTGy7K0pfxjQ225
 GC6nHWSVG0qu8cqWY8Lj+e08/EdgO9U=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-t5XGltNqN3mHCjtph1C_Tg-1; Tue, 12 Jul 2022 03:18:10 -0400
X-MC-Unique: t5XGltNqN3mHCjtph1C_Tg-1
Received: by mail-pl1-f198.google.com with SMTP id
 c18-20020a170903235200b0016c37f6d48cso4605682plh.19
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7FV+uojoVxnomsLNXsCAx/07fu/w02nHIi6EIMaCfL8=;
 b=6fgm21H+9e1zAlUUH35vlIjtO6lIKRKeJDDeHp/alYKGwWiLUAmeljbpNzyLBQkuG1
 PuYIUbpvc8xMAbxdaDAY3Hryn937bfIdV9lWXtcI2lIaEn3YiACVh/q0VIMkv5OupOwV
 r1uOk8xCJ8XC5aJMiiIVk9tZU68TQT321S3gzodIRsNYDDl/Dhh3/C0ZbFan318KlRer
 08Yp25rkpeNnboqxhGAGR181fQSQlOwvjj1qVu8arcMo7N2gS0WZpDx4Xy/2dMkxZZ/w
 mt6nhTUzVP535hK+7MW28h6TY/tehgYldlm8BLJ0UK0dplbcm+86ioaPBsbjExQEBFYP
 hTWA==
X-Gm-Message-State: AJIora+bTVfsWMJ6FZZczZSUR9QuYadZ/9Cma1+q5nAtJbNGMpMjyAWU
 gqiVnxZRTLbtZnOz+lXcV4s92KXePtujXQ5HWN5pMudXImb8XtdcRLTIfOeu1GX+DXHqnPwgEMn
 ItQVipxp1Yxb69K8=
X-Received: by 2002:a17:90b:33c9:b0:1f0:35be:3038 with SMTP id
 lk9-20020a17090b33c900b001f035be3038mr2612359pjb.61.1657610288981; 
 Tue, 12 Jul 2022 00:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1voG968/5aLeCtuYEHYL+LtroSTGu4p7XKfqA/DifElcp18gmcG2G8lyP/jLJEGHBXB9jBVWw==
X-Received: by 2002:a17:90b:33c9:b0:1f0:35be:3038 with SMTP id
 lk9-20020a17090b33c900b001f035be3038mr2612338pjb.61.1657610288624; 
 Tue, 12 Jul 2022 00:18:08 -0700 (PDT)
Received: from [10.72.12.111] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 4-20020a630c44000000b004161b3c3388sm2002728pgm.26.2022.07.12.00.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:18:07 -0700 (PDT)
Message-ID: <0f40536a-8c51-e546-17e8-bd752313123c@redhat.com>
Date: Tue, 12 Jul 2022 15:17:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 20/23] vdpa: Buffer CVQ support on shadow virtqueue
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-21-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220706184008.1649478-21-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/7/7 02:40, Eugenio Pérez 写道:
> Introduce the control virtqueue support for vDPA shadow virtqueue. This
> is needed for advanced networking features like multiqueue.
>
> Virtio-net control VQ will copy the descriptors to qemu's VA, so we
> avoid TOCTOU with the guest's or device's memory every time there is a
> device model change.


Not sure this is a must since we currently do cvq passthrough. So we 
might already "suffer" from this.


> When address space isolation is implemented, this
> will allow, CVQ to only have access to control messages too.
>
> To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR is
> implemented.  If virtio-net driver changes MAC the virtio-net device
> model will be updated with the new one.
>
> Others cvq commands could be added here straightforwardly but they have
> been not tested.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/vhost-vdpa.h |   3 +
>   hw/virtio/vhost-vdpa.c         |   5 +-
>   net/vhost-vdpa.c               | 373 +++++++++++++++++++++++++++++++++
>   3 files changed, 379 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 7214eb47dc..1111d85643 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -15,6 +15,7 @@
>   #include <gmodule.h>
>   
>   #include "hw/virtio/vhost-iova-tree.h"
> +#include "hw/virtio/vhost-shadow-virtqueue.h"
>   #include "hw/virtio/virtio.h"
>   #include "standard-headers/linux/vhost_types.h"
>   
> @@ -35,6 +36,8 @@ typedef struct vhost_vdpa {
>       /* IOVA mapping used by the Shadow Virtqueue */
>       VhostIOVATree *iova_tree;
>       GPtrArray *shadow_vqs;
> +    const VhostShadowVirtqueueOps *shadow_vq_ops;
> +    void *shadow_vq_ops_opaque;
>       struct vhost_dev *dev;
>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>   } VhostVDPA;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 613c3483b0..94bda07b4d 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -417,9 +417,10 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>   
>       shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
>       for (unsigned n = 0; n < hdev->nvqs; ++n) {
> -        g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new(v->iova_tree, NULL,
> -                                                            NULL);
> +        g_autoptr(VhostShadowVirtqueue) svq = NULL;


I don't see the reason of this assignment consider it will just be 
initialized in the following line.


>   
> +        svq = vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> +                            v->shadow_vq_ops_opaque);
>           if (unlikely(!svq)) {
>               error_setg(errp, "Cannot create svq %u", n);
>               return -1;
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index b0158f625e..e415cc8de5 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -11,11 +11,15 @@
>   
>   #include "qemu/osdep.h"
>   #include "clients.h"
> +#include "hw/virtio/virtio-net.h"
>   #include "net/vhost_net.h"
>   #include "net/vhost-vdpa.h"
>   #include "hw/virtio/vhost-vdpa.h"
> +#include "qemu/buffer.h"
>   #include "qemu/config-file.h"
>   #include "qemu/error-report.h"
> +#include "qemu/log.h"
> +#include "qemu/memalign.h"
>   #include "qemu/option.h"
>   #include "qapi/error.h"
>   #include <linux/vhost.h>
> @@ -25,6 +29,26 @@
>   #include "monitor/monitor.h"
>   #include "hw/virtio/vhost.h"
>   
> +typedef struct CVQElement {
> +    /* Device's in and out buffer */
> +    void *in_buf, *out_buf;
> +
> +    /* Optional guest element from where this cvqelement was created */


Should be "cvq element".


> +    VirtQueueElement *guest_elem;
> +
> +    /* Control header sent by the guest. */
> +    struct virtio_net_ctrl_hdr ctrl;
> +
> +    /* vhost-vdpa device, for cleanup reasons */
> +    struct vhost_vdpa *vdpa;
> +
> +    /* Length of out data */
> +    size_t out_len;
> +
> +    /* Copy of the out data sent by the guest excluding ctrl. */
> +    uint8_t out_data[];
> +} CVQElement;
> +
>   /* Todo:need to add the multiqueue support here */
>   typedef struct VhostVDPAState {
>       NetClientState nc;
> @@ -187,6 +211,351 @@ static NetClientInfo net_vhost_vdpa_info = {
>           .check_peer_type = vhost_vdpa_check_peer_type,
>   };
>   
> +/**
> + * Unmap a descriptor chain of a SVQ element, optionally copying its in buffers
> + *
> + * @svq: Shadow VirtQueue
> + * @iova: SVQ IO Virtual address of descriptor
> + * @iov: Optional iovec to store device writable buffer
> + * @iov_cnt: iov length
> + * @buf_len: Length written by the device
> + *
> + * TODO: Use me! and adapt to net/vhost-vdpa format
> + * Print error message in case of error
> + */
> +static void vhost_vdpa_cvq_unmap_buf(CVQElement *elem, void *addr)
> +{
> +    struct vhost_vdpa *v = elem->vdpa;
> +    VhostIOVATree *tree = v->iova_tree;
> +    DMAMap needle = {
> +        /*
> +         * No need to specify size or to look for more translations since
> +         * this contiguous chunk was allocated by us.
> +         */
> +        .translated_addr = (hwaddr)(uintptr_t)addr,
> +    };
> +    const DMAMap *map = vhost_iova_tree_find_iova(tree, &needle);
> +    int r;
> +
> +    if (unlikely(!map)) {
> +        error_report("Cannot locate expected map");
> +        goto err;
> +    }
> +
> +    r = vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
> +    if (unlikely(r != 0)) {
> +        error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
> +    }
> +
> +    vhost_iova_tree_remove(tree, map);
> +
> +err:
> +    qemu_vfree(addr);
> +}
> +
> +static void vhost_vdpa_cvq_delete_elem(CVQElement *elem)
> +{
> +    if (elem->out_buf) {
> +        vhost_vdpa_cvq_unmap_buf(elem, g_steal_pointer(&elem->out_buf));
> +    }
> +
> +    if (elem->in_buf) {
> +        vhost_vdpa_cvq_unmap_buf(elem, g_steal_pointer(&elem->in_buf));
> +    }
> +
> +    /* Guest element must have been returned to the guest or free otherway */
> +    assert(!elem->guest_elem);
> +
> +    g_free(elem);
> +}
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(CVQElement, vhost_vdpa_cvq_delete_elem);
> +
> +static int vhost_vdpa_net_cvq_svq_inject(VhostShadowVirtqueue *svq,
> +                                         CVQElement *cvq_elem,
> +                                         size_t out_len)
> +{
> +    const struct iovec iov[] = {
> +        {
> +            .iov_base = cvq_elem->out_buf,
> +            .iov_len = out_len,
> +        },{
> +            .iov_base = cvq_elem->in_buf,
> +            .iov_len = sizeof(virtio_net_ctrl_ack),
> +        }
> +    };
> +
> +    return vhost_svq_inject(svq, iov, 1, 1, cvq_elem);
> +}
> +
> +static void *vhost_vdpa_cvq_alloc_buf(struct vhost_vdpa *v,
> +                                      const uint8_t *out_data, size_t data_len,
> +                                      bool write)
> +{
> +    DMAMap map = {};
> +    size_t buf_len = ROUND_UP(data_len, qemu_real_host_page_size());
> +    void *buf = qemu_memalign(qemu_real_host_page_size(), buf_len);
> +    int r;
> +
> +    if (!write) {
> +        memcpy(buf, out_data, data_len);
> +        memset(buf + data_len, 0, buf_len - data_len);
> +    } else {
> +        memset(buf, 0, data_len);
> +    }
> +
> +    map.translated_addr = (hwaddr)(uintptr_t)buf;
> +    map.size = buf_len - 1;
> +    map.perm = write ? IOMMU_RW : IOMMU_RO,
> +    r = vhost_iova_tree_map_alloc(v->iova_tree, &map);
> +    if (unlikely(r != IOVA_OK)) {
> +        error_report("Cannot map injected element");
> +        goto err;
> +    }
> +
> +    r = vhost_vdpa_dma_map(v, map.iova, buf_len, buf, !write);
> +    /* TODO: Handle error */
> +    assert(r == 0);
> +
> +    return buf;
> +
> +err:
> +    qemu_vfree(buf);
> +    return NULL;
> +}
> +
> +/**
> + * Allocate an element suitable to be injected
> + *
> + * @iov: The iovec
> + * @out_num: Number of out elements, placed first in iov
> + * @in_num: Number of in elements, placed after out ones
> + * @elem: Optional guest element from where this one was created
> + *
> + * TODO: Do we need a sg for out_num? I think not
> + */
> +static CVQElement *vhost_vdpa_cvq_alloc_elem(VhostVDPAState *s,
> +                                             struct virtio_net_ctrl_hdr ctrl,
> +                                             const struct iovec *out_sg,
> +                                             size_t out_num, size_t out_size,
> +                                             VirtQueueElement *elem)
> +{
> +    g_autoptr(CVQElement) cvq_elem = g_malloc(sizeof(CVQElement) + out_size);
> +    uint8_t *out_cursor = cvq_elem->out_data;
> +    struct vhost_vdpa *v = &s->vhost_vdpa;
> +
> +    /* Start with a clean base */
> +    memset(cvq_elem, 0, sizeof(*cvq_elem));
> +    cvq_elem->vdpa = &s->vhost_vdpa;
> +
> +    /*
> +     * Linearize element. If guest had a descriptor chain, we expose the device
> +     * a single buffer.
> +     */
> +    cvq_elem->out_len = out_size;
> +    memcpy(out_cursor, &ctrl, sizeof(ctrl));
> +    out_size -= sizeof(ctrl);
> +    out_cursor += sizeof(ctrl);
> +    iov_to_buf(out_sg, out_num, 0, out_cursor, out_size);
> +
> +    cvq_elem->out_buf = vhost_vdpa_cvq_alloc_buf(v, cvq_elem->out_data,
> +                                                 out_size, false);
> +    assert(cvq_elem->out_buf);
> +    cvq_elem->in_buf = vhost_vdpa_cvq_alloc_buf(v, NULL,
> +                                                sizeof(virtio_net_ctrl_ack),
> +                                                true);
> +    assert(cvq_elem->in_buf);
> +
> +    cvq_elem->guest_elem = elem;
> +    cvq_elem->ctrl = ctrl;
> +    return g_steal_pointer(&cvq_elem);
> +}
> +
> +/**
> + * iov_size with an upper limit. It's assumed UINT64_MAX is an invalid
> + * iov_size.
> + */
> +static uint64_t vhost_vdpa_net_iov_len(const struct iovec *iov,
> +                                       unsigned int iov_cnt, size_t max)
> +{
> +    uint64_t len = 0;
> +
> +    for (unsigned int i = 0; len < max && i < iov_cnt; i++) {
> +        bool overflow = uadd64_overflow(iov[i].iov_len, len, &len);
> +        if (unlikely(overflow)) {
> +            return UINT64_MAX;
> +        }


Let's use iov_size() here, and if you think we need to fix the overflow 
issue, we need fix it there then other user can benefit from that.


> +    }
> +
> +    return len;
> +}
> +
> +static CVQElement *vhost_vdpa_net_cvq_copy_elem(VhostVDPAState *s,
> +                                                VirtQueueElement *elem)
> +{
> +    struct virtio_net_ctrl_hdr ctrl;
> +    g_autofree struct iovec *iov = NULL;
> +    struct iovec *iov2;
> +    unsigned int out_num = elem->out_num;
> +    size_t n, out_size = 0;
> +
> +    /* TODO: in buffer MUST have only a single entry with a char? size */


I couldn't understand the question but we should not assume the layout 
of the control command.


> +    if (unlikely(vhost_vdpa_net_iov_len(elem->in_sg, elem->in_num,
> +                                        sizeof(virtio_net_ctrl_ack))
> +                                              < sizeof(virtio_net_ctrl_ack))) {
> +        return NULL;
> +    }


We don't have such check in virtio-net.c, anything make svq different?


> +
> +    n = iov_to_buf(elem->out_sg, out_num, 0, &ctrl, sizeof(ctrl));
> +    if (unlikely(n != sizeof(ctrl))) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid out size\n", __func__);
> +        return NULL;
> +    }
> +
> +    iov = iov2 = g_memdup2(elem->out_sg, sizeof(struct iovec) * elem->out_num);


Let's use iov_copy() here.

And I don't see how iov is used after this.


> +    iov_discard_front(&iov2, &out_num, sizeof(ctrl));
> +    switch (ctrl.class) {
> +    case VIRTIO_NET_CTRL_MAC:
> +        switch (ctrl.cmd) {
> +        case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> +            if (likely(vhost_vdpa_net_iov_len(iov2, out_num, 6))) {
> +                out_size += 6;
> +                break;
> +            }
> +
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac size\n", __func__);
> +            return NULL;


Note that we need to support VIRTIO_NET_CTRL_ANNOUNCE_ACK in order to 
support live migration.

But a more fundamental question, what's the value of having this kind of 
whitelist here?

Is it more simpler just have a sane limit of the buffer and simply 
forward everything to the vhost-vDPA?

And if we do this, instead of validating the inputs one by one we can 
simply doing validation only on VIRTIO_NET_CTRL_MAC_TABLE_SET which 
accepts variable length and simply fallback to alluni/allmulti if it 
contains too much entries.


> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac cmd %u\n",
> +                          __func__, ctrl.cmd);
> +            return NULL;
> +        };
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n",
> +                      __func__, ctrl.class);
> +        return NULL;
> +    };
> +
> +    return vhost_vdpa_cvq_alloc_elem(s, ctrl, iov2, out_num,
> +                                     sizeof(ctrl) + out_size, elem);
> +}
> +
> +/**
> + * Validate and copy control virtqueue commands.
> + *
> + * Following QEMU guidelines, we offer a copy of the buffers to the device to
> + * prevent TOCTOU bugs.  This functions check that the buffers length are
> + * expected too.
> + */
> +static bool vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
> +                                             VirtQueueElement *guest_elem,
> +                                             void *opaque)
> +{
> +    VhostVDPAState *s = opaque;
> +    g_autoptr(CVQElement) cvq_elem = NULL;
> +    g_autofree VirtQueueElement *elem = guest_elem;
> +    size_t out_size, in_len;
> +    virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
> +    int r;
> +
> +    cvq_elem = vhost_vdpa_net_cvq_copy_elem(s, elem);
> +    if (unlikely(!cvq_elem)) {
> +        goto err;
> +    }
> +
> +    /* out size validated at vhost_vdpa_net_cvq_copy_elem */
> +    out_size = iov_size(elem->out_sg, elem->out_num);
> +    r = vhost_vdpa_net_cvq_svq_inject(svq, cvq_elem, out_size);
> +    if (unlikely(r != 0)) {
> +        goto err;
> +    }
> +
> +    cvq_elem->guest_elem = g_steal_pointer(&elem);
> +    /* Now CVQ elem belongs to SVQ */
> +    g_steal_pointer(&cvq_elem);
> +    return true;
> +
> +err:
> +    in_len = iov_from_buf(elem->in_sg, elem->in_num, 0, &status,
> +                          sizeof(status));
> +    vhost_svq_push_elem(svq, elem, in_len);
> +    return true;
> +}
> +
> +static VirtQueueElement *vhost_vdpa_net_handle_ctrl_detach(void *elem_opaque)
> +{
> +    g_autoptr(CVQElement) cvq_elem = elem_opaque;
> +    return g_steal_pointer(&cvq_elem->guest_elem);
> +}
> +
> +static void vhost_vdpa_net_handle_ctrl_used(VhostShadowVirtqueue *svq,
> +                                            void *vq_elem_opaque,
> +                                            uint32_t dev_written)
> +{
> +    g_autoptr(CVQElement) cvq_elem = vq_elem_opaque;
> +    virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
> +    const struct iovec out = {
> +        .iov_base = cvq_elem->out_data,
> +        .iov_len = cvq_elem->out_len,
> +    };
> +    const DMAMap status_map_needle = {
> +        .translated_addr = (hwaddr)(uintptr_t)cvq_elem->in_buf,
> +        .size = sizeof(status),
> +    };
> +    const DMAMap *in_map;
> +    const struct iovec in = {
> +        .iov_base = &status,
> +        .iov_len = sizeof(status),
> +    };
> +    g_autofree VirtQueueElement *guest_elem = NULL;
> +
> +    if (unlikely(dev_written < sizeof(status))) {
> +        error_report("Insufficient written data (%llu)",
> +                     (long long unsigned)dev_written);
> +        goto out;
> +    }
> +
> +    in_map = vhost_iova_tree_find_iova(svq->iova_tree, &status_map_needle);
> +    if (unlikely(!in_map)) {
> +        error_report("Cannot locate out mapping");
> +        goto out;
> +    }
> +
> +    switch (cvq_elem->ctrl.class) {
> +    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> +        break;
> +    default:
> +        error_report("Unexpected ctrl class %u", cvq_elem->ctrl.class);
> +        goto out;
> +    };
> +
> +    memcpy(&status, cvq_elem->in_buf, sizeof(status));
> +    if (status != VIRTIO_NET_OK) {
> +        goto out;
> +    }
> +
> +    status = VIRTIO_NET_ERR;
> +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);


I wonder if this is the best choice. It looks to me it might be better 
to extend the virtio_net_handle_ctrl_iov() logic:

virtio_net_handle_ctrl_iov() {
     if (svq enabled) {
          host_elem = iov_copy(guest_elem);
          vhost_svq_add(host_elem);
          vhost_svq_poll(host_elem);
     }
     // usersapce ctrl vq logic
}


This can help to avoid coupling too much logic in cvq (like the 
avail,used and detach ops).

Thanks


> +    if (status != VIRTIO_NET_OK) {
> +        error_report("Bad CVQ processing in model");
> +        goto out;
> +    }
> +
> +out:
> +    guest_elem = g_steal_pointer(&cvq_elem->guest_elem);
> +    if (guest_elem) {
> +        iov_from_buf(guest_elem->in_sg, guest_elem->in_num, 0, &status,
> +                     sizeof(status));
> +        vhost_svq_push_elem(svq, guest_elem, sizeof(status));
> +    }
> +}
> +
> +static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
> +    .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
> +    .used_handler = vhost_vdpa_net_handle_ctrl_used,
> +    .detach_handler = vhost_vdpa_net_handle_ctrl_detach,
> +};
> +
>   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>                                              const char *device,
>                                              const char *name,
> @@ -211,6 +580,10 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>   
>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>       s->vhost_vdpa.index = queue_pair_index;
> +    if (!is_datapath) {
> +        s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
> +        s->vhost_vdpa.shadow_vq_ops_opaque = s;
> +    }
>       ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
>       if (ret) {
>           qemu_del_net_client(nc);


