Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE0433122
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:34:13 +0200 (CEST)
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckZY-0002ef-JG
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mckXt-0001sG-LX
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mckXn-0001LC-FN
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634632342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVGko/nSsfhy2b/kZJNAj48VhqVbJIKHB+N1rs5CPi0=;
 b=ILbiw+ci91oC189Un3pebYh5nMHYc3Te8rnxfvwDwnZ/+deTQOXOPJDZAsZABwmh06ITj3
 jag3tKg8VFtlEwCtImPy8DTP3ZP3Bf7zLeJF8Gm51xFb2eD/UXpe7v7m+5ry9zh+McX6SW
 CGs1CNSdnvEdx3fxV4zvsX25Crq5yF0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-x-ZS-57sNhainmsNbMUClw-1; Tue, 19 Oct 2021 04:32:18 -0400
X-MC-Unique: x-ZS-57sNhainmsNbMUClw-1
Received: by mail-pf1-f199.google.com with SMTP id
 j3-20020a056a00234300b0044d605e3e0fso10471130pfj.21
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 01:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OVGko/nSsfhy2b/kZJNAj48VhqVbJIKHB+N1rs5CPi0=;
 b=l5dMvlo8FXMwUugcAZg+j0mn54wSN8e0Q2CsN0J0IRhnSnyFpMvAtlyxYPaORdCxXD
 VubGN03kVM7cZ8jGDNSnvm1AhO4glsTrlLCByoeyyMt5tCuPXfd15nHHprJ4FZ/wu1+2
 wMRNUdbzQb7aH+t/tzUMKDgg8qcbzP91SNrnuJ253eVOELWKR+dmexNd/pSiaMDJJ3nX
 HKVilidb14j0kjQUEi6fbneJTQ1wgR0pCAKlPaIs/BRT+kBafz9MCEjdAiwaCf57V4Gp
 HH78CzoOGCLUJA1eeqdTFeZmZ6hp2ZnDpEaM7SZOcC8TsQBAcZruYeB4wCzhdjXeLr6A
 Zn1g==
X-Gm-Message-State: AOAM532h+uxW4R5/fAhzXMzMX0Y0fbFyUSBqf0fCWZSfst4u6/EZPesJ
 ua0s6+m7wEpKZuVFjSHObfmwkrFlAv5MGrCiUsbqvOcRHrQR/FpwcNU/7oZL63T0Cm59oCi5dbR
 WBm5Nlwt+voJuqKs=
X-Received: by 2002:a62:7b90:0:b0:44d:fa6:325 with SMTP id
 w138-20020a627b90000000b0044d0fa60325mr33923040pfc.1.1634632337612; 
 Tue, 19 Oct 2021 01:32:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdpXE8v36sVtNTb5MNVIvzv7bQEpPDPWw9S6Pg0KoXHysnjKxuVFKzUoHY2NLCAJSDqU0iMQ==
X-Received: by 2002:a62:7b90:0:b0:44d:fa6:325 with SMTP id
 w138-20020a627b90000000b0044d0fa60325mr33923001pfc.1.1634632337166; 
 Tue, 19 Oct 2021 01:32:17 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q14sm4499003pfk.3.2021.10.19.01.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 01:32:16 -0700 (PDT)
Subject: Re: [RFC PATCH v4 18/20] vhost: Add VhostIOVATree
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-19-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
Date: Tue, 19 Oct 2021 16:32:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-19-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/1 下午3:06, Eugenio Pérez 写道:
> This tree is able to look for a translated address from an IOVA address.
>
> At first glance is similar to util/iova-tree. However, SVQ working on
> devices with limited IOVA space need more capabilities, like allocating
> IOVA chunks or perform reverse translations (qemu addresses to iova).


I don't see any reverse translation is used in the shadow code. Or 
anything I missed?


>
> The allocation capability, as "assign a free IOVA address to this chunk
> of memory in qemu's address space" allows shadow virtqueue to create a
> new address space that is not restricted by guest's addressable one, so
> we can allocate shadow vqs vrings outside of its reachability, nor
> qemu's one. At the moment, the allocation is just done growing, not
> allowing deletion.
>
> A different name could be used, but ordered searchable array is a
> little bit long though.
>
> It duplicates the array so it can search efficiently both directions,
> and it will signal overlap if iova or the translated address is
> present in it's each array.
>
> Use of array will be changed to util-iova-tree in future series.


Adding Peter.

It looks to me the only thing miseed is the iova allocator. And it looks 
to me it's better to decouple the allocator from the iova tree.

Then we had:

1) initialize iova range
2) iova = iova_alloc(size)
3) built the iova tree map
4) buffer forwarding
5) iova_free(size)


