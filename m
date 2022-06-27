Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD6E55B64A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 06:49:22 +0200 (CEST)
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5gga-0008JR-Un
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 00:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o5gdJ-0007Jb-1d
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 00:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o5gdC-0008UY-Mf
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 00:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656305148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwWCCaKBGS9he1u9U1u5oiJxcYdqdy6Z14RjZ3w4IP8=;
 b=c8EaOOSwOP1Ej6Z7o+oMiJ83pyS9ZuIh1j4B7vvDABIgCzhAPr+fByJptvwf1GH+2NN5f/
 728CejT/xLhf5zhGtqJJg645X88cXpmv34gLvv6T5FIwJaFek8YQVWZBKFHpBD3lMgNpe2
 aWyFJkKky7CBBXtlvYY3x5BW1aL9Q5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-pYXlL_biMUiiSwOribCtBw-1; Mon, 27 Jun 2022 00:45:43 -0400
X-MC-Unique: pYXlL_biMUiiSwOribCtBw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30429811E75;
 Mon, 27 Jun 2022 04:45:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A20A4492CA3;
 Mon, 27 Jun 2022 04:45:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 41FB821E690D; Mon, 27 Jun 2022 06:45:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: qemu-block@nongnu.org,  qemu-devel@nongnu.org, Kevin Wolf
 <kwolf@redhat.com>
Subject: Re: [PULL v2 10/20] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
References: <20220624154103.185902-1-kwolf@redhat.com>
 <20220624154103.185902-11-kwolf@redhat.com>
Date: Mon, 27 Jun 2022 06:45:41 +0200
In-Reply-To: <20220624154103.185902-11-kwolf@redhat.com> (Kevin Wolf's message
 of "Fri, 24 Jun 2022 17:40:53 +0200")
Message-ID: <8735fq7lze.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Kevin Wolf <kwolf@redhat.com> writes:

