Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248646B7FF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:51:21 +0100 (CET)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muX84-0002zS-AE
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:51:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1muX5k-0000bc-4L
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 04:48:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1muX5g-0006IF-Bb
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 04:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638870531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7GAlrN7VXXETc9qtGGCyCZNAw98uPhOK3+6hzQzsvng=;
 b=Xkj5THqmqXnP6YfArArV0D5d2Vw4UxJoGArN5OCUH+xuNK4s50T8EZdgpA3NxZU2diXLFl
 tAt2cfVPuRGtAlQAfibeA7RIGAg0cwpcvGogAg+6cKtHMO0R0+ahzpA31m2EpYEGgYWEsh
 IEKFKa+GSGVzB4GiSA8j48UXQYk2bg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-JlMdFcOWMWC51hWwOK2SRQ-1; Tue, 07 Dec 2021 04:48:49 -0500
X-MC-Unique: JlMdFcOWMWC51hWwOK2SRQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0472835E26;
 Tue,  7 Dec 2021 09:48:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14AF61346F;
 Tue,  7 Dec 2021 09:48:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 979B2113865F; Tue,  7 Dec 2021 10:48:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v10 7/8] qmp: add QMP command x-query-virtio-queue-element
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
 <1638794606-19631-8-git-send-email-jonah.palmer@oracle.com>
Date: Tue, 07 Dec 2021 10:48:03 +0100
In-Reply-To: <1638794606-19631-8-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Mon, 6 Dec 2021 07:43:25 -0500")
Message-ID: <87lf0wd9v0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonah Palmer <jonah.palmer@oracle.com> writes:

