Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F422A395849
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 11:41:30 +0200 (CEST)
Received: from localhost ([::1]:32886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lneQM-0002uP-3T
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 05:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lnePa-0002E7-1B
 for qemu-devel@nongnu.org; Mon, 31 May 2021 05:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lnePV-0008SF-6Z
 for qemu-devel@nongnu.org; Mon, 31 May 2021 05:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622454035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7BquP59YHUKu+CCYUDJ4io2OEAugqf3P50vq2dzvSI=;
 b=N8Znf1YslaFumyf1HCpI646M3Sujb3Q/zd/tNgr4FbtdaesbiZjJlJ/QHWd8EmvG6HvyIJ
 3n5Yk8Q3ITV463Ak4GAjeEwppbgk3ulVncvYnqWyYJoxgViyzGb9Yo6NMTYW5bHIdIjVzB
 Dx45CXikGsZacyu+oXd+a0JgNb4eEFI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-tnQ9xZPuPwadpZy6_U8BFA-1; Mon, 31 May 2021 05:40:31 -0400
X-MC-Unique: tnQ9xZPuPwadpZy6_U8BFA-1
Received: by mail-pl1-f197.google.com with SMTP id
 u1-20020a1709027141b02901040cac08fdso878507plm.12
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 02:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=x7BquP59YHUKu+CCYUDJ4io2OEAugqf3P50vq2dzvSI=;
 b=sv4ppSOYYqa1iPQv33bXmpsNuEIMyG2F2I/fQzCFidLtmtk3+pUAf9lnz1WEhGRlM8
 2CPkpPAgjzP3xQ/7xWGVBgpM8p0dEP9EYPvmbFCBSg/gyV4dTFEoeFQoSOLoqTc7W6XC
 mU92jfZeERU7KCgXXJ/ZhRdEgm13m5jZ9IlJ2Ji1KDVEtxI65Tcpp8xbz2xcXfQiWCwV
 izWqy48A/vglcQknanASije5/dY/lOXvtlyvjTOefS8gWcZwg8Vq9yNW5AnDVLLQ2Coj
 N8Rxro2BIhyR/vNh3iVahq0QTFhLcZiYMalh69LdDKZeOqrNqTDgpCkvF6g67y3xnyjL
 1HGQ==
X-Gm-Message-State: AOAM530sMzWued19oTeNF4LwEI3ouonG17icfDU0GC3zCin0TFmA4B/m
 inRumlzBXNUEGWgsx+Lzqgm9zIOrSI05IDey6tDbGp2kGZ3lmH+QXW5iZ+1B47yCFsvxHjLtJ4S
 ljwJ5DJdkLdQawzg=
X-Received: by 2002:a17:90a:7c4b:: with SMTP id
 e11mr18844575pjl.73.1622454030369; 
 Mon, 31 May 2021 02:40:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeXIsMphft+0u4fYcNQD+qePwAh2/0IDgEKs5FVurw65PJRx9ZnLFk2DVUpOWJOu3WeHtxhg==
X-Received: by 2002:a17:90a:7c4b:: with SMTP id
 e11mr18844546pjl.73.1622454030043; 
 Mon, 31 May 2021 02:40:30 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id t1sm5457413pfe.61.2021.05.31.02.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 02:40:29 -0700 (PDT)
Subject: Re: [RFC v3 21/29] vhost: Add VhostIOVATree
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-22-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <755e2d24-946b-775c-e4e9-e81a16e7b6dd@redhat.com>
Date: Mon, 31 May 2021 17:40:07 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519162903.1172366-22-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.618, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/20 上午12:28, Eugenio Pérez 写道:
> This tree is able to look for a translated address from a IOVA address.
>
> At first glance is similar to util/iova-tree. However, SVQ working on
> devices with limited IOVA space need more capabilities, like allocating
> IOVA chunks or perform reverse translations (qemu addresses to iova).
>
> Starting a sepparated implementation. Knowing than insertions/deletions
> will not be as frequent as searches,


This might not be true if vIOMMU is enabled.


> it uses an ordered array at
> implementation.


I wonder how much overhead could g_array be if it needs to grow.


>   A different name could be used, but ordered
> searchable array is a little bit long though.


Note that we had a very good example for this. That is the kernel iova 
allocator which is implemented via rbtree.

Instead of figuring out g_array vs g_tree stuffs, I would simple go with 
g_tree first (based on util/iova-tree) and borrow the well design kernel 
iova allocator API to have a generic IOVA one instead of coupling it 
with vhost. It could be used by other userspace driver in the future:

init_iova_domain()/put_iova_domain();

alloc_iova()/free_iova();

find_iova();

Another reference is the iova allocator that is implemented in VFIO.

Thanks


>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-iova-tree.h |  50 ++++++++++
>   hw/virtio/vhost-iova-tree.c | 188 ++++++++++++++++++++++++++++++++++++
>   hw/virtio/meson.build       |   2 +-
>   3 files changed, 239 insertions(+), 1 deletion(-)
>   create mode 100644 hw/virtio/vhost-iova-tree.h
>   create mode 100644 hw/virtio/vhost-iova-tree.c
>
> diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
> new file mode 100644
> index 0000000000..2a44af8b3a
> --- /dev/null
> +++ b/hw/virtio/vhost-iova-tree.h
> @@ -0,0 +1,50 @@
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
> +#include <gmodule.h>
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
> +    VHOST_DMA_MAP_OVERLAP = -2,
> +    VHOST_DMA_MAP_INVALID = -1,
> +    VHOST_DMA_MAP_OK = 0,
> +} VhostDMAMapNewRC;
> +
> +/**
> + * VhostIOVATree
> + *
> + * Store and search IOVA -> Translated mappings.
> + *
> + * Note that it cannot remove nodes.
> + */
> +typedef struct VhostIOVATree {
> +    /* Ordered array of reverse translations, IOVA address to qemu memory. */
> +    GArray *iova_taddr_map;
> +} VhostIOVATree;
> +
> +void vhost_iova_tree_new(VhostIOVATree *iova_rm);
> +void vhost_iova_tree_destroy(VhostIOVATree *iova_rm);
> +
> +const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *iova_rm,
> +                                              const VhostDMAMap *map);
> +VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *iova_rm,
> +                                        VhostDMAMap *map);
> +
> +#endif
> diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
> new file mode 100644
> index 0000000000..dfd7e448b5
> --- /dev/null
> +++ b/hw/virtio/vhost-iova-tree.c
> @@ -0,0 +1,188 @@
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
> +static gint vhost_iova_tree_cmp_iova(gconstpointer a, gconstpointer b)
> +{
> +    const VhostDMAMap *m1 = a, *m2 = b;
> +
> +    if (m1->iova > m2->iova + m2->size) {
> +        return 1;
> +    }
> +
> +    if (m1->iova + m1->size < m2->iova) {
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
> + * @tree  The IOVA tree
> + */
> +void vhost_iova_tree_new(VhostIOVATree *tree)
> +{
> +    assert(tree);
> +
> +    tree->iova_taddr_map = g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
> +                                       G_ARRAY_NOT_CLEAR_ON_ALLOC,
> +                                       sizeof(VhostDMAMap));
> +}
> +
> +/**
> + * Destroy an IOVA tree
> + *
> + * @tree  The iova tree
> + */
> +void vhost_iova_tree_destroy(VhostIOVATree *tree)
> +{
> +    g_array_unref(g_steal_pointer(&tree->iova_taddr_map));
> +}
> +
> +/**
> + * Perform a search on a GArray.
> + *
> + * @array Glib array
> + * @map Map to look up
> + * @compare_func Compare function to use
> + *
> + * Return The found element or NULL if not found.
> + *
> + * This can be replaced with g_array_binary_search (Since glib 2.62) when that
> + * is common enough.
> + */
> +static const VhostDMAMap *vhost_iova_tree_bsearch(const GArray *array,
> +                                                  const VhostDMAMap *map,
> +                                                  GCompareFunc compare_func)
> +{
> +    return bsearch(map, array->data, array->len, sizeof(*map), compare_func);
> +}
> +
> +/**
> + * Find the translated address stored from a IOVA address
> + *
> + * @tree  The iova tree
> + * @map   The map with the memory address
> + *
> + * Return the stored mapping, or NULL if not found.
> + */
> +const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *tree,
> +                                              const VhostDMAMap *map)
> +{
> +    return vhost_iova_tree_bsearch(tree->iova_taddr_map, map,
> +                                  vhost_iova_tree_cmp_iova);
> +}
> +
> +/**
> + * Insert a new map
> + *
> + * @tree  The iova tree
> + * @map   The iova map
> + *
> + * Returns:
> + * - VHOST_DMA_MAP_OK if the map fits in the container
> + * - VHOST_DMA_MAP_INVALID if the map does not make sense (like size overflow)
> + * - VHOST_DMA_MAP_OVERLAP if the tree already contains that map
> + * Can query the assignated iova in map.
> + */
> +VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *tree,
> +                                        VhostDMAMap *map)
> +{
> +    const VhostDMAMap *prev;
> +    int find_prev_rc;
> +
> +    if (map->translated_addr + map->size < map->translated_addr ||
> +        map->iova + map->size < map->iova || map->perm == IOMMU_NONE) {
> +        return VHOST_DMA_MAP_INVALID;
> +    }
> +
> +    /* Check for duplicates, and save position for insertion */
> +    find_prev_rc = vhost_iova_tree_find_prev(tree->iova_taddr_map,
> +                                             vhost_iova_tree_cmp_iova, map,
> +                                             &prev);
> +    if (find_prev_rc == VHOST_DMA_MAP_OVERLAP) {
> +        return VHOST_DMA_MAP_OVERLAP;
> +    }
> +
> +    vhost_iova_tree_insert_after(tree->iova_taddr_map, prev, map);
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