> From: Xie Yongji <xieyongji@bytedance.com>
>
> VDUSE [1] is a linux framework that makes it possible to implement
> software-emulated vDPA devices in userspace. This adds a library
> as a subproject to help implementing VDUSE backends in QEMU.
>
> [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
>
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> Message-Id: <20220523084611.91-6-xieyongji@bytedance.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  meson_options.txt                           |    2 +
>  subprojects/libvduse/include/atomic.h       |    1 +
>  subprojects/libvduse/include/compiler.h     |    1 +
>  subprojects/libvduse/libvduse.h             |  235 ++++
>  subprojects/libvduse/libvduse.c             | 1150 +++++++++++++++++++
>  MAINTAINERS                                 |    5 +
>  meson.build                                 |   15 +
>  scripts/meson-buildoptions.sh               |    3 +
>  subprojects/libvduse/linux-headers/linux    |    1 +
>  subprojects/libvduse/meson.build            |   10 +
>  subprojects/libvduse/standard-headers/linux |    1 +
>  11 files changed, 1424 insertions(+)
>  create mode 120000 subprojects/libvduse/include/atomic.h
>  create mode 120000 subprojects/libvduse/include/compiler.h
>  create mode 100644 subprojects/libvduse/libvduse.h
>  create mode 100644 subprojects/libvduse/libvduse.c
>  create mode 120000 subprojects/libvduse/linux-headers/linux
>  create mode 100644 subprojects/libvduse/meson.build
>  create mode 120000 subprojects/libvduse/standard-headers/linux
>
> diff --git a/meson_options.txt b/meson_options.txt
> index f3e2f22c1e..23a9f440f7 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -257,6 +257,8 @@ option('virtfs', type: 'feature', value: 'auto',
>         description: 'virtio-9p support')
>  option('virtiofsd', type: 'feature', value: 'auto',
>         description: 'build virtiofs daemon (virtiofsd)')
> +option('libvduse', type: 'feature', value: 'auto',
> +       description: 'build VDUSE Library')
>=20=20
>  option('capstone', type: 'feature', value: 'auto',
>         description: 'Whether and how to find the capstone library')
> diff --git a/subprojects/libvduse/include/atomic.h b/subprojects/libvduse=
/include/atomic.h
> new file mode 120000
> index 0000000000..8c2be64f7b
> --- /dev/null
> +++ b/subprojects/libvduse/include/atomic.h
> @@ -0,0 +1 @@
> +../../../include/qemu/atomic.h
> \ No newline at end of file
> diff --git a/subprojects/libvduse/include/compiler.h b/subprojects/libvdu=
se/include/compiler.h
> new file mode 120000
> index 0000000000..de7b70697c
> --- /dev/null
> +++ b/subprojects/libvduse/include/compiler.h
> @@ -0,0 +1 @@
> +../../../include/qemu/compiler.h
> \ No newline at end of file
> diff --git a/subprojects/libvduse/libvduse.h b/subprojects/libvduse/libvd=
use.h
> new file mode 100644
> index 0000000000..6c2fe98213
> --- /dev/null
> +++ b/subprojects/libvduse/libvduse.h
> @@ -0,0 +1,235 @@
> +/*
> + * VDUSE (vDPA Device in Userspace) library
> + *
> + * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights r=
eserved.
> + *
> + * Author:
> + *   Xie Yongji <xieyongji@bytedance.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef LIBVDUSE_H
> +#define LIBVDUSE_H
> +
> +#include <stdint.h>
> +#include <sys/uio.h>
> +
> +#define VIRTQUEUE_MAX_SIZE 1024
> +
> +/* VDUSE device structure */
> +typedef struct VduseDev VduseDev;
> +
> +/* Virtqueue structure */
> +typedef struct VduseVirtq VduseVirtq;
> +
> +/* Some operation of VDUSE backend */
> +typedef struct VduseOps {
> +    /* Called when virtqueue can be processed */
> +    void (*enable_queue)(VduseDev *dev, VduseVirtq *vq);
> +    /* Called when virtqueue processing should be stopped */
> +    void (*disable_queue)(VduseDev *dev, VduseVirtq *vq);
> +} VduseOps;
> +
> +/* Describing elements of the I/O buffer */
> +typedef struct VduseVirtqElement {
> +    /* Descriptor table index */
> +    unsigned int index;
> +    /* Number of physically-contiguous device-readable descriptors */
> +    unsigned int out_num;
> +    /* Number of physically-contiguous device-writable descriptors */
> +    unsigned int in_num;
> +    /* Array to store physically-contiguous device-writable descriptors =
*/
> +    struct iovec *in_sg;
> +    /* Array to store physically-contiguous device-readable descriptors =
*/
> +    struct iovec *out_sg;
> +} VduseVirtqElement;
> +
> +
> +/**
> + * vduse_get_virtio_features:
> + *
> + * Get supported virtio features
> + *
> + * Returns: supported feature bits
> + */
> +uint64_t vduse_get_virtio_features(void);
> +
> +/**
> + * vduse_queue_get_dev:
> + * @vq: specified virtqueue
> + *
> + * Get corresponding VDUSE device from the virtqueue.
> + *
> + * Returns: a pointer to VDUSE device on success, NULL on failure.
> + */
> +VduseDev *vduse_queue_get_dev(VduseVirtq *vq);
> +
> +/**
> + * vduse_queue_get_fd:
> + * @vq: specified virtqueue
> + *
> + * Get the kick fd for the virtqueue.
> + *
> + * Returns: file descriptor on success, -1 on failure.
> + */
> +int vduse_queue_get_fd(VduseVirtq *vq);
> +
> +/**
> + * vduse_queue_pop:
> + * @vq: specified virtqueue
> + * @sz: the size of struct to return (must be >=3D VduseVirtqElement)
> + *
> + * Pop an element from virtqueue available ring.
> + *
> + * Returns: a pointer to a structure containing VduseVirtqElement on suc=
cess,
> + * NULL on failure.
> + */
> +void *vduse_queue_pop(VduseVirtq *vq, size_t sz);
> +
> +/**
> + * vduse_queue_push:
> + * @vq: specified virtqueue
> + * @elem: pointer to VduseVirtqElement returned by vduse_queue_pop()
> + * @len: length in bytes to write
> + *
> + * Push an element to virtqueue used ring.
> + */
> +void vduse_queue_push(VduseVirtq *vq, const VduseVirtqElement *elem,
> +                      unsigned int len);
> +/**
> + * vduse_queue_notify:
> + * @vq: specified virtqueue
> + *
> + * Request to notify the queue.
> + */
> +void vduse_queue_notify(VduseVirtq *vq);
> +
> +/**
> + * vduse_dev_get_priv:
> + * @dev: VDUSE device
> + *
> + * Get the private pointer passed to vduse_dev_create().
> + *
> + * Returns: private pointer on success, NULL on failure.
> + */
> +void *vduse_dev_get_priv(VduseDev *dev);
> +
> +/**
> + * vduse_dev_get_queue:
> + * @dev: VDUSE device
> + * @index: virtqueue index
> + *
> + * Get the specified virtqueue.
> + *
> + * Returns: a pointer to the virtqueue on success, NULL on failure.
> + */
> +VduseVirtq *vduse_dev_get_queue(VduseDev *dev, int index);
> +
> +/**
> + * vduse_dev_get_fd:
> + * @dev: VDUSE device
> + *
> + * Get the control message fd for the VDUSE device.
> + *
> + * Returns: file descriptor on success, -1 on failure.
> + */
> +int vduse_dev_get_fd(VduseDev *dev);
> +
> +/**
> + * vduse_dev_handler:
> + * @dev: VDUSE device
> + *
> + * Used to process the control message.
> + *
> + * Returns: file descriptor on success, -errno on failure.
> + */
> +int vduse_dev_handler(VduseDev *dev);
> +
> +/**
> + * vduse_dev_update_config:
> + * @dev: VDUSE device
> + * @size: the size to write to configuration space
> + * @offset: the offset from the beginning of configuration space
> + * @buffer: the buffer used to write from
> + *
> + * Update device configuration space and inject a config interrupt.
> + *
> + * Returns: 0 on success, -errno on failure.
> + */
> +int vduse_dev_update_config(VduseDev *dev, uint32_t size,
> +                            uint32_t offset, char *buffer);
> +
> +/**
> + * vduse_dev_setup_queue:
> + * @dev: VDUSE device
> + * @index: virtqueue index
> + * @max_size: the max size of virtqueue
> + *
> + * Setup the specified virtqueue.
> + *
> + * Returns: 0 on success, -errno on failure.
> + */
> +int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size);
> +
> +/**
> + * vduse_dev_create_by_fd:
> + * @fd: passed file descriptor
> + * @num_queues: the number of virtqueues
> + * @ops: the operation of VDUSE backend
> + * @priv: private pointer
> + *
> + * Create VDUSE device from a passed file descriptor.
> + *
> + * Returns: pointer to VDUSE device on success, NULL on failure.
> + */
> +VduseDev *vduse_dev_create_by_fd(int fd, uint16_t num_queues,
> +                                 const VduseOps *ops, void *priv);
> +
> +/**
> + * vduse_dev_create_by_name:
> + * @name: VDUSE device name
> + * @num_queues: the number of virtqueues
> + * @ops: the operation of VDUSE backend
> + * @priv: private pointer
> + *
> + * Create VDUSE device on /dev/vduse/$NAME.
> + *
> + * Returns: pointer to VDUSE device on success, NULL on failure.
> + */
> +VduseDev *vduse_dev_create_by_name(const char *name, uint16_t num_queues,
> +                                   const VduseOps *ops, void *priv);
> +
> +/**
> + * vduse_dev_create:
> + * @name: VDUSE device name
> + * @device_id: virtio device id
> + * @vendor_id: virtio vendor id
> + * @features: virtio features
> + * @num_queues: the number of virtqueues
> + * @config_size: the size of the configuration space
> + * @config: the buffer of the configuration space
> + * @ops: the operation of VDUSE backend
> + * @priv: private pointer
> + *
> + * Create VDUSE device.
> + *
> + * Returns: pointer to VDUSE device on success, NULL on failure.
> + */
> +VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> +                           uint32_t vendor_id, uint64_t features,
> +                           uint16_t num_queues, uint32_t config_size,
> +                           char *config, const VduseOps *ops, void *priv=
);
> +
> +/**
> + * vduse_dev_destroy:
> + * @dev: VDUSE device
> + *
> + * Destroy the VDUSE device.
> + *
> + * Returns: 0 on success, -errno on failure.
> + */
> +int vduse_dev_destroy(VduseDev *dev);
> +
> +#endif
> diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvd=
use.c
> new file mode 100644
> index 0000000000..78e1e5cf90
> --- /dev/null
> +++ b/subprojects/libvduse/libvduse.c
> @@ -0,0 +1,1150 @@
> +/*
> + * VDUSE (vDPA Device in Userspace) library
> + *
> + * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights r=
eserved.
> + *   Portions of codes and concepts borrowed from libvhost-user.c, so:
> + *     Copyright IBM, Corp. 2007
> + *     Copyright (c) 2016 Red Hat, Inc.
> + *
> + * Author:
> + *   Xie Yongji <xieyongji@bytedance.com>
> + *   Anthony Liguori <aliguori@us.ibm.com>
> + *   Marc-Andr=C3=A9 Lureau <mlureau@redhat.com>
> + *   Victor Kaplansky <victork@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + */
> +
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <assert.h>
> +#include <endian.h>
> +#include <unistd.h>
> +#include <limits.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +
> +#include <sys/ioctl.h>
> +#include <sys/eventfd.h>
> +#include <sys/mman.h>
> +
> +#include "include/atomic.h"
> +#include "linux-headers/linux/virtio_ring.h"
> +#include "linux-headers/linux/virtio_config.h"
> +#include "linux-headers/linux/vduse.h"
> +#include "libvduse.h"
> +
> +#define VDUSE_VQ_ALIGN 4096
> +#define MAX_IOVA_REGIONS 256
> +
> +/* Round number down to multiple */
> +#define ALIGN_DOWN(n, m) ((n) / (m) * (m))
> +
> +/* Round number up to multiple */
> +#define ALIGN_UP(n, m) ALIGN_DOWN((n) + (m) - 1, (m))
> +
> +#ifndef unlikely
> +#define unlikely(x)   __builtin_expect(!!(x), 0)
> +#endif
> +
> +typedef struct VduseRing {
> +    unsigned int num;
> +    uint64_t desc_addr;
> +    uint64_t avail_addr;
> +    uint64_t used_addr;
> +    struct vring_desc *desc;
> +    struct vring_avail *avail;
> +    struct vring_used *used;
> +} VduseRing;
> +
> +struct VduseVirtq {
> +    VduseRing vring;
> +    uint16_t last_avail_idx;
> +    uint16_t shadow_avail_idx;
> +    uint16_t used_idx;
> +    uint16_t signalled_used;
> +    bool signalled_used_valid;
> +    int index;
> +    int inuse;
> +    bool ready;
> +    int fd;
> +    VduseDev *dev;
> +};
> +
> +typedef struct VduseIovaRegion {
> +    uint64_t iova;
> +    uint64_t size;
> +    uint64_t mmap_offset;
> +    uint64_t mmap_addr;
> +} VduseIovaRegion;
> +
> +struct VduseDev {
> +    VduseVirtq *vqs;
> +    VduseIovaRegion regions[MAX_IOVA_REGIONS];
> +    int num_regions;
> +    char *name;
> +    uint32_t device_id;
> +    uint32_t vendor_id;
> +    uint16_t num_queues;
> +    uint16_t queue_size;
> +    uint64_t features;
> +    const VduseOps *ops;
> +    int fd;
> +    int ctrl_fd;
> +    void *priv;
> +};
> +
> +static inline bool has_feature(uint64_t features, unsigned int fbit)
> +{
> +    assert(fbit < 64);
> +    return !!(features & (1ULL << fbit));
> +}
> +
> +static inline bool vduse_dev_has_feature(VduseDev *dev, unsigned int fbi=
t)
> +{
> +    return has_feature(dev->features, fbit);
> +}
> +
> +uint64_t vduse_get_virtio_features(void)
> +{
> +    return (1ULL << VIRTIO_F_IOMMU_PLATFORM) |
> +           (1ULL << VIRTIO_F_VERSION_1) |
> +           (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
> +           (1ULL << VIRTIO_RING_F_EVENT_IDX) |
> +           (1ULL << VIRTIO_RING_F_INDIRECT_DESC);
> +}
> +
> +VduseDev *vduse_queue_get_dev(VduseVirtq *vq)
> +{
> +    return vq->dev;
> +}
> +
> +int vduse_queue_get_fd(VduseVirtq *vq)
> +{
> +    return vq->fd;
> +}
> +
> +void *vduse_dev_get_priv(VduseDev *dev)
> +{
> +    return dev->priv;
> +}
> +
> +VduseVirtq *vduse_dev_get_queue(VduseDev *dev, int index)
> +{
> +    return &dev->vqs[index];
> +}
> +
> +int vduse_dev_get_fd(VduseDev *dev)
> +{
> +    return dev->fd;
> +}
> +
> +static int vduse_inject_irq(VduseDev *dev, int index)
> +{
> +    return ioctl(dev->fd, VDUSE_VQ_INJECT_IRQ, &index);
> +}
> +
> +static void vduse_iova_remove_region(VduseDev *dev, uint64_t start,
> +                                     uint64_t last)
> +{
> +    int i;
> +
> +    if (last =3D=3D start) {
> +        return;
> +    }
> +
> +    for (i =3D 0; i < MAX_IOVA_REGIONS; i++) {
> +        if (!dev->regions[i].mmap_addr) {
> +            continue;
> +        }
> +
> +        if (start <=3D dev->regions[i].iova &&
> +            last >=3D (dev->regions[i].iova + dev->regions[i].size - 1))=
 {
> +            munmap((void *)(uintptr_t)dev->regions[i].mmap_addr,
> +                   dev->regions[i].mmap_offset + dev->regions[i].size);
> +            dev->regions[i].mmap_addr =3D 0;
> +            dev->num_regions--;
> +        }
> +    }
> +}
> +
> +static int vduse_iova_add_region(VduseDev *dev, int fd,
> +                                 uint64_t offset, uint64_t start,
> +                                 uint64_t last, int prot)
> +{
> +    int i;
> +    uint64_t size =3D last - start + 1;
> +    void *mmap_addr =3D mmap(0, size + offset, prot, MAP_SHARED, fd, 0);
> +
> +    if (mmap_addr =3D=3D MAP_FAILED) {
> +        close(fd);
> +        return -EINVAL;
> +    }
> +
> +    for (i =3D 0; i < MAX_IOVA_REGIONS; i++) {
> +        if (!dev->regions[i].mmap_addr) {
> +            dev->regions[i].mmap_addr =3D (uint64_t)(uintptr_t)mmap_addr;
> +            dev->regions[i].mmap_offset =3D offset;
> +            dev->regions[i].iova =3D start;
> +            dev->regions[i].size =3D size;
> +            dev->num_regions++;
> +            break;
> +        }
> +    }
> +    assert(i < MAX_IOVA_REGIONS);
> +    close(fd);
> +
> +    return 0;
> +}
> +
> +static int perm_to_prot(uint8_t perm)
> +{
> +    int prot =3D 0;
> +
> +    switch (perm) {
> +    case VDUSE_ACCESS_WO:
> +        prot |=3D PROT_WRITE;
> +        break;
> +    case VDUSE_ACCESS_RO:
> +        prot |=3D PROT_READ;
> +        break;
> +    case VDUSE_ACCESS_RW:
> +        prot |=3D PROT_READ | PROT_WRITE;
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return prot;
> +}
> +
> +static inline void *iova_to_va(VduseDev *dev, uint64_t *plen, uint64_t i=
ova)
> +{
> +    int i, ret;
> +    struct vduse_iotlb_entry entry;
> +
> +    for (i =3D 0; i < MAX_IOVA_REGIONS; i++) {
> +        VduseIovaRegion *r =3D &dev->regions[i];
> +
> +        if (!r->mmap_addr) {
> +            continue;
> +        }
> +
> +        if ((iova >=3D r->iova) && (iova < (r->iova + r->size))) {
> +            if ((iova + *plen) > (r->iova + r->size)) {
> +                *plen =3D r->iova + r->size - iova;
> +            }
> +            return (void *)(uintptr_t)(iova - r->iova +
> +                   r->mmap_addr + r->mmap_offset);
> +        }
> +    }
> +
> +    entry.start =3D iova;
> +    entry.last =3D iova + 1;
> +    ret =3D ioctl(dev->fd, VDUSE_IOTLB_GET_FD, &entry);
> +    if (ret < 0) {
> +        return NULL;
> +    }
> +
> +    if (!vduse_iova_add_region(dev, ret, entry.offset, entry.start,
> +                               entry.last, perm_to_prot(entry.perm))) {
> +        return iova_to_va(dev, plen, iova);
> +    }
> +
> +    return NULL;
> +}
> +
> +static inline uint16_t vring_avail_flags(VduseVirtq *vq)
> +{
> +    return le16toh(vq->vring.avail->flags);
> +}
> +
> +static inline uint16_t vring_avail_idx(VduseVirtq *vq)
> +{
> +    vq->shadow_avail_idx =3D le16toh(vq->vring.avail->idx);
> +
> +    return vq->shadow_avail_idx;
> +}
> +
> +static inline uint16_t vring_avail_ring(VduseVirtq *vq, int i)
> +{
> +    return le16toh(vq->vring.avail->ring[i]);
> +}
> +
> +static inline uint16_t vring_get_used_event(VduseVirtq *vq)
> +{
> +    return vring_avail_ring(vq, vq->vring.num);
> +}
> +
> +static bool vduse_queue_get_head(VduseVirtq *vq, unsigned int idx,
> +                                 unsigned int *head)
> +{
> +    /*
> +     * Grab the next descriptor number they're advertising, and increment
> +     * the index we've seen.
> +     */
> +    *head =3D vring_avail_ring(vq, idx % vq->vring.num);
> +
> +    /* If their number is silly, that's a fatal mistake. */
> +    if (*head >=3D vq->vring.num) {
> +        fprintf(stderr, "Guest says index %u is available\n", *head);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static int
> +vduse_queue_read_indirect_desc(VduseDev *dev, struct vring_desc *desc,
> +                               uint64_t addr, size_t len)
> +{
> +    struct vring_desc *ori_desc;
> +    uint64_t read_len;
> +
> +    if (len > (VIRTQUEUE_MAX_SIZE * sizeof(struct vring_desc))) {
> +        return -1;
> +    }
> +
> +    if (len =3D=3D 0) {
> +        return -1;
> +    }
> +
> +    while (len) {
> +        read_len =3D len;
> +        ori_desc =3D iova_to_va(dev, &read_len, addr);
> +        if (!ori_desc) {
> +            return -1;
> +        }
> +
> +        memcpy(desc, ori_desc, read_len);
> +        len -=3D read_len;
> +        addr +=3D read_len;
> +        desc +=3D read_len;
> +    }
> +
> +    return 0;
> +}
> +
> +enum {
> +    VIRTQUEUE_READ_DESC_ERROR =3D -1,
> +    VIRTQUEUE_READ_DESC_DONE =3D 0,   /* end of chain */
> +    VIRTQUEUE_READ_DESC_MORE =3D 1,   /* more buffers in chain */
> +};
> +
> +static int vduse_queue_read_next_desc(struct vring_desc *desc, int i,
> +                                      unsigned int max, unsigned int *ne=
xt)
> +{
> +    /* If this descriptor says it doesn't chain, we're done. */
> +    if (!(le16toh(desc[i].flags) & VRING_DESC_F_NEXT)) {
> +        return VIRTQUEUE_READ_DESC_DONE;
> +    }
> +
> +    /* Check they're not leading us off end of descriptors. */
> +    *next =3D desc[i].next;
> +    /* Make sure compiler knows to grab that: we don't want it changing!=
 */
> +    smp_wmb();
> +
> +    if (*next >=3D max) {
> +        fprintf(stderr, "Desc next is %u\n", *next);
> +        return VIRTQUEUE_READ_DESC_ERROR;
> +    }
> +
> +    return VIRTQUEUE_READ_DESC_MORE;
> +}
> +
> +/*
> + * Fetch avail_idx from VQ memory only when we really need to know if
> + * guest has added some buffers.
> + */
> +static bool vduse_queue_empty(VduseVirtq *vq)
> +{
> +    if (unlikely(!vq->vring.avail)) {
> +        return true;
> +    }
> +
> +    if (vq->shadow_avail_idx !=3D vq->last_avail_idx) {
> +        return false;
> +    }
> +
> +    return vring_avail_idx(vq) =3D=3D vq->last_avail_idx;
> +}
> +
> +static bool vduse_queue_should_notify(VduseVirtq *vq)
> +{
> +    VduseDev *dev =3D vq->dev;
> +    uint16_t old, new;
> +    bool v;
> +
> +    /* We need to expose used array entries before checking used event. =
*/
> +    smp_mb();
> +
> +    /* Always notify when queue is empty (when feature acknowledge) */
> +    if (vduse_dev_has_feature(dev, VIRTIO_F_NOTIFY_ON_EMPTY) &&
> +        !vq->inuse && vduse_queue_empty(vq)) {
> +        return true;
> +    }
> +
> +    if (!vduse_dev_has_feature(dev, VIRTIO_RING_F_EVENT_IDX)) {
> +        return !(vring_avail_flags(vq) & VRING_AVAIL_F_NO_INTERRUPT);
> +    }
> +
> +    v =3D vq->signalled_used_valid;
> +    vq->signalled_used_valid =3D true;
> +    old =3D vq->signalled_used;
> +    new =3D vq->signalled_used =3D vq->used_idx;
> +    return !v || vring_need_event(vring_get_used_event(vq), new, old);
> +}
> +
> +void vduse_queue_notify(VduseVirtq *vq)
> +{
> +    VduseDev *dev =3D vq->dev;
> +
> +    if (unlikely(!vq->vring.avail)) {
> +        return;
> +    }
> +
> +    if (!vduse_queue_should_notify(vq)) {
> +        return;
> +    }
> +
> +    if (vduse_inject_irq(dev, vq->index) < 0) {
> +        fprintf(stderr, "Error inject irq for vq %d: %s\n",
> +                vq->index, strerror(errno));
> +    }
> +}
> +
> +static inline void vring_set_avail_event(VduseVirtq *vq, uint16_t val)
> +{
> +    *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) =3D htole16(val);
> +}
> +
> +static bool vduse_queue_map_single_desc(VduseVirtq *vq, unsigned int *p_=
num_sg,
> +                                   struct iovec *iov, unsigned int max_n=
um_sg,
> +                                   bool is_write, uint64_t pa, size_t sz)
> +{
> +    unsigned num_sg =3D *p_num_sg;
> +    VduseDev *dev =3D vq->dev;
> +
> +    assert(num_sg <=3D max_num_sg);
> +
> +    if (!sz) {
> +        fprintf(stderr, "virtio: zero sized buffers are not allowed\n");
> +        return false;
> +    }
> +
> +    while (sz) {
> +        uint64_t len =3D sz;
> +
> +        if (num_sg =3D=3D max_num_sg) {
> +            fprintf(stderr,
> +                    "virtio: too many descriptors in indirect table\n");
> +            return false;
> +        }
> +
> +        iov[num_sg].iov_base =3D iova_to_va(dev, &len, pa);
> +        if (iov[num_sg].iov_base =3D=3D NULL) {
> +            fprintf(stderr, "virtio: invalid address for buffers\n");
> +            return false;
> +        }
> +        iov[num_sg++].iov_len =3D len;
> +        sz -=3D len;
> +        pa +=3D len;
> +    }
> +
> +    *p_num_sg =3D num_sg;
> +    return true;
> +}
> +
> +static void *vduse_queue_alloc_element(size_t sz, unsigned out_num,
> +                                       unsigned in_num)
> +{
> +    VduseVirtqElement *elem;
> +    size_t in_sg_ofs =3D ALIGN_UP(sz, __alignof__(elem->in_sg[0]));
> +    size_t out_sg_ofs =3D in_sg_ofs + in_num * sizeof(elem->in_sg[0]);
> +    size_t out_sg_end =3D out_sg_ofs + out_num * sizeof(elem->out_sg[0]);
> +
> +    assert(sz >=3D sizeof(VduseVirtqElement));
> +    elem =3D malloc(out_sg_end);
> +    if (!elem) {
> +        return NULL;
> +    }
> +    elem->out_num =3D out_num;
> +    elem->in_num =3D in_num;
> +    elem->in_sg =3D (void *)elem + in_sg_ofs;
> +    elem->out_sg =3D (void *)elem + out_sg_ofs;
> +    return elem;
> +}
> +
> +static void *vduse_queue_map_desc(VduseVirtq *vq, unsigned int idx, size=
_t sz)
> +{
> +    struct vring_desc *desc =3D vq->vring.desc;
> +    VduseDev *dev =3D vq->dev;
> +    uint64_t desc_addr, read_len;
> +    unsigned int desc_len;
> +    unsigned int max =3D vq->vring.num;
> +    unsigned int i =3D idx;
> +    VduseVirtqElement *elem;
> +    struct iovec iov[VIRTQUEUE_MAX_SIZE];
> +    struct vring_desc desc_buf[VIRTQUEUE_MAX_SIZE];
> +    unsigned int out_num =3D 0, in_num =3D 0;
> +    int rc;
> +
> +    if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
> +        if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
> +            fprintf(stderr, "Invalid size for indirect buffer table\n");
> +            return NULL;
> +        }
> +
> +        /* loop over the indirect descriptor table */
> +        desc_addr =3D le64toh(desc[i].addr);
> +        desc_len =3D le32toh(desc[i].len);
> +        max =3D desc_len / sizeof(struct vring_desc);
> +        read_len =3D desc_len;
> +        desc =3D iova_to_va(dev, &read_len, desc_addr);
> +        if (unlikely(desc && read_len !=3D desc_len)) {
> +            /* Failed to use zero copy */
> +            desc =3D NULL;
> +            if (!vduse_queue_read_indirect_desc(dev, desc_buf,
> +                                                desc_addr,
> +                                                desc_len)) {
> +                desc =3D desc_buf;
> +            }
> +        }
> +        if (!desc) {
> +            fprintf(stderr, "Invalid indirect buffer table\n");
> +            return NULL;
> +        }
> +        i =3D 0;
> +    }
> +
> +    /* Collect all the descriptors */
> +    do {
> +        if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
> +            if (!vduse_queue_map_single_desc(vq, &in_num, iov + out_num,
> +                                             VIRTQUEUE_MAX_SIZE - out_nu=
m,
> +                                             true, le64toh(desc[i].addr),
> +                                             le32toh(desc[i].len))) {
> +                return NULL;
> +            }
> +        } else {
> +            if (in_num) {
> +                fprintf(stderr, "Incorrect order for descriptors\n");
> +                return NULL;
> +            }
> +            if (!vduse_queue_map_single_desc(vq, &out_num, iov,
> +                                             VIRTQUEUE_MAX_SIZE, false,
> +                                             le64toh(desc[i].addr),
> +                                             le32toh(desc[i].len))) {
> +                return NULL;
> +            }
> +        }
> +
> +        /* If we've got too many, that implies a descriptor loop. */
> +        if ((in_num + out_num) > max) {
> +            fprintf(stderr, "Looped descriptor\n");
> +            return NULL;
> +        }
> +        rc =3D vduse_queue_read_next_desc(desc, i, max, &i);
> +    } while (rc =3D=3D VIRTQUEUE_READ_DESC_MORE);
> +
> +    if (rc =3D=3D VIRTQUEUE_READ_DESC_ERROR) {
> +        fprintf(stderr, "read descriptor error\n");
> +        return NULL;
> +    }
> +
> +    /* Now copy what we have collected and mapped */
> +    elem =3D vduse_queue_alloc_element(sz, out_num, in_num);
> +    if (!elem) {
> +        fprintf(stderr, "read descriptor error\n");
> +        return NULL;
> +    }
> +    elem->index =3D idx;
> +    for (i =3D 0; i < out_num; i++) {
> +        elem->out_sg[i] =3D iov[i];
> +    }
> +    for (i =3D 0; i < in_num; i++) {
> +        elem->in_sg[i] =3D iov[out_num + i];
> +    }
> +
> +    return elem;
> +}
> +
> +void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
> +{
> +    unsigned int head;
> +    VduseVirtqElement *elem;
> +    VduseDev *dev =3D vq->dev;
> +
> +    if (unlikely(!vq->vring.avail)) {
> +        return NULL;
> +    }
> +
> +    if (vduse_queue_empty(vq)) {
> +        return NULL;
> +    }
> +    /* Needed after virtio_queue_empty() */
> +    smp_rmb();
> +
> +    if (vq->inuse >=3D vq->vring.num) {
> +        fprintf(stderr, "Virtqueue size exceeded: %d\n", vq->inuse);
> +        return NULL;
> +    }
> +
> +    if (!vduse_queue_get_head(vq, vq->last_avail_idx++, &head)) {
> +        return NULL;
> +    }
> +
> +    if (vduse_dev_has_feature(dev, VIRTIO_RING_F_EVENT_IDX)) {
> +        vring_set_avail_event(vq, vq->last_avail_idx);
> +    }
> +
> +    elem =3D vduse_queue_map_desc(vq, head, sz);
> +
> +    if (!elem) {
> +        return NULL;
> +    }
> +
> +    vq->inuse++;
> +
> +    return elem;
> +}
> +
> +static inline void vring_used_write(VduseVirtq *vq,
> +                                    struct vring_used_elem *uelem, int i)
> +{
> +    struct vring_used *used =3D vq->vring.used;
> +
> +    used->ring[i] =3D *uelem;
> +}
> +
> +static void vduse_queue_fill(VduseVirtq *vq, const VduseVirtqElement *el=
em,
> +                             unsigned int len, unsigned int idx)
> +{
> +    struct vring_used_elem uelem;
> +
> +    if (unlikely(!vq->vring.used)) {
> +        return;
> +    }
> +
> +    idx =3D (idx + vq->used_idx) % vq->vring.num;
> +
> +    uelem.id =3D htole32(elem->index);
> +    uelem.len =3D htole32(len);
> +    vring_used_write(vq, &uelem, idx);
> +}
> +
> +static inline void vring_used_idx_set(VduseVirtq *vq, uint16_t val)
> +{
> +    vq->vring.used->idx =3D htole16(val);
> +    vq->used_idx =3D val;
> +}
> +
> +static void vduse_queue_flush(VduseVirtq *vq, unsigned int count)
> +{
> +    uint16_t old, new;
> +
> +    if (unlikely(!vq->vring.used)) {
> +        return;
> +    }
> +
> +    /* Make sure buffer is written before we update index. */
> +    smp_wmb();
> +
> +    old =3D vq->used_idx;
> +    new =3D old + count;
> +    vring_used_idx_set(vq, new);
> +    vq->inuse -=3D count;
> +    if (unlikely((int16_t)(new - vq->signalled_used) < (uint16_t)(new - =
old))) {
> +        vq->signalled_used_valid =3D false;
> +    }
> +}
> +
> +void vduse_queue_push(VduseVirtq *vq, const VduseVirtqElement *elem,
> +                      unsigned int len)
> +{
> +    vduse_queue_fill(vq, elem, len, 0);
> +    vduse_queue_flush(vq, 1);
> +}
> +
> +static int vduse_queue_update_vring(VduseVirtq *vq, uint64_t desc_addr,
> +                                    uint64_t avail_addr, uint64_t used_a=
ddr)
> +{
> +    struct VduseDev *dev =3D vq->dev;
> +    uint64_t len;
> +
> +    len =3D sizeof(struct vring_desc);
> +    vq->vring.desc =3D iova_to_va(dev, &len, desc_addr);
> +    if (len !=3D sizeof(struct vring_desc)) {
> +        return -EINVAL;
> +    }
> +
> +    len =3D sizeof(struct vring_avail);
> +    vq->vring.avail =3D iova_to_va(dev, &len, avail_addr);
> +    if (len !=3D sizeof(struct vring_avail)) {
> +        return -EINVAL;
> +    }
> +
> +    len =3D sizeof(struct vring_used);
> +    vq->vring.used =3D iova_to_va(dev, &len, used_addr);
> +    if (len !=3D sizeof(struct vring_used)) {
> +        return -EINVAL;
> +    }
> +
> +    if (!vq->vring.desc || !vq->vring.avail || !vq->vring.used) {
> +        fprintf(stderr, "Failed to get vq[%d] iova mapping\n", vq->index=
);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static void vduse_queue_enable(VduseVirtq *vq)
> +{
> +    struct VduseDev *dev =3D vq->dev;
> +    struct vduse_vq_info vq_info;
> +    struct vduse_vq_eventfd vq_eventfd;
> +    int fd;
> +
> +    vq_info.index =3D vq->index;
> +    if (ioctl(dev->fd, VDUSE_VQ_GET_INFO, &vq_info)) {
> +        fprintf(stderr, "Failed to get vq[%d] info: %s\n",
> +                vq->index, strerror(errno));
> +        return;
> +    }
> +
> +    if (!vq_info.ready) {
> +        return;
> +    }
> +
> +    vq->vring.num =3D vq_info.num;
> +    vq->vring.desc_addr =3D vq_info.desc_addr;
> +    vq->vring.avail_addr =3D vq_info.driver_addr;
> +    vq->vring.used_addr =3D vq_info.device_addr;
> +
> +    if (vduse_queue_update_vring(vq, vq_info.desc_addr,
> +                                 vq_info.driver_addr, vq_info.device_add=
r)) {
> +        fprintf(stderr, "Failed to update vring for vq[%d]\n", vq->index=
);
> +        return;
> +    }
> +
> +    fd =3D eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC);
> +    if (fd < 0) {
> +        fprintf(stderr, "Failed to init eventfd for vq[%d]\n", vq->index=
);
> +        return;
> +    }
> +
> +    vq_eventfd.index =3D vq->index;
> +    vq_eventfd.fd =3D fd;
> +    if (ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &vq_eventfd)) {
> +        fprintf(stderr, "Failed to setup kick fd for vq[%d]\n", vq->inde=
x);
> +        close(fd);
> +        return;
> +    }
> +
> +    vq->fd =3D fd;
> +    vq->shadow_avail_idx =3D vq->last_avail_idx =3D vq_info.split.avail_=
index;
> +    vq->inuse =3D 0;
> +    vq->used_idx =3D 0;
> +    vq->signalled_used_valid =3D false;
> +    vq->ready =3D true;
> +
> +    dev->ops->enable_queue(dev, vq);
> +}
> +
> +static void vduse_queue_disable(VduseVirtq *vq)
> +{
> +    struct VduseDev *dev =3D vq->dev;
> +    struct vduse_vq_eventfd eventfd;
> +
> +    if (!vq->ready) {
> +        return;
> +    }
> +
> +    dev->ops->disable_queue(dev, vq);
> +
> +    eventfd.index =3D vq->index;
> +    eventfd.fd =3D VDUSE_EVENTFD_DEASSIGN;
> +    ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd);
> +    close(vq->fd);
> +
> +    assert(vq->inuse =3D=3D 0);
> +
> +    vq->vring.num =3D 0;
> +    vq->vring.desc_addr =3D 0;
> +    vq->vring.avail_addr =3D 0;
> +    vq->vring.used_addr =3D 0;
> +    vq->vring.desc =3D 0;
> +    vq->vring.avail =3D 0;
> +    vq->vring.used =3D 0;
> +    vq->ready =3D false;
> +    vq->fd =3D -1;
> +}
> +
> +static void vduse_dev_start_dataplane(VduseDev *dev)
> +{
> +    int i;
> +
> +    if (ioctl(dev->fd, VDUSE_DEV_GET_FEATURES, &dev->features)) {
> +        fprintf(stderr, "Failed to get features: %s\n", strerror(errno));
> +        return;
> +    }
> +    assert(vduse_dev_has_feature(dev, VIRTIO_F_VERSION_1));
> +
> +    for (i =3D 0; i < dev->num_queues; i++) {
> +        vduse_queue_enable(&dev->vqs[i]);
> +    }
> +}
> +
> +static void vduse_dev_stop_dataplane(VduseDev *dev)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < dev->num_queues; i++) {
> +        vduse_queue_disable(&dev->vqs[i]);
> +    }
> +    dev->features =3D 0;
> +    vduse_iova_remove_region(dev, 0, ULONG_MAX);
> +}
> +
> +int vduse_dev_handler(VduseDev *dev)
> +{
> +    struct vduse_dev_request req;
> +    struct vduse_dev_response resp =3D { 0 };
> +    VduseVirtq *vq;
> +    int i, ret;
> +
> +    ret =3D read(dev->fd, &req, sizeof(req));
> +    if (ret !=3D sizeof(req)) {
> +        fprintf(stderr, "Read request error [%d]: %s\n",
> +                ret, strerror(errno));
> +        return -errno;
> +    }
> +    resp.request_id =3D req.request_id;
> +
> +    switch (req.type) {
> +    case VDUSE_GET_VQ_STATE:
> +        vq =3D &dev->vqs[req.vq_state.index];
> +        resp.vq_state.split.avail_index =3D vq->last_avail_idx;
> +        resp.result =3D VDUSE_REQ_RESULT_OK;
> +        break;
> +    case VDUSE_SET_STATUS:
> +        if (req.s.status & VIRTIO_CONFIG_S_DRIVER_OK) {
> +            vduse_dev_start_dataplane(dev);
> +        } else if (req.s.status =3D=3D 0) {
> +            vduse_dev_stop_dataplane(dev);
> +        }
> +        resp.result =3D VDUSE_REQ_RESULT_OK;
> +        break;
> +    case VDUSE_UPDATE_IOTLB:
> +        /* The iova will be updated by iova_to_va() later, so just remov=
e it */
> +        vduse_iova_remove_region(dev, req.iova.start, req.iova.last);
> +        for (i =3D 0; i < dev->num_queues; i++) {
> +            VduseVirtq *vq =3D &dev->vqs[i];
> +            if (vq->ready) {
> +                if (vduse_queue_update_vring(vq, vq->vring.desc_addr,
> +                                             vq->vring.avail_addr,
> +                                             vq->vring.used_addr)) {
> +                    fprintf(stderr, "Failed to update vring for vq[%d]\n=
",
> +                            vq->index);
> +                }
> +            }
> +        }
> +        resp.result =3D VDUSE_REQ_RESULT_OK;
> +        break;
> +    default:
> +        resp.result =3D VDUSE_REQ_RESULT_FAILED;
> +        break;
> +    }
> +
> +    ret =3D write(dev->fd, &resp, sizeof(resp));
> +    if (ret !=3D sizeof(resp)) {
> +        fprintf(stderr, "Write request %d error [%d]: %s\n",
> +                req.type, ret, strerror(errno));
> +        return -errno;
> +    }
> +    return 0;
> +}
> +
> +int vduse_dev_update_config(VduseDev *dev, uint32_t size,
> +                            uint32_t offset, char *buffer)
> +{
> +    int ret;
> +    struct vduse_config_data *data;
> +
> +    data =3D malloc(offsetof(struct vduse_config_data, buffer) + size);
> +    if (!data) {
> +        return -ENOMEM;
> +    }
> +
> +    data->offset =3D offset;
> +    data->length =3D size;
> +    memcpy(data->buffer, buffer, size);
> +
> +    ret =3D ioctl(dev->fd, VDUSE_DEV_SET_CONFIG, data);
> +    free(data);
> +
> +    if (ret) {
> +        return -errno;
> +    }
> +
> +    if (ioctl(dev->fd, VDUSE_DEV_INJECT_CONFIG_IRQ)) {
> +        return -errno;
> +    }
> +
> +    return 0;
> +}
> +
> +int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size)
> +{
> +    VduseVirtq *vq =3D &dev->vqs[index];
> +    struct vduse_vq_config vq_config =3D { 0 };
> +
> +    if (max_size > VIRTQUEUE_MAX_SIZE) {
> +        return -EINVAL;
> +    }
> +
> +    vq_config.index =3D vq->index;
> +    vq_config.max_size =3D max_size;
> +
> +    if (ioctl(dev->fd, VDUSE_VQ_SETUP, &vq_config)) {
> +        return -errno;
> +    }
> +
> +    return 0;
> +}
> +
> +static int vduse_dev_init_vqs(VduseDev *dev, uint16_t num_queues)
> +{
> +    VduseVirtq *vqs;
> +    int i;
> +
> +    vqs =3D calloc(sizeof(VduseVirtq), num_queues);
> +    if (!vqs) {
> +        return -ENOMEM;
> +    }
> +
> +    for (i =3D 0; i < num_queues; i++) {
> +        vqs[i].index =3D i;
> +        vqs[i].dev =3D dev;
> +        vqs[i].fd =3D -1;
> +    }
> +    dev->vqs =3D vqs;
> +
> +    return 0;
> +}
> +
> +static int vduse_dev_init(VduseDev *dev, const char *name,
> +                          uint16_t num_queues, const VduseOps *ops,
> +                          void *priv)
> +{
> +    char *dev_path, *dev_name;
> +    int ret, fd;
> +
> +    dev_path =3D malloc(strlen(name) + strlen("/dev/vduse/") + 1);
> +    if (!dev_path) {
> +        return -ENOMEM;
> +    }
> +    sprintf(dev_path, "/dev/vduse/%s", name);
> +
> +    fd =3D open(dev_path, O_RDWR);
> +    free(dev_path);
> +    if (fd < 0) {
> +        fprintf(stderr, "Failed to open vduse dev %s: %s\n",
> +                name, strerror(errno));
> +        return -errno;
> +    }
> +
> +    dev_name =3D strdup(name);
> +    if (!dev_name) {
> +        close(fd);
> +        return -ENOMEM;
> +    }
> +
> +    ret =3D vduse_dev_init_vqs(dev, num_queues);
> +    if (ret) {
> +        free(dev_name);
> +        close(fd);
> +        return ret;
> +    }
> +
> +    dev->name =3D dev_name;
> +    dev->num_queues =3D num_queues;
> +    dev->fd =3D fd;
> +    dev->ops =3D ops;
> +    dev->priv =3D priv;
> +
> +    return 0;
> +}
> +
> +static inline bool vduse_name_is_valid(const char *name)
> +{
> +    return strlen(name) >=3D VDUSE_NAME_MAX || strstr(name, "..");
> +}
> +
> +VduseDev *vduse_dev_create_by_fd(int fd, uint16_t num_queues,
> +                                 const VduseOps *ops, void *priv)
> +{
> +    VduseDev *dev;
> +    int ret;
> +
> +    if (!ops || !ops->enable_queue || !ops->disable_queue) {
> +        fprintf(stderr, "Invalid parameter for vduse\n");
> +        return NULL;
> +    }
> +
> +    dev =3D calloc(sizeof(VduseDev), 1);
> +    if (!dev) {
> +        fprintf(stderr, "Failed to allocate vduse device\n");
> +        return NULL;
> +    }
> +
> +    ret =3D vduse_dev_init_vqs(dev, num_queues);
> +    if (ret) {
> +        fprintf(stderr, "Failed to init vqs\n");
> +        free(dev);
> +        return NULL;
> +    }
> +
> +    dev->num_queues =3D num_queues;
> +    dev->fd =3D fd;
> +    dev->ops =3D ops;
> +    dev->priv =3D priv;
> +
> +    return dev;
> +}
> +
> +VduseDev *vduse_dev_create_by_name(const char *name, uint16_t num_queues,
> +                                   const VduseOps *ops, void *priv)
> +{
> +    VduseDev *dev;
> +    int ret;
> +
> +    if (!name || vduse_name_is_valid(name) || !ops ||
> +        !ops->enable_queue || !ops->disable_queue) {
> +        fprintf(stderr, "Invalid parameter for vduse\n");
> +        return NULL;
> +    }
> +
> +    dev =3D calloc(sizeof(VduseDev), 1);
> +    if (!dev) {
> +        fprintf(stderr, "Failed to allocate vduse device\n");
> +        return NULL;
> +    }
> +
> +    ret =3D vduse_dev_init(dev, name, num_queues, ops, priv);
> +    if (ret < 0) {
> +        fprintf(stderr, "Failed to init vduse device %s: %s\n",
> +                name, strerror(ret));

Must be strerror(-ret).  Spotted by Coverity, tracked as CID 1490226.

> +        free(dev);
> +        return NULL;
> +    }
> +
> +    return dev;
> +}
> +
> +VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> +                           uint32_t vendor_id, uint64_t features,
> +                           uint16_t num_queues, uint32_t config_size,
> +                           char *config, const VduseOps *ops, void *priv)
> +{
> +    VduseDev *dev;
> +    int ret, ctrl_fd;
> +    uint64_t version;
> +    struct vduse_dev_config *dev_config;
> +    size_t size =3D offsetof(struct vduse_dev_config, config);
> +
> +    if (!name || vduse_name_is_valid(name) ||
> +        !has_feature(features,  VIRTIO_F_VERSION_1) || !config ||
> +        !config_size || !ops || !ops->enable_queue || !ops->disable_queu=
e) {
> +        fprintf(stderr, "Invalid parameter for vduse\n");
> +        return NULL;
> +    }
> +
> +    dev =3D calloc(sizeof(VduseDev), 1);
> +    if (!dev) {
> +        fprintf(stderr, "Failed to allocate vduse device\n");
> +        return NULL;
> +    }
> +
> +    ctrl_fd =3D open("/dev/vduse/control", O_RDWR);
> +    if (ctrl_fd < 0) {
> +        fprintf(stderr, "Failed to open /dev/vduse/control: %s\n",
> +                strerror(errno));
> +        goto err_ctrl;
> +    }
> +
> +    version =3D VDUSE_API_VERSION;
> +    if (ioctl(ctrl_fd, VDUSE_SET_API_VERSION, &version)) {
> +        fprintf(stderr, "Failed to set api version %" PRIu64 ": %s\n",
> +                version, strerror(errno));
> +        goto err_dev;
> +    }
> +
> +    dev_config =3D calloc(size + config_size, 1);
> +    if (!dev_config) {
> +        fprintf(stderr, "Failed to allocate config space\n");
> +        goto err_dev;
> +    }
> +
> +    strcpy(dev_config->name, name);

What ensures @name fits into dev->config->name?

Coverity CID 1490224.

> +    dev_config->device_id =3D device_id;
> +    dev_config->vendor_id =3D vendor_id;
> +    dev_config->features =3D features;
> +    dev_config->vq_num =3D num_queues;
> +    dev_config->vq_align =3D VDUSE_VQ_ALIGN;
> +    dev_config->config_size =3D config_size;
> +    memcpy(dev_config->config, config, config_size);
> +
> +    ret =3D ioctl(ctrl_fd, VDUSE_CREATE_DEV, dev_config);
> +    free(dev_config);
> +    if (ret < 0) {
> +        fprintf(stderr, "Failed to create vduse device %s: %s\n",
> +                name, strerror(errno));
> +        goto err_dev;
> +    }
> +    dev->ctrl_fd =3D ctrl_fd;
> +
> +    ret =3D vduse_dev_init(dev, name, num_queues, ops, priv);
> +    if (ret < 0) {
> +        fprintf(stderr, "Failed to init vduse device %s: %s\n",
> +                name, strerror(ret));

Must be strerror(-ret).  Spotted by Coverity, tracked as CID 1490223.

> +        goto err;
> +    }
> +
> +    return dev;
> +err:
> +    ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name);
> +err_dev:
> +    close(ctrl_fd);
> +err_ctrl:
> +    free(dev);
> +
> +    return NULL;
> +}
> +
> +int vduse_dev_destroy(VduseDev *dev)
> +{
> +    int ret =3D 0;
> +
> +    free(dev->vqs);
> +    if (dev->fd >=3D 0) {
> +        close(dev->fd);
> +        dev->fd =3D -1;
> +    }
> +    if (dev->ctrl_fd >=3D 0) {
> +        if (ioctl(dev->ctrl_fd, VDUSE_DESTROY_DEV, dev->name)) {
> +            ret =3D -errno;
> +        }
> +        close(dev->ctrl_fd);
> +        dev->ctrl_fd =3D -1;
> +    }
> +    free(dev->name);
> +    free(dev);
> +
> +    return ret;
> +}

[...]


