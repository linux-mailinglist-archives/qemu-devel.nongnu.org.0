Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEC44AD4AA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:22:33 +0100 (CET)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMhl-0007ml-2Q
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHLh5-0003wD-54
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:17:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHLh2-0001US-Vn
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644308264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFrq/06m+LFrgFUjRTYZpJ80E1TS7u9YHnTYCB5785E=;
 b=gHDuXkO9t2+KjPozUN6UgktX/9fwAdMx3V7gEyuofC9yRGnh6zFaFelh+638/vKS3sN7un
 5lECTKBXm5zVZzNN7RI+ApsCfqABfOepJ6mylGplXC8JJ5WLLOxK/iAnICm4rRQU+bWrHt
 bTRC5f9un3uMMHKjq9O62telnrW98uY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-inJGvBm6MbKFzrZeQ1yPaA-1; Tue, 08 Feb 2022 03:17:42 -0500
X-MC-Unique: inJGvBm6MbKFzrZeQ1yPaA-1
Received: by mail-pj1-f70.google.com with SMTP id
 ml24-20020a17090b361800b001b8877a4b6eso6678824pjb.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iFrq/06m+LFrgFUjRTYZpJ80E1TS7u9YHnTYCB5785E=;
 b=Jqc5jmVQvvT4Xuf4DmFbshPWiVBRb9Cyz2TxEu1tp9tdyj5SsMrxIgBw8Q2gEqX/fZ
 /oubuJtvikJv4Y8i2MjtrlmB9uhdcC2h88ndJZvMuMy3sWbQ7VFJulqN4hF+li/yKhZX
 YfFLsXoZ/dg5T4MzWgy1HuXyKIG2SjJ+jGAbNtu84e2eKVqNnpaobx4WP//JDEO4zFkS
 KKws43GulQB2tpSxY1z798Roel9/bO1GSi6BKvDVqMVsO9tPF23lbCuLPPsJs0CzF5Rd
 ImCElYw2H4gJQVwoNcvNgrvtKd97My4zFAeADPpYneJcV24U1lvKGwdhYeF3ArCd+Cx+
 nfUg==
X-Gm-Message-State: AOAM533hcHIoX3uR9TllhXB/PKHUX9OmeOZF0dq62RnM0tOx+DWKeg1b
 5WvGa/2sCocFKmIaAf18vC77pelOd1wlJtGRI6uDyGEOkExKQq+s60DeZdDJAFiQ0PX63UE2ODM
 9BBtnH7PqxCV1i+U=
X-Received: by 2002:a17:902:c192:: with SMTP id
 d18mr3269395pld.149.1644308259475; 
 Tue, 08 Feb 2022 00:17:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1cjAQFWAsDqhmuU141kyxqsZhezK54B30iH8xad9efcoqs5kNNlx/o+lU7LIwjzJcxXNw/A==
X-Received: by 2002:a17:902:c192:: with SMTP id
 d18mr3269363pld.149.1644308259093; 
 Tue, 08 Feb 2022 00:17:39 -0800 (PST)
Received: from [10.72.13.12] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id pf4sm1971751pjb.35.2022.02.08.00.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 00:17:38 -0800 (PST)
Message-ID: <69253728-c1ea-eea6-dacc-5ba52ace4d6e@redhat.com>
Date: Tue, 8 Feb 2022 16:17:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 22/31] vhost: Add VhostIOVATree
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-23-eperezma@redhat.com>
 <2eb07526-0143-d612-8969-097ccdf00fae@redhat.com>
 <CAJaqyWePW6hJKAm7nk+syqmXAgdTQSTtuv9jACu_+hgbg2bRHg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWePW6hJKAm7nk+syqmXAgdTQSTtuv9jACu_+hgbg2bRHg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/2 上午1:27, Eugenio Perez Martin 写道:
> On Sun, Jan 30, 2022 at 6:21 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>> This tree is able to look for a translated address from an IOVA address.
>>>
>>> At first glance it is similar to util/iova-tree. However, SVQ working on
>>> devices with limited IOVA space need more capabilities,
>>
>> So did the IOVA tree (e.g l2 vtd can only work in the range of GAW and
>> without RMRRs).
>>
>>
>>>    like allocating
>>> IOVA chunks or performing reverse translations (qemu addresses to iova).
>>
>> This looks like a general request as well. So I wonder if we can simply
>> extend iova tree instead.
>>
> While both are true, I don't see code that performs allocations or
> qemu vaddr to iova translations. But if the changes can be integrated
> into iova-tree that would be great for sure.
>
> The main drawback I see is the need to maintain two trees instead of
> one for users of iova-tree. While complexity does not grow, it needs
> to double the amount of work needed.


