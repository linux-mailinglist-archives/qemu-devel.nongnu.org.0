Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308F63C81AE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:34:50 +0200 (CEST)
Received: from localhost ([::1]:42628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bI1-0007Xi-8e
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3bGX-0005ic-GO
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:33:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3bGU-0001vT-VJ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626255194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YaVDom023aeRs8FQNz7nzedekufw1q2xB72LFyzzIZ8=;
 b=JBmImO30TOWRaa1yu5t1IA2s1ckiYaVGY9D0HUBNiqxI8qsUCcprTG2XliYzbTkSxLTwP/
 m2tJzEtI//dAKhNxB9SdPgvWoQMABjJaVO7VTXUmUiD35nVP0BaCxTGIfAQeUtugWfySVM
 eR70K1IlhjqbGmzOxb4WBo40/fPcV7c=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-BJJQhEQ2MSGWvHEX-nXI8w-1; Wed, 14 Jul 2021 05:33:13 -0400
X-MC-Unique: BJJQhEQ2MSGWvHEX-nXI8w-1
Received: by mail-pj1-f71.google.com with SMTP id
 c20-20020a17090ab294b029016fccb9582dso929635pjr.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YaVDom023aeRs8FQNz7nzedekufw1q2xB72LFyzzIZ8=;
 b=aR06pKCkZpIVqQglxNq58B7Dyo6JflojNc+qTelrU0MH63oSEVLpnV5ER0qDfzU8bz
 dAlVQzMlxF2jK5K397TzrsX0aHHwnWB3SqnwwToTP6chor6RJ4olc5xP7mUjAiIKqvj+
 McgSA8KdMdh3xJyvkH1ni3jdyTXbGefbguzna3bZih3lVSOqILZzSs3BwkG3EfVY2fer
 Uk1RfuJbTYTXch4Bf68ncD1FpefaRSxUgH1rM0myOo9JQV0me8X3qyKis6zmSOKXjhY9
 7XqDG5CJ6TpuIlwZHxlbvKRCSRKaHh7LN6DqGljRNwIGVCbLVRTGoEZXZuO+FO/lMMET
 7grA==
X-Gm-Message-State: AOAM530RU9j/Qtstb5UM7bL6DPxlR+tpyQ6IJMIZSBCR21nImrm29XQA
 eVUOY2PZ4hvzGKKHShf99URBntoncWq8qMKmwr5mDz7+m6WXGjG8tWayNBi6Z1jDdrg8f4QJDGG
 OEiWovgMUE0gVkZk=
X-Received: by 2002:a63:4302:: with SMTP id q2mr8581423pga.428.1626255192262; 
 Wed, 14 Jul 2021 02:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSwX04WbRlp6WvIq7ltH+/gvKZMPb+je3FAU+2ueqX8uzVEKqus52qn3e1LRSUMV+kE7r5rQ==
X-Received: by 2002:a63:4302:: with SMTP id q2mr8581385pga.428.1626255191863; 
 Wed, 14 Jul 2021 02:33:11 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a18sm2146824pfi.6.2021.07.14.02.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 02:33:11 -0700 (PDT)
Subject: Re: [RFC v3 21/29] vhost: Add VhostIOVATree
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-22-eperezma@redhat.com>
 <755e2d24-946b-775c-e4e9-e81a16e7b6dd@redhat.com>
 <CAJaqyWfKTiKeKLLjB9qDf4qJwL420YRo6FrJgozp_tn0Z57pOA@mail.gmail.com>
 <882296f9-adea-9b3b-5a2f-df0c746b4ad1@redhat.com>
 <CAJaqyWdZtvUM0_O1BiZNMkkgJEa_yrOh=XDgjTt2byZwU9J8tQ@mail.gmail.com>
 <CAJaqyWePZSo8-q=d3fWBGUwgM8EfHHVYgR_KGKxjcgeZn5C=Vw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <24cf2e4b-b729-7694-dd07-498bf5d96d9d@redhat.com>
Date: Wed, 14 Jul 2021 17:33:01 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWePZSo8-q=d3fWBGUwgM8EfHHVYgR_KGKxjcgeZn5C=Vw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 qemu-level <qemu-devel@nongnu.org>, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/14 下午5:14, Eugenio Perez Martin 写道:
> On Wed, Jul 14, 2021 at 8:54 AM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
>> On Wed, Jul 14, 2021 at 5:04 AM Jason Wang <jasowang@redhat.com> wrote:
>>>
>>> 在 2021/6/1 下午4:15, Eugenio Perez Martin 写道:
>>>> On Mon, May 31, 2021 at 11:40 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>> 在 2021/5/20 上午12:28, Eugenio Pérez 写道:
>>>>>> This tree is able to look for a translated address from a IOVA address.
>>>>>>
>>>>>> At first glance is similar to util/iova-tree. However, SVQ working on
>>>>>> devices with limited IOVA space need more capabilities, like allocating
>>>>>> IOVA chunks or perform reverse translations (qemu addresses to iova).
>>>>>>
>>>>>> Starting a sepparated implementation. Knowing than insertions/deletions
>>>>>> will not be as frequent as searches,
>>>>> This might not be true if vIOMMU is enabled.
>>>>>
>>>> Right.
>>>>
>>>>>> it uses an ordered array at
>>>>>> implementation.
>>>>> I wonder how much overhead could g_array be if it needs to grow.
>>>>>
>>>> I didn't do any tests, actually. But I see this VhostIOVATree as a
>>>> replaceable tool, just to get the buffer translations to work. So I'm
>>>> both ok with change it now and ok to delay it, since they should not
>>>> be hard to do.
>>>>
>>>>>>     A different name could be used, but ordered
>>>>>> searchable array is a little bit long though.
>>>>> Note that we had a very good example for this. That is the kernel iova
>>>>> allocator which is implemented via rbtree.
>>>>>
>>>>> Instead of figuring out g_array vs g_tree stuffs, I would simple go with
>>>>> g_tree first (based on util/iova-tree) and borrow the well design kernel
>>>>> iova allocator API to have a generic IOVA one instead of coupling it
>>>>> with vhost. It could be used by other userspace driver in the future:
>>>>>
>>>>> init_iova_domain()/put_iova_domain();
>>>>>
>>>>> alloc_iova()/free_iova();
>>>>>
>>>>> find_iova();
>>>>>
>>>> We could go that way, but then the iova-tree should be extended to
>>>> support both translations (iova->translated_addr is now implemented in
>>>> iova-tree, the reverse is not). If I understood you correctly,
>>>> borrowing the kernel iova allocator would give us both, right?
>>>
>>> No the reverse lookup is done via a specific IOMMU driver if I
>>> understand it correctly.
>>>
>>> And if the mapping is 1:1 we can just use two iova-tree I guess.
>>>
>> I did try with two IOVATree, but the usage of the reversed one is
>> confusing at best. To reuse most of the code, .iova needs to be
>> .translated_addr, and the opposite. Maybe I can try again using a
>> wrapper structure that reverses them on each operation (insert,
>> search, ...).
>>
>> Thanks!
>>
> Another feature is also needed that IOVATree does not support:
> Allocation, as the searching of a free hole in iova range [1]. Linux's
> alloc_iova is actually the equivalent of vhost_iova_tree_insert in
> this commit, that expects iova addresses to be specified, not
> "allocated".


Yes, that's why need a general iova allocator. (But use it for shadow 
virtqueue first for speeding up the merge).