>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-iova-tree.h |  40 +++++++
>   hw/virtio/vhost-iova-tree.c | 230 ++++++++++++++++++++++++++++++++++++
>   hw/virtio/meson.build       |   2 +-
>   3 files changed, 271 insertions(+), 1 deletion(-)
>   create mode 100644 hw/virtio/vhost-iova-tree.h
>   create mode 100644 hw/virtio/vhost-iova-tree.c
>
> diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
> new file mode 100644
> index 0000000000..d163a88905
> --- /dev/null
> +++ b/hw/virtio/vhost-iova-tree.h
> @@ -0,0 +1,40 @@
> +/*
> + * vhost software live migration ring
> + *
> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> + * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_VIRTIO_VHOST_IOVA_TREE_H
> +#define HW_VIRTIO_VHOST_IOVA_TREE_H
> +
> +#include "exec/memory.h"
> +
> +typedef struct VhostDMAMap {
> +    void *translated_addr;
> +    hwaddr iova;
> +    hwaddr size;                /* Inclusive */
> +    IOMMUAccessFlags perm;
> +} VhostDMAMap;
> +
> +typedef enum VhostDMAMapNewRC {
> +    VHOST_DMA_MAP_NO_SPACE = -3,
> +    VHOST_DMA_MAP_OVERLAP = -2,
> +    VHOST_DMA_MAP_INVALID = -1,
> +    VHOST_DMA_MAP_OK = 0,
> +} VhostDMAMapNewRC;
> +
> +typedef struct VhostIOVATree VhostIOVATree;
> +
> +VhostIOVATree *vhost_iova_tree_new(void);
> +void vhost_iova_tree_unref(VhostIOVATree *iova_rm);
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_unref);
> +
> +const VhostDMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_rm,
> +                                             const VhostDMAMap *map);
> +VhostDMAMapNewRC vhost_iova_tree_alloc(VhostIOVATree *iova_rm,
> +                                       VhostDMAMap *map);
> +
> +#endif
> diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
> new file mode 100644
> index 0000000000..c284e27607
> --- /dev/null
> +++ b/hw/virtio/vhost-iova-tree.c
> @@ -0,0 +1,230 @@
> +/*
> + * vhost software live migration ring
> + *
> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> + * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "vhost-iova-tree.h"
> +
> +#define G_ARRAY_NOT_ZERO_TERMINATED false
> +#define G_ARRAY_NOT_CLEAR_ON_ALLOC false
> +
> +#define iova_min qemu_real_host_page_size
> +
> +/**
> + * VhostIOVATree, able to:
> + * - Translate iova address
> + * - Reverse translate iova address (from translated to iova)
> + * - Allocate IOVA regions for translated range (potentially slow operation)
> + *
> + * Note that it cannot remove nodes.
> + */
> +struct VhostIOVATree {
> +    /* Ordered array of reverse translations, IOVA address to qemu memory. */
> +    GArray *iova_taddr_map;
> +
> +    /*
> +     * Ordered array of translations from qemu virtual memory address to iova
> +     */
> +    GArray *taddr_iova_map;
> +};


Any reason for using GArray? Is it faster?