> From: Laurent Vivier <lvivier@redhat.com>
>
> This new command shows the information of a VirtQueue element.
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---
>  hw/virtio/virtio-stub.c |   9 +++
>  hw/virtio/virtio.c      | 154 ++++++++++++++++++++++++++++++++++++++++
>  qapi/virtio.json        | 183 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 346 insertions(+)
>
> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
> index 13e5f93..7ddb22c 100644
> --- a/hw/virtio/virtio-stub.c
> +++ b/hw/virtio/virtio-stub.c
> @@ -31,3 +31,12 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
>  {
>      return qmp_virtio_unsupported(errp);
>  }
> +
> +VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
> +                                                     uint16_t queue,
> +                                                     bool has_index,
> +                                                     uint16_t index,
> +                                                     Error **errp)
> +{
> +    return qmp_virtio_unsupported(errp);
> +}
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 459bfb2..8c6cc27 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -475,6 +475,19 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
>      address_space_cache_invalidate(&caches->used, pa, sizeof(VRingUsedElem));
>  }
>  
> +/* Called within rcu_read_lock(). */
> +static inline uint16_t vring_used_flags(VirtQueue *vq)
> +{
> +    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
> +    hwaddr pa = offsetof(VRingUsed, flags);
> +
> +    if (!caches) {
> +        return 0;
> +    }
> +
> +    return virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
> +}
> +
>  /* Called within rcu_read_lock().  */
>  static uint16_t vring_used_idx(VirtQueue *vq)
>  {
> @@ -4381,6 +4394,147 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
>      return status;
>  }
>  
> +static strList *qmp_decode_vring_desc_flags(uint16_t flags)
> +{
> +    strList *list = NULL;
> +    strList *node;
> +    int i;
> +
> +    struct {
> +        uint16_t flag;
> +        const char *value;
> +    } map[] = {
> +        { VRING_DESC_F_NEXT, "next" },
> +        { VRING_DESC_F_WRITE, "write" },
> +        { VRING_DESC_F_INDIRECT, "indirect" },
> +        { 1 << VRING_PACKED_DESC_F_AVAIL, "avail" },
> +        { 1 << VRING_PACKED_DESC_F_USED, "used" },
> +        { 0, "" }
> +    };
> +
> +    for (i = 0; map[i].flag; i++) {
> +        if ((map[i].flag & flags) == 0) {
> +            continue;
> +        }
> +        node = g_malloc0(sizeof(strList));
> +        node->value = g_strdup(map[i].value);
> +        node->next = list;
> +        list = node;
> +    }
> +
> +    return list;
> +}
> +
> +VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
> +                                                     uint16_t queue,
> +                                                     bool has_index,
> +                                                     uint16_t index,
> +                                                     Error **errp)
> +{
> +    VirtIODevice *vdev;
> +    VirtQueue *vq;
> +    VirtioQueueElement *element = NULL;
> +
> +    vdev = virtio_device_find(path);
> +    if (vdev == NULL) {
> +        error_setg(errp, "Path %s is not a VirtIO device", path);
> +        return NULL;
> +    }
> +
> +    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
> +        error_setg(errp, "Invalid virtqueue number %d", queue);
> +        return NULL;
> +    }
> +    vq = &vdev->vq[queue];
> +
> +    if (virtio_vdev_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
> +        error_setg(errp, "Packed ring not supported");
> +        return NULL;
> +    } else {
> +        unsigned int head, i, max;
> +        VRingMemoryRegionCaches *caches;
> +        MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
> +        MemoryRegionCache *desc_cache;
> +        VRingDesc desc;
> +        VirtioRingDescList *list = NULL;
> +        VirtioRingDescList *node;
> +        int rc; int ndescs;
> +
> +        RCU_READ_LOCK_GUARD();
> +
> +        max = vq->vring.num;
> +
> +        if (!has_index) {
> +            head = vring_avail_ring(vq, vq->last_avail_idx % vq->vring.num);
> +        } else {
> +            head = vring_avail_ring(vq, index % vq->vring.num);
> +        }
> +        i = head;
> +
> +        caches = vring_get_region_caches(vq);
> +        if (!caches) {
> +            error_setg(errp, "Region caches not initialized");
> +            return NULL;
> +        }
> +        if (caches->desc.len < max * sizeof(VRingDesc)) {
> +            error_setg(errp, "Cannot map descriptor ring");
> +            return NULL;
> +        }
> +
> +        desc_cache = &caches->desc;
> +        vring_split_desc_read(vdev, &desc, desc_cache, i);
> +        if (desc.flags & VRING_DESC_F_INDIRECT) {
> +            int64_t len;
> +            len = address_space_cache_init(&indirect_desc_cache, vdev->dma_as,
> +                                           desc.addr, desc.len, false);
> +            desc_cache = &indirect_desc_cache;
> +            if (len < desc.len) {
> +                error_setg(errp, "Cannot map indirect buffer");
> +                goto done;
> +            }
> +
> +            max = desc.len / sizeof(VRingDesc);
> +            i = 0;
> +            vring_split_desc_read(vdev, &desc, desc_cache, i);
> +        }
> +
> +        element = g_new0(VirtioQueueElement, 1);
> +        element->avail = g_new0(VirtioRingAvail, 1);
> +        element->used = g_new0(VirtioRingUsed, 1);
> +        element->name = g_strdup(vdev->name);
> +        element->index = head;
> +        element->avail->flags = vring_avail_flags(vq);
> +        element->avail->idx = vring_avail_idx(vq);
> +        element->avail->ring = head;
> +        element->used->flags = vring_used_flags(vq);
> +        element->used->idx = vring_used_idx(vq);
> +        ndescs = 0;
> +
> +        do {
> +            /* A buggy driver may produce an infinite loop */
> +            if (ndescs >= max) {
> +                break;
> +            }
> +            node = g_new0(VirtioRingDescList, 1);
> +            node->value = g_new0(VirtioRingDesc, 1);
> +            node->value->addr = desc.addr;
> +            node->value->len = desc.len;
> +            node->value->flags = qmp_decode_vring_desc_flags(desc.flags);
> +            node->next = list;
> +            list = node;
> +
> +            ndescs++;
> +            rc = virtqueue_split_read_next_desc(vdev, &desc, desc_cache,
> +                                                max, &i);
> +        } while (rc == VIRTQUEUE_READ_DESC_MORE);
> +        element->descs = list;
> +done:
> +        address_space_cache_destroy(&indirect_desc_cache);
> +    }
> +
> +    return element;
> +}
> +
>  static const TypeInfo virtio_device_info = {
>      .name = TYPE_VIRTIO_DEVICE,
>      .parent = TYPE_DEVICE,
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 56e56d2..2984e48 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -654,3 +654,186 @@
>    'data': { 'path': 'str', 'queue': 'uint16' },
>    'returns': 'VirtVhostQueueStatus',
>    'features': [ 'unstable' ] }
> +
> +##
> +# @VirtioRingDesc:
> +#
> +# Information regarding the vring descriptor area
> +#
> +# @addr: Guest physical address of the descriptor area
> +#
> +# @len: Length of the descriptor area
> +#
> +# @flags: List of descriptor flags
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'VirtioRingDesc',
> +  'data': { 'addr': 'uint64',
> +            'len': 'uint32',
> +            'flags': [ 'str' ] } }
> +
> +##
> +# @VirtioRingAvail:
> +#
> +# Information regarding the avail vring (a.k.a. driver area)
> +#
> +# @flags: VRingAvail flags
> +#
> +# @idx: VRingAvail index
> +#
> +# @ring: VRingAvail ring[] entry at provided index
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'VirtioRingAvail',
> +  'data': { 'flags': 'uint16',
> +            'idx': 'uint16',
> +            'ring': 'uint16' } }
> +
> +##
> +# @VirtioRingUsed:
> +#
> +# Information regarding the used vring (a.k.a. device area)
> +#
> +# @flags: VRingUsed flags
> +#
> +# @idx: VRingUsed index
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'VirtioRingUsed',
> +  'data': { 'flags': 'uint16',
> +            'idx': 'uint16' } }
> +
> +##
> +# @VirtioQueueElement:
> +#
> +# Information regarding a VirtQueue's VirtQueueElement including
> +# descriptor, driver, and device areas
> +#
> +# @name: Name of the VirtIODevice that uses this VirtQueue
> +#
> +# @index: Index of the element in the queue
> +#
> +# @descs: List of descriptors (VirtioRingDesc)
> +#
> +# @avail: VRingAvail info
> +#
> +# @used: VRingUsed info
> +#
> +# Since: 7.0
> +#
> +##
> +
> +{ 'struct': 'VirtioQueueElement',
> +  'data': { 'name': 'str',
> +            'index': 'uint32',
> +            'descs': [ 'VirtioRingDesc' ],
> +            'avail': 'VirtioRingAvail',
> +            'used': 'VirtioRingUsed' } }
> +
> +##
> +# @x-query-virtio-queue-element:
> +#
> +# Return the information about a VirtQueue's VirtQueueElement. By
> +# default it looks at the head of the queue (if no index is given)
> +#
> +# @path: VirtIODevice canonical QOM path
> +#
> +# @queue: VirtQueue index to examine
> +#
> +# @index: Index of the element in the queue