>
> My first attempt to solve that was to add a second (third?) tree with
> the free space. But this again complicates the code a lot, and misses
> a few optimization opportunities (like the need of searching in many
> trees instead of just one, and then reuse the result [2]. Maybe
> iova_tree_foreach can be modified to achieve this, but then more code
> needs to be modified.


Ok, I think you can propose what you think better and let's see the code 
then.


>
> [1] Range themselves are not supported in IOVATree natively, but I
> think they are more or less straightforward to implement in
> vhost-vdpa.


You mean in the kernel? We only have the abstraction of entries which is 
kind of but more than just a simple range.

Thanks


>
>>>> Note that it is not coupled to vhost at all except in the name: all
>>>> the implementations only work with hwaddr and void pointers memory.
>>>> Just to illustrate the point, I think it could be a drop-in
>>>> replacement for iova-tree at this moment (with all the
>>>> drawbacks/advantages of an array vs tree).
>>>
>>> Ok.
>>>
>>> Thanks
>>>
>>>
>>>>> Another reference is the iova allocator that is implemented in VFIO.
>>>> I will check this too.
>>>>
>>>> Thanks!
>>>>
>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>> ---
>>>>>>     hw/virtio/vhost-iova-tree.h |  50 ++++++++++
>>>>>>     hw/virtio/vhost-iova-tree.c | 188 ++++++++++++++++++++++++++++++++++++
>>>>>>     hw/virtio/meson.build       |   2 +-
>>>>>>     3 files changed, 239 insertions(+), 1 deletion(-)
>>>>>>     create mode 100644 hw/virtio/vhost-iova-tree.h
>>>>>>     create mode 100644 hw/virtio/vhost-iova-tree.c
>>>>>>
>>>>>> diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
>>>>>> new file mode 100644
>>>>>> index 0000000000..2a44af8b3a
>>>>>> --- /dev/null
>>>>>> +++ b/hw/virtio/vhost-iova-tree.h
>>>>>> @@ -0,0 +1,50 @@
>>>>>> +/*
>>>>>> + * vhost software live migration ring
>>>>>> + *
>>>>>> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
>>>>>> + * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
>>>>>> + *
>>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef HW_VIRTIO_VHOST_IOVA_TREE_H
>>>>>> +#define HW_VIRTIO_VHOST_IOVA_TREE_H
>>>>>> +
>>>>>> +#include <gmodule.h>
>>>>>> +
>>>>>> +#include "exec/memory.h"
>>>>>> +
>>>>>> +typedef struct VhostDMAMap {
>>>>>> +    void *translated_addr;
>>>>>> +    hwaddr iova;
>>>>>> +    hwaddr size;                /* Inclusive */
>>>>>> +    IOMMUAccessFlags perm;
>>>>>> +} VhostDMAMap;
>>>>>> +
>>>>>> +typedef enum VhostDMAMapNewRC {
>>>>>> +    VHOST_DMA_MAP_OVERLAP = -2,
>>>>>> +    VHOST_DMA_MAP_INVALID = -1,
>>>>>> +    VHOST_DMA_MAP_OK = 0,
>>>>>> +} VhostDMAMapNewRC;
>>>>>> +
>>>>>> +/**
>>>>>> + * VhostIOVATree
>>>>>> + *
>>>>>> + * Store and search IOVA -> Translated mappings.
>>>>>> + *
>>>>>> + * Note that it cannot remove nodes.
>>>>>> + */
>>>>>> +typedef struct VhostIOVATree {
>>>>>> +    /* Ordered array of reverse translations, IOVA address to qemu memory. */
>>>>>> +    GArray *iova_taddr_map;
>>>>>> +} VhostIOVATree;
>>>>>> +
>>>>>> +void vhost_iova_tree_new(VhostIOVATree *iova_rm);
>>>>>> +void vhost_iova_tree_destroy(VhostIOVATree *iova_rm);
>>>>>> +
>>>>>> +const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *iova_rm,
>>>>>> +                                              const VhostDMAMap *map);
>>>>>> +VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *iova_rm,
>>>>>> +                                        VhostDMAMap *map);
>>>>>> +
>>>>>> +#endif
>>>>>> diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
>>>>>> new file mode 100644
>>>>>> index 0000000000..dfd7e448b5
>>>>>> --- /dev/null
>>>>>> +++ b/hw/virtio/vhost-iova-tree.c
>>>>>> @@ -0,0 +1,188 @@
>>>>>> +/*
>>>>>> + * vhost software live migration ring
>>>>>> + *
>>>>>> + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
>>>>>> + * SPDX-FileContributor: Author: Eugenio Pérez <eperezma@redhat.com>
>>>>>> + *
>>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>>> + */
>>>>>> +
>>>>>> +#include "qemu/osdep.h"
>>>>>> +#include "vhost-iova-tree.h"
>>>>>> +
>>>>>> +#define G_ARRAY_NOT_ZERO_TERMINATED false
>>>>>> +#define G_ARRAY_NOT_CLEAR_ON_ALLOC false
>>>>>> +
>>>>>> +/**
>>>>>> + * Inserts an element after an existing one in garray.
>>>>>> + *
>>>>>> + * @array      The array
>>>>>> + * @prev_elem  The previous element of array of NULL if prepending
> [2] If I remember correctly.
>
>>>>>> + * @map        The DMA map
>>>>>> + *
>>>>>> + * It provides the aditional advantage of being type safe over
>>>>>> + * g_array_insert_val, which accepts a reference pointer instead of a value
>>>>>> + * with no complains.
>>>>>> + */
>>>>>> +static void vhost_iova_tree_insert_after(GArray *array,
>>>>>> +                                         const VhostDMAMap *prev_elem,
>>>>>> +                                         const VhostDMAMap *map)
>>>>>> +{
>>>>>> +    size_t pos;
>>>>>> +
>>>>>> +    if (!prev_elem) {
>>>>>> +        pos = 0;
>>>>>> +    } else {
>>>>>> +        pos = prev_elem - &g_array_index(array, typeof(*prev_elem), 0) + 1;
>>>>>> +    }
>>>>>> +
>>>>>> +    g_array_insert_val(array, pos, *map);
>>>>>> +}
>>>>>> +
>>>>>> +static gint vhost_iova_tree_cmp_iova(gconstpointer a, gconstpointer b)
>>>>>> +{
>>>>>> +    const VhostDMAMap *m1 = a, *m2 = b;
>>>>>> +
>>>>>> +    if (m1->iova > m2->iova + m2->size) {
>>>>>> +        return 1;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (m1->iova + m1->size < m2->iova) {
>>>>>> +        return -1;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Overlapped */
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * Find the previous node to a given iova
>>>>>> + *
>>>>>> + * @array  The ascending ordered-by-translated-addr array of VhostDMAMap
>>>>>> + * @map    The map to insert
>>>>>> + * @prev   Returned location of the previous map
>>>>>> + *
>>>>>> + * Return VHOST_DMA_MAP_OK if everything went well, or VHOST_DMA_MAP_OVERLAP if
>>>>>> + * it already exists. It is ok to use this function to check if a given range
>>>>>> + * exists, but it will use a linear search.
>>>>>> + *
>>>>>> + * TODO: We can use bsearch to locate the entry if we save the state in the
>>>>>> + * needle, knowing that the needle is always the first argument to
>>>>>> + * compare_func.
>>>>>> + */
>>>>>> +static VhostDMAMapNewRC vhost_iova_tree_find_prev(const GArray *array,
>>>>>> +                                                  GCompareFunc compare_func,
>>>>>> +                                                  const VhostDMAMap *map,
>>>>>> +                                                  const VhostDMAMap **prev)
>>>>>> +{
>>>>>> +    size_t i;
>>>>>> +    int r;
>>>>>> +
>>>>>> +    *prev = NULL;
>>>>>> +    for (i = 0; i < array->len; ++i) {
>>>>>> +        r = compare_func(map, &g_array_index(array, typeof(*map), i));
>>>>>> +        if (r == 0) {
>>>>>> +            return VHOST_DMA_MAP_OVERLAP;
>>>>>> +        }
>>>>>> +        if (r < 0) {
>>>>>> +            return VHOST_DMA_MAP_OK;
>>>>>> +        }
>>>>>> +
>>>>>> +        *prev = &g_array_index(array, typeof(**prev), i);
>>>>>> +    }
>>>>>> +
>>>>>> +    return VHOST_DMA_MAP_OK;
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * Create a new IOVA tree
>>>>>> + *
>>>>>> + * @tree  The IOVA tree
>>>>>> + */
>>>>>> +void vhost_iova_tree_new(VhostIOVATree *tree)
>>>>>> +{
>>>>>> +    assert(tree);
>>>>>> +
>>>>>> +    tree->iova_taddr_map = g_array_new(G_ARRAY_NOT_ZERO_TERMINATED,
>>>>>> +                                       G_ARRAY_NOT_CLEAR_ON_ALLOC,
>>>>>> +                                       sizeof(VhostDMAMap));
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * Destroy an IOVA tree
>>>>>> + *
>>>>>> + * @tree  The iova tree
>>>>>> + */
>>>>>> +void vhost_iova_tree_destroy(VhostIOVATree *tree)
>>>>>> +{
>>>>>> +    g_array_unref(g_steal_pointer(&tree->iova_taddr_map));
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * Perform a search on a GArray.
>>>>>> + *
>>>>>> + * @array Glib array
>>>>>> + * @map Map to look up
>>>>>> + * @compare_func Compare function to use
>>>>>> + *
>>>>>> + * Return The found element or NULL if not found.
>>>>>> + *
>>>>>> + * This can be replaced with g_array_binary_search (Since glib 2.62) when that
>>>>>> + * is common enough.
>>>>>> + */
>>>>>> +static const VhostDMAMap *vhost_iova_tree_bsearch(const GArray *array,
>>>>>> +                                                  const VhostDMAMap *map,
>>>>>> +                                                  GCompareFunc compare_func)
>>>>>> +{
>>>>>> +    return bsearch(map, array->data, array->len, sizeof(*map), compare_func);
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * Find the translated address stored from a IOVA address
>>>>>> + *
>>>>>> + * @tree  The iova tree
>>>>>> + * @map   The map with the memory address
>>>>>> + *
>>>>>> + * Return the stored mapping, or NULL if not found.
>>>>>> + */
>>>>>> +const VhostDMAMap *vhost_iova_tree_find_taddr(const VhostIOVATree *tree,
>>>>>> +                                              const VhostDMAMap *map)
>>>>>> +{
>>>>>> +    return vhost_iova_tree_bsearch(tree->iova_taddr_map, map,
>>>>>> +                                  vhost_iova_tree_cmp_iova);
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * Insert a new map
>>>>>> + *
>>>>>> + * @tree  The iova tree
>>>>>> + * @map   The iova map
>>>>>> + *
>>>>>> + * Returns:
>>>>>> + * - VHOST_DMA_MAP_OK if the map fits in the container
>>>>>> + * - VHOST_DMA_MAP_INVALID if the map does not make sense (like size overflow)
>>>>>> + * - VHOST_DMA_MAP_OVERLAP if the tree already contains that map
>>>>>> + * Can query the assignated iova in map.
>>>>>> + */
>>>>>> +VhostDMAMapNewRC vhost_iova_tree_insert(VhostIOVATree *tree,
>>>>>> +                                        VhostDMAMap *map)
>>>>>> +{
>>>>>> +    const VhostDMAMap *prev;
>>>>>> +    int find_prev_rc;
>>>>>> +
>>>>>> +    if (map->translated_addr + map->size < map->translated_addr ||
>>>>>> +        map->iova + map->size < map->iova || map->perm == IOMMU_NONE) {
>>>>>> +        return VHOST_DMA_MAP_INVALID;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Check for duplicates, and save position for insertion */
>>>>>> +    find_prev_rc = vhost_iova_tree_find_prev(tree->iova_taddr_map,
>>>>>> +                                             vhost_iova_tree_cmp_iova, map,
>>>>>> +                                             &prev);
>>>>>> +    if (find_prev_rc == VHOST_DMA_MAP_OVERLAP) {
>>>>>> +        return VHOST_DMA_MAP_OVERLAP;
>>>>>> +    }
>>>>>> +
>>>>>> +    vhost_iova_tree_insert_after(tree->iova_taddr_map, prev, map);
>>>>>> +    return VHOST_DMA_MAP_OK;
>>>>>> +}
>>>>>> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
>>>>>> index 8b5a0225fe..cb306b83c6 100644
>>>>>> --- a/hw/virtio/meson.build
>>>>>> +++ b/hw/virtio/meson.build
>>>>>> @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
>>>>>>
>>>>>>     virtio_ss = ss.source_set()
>>>>>>     virtio_ss.add(files('virtio.c'))
>>>>>> -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c'))
>>>>>> +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
>>>>>>     virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
>>>>>>     virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
>>>>>>     virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))