> +
> +/**
> + * Inserts an element after an existing one in garray.
> + *
> + * @array      The array
> + * @prev_elem  The previous element of array of NULL if prepending
> + * @map        The DMA map
> + *
> + * It provides the aditional advantage of being type safe over
> + * g_array_insert_val, which accepts a reference pointer instead of a value
> + * with no complains.
> + */
> +static void vhost_iova_tree_insert_after(GArray *array,
> +                                         const VhostDMAMap *prev_elem,
> +                                         const VhostDMAMap *map)
> +{
> +    size_t pos;
> +
> +    if (!prev_elem) {
> +        pos = 0;
> +    } else {
> +        pos = prev_elem - &g_array_index(array, typeof(*prev_elem), 0) + 1;
> +    }
> +
> +    g_array_insert_val(array, pos, *map);
> +}
> +
> +static gint vhost_iova_tree_cmp_taddr(gconstpointer a, gconstpointer b)
> +{
> +    const VhostDMAMap *m1 = a, *m2 = b;
> +
> +    if (m1->translated_addr > m2->translated_addr + m2->size) {
> +        return 1;
> +    }
> +
> +    if (m1->translated_addr + m1->size < m2->translated_addr) {
> +        return -1;
> +    }
> +
> +    /* Overlapped */
> +    return 0;
> +}
> +
> +/**
> + * Find the previous node to a given iova
> + *
> + * @array  The ascending ordered-by-translated-addr array of VhostDMAMap
> + * @map    The map to insert
> + * @prev   Returned location of the previous map
> + *
> + * Return VHOST_DMA_MAP_OK if everything went well, or VHOST_DMA_MAP_OVERLAP if
> + * it already exists. It is ok to use this function to check if a given range
> + * exists, but it will use a linear search.
> + *
> + * TODO: We can use bsearch to locate the entry if we save the state in the
> + * needle, knowing that the needle is always the first argument to
> + * compare_func.
> + */
> +static VhostDMAMapNewRC vhost_iova_tree_find_prev(const GArray *array,
> +                                                  GCompareFunc compare_func,
> +                                                  const VhostDMAMap *map,
> +                                                  const VhostDMAMap **prev)
> +{
> +    size_t i;
> +    int r;
> +
> +    *prev = NULL;
> +    for (i = 0; i < array->len; ++i) {
> +        r = compare_func(map, &g_array_index(array, typeof(*map), i));
> +        if (r == 0) {
> +            return VHOST_DMA_MAP_OVERLAP;
> +        }
> +        if (r < 0) {
> +            return VHOST_DMA_MAP_OK;
> +        }
> +
> +        *prev = &g_array_index(array, typeof(**prev), i);
> +    }
> +
> +    return VHOST_DMA_MAP_OK;
> +}
> +
> +/**
> + * Create a new IOVA tree
> + *
> + * Returns the new IOVA tree
> + */
> +VhostIOVATree *vhost_iova_tree_new(void)
> +{


So I think it needs to be initialized with the range we get from 
get_iova_range().

Thanks


> +    VhostIOVATree *tree = g_new(VhostIOVATree, 1);
> +    tree->iova_taddr_map = g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
> +                                       G_ARRAY_NOT_CLEAR_ON_ALLOC,
> +                                       sizeof(VhostDMAMap));
> +    tree->taddr_iova_map = g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
> +                                       G_ARRAY_NOT_CLEAR_ON_ALLOC,
> +                                       sizeof(VhostDMAMap));
> +    return tree;
> +}
> +
> +/**
> + * Destroy an IOVA tree
> + *
> + * @tree  The iova tree
> + */
> +void vhost_iova_tree_unref(VhostIOVATree *tree)
> +{
> +    g_array_unref(g_steal_pointer(&tree->iova_taddr_map));
> +    g_array_unref(g_steal_pointer(&tree->taddr_iova_map));
> +}
> +
> +/**
> + * Find the IOVA address stored from a memory address
> + *
> + * @tree     The iova tree
> + * @map      The map with the memory address
> + *
> + * Return the stored mapping, or NULL if not found.
> + */
> +const VhostDMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *tree,
> +                                             const VhostDMAMap *map)
> +{
> +    /*
> +     * This can be replaced with g_array_binary_search (Since glib 2.62) when
> +     * that version become common enough.
> +     */
> +    return bsearch(map, tree->taddr_iova_map->data, tree->taddr_iova_map->len,
> +                   sizeof(*map), vhost_iova_tree_cmp_taddr);
> +}
> +
> +static bool vhost_iova_tree_find_iova_hole(const GArray *iova_map,
> +                                           const VhostDMAMap *map,
> +                                           const VhostDMAMap **prev_elem)
> +{
> +    size_t i;
> +    hwaddr iova = iova_min;
> +
> +    *prev_elem = NULL;
> +    for (i = 0; i < iova_map->len; i++) {
> +        const VhostDMAMap *next = &g_array_index(iova_map, typeof(*next), i);
> +        hwaddr hole_end = next->iova;
> +        if (map->size < hole_end - iova) {
> +            return true;
> +        }
> +
> +        iova = next->iova + next->size + 1;
> +        *prev_elem = next;
> +    }
> +
> +    return ((hwaddr)-1 - iova) > iova_map->len;
> +}
> +
> +/**
> + * Allocate a new mapping
> + *
> + * @tree  The iova tree
> + * @map   The iova map
> + *
> + * Returns:
> + * - VHOST_DMA_MAP_OK if the map fits in the container
> + * - VHOST_DMA_MAP_INVALID if the map does not make sense (like size overflow)
> + * - VHOST_DMA_MAP_OVERLAP if the tree already contains that map
> + * - VHOST_DMA_MAP_NO_SPACE if iova_rm cannot allocate more space.
> + *
> + * It returns assignated iova in map->iova if return value is VHOST_DMA_MAP_OK.
> + */
> +VhostDMAMapNewRC vhost_iova_tree_alloc(VhostIOVATree *tree,
> +                                       VhostDMAMap *map)
> +{
> +    const VhostDMAMap *qemu_prev, *iova_prev;
> +    int find_prev_rc;
> +    bool fit;
> +
> +    if (map->translated_addr + map->size < map->translated_addr ||
> +        map->iova + map->size < map->iova || map->perm == IOMMU_NONE) {
> +        return VHOST_DMA_MAP_INVALID;
> +    }
> +
> +    /* Search for a hole in iova space big enough */
> +    fit = vhost_iova_tree_find_iova_hole(tree->iova_taddr_map, map,
> +                                         &iova_prev);
> +    if (!fit) {
> +        return VHOST_DMA_MAP_NO_SPACE;
> +    }
> +
> +    map->iova = iova_prev ? (iova_prev->iova + iova_prev->size) + 1 : iova_min;
> +    find_prev_rc = vhost_iova_tree_find_prev(tree->taddr_iova_map,
> +                                             vhost_iova_tree_cmp_taddr, map,
> +                                             &qemu_prev);
> +    if (find_prev_rc == VHOST_DMA_MAP_OVERLAP) {
> +        return VHOST_DMA_MAP_OVERLAP;
> +    }
> +
> +    vhost_iova_tree_insert_after(tree->iova_taddr_map, iova_prev, map);
> +    vhost_iova_tree_insert_after(tree->taddr_iova_map, qemu_prev, map);
> +    return VHOST_DMA_MAP_OK;
> +}
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 8b5a0225fe..cb306b83c6 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
>   
>   virtio_ss = ss.source_set()
>   virtio_ss.add(files('virtio.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c'))
> +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
>   virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
>   virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))