If you care about the performance, we can disable the reverse mapping 
during the allocation. For vIOMMU users it won't notice any performance 
penalty.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>
>>> The allocation capability, as "assign a free IOVA address to this chunk
>>> of memory in qemu's address space" allows shadow virtqueue to create a
>>> new address space that is not restricted by guest's addressable one, so
>>> we can allocate shadow vqs vrings outside of it.
>>>
>>> It duplicates the tree so it can search efficiently both directions,
>>> and it will signal overlap if iova or the translated address is
>>> present in any tree.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-iova-tree.h |  27 +++++++
>>>    hw/virtio/vhost-iova-tree.c | 157 ++++++++++++++++++++++++++++++++++++
>>>    hw/virtio/meson.build       |   2 +-
>>>    3 files changed, 185 insertions(+), 1 deletion(-)
>>>    create mode 100644 hw/virtio/vhost-iova-tree.h
>>>    create mode 100644 hw/virtio/vhost-iova-tree.c
>>>
>>> diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
>>> new file mode 100644
>>> index 0000000000..610394eaf1
>>> --- /dev/null
>>> +++ b/hw/virtio/vhost-iova-tree.h
>>> @@ -0,0 +1,27 @@
>>> +/*
>>> + * vhost software live migration ring
>>> + *
>>> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
>>> + * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#ifndef HW_VIRTIO_VHOST_IOVA_TREE_H
>>> +#define HW_VIRTIO_VHOST_IOVA_TREE_H
>>> +
>>> +#include "qemu/iova-tree.h"
>>> +#include "exec/memory.h"
>>> +
>>> +typedef struct VhostIOVATree VhostIOVATree;
>>> +
>>> +VhostIOVATree *vhost_iova_tree_new(uint64_t iova_first, uint64_t iova_last);
>>> +void vhost_iova_tree_delete(VhostIOVATree *iova_tree);
>>> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_delete);
>>> +
>>> +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_tree,
>>> +                                        const DMAMap *map);
>>> +int vhost_iova_tree_map_alloc(VhostIOVATree *iova_tree, DMAMap *map);
>>> +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *map);
>>> +
>>> +#endif
>>> diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
>>> new file mode 100644
>>> index 0000000000..0021dbaf54
>>> --- /dev/null
>>> +++ b/hw/virtio/vhost-iova-tree.c
>>> @@ -0,0 +1,157 @@
>>> +/*
>>> + * vhost software live migration ring
>>> + *
>>> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
>>> + * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/iova-tree.h"
>>> +#include "vhost-iova-tree.h"
>>> +
>>> +#define iova_min_addr qemu_real_host_page_size
>>> +
>>> +/**
>>> + * VhostIOVATree, able to:
>>> + * - Translate iova address
>>> + * - Reverse translate iova address (from translated to iova)
>>> + * - Allocate IOVA regions for translated range (potentially slow operation)
>>> + *
>>> + * Note that it cannot remove nodes.
>>> + */
>>> +struct VhostIOVATree {
>>> +    /* First addresable iova address in the device */
>>> +    uint64_t iova_first;
>>> +
>>> +    /* Last addressable iova address in the device */
>>> +    uint64_t iova_last;
>>> +
>>> +    /* IOVA address to qemu memory maps. */
>>> +    IOVATree *iova_taddr_map;
>>> +
>>> +    /* QEMU virtual memory address to iova maps */
>>> +    GTree *taddr_iova_map;
>>> +};
>>> +
>>> +static gint vhost_iova_tree_cmp_taddr(gconstpointer a, gconstpointer b,
>>> +                                      gpointer data)
>>> +{
>>> +    const DMAMap *m1 = a, *m2 = b;
>>> +
>>> +    if (m1->translated_addr > m2->translated_addr + m2->size) {
>>> +        return 1;
>>> +    }
>>> +
>>> +    if (m1->translated_addr + m1->size < m2->translated_addr) {
>>> +        return -1;
>>> +    }
>>> +
>>> +    /* Overlapped */
>>> +    return 0;
>>> +}
>>> +
>>> +/**
>>> + * Create a new IOVA tree
>>> + *
>>> + * Returns the new IOVA tree
>>> + */
>>> +VhostIOVATree *vhost_iova_tree_new(hwaddr iova_first, hwaddr iova_last)
>>> +{
>>> +    VhostIOVATree *tree = g_new(VhostIOVATree, 1);
>>> +
>>> +    /* Some devices does not like 0 addresses */
>>> +    tree->iova_first = MAX(iova_first, iova_min_addr);
>>> +    tree->iova_last = iova_last;
>>> +
>>> +    tree->iova_taddr_map = iova_tree_new();
>>> +    tree->taddr_iova_map = g_tree_new_full(vhost_iova_tree_cmp_taddr, NULL,
>>> +                                           NULL, g_free);
>>> +    return tree;
>>> +}
>>> +
>>> +/**
>>> + * Delete an iova tree
>>> + */
>>> +void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
>>> +{
>>> +    iova_tree_destroy(iova_tree->iova_taddr_map);
>>> +    g_tree_unref(iova_tree->taddr_iova_map);
>>> +    g_free(iova_tree);
>>> +}
>>> +
>>> +/**
>>> + * Find the IOVA address stored from a memory address
>>> + *
>>> + * @tree     The iova tree
>>> + * @map      The map with the memory address
>>> + *
>>> + * Return the stored mapping, or NULL if not found.
>>> + */
>>> +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *tree,
>>> +                                        const DMAMap *map)
>>> +{
>>> +    return g_tree_lookup(tree->taddr_iova_map, map);
>>> +}
>>> +
>>> +/**
>>> + * Allocate a new mapping
>>> + *
>>> + * @tree  The iova tree
>>> + * @map   The iova map
>>> + *
>>> + * Returns:
>>> + * - IOVA_OK if the map fits in the container
>>> + * - IOVA_ERR_INVALID if the map does not make sense (like size overflow)
>>> + * - IOVA_ERR_OVERLAP if the tree already contains that map
>>> + * - IOVA_ERR_NOMEM if tree cannot allocate more space.
>>> + *
>>> + * It returns assignated iova in map->iova if return value is VHOST_DMA_MAP_OK.
>>> + */
>>> +int vhost_iova_tree_map_alloc(VhostIOVATree *tree, DMAMap *map)
>>> +{
>>> +    /* Some vhost devices does not like addr 0. Skip first page */
>>> +    hwaddr iova_first = tree->iova_first ?: qemu_real_host_page_size;
>>> +    DMAMap *new;
>>> +    int r;
>>> +
>>> +    if (map->translated_addr + map->size < map->translated_addr ||
>>> +        map->perm == IOMMU_NONE) {
>>> +        return IOVA_ERR_INVALID;
>>> +    }
>>> +
>>> +    /* Check for collisions in translated addresses */
>>> +    if (vhost_iova_tree_find_iova(tree, map)) {
>>> +        return IOVA_ERR_OVERLAP;
>>> +    }
>>> +
>>> +    /* Allocate a node in IOVA address */
>>> +    r = iova_tree_alloc(tree->iova_taddr_map, map, iova_first,
>>> +                        tree->iova_last);
>>> +    if (r != IOVA_OK) {
>>> +        return r;
>>> +    }
>>> +
>>> +    /* Allocate node in qemu -> iova translations */
>>> +    new = g_malloc(sizeof(*new));
>>> +    memcpy(new, map, sizeof(*new));
>>> +    g_tree_insert(tree->taddr_iova_map, new, new);
>>> +    return IOVA_OK;
>>> +}
>>> +
>>> +/**
>>> + * Remove existing mappings from iova tree
>>> + *
>>> + * @param  iova_tree  The vhost iova tree
>>> + * @param  map        The map to remove
>>> + */
>>> +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *map)
>>> +{
>>> +    const DMAMap *overlap;
>>> +
>>> +    iova_tree_remove(iova_tree->iova_taddr_map, map);
>>> +    while ((overlap = vhost_iova_tree_find_iova(iova_tree, map))) {
>>> +        g_tree_remove(iova_tree->taddr_iova_map, overlap);
>>> +    }
>>> +}
>>> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
>>> index 2dc87613bc..6047670804 100644
>>> --- a/hw/virtio/meson.build
>>> +++ b/hw/virtio/meson.build
>>> @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
>>>
>>>    virtio_ss = ss.source_set()
>>>    virtio_ss.add(files('virtio.c'))
>>> -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c'))
>>> +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
>>>    virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
>>>    virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
>>>    virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))