Suggest "(default: head of the queue)", and drop "By default it
looks..." above.

> +#
> +# Features:
> +# @unstable: This command is meant for debugging

End with a period for consistency with existing docs, like you did in
v9.

> +#
> +# Returns: VirtioQueueElement information
> +#
> +# Since: 7.0
> +#
> +# Examples:
> +#
> +# 1. Introspect on virtio-net's VirtQueue 0 at index 5
> +#
> +# -> { "execute": "x-query-virtio-queue-element",
> +#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
> +#                     "queue": 0,
> +#                     "index": 5 }
> +#    }
> +# <- { "return": {
> +#            "index": 5,
> +#            "name": "virtio-net",
> +#            "descs": [
> +#               { "flags": ["write"], "len": 1536, "addr": 5257305600 }
> +#            ],
> +#            "avail": {
> +#               "idx": 256,
> +#               "flags": 0,
> +#               "ring": 5
> +#            },
> +#            "used": {
> +#               "idx": 13,
> +#               "flags": 0
> +#            },
> +#    }
> +#
> +# 2. Introspect on virtio-crypto's VirtQueue 1 at head
> +#
> +# -> { "execute": "x-query-virtio-queue-element",
> +#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
> +#                     "queue": 1 }
> +#    }
> +# <- { "return": {
> +#            "index": 0,
> +#            "name": "virtio-crypto",
> +#            "descs": [
> +#               { "flags": [], "len": 0, "addr": 8080268923184214134 }
> +#            ],
> +#            "avail": {
> +#               "idx": 280,
> +#               "flags": 0,
> +#               "ring": 0
> +#            },
> +#            "used": {
> +#               "idx": 280,
> +#               "flags": 0
> +#            }
> +#    }
> +#
> +# 3. Introspect on virtio-scsi's VirtQueue 2 at head
> +#
> +# -> { "execute": "x-query-virtio-queue-element",
> +#      "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
> +#                     "queue": 2 }
> +#    }
> +# <- { "return": {
> +#            "index": 19,
> +#            "name": "virtio-scsi",
> +#            "descs": [
> +#               { "flags": ["used", "indirect", "write"], "len": 4099327944,
> +#                 "addr": 12055409292258155293 }
> +#            ],
> +#            "avail": {
> +#               "idx": 1147,
> +#               "flags": 0,
> +#               "ring": 19
> +#            },
> +#            "used": {
> +#               "idx": 280,
> +#               "flags": 0
> +#            }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-query-virtio-queue-element',
> +  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
> +  'returns': 'VirtioQueueElement',
> +  'features': [ 'unstable' ] }

With my doc remarks addressed, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

One more thing: a brief note in the commit messages on why I made you
use 'str' instead of enums would be nice.


